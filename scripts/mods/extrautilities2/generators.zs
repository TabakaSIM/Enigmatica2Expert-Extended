#modloaded extrautils2
#ignoreBracketErrors
#priority 1

import crafttweaker.item.IIngredient;

// Netherstar Generator
static generator_netherstar as extrautilities2.Tweaker.IMachine
	= extrautilities2.Tweaker.IMachineRegistry.getMachine('extrautils2:generator_netherstar');
generator_netherstar.removeRecipe({ 'input': <minecraft:nether_star> });

// Old energy amount from 1 nether star: 9,600,000 RF
// Old time: 2400
// Old RF/T: 4000
function addNetherStarGen(input as IIngredient, mult as double) as void {
  if (isNull(input)) return;
  val new_rate = 1000.0;
  generator_netherstar.addRecipe({ 'input': input }, {}, (new_rate * mult * 2400.0) as int, 2400); // Default
}

addNetherStarGen(<mysticalagradditions:nether_star_essence>, 0.06);
addNetherStarGen(<ore:nuggetNetherStar>, 0.11);
addNetherStarGen(<extendedcrafting:material:41>, 0.12);
addNetherStarGen(<mysticalagradditions:stuff>, 0.5);
addNetherStarGen(<minecraft:nether_star>, 1);
addNetherStarGen(<ore:foodNetherstartoast>, 1.1);
addNetherStarGen(<extendedcrafting:material:40>, 1.2);
addNetherStarGen(<mysticalagradditions:special>, 3.0);
addNetherStarGen(<ore:blockNetherStar>, 6.0);
addNetherStarGen(<mysticalagradditions:nether_star_seeds>, 100.0);
