#modloaded cases ftbquests
#reloadable
#sideonly client
#priority -1

import native.net.minecraft.util.EnumActionResult;
import native.net.minecraftforge.event.entity.player.PlayerInteractEvent.RightClickItem;
import native.ru.radviger.cases.Cases;
import native.ru.radviger.cases.network.message.MessageSpinStart;
import native.ru.radviger.cases.proxy.ClientProxy;

events.register(function (e as RightClickItem) {
  if (!scripts.mixin.cases.ftbquests.checkRightClick(e)) return;

  if (e.world.isRemote) {
    val caseTarget = Cases.findCase('mythic');
    ClientProxy.openCase(caseTarget);
    Cases.NET.sendToServer(MessageSpinStart());
  }

  e.setCancellationResult(EnumActionResult.SUCCESS);
  e.setCanceled(true);
});
