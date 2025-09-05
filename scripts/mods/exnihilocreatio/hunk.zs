#modloaded exnihilocreatio jaopca appliedenergistics2

import crafttweaker.item.IItemStack;

// Clear "ore" entry from hunks
// And remove hunks from JEI
function removeHunkOre(item as IItemStack) as void {
  var needRemoveAndHide = false;
  for ore in item.ores {
    if (ore.name.startsWith('ore') || ore.name.startsWith('hunk')) {
      ore.remove(item);
      needRemoveAndHide = true;
    }
  }
  if (needRemoveAndHide) {
    Purge(item);
    mods.appliedenergistics2.Grinder.removeRecipe(item);
  }
}

for item in loadedMods['exnihilocreatio'].items {
  if (item.definition.id.matches('exnihilocreatio:item_ore\\w+'))
    removeHunkOre(item);
}
for item in loadedMods['contenttweaker'].items {
  if (item.definition.id.matches('contenttweaker:item_ore\\w+'))
    removeHunkOre(item);
}
for item in loadedMods['jaopca'].items {
  if (item.definition.id.matches('jaopca:item_hunk\\w+'))
    removeHunkOre(item);
}
