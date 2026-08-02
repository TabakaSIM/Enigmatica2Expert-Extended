#modloaded nuclearcraft
#loader mixin

import native.net.minecraftforge.fluids.FluidStack;
import native.slimeknights.tconstruct.library.TinkerRegistry;

/*
NC registers its Tinkers' alloys from `RegistryEvent.Register<IRecipe>` at
EventPriority.LOW, while CraftTweaker runs the scripts on the same event at
EventPriority.LOWEST. ModTweaker's `mods.tconstruct.Alloy.removeRecipe` does not
delete anything - it only cancels *later* `AlloyRegisterEvent`s - so NC's alloys
are already in the registry by the time the scripts ask for their removal and
stay there forever. Drop them here instead, at class-transform time.

Removed: `lead_platinum` (lead + platinum) and `enderium` (lead_platinum +
ender), both re-added by scripts/mods/thermalexpansion.zs in a harder form.
*/
#mixin { targets: 'nc.integration.tconstruct.TConstructExtras' }
zenClass MixinTConstructExtras {
  #mixin Static
  #mixin Redirect
  #{
  #  method: 'registerAlloyRecipe',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lslimeknights/tconstruct/library/TinkerRegistry;registerAlloy(Lnet/minecraftforge/fluids/FluidStack;[Lnet/minecraftforge/fluids/FluidStack;)V'
  #  }
  #}
  function skipRedundantAlloys(result as FluidStack, inputs as FluidStack[]) as void {
    val name = result.getFluid().getName();
    if (name == 'lead_platinum' || name == 'enderium') return;
    TinkerRegistry.registerAlloy(result, inputs);
  }
}

// Makes Molten Tough Alloy match new ingot's colors
#mixin { targets: 'nc.init.NCFluids' }
zenClass MixinNCFluids {
  #mixin Static
  #mixin ModifyConstant { method: 'init', constant: { intValue: 1380129 } }
  function changeToughAlloyColor(value as int) as int {
    return 0x271841;
  }
}

#mixin { targets: 'nc.integration.tconstruct.TConstructMaterials' }
zenClass MixinTConstructMaterials {
  #mixin Static
  #mixin ModifyConstant { method: 'init', constant: { intValue: 1380129 } }
  function changeToughAlloyColor(value as int) as int {
    return 0x271841;
  }
}
