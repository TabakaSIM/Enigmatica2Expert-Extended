## ✨ New Features

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/700a7a5)🦯Thaumic wonders integration
    > > Contributed by [TabakaSIM](https://github.com/tabakasim)
    >
    > For `thaumic wonders unofficial 2.1.0`
    > 
    > - ✏️ ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicwonders/void_beacon__0.png "Void Beacon") rework - provides vis in large range of chunks, provides warp ward to nearby players  
    > - ✏️ Harder recipe for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicwonders/void_beacon__0.png "Void Beacon")  
    > - ✏️ Added [Primordial Siphon] - works similar to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/void_siphon__0.png "Void Siphon") - this removes RNG drop of primordial pearls  
    > - ✏️ Cheaper ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/void_siphon__0.png "Void Siphon")  
    > - ✏️ Buffed cleansing charm (will remove 1 warp every minute)  
    > - 🔴 Removed ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicwonders/primordial_accretion_chamber__0.png "Primordial Accretion Chamber")  
    > - 🔴 Removed ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicwonders/shimmerleaf_seed__0.png "Shimmerleaf Seed") form ![](https://github.com/Krutoy242/mc-icons/raw/master/i/excompressum/iron_mesh__0.png "Iron Mesh") drop from ![](https://github.com/Krutoy242/mc-icons/raw/master/i/biomesoplenty/white_sand__0.png "White Sand")
  * <img src="https://i.imgur.com/gssj4TT.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0354a2f)🪄`Congrega Mystica` and `Thaumic Tweaker` integration
    > > Contributed by [TabakaSIM](https://github.com/tabakasim)
    >
    > Added lot of integrations related to Thaumcraft and magic mods
    > 
    > Includes changes for:  
    > - `Congreaga mystica`  
    > - `Thaumic tweaker` that replaces `thaumtweaks`
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/58e29ec)🪄Refining rework
    > > Contributed by [MordWincer](https://github.com/mordwincer)
    >
    > - **Changed Refining formula:** 40% to drop a Cluster at level 1, +20% per extra level and +10% per Fortune level.  
    > - **Skimmed Ore Purifier** logic to only convert Clusters to Shards.  
    > - **Made Refining work with Nether and End ore variants** with doubled drops.

## 🐛 Fixes

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/73c07a2)⚒️[Mithminite Hood] no more downgrade Flux Bores
    > Taken from `MeatballCraft` with permission.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4ce99ff)⛏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/additionalcompression/charcoal_compressed__1.png "Double Compressed Charcoal") unable to break with a [Sledge Hammer]
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/264bba4)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/patchouli/guide_book__0__4e4a7cdf.png "Enigmatica2:Expert") fix dupe
  * <img src="https://i.imgur.com/LfS3ibn.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2d5bc45)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/rats/gem_of_ratlantis__0.png "Gem of Ratlantis") not require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/imbuingstation__0.png "Imbuing Station") anymore
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8983670)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__49.png "Organic Brown Dye") not require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/imbuingstation__0.png "Imbuing Station") anymore
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ec24ed5)👑Remove `Omnipotence` silk touch
    > It caused more issues and was more annoying than useful
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6e1760e)💗Descrease scaling based on max health
    > Now vanilla damage sources like Cactus or Fire wont hurt this much when you have huge amount of health.
    > 
    > Was 50% increase now only 10%.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/806af02)🔴Remove `Environmental Materials` and `XTones`
    > These mods added too many similar decorative blocks that have better counterparts in other mods. Instead, you can easily recreate similar blocks using LittleTiles.
    > 
    > The mods themselves have been impossible to use for a year and a half now. If you have been playing in one world for more than a year and a half and your world has buildings made of these blocks, I advise you not to update.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f3da1f9)🗃️Fix entities not dropping custom loot after modpack update
    > fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/434
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/020de23)🤹‍♂️Re-implement experience orbs size using mixin
    > > Contributed by [ZZZank](https://github.com/zzzank)
    >
    > Should have no changes in game
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0fed95c)🪄Migrate Refining enchantment from removed `ThaumTweaks`
    > Since `ThaumTweaks` replaced with `Thaumic Tweaker`, target of mixin should be changed
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8d2931b)🪄Use `Thaumic Tweaker` for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/liquid_death.png "Liquid Death") damage buff
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8209c8e)🛢Fix mineral sampling
    > > Contributed by [ZZZank](https://github.com/zzzank)
    >
    > fix few errors related to "Kick core drill with a hammer" feature

  #### Balance

  * <img src="https://i.imgur.com/UBky50y.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3d456d9)✏Balance mek upgrades
    > > Contributed by [ZZZank](https://github.com/zzzank)
    >
    > In original recipe, Copper consumption is more than 4x the Iron consumption. This change makes it around 2x.

  #### Portal_spread

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1c1e8d8)⛑️Fix portal cant convert Lit ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/redstone_ore__0.png "Redstone Ore")

  #### Quest

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/aea77c2)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/prosperity_ore__0.png "Prosperity Ore") remove mention about planets
    > Since it doesnt spawn on planets

