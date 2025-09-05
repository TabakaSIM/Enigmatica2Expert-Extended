#reloadable
#ignoreBracketErrors

import crafttweaker.item.IItemStack;

function set(level as int, tools as [string], item as IItemStack) as void {
  if (isNull(item)) return;

  for tool in tools {
    item.definition.setHarvestLevel(tool, level);
  }
}

set(3 , ['pickaxe'], <tcomplement:sledge_hammer>);
set(5 , ['pickaxe'], <astralsorcery:itemcrystalpickaxe>);
set(5 , ['pickaxe'], <excompressum:compressed_hammer_diamond>);
set(5 , ['pickaxe'], <exnihilocreatio:hammer_diamond>);
set(6 , ['axe']    , <thaumcraft:thaumium_axe>);
set(6 , ['pickaxe', 'shovel'], <ic2:drill>);
set(6 , ['pickaxe'], <botania:spreader>);
set(6 , ['pickaxe'], <computercraft:turtle>);
set(6 , ['pickaxe'], <thaumcraft:thaumium_pick>);
set(6 , ['shovel'] , <thaumcraft:thaumium_shovel>);
set(7 , ['axe']    , <psi:psimetal_axe>);
set(7 , ['axe']    , <thaumcraft:elemental_axe>);
set(7 , ['pickaxe', 'shovel'], <ic2:diamond_drill>);
set(7 , ['pickaxe'], <astralsorcery:itemchargedcrystalpickaxe>);
set(7 , ['pickaxe'], <psi:psimetal_pickaxe>);
set(7 , ['shovel'] , <thaumcraft:elemental_shovel>);
set(8 , ['pickaxe', 'shovel', 'axe'], <actuallyadditions:quartz_paxel>);
set(8 , ['pickaxe'], <actuallyadditions:block_breaker>);
set(8 , ['pickaxe'], <actuallyadditions:block_directional_breaker>);
set(8 , ['pickaxe'], <bloodmagic:bound_pickaxe>);
set(8 , ['pickaxe'], <botania:exchangerod>);
set(8 , ['pickaxe'], <computercraft:turtle_advanced>);
set(8 , ['pickaxe'], <integratedtunnels:part_importer_world_block_item>);
set(8 , ['pickaxe'], <twilightforest:giant_pickaxe>);
set(9 , ['axe']    , <bloodmagic:sentient_axe>);
set(9 , ['pickaxe', 'shovel'], <industrialforegoing:infinity_drill>);
set(9 , ['pickaxe'], <bloodmagic:sentient_pickaxe>);
set(9 , ['shovel'] , <bloodmagic:sentient_shovel>);
set(10, ['axe']    , <thaumcraft:void_axe>);
set(10, ['pickaxe', 'shovel', 'axe'], <actuallyadditions:gold_paxel>);
set(10, ['pickaxe', 'shovel', 'axe'], <mekanism:atomicdisassembler>);
set(10, ['pickaxe'], <actuallyadditions:block_phantom_breaker>);
set(10, ['pickaxe'], <rftools:builder>);
set(10, ['pickaxe'], <thaumcraft:elemental_pick>);
set(10, ['pickaxe'], <thaumcraft:void_pick>);
set(10, ['shovel'] , <thaumcraft:void_shovel>);
set(11, ['pickaxe', 'shovel', 'axe'], <actuallyadditions:diamond_paxel>);
set(11, ['pickaxe', 'shovel'], <thaumcraft:primal_crusher>);
set(11, ['pickaxe'], <botania:terrapick>);
set(12, ['pickaxe', 'shovel', 'axe'], <actuallyadditions:emerald_paxel>);
set(12, ['pickaxe', 'shovel'], <ic2:iridium_drill>);
set(12, ['pickaxe'], <draconicevolution:wyvern_pick>);
set(13, ['axe']    , <redstonerepository:tool.axe_gelid>);
set(13, ['pickaxe'], <redstonerepository:tool.hammer_gelid>);
set(13, ['pickaxe'], <redstonerepository:tool.pickaxe_gelid>);
set(13, ['shovel'] , <redstonerepository:tool.excavator_gelid>);
set(13, ['shovel'] , <redstonerepository:tool.shovel_gelid>);
set(14, ['pickaxe', 'shovel', 'axe'] , <draconicevolution:draconic_staff_of_power>);
set(14, ['pickaxe'], <draconicevolution:draconic_pick>);
