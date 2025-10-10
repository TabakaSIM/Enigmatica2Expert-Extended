#modloaded thaumcraft
#loader mixin

import mixin.CallbackInfo;
import native.net.minecraft.item.ItemStack;
import native.net.minecraftforge.event.world.BlockEvent.HarvestDropsEvent;

#mixin {targets: "thaumcraft.common.tiles.devices.TileLampFertility"}
zenClass MixinTileLampFertility {
    #mixin ModifyConstant {method: "updateAnimals", constant: {intValue: 5}}
    function speedUpFluxSelfCleansing(value as int) as int {
        return 1;
    }
}

#mixin {targets: "thaumcraft.common.lib.events.ToolEvents", priority: 1100}
zenClass MixinToolEvents {
    #mixin Static
    #mixin Inject {method: "doRefining", at: {value: "HEAD"}, cancellable: true}
    function doBuffedRefining(event as HarvestDropsEvent, heldItem as ItemStack, ci as CallbackInfo) as void {
        scripts.mixin.thaumcraft.shared.Op.doRefining(event, heldItem);
        ci.cancel();
    }
}