## Mods changes
### 🟢 Added Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/1338/430/30/30/638869986013756191.png"           > |                         [**Roid's Tweaker**](https://www.curseforge.com/minecraft/mc-mods/roid-tweaker)                 <sup><sub>roidtweaker-1.2.1.jar                            </sub></sup><br>Conglomeration of CraftTweaker addons | Bunch of CraftTweaker new methods
<img src="https://media.forgecdn.net/avatars/thumbnails/1358/482/30/30/638882387444615595.png"           > |             [**Thaumic Wonders Unofficial**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders-unofficial)   <sup><sub>thaumicwonders-2.1.3.jar                         </sub></sup><br>An unofficial continuation of Thaumic Wonders. | Maintained fork
<img src="https://media.forgecdn.net/avatars/thumbnails/1430/837/30/30/638927053511180100.png"           > |                         [**ThaumicTweaker**](https://www.curseforge.com/minecraft/mc-mods/thaumictweaker)               <sup><sub>thaumictweaker-1.1.1.jar                         </sub></sup><br>All the Thaumcraft 6 tweaks a tweaker could want. | Maintained fork
<img src="https://media.forgecdn.net/avatars/thumbnails/1430/826/30/30/638927049348150845.png"           > |                       [**Congrega Mystica**](https://www.curseforge.com/minecraft/mc-mods/congrega-mystica)             <sup><sub>CongregaMystica-1.12.2-1.0.5.jar                 </sub></sup><br>The Thaumcraft 6 integration addon. | Better integration
-----------


### 🔴 Removed Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/85/764/30/30/636204523468034489.png"             > |                                 [**Xtones**](https://www.curseforge.com/minecraft/mc-mods/xtones)                       <sup><sub>Xtones-1.2.2.jar                                 </sub></sup><br>The &quot;official&quot; successor to Ztones | Now optional
<img src="https://media.forgecdn.net/avatars/thumbnails/435/800/30/30/637676321059077489.png"            > |                [**Environmental Materials**](https://www.curseforge.com/minecraft/mc-mods/environmental-materials)      <sup><sub>environmentalmaterials-1.12.2-1.0.20.1.jar       </sub></sup><br>Adds a suite of simple building materials. | Now optional
<img src="https://media.forgecdn.net/avatars/thumbnails/151/997/30/30/636608010107140481.png"            > |                            [**MekaTweaker**](https://www.curseforge.com/minecraft/mc-mods/mekatweaker)                  <sup><sub>mekatweaker-1.12-1.2.0.jar                       </sub></sup><br>Add Mekanism Gas and Infuser Type with CraftTweaker | Replaced by `Roids Tweaker`
<img src="https://media.forgecdn.net/avatars/thumbnails/194/704/30/30/636874517756132934.png"            > |                        [**Thaumic Wonders**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders)              <sup><sub>thaumicwonders-1.8.4.jar                         </sub></sup><br>Create wonders with Thaumcraft 6! | Replaced by a fork
<img src="https://media.forgecdn.net/avatars/thumbnails/200/30/30/256/636912443531522653.png"            > |                  [**Random Things Tweaker**](https://www.curseforge.com/minecraft/mc-mods/random-things-tweaker)        <sup><sub>rttweaker-1.2.jar                                </sub></sup><br>Adds crafttweaker support to the imbuing station and anvil and other tweaks | Replaced by `Roids Tweaker`
<img src="https://media.forgecdn.net/avatars/thumbnails/476/617/30/30/637770076117628954.png"            > |                            [**ThaumTweaks**](https://www.curseforge.com/minecraft/mc-mods/thaumtweaks)                  <sup><sub>thaumtweaks-0.3.5.4.jar                          </sub></sup><br>Small addon to make Thaum 6 more fair. | Replaced by a fork
<img src="https://media.forgecdn.net/avatars/thumbnails/330/801/30/30/637458866042247400.png"            > |               [**CraftTweaker Integration**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker-integration)     <sup><sub>ctintegration-1.8.0.jar                          </sub></sup><br>CraftTweaker is not just a recipe changer. | Replaced by `Roids Tweaker`
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.25.8</nobr><br><nobr>zenutils-1.25.11</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/312/949/30/30/637407315722572617.png"            > |                            [**MixinBooter**](https://www.curseforge.com/minecraft/mc-mods/mixin-booter)                | <nobr>!mixinbooter-10.6</nobr><br><nobr>!mixinbooter-10.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.29.7</nobr><br><nobr>HadEnoughItems_1.12.2-4.29.8</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/551/59/30/30/637888242565991470.png"             > |                              [**ModularUI**](https://www.curseforge.com/minecraft/mc-mods/modularui)                   | <nobr>modularui-2.4.3</nobr><br><nobr>modularui-2.5.0-rc6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/557/657/30/30/637904734114975779.png"            > |                  [**Inventory Bogo Sorter**](https://www.curseforge.com/minecraft/mc-mods/inventory-bogosorter)        | <nobr>bogosorter-1.4.9</nobr><br><nobr>bogosorter-1.4.11</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/782/581/30/30/638129648817875687.png"            > |                                [**Fixeroo**](https://www.curseforge.com/minecraft/mc-mods/xp-orb-clump)                | <nobr>Fixeroo-2.3.6b</nobr><br><nobr>Fixeroo-2.3.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1363/536/30/30/638885540715738013.png"           > |                         [**PackagedAstral**](https://www.curseforge.com/minecraft/mc-mods/packagedastral)              | <nobr>PackagedAstral-1.12.2-1.0.4.22</nobr><br><nobr>PackagedAstral-1.12.2-1.0.4.23</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/951/894/30/30/638441639917328756.png"            > |                          [**TheOneSmeagle**](https://www.curseforge.com/minecraft/mc-mods/theonesmeagle)               | <nobr>TheOneSmeagle-1.12-1.1.2</nobr><br><nobr>TheOneSmeagle-1.12-1.1.5</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1304/81/30/30/638847932766552243.png"            > |                                  [**Fugue**](https://www.curseforge.com/minecraft/mc-mods/fugue)                       | <nobr>+Fugue-0.20.4</nobr><br><nobr>+Fugue-0.21.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1128/28/30/30/638686145366913611.jpg"            > |                            [**Curvy Pipes**](https://www.curseforge.com/minecraft/mc-mods/curvy-pipes)                 | <nobr>curvy_pipes-1.12.2-1.12.6</nobr><br><nobr>curvy_pipes-1.12.2-1.13.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1227/909/30/30/638805180111764688.png"           > |                        [**Crash Assistant**](https://www.curseforge.com/minecraft/mc-mods/crash-assistant)             | <nobr>!!!CrashAssistant-forge-1.12.2-1.9.15</nobr><br><nobr>!!!CrashAssistant-forge-1.12.2-1.10.10</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1176/204/30/30/638748608591942674.png"           > |                       [**RandomComplement**](https://www.curseforge.com/minecraft/mc-mods/random-complement)           | <nobr>random_complement-1.6.7</nobr><br><nobr>random_complement-1.7.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1223/434/30/30/638801642158504721.png"           > |                       [**Tinkers' Antique**](https://www.curseforge.com/minecraft/mc-mods/tinkers-antique)             | <nobr>TinkersAntique-1.12.2-2.13.0.202</nobr><br><nobr>TinkersAntique-1.12.2-2.13.0.203</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1409/140/30/30/638913115744696491.png"           > |                           [**Armored Arms**](https://www.curseforge.com/minecraft/mc-mods/armored-arms)                | <nobr>ArmoredArms-v1.3.0-release</nobr><br><nobr>ArmoredArms-v1.3.2-release</nobr>
-----------
