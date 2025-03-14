import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.data.IData;

scripts.loot.lootHelper.removePools('minecraft:chests/desert_pyramid',
    ['endreborn_inject_pool',
    'forestry_factory_items',
    'manuscript',
    'moms_spaghetti',
    'rats:contaminated_food',
    'token_fragment',
    'rat_upgrade_basic',
    'botania_inject_pool'] as string[]
);

scripts.loot.lootHelper.removeEtriesFromPool('minecraft:chests/desert_pyramid', 'main', [
    'minecraft:diamond',
    'minecraft:iron_ingot',
    'minecraft:gold_ingot',
    'minecraft:emerald',
    'minecraft:bone',
    'minecraft:spider_eye',
    'minecraft:rotten_flesh',
    'quark:rune',
    'rftoolsdim:parcel',
    'actuallyadditions:drillCore',
    'actuallyadditions:batWings',
    'cyclicmagic:item.tool_auto_torch',
    'cyclicmagic:item.sack_ender',
    'cyclicmagic:item.apple_emerald',
    'cyclicmagic:item.tool_harvest_crops',
    'cyclicmagic:item.tool_elevate',
    'cyclicmagic:item.glove_climb',
    'cyclicmagic:item.ender_lightning',
    'cyclicmagic:item.ender_pearl_mounted',
    'cyclicmagic:item.ender_pearl_reuse',
    'cyclicmagic:item.sprout_seed',
    'cyclicmagic:item.cyclic_wand_build',
    'cyclicmagic:item.ender_tnt_6',
]);

scripts.loot.lootHelper.addLootToPool('minecraft:chests/desert_pyramid', 'main', {
    <extrautils2:itembuilderswand>                : [30,  0, 1, 1],
    <minecraft:totem_of_undying>                  : [5,   0, 1, 1],
    <quark:archaeologist_hat>                     : [30,  0, 1, 1],
    <randomthings:lavacharm>.withTag({charge: 68}): [20,  0, 1, 1],
    <randomthings:waterwalkingboots>              : [20,  0, 1, 1],
    <randomthings:weatheregg:1>                   : [5,   0, 1, 1],
    <randomthings:weatheregg:2>                   : [5,   0, 1, 1],
    <randomthings:weatheregg>                     : [5,   0, 1, 1],
    <rats:archeologist_hat>                       : [20,  0, 1, 1],
    <rats:piper_hat>                              : [20,  0, 1, 1],
    <scalinghealth:heartcontainer>                : [30,  0, 1, 1],
    <thaumcraft:baubles:3>                        : [20,  0, 1, 1],
    <thaumcraft:elemental_axe>.withTag({infench: [{lvl: 1 as short, id: 2 as short}, {lvl: 1 as short, id: 0 as short}]}) : [5, 0, 1, 1],
    <thaumcraft:elemental_hoe>                    : [5,   0, 1, 1],
    <thaumcraft:elemental_pick>.withTag({infench: [{lvl: 1 as short, id: 4 as short}, {lvl: 2 as short, id: 3 as short}]}) : [5, 0, 1, 1],
    <thaumcraft:elemental_shovel>.withTag({infench: [{lvl: 1 as short, id: 1 as short}]}) : [5, 0, 1, 1],
    <thaumcraft:elemental_sword>.withTag({infench: [{lvl: 2 as short, id: 5 as short}]}) : [5, 0, 1, 1],
    <thaumcraft:focus_2>                          : [10,  0, 1, 1],
    <thermalfoundation:tome_experience>.withTag({Experience: 10000}) : [10, 0, 1, 1],
    <twilightforest:charm_of_keeping_1>           : [30, 0, 1, 1],
    <twilightforest:charm_of_life_1>              : [30, 0, 1, 1],
    <tconstruct:longsword>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.5 as float, FreeModifiers: 3, Durability: 1360, HarvestLevel: 8, Attack: 6.5 as float}, display: {Lore: ["", "§6§oAn offering to war and flame.", "§6§oEach strike, a sacrifice made.", "§6§oBlood spills to fuel its might.", "§6§oThe desert always takes its due."], Name: "§e§nStiletto of Montu"}, Special: {Categories: ["weapon", "tool"]}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.5 as float, FreeModifiers: 4, Durability: 1360, HarvestLevel: 8, Attack: 6.5 as float}, TinkerData: {UsedModifiers: 2, Materials: ["sunnarium", "amethyst", "electrum"], Modifiers: ["toolleveling", "flame", "fiery"]}, Modifiers: [{identifier: "tconevo.luminiferous", color: -1915115, level: 1}, {identifier: "tconevo.photosynthetic", color: -1915115, level: 1}, {identifier: "apocalypse", color: -43521, level: 1}, {identifier: "darktraveler", color: -43521, level: 1}, {identifier: "shocking", charge: 10.0 as float, color: -1516727, level: 1, x: 130.82318602172376, y: 43.0, z: 1089.5077045306434}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "flame", current: 1, color: 11874311, max: 1, level: 1}, {identifier: "fiery", current: 25, color: 15375922, max: 25, level: 1, extraInfo: "24 / 25"}], Traits: ["tconevo.luminiferous", "tconevo.photosynthetic", "apocalypse", "darktraveler", "shocking", "toolleveling", "flame", "fiery", "tconevo.artifact"]}) : [1,0,1,1],
});

loottweaker.LootTweaker.getTable("minecraft:chests/desert_pyramid").getPool('main').setRolls(1, 2);

scripts.loot.lootHelper.clearPool('minecraft:chests/desert_pyramid', 'pool1');

scripts.loot.lootHelper.addLootToPool('minecraft:chests/desert_pyramid', 'pool1', {
    <botania:blacklotus:1>                : [5,  0, 1, 1],
    <botania:blacklotus>                  : [20, 0, 1, 2],
    <botania:overgrowthseed>              : [2,  0, 1, 1],
    <endreborn:item_end_essence>          : [50, 0, 2, 3],
    <extrautils2:suncrystal>              : [30, 0, 1, 1],
    <forestry:ash>                        : [50, 0, 2, 7],
    <forestry:royal_jelly>                : [10, 0, 1, 1],
    <iceandfire:dragonbone>               : [80, 0, 2, 5],
    <iceandfire:fire_dragon_blood>        : [2,  0, 1, 1],
    <iceandfire:ice_dragon_blood>         : [2,  0, 1, 1],
    <iceandfire:pixie_dust>               : [60, 0, 1, 2],
    <mia:torch_gold>                      : [100,0, 3, 16],
    <randomthings:ingredient:10>          : [40, 0, 1, 1],
    <randomthings:ingredient:11>          : [2,  0, 1, 1],
    <rats:rat_diamond>                    : [40, 0, 1, 3],
    <rats:token_fragment>                 : [10, 0, 1, 1],
    <rustic:candle_gold>                  : [30, 0, 2, 10],
    <tconstruct:spaghetti>                : [10, 0, 3, 7],
    <thaumcraft:curio:1>                  : [20, 0, 1, 3],
    <thaumcraft:curio:2>                  : [20, 0, 1, 3],
    <thaumcraft:curio:4>                  : [20, 0, 1, 3],
    <thaumcraft:curio:5>                  : [20, 0, 1, 3],
    <thaumcraft:curio>                    : [20, 0, 1, 3],
    <thaumcraft:fabric>                   : [60, 0, 3, 7],
});
