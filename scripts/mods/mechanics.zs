#modloaded mechanics

import crafttweaker.item.IItemStack;

// Heavy mix lump
recipes.remove(<mechanics:heavy_mesh> * 2);
craft.shapeless(<mechanics:heavy_mesh> * 4, 'AACBB', {
  A: <ore:dustLead>,
  B: <ore:dustQuartzBlack>,
  C: <ore:bitumen>,
});
craft.shapeless(<mechanics:heavy_mesh> * 6, 'AACBB', {
  A: <ore:dustLead>,
  B: <ore:dustQuartzBlack>,
  C: <forestry:propolis:*>,
});

// Heavy Crushing block
val compressed1 = <mechanics:heavy_block>;
val compressed2 = <additionalcompression:charcoal_compressed:1>;
recipes.addShaped(<mechanics:crushing_block>, [
  [compressed1, compressed1],
  [compressed2, compressed2]]);

<mechanics:crushing_block>.hardness = <mechanics:crushing_block>.hardness * 20;

// Amplyfying tube
recipes.addShaped(<mechanics:amplifying_tube>, [
  [<integratedterminals:chorus_glass>, <extrautils2:suncrystal>, <integratedterminals:chorus_glass>],
  [<ore:ingotHeavy>, null, <ore:ingotHeavy>],
  [<ore:ingotHeavy>, <extrautils2:decorativeglass:4>, <ore:ingotHeavy>]]);

// Remove excess recipes
mods.mechanics.removeTubeRecipe(<minecraft:stone>);
mods.mechanics.removeTubeRecipe(<minecraft:cobblestone>);
mods.mechanics.removeTubeRecipe(<minecraft:leaves>);

// Blasting powder
recipes.addShapeless(<mechanics:bursting_powder>, [
  <ore:gunpowder>, <mechanics:fuel_dust>, <appliedenergistics2:material:45>,
]);

function addBurstSeedRecipe(input as IItemStack, additive as IItemStack, output as IItemStack) {
  craft.remake(output, ['pretty',
    'A B A',
    'B C B',
    'A B A'], {
    A: !isNull(additive) ? additive : <mechanics:bursting_powder>,
    B: input,
    C: <mechanics:bursting_powder>,
  });
}

addBurstSeedRecipe(<enderio:block_infinity>, <nuclearcraft:plutonium:15>, <mechanics:burst_seed_grainsofinfinity>);
addBurstSeedRecipe(<enderio:block_infinity>, <forestry:phosphor>        , <mechanics:burst_seed_grainsofinfinity>);
addBurstSeedRecipe(<contenttweaker:blasted_coal>, <thermalfoundation:material:162>, <mechanics:burst_seed_black_iron>);

// Exclusive Recipe for Infinity Coin
mods.nuclearcraft.Crystallizer.addRecipe(<liquid:infinity_metal> * 1, <mechanics:burst_seed_infinity_coin>);

// [Empty Rod] from [Glass][+1]
craft.remake(<mechanics:empty_rod>, ['pretty',
  '  ▬ ■',
  '▬ ■ ▬',
  '■ ▬  '], {
  '▬': <ore:ingotCarbon>, // Carbon Brick
  '■': <ore:blockGlass>, // Glass
});

// ----------------------------------
// Harder Refined obsidian and glowstone recipes
// ----------------------------------

// Remove melting in NC Melter
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 144);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 144);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 16);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 16);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 1296);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 1296);

// Add IE Melting Crucible recipes
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_obsidian>  *   16, <ore:nuggetRefinedObsidian>,  1600, 4);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_glowstone> *   16, <ore:nuggetRefinedGlowstone>, 1600, 4);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_obsidian>  *  144, <ore:ingotRefinedObsidian>,   14400, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_glowstone> *  144, <ore:ingotRefinedGlowstone>,  14400, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_obsidian>  * 1296, <ore:blockRefinedObsidian>,   129600, 400);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:refined_glowstone> * 1296, <ore:blockRefinedGlowstone>,  129600, 400);

// Add recipes for high-end machines
scripts.process.melt(<ore:nuggetRefinedObsidian>, <liquid:refined_obsidian>  *   16, 'only: Crucible');
scripts.process.melt(<ore:nuggetRefinedGlowstone>,<liquid:refined_glowstone> *   16, 'only: Crucible');
scripts.process.melt(<ore:ingotRefinedObsidian>,  <liquid:refined_obsidian>  *  144, 'only: Crucible');
scripts.process.melt(<ore:ingotRefinedGlowstone>, <liquid:refined_glowstone> *  144, 'only: Crucible');
scripts.process.melt(<ore:blockRefinedObsidian>,  <liquid:refined_obsidian>  * 1296, 'only: Crucible');
scripts.process.melt(<ore:blockRefinedGlowstone>, <liquid:refined_glowstone> * 1296, 'only: Crucible');

//
// Mystical Agriadditions metling recipes probably added
//  AFTER crafttweaker. That means they cant be changed
//
// # ----------------------------------
// # Mystical Agriculture metals melting only in tube
// # ----------------------------------

// function remakeIntoTube(index as int, liquid as ILiquidStack) {
//   # Items
//   var nugget= itemUtils.getItem("mysticalagriculture:crafting", 39 + index);
//   var ingot = itemUtils.getItem("mysticalagriculture:crafting", 32 + index);
//   var block = itemUtils.getItem("mysticalagriculture:ingot_storage", index);
//   utils.log(["nugget.displayName =>", nugget.displayName]);

//   # Removing
//   mods.tconstruct.Melting.removeRecipe(liquid, nugget);
//   mods.tconstruct.Melting.removeRecipe(liquid, ingot );
//   mods.tconstruct.Melting.removeRecipe(liquid, block );

//   # Adding
//   mods.mechanics.addTubeRecipe([block] as IItemStack[], liquid * 1000);
// }

// remakeIntoTube(0, <liquid:base_essence>);
// remakeIntoTube(1, <liquid:inferium>);
// remakeIntoTube(2, <liquid:prudentium>);
// remakeIntoTube(3, <liquid:intermedium>);
// remakeIntoTube(4, <liquid:superium>);
// remakeIntoTube(5, <liquid:supremium>);
