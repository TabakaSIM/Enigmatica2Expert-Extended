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
/*
scripts.loot.lootHelper.clearPool('minecraft:chests/abandoned_mineshaft', 'pool1');
scripts.loot.lootHelper.clearPool('minecraft:chests/abandoned_mineshaft', 'pool2');
scripts.loot.lootHelper.addLootToPool('minecraft:chests/abandoned_mineshaft', 'pool1', [
    //item : [weight,extra,min, max]
    <> : [];
] as int[][IItemStack]);
scripts.loot.lootHelper.addLootToPool('minecraft:chests/abandoned_mineshaft', 'pool1', [

] as int[][IItemStack]);
*/
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
scripts.loot.lootHelper.addBackpackEmpty('minecraft:chests/abandoned_mineshaft');
scripts.loot.lootHelper.addBackpackWithLoot('minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag>, 'minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
scripts.loot.lootHelper.addBackpackForestryWithLoot(<forestry:miner_bag_t2>, 'minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
scripts.loot.lootHelper.addBackpackCyclicWithLoot('minecraft:chests/abandoned_mineshaft', common, uncommon, rare);
