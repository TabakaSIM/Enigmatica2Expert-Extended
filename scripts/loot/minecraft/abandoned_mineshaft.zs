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
/*
scripts.loot.lootHelper.addLootToPool('minecraft:chests/abandoned_mineshaft', 'pool1', [
    //item : [weight,extra,min, max]
    <> : [];
] as int[][IItemStack]);
*/

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
    {item: <minecraft:iron_ingot>, tab: [50,64]},
    {item: <thermalfoundation:material:133>,tab: [15,30]},
    {item: <thermalfoundation:material:132>,tab: [15,40]},
    {item: <thermalfoundation:material:131>,tab: [15,40]},
    {item: <thermalfoundation:material:130>,tab: [15,40]},
    {item: <thermalfoundation:material:134>,tab: [15,40]},
    {item: <minecraft:coal>,tab: [50,60]},
];

val uncommon as IData[] = [
    {item: <minecraft:dye:4>,tab: [20,49]},
    {item: <appliedenergistics2:material>,tab: [1,49]},
    {item: <minecraft:diamond>,tab: [2,12]},
    {item: <minecraft:emerald>,tab: [3,6]},
];

val rare as IData[] = [
    {item: <biomesoplenty:gem:1>,tab: [1,5]},
    {item: <biomesoplenty:gem:2>,tab: [1,5]},
    {item: <biomesoplenty:gem:3>,tab: [1,5]},
    {item: <biomesoplenty:gem:4>,tab: [1,5]},
    {item: <biomesoplenty:gem:5>,tab: [1,5]},
    {item: <biomesoplenty:gem:6>,tab: [1,5]},
];

scripts.loot.lootHelper.addBackpackPool('minecraft:chests/abandoned_mineshaft');
scripts.loot.lootHelper.addBackpackEmpty('minecraft:chests/abandoned_mineshaft', 2);
scripts.loot.lootHelper.addBackpackWithLoot('minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag>, 'minecraft:chests/abandoned_mineshaft', common, common, uncommon, 5);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag_t2>, 'minecraft:chests/abandoned_mineshaft', common, uncommon, rare, 2);
scripts.loot.lootHelper.addBackpackCyclicWithLoot('minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
