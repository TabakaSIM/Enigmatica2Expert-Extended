## ✨ New Features

  * <img src="https://i.imgur.com/pBkTNKX.png" align=right> <img src="https://i.imgur.com/ZFn70KM.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bcd060a)🪄🚂Add magical steam processing
    > > Contributed by [Voxxynn](https://github.com/voxxynn)
    >
    > Adds 5 grades of magical catalysts used to compress steam into more energy dense variants.
    > 
    > The first four tiers are based on astral sorcery, botania, blood magic, and thaumcraft respectively, with the ultimate tier having a 'creative -style' recipe requiring heavy investment in multiple mods.
    > 
    > Each catalyst has a basic recipe returning a 10% durability version, and a slightly more complex recipe for the full durability catalyst, except for the ultimate catalyst, which has infinite uses.
    > 
    > Steam compression doubles energy density of steam, and provides a 10% bonus to the steams energy value on top.  
    > Thus, the full 5-step catalyzation process takes 32 buckets of input steam and outputs 1 bucket of magic steam worth as much energy as 48.  
    > Forge steam, IC2 superheated steam, and Nuclearcraft HP steam are currently supported as inputs, with appropriate compression ratios based on their fuel values.
    > 
    > Compression tiers can be skipped, but doing so incurs an n^2 penalty to conversion ratio with n being tiers skipped. (ie converting base steam directly to t4 results in a loss of 93% compared to following the chain "correctly."  
    > The Ultimate catalyst can only be used to convert already magical steams.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d7c3777)⌨️Improve `/cofh clearblocks` command
    > Only for OP players.  
    > Now can be used with `inventory` keyword to clear blocks based on current player inventory.
    > 
    > Use as `/cofh clearblocks <x> <y> <z> <radius> <dimension> inventory`
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0aae22c)⛏️Add `Antimagic` trait to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/environmentaltech/lonsdaleite__0.png "Lonsdaleite") armor material
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ccf8f49)⛏️Add `Darkside` trait to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/crafting__38.png "Soulium Ingot") armor material
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/11f6f26)⛏️Add `Vaporizer` trait to [Demon Metal]
    > Clear liquids around breaked block or hit entity. Replaces and removes ![](https://github.com/Krutoy242/mc-icons/raw/master/i/cyclicmagic/ender_water__0__4e4b3a6f.png "Antimatter Evaporator").
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6708f94)⛏️New `Faraday` [Aluminum Ingot] armor trait
    > Any piece made of this material grants immunity to electric shock.
  * <img src="https://i.imgur.com/dEviWg0.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/58ed46d)✏️Add high-tech ![](https://github.com/Krutoy242/mc-icons/raw/master/i/actuallyadditions/item_misc__21.png "Biomass") recipe

  #### Perf_command

  * <img src="https://i.imgur.com/bOcng7Q.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/78e8f7a)✈️Add `/perf claimed`
    > This command show all the claimed chunks with ability to teleport players.
    > 
    > Useful for server owners to find places of interest.

## 🐛 Fixes

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/627225d)⛏️Buff `lifecycle` trait x10 times
    > Now restore ♥♥♥♥♥ for each 1 durability point tool loss
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a2b277f)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/water_source__0.png "Infinite Water Source") remove from usage to allow "no diff challenge"
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9a3de6f)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/crafting__24.png "Mystical Feather") remove from the game
    > It was useless microcrafting ingredient that just increase crafting table steps.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a187107)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_slice_and_splice__0.png "Slice'N'Splice") allow using TCon Kama instead of shears
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bf2622a)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__76c0e963.png "Pech Forager Soul") has default trades
    > I forgot to migrate `ThaumTweaks` ➜ `ThaumicTweaker`
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3efcada)💙![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator") disallow to use ![](https://github.com/Krutoy242/mc-icons/raw/master/i/cyclicmagic/placer_block__0.png "Block Placer") to get 0 difficulty
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/faa0f11)💙Do not account dimension difficulty extra loot boxes
    > It feels buggy when you cant get +1 box in the Twilight Forest...
    > 
    > Related 7c4147331ebfcfd125406e5a385a2c15168d07b2
  * <img src="https://i.imgur.com/le3TO8i.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1579bf0)📖Add methods of `Inworld smelting` for MA quest

  #### Balance

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8ee302c)🔨Increase chance of better TCon materials in Artifact mob equipment
    > Now you would be able to see more variations of the parts of armor/weapon that Zombies and other mobs held. More chance to get something valuable from Artifact drop.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1d7bea5)🖽 LittleTiles: Buff ![](https://github.com/Krutoy242/mc-icons/raw/master/i/littletiles/hammer__0.png "Little Hammer") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/littletiles/chisel__0__e47ec850.png "Little Chisel")
    > Changes:  
    > - maxAffectedBlocks 32 => 128  
    > - maxEditBlocks 128 => 256  
    > - recipeBlocksLimit 16 => 128

  #### Info

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ffa314f)📝Add tip about TCon crook and Red Orchid

  #### Portal_spread

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/07261f1)⛑️![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/piston__0__c44316ae.png "Piston") remove from conversion
    > It was prevent easy automation in the range of the portal

  #### Quest

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4036db1)📖Fix players doesnt get +1 lootboxes with `0` difficulty
    > Revert of 2938e927b02c76bd62d48f711100116a8e0141a1


