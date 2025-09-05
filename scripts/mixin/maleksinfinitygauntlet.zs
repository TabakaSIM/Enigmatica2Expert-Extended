// I though this could fix, but it wont https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/478
#norun

#modloaded maleksinfinitygauntlet
#loader mixin

import native.net.minecraft.item.ItemStack;
import native.net.minecraftforge.fml.common.registry.ForgeRegistries;

#mixin {targets: "com.anthonyhilyard.itemborders.util.Selectors"}
zenClass MixinSelectors {
    #mixin Static
    #mixin Inject {method: "itemMatches", at: {value: "HEAD"}, cancellable: true}
    function skipIfItemUnregistered(item as ItemStack, selector as string, cir as mixin.CallbackInfoReturnable) as void {
        if(isNull(ForgeRegistries.ITEMS.getKey(item.getItem())))
            cir.setReturnValue(false);
    }
}
