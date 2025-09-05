/**
 * @file Make necessary preparations to turn dev version of pack
 * into distributable one.
 * Actually its:
 *  1. Clear temporary folders and files from previous script lunch
 *  2. Creating and replacing .zip files of latest tag
 *  3. Replacing files in dedicated server folder
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

/* eslint-disable antfu/no-top-level-await */
/* eslint-disable regexp/no-misleading-capturing-group */
/* eslint-disable regexp/no-super-linear-backtracking */

import { consola } from 'consola'
import ignore from 'ignore'
import { resolve } from 'pathe'
import { replaceInFile } from 'replace-in-file'
import { $, fs } from 'zx'

import { confirm, getIgnoredFiles, removeFiles } from './build/build_utils.js'
import { manageSFTP } from './build/sftp.js'
import { generateChangelog } from './tools/changelog/changelog'

const { existsSync, readFileSync } = fs
const $$ = $({ stdio: 'inherit' })

const tmpDir = 'D:/mc_tmp/'
if (await confirm('🪓 Perform automation?'))
  await $$`bun dev`

const devonlyIgnore = ignore().add(readFileSync('dev/.devonly.ignore', 'utf8'))

/*
 ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗██╗      ██████╗  ██████╗
██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ██╔═══██╗██╔════╝
██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗  ██║     ██║   ██║██║  ███╗
██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     ██║   ██║██║   ██║
╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗╚██████╔╝╚██████╔╝
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝  ╚═════╝
*/

const oldVersion = await $`git describe --tags --abbrev=0`.text()

const inputVersion = (
  await consola.prompt('Enter next version', {
    initial: oldVersion,
    cancel : 'undefined',
  })
)?.trim()
const nextVersion = inputVersion || oldVersion || 'v???'
const zipBaseName = `E2E-Extended-${nextVersion}`
const serverSetupConfig = 'server/server-setup-config.yaml'

consola.info(`🧼 Clear your working tree and rebase`)

