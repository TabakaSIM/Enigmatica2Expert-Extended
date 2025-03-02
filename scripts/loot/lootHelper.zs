#priority 1

import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import crafttweaker.util.IRandom;
import loottweaker.vanilla.loot.Functions;
import loottweaker.LootContext;
import crafttweaker.data.IData;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.REMOVE;
import crafttweaker.util.Math;

function removePools(tableName as string, stringList as string[]) as void{
    val table = loottweaker.LootTweaker.getTable(tableName);
    for str in stringList{
        table.removePool(str);
    }
}

function removeEtriesFromPool(tableName as string, poolName as string, stringList as string[]) as void{
    val pool = loottweaker.LootTweaker.getTable(tableName).getPool(poolName);
    for str in stringList{
        pool.removeEntry(str);
    }
}

function addLootToPool(tableName as string, poolName as string, lootTable as int[][IItemStack]) as void {
    val pool = loottweaker.LootTweaker.getTable(tableName).getPool(poolName);
    for key, value in lootTable{
        pool.addItemEntry(
            <minecraft:potato>, value[0], value[1],
            [Functions.setCount(value[2], value[3])],
            [] // Arbitrary value for example purposes
        );
    }
}

/*
██████╗  █████╗  ██████╗██╗  ██╗██████╗  █████╗  ██████╗██╗  ██╗    ██╗  ██╗ █████╗ ███╗   ██╗██╗     ██████╗ ███████╗██████╗ 
██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝    ██║  ██║██╔══██╗████╗  ██║██║     ██╔══██╗██╔════╝██╔══██╗
██████╔╝███████║██║     █████╔╝ ██████╔╝███████║██║     █████╔╝     ███████║███████║██╔██╗ ██║██║     ██║  ██║█████╗  ██████╔╝
██╔══██╗██╔══██║██║     ██╔═██╗ ██╔═══╝ ██╔══██║██║     ██╔═██╗     ██╔══██║██╔══██║██║╚██╗██║██║     ██║  ██║██╔══╝  ██╔══██╗
██████╔╝██║  ██║╚██████╗██║  ██╗██║     ██║  ██║╚██████╗██║  ██╗    ██║  ██║██║  ██║██║ ╚████║███████╗██████╔╝███████╗██║  ██║
╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝
*/

function addBackpackPool(tableName as string) as void{
    loottweaker.LootTweaker.getTable(tableName).addPool('lootBackpack', 1.0f, 1.0f, 0.0f, 0.0f);
}

function addBackpackEmpty(tableName as string, weight as int = 1) as void{
    loottweaker.LootTweaker.getTable(tableName).getPool('lootBackpack').addEmptyEntry(weight, 0, [], 'empty');
}

function addBackpackWithLoot(tableName as string, lootCommon as IData[], lootUncommon as IData[], lootRare as IData[], weight as int = 1) as void{
    loottweaker.LootTweaker.getTable(tableName).getPool('lootBackpack').addItemEntry(
        <travelersbackpack:travelers_backpack>,
        weight,0,
        [Functions.zenscript(function(input as IItemStack, rng as IRandom, context as LootContext) as IItemStack{
            var dataTag = [] as IData;
            var slots = [] as IData;
            for i in 0 .. 48{
                slots +=[i];
            }

            for i in 0 .. rng.nextInt(48){
                var table as IData[] = [];
                val number = 4.0 - Math.log(rng.nextInt(1,65)) / Math.log(4);
                if(number > 3){table = lootRare;}
                else if(number >2){table = lootUncommon;}
                else { table = lootCommon;}
                val x = slots[rng.nextInt(slots.length)];
                slots = slots.deepUpdate([x],REMOVE);
                val item = table[rng.nextInt(table.length)];
                var dataToAdd as IData = {Slot: x, Count: rng.nextInt(item.tab[0],item.tab[1]), id: item.item.id};
                if(!isNull(item.item.tag)) dataToAdd = dataToAdd + {tag: item.item.tag};
                if(!isNull(item.item.Damage)) dataToAdd = dataToAdd + {Damage: item.item.Damage};
                
                dataTag = dataTag.deepUpdate([dataToAdd],APPEND);
            }
            return input.withTag({Items: dataTag});
        })],
        [],
        'lootBackpack'
    );
}

function addBackpackForestryWithLoot(bagType as IItemStack, tableName as string, lootCommon as IData[], lootUncommon as IData[], lootRare as IData[], weight as int = 1) as void{
    loottweaker.LootTweaker.getTable(tableName).getPool('lootBackpack').addItemEntry(
        bagType,
        weight,0,
        [Functions.zenscript(function(input as IItemStack, rng as IRandom, context as LootContext) as IItemStack{
            var dataTag = [] as IData;
            var slots = [] as IData;
            if(bagType.name.endsWith('t2')){
                slots = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18',
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                ] as IData;
            } else{
                slots = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e'] as IData;
            }
            
            for i in 0 .. rng.nextInt(slots.length){
                var table as IData[] = [];
                val number = 4.0 - Math.log(rng.nextInt(1,65)) / Math.log(4);
                if(number > 3){table = lootRare;}
                else if(number >2){table = lootUncommon;}
                else { table = lootCommon;}
                val x = slots[rng.nextInt(slots.length)];
                slots = slots.deepUpdate([x],REMOVE);
                val item = table[rng.nextInt(table.length)];
                var dataToAdd as IData = {Count: rng.nextInt(item.tab[0],item.tab[1]), id: item.item.id};
                if(!isNull(item.item.tag)) dataToAdd = dataToAdd + {tag: item.item.tag};
                if(!isNull(item.item.Damage)) dataToAdd = dataToAdd + {Damage: item.item.Damage};
                dataTag = dataTag.deepUpdate({`${x}`: dataToAdd},APPEND);
            }
            return input.withTag({Slots: dataTag});
        })],
        [],
        'lootBackpackForestry' ~ bagType.name
    );
}

function addBackpackCyclicWithLoot(tableName as string, lootCommon as IData[], lootUncommon as IData[], lootRare as IData[], weight as int = 1) as void{
    loottweaker.LootTweaker.getTable(tableName).getPool('lootBackpack').addItemEntry(
        <cyclicmagic:storage_bag>,
        weight,0,
        [Functions.zenscript(function(input as IItemStack, rng as IRandom, context as LootContext) as IItemStack{
            var dataTag = [] as IData;
            var slots = [] as IData;
            for i in 0 .. 76{
                slots +=[i];
            }

            for i in 0 .. rng.nextInt(76){
                var table as IData[] = [];
                val number = 4.0 - Math.log(rng.nextInt(1,65)) / Math.log(4);
                if(number > 3){table = lootRare;}
                else if(number >2){table = lootUncommon;}
                else { table = lootCommon;}
                val x = slots[rng.nextInt(slots.length)];
                slots = slots.deepUpdate([x],REMOVE);
                val item = table[rng.nextInt(table.length)];
                var dataToAdd as IData = {Slot: x, Count: rng.nextInt(item.tab[0],item.tab[1]), id: item.item.id};
                if(!isNull(item.item.tag)) dataToAdd = dataToAdd + {tag: item.item.tag};
                if(!isNull(item.item.Damage)) dataToAdd = dataToAdd + {Damage: item.item.Damage};
                
                dataTag = dataTag.deepUpdate([dataToAdd],APPEND);
            }
            return input.withTag({ItemInventory: dataTag});
        })],
        [],
        'lootBackpackCyclic'
    );
}
