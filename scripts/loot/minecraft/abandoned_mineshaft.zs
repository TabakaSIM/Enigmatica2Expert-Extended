import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.data.IData;

scripts.loot.lootHelper.removePools('minecraft:chests/abandoned_mineshaft',
    ['endreborn_inject_pool',
    'openmods_inject_pool',
    'forestry_factory_items',
    'forestry_storage_items',
    'manuscript',
    'spectrecoil_number',
    'rats:contaminated_food',
    'token_fragment',
    'rat_upgrade_basic',
    'AE2 Crystals',
    'AE2 DUSTS',
    'botania_inject_pool'] as string[]
);

scripts.loot.lootHelper.removeEtriesFromPool('minecraft:chests/abandoned_mineshaft', 'main', [
    'actuallyadditions:drillCore',
]);
scripts.loot.lootHelper.removeEtriesFromPool('enderio:chests/abandoned_mineshaft', 'Ender IO', [
    'enderio:item_alloy_ingot:6',
    'enderio:block_exit_rail:0',
]);


scripts.loot.lootHelper.clearPool('minecraft:chests/abandoned_mineshaft', 'pool1');

scripts.loot.lootHelper.addLootToPool('minecraft:chests/abandoned_mineshaft', 'pool1', {
    <harvestcraft:applejellysandwichitem>           : [10,0,3,7],
    <harvestcraft:apricotjellysandwichitem>         : [10,0,3,7],
    <harvestcraft:blackberryjellysandwichitem>      : [10,0,3,7],
    <harvestcraft:blueberryjellysandwichitem>       : [10,0,3,7],
    <harvestcraft:bolognasandwichitem>              : [10,0,3,7],
    <harvestcraft:cherryjellysandwichitem>          : [10,0,3,7],
    <harvestcraft:cranberryjellysandwichitem>       : [10,0,3,7],
    <harvestcraft:figjellysandwichitem>             : [10,0,3,7],
    <harvestcraft:friedbolognasandwichitem>         : [10,0,3,7],
    <harvestcraft:gooseberryjellysandwichitem>      : [10,0,3,7],
    <harvestcraft:grapefruitjellysandwichitem>      : [10,0,3,7],
    <harvestcraft:groiledcheesesandwichitem>        : [10,0,3,7],
    <harvestcraft:hamandcheesesandwichitem>         : [10,0,3,7],
    <harvestcraft:hamsweetpicklesandwichitem>       : [10,0,3,7],
    <harvestcraft:honeysandwichitem>                : [10,0,3,7],
    <harvestcraft:kiwijellysandwichitem>            : [10,0,3,7],
    <harvestcraft:lemonjellysandwichitem>           : [10,0,3,7],
    <harvestcraft:limejellysandwichitem>            : [10,0,3,7],
    <harvestcraft:mangojellysandwichitem>           : [10,0,3,7],
    <harvestcraft:orangejellysandwichitem>          : [10,0,3,7],
    <harvestcraft:papayajellysandwichitem>          : [10,0,3,7],
    <harvestcraft:peachjellysandwichitem>           : [10,0,3,7],
    <harvestcraft:peanutbutterbananasandwichitem>   : [10,0,3,7],
    <harvestcraft:pearjellysandwichitem>            : [10,0,3,7],
    <harvestcraft:persimmonjellysandwichitem>       : [10,0,3,7],
    <harvestcraft:plumjellysandwichitem>            : [10,0,3,7],
    <harvestcraft:pomegranatejellysandwichitem>     : [10,0,3,7],
    <harvestcraft:raspberryjellysandwichitem>       : [10,0,3,7],
    <harvestcraft:starfruitjellysandwichitem>       : [10,0,3,7],
    <harvestcraft:strawberryjellysandwichitem>      : [10,0,3,7],
    <harvestcraft:toastsandwichitem>                : [10,0,3,7],
    <harvestcraft:tunafishsandwichitem>             : [10,0,3,7],
    <harvestcraft:watermelonjellysandwichitem>      : [10,0,3,7],
    <rats:contaminated_food>                        : [400,0,2,5],

    <actuallyadditions:item_crystal:1>              : [30,0,1,2],
    <actuallyadditions:item_crystal:2>              : [30,0,1,2],
    <actuallyadditions:item_crystal:3>              : [30,0,1,2],
    <actuallyadditions:item_crystal:4>              : [30,0,1,2],
    <actuallyadditions:item_crystal:5>              : [30,0,1,2],
    <actuallyadditions:item_crystal>                : [30,0,1,2],
    <baubles:ring>                                  : [10,0,1,1],
    <immersiveengineering:material:6>               : [25,0,6,12],
    <thaumcraft:baubles:1>                          : [10,0,1,1],
    <thaumcraft:baubles:3>                          : [5,0,1,1],

    <botania:blacklotus>                            : [10,0,1,2],
    <botania:overgrowthseed>                        : [10,0,1,2],
    <endreborn:item_end_essence>                    : [20,0,4,6],
    <iceandfire:manuscript>                         : [20,0,2,5],
    <thaumcraft:curio:1>                            : [10,0,1,3],
    <thaumcraft:curio:2>                            : [10,0,1,3],
    <thaumcraft:curio:4>                            : [10,0,1,3],
    <thaumcraft:curio:5>                            : [10,0,1,3],
    <thaumcraft:curio>                              : [10,0,1,3],

    <cookingforblockheads:cow_jar>                  : [1,0,1,1],
    <tconstruct:moms_spaghetti>                     : [3,0,1,2],
    <botania:blacklotus:1>                          : [3,0,1,1],
    <rats:token_fragment>                           : [4,0,1,1],
    <harvestcraft:minerstewitem>                    : [8,0,1,1],
});


