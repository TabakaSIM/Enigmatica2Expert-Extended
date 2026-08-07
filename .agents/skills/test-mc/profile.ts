/**
 * @file Profile the modpack load with Flare (a Spark fork) and print the call tree.
 *
 * Enables the whole chain of mod-loading stages in `config/flare/flare.cfg`, reboots the
 * instance, waits for the game, restores the config, takes each report URL from
 * `config/flare/activity/`, downloads the raw profiles and renders them in the terminal —
 * no browser needed.
 *
 * ## Usage
 * ```bash
 * pnpm mc-profile                                       # whole load, heaviest thread, >=2%
 * pnpm mc-profile --filter onRuntimeAvailable           # only subtrees matching a class/method
 * pnpm mc-profile --only "Had Enough Items" "REIM"      # unknown flags go to `reducer restart`
 * pnpm mc-profile --url config/flare/profiler/….sparkprofile   # re-read, no reboot
 * ```
 *
 * Flags: --filter <substr>  print only subtrees whose frame matches (searches all threads)
 *        --min <percent>    prune frames below this share of the thread (def 2, 0.5 with --filter)
 *        --depth <n>        max depth to print (def 8, 6 with --filter)
 *        --threads          print every thread, not just the heaviest one
 *        --full             keep pass-through frames (JVM/Forge plumbing), collapsed by default
 *        --url <url|path>   skip the reboot, render an existing report
 *        --stage <name>     escape hatch: profile one stage instead of the whole chain
 *
 * `GAME_LOAD`/`CORE_MOD` would cover the pre-construction part too, but they crash this
 * pack every time — Flare's sampler pool then calls into Forge (`WindowStatisticsCollector
 * .measure()` → `FMLCommonHandler.instance()`) at its first 10s window rotation, ~30s
 * before the game itself touches those classes, so `FMLCommonHandler`/`Loader`/`EventBus`
 * get defined on a background thread mid-bootstrap and the launch dies with
 * `NoSuchMethodError: FMLCommonHandler.enhanceCrashReport`. They are rejected here.
 *
 * Chaining the whole load in one boot also makes Flare drop some stages (a metadata-only
 * report, no threads at all) — the same stage rerun alone always has data, so the summary
 * prints the exact `--stage` command for whatever came back empty.
 *
 * Every other argument is forwarded verbatim to `pnpm reducer restart`, so the whole
 * mod-set surface (`--only`, `--except`, `--disable`, `--enable`, `--full`) still works.
 */

import { spawnSync } from 'node:child_process'
import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import process from 'node:process'
import { gunzipSync } from 'node:zlib'
import chalk from 'chalk'

/** Back-to-back stages covering mod loading end to end (each starts where the last stops). */
const LOAD_CHAIN = ['CONSTRUCTION', 'PRE_INIT', 'INIT', 'POST_INIT', 'AVAILABLE', 'FINALIZING']
const WORLD_STAGES = ['WORLD_LOAD', 'BEFORE_START_WORLD', 'STARTING_WORLD', 'STARTED_WORLD']
const STAGES = [...LOAD_CHAIN, ...WORLD_STAGES]
/** Stages that start before Forge is up — they crash the launch, see the file header. */
const UNSAFE = ['GAME_LOAD', 'CORE_MOD']

const CFG = 'config/flare/flare.cfg'
const ACTIVITY = 'config/flare/activity'
const PROFILER = 'config/flare/profiler'
const BYTEBIN = 'https://spark-usercontent.lucko.me/'

/* ------------------------------------------------------------------ protobuf */
// Minimal reader for the two messages we need, see flare/flare_sampler.proto:
//   SamplerData    { ... repeated ThreadNode threads = 2 }
//   ThreadNode     { string name = 1, repeated StackTraceNode children = 3,
//                    repeated double times = 4, repeated int32 children_refs = 5 }
//   StackTraceNode { string class_name = 3, string method_name = 4,
//                    repeated double times = 8, repeated int32 children_refs = 9 }
// The tree is flattened on the wire: `children` is a pool, `children_refs` index into it.

interface Chunk { no: number, wire: number, start: number, end: number, value: number }

function varint(b: Uint8Array, p: { i: number }): number {
  let value = 0
  let shift = 0
  for (;;) {
    const byte = b[p.i++]
    value += (byte & 0x7F) * 2 ** shift
    shift += 7
    if ((byte & 0x80) === 0) return value
  }
}

