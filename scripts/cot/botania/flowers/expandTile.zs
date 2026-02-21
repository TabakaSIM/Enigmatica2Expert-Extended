#priority 9000
#modloaded contenttweaker botania
#loader contenttweaker

import crafttweaker.util.Math;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.randomtweaker.cote.SubTileEntityInGame;
import native.net.minecraft.util.EnumFacing;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.World;

$expand SubTileEntityInGame$getRedstoneLevel(world as IWorld, pos as IBlockPos) as int {
  var redstoneLevel = 0;
  for dir in EnumFacing.VALUES {
    redstoneLevel = Math.max(redstoneLevel, (world as World).getRedstonePower((pos as BlockPos).offset(dir), dir));
  }
  return redstoneLevel;
}
