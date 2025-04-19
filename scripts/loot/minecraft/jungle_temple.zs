import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.data.IData;

scripts.loot.lootHelper.removePools('minecraft:chests/jungle_temple',
    ['Ender IO',
    'endreborn_inject_pool',
    'forestry_arboriculture_items',
    'forestry_apiculture_bees',
    'manuscript',
    'slimecube',
    'rats:contaminated_food',
    'token_fragment',
    'rat_upgrade_basic',
    'botania_inject_pool',
    'moms_spaghetti'] as string[]
);

scripts.loot.lootHelper.clearPool('minecraft:chests/jungle_temple', 'main');
scripts.loot.lootHelper.addLootToPool('minecraft:chests/jungle_temple', 'main', {
    <astralsorcery:itemconstellationpaper>                                  : [30,  0, 1, 1],
    <rats:piper_hat>                                                        : [5,   0, 1, 1],
    <rats:rat_flute>                                                        : [5,   0, 1, 1],
    <quark:archaeologist_hat>                                               : [5,   0, 1, 1],
    <iceandfire:myrmex_jungle_chitin>                                       : [20,  0, 2, 5],
    <minecraft:ender_eye>                                                   : [10,  0, 1, 2],
    <iceandfire:dragonbone>                                                 : [50,  0, 1, 2],
    <iceandfire:manuscript>                                                 : [50,  0, 2, 3],
    <iceandfire:amphithere_feather>                                         : [50,  0, 2, 5],
    <botania:blacklotus:1>                                                  : [1,   0, 1, 1],
    <botania:thirdeye>                                                      : [1,   0, 1, 1],
    <forge:bucketfilled>.withTag({FluidName: "liquid_death", Amount: 1000}) : [5,   0, 1, 1],
    <animus:kama_bound>                                                     : [1,   0, 1, 1],
    <randomthings:ingredient:1>                                             : [5,   0, 1, 1],
    <randomthings:beans:2>                                                  : [5,   0, 1, 1],
    <scalinghealth:heartcontainer>                                          : [5,   0, 1, 1],
    <cyclicmagic:charm_wing>                                                : [5,   0, 1, 1],
    <cyclicmagic:charm_speed>                                               : [5,   0, 1, 1],
    <cyclicmagic:charm_fire>                                                : [5,   0, 1, 1],
    <cyclicmagic:charm_boat>                                                : [5,   0, 1, 1],
    <cyclicmagic:charm_void>                                                : [5,   0, 1, 1],
    <cyclicmagic:charm_air>                                                 : [5,   0, 1, 1],
    <cyclicmagic:charm_water>                                               : [5,   0, 1, 1],
    <cyclicmagic:charm_antidote>                                            : [5,   0, 1, 1],
    <tinkersaddons:modifier_item:1>                                         : [10,  0, 1, 1],
    <thaumadditions:cake>                                                   : [5,   0, 1, 1],
    <botania:manaresource>                                                  : [10,  0, 1, 2],
    <botania:manaresource:2>                                                : [10,  0, 1, 2],
    <botania:manaresource:1>                                                : [10,  0, 1, 2],
    <rats:purifying_liquid>                                                 : [5,   0, 1, 1],
    <eyeofdragons:eye_of_icedragon>                                         : [5,   0, 1, 1],
    <eyeofdragons:eye_of_firedragon>                                        : [5,   0, 1, 1],
    <tconstruct:materials:19>                                               : [5,   0, 1, 1],
    <botania:blacklotus>                                                    : [20,  0, 1, 2],
    
    <tconstruct:arrow>.withTag({StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 0.9 as float, MiningSpeed: 9.0 as float, FreeModifiers: 3, Durability: 420, HarvestLevel: 12, Attack: 11.0 as float}, display: {Lore: ["", "§6§oPraise the blaze that shapes the skies,", "§6§oHer golden breath, where darkness dies.", "§6§oIn every flight, her grace remains", "§6§oA hymn of light in searing flames."], Name: "§eProvidence Echoes"}, Stats: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 0.9 as float, MiningSpeed: 9.0 as float, FreeModifiers: 0, Durability: 420, HarvestLevel: 12, Attack: 11.0 as float}, Special: {Categories: ["no_melee", "tool", "projectile"]}, TinkerData: {UsedModifiers: 2, Materials: ["reed", "sunnarium", "amphithere_feather"], Modifiers: ["toolleveling", "mending_moss", "knockback"]}, Modifiers: [{identifier: "breakable", color: -5579916, level: 1}, {identifier: "tconevo.luminiferous", color: -1915115, level: 1}, {identifier: "tconevo.photosynthetic", color: -1915115, level: 1}, {identifier: "arrow_knockback", color: -14514336, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "mending_moss", color: 4434738, level: 1}, {identifier: "knockback", current: 10, color: 10461087, max: 10, level: 1, extraInfo: "9 / 10"}], Traits: ["breakable", "tconevo.luminiferous", "tconevo.photosynthetic", "arrow_knockback", "toolleveling", "mending_moss", "knockback", "tconevo.artifact"]}) : [1,  0, 1, 1],
    }  
);
 
