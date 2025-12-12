#loader contenttweaker
#modloaded tconstruct

import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.contenttweaker.tconstruct.TraitBuilder;
import native.net.minecraft.util.EnumParticleTypes;
import native.net.minecraft.util.SoundCategory;
import native.net.minecraft.world.WorldServer;

import scripts.do.portal_spread.sphere.getNextPoint;
import scripts.do.portal_spread.sphere.radiusToIndex;

static VAPORIZER_RADIUS as int = 10;

// Lag-preventing list to delay consecuenced triggers at the same position
static recentClearPoints as [[long]] = [] as [[long]];

events.onWorldTick(function (e as crafttweaker.event.WorldTickEvent) {
  if (e.world.remote || e.world.dimension != 0 || e.phase != 'END' || recentClearPoints.length == 0) return;

  val currentTime = e.world.worldInfo.worldTotalTime;
  for j in 0 .. recentClearPoints.length {
    val i = recentClearPoints.length - j - 1;
    val data = recentClearPoints[i];
    val time = data[0];
    if (currentTime - time >= 5) recentClearPoints.remove(i);
  }
});

function clearLiquids(world as IWorld, pos as IBlockPos) as void {
  if (world.remote) return;

  val currentTime = world.worldInfo.worldTotalTime;
  val dim = world.dimension;
  val checkRadiusSq = VAPORIZER_RADIUS * VAPORIZER_RADIUS;

  for pointData in recentClearPoints {
    val pTime = pointData[0];
    val pDim = pointData[1];
    val px = pointData[2];
    val py = pointData[3];
    val pz = pointData[4];
    if (pDim != dim) continue;

    val dx = pos.x - px;
    val dy = pos.y - py;
    val dz = pos.z - pz;

    if ((dx * dx + dy * dy + dz * dz) < checkRadiusSq && currentTime - pTime < 5) return;
  }

  recentClearPoints.add([currentTime, dim as long, pos.x as long, pos.y as long, pos.z as long] as [long]);

  var currentIndex = 1;
  val maxIndex = radiusToIndex(VAPORIZER_RADIUS);
  var liquidBlocksFound = 0;
  var lastLoggedIndex = 0;

  while currentIndex < maxIndex {
    val pointData = getNextPoint(currentIndex);
    currentIndex = pointData[0];

    if (currentIndex - lastLoggedIndex > 20000)
      lastLoggedIndex = currentIndex;

    val currentPos = pos.add(pointData[1], pointData[2], pointData[3]);
    val state = world.getBlockState(currentPos);

    if (!isNull(state) && !isNull(state.block) && !isNull(state.block.fluid)) {
      liquidBlocksFound += 1;

      world.setBlockState(<blockstate:minecraft:air>, currentPos);
    }
  }

  if (liquidBlocksFound > 0) {
    world.native.playSound(null, pos,
      native.com.lothrazar.cyclicmagic.registry.SoundRegistry.liquid_evaporate,
      SoundCategory.AMBIENT, 1.0f, 1.0f);

    // Spawn small fire particles in a sphere
    var smallRadius = max(1, VAPORIZER_RADIUS / 3); // Start not from center
    var particleIndex = radiusToIndex(smallRadius);
    val maxIndex = radiusToIndex(smallRadius + 1);
    while particleIndex < maxIndex {
      val pointData = getNextPoint(particleIndex);
      particleIndex = pointData[0];
      if (world.random.nextInt(4) == 0) {
        val particlePos = pos.add(pointData[1], pointData[2], pointData[3]);

        (world.native as WorldServer).spawnParticle(
          EnumParticleTypes.FLAME,
          particlePos.x + 0.5, particlePos.y + 0.5, particlePos.z + 0.5,
          1, 0.1, 0.1, 0.1, 0.0, 0
        );
      }
    }
  }
}

//
// Vaporizer Trait
//
// Clears a sphere of all liquids.
// Triggered on hitting an entity or breaking a block.
//

val vaporizer = TraitBuilder.create('vaporizer');
vaporizer.color = 0x42A5F5; #42A5F5
vaporizer.localizedName = game.localize('e2ee.tconstruct.trait.vaporizer.name');
vaporizer.localizedDescription = game.localize('e2ee.tconstruct.trait.vaporizer.description');

vaporizer.afterHit = function (trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
  if (wasHit)
    clearLiquids(target.world, target.position);
};

vaporizer.afterBlockBreak = function (trait, tool, world, blockstate, blockPos, miner, wasEffective) {
  if (wasEffective)
    clearLiquids(world, blockPos);
};

vaporizer.register();
