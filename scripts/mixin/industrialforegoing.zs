#modloaded industrialforegoing
#loader mixin

import mixin.Operation;
import native.net.minecraft.item.ItemStack;

/*
  [Petrified Fuel Generator] remembers the fuel it is burning as `new ItemStack(item, 1)`,
  which silently drops metadata and NBT. OME Tweaks' generator overhaul re-reads the burn
  time from that remembered copy, so a fuel with meta != 0 — like [Burn Singularity]
  <avaritia:singularity:12> — resolves to meta 0, gets a burn time of 0, and the machine
  ends up with a 0 RF/t release rate. Drawing its GUI then divides by that rate and crashes.
  Keep the whole stack so the remembered fuel matches what is actually burning.
*/
#mixin { targets: 'com.buuz135.industrial.tile.generator.AbstractFuelGenerator' }
zenClass MixinAbstractFuelGenerator {
  #mixin Shadow
  var current as ItemStack;

  #mixin WrapMethod { method: 'getFirstFuel' }
  function getFirstFuel(replace as bool, original as Operation) as ItemStack {
    val stack = original.call(replace) as ItemStack;
    if (!replace || stack.isEmpty()) return stack;

    val remembered = stack.copy();
    remembered.setCount(1);
    current = remembered;
    return stack;
  }
}
