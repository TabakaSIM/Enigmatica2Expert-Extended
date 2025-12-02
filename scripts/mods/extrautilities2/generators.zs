#modloaded extrautils2
#ignoreBracketErrors
#priority 1

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import extrautilities2.Tweaker.IMachineRegistry.getMachine;

zenClass Gen {
  var gen as extrautilities2.Tweaker.IMachine;
  var rft as int = 400;
  var time as int = 2400;

  zenConstructor(shortName as string) {
    gen = getMachine("extrautils2:generator_" + shortName);
  }

  function removeInputs(items as IItemStack[]) as Gen {
    for item in items {
      gen.removeRecipe({ 'input': item });
    }
    return this;
  }

  function setDefaultRFTandTime(newRft as int, newTime as int) as Gen {
    rft = newRft;
    time = newTime;
    return this;
  }

  function addRecipes(items as double[IIngredient]) as Gen {
    for item, mult in items {
      if (isNull(item)) continue;
      gen.addRecipe({ 'input': item }, {}, mult * time * rft, time);
    }
    return this;
  }
}

Gen('netherstar')
.removeInputs([
  <minecraft:nether_star>,
])
.setDefaultRFTandTime(1000, 2400) // Old RF/T: 4000, time: 2400
.addRecipes({
  <mysticalagradditions:nether_star_essence>: 0.06,
  <ore:nuggetNetherStar>: 0.11,
  <extendedcrafting:material:41>: 0.12,
  <mysticalagradditions:stuff>: 0.5,
  <minecraft:nether_star>: 1.0,
  <ore:foodNetherstartoast>: 1.1,
  <extendedcrafting:material:40>: 1.2,
  <mysticalagradditions:special>: 3.0,
  <ore:blockNetherStar>: 6.0,
  <mysticalagradditions:nether_star_seeds>: 100.0,
} as double[IIngredient]$orderly);