scripts.loot.lootHelper.clearPool('minecraft:chests/abandoned_mineshaft', 'pool2');
scripts.loot.lootHelper.addLootToPool('minecraft:chests/abandoned_mineshaft', 'pool2', {
        <minecraft:tnt>                                             : [100,0,1,12],
        <cyclicmagic:ender_tnt_6>                                   : [80,0,1,36],
        <cyclicmagic:ender_tnt_3>                                   : [80,0,1,11],
        <oeintegration:excavatemodifier>                            : [10,0,1,1],
        <tconstruct:materials:14>                                   : [20,0,1,2],
        <tconstruct:pick_head>.withTag({Material: "invar"})         : [5,0,1,1],
        <tconstruct:pick_head>.withTag({Material: "iron"})          : [5,0,1,1],
        <tconstruct:pick_head>.withTag({Material: "black_quartz"})  : [5,0,1,1],
        <tconstruct:binding>.withTag({Material: "pink_slime"})      : [5,0,1,1],
        <tconstruct:tool_rod>.withTag({Material: "bone"})           : [5,0,1,1],
        <tconstruct:tough_tool_rod>.withTag({Material: "bone"})     : [5,0,1,1],
        <tconstruct:hammer_head>.withTag({Material: "lead"})        : [5,0,1,1],
        <tconstruct:large_plate>.withTag({Material: "black_quartz"}): [5,0,1,1],
        <tconstruct:large_plate>.withTag({Material: "fluix"})       : [5,0,1,1],
        <tconstruct:pick_head>.withTag({Material: "ruby"})          : [3,0,1,1],
        <tconstruct:binding>.withTag({Material: "cobalt"})          : [3,0,1,1],
        <tconstruct:tool_rod>.withTag({Material: "pigiron"})        : [3,0,1,1],
        <tconstruct:hammer_head>.withTag({Material: "boron"})       : [3,0,1,1],
        <tconstruct:large_plate>.withTag({Material: "obsidian"})    : [3,0,1,1],
        <actuallyadditions:item_crystal_empowered:2>                : [1,0,1,1],
        <tconstruct:materials:16>                                   : [1,0,1,1],
        <tconstruct:hammer>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.40625 as float, FreeModifiers: 5, Durability: 1582, HarvestLevel: 8, Attack: 4.59375 as float}, display: {Lore: ["", "§6§oThe miner’s hammer, worn yet stout,", "§6§oHides away when she’s about.", "§6§oFor if she sees, she’ll surely say,", "§6§o“No more digging—work, not play!”"], Name: "§e§nWifewarder"}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.40625 as float, FreeModifiers: 0, Durability: 1582, HarvestLevel: 8, Attack: 7.59375 as float}, Special: {Categories: ["tool", "weapon", "aoe", "harvest"]}, TinkerData: {UsedModifiers: 2, Materials: ["dragonbone", "refined_obsidian", "treatedwood", "osmium"], Modifiers: ["toolleveling", "harvestwidth", "harvestheight"]}, Modifiers: [{identifier: "fractured2", color: -4738403, level: 1}, {identifier: "duritos", color: -8559205, level: 1}, {identifier: "tconevo.impact_force", color: -8559205, level: 1}, {identifier: "ecological", color: -10144478, level: 1}, {identifier: "dense", color: -5653044, level: 1}, {identifier: "stiff", color: -5653044, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "harvestwidth", color: 13301410}, {identifier: "harvestheight", color: 13301410}, {identifier: "tconevo.artifact", color: 14333039, level: 1}], Traits: ["fractured2", "duritos", "tconevo.impact_force", "ecological", "dense", "stiff", "toolleveling"]})                                                  : [1,0,1,1],
        <tconstruct:pickaxe>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.625 as float, FreeModifiers: 6, Durability: 337, HarvestLevel: 7, Attack: 3.0 as float}, display: {Lore: ["", "§6§oThrough coal-black veins, he carved his strife,", "§6§oA pickaxes song, the soundtrack of life.", "§6§oWith rats as kin, in darkness theyd stay,", "§6§oNow silence reigns—where light gave way."], Name: "§e§nSplinter"}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 5.625 as float, FreeModifiers: 2, Durability: 337, HarvestLevel: 7, Attack: 3.0 as float}, Special: {Categories: ["tool", "aoe", "harvest"]}, TinkerData: {Materials: ["bronze", "uranium", "cheese"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "dense", color: -1852056, level: 1}, {identifier: "poisonous", color: -12557504, level: 1}, {identifier: "tasty", color: -868046, level: 1}, {identifier: "ratty", color: -868046, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["dense", "poisonous", "tasty", "ratty", "toolleveling"]})                                                    : [1,0,1,1],
    }
);

