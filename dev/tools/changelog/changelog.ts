import { createWriteStream } from 'node:fs'
import { rename, rm } from 'node:fs/promises'
import process from 'node:process'
import { pipeline } from 'node:stream/promises'

// eslint-disable-next-line antfu/no-import-dist, antfu/no-import-node-modules-by-path
import { ConventionalChangelog } from '../../../node_modules/conventional-changelog/dist/ConventionalChangelog.js'
import config from './config.js'

export async function generateChangelog(outputPath: string) {
  const generator = new ConventionalChangelog()

  generator.commits(config.commits!, config.parser)
  generator.writer(config.writer!)

  // Write beside the target and rename only on success: the generator reaches out
  // to CurseForge halfway through, and a dropped request used to leave the real
  // changelog truncated to nothing.
  const tmpPath = `${outputPath}.tmp`
  try {
    await pipeline(
      generator.write(),
      createWriteStream(tmpPath, 'utf8')
    )
    await rename(tmpPath, outputPath)
  }
  catch (error) {
    await rm(tmpPath, { force: true })
    throw error
  }
}

// eslint-disable-next-line antfu/no-top-level-await
if (import.meta.url === (await import('node:url')).pathToFileURL(process.argv[1]).href) await generateChangelog('CHANGELOG-latest.md')
