#modloaded zenutils
#priority 10000
#reloadable

import crafttweaker.command.ICommandSender;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.server.IServer;
import crafttweaker.text.ITextComponent;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.ZenUtilsCommandSender;
import native.net.minecraft.entity.player.EntityPlayerMP;

// A ZenCommand `sender` is always a ZenUtilsCommandSender wrapper, never an
// IPlayer, so `sender instanceof IPlayer` is always false. Unwrap to the
// vanilla sender to tell a real player apart from console/command-block
// senders. `.native` resolves only on ICommandSender (the type CraftTweakerMC
// has a caster for), so upcast first.
function isPlayerSender(sender as ZenUtilsCommandSender) as bool {
  val ctSender as ICommandSender = sender;
  return ctSender.native instanceof EntityPlayerMP;
}

function senderAsPlayerOrNull(sender as ZenUtilsCommandSender) as IPlayer {
  return isPlayerSender(sender)
    ? CommandUtils.getCommandSenderAsPlayer(sender)
    : null;
}

function resolveTargetPlayer(server as IServer, sender as ZenUtilsCommandSender, args as string[], index as int) as IPlayer {
  if (args.length > index) {
    return CommandUtils.getPlayer(server, sender, args[index]);
  }
  return senderAsPlayerOrNull(sender);
}

function sendRichOrPlain(sender as ZenUtilsCommandSender, richData as IData, plainText as string) as void {
  val player = senderAsPlayerOrNull(sender);
  if (!isNull(player)) {
    player.sendRichTextMessage(ITextComponent.fromData(richData));
  }
  else {
    sender.sendMessage(plainText);
  }
}

function richToPlain(data as IData) as string {
  val list = data.asList();
  if (!isNull(list)) {
    var result = '';
    for element in list {
      result ~= richToPlain(element);
    }
    return result;
  }

  val raw = data.asString();
  if (raw.startsWith('{')) {
    val text = data.memberGet('text');
    if (!isNull(text)) {
      var result = text.asString();
      val extra = data.memberGet('extra');
      if (!isNull(extra)) {
        result ~= richToPlain(extra);
      }
      return result;
    }
  }

  return raw;
}
