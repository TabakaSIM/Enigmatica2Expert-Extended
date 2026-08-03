/*

Every Carpenter and Thermionic Fabricator recipe is copied into the
Precision Assembler automatically by `alt_copy.zs` - just add the recipe with
`mods.forestry.Carpenter.addRecipe` / `mods.forestry.ThermionicFabricator.addCast`
and the copy appears on its own.

This file holds the only two knobs over that copy. Both are keyed by the recipe
output, so they can be called from anywhere, next to the recipe they describe.

*/

#modloaded forestry advancedrocketry
#priority 100

import crafttweaker.item.IItemStack;

// output => how many crafting operations one Precision Assembler copy may batch
static maxMult as int[string] = {} as int[string];

// output => copy is not created at all
static excluded as bool[string] = {} as bool[string];

function key(output as IItemStack) as string {
  return output.withAmount(1).commandString;
}

// Cap the batch size of the Precision Assembler copy (default 64).
// Use it for recipes that would be absurd to craft 64 at a time.
function setMaxMult(output as IItemStack, value as int) as void {
  maxMult[key(output)] = value;
}

// Keep this recipe out of the Precision Assembler entirely
function exclude(output as IItemStack) as void {
  excluded[key(output)] = true;
}
