#modloaded voidislandcontrol gamestages
#loader mixin

import native.net.darkhax.gamestages.GameStageHelper;
import native.com.bartz24.voidislandcontrol.api.IslandManager;
import native.net.minecraft.server.MinecraftServer;
import native.net.minecraft.command.ICommandSender;
import native.net.minecraft.entity.player.EntityPlayerMP;
import native.net.minecraft.util.text.TextComponentString;
import native.com.bartz24.voidislandcontrol.config.ConfigOptions;
import mixin.CallbackInfo;
import native.net.minecraft.world.storage.WorldInfo;
import native.net.minecraft.world.WorldType;
import native.net.minecraftforge.fml.common.gameevent.PlayerEvent.PlayerRespawnEvent;

#mixin { targets: 'com.bartz24.voidislandcontrol.AdminCommand' }
zenClass MixinAdminCommand {
  #mixin Inject { method: 'func_184881_a', at: { value: 'HEAD' }, cancellable: true }
  function checkDimension(server as MinecraftServer, sender as ICommandSender, args as string[], ci as CallbackInfo) as void {
    val world = sender.getEntityWorld();
    val player = world.getPlayerEntityByName(sender.getCommandSenderEntity().getName()) as EntityPlayerMP;

    if (player.dimension != ConfigOptions.worldGenSettings.baseDimension) {
      player.sendMessage(TextComponentString('You are not in a void world.'));
      ci.cancel();
    }
  }

  #mixin Redirect
  #{
  #  method: 'func_184881_a',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lnet/minecraft/world/storage/WorldInfo;func_76067_t()Lnet/minecraft/world/WorldType;'
  #  }
  #}
  function disableOldCheck(info as WorldInfo) as WorldType {
    // This ensures the original `if` condition `!(... instanceof WorldTypeVoid)` always evaluates to false,
    // effectively disabling the old check.
    return scripts.mixin.voidislandcontrol_shared.worldTypeVoidDummy;
  }
}

#mixin { targets: 'com.bartz24.voidislandcontrol.PlatformCommand' }
zenClass MixinPlatformCommand {
  // Skyblock players keep access from anywhere - `/island home` is their only way back
  // if something drops them outside of the void dimension.
  #mixin Inject { method: 'func_184881_a', at: { value: 'HEAD' }, cancellable: true }
  function checkDimension(server as MinecraftServer, sender as ICommandSender, args as string[], ci as CallbackInfo) as void {
    val world = sender.getEntityWorld();
    val player = world.getPlayerEntityByName(sender.getCommandSenderEntity().getName()) as EntityPlayerMP;

    if (player.dimension != ConfigOptions.worldGenSettings.baseDimension
      && !GameStageHelper.hasStage(player, 'skyblock')) {
      player.sendMessage(TextComponentString('You are not in a void world.'));
      ci.cancel();
    }
  }

  #mixin Redirect
  #{
  #  method: 'func_184881_a',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lnet/minecraft/world/storage/WorldInfo;func_76067_t()Lnet/minecraft/world/WorldType;'
  #  }
  #}
  function disableOldCheck(info as WorldInfo) as WorldType {
    return scripts.mixin.voidislandcontrol_shared.worldTypeVoidDummy;
  }
}

#mixin { targets: 'com.bartz24.voidislandcontrol.EventHandler' }
zenClass MixinEventHandler {
  #mixin Redirect
  #{
  #  method: 'playerLogin',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lnet/minecraft/world/storage/WorldInfo;func_76067_t()Lnet/minecraft/world/WorldType;'
  #  }
  #}
  function disableWorldTypeCheckInLogin(info as WorldInfo) as WorldType {
    return scripts.mixin.voidislandcontrol_shared.worldTypeVoidDummy;
  }

  #mixin Redirect
  #{
  #  method: 'playerUpdate',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lnet/minecraft/world/storage/WorldInfo;func_76067_t()Lnet/minecraft/world/WorldType;'
  #  }
  #}
  function disableWorldTypeCheckInUpdate(info as WorldInfo) as WorldType {
    return scripts.mixin.voidislandcontrol_shared.worldTypeVoidDummy;
  }

  /*
    Dying in a dimension that forbids respawning (Spectre, Deep Dark, ...) makes Forge respawn
    the player in the Overworld, and it fires no PlayerChangedDimensionEvent for that. Gating on
    the dimension here left Skyblock players stranded, because this handler is what sends them
    back to their island. Gate on the game stage instead - the world type check the mixins above
    disable is what used to keep everyone else out.
  */
  #mixin Inject { method: 'onPlayerRespawn', at: { value: 'HEAD' }, cancellable: true }
  function checkDimensionInRespawn(event as PlayerRespawnEvent, ci as CallbackInfo) as void {
    if (!GameStageHelper.hasStage(event.player, 'skyblock')
      || IslandManager.CurrentIslandsList.length == 0) {
      ci.cancel();
    }
  }

  #mixin Redirect
  #{
  #  method: 'onPlayerRespawn',
  #  at: {
  #    value: 'INVOKE',
  #    target: 'Lnet/minecraft/world/storage/WorldInfo;func_76067_t()Lnet/minecraft/world/WorldType;'
  #  }
  #}
  function disableWorldTypeCheckInRespawn(info as WorldInfo) as WorldType {
    return scripts.mixin.voidislandcontrol_shared.worldTypeVoidDummy;
  }
}
