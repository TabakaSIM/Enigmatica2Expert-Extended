#modloaded zenutils patchouli roidtweaker
#priority -200
#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

// Overworld height that sends a player to Skyblock
static SKY_TP_HEIGHT as double = 257.0;

// Height a player appears at in Skyblock. Islands are far above, so a visitor either commits
// with `/island create` (which teleports them) or drops back into the void.
static SKY_ARRIVAL_HEIGHT as double = 2.0;

// Skyblock depth that sends a visitor back to the Overworld.
// Must stay above -64, where the void starts dealing damage.
static VOID_EXIT_HEIGHT as double = -32.0;

static requiredItem as IItemStack = <patchouli:guide_book>.withTag({ 'patchouli:book': 'patchouli:e2e_e' });
static playersNoted as bool[string] = {};
static lastTpTick as long[string] = {};

events.onPlayerTick(function (e as crafttweaker.event.PlayerTickEvent) {
  // Forge fires this event twice per tick (START and END), run the body only once
  if (e.phase != 'END') return;

  val player = e.player;
  if (
    player.world.remote
    || player.world.worldInfo.worldTotalTime % 2 != 0
  ) {
    return;
  }

  if (player.dimension == 0
    && player.posY >= SKY_TP_HEIGHT
  ) {
    tpToSky(player);
    return;
  }

  if (player.dimension == 3
    && player.posY <= VOID_EXIT_HEIGHT
  ) {
    tpFromSky(player);
  }
});

// A teleport needs a few ticks to settle. Without a cooldown a silently failing `/tpx`
// would be retried - along with its potions and messages - every other tick.
function isOnCooldown(player as IPlayer) as bool {
  val now = player.world.worldInfo.worldTotalTime;
  val last = lastTpTick[player.uuid];
  if (!isNull(last) && (now - last as long) < 100) return true;
  lastTpTick[player.uuid] = now;
  return false;
}

function tpToSky(player as IPlayer) as void {
  // Show warning message if player doesnt hold book but only once per server restart
  if (isNull(player.currentItem) || !(requiredItem has player.currentItem)) {
    if (isNull(playersNoted[player.uuid])) {
      playersNoted[player.uuid] = true;
      player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromData([{
        translate: 'e2ee.skyblock.need_item',
        with     : [
          scripts.lib.tellraw.itemObj(requiredItem, 'gold'),
          SKY_TP_HEIGHT as int,
        ] }]));
    }
    return;
  }

  if (isOnCooldown(player)) return;

  player.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(600, 0));
  server.commandManager.executeCommandSilent(server,
    '/tpx ' ~ player.name ~ ' ' ~ player.posX ~ ' ' ~ SKY_ARRIVAL_HEIGHT ~ ' ' ~ player.posZ ~ ' 3'
  );

  // Show message about staying in skyblock forever.
  // The player is in another world by then, so look them up on the server, not in this world.
  val playerUuid = player.uuid;
  player.world.catenation().sleep(60).run(function (world, context) {
    val p = server.getPlayerByUUID(playerUuid);
    if (isNull(p)) return;
    p.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation('e2ee.skyblock.stay_forever'));
  }).start();
}

function tpFromSky(player as IPlayer) as void {
  if (player.hasGameStage('skyblock')) return;
  if (isOnCooldown(player)) return;

  // Land on the ground. Slowfall only slows the fall while it lasts, so no sane duration
  // of it survives a ~190 block drop from the top of the Overworld.
  val overworld = IWorld.getFromID(0);
  val x = player.posX as int;
  val z = player.posZ as int;
  val ground = overworld.getTopBlock(IBlockPos.create(x, 0, z)).y + 1;

  player.addPotionEffect(<potion:cyclicmagic:potion.slowfall>.makePotionEffect(100, 0));
  server.commandManager.executeCommandSilent(server,
    '/tpx ' ~ player.name
    ~ ' ' ~ (x + 0.5)
    ~ ' ' ~ (ground < 1 ? overworld.seaLevel : ground)
    ~ ' ' ~ (z + 0.5)
    ~ ' 0'
  );
}
