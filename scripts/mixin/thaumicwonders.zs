#modloaded thaumicwonders
#loader mixin

import native.net.minecraft.enchantment.Enchantment;
import native.net.minecraft.enchantment.EnchantmentDurability;
import native.net.minecraft.enchantment.EnchantmentHelper;
import native.net.minecraft.enchantment.EnchantmentMending;
import native.net.minecraft.item.ItemStack;

/*
  Catalyst Stones must be enchantable with Unbreaking and Mending.

  The mod has a config option for this ("Enable Stone Enchants"), but it is
  broken: the ItemCatalystStone constructor never assigns the `isEnchantable`
  field it receives, so `isEnchantable()` always returns false, and
  `isBookEnchantable()` is hardcoded to false.
*/
#mixin { targets: 'com.verdantartifice.thaumicwonders.common.items.catalysts.ItemCatalystStone' }
zenClass MixinItemCatalystStone {
  // isEnchantable
  #mixin Overwrite
  function func_77616_k(stack as ItemStack) as bool {
    return true;
  }

  #mixin Overwrite
  function isBookEnchantable(stack as ItemStack, book as ItemStack) as bool {
    for k in EnchantmentHelper.getEnchantments(book).keySet {
      if (canApplyAtEnchantingTable(stack, k)) return true;
    }
    return false;
  }

  function canApplyAtEnchantingTable(thisStack as ItemStack, enchantment as Enchantment) as bool {
    return enchantment instanceof EnchantmentDurability || enchantment instanceof EnchantmentMending;
  }
}
