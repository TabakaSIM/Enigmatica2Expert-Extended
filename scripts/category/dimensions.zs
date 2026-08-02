#modloaded gamestages ftbquests roidtweaker
#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent.fromTranslation;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

static health_require as float = 30.0f;

// Check health and add game stage allowing to enter nether
function checkAndGrant(player as IPlayer) as void {
  if (player.maxHealth >= health_require || player.health >= health_require)
    grant(player, true);
}

function grant(player as IPlayer, byHealth as bool = false) as void {
  if (player.hasGameStage('skyblock') || player.hasGameStage('healthy')) return;

  player.addGameStage('healthy');
  if (byHealth) {
    player.sendRichTextMessage(fromTranslation(
      'tooltips.dim_stages.healthy_grant',
      health_require as int,
      (health_require / 2.0f + 0.5f) as int
    ));
  }
  player.sendRichTextMessage(fromTranslation('tooltips.dim_stages.healthy_can'));
}

events.register(function (e as mods.zenutils.ftbq.QuestCompletedEvent) {
  if (isNull(e.quest) || isNull(e.quest.tags) || e.quest.tags.length < 1 || !(e.quest.tags has 'cobalt')) return;
  for player in e.notifyPlayers {
    grant(player);
  }
});

events.onPlayerTick(function (e as crafttweaker.event.PlayerTickEvent) {
  // Forge fires this event twice per tick (START and END), run the body only once
  if (e.phase != 'END') return;
  if (e.player.world.remote) return;
  if (e.player.world.worldInfo.worldTotalTime % 10 != 0) return;

  checkAndGrant(e.player);
});

// `notify` is off for the second, defensive check - otherwise the player is told twice
function isForbidTravel(player as IPlayer, dimension as int, notify as bool = true) as bool {
  checkAndGrant(player);
  if (player.creative) return false;

  val isNether = dimension == -1;
  if (player.hasGameStage('skyblock')) {
    // Show message that player playing skyblock and cant visit any dims
    if (!isAllowedDim(dimension)) {
      if (notify) player.sendRichTextMessage(fromTranslation('tooltips.dim_stages.restricted'));
      return true;
    }
  }
  else {
    if (isNether && !player.hasGameStage('healthy')) {
      // Show message that player not healthy anough
      if (notify) {
        player.sendRichTextMessage(fromTranslation(
          'tooltips.dim_stages.healthy',
          health_require as int,
          (health_require / 2.0f + 0.5f) as int
        ));
      }
      return true;
    }
  }

  return false;
}

// Allow listed dimensions and any of RFTools dimensions
static allowedDims as int[] = [
  144, // Compact machines
  -343800852, // Spectre
  2, // Storage Cell
  -2, // Space
  3, // Skyblock
];
function isAllowedDim(dimId as int) as bool {
  if (allowedDims has dimId) return true;
  val providerType = native.net.minecraftforge.common.DimensionManager.getProviderType(dimId);
  if (isNull(providerType)) return false;
  return toString(providerType.getName()) == 'rftools_dimension';
}

events.onEntityTravelToDimension(function (e as crafttweaker.event.EntityTravelToDimensionEvent) {
  if (e.entity.world.remote) return;
  if (!e.entity instanceof IPlayer) return;
  val player as IPlayer = e.entity;
  if (isForbidTravel(player, e.dimension)) e.cancel();
});

// Additional level of protection against unsanctioned traveling methods (like deep dark portal)
events.onPlayerChangedDimension(function (e as crafttweaker.event.PlayerChangedDimensionEvent) {
  if (e.entity.world.remote) return;
  if (e.player.creative || !isForbidTravel(e.player, e.to, false)) return;

  val playerUuid = e.player.uuid;
  val forbidden = e.to;
  val cameFrom = e.from;
  e.player.world.catenation().sleep(20).then(function (world, ctx) {
    // The wrapper captured above can outlive its entity, look the player up again
    val player = server.getPlayerByUUID(playerUuid);
    if (isNull(player) || player.dimension != forbidden) return;
    player.sendRichTextMessage(fromTranslation('tooltips.dim_stages.restricted'));

    // VoidIslandControl is the only thing that knows where a Skyblocker's island is
    if (player.hasGameStage('skyblock')) {
      server.commandManager.executeCommandSilent(server, '/execute ' ~ player.name ~ ' ~ ~ ~ island home');
      return;
    }

    // Everyone else goes back where they came from, on solid ground
    val origin = IWorld.getFromID(cameFrom);
    if (isNull(origin)) return;
    val x = player.posX as int;
    val z = player.posZ as int;
    val ground = origin.getTopBlock(IBlockPos.create(x, 0, z)).y + 1;
    server.commandManager.executeCommandSilent(server,
      '/tpx ' ~ player.name
      ~ ' ' ~ (x + 0.5)
      ~ ' ' ~ (ground < 1 ? origin.seaLevel : ground)
      ~ ' ' ~ (z + 0.5)
      ~ ' ' ~ cameFrom
    );
  }).start();
});
