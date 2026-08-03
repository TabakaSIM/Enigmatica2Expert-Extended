/*

Copies every Forestry Carpenter and Thermionic Fabricator recipe into
Advanced Rocketry's Precision Assembler.

Nothing has to be registered by hand: the recipe lists are read straight from
Forestry, so recipes added or removed by any script or mod are picked up.
Use `scripts.mods.forestry.alt` to tune or skip a single copy.

The `forestry_alt_copy` loader is declared in config/ZenUtils.cfg as
`forestry_alt_copy;modtweaker;A;after`: it runs once ModTweaker applied its
late recipe actions and still before JEI collects recipes - so the lists this
script reads are final, and JEI shows the copies.

*/

#modloaded forestry advancedrocketry advancedtweakery modtweaker
#loader forestry_alt_copy reloadable

import crafttweaker.item.IIngredient;

import native.crafttweaker.CraftTweakerAPI;
import native.forestry.api.recipes.ICarpenterRecipe;
import native.forestry.api.recipes.IFabricatorRecipe;
import native.forestry.api.recipes.RecipeManagers;
import native.net.minecraft.item.ItemStack;
import native.net.minecraftforge.fluids.FluidStack;
import native.youyihj.advancedtweakery.AdvancedTweakery;

// One crafting grid slot: an ore dictionary entry, or the union of its stacks
function ingrOf(stacks as [ItemStack], oreName as string) as IIngredient {
  if (oreName != '') return oreDict.get(oreName);

  var result as IIngredient = null;
  for stack in stacks {
    if (isNull(stack) || stack.empty) continue;
    val item = stack.wrapper as IIngredient;
    result = isNull(result) ? item : result | item;
  }
  return result;
}

function addCopy(
  output as ItemStack,
  ingrs as IIngredient[],
  fluid as FluidStack,
  box as ItemStack
) as void {
  if (isNull(output) || output.empty || ingrs.length == 0) return;

  val out = output.wrapper;
  val key = out.withAmount(1).commandString;
  if (!isNull(scripts.mods.forestry.alt.excluded[key])) return;

  var maxMult = 64;
  val override = scripts.mods.forestry.alt.maxMult[key];
  if (!isNull(override)) maxMult = override as int;

  scripts.processUtils.avdRockRecipeFlat(
    'PrecisionAssembler',
    out,
    ingrs,
    isNull(fluid) ? null : fluid.wrapper,
    isNull(box) || box.empty ? null : box.wrapper,
    maxMult
  );
}

val actions = AdvancedTweakery.ACTIONS;
val queuedBefore = actions.length;

// Carpenter: the box (carton, crate) is consumed, so it stays an ingredient
for _recipe in RecipeManagers.carpenterManager.recipes().toArray() {
  val recipe = _recipe as ICarpenterRecipe;
  val grid = recipe.craftingGridRecipe;
  val ores = grid.oreDicts;

  var ingrs = [] as IIngredient[];
  for i, slot in grid.rawIngredients {
    val ingr = ingrOf(slot, ores[i]);
    if (!isNull(ingr)) ingrs += ingr;
  }

  addCopy(grid.output, ingrs, recipe.fluidResource, recipe.box);
}

// Fabricator: the plan (wax cast) is a reusable template, not an ingredient
for _recipe in RecipeManagers.fabricatorManager.recipes().toArray() {
  val recipe = _recipe as IFabricatorRecipe;
  val ores = recipe.oreDicts;

  var ingrs = [] as IIngredient[];
  for i, slot in recipe.ingredients {
    val ingr = ingrOf(slot, ores[i]);
    if (!isNull(ingr)) ingrs += ingr;
  }

  addCopy(recipe.recipeOutput, ingrs, recipe.liquid, null);
}

/*
  Advanced Tweakery flushed its own queue back on postInit, so on the first
  load the recipes we just queued have to be applied by hand. On `/ct reload`
  (script status 1) it flushes the queue again once every script has run -
  applying here as well would add every copy twice.
*/
if (mods.zenutils.ZenUtils.scriptStatus() != 1) {
  for i in queuedBefore .. actions.length {
    CraftTweakerAPI.apply(actions[i]);
  }
}
