/*

🚒 Inworld Smelting

Crafting trick:
We can smelt unobtainable blocks directly in world

*/

#priority 1000
#reloadable

import crafttweaker.item.IItemStack;

static unobtainableAsItem as [IItemStack] = [] as [IItemStack];

function add(output as IItemStack, input as IItemStack) as void {
  unobtainableAsItem.add(input);
  furnace.addRecipe(output, input, 1.0);
}
