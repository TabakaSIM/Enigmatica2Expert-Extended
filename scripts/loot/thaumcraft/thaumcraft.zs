import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.data.IData;

LootTweaker.getTable('thaumicaugmentation:block/loot_rare').getPool('loot_rare').addItemEntryHelper(<thaumcraft:banner_crimson_cult>, 10, 0, [Functions.setCount(1, 2)], []);

// Add rare drop to loot crates
// TODO: Seems like this tweak not working
loottweaker.LootTweaker.getTable('thaumicaugmentation:block/loot_common').getPool('loot_common').setRolls(10,20);
loottweaker.LootTweaker.getTable('thaumicaugmentation:block/loot_common').getPool('loot_common').addItemEntry(<qmd:semiconductor:1>, 5000, "qmd1");
loottweaker.LootTweaker.getTable('thaumicaugmentation:block/loot_uncommon').getPool('loot_uncommon').setRolls(10,20);
loottweaker.LootTweaker.getTable('thaumicaugmentation:block/loot_uncommon').getPool('loot_uncommon').addItemEntry(<qmd:semiconductor>, 5000, "qmd2");
