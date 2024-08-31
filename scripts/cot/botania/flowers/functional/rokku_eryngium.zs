/*
Rokku Eryngium (Eryngium + Rokku) - flower that cuts astral rock crystals (actually automates grindstone)
*/

#loader contenttweaker
# priority -1

import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityItem;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Math;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.ISubTileEntity;
import mods.randomtweaker.cote.ISubTileEntityFunctional;
import mods.randomtweaker.cote.SubTileEntityInGame;
import mods.randomtweaker.cote.Update;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.REMOVE;

static validCrystalNames as IItemStack[string] = {
    'item.itemcelestialcrystal'         : <item:astralsorcery:itemcelestialcrystal>,
    'item.itemrockcrystalsimple'        : <item:astralsorcery:itemrockcrystalsimple>, 
} as IItemStack[string];

var rokku_eryngium as ISubTileEntityFunctional = VanillaFactory.createSubTileFunctional("rokku_eryngium");
rokku_eryngium.hasMini = false;
rokku_eryngium.maxMana = 5000;
rokku_eryngium.acceptsRedstone = true;
rokku_eryngium.range = 1;
rokku_eryngium.onUpdate = function(subtile, world, pos) {
    if(world.isRemote()) return;
    if(world.time%20!=5) return;
    //if(subtile.getRedstoneSignal()==0)//FIXME: Flower always return here 0!
    if(isNull(subtile.data)
    || isNull(subtile.data.crystalProperties)
    || subtile.data.crystalProperties.collectiveCapability==-1){
        pickCrystal(world, pos, subtile);
        return;
    } else {
        if(subtile.getMana()<1000) return;
        subtile.consumeMana(1000);
        workOnCrystal(world, pos, subtile);
        return;
    }
};
rokku_eryngium.onBlockHarvested = function(world, pos, state, player) {
    if(world.isRemote()) return;
    val subtile = world.getSubTileEntityInGame(pos);
    if(!isNull(subtile.data)
    && !isNull(subtile.data.crystalProperties)
    && subtile.data.crystalProperties.collectiveCapability!=-1) dropCrystal(world, pos, subtile);
    return;
};
rokku_eryngium.acceptsRedstone = true;
rokku_eryngium.register();

function pickCrystal(world as IWorld, pos as IBlockPos, subtile as SubTileEntityInGame) as void{
    val crystal = findCrystal(world, pos);
    if(isNull(crystal)) return;
    subtile.setCustomData(crystal.item.tag.astralsorcery + {name: crystal.item.name, status: "work"});
    crystal.setDead();
    playSound("minecraft:entity.item.pickup", pos, world);
    return;
}

function findCrystal(world as IWorld, pos as IBlockPos) as IEntityItem{
    val items = world.getEntityItems();
    for item in items{
        if(isNull(item)
        || isNull(item.item)
        || !(validCrystalNames has item.item.name)
        || Math.abs(item.x - pos.x ) > 1
        || Math.abs(item.y - pos.y ) > 1
        || Math.abs(item.z - pos.z ) > 1
        || item.item.tag.astralsorcery.crystalProperties.collectiveCapability==100) continue;
        return item;
    }
    return null;
}

function workOnCrystal(world as IWorld, pos as IBlockPos, subtile as SubTileEntityInGame) as void{
    if(subtile.data.crystalProperties.collectiveCapability==100){
        print("dropping");
        dropCrystal(world, pos, subtile);
        return;
    } 
    val sizeChange = 3 + world.random.nextInt(2);
    val cuttingChange = 1 + world.random.nextInt(2);
    if(subtile.data.crystalProperties.size <= sizeChange) {
        print("breaking");
        breakCrystal(world, pos, subtile);
        return;
    }
    print("cutting");
    cutCrystal(world, pos, subtile, sizeChange, cuttingChange);
    return;
}

function dropCrystal(world as IWorld, pos as IBlockPos, subtile as SubTileEntityInGame) as void{
    world.spawnEntity(validCrystalNames[subtile.getCustomData().name]
    .withTag({astralsorcery: {crystalProperties: subtile.data.crystalProperties}})
    .createEntityItem(world, pos)); //TODO: fix drop position (see adaminite)
    subtile.setCustomData({crystalProperties: {collectiveCapability: -1}} as IData);
}

function breakCrystal(world as IWorld, pos as IBlockPos, subtile as SubTileEntityInGame) as void{
    subtile.setCustomData({crystalProperties: {collectiveCapability: -1}} as IData);
    playSound("minecraft:entity.item.break", pos, world);
    return;
}

function cutCrystal(world as IWorld, pos as IBlockPos, subtile as SubTileEntityInGame, sizeChange as int, cuttingChange as int) as void{
    subtile.setCustomData(cutData(subtile.data, sizeChange, cuttingChange));
    server.commandManager.executeCommandSilent(server, "/particle blockcrack "~pos.x~" "~pos.y~" "~pos.z~" 0 0 0 1 0 force @a 35"); //TODO: change particles
    playSound("minecraft:entity.wither.break_block", pos, world);
    return;
}

function cutData(data as IData, sizeChange as int, cuttingChange as int) as IData{
    return data.deepUpdate({crystalProperties: {size: data.crystalProperties.size - sizeChange, collectiveCapability: Math.min((data.crystalProperties.collectiveCapability + cuttingChange) as int, 100)}}, {crystalProperties: {size: OVERWRITE, collectiveCapability: OVERWRITE}});
}

function playSound(str as string, pos as IBlockPos, world as IWorld) as void{
    val list = world.getAllPlayers();
    for player in list {
        if(isNull(player)
        || player.world.dimension!=world.dimension
        || Math.sqrt(pow(player.x - pos.x, 2) * pow(player.y - pos.y, 2) * pow(player.z - pos.z, 2))>50) continue;
        player.sendPlaySoundPacket(str, "ambient", pos, 0.05f, 1.0f);
    }
}

