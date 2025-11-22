## ⚡ Performance Improvements

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/43c066f)⚡Fix constant TPS lag caused by villagenames
    > Related: https://legacy.curseforge.com/minecraft/mc-mods/village-names/issues/18
    >
    > Thanks https://github.com/WaitingIdly for helping with mixin code.

## 🐛 Fixes

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/317a79d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersivepetroleum/material__0.png "Bitumen") add as Syngas fuel
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e835c69)📔Add note in crash report about incompat with `essentials`
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fd4e402)🥾Fix High Stride TCon modifier not working
    > MIA breaking step height changes to implement its own step height control based on player size.  
    > Now size wont change player step height, but High Stride would work again.
    > 
    > Related https://github.com/SokyranTheDragon/Minor-Integrations-and-Additions-MIA-/issues/44
    > 
    > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/345
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4de06e1)🪄Fix Infusion Claw research entry
    > > Contributed by [TabakaSIM](https://github.com/tabakasim)
    >

  #### Configs

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8b07798)🧩Migrate HUD caching to mod `Gnetum`
    > This should fix Xaero Waypoints UI lag

  #### Quest

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9b02a5d)📖Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/materials__14.png "Reinforcement") "Format Error" text

## Mods changes
### 🟢 Added Mods

Icon | Summary | Reason
----:|:--------|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/200/673/30/30/636914940710758684.png"            > |                          [**Village Names**](https://www.curseforge.com/minecraft/mc-mods/village-names)                <sup><sub>VillageNames-1.12.2-4.4.13.jar                   </sub></sup><br>Generate names for villages and villagers, as well as for other entities and structures. | Could be returned now, when lag issue was fixed.
<img src="https://media.forgecdn.net/avatars/thumbnails/1467/756/30/30/638952634897811631.png"           > |                                 [**Gnetum**](https://www.curseforge.com/minecraft/mc-mods/gnetum)                       <sup><sub>gnetum-1.3.2.jar                                 </sub></sup><br>Distribute HUD updates over multiple frames to improve performance | Same thing as `HUD Caching` option from StellarCore mod, but without waypoints glotches.
<img src="https://media.forgecdn.net/avatars/thumbnails/1404/483/30/30/638910270928010784.png"           > |                           [**MorphOverlay**](https://www.curseforge.com/minecraft/mc-mods/morphoverlay)                 <sup><sub>morphoverlay-1.0.1.jar                           </sub></sup><br>Addon for Akashic Tome and Morph-O-Tools that shows an overlay on morphed items | Marking Akashic Tome rn, but not working with Wand yet.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/1362/814/30/30/638885115958149175.png"           > |                           [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto)                | <nobr>PackagedAuto-1.12.2-1.0.23.71</nobr><br><nobr>PackagedAuto-1.12.2-1.0.23.72</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.26.2</nobr><br><nobr>zenutils-1.26.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/329/782/30/30/637455985217160421.png"            > |                    [**Quark: RotN Edition**](https://www.curseforge.com/minecraft/mc-mods/quark-rotn-edition)          | <nobr>QuarkRotN-r1.6-190</nobr><br><nobr>QuarkRotN-r1.6-191</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.29.9</nobr><br><nobr>HadEnoughItems_1.12.2-4.29.11</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1482/227/30/30/638963404721998907.png"           > |                        [**Crash Assistant**](https://www.curseforge.com/minecraft/mc-mods/crash-assistant)             | <nobr>!!!CrashAssistant-forge-1.12.2-1.10.19</nobr><br><nobr>!!!CrashAssistant-forge-1.12.2-1.10.22</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1223/434/30/30/638801642158504721.png"           > |                       [**Tinkers' Antique**](https://www.curseforge.com/minecraft/mc-mods/tinkers-antique)             | <nobr>TinkersAntique-1.12.2-2.13.0.203</nobr><br><nobr>TinkersAntique-1.12.2-2.13.0.204</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1358/482/30/30/638882387444615595.png"           > |             [**Thaumic Wonders Unofficial**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders-unofficial)  | <nobr>thaumicwonders-2.2.0</nobr><br><nobr>thaumicwonders-2.2.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1430/826/30/30/638927049348150845.png"           > |                       [**Congrega Mystica**](https://www.curseforge.com/minecraft/mc-mods/congrega-mystica)            | <nobr>CongregaMystica-1.12.2-1.0.6</nobr><br><nobr>CongregaMystica-1.12.2-1.0.8</nobr>
-----------