val common as IData[] = [
    {tab: [2,48], item: <ic2:crushed:1>},
    {tab: [2,48], item: <ic2:crushed:2>},
    {tab: [2,48], item: <ic2:crushed:3>},
    {tab: [2,48], item: <ic2:crushed:5>},
    {tab: [2,48], item: <ic2:crushed:6>},
    {tab: [2,48], item: <ic2:crushed>},
    {tab: [2,48], item: <jaopca:item_crushedaluminium>},
    {tab: [2,48], item: <jaopca:item_crushednickel>},
    {tab: [2,48], item: <jaopca:item_crushedosmium>},
];

val uncommon as IData[] = [
    {tab: [2,8], item: <ic2:crushed:4>},
    {tab: [1,20], item: <jaopca:item_clusteraluminium>},
    {tab: [1,20], item: <jaopca:item_clusteramber>},
    {tab: [1,20], item: <jaopca:item_clusterapatite>},
    {tab: [1,20], item: <jaopca:item_clustercertusquartz>},
    {tab: [1,20], item: <jaopca:item_clustercoal>},
    {tab: [1,20], item: <jaopca:item_clusterdiamond>},
    {tab: [1,20], item: <jaopca:item_clusteremerald>},
    {tab: [1,20], item: <jaopca:item_clusterlapis>},
    {tab: [1,20], item: <jaopca:item_clusternickel>},
    {tab: [1,20], item: <jaopca:item_clusterosmium>},
    {tab: [1,20], item: <jaopca:item_clusterquartzblack>},
    {tab: [1,20], item: <jaopca:item_clusterredstone>},
    {tab: [1,20], item: <jaopca:item_clusteruranium>},
    {tab: [2,8], item: <jaopca:item_crushedplatinum>},
    {tab: [1,20], item: <thaumcraft:cluster:1>},
    {tab: [1,20], item: <thaumcraft:cluster:2>},
    {tab: [1,20], item: <thaumcraft:cluster:3>},
    {tab: [1,20], item: <thaumcraft:cluster:5>},
    {tab: [1,20], item: <thaumcraft:cluster:6>},
    {tab: [1,20], item: <thaumcraft:cluster>},
    {tab: [1,30], item: <rats:rat_nugget_ore>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 132 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:94>.withTag({OreItem: {id: "minecraft:redstone_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:redstone", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:8>.withTag({OreItem: {id: "thaumcraft:ore_cinnabar", Count: 1, Damage: 0 as short}, IngotItem: {id: "thaumcraft:quicksilver", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:89>.withTag({OreItem: {id: "mekanism:oreblock", Count: 1, Damage: 0 as short}, IngotItem: {id: "mekanism:ingot", Count: 1, Damage: 1 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:88>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 133 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:6>.withTag({OreItem: {id: "actuallyadditions:block_misc", Count: 1, Damage: 3 as short}, IngotItem: {id: "actuallyadditions:item_misc", Count: 1, Damage: 5 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:53>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 131 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:52>.withTag({OreItem: {id: "minecraft:lapis_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:dye", Count: 1, Damage: 4 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:51>.withTag({OreItem: {id: "minecraft:iron_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:iron_ingot", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:49>.withTag({OreItem: {id: "minecraft:gold_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:gold_ingot", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:46>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 12 as short}, IngotItem: {id: "immersiveengineering:ore", Count: 2, Damage: 5 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:45>.withTag({OreItem: {id: "netherendingores:ore_nether_modded_1", Count: 1, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 1 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:41>.withTag({OreItem: {id: "netherendingores:ore_nether_vanilla", Count: 1, Damage: 6 as short}, IngotItem: {id: "minecraft:redstone_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:37>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 11 as short}, IngotItem: {id: "mekanism:oreblock", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:36>.withTag({OreItem: {id: "netherendingores:ore_nether_modded_1", Count: 1, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 5 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:34>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 3 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:33>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 5 as short}, IngotItem: {id: "minecraft:lapis_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:32>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 4 as short}, IngotItem: {id: "minecraft:iron_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:2>.withTag({OreItem: {id: "forestry:resources", Count: 1, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:28>.withTag({OreItem: {id: "netherendingores:ore_nether_vanilla", Count: 1, Damage: 3 as short}, IngotItem: {id: "minecraft:gold_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:27>.withTag({OreItem: {id: "netherendingores:ore_nether_vanilla", Count: 1, Damage: 2 as short}, IngotItem: {id: "minecraft:emerald_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:25>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 1 as short}, IngotItem: {id: "minecraft:diamond_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:101>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 129 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:24>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 1 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:22>.withTag({OreItem: {id: "netherendingores:ore_end_vanilla", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:coal_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:20>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 9 as short}, IngotItem: {id: "appliedenergistics2:quartz_ore", Count: 2, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:1>.withTag({OreItem: {id: "thaumcraft:ore_amber", Count: 1, Damage: 0 as short}, IngotItem: {id: "thaumcraft:amber", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:16>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 4 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:15>.withTag({OreItem: {id: "minecraft:emerald_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:emerald", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:12>.withTag({OreItem: {id: "minecraft:diamond_ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "minecraft:diamond", Count: 1, Damage: 0 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:104>.withTag({OreItem: {id: "immersiveengineering:ore", Count: 1, Damage: 5 as short}, IngotItem: {id: "immersiveengineering:metal", Count: 1, Damage: 5 as short}})},
    {tab: [1,30], item: <rats:rat_nugget_ore:11>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 0 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 128 as short}})},
];

val rare as IData[] = [
    {tab: [1,4], item: <jaopca:item_clusterplatinum>},
    {tab: [1,4], item: <thaumcraft:cluster:4>},
    {tab: [1,4], item: <rats:rat_nugget_ore:39>.withTag({OreItem: {id: "netherendingores:ore_end_modded_1", Count: 1, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 6 as short}})},
    {tab: [1,6], item: <rats:rat_nugget_ore:92>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 134 as short}})},
    {tab: [1,4], item: <rats:rat_nugget_ore:44>.withTag({OreItem: {id: "netherendingores:ore_nether_modded_1", Count: 1, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:ore", Count: 2, Damage: 2 as short}})},
    {tab: [1,6], item: <rats:rat_nugget_ore:97>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1, Damage: 2 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1, Damage: 130 as short}})},
];

scripts.loot.lootHelper.addBackpackPool('minecraft:chests/abandoned_mineshaft');
scripts.loot.lootHelper.addBackpackEmpty('minecraft:chests/abandoned_mineshaft', 3);
scripts.loot.lootHelper.addBackpackWithLoot('minecraft:chests/abandoned_mineshaft', common, uncommon, rare, 3);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag>, 'minecraft:chests/abandoned_mineshaft', common, common, uncommon, 5);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag_t2>, 'minecraft:chests/abandoned_mineshaft', common, uncommon, uncommon, 5);
scripts.loot.lootHelper.addBackpackCyclicWithLoot('minecraft:chests/abandoned_mineshaft', uncommon, uncommon, rare);
