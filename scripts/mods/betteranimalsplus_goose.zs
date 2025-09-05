#modloaded betteranimalsplus
#reloadable

import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;

static armorSlots as IEntityEquipmentSlot[] = [
  head,
  chest,
  feet,
  legs,
] as IEntityEquipmentSlot[];

// --------------------------------
// Geese use items
// --------------------------------
<entity:betteranimalsplus:goose>.onTick(function (entity) {
  val entityLiving as IEntityLivingBase = entity;
  tickGoose(entityLiving);
}, 10);

function tickGoose(entity as IEntityLivingBase) as void {
  val item = entity.getItemInSlot(mainHand);

  // No item in Goose beak
  if (isNull(item)) return;

  // Test random
  if (entity.world.random.nextInt(5) != 0) return;

  val player = entity.world.getFakePlayer();
  player.setToLocationFrom(entity);
  // player.posY -= 0.5;

  // Clear fake player inventory, including held item
  player.native.inventory.clear();

  // Reset cooldown for held item since its not ticking naturally for fake player
  player.native.cooldownTracker.setCooldown(item.definition, 0);

  val result = player.simulateRightClickItem(item, mainHand);

  // Drop all items in fake player inventory
  // Note: this make equipable armor to drop every time
  for i in 0 .. player.inventorySize {
    val item = player.getInventoryStack(i);
    if (isNull(item)) continue;
    player.dropItem(item);
  }

  // Clear everything again
  player.native.inventory.clear();

  // Replace held item of Goose with simulation result
  entity.setItemToSlot(mainHand, result.item);

  // Copyposition if effect teleport
  entity.posX = player.posX;
  entity.posY = player.posY;// + 0.5;
  entity.posZ = player.posZ;
  player.onEntityUpdate();
}