function* scan(b: Uint8Array, start = 0, end = b.length): Generator<Chunk> {
  const p = { i: start }
  while (p.i < end) {
    const tag = varint(b, p)
    const no = tag >>> 3
    const wire = tag & 7
    if (wire === 0) {
      const value = varint(b, p)
      yield { no, wire, start: p.i, end: p.i, value }
    }
    else if (wire === 2) {
      const len = varint(b, p)
      const s = p.i
      p.i += len
      yield { no, wire, start: s, end: p.i, value: 0 }
    }
    else if (wire === 1 || wire === 5) {
      const s = p.i
      p.i += wire === 1 ? 8 : 4
      yield { no, wire, start: s, end: p.i, value: 0 }
    }
    else { throw new Error(`Unsupported protobuf wire type ${wire}`) }
  }
}

function sumDoubles(b: Uint8Array, c: Chunk): number {
  const view = new DataView(b.buffer, b.byteOffset + c.start, c.end - c.start)
  let total = 0
  for (let o = 0; o + 8 <= view.byteLength; o += 8) total += view.getFloat64(o, true)
  return total
}

function varints(b: Uint8Array, c: Chunk): number[] {
  const p = { i: c.start }
  const out: number[] = []
  while (p.i < c.end) out.push(varint(b, p))
  return out
}

const text = (b: Uint8Array, c: Chunk) => Buffer.from(b.subarray(c.start, c.end)).toString('utf8')

interface Frame { label: string, time: number, refs: number[], children: Frame[] }

function parseFrame(b: Uint8Array, c: Chunk, thread: boolean): Frame {
  const frame: Frame = { label: '', time: 0, refs: [], children: [] }
  const pool: Frame[] = []
  let cls = ''
  let method = ''
  for (const f of scan(b, c.start, c.end)) {
    if (thread) {
      if (f.no === 1) frame.label = text(b, f)
      else if (f.no === 3) pool.push(parseFrame(b, f, false))
      else if (f.no === 4) frame.time = sumDoubles(b, f)
      else if (f.no === 5) frame.refs = f.wire === 0 ? [f.value] : varints(b, f)
    }
    else {
      if (f.no === 3) cls = text(b, f)
      else if (f.no === 4) method = text(b, f)
      else if (f.no === 8) frame.time = sumDoubles(b, f)
      else if (f.no === 9) frame.refs = f.wire === 0 ? [f.value] : varints(b, f)
    }
  }
  if (thread) {
    const link = (node: Frame) => {
      node.children = node.refs.map(i => pool[i]).filter(Boolean).sort((a, z) => z.time - a.time)
      node.children.forEach(link)
    }
    link(frame)
  }
  else { frame.label = `${cls}.${method}()` }
  return frame
}

function parseThreads(buf: Uint8Array): Frame[] {
  const threads: Frame[] = []
  for (const f of scan(buf)) if (f.no === 2) threads.push(parseFrame(buf, f, true))
  // Flare's own sampler pool is pure profiling overhead and always outweighs the game.
  return threads.filter(t => !t.label.startsWith('flare-')).sort((a, z) => z.time - a.time)
}

/* --------------------------------------------------------------------- fetch */
async function load(source: string): Promise<Uint8Array> {
  const unpack = (raw: Uint8Array) => raw[0] === 0x1F && raw[1] === 0x8B ? new Uint8Array(gunzipSync(raw)) : raw

  if (existsSync(source)) return unpack(new Uint8Array(readFileSync(source)))

  const key = source.trim().replace(/\/$/, '').split('/').pop()!
  let lastError: unknown
  for (let attempt = 1; attempt <= 3; attempt++) {
    try {
      const res = await fetch(BYTEBIN + key, { headers: { 'User-Agent': 'spark-plugin' } })
      if (!res.ok) throw new Error(`HTTP ${res.status} for ${BYTEBIN}${key}`)
      const raw = new Uint8Array(await res.arrayBuffer())
      // Reports on bytebin expire in a few days — keep a local copy for `--url <path>`.
      mkdirSync(PROFILER, { recursive: true })
      const file = `${PROFILER}/${new Date().toISOString().slice(0, 19).replace(/[:T]/g, '-')}_${key}.sparkprofile`
      writeFileSync(file, raw)
      process.stdout.write(`${chalk.cyan('Saved:')} ${file}\n`)
      return unpack(raw)
    }
    catch (e) {
      lastError = e
      await new Promise(r => setTimeout(r, 2000 * attempt))
    }
  }
  throw lastError
}

/* -------------------------------------------------------------------- render */
function pct(share: number): string {
  const s = `${share.toFixed(2)}%`.padStart(7)
  if (share >= 20) return chalk.red(s)
  if (share >= 5) return chalk.yellow(s)
  return chalk.gray(s)
}

