#modloaded immersivepetroleum
#reloadable

import crafttweaker.block.IBlockState;
import scripts.do.road_speedup.init.op;

op.addSpeedupBlock(<immersivepetroleum:stone_decoration>, function (state as IBlockState) as double {
    val type = state.getPropertyValue('type');
    return type == 'ASPHALT' ? 1.70 : 0.0;
  });
