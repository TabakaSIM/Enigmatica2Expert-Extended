#modloaded botania_tweaks

import crafttweaker.item.IItemStack;

val tinyPotatoes = [
  <botania:tinypotato>,
  <botania_tweaks:compressed_tiny_potato_1>,
  <botania_tweaks:compressed_tiny_potato_2>,
  <botania_tweaks:compressed_tiny_potato_3>,
  <botania_tweaks:compressed_tiny_potato_4>,
  <botania_tweaks:compressed_tiny_potato_5>,
  <botania_tweaks:compressed_tiny_potato_6>,
  <botania_tweaks:compressed_tiny_potato_7>,
  <botania_tweaks:compressed_tiny_potato_8>,
] as IItemStack[];

// Add back-conversion recipe
for i, potato in tinyPotatoes {
  if (i == 0) continue;
  recipes.addShapeless(tinyPotatoes[i - 1] * 9, [potato]);
}

// Remove old recipes of tables

// [Basic Crafting Table] from [End Steel Block][+4]
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:basic_extended_crafty_crate>);
craft.make(<botania_tweaks:basic_extended_crafty_crate>, ['pretty',
  'B a B',
  'w ■ w',
  'B □ B'], {
  'B': <extendedcrafting:material:14>, // Basic Component
  'a': <extendedcrafting:material:8>,  // Basic Catalyst
  'w': <ore:workbench>,                // Crafting Station
  '■': <ore:blockEndSteel>,            // End Steel Block
  '□': <ore:plateMithril>,             // Mana Infused Plate
});

// [Advanced Crafting Table] from [Block of Luminessence][+4]
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:advanced_extended_crafty_crate>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania_tweaks:advanced_extended_crafty_crate>, Grid(['pretty',
  'A d A',
  'B ■ B',
  'A □ A'], {
  'A': <extendedcrafting:material:15>, // Advanced Component
  'd': <extendedcrafting:material:9>,  // Advanced Catalyst
  'B': <botania_tweaks:basic_extended_crafty_crate>, // Basic Extended Crafty Crate
  '■': <ore:blockMirion>,              // Mirion Block
  '□': <ore:plateMithril>,             // Mana Infused Plate
}).shaped());

// [Elite Crafting Table] from [Basic Crafting Table][+7]
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:elite_extended_crafty_crate>);
craft.make(<botania_tweaks:elite_extended_crafty_crate>, ['pretty',
  '▬ E L E ▬',
  'E □ ■ □ E',
  'D A B A D',
  'E □ ■ □ E',
  '▬ E L E ▬'], {
  '▬': <ore:ingotEbonyPsi>,            // Ebony Psimetal Ingot
  'E': <extendedcrafting:material:10>, // Elite Catalyst
  'L': <ore:eternalLifeEssence>,       // Gaia Spirit
  '□': <ore:plateMithminite>,          // Mithminite Plate
  '■': <ore:blockThaumium>,            // Thaumium Block
  'D': <bloodmagic:points_upgrade>,    // Draft of Angelus
  'A': <botania_tweaks:advanced_extended_crafty_crate>, // Advanced Extended Crafty Crate
  'B': <botania_tweaks:basic_extended_crafty_crate>, // Basic Extended Crafty Crate
});

mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:ultimate_extended_crafty_crate>);
craft.make(<botania_tweaks:ultimate_extended_crafty_crate>, ['pretty',
  'E ■ S n S ■ E',
  '■ M U G U d ■',
  'S U A l A U S',
  'n ▲ P D P ▲ n',
  'S U A l A U S',
  '■ ▄ U G U ▀ ■',
  'E ■ S n S ■ E'], {
  'E': <contenttweaker:empowered_phosphor>,
  '■': <extendedcrafting:trimmed:4>,
  'S': <thaumcraft:taint_feature>,
  'n': <randomthings:spectrecoil_ender>,
  'M': <ore:blockMithminite>,
  'U': <extendedcrafting:material:11>,
  'G': <botania:gaiahead>,
  'd': <ore:blockEnderium>,
  'A': <botania_tweaks:advanced_extended_crafty_crate>,
  'l': <botania_tweaks:elite_extended_crafty_crate>,
  '▲': <ore:dustAlchDraconium>,
  'P': <cyclicmagic:beacon_potion>,
  'D': <botania:dice:*>,
  '▄': <ore:blockVividAlloy>,
  '▀': <ore:blockMirion>,
});
