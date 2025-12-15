#modloaded extrautils2
#ignoreBracketErrors
#priority 1

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import extrautilities2.Tweaker.IMachineRegistry.getMachine;

zenClass Gen {
  var gen as extrautilities2.Tweaker.IMachine;
  var rft as int = 400;
  var defaultTime as int = 2400;

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
    defaultTime = newTime;
    return this;
  }

  function addRecipes(items as double[IIngredient]) as Gen {
    for item, mult in items {
      if (isNull(item)) continue;
      val totalRF = mult * defaultTime * rft;
      val cap = 2000000000;
      val totalRFCapped = min(totalRF, cap);
      val totalRFResidue = totalRF - totalRFCapped;
      val time = defaultTime * (1.0 + totalRFResidue / cap);
      gen.addRecipe({ 'input': item }, {}, totalRFCapped, time);
    }
    return this;
  }
}

Gen('netherstar')
.removeInputs([
  <minecraft:nether_star>,
])
.setDefaultRFTandTime(4000, 2400) // Old RF/T: 4000, time: 2400
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

Gen('ender')
.removeInputs([
  <minecraft:ender_pearl>,
  <minecraft:ender_eye>,
  <thermalfoundation:material:895>,
  <thermalfoundation:storage_alloy:7>,
  <thermalfoundation:material:103>,
  <thermalfoundation:material:167>,
  <thermalfoundation:material:231>,
  <forge:bucketfilled>.withTag({Amount:1000, FluidName:"ender"}),
  <forge:bucketfilled>.withTag({Amount:1000, FluidName:"enderium"}),
])
.setDefaultRFTandTime(6000, 5 * 60 * 20)
.addRecipes({
  <minecraft:ender_pearl>: 0.05,
  <extrautils2:endershard>: 0.125,
  <appliedenergistics2:material:46>: 0.2,
  <minecraft:ender_eye>: 0.3,
  <ic2:dust:32>: 0.35,
  <cyclicmagic:horse_upgrade_jump>: 0.5,
  <enderio:item_material:58>: 0.6,
  <extrautils2:enderlilly>: 1.0,
  <thaumictinkerer:kamiresource:0>: 1.0,
  <endreborn:item_ingot_endorium>: 1.5,
  <thermalfoundation:material:167>: 3.0,
  <avaritia:endest_pearl>: 100.0,
  <thermalfoundation:material:895>: 8.0,
  <rftools:infused_enderpearl>: 8.0,
  <extendedcrafting:material:48>: 12.0,
  <redstonerepository:material:1>: 10.0,
  <extendedcrafting:material:36>: 1.0,
  <extendedcrafting:material:40>: 16.0,
  <extendedcrafting:singularity:50>: 80000.0,
} as double[IIngredient]$orderly);
