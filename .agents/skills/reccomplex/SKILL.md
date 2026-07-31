---
name: reccomplex
description: Read/edit Recurrent Complex `.rcst` structures in structures/ via @mctools/utils/reccomplex. Load when fixing dead block/tile-entity ids in structures, or editing what RC generates in the world.
---

## Library

From a pack script (run with `pnpm tsx`, put throwaway scripts in a `~`-prefixed dir — gitignored):
`import { readRcst, writeRcst, ... } from '../mc-tools/packages/utils/src/mods/reccomplex.ts'`
(inside mc-tools it is the `@mctools/utils/reccomplex` subpath)

Blocks live in a **palette** (`palette: string[]`) + one index and one meta per position:
`getBlock` / `setBlock` / `positionsOf` / `replaceBlock` / `index(s,x,y,z)`.
Tile entities are raw prismarine-nbt compounds in `s.tileEntities` (`tilePos` for coords);
anything else is under `s.root`. `LEGACY_TILE_ENTITY_IDS` / `modernEntityId` cover pre-1.11 renames.

```ts
const s = readRcst(f)
replaceBlock(s, 'dead:block', 'live:block', 1)              // 1 = new metadata
s.tileEntities = s.tileEntities.filter(te => te.id.value !== 'dead:block')
writeRcst(f, s)
```

## Rules

- **Always round-trip first** (`parseRcst(serializeRcst(parseRcst(buf)))`) on the whole set before editing — proves the writer handles that file's variant.
- A block id and its tile entity are separate: replacing one without the other leaves a `Skipping BlockEntity` warning or a ghost TE.
- New block ⇒ check its meta semantics (decompile the block class; meta is usually a facing/variant), don't reuse the old value blindly.
- **Overriding mod structures**: same file name in `structures/active/` shadows the version inside a mod jar (RC levels `INTERNAL < MODDED < CUSTOM < SERVER`). Copies freeze at the current mod version — only override structures that are actually broken.
- Verify with `pnpm dev:errors`; RC loads structures at startup, so its warnings appear before the world loads.