if (await confirm(`Generate Changelog?`)) {
  const changelogPath = 'CHANGELOG-latest.md'

  // Update version in files
  await Promise.all([
    fs.writeFile('dev/version.txt', nextVersion),
    replaceInFile({
      files: 'config/CustomMainMenu/mainmenu.json',
      from : /("version_num"\s*:\s*\{\s*"text"\s*:\s*")[^"]+"/,
      to   : `$1${nextVersion}"`,
    }),
    replaceInFile({
      files: 'manifest.json',
      from : /(^ {2}"version"\s*:\s*")[^"]+("\s*,)/m,
      to   : `$1${nextVersion}$2`,
    }),
    replaceInFile({
      files: 'config/endermodpacktweaks/modpack.cfg',
      from : /^(\s*S\s*:\s*"\[\d+\] Modpack Version"\s*=\s*).*$/m,
      to   : `$1${nextVersion}`,
    }),
    replaceInFile({
      files: serverSetupConfig,
      from : /^( {2}modpackUrl\s*:\s*)(.+)$/m,
      to   : `$1https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/download/${nextVersion}/${zipBaseName}.zip`,
    }),
    cleanupModlist(),
    generateChangelog(changelogPath),
  ])

  consola.info(`✍ Manually fix changelog`)

  await Promise.all([
    $$`bun E:/dev/mc-icons/src/cli.ts ${changelogPath} --silent --no-short --modpack=e2ee --treshold=2`
      .then(async () => $$`git add -f config/CustomMainMenu/mainmenu.json dev/version.txt manifest.json config/endermodpacktweaks/modpack.cfg config/crash_assistant/modlist.json ${serverSetupConfig} ${changelogPath}`),
    $$`code --wait ${changelogPath}`
      .then(async () => $$`git add ${changelogPath}`),
  ])

  await $$`git commit -m "chore: 🧱 CHANGELOG update, version bump"`
}

if (await confirm(`Add tag?`))
  await $$`git tag -a -f -m "Next automated release" ${nextVersion}`

/*
██████╗ ██████╗ ███████╗██████╗ ███████╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔═══╝ ██╔══██╗██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║     ██║  ██║███████╗██║     ███████╗██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/

const zipPath_base = resolve('dist', zipBaseName)
const zipPath = `${zipPath_base}.zip`
const zipPath_server = `${zipPath_base}-server.zip`

const isZipsExist = [zipPath, zipPath_server].some(f => existsSync(f))

let rewriteOldZipFiles = false
if (isZipsExist && await confirm(`Rewrite old .zip files?`)) {
  rewriteOldZipFiles = true
  consola.info(`🪓 Removing old zip files:\n${zipPath}\n${zipPath_server}`)
  await Promise.all([
    fs.rm(zipPath, { force: true }),
    fs.rm(zipPath_server, { force: true }),
  ])
}

/*
  ██████╗ ███████╗██╗     ███████╗ █████╗ ███████╗███████╗
  ██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗██╔════╝██╔════╝
  ██████╔╝█████╗  ██║     █████╗  ███████║███████╗█████╗
  ██╔══██╗██╔══╝  ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝
  ██║  ██║███████╗███████╗███████╗██║  ██║███████║███████╗
  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
  */
const makeZips = !isZipsExist || rewriteOldZipFiles
if (makeZips) {
  consola.start(`🪓 Clearing tmp folder ${tmpDir} ... `)
  try {
    await fs.rm(tmpDir, { recursive: true, force: true })
  }
  catch (err) {
    consola.error(`Cannot remove TMP folder ${tmpDir}`, err)
  }

  const tmpOverrides = resolve(tmpDir, 'overrides/')
  await fs.mkdir(tmpOverrides, { recursive: true })

  consola.start('👬 Cloning latest tag to tmpOverrides...')
  await $$({ cwd: tmpOverrides })`git clone --recurse-submodules -j8 --depth 1 ${`file://${resolve(process.cwd())}`} .`

  consola.start('⬅️ Cleanse and move manifest.json...')
  const devonlyList = getIgnoredFiles(devonlyIgnore, { cwd: tmpOverrides })
    .map(f => resolve(tmpOverrides, f))
  const tmpManifestPath = resolve(tmpOverrides, 'manifest.json')
  const [removedFiles] = await Promise.all([
    removeFiles(devonlyList),
    replaceInFile({
      files: tmpManifestPath,
      from : /"___name"\s*:\s*"((?:[^"\\]|\\.)*)"\s*,?/g,
      to   : '',
    })
      .then(async () => fs.rename(tmpManifestPath, resolve(tmpOverrides, '../manifest.json'))),
    $$({ cwd: tmpOverrides })`find mods/OpenTerrainGenerator/worlds -type f -name "*.bo3" -exec sed -i '/^$/d;/^#/d' {} +`,
  ])

  consola.success('🧹 Removed non-release files and folders:\n', removedFiles)

  consola.start('🏴 Create EN .zip')
  await $$({ cwd: tmpDir })`7z a -bso0 ${zipPath} .`

  consola.start('📥 Create server zip')
  await $$({ cwd: 'server' })`7z a -bso0 ${zipPath_server} .`
}

await manageSFTP(serverSetupConfig)

if (await confirm(`Push tag?`))
  await $$`git push --follow-tags`

const inputTitle = await consola.prompt(`Enter release title`, { type: 'text', cancel: 'undefined' })

if (inputTitle !== undefined) {
  consola.start('🌍 Releasing on Github ... ')
  const title = `${nextVersion} ${inputTitle.replace(/"/g, '\'')}`.trim()
  await $$`gh release create ${nextVersion} --title=${title} --repo=Krutoy242/Enigmatica2Expert-Extended --notes-file=CHANGELOG-latest.md ${zipPath} ${zipPath_server}`
    .then(() => consola.success('🌍 Releasing on Github ... '))
}

async function cleanupModlist() {
  const modlistPath = 'config/crash_assistant/modlist.json'
  const modlist: { [key: string]: unknown}  = JSON.parse(readFileSync(modlistPath, 'utf8'))

  // Filter out ignored fields
  const filteredModlist = Object.fromEntries(
    Object.entries(modlist).filter(([key]) => !devonlyIgnore.ignores(`mods/${key}`))
  )

  // Save the modified modlist.json back
  await fs.writeFile(modlistPath, JSON.stringify(filteredModlist, null, 2))
}
