---
name: test-mc
description: Test things in the running Minecraft game — run in-game commands, restart the instance, build exact block states, read live tile data. Load when a change must be verified in-game, not only in code.
---

A real Minecraft instance runs this modpack; drive it from the CLI.

## Commands
```bash
pnpm mc-cmd 'say Hello!' 'time set day'   # no leading `/`; chain stops at first failure
```

## Restart
Mods/configs need a reboot (scripts only need `pnpm ct-reload`):
```bash
pnpm reducer restart --detach && pnpm reducer ready --wait
```
Full pack boots in minutes; `restart --only "Some Mod"` in ~40s. See `reducer` skill.

## Profile a slow load
```bash
pnpm mc-profile                                   # reboot + profile every load stage, print hot trees
pnpm mc-profile --url <saved path> --filter jei   # re-read that profile, zoom into matching frames
```
`mc-profile` reboots for you and samples the whole mod-loading chain (construction →
finalizing) in one boot — no stage to pick. Reports land in
`config/flare/profiler/*.sparkprofile` and are printed, no browser. Coremod time before
`FMLConstructionEvent` is not covered: Flare's earlier stages crash this pack. Stages that
come back empty print the `--stage` command to redo them alone — just run it. Slice mods
with the usual `--only`/`--except`, they go straight to `reducer restart`.

## Exact block state via `/setblock`
Skip hand-placing and GUI clicks — `setblock` takes the tile entity's NBT:
```bash
pnpm mc-cmd 'setblock ~ ~ ~1 industrialforegoing:petrified_fuel_generator 0 replace {pet_gen_input:{Items:[{id:"avaritia:singularity",Damage:12b,Count:1b,Slot:0b}]}}'
```
Fails if the same block is already there → set `minecraft:air` first. Tag names come
from `pnpm mod-source <modid>`. Chain follow-up commands in one call if the state is
short-lived.

## Read live values
Temp `#reloadable` script in `scripts/debug/` that `print(...)`s what you need →
`pnpm ct-reload` → read `crafttweaker.log` → delete it. Native access: `zs` skill.
