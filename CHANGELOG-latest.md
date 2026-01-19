## 🐛 Fixes

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a70f23c)♻️Fix UniversalTweaks mixin for RandomThings spectre tp bug
    > Comes out, that "true" means "false", and "false" means "true".
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9808d0a)⛏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/plustic/mirioningot__0.png "Mirion Ingot") swap +2 modifier trait to TConEvo
    > Previous trait was bugged and doesnt allow stacking modifier bonux
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/56ffd02)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/omniwand/wand__0.png "Omniwand") add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ae2stuff/wireless_kit__0.png "Wireless Setup Kit")
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/13db48e)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/astralsorcery/blockcustomore__0.png "Rock Crystal Ore") remove from ![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/infinity_furnace__0.png "Infinity Furnace") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rats/rat_upgrade_ore_doubling__0.png "Rat Upgrade: Ore Doubling")
    > ..since this is impossible to acquire this block as item
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/027165f)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/magic_beans__0.png "Magic Beans") unobtainable in skyblock
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fc261c6)🌍Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/stone_porous__0.png "Porous Stone") Block drops
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9ec34e0)💙![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator") fix Twilight Forest gives too much difficulty on replication
    > It was +40 diff from any replication, allowing to speedrun Omnipotence
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9a04a6c)🔥Fix silent crash on building mobs
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9ddde1d)🕊️Add Troll mob build recipe
    > To allow Peaceful Skyblockers 100% quests
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5ea49e5)🦆Add item pickup delay on ![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/conglomerate_of_life__0__a671482.png "Conglomerate Of Life") drops
    > This should help to automate cats with geese
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ce55dcb)🧩Disable "Boss Bars" feature of EnderModpackTweaks
    > Since texture are broken

  #### Balance

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/39e76b2)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/luminousblock__14.png "Red Luminous Block") make them actually emit light
    > For some reason, blocks named "Luminous" wasnt luminous before.
  * <img src="https://i.imgur.com/1Aw2ICT.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ecffad6)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/luminousblock__14.png "Red Luminous Block") x32 cheaper
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a18d8c6)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__58.png "Crop Harvester") cheaper
  * <img src="https://i.imgur.com/VKUEb4f.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/814cf78)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_impulse_hopper__0.png "Impulse Hopper") cheaper
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6ee4dcd)✏️Reduce burn time of compressed blocks
    > Now comressed burnable blocks factor is x2 of previous tier.  
    > This means, Compressed Charoal Block will produce same burn time as 2 Charcoal Blocks, Double compressed = 4 charcoal blocks
    > 
    > This change require, because stack of Coal/Charcoal/Wood have too much possible burn time, which promote stacking of low-tier fuel instead of progressing better alternatives.
    > 
    > Affected blocks: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/cropsugarcane_compressed__2.png "Triple Compressed Sugar Cane")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/cropsugarcane_compressed__3.png "Quadruple Compressed Sugar Cane")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/cropsugarcane_compressed__4.png "Quintuple Compressed Sugar Cane")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/rodblaze_compressed__1.png "Double Compressed Blaze")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/rodblaze_compressed__2.png "Triple Compressed Blaze")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/logwood_compressed__0.png "Single Compressed Wood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/logwood_compressed__0.png "Single Compressed Wood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/logwood_compressed__1.png "Double Compressed Wood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/logwood_compressed__2.png "Triple Compressed Wood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/coal_compressed__1.png "Double Compressed Coal")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/coal_compressed__2.png "Triple Compressed Coal")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/charcoal_compressed__1.png "Double Compressed Charcoal")![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/charcoal_compressed__2.png "Triple Compressed Charcoal")

  #### Configs

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c04e21a)💻![](https://github.com/Krutoy242/mc-icons/raw/master/i/opencomputers/tool__5.png "Nanomachines") add Warp Ward effect

  #### Quest

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/341334e)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/draconium_capacitor__1.png "Draconic Flux Capacitor") fix description
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/be835b4)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/iceandfire/fire_dragon_blood__0.png "Fire Dragon Blood") add reward and change task
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0454ff0)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/engineersdecor/halfslab_rebar_concrete__0.png "Rebar Concrete Slice") turn into dev/null/ in Common chest
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c68e3cc)📖IC2 Storage Boxes add to "Storage" quests

## Mods changes
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/727/100/30/30/638080208599452100.png"            > |            [**MmmMmmMmmMmm (Target Dummy)**](https://www.curseforge.com/minecraft/mc-mods/mmmmmmmmmmmm)                | <nobr>MmmMmmMmmMmm-1.12-2.0.5</nobr><br><nobr>MmmMmmMmmMmm-1.12-2.0.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.26.11</nobr><br><nobr>zenutils-1.26.13</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/551/59/30/30/637888242565991470.png"             > |                              [**ModularUI**](https://www.curseforge.com/minecraft/mc-mods/modularui)                   | <nobr>modularui-3.0.6</nobr><br><nobr>modularui-3.0.8</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/557/657/30/30/637904734114975779.png"            > |                  [**Inventory Bogo Sorter**](https://www.curseforge.com/minecraft/mc-mods/inventory-bogosorter)        | <nobr>bogosorter-1.5.0</nobr><br><nobr>bogosorter-1.6.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/907/322/30/30/638358340959112160.png"            > |                               [**Red Core**](https://www.curseforge.com/minecraft/mc-mods/red-core)                    | <nobr>!Red-Core-MC-1.8-1.12-0.7</nobr><br><nobr>!Red-Core-MC-1.8-1.12-0.7.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/890/122/30/30/638330362828386354.png"            > |                               [**Omniwand**](https://www.curseforge.com/minecraft/mc-mods/omniwand)                    | <nobr>omniwand-1.12.2-2.0.2</nobr><br><nobr>omniwand-1.12.2-2.0.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1304/81/30/30/638847932766552243.png"            > |                                  [**Fugue**](https://www.curseforge.com/minecraft/mc-mods/fugue)                       | <nobr>+Fugue-0.22.6</nobr><br><nobr>+Fugue-0.22.9</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1040/744/30/30/638566774921391570.png"           > |               [**Magiculture Integrations**](https://www.curseforge.com/minecraft/mc-mods/magiculture-integrations)    | <nobr>magicultureintegrations-1.12.2-2.2.6</nobr><br><nobr>magicultureintegrations-1.12.2-2.2.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1358/482/30/30/638882387444615595.png"           > |             [**Thaumic Wonders Unofficial**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders-unofficial)  | <nobr>thaumicwonders-2.2.2</nobr><br><nobr>thaumicwonders-2.2.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1409/140/30/30/638913115744696491.png"           > |                           [**Armored Arms**](https://www.curseforge.com/minecraft/mc-mods/armored-arms)                | <nobr>ArmoredArms-v1.4.2-1.12.2-release</nobr><br><nobr>ArmoredArms-v1.4.4-1.12.2-release</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1542/324/30/30/639001128201473190.png"           > |                              [**BloomTech**](https://www.curseforge.com/minecraft/texture-packs/bloomtech)             | <nobr>BloomTech-1.0.0.zip</nobr><br><nobr>BloomTech-1.1.0.zip</nobr>
-----------
