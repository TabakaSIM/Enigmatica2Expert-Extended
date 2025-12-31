#loader contenttweaker
#modloaded thaumadditions
#priority 1000

import crafttweaker.data.IData;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Math;
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.IPotion;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.ItemHandler;

val potionExorcism as IPotion = VanillaFactory.createPotion('exorcism', 0xF7D575);

potionExorcism.shouldRender = true;
potionExorcism.shouldRenderHUD = false;
potionExorcism.badEffectIn = true;

potionExorcism.isReady = function (duration, amplifier) {
  return duration % 5 == 0;
};

potionExorcism.performEffect = function (living, amplifier) {
  if (!living.world.remote && living instanceof IEntityLivingBase) {
    val i = living.world.random.nextDouble();
    val j = living.world.random.nextDouble();
    val pi = 3.14;
    living.motionX = Math.cos(pi * i * 2) * Math.cos(pi * j * 2) * (amplifier + 1);
    living.motionY = Math.cos(pi * i * 2) * Math.sin(pi * j * 2) * (amplifier + 1);
    living.motionZ = Math.sin(pi * i * 2) * (amplifier + 1);
  }
};

potionExorcism.register();

val potionHatred as IPotion = VanillaFactory.createPotion('hatred', 0xF7D575);

potionHatred.shouldRender = false;
potionHatred.shouldRenderHUD = false;
potionHatred.badEffectIn = true;

potionHatred.isReady = function (duration, amplifier) {
  return duration % 5 == 0;
};

potionHatred.performEffect = function (living, amplifier) {
  if (!living.world.remote && living instanceof IEntityLivingBase) {
    <entity:thaumadditions:mithminite_scythe>.spawnEntity(living.world, crafttweaker.util.Position3f.create(living.x, living.y + 1, living.z).asBlockPos());
  }
};

potionHatred.register();

val potionDragonFire as IPotion = VanillaFactory.createPotion('dragonfire', 0xF7D575);

potionDragonFire.shouldRender = false;
potionDragonFire.shouldRenderHUD = false;
potionDragonFire.badEffectIn = true;

potionDragonFire.isReady = function (duration, amplifier) {
  return (duration % 5 == 0) && (duration < 140);
};

potionDragonFire.performEffect = function (living, amplifier) {
  if (!living.world.remote && living instanceof IEntityLivingBase) {
    living.fire = 1;
    living.attackEntityFrom(crafttweaker.damage.IDamageSource.ON_FIRE().setDamageBypassesArmor(), 10.0 + 5.0 * amplifier);
  }
};

potionDragonFire.register();

val potionChronos as IPotion = VanillaFactory.createPotion('chronos', 0xD3D3D3);
potionChronos.shouldRender = true;
potionChronos.shouldRenderHUD = true;
potionChronos.badEffectIn = false;

static timeColdown as int = 20;
static timeGain as int = 200;

potionChronos.isReady = function (duration, amplifier) {
  return (duration % timeColdown == 0);
};

potionChronos.performEffect = function (living, amplifier) {
  if (!living.world.remote && living instanceof IPlayer) {
    val player as IPlayer = living;
    val inventory = player.getPlayerInventoryItemHandler();
    var time = 0;
    var slot = -1;

    for slotIndex in 0 .. inventory.size {
      val item = inventory.getStackInSlot(slotIndex);
      if(!isNull(item) && item.definition.id == 'randomthings:timeinabottle'){
        val tiab = inventory.getStackInSlot(slotIndex);
        if(isNull(item.tag.timeData)) continue;
        val timeTiab = tiab.tag.timeData.storedTime;
        if(time < timeTiab) {
          slot = slotIndex;
          time = timeTiab;
        }
      }
    }

    if(slot > -1) {
      var item = inventory.getStackInSlot(slot);
      item = item.withTag(item.tag.deepUpdate({timeData: {storedTime: (timeGain + time)}}, MERGE));
      inventory.setStackInSlot(slot, item);
    }
  }
};

potionChronos.register();