const row = (frame: Frame, total: number, indent: string, bold = false, skipped = 0) =>
  `${pct((frame.time / total) * 100)} ${chalk.gray(`${frame.time.toFixed(0)}ms`.padStart(8))}  ${indent}${bold ? chalk.bold(frame.label) : frame.label}`
  + `${skipped ? chalk.gray(` ⋯${skipped} frames above`) : ''}\n`

/** Dispatch plumbing that never answers "what is slow" — skipped, but still walked through. */
const NOISE = /^(?:java\.lang\.invoke\.|jdk\.internal\.reflect\.|java\.lang\.reflect\.Method\.|com\.google\.common\.eventbus\.|com\.google\.common\.util\.concurrent\.DirectExecutor\.|net\.minecraftforge\.fml\.common\.FMLModContainer\.handleModStateEvent)/

/** Walk down a chain of pass-through frames (one child holding ~all of the time). */
function collapse(frame: Frame): { frame: Frame, skipped: number } {
  let skipped = 0
  let node = frame
  while (node.children.length === 1 && node.children[0].time >= node.time * 0.95) {
    node = node.children[0]
    skipped++
  }
  return { frame: node, skipped }
}

function printTree(node: Frame, total: number, min: number, depth: number, indent = '', flatten = true): void {
  for (const raw of node.children) {
    if ((raw.time / total) * 100 < min) continue
    const { frame, skipped } = flatten ? collapse(raw) : { frame: raw, skipped: 0 }
    if (flatten && NOISE.test(frame.label)) {
      printTree(frame, total, min, depth, indent, flatten)
      continue
    }
    process.stdout.write(row(frame, total, indent, false, skipped))
    if (depth > 1) printTree(frame, total, min, depth - 1, `${indent}  `, flatten)
  }
}

function findMatches(node: Frame, filter: string, path: string[], out: { frame: Frame, path: string[] }[]): void {
  for (const child of node.children) {
    // Do not descend into a match: nested hits would just repeat the same subtree.
    if (child.label.toLowerCase().includes(filter)) out.push({ frame: child, path })
    else findMatches(child, filter, [...path, child.label], out)
  }
}

/**
 * Chaining stages in one boot makes Flare upload a metadata-only report for some of
 * them (the finished sampler's upload races the next one's start). Re-running that
 * stage alone always yields data, so say so instead of showing an empty tree.
 */
function emptyHint(stage?: string): string {
  return stage
    ? `no samples — Flare lost this stage; rerun it alone: pnpm mc-profile --stage ${stage}`
    : 'no samples in this report'
}

/**
 * The thread that actually runs the pack. Idle JVM threads (Reference Handler,
 * watchdogs…) outweigh it by wall time, so it can't be picked by duration.
 */
function mainThread(threads: Frame[]): Frame | undefined {
  return threads.find(t => /^(?:Client thread|Server thread|main)$/i.test(t.label)) ?? threads[0]
}

function render(threads: Frame[], opts: { filter?: string, min: number, depth: number, threads: boolean, full: boolean, stage?: string }): void {
  const flat = !opts.full
  const main = mainThread(threads)
  if (!main) {
    process.stdout.write(chalk.gray(`  ${emptyHint(opts.stage)}\n`))
    return
  }
  for (const thread of opts.filter || opts.threads ? threads : [main]) {
    if (!thread.time) continue
    const header = `\n${chalk.bold(thread.label)} ${chalk.gray(`— ${thread.time.toFixed(0)}ms total`)}\n`

    if (!opts.filter) {
      process.stdout.write(header)
      printTree(thread, thread.time, opts.min, opts.depth, '', flat)
      continue
    }

    const hits: { frame: Frame, path: string[] }[] = []
    findMatches(thread, opts.filter, [], hits)
    const shown = hits.filter(h => (h.frame.time / thread.time) * 100 >= opts.min).sort((a, z) => z.frame.time - a.frame.time)
    if (!shown.length) continue

    process.stdout.write(header)
    for (const hit of shown) {
      const via = hit.path.slice(-3)
      if (via.length) process.stdout.write(chalk.gray(`${' '.repeat(17)}${hit.path.length > 3 ? '… → ' : ''}${via.join(' → ')}\n`))
      process.stdout.write(row(hit.frame, thread.time, '', true))
      printTree(hit.frame, thread.time, opts.min, opts.depth, '  ', flat)
    }
  }
}

/* ---------------------------------------------------------------- run stages */
function setStages(stages: string[]): void {
  const cfg = readFileSync(CFG, 'utf8')
  // Keep Forge's own bytes — line endings and the empty form — or every run dirties git.
  const eol = cfg.includes('\r\n') ? '\r\n' : '\n'
  const body = [...stages.map(s => `    ${s}`), '     '].join(eol)
  const next = cfg.replace(/S:stages <[^>]*>/, `S:stages <${eol}${body}>`)
  if (next === cfg && stages.length) throw new Error(`Cannot find an "S:stages" block in ${CFG}`)
  writeFileSync(CFG, next)
}

