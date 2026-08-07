#modloaded actuallyadditions possiblybaubles
#loader mixin

import native.de.ellpeck.actuallyadditions.mod.items.ItemPotionRing;
import native.net.minecraft.entity.EntityLivingBase;
import native.net.minecraft.item.ItemStack;

/*
Possibly Baubles adds its own `onWornTick` to [Potion Ring]s that burns one
Blaze every tick, ignoring the x1000 duration buff applied to `onUpdate` in
`actuallyadditions.zs`. Drain on the same world time interval instead, so a
ring lasts equally long in a bauble slot and in the inventory.
*/
#mixin { targets: 'de.ellpeck.actuallyadditions.mod.items.ItemPotionRing', priority: 2000 }
zenClass MixinItemPotionRingBauble {
  #mixin Redirect
  #{
  #  method: 'onWornTick',
  #  at: {
  #    value : 'INVOKE',
  #    target: 'Lde/ellpeck/actuallyadditions/mod/items/ItemPotionRing;setStoredBlaze(Lnet/minecraft/item/ItemStack;I)V'
  #  }
  #}
  function buffDuration(stack as ItemStack, amount as int, wornStack as ItemStack, player as EntityLivingBase) as void {
    if (player.world.totalWorldTime % 100000l == 0l) {
      ItemPotionRing.setStoredBlaze(stack, amount);
    }
  }
}
