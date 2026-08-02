#modloaded voidislandcontrol gamestages zenutils roidtweaker
#priority -200
#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent.fromTranslation;
import native.com.bartz24.voidislandcontrol.api.IslandManager;
import native.com.bartz24.voidislandcontrol.api.event.IslandCreateEvent;

function makeSkyblocker(player as IPlayer) as void {
  if (player.hasGameStage('skyblock')) return;
  scripts.skyblock.addGameStage.grant(player);
  player.sendRichTextMessage(fromTranslation('e2ee.skyblock.now_skyblocker'));
}

// `/island create` reports its failures with a chat message instead of an error, and Forge's
// CommandEvent fires before the command even runs. The only reliable proof that a player really
// became a Skyblocker is VoidIslandControl handing them an island.
events.register(function (e as IslandCreateEvent) {
  if (isNull(e.getIslandPosition())) return;
  val player = server.getPlayerByUUID(toString(e.getPlayerUUID()));
  if (isNull(player)) return;
  makeSkyblocker(player);
});

// On a dedicated server VoidIslandControl creates the island itself on login, without going
// through the command - so that path grants nothing on its own.
events.onPlayerLoggedIn(function (e as crafttweaker.event.PlayerLoggedInEvent) {
  if (e.player.world.remote || e.player.dimension != 3 || e.player.hasGameStage('skyblock')) return;

  val playerUuid = e.player.uuid;
  e.player.world.catenation().sleep(20).run(function (world, context) {
    val player = server.getPlayerByUUID(playerUuid);
    if (isNull(player) || player.dimension != 3) return;
    if (!IslandManager.playerHasIsland((player.native as native.net.minecraft.entity.player.EntityPlayer).getUniqueID())) return;
    makeSkyblocker(player);
  }).start();
});