function run(cmd: string): void {
  process.stdout.write(chalk.gray(`$ ${cmd}\n`))
  const res = spawnSync(cmd, { stdio: 'inherit', shell: true })
  if (res.status !== 0) throw new Error(`\`${cmd}\` exited with ${res.status}`)
}

/** Report URL per stage, in the order the stages ran. Waits for the stragglers. */
async function findReports(stages: string[], since: number): Promise<{ stage: string, url: string }[]> {
  const deadline = Date.now() + 120_000
  const re = /Sampler finished for stage: (\w+)\. Report: (\S+)/g
  for (;;) {
    const found = new Map<string, string>()
    for (const file of readdirSync(ACTIVITY).sort()) {
      const path = join(ACTIVITY, file)
      if (statSync(path).mtimeMs < since) continue
      for (const hit of readFileSync(path, 'utf8').matchAll(re)) found.set(hit[1], hit[2])
    }
    const got = stages.filter(s => found.has(s))
    if (got.length === stages.length || (got.length && Date.now() > deadline)) {
      return got.map(stage => ({ stage, url: found.get(stage)! }))
    }
    if (Date.now() > deadline) throw new Error(`No report in ${ACTIVITY}/ for ${stages.join(', ')} — were the stages ever reached?`)
    await new Promise(r => setTimeout(r, 3000))
  }
}

/* ----------------------------------------------------------------------- cli */
interface Args { own: Record<string, string | true>, forward: string[] }

function parseArgs(argv: string[]): Args {
  const valued = ['filter', 'min', 'depth', 'url', 'stage']
  const args: Args = { own: {}, forward: [] }
  for (let i = 0; i < argv.length; i++) {
    const name = argv[i].startsWith('--') ? argv[i].slice(2) : null
    if (name === 'threads' || name === 'full') args.own[name] = true
    else if (name && valued.includes(name)) args.own[name] = argv[++i]
    else args.forward.push(argv[i])
  }
  return args
}

async function main() {
  const { own, forward } = parseArgs(process.argv.slice(2))
  const filter = typeof own.filter === 'string' ? own.filter.toLowerCase() : undefined
  const opts = {
    filter,
    min: Number(own.min ?? (filter ? 0.5 : 2)),
    depth: Number(own.depth ?? (filter ? 6 : 8)),
    threads: own.threads === true,
    full: own.full === true,
  }

  if (typeof own.url === 'string') {
    render(parseThreads(await load(own.url)), opts)
    return
  }

  let stages = LOAD_CHAIN
  if (typeof own.stage === 'string') {
    const stage = own.stage.toUpperCase()
    if (UNSAFE.includes(stage)) throw new Error(`Stage ${stage} crashes the launch (see the header of .agents/skills/test-mc/profile.ts).`)
    if (!STAGES.includes(stage)) throw new Error(`Unknown stage "${stage}". One of: ${STAGES.join(' ')}`)
    stages = [stage]
  }

  const since = Date.now()
  process.stdout.write(chalk.cyan(`Profiling ${stages.join(' → ')} — rebooting the instance…\n`))
  setStages(stages)
  try {
    run(['pnpm reducer restart --detach', ...forward.map(a => /\s/.test(a) ? `"${a}"` : a)].join(' '))
    run('pnpm reducer ready --wait')
  }
  finally { setStages([]) }

  const reports = await findReports(stages, since)
  const loaded = []
  for (const { stage, url } of reports) {
    process.stdout.write(`${chalk.cyan(`${stage}:`)} ${url}\n`)
    loaded.push({ stage, threads: parseThreads(await load(url)) })
  }

  // Where the load time went, before the trees — so the next question is obvious.
  if (loaded.length > 1) {
    process.stdout.write(`\n${chalk.bold('Load time per stage')}\n`)
    for (const { stage, threads } of loaded) {
      const time = mainThread(threads)?.time
      const note = time === undefined ? chalk.gray(`  ← ${emptyHint(stage)}`) : ''
      process.stdout.write(`${chalk.gray((time === undefined ? '—' : `${time.toFixed(0)}ms`).padStart(10))}  ${stage}${note}\n`)
    }
  }
  for (const { stage, threads } of loaded) {
    if (loaded.length > 1) process.stdout.write(`\n${chalk.bold.inverse(` ${stage} `)}\n`)
    render(threads, { ...opts, stage })
  }
}

main().catch((e: any) => {
  process.stderr.write(chalk.red(`✗ ${e?.message ?? e}\n`))
  process.exit(1)
})
