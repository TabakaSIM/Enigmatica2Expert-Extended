---
name: jei-export
description: JEI recipe export pipeline — JEIExporter mod (config/jeiexporter.cfg) → exports/recipes/*.json → mc-gatherer. Use when a recipe category exports empty, an ingredient amount is wrong (always 1), or a new custom JEI ingredient type must be supported.
---

Mod source: `pnpm mod-source jeiexporter` (fork of friendlyhj/JEIExporter).
Consumer: `E:/dev/mc-craft-tree/mc-gatherer`, warnings in its `logs/noRecipeCategories.log`.

## Amount suppliers (`config/jeiexporter.cfg`)

`ingredientAmountSupplier` entries are `<canonical class>;<int field>` or `<canonical class>;<method>()`.
Only applies to classes JEI registered as an `IIngredientType`; without an entry the amount exports as `1`.
Read via reflection: methods must return `int`, fields are read with `Field.getInt` — a `long` field throws (uncaught) and kills the export.
The gatherer must also know the type: `iTypePrefix` in `mc-jeiexporter/build/NameMap.js`.

`ingredientIconSizes` (`<class>;<w>;<h>`) is dead while `disableIconExporting=true`.

## Empty categories

Gatherer drops a recipe with no outputs. Energy drawn as text in the wrapper's `drawInfo` (XU2 generators, TE fuels, EnderIO GrindingBall) is not a JEI ingredient — **no config can recover it**. Fix by a Java `IRecipeConverter` in the fork (see `handler/mods/XUConverter.java`, registered in `proxy/CommonProxy`) or an adapter in `mc-gatherer/src/custom/adapters`.
