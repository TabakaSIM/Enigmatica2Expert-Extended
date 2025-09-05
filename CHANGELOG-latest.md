## ⚡ Performance Improvements

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2c2e4a4)⚡Disable generation of removed ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/machineblock2__5.png "Precision Sawmill") recipes
    > This will speed up game load on 3-6 seconds.
    > 
    > This performance improvment was already implemented here 51a1ddb78e2d40e75b7c7afd403153daffc49998, but was breaken here efd5f64b4fa82f601dafe662290c5f3cb1032c25
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/70f6644)⚡Disable HammerLib web requests
    > Originally, it protect mods from being downloaded from 3d party sources, but since E2EE is CurseForge mod, its not necessary.
    > 
    > This fix problem when in rare circumstances HammerLib caused 20 seconds game stall.
    > 
    > Related: https://github.com/dragon-forge/HammerLib/issues/66
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e93e555)⚡Remove IE Orevein map villagers
    > They caused 1-3 seconds load and sell Ore Vein places, which already easy and fast to obtain with a drill.
    > 
    > This performance improvment was already implemented here 1cf9765f75222634e439d6f66a5c7153704be647, but was broken here efd5f64b4fa82f601dafe662290c5f3cb1032c25

## ✨ New Features

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/89a14b8)🌎`Survivor` game mode (WIP)
    > - Generate all required ore and resources on the `Asteroid Belt` to start play here  
    > - At special fluid interactions with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/vitrifiedsand__0.png "Vitrified Sand").  
    > - Change ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/vitrifiedsand__0.png "Vitrified Sand") drop  
    > - Add some low-level ingredients for high-level machines such as Advanced Rocketry Multiblocks.  
    > - Change "Morphite" mechanics (still undocumented)  
    > - Change Curvy Pipes recipes to QMD isotopes  
    > - Add STC feature
    > 
    > This is WIP feature and not documented properly yet.
  * <img src="https://i.imgur.com/0fnb5m0.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/839ffd0)💧Allow ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/astralsorcery.liquidstarlight.png "Liquid Starlight") work with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/ingredients__8.png "Upgrade Mining")
    > Implemented by migrate AS fluid interactions through `fluidintetweaker`
    > 
    > Idea from the modpack `IsolatedCrystal3`.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/12c7fa6)🔨![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/materials__14.png "Reinforcement") now doubles durability each level
    > The `Reinforcement` modifier formula has been changed.  
    > It still provides a chance to not use durability. Now, each level halves the chance of using durability, starting at 50 on level 1.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3b4c34a)🤵Enable Boss Bar EMT feature
  * <img src="https://i.imgur.com/lQkQloX.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1960f65)🥌Cleanup some crushers
    > There is too much crushers in the modpack. Removing least popular ones will reduce JEI cluttering and slightly increase performance.
    > 
    > - `XU2 Crusher`, `ID Mechanical Squeezer` completely removed  
    > - `AS Grindstone` will be stripped from all the excess recipes, leaving only mandatory AS ones  
    > - `IE Crusher` work x2 faster and consume x10 less energy  
    > - `Mek Enrichment` stripped from all recipes that `Mek Crusher` already have
    > 
    > This changes was voted by E2EE discord community

## 🐛 Fixes

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/52f9df1)🐦Fix crash on wrong ![](https://github.com/Krutoy242/mc-icons/raw/master/i/exnihilocreatio/item_seed_rubber__0.png "Rubber Tree Seed") usage
    > Thanks @WaitingIdly for help find correct mixin target
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/779918c)👑Discrease `omnipotent` vertical boost
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a7335e3)💗Scaling Health: Change Health increase to non-linear
    > Fix a bug that doesnt apply non-linear health increase of mobs since `v1.44.0` for almost a year...
    > 
    > When player reach 100 difficulty, Zombies should be only ~25 HP, not 60 as it sadly was in 2025.
    > 
    > This mechanic was broken here: efd5f64b4fa82f601dafe662290c5f3cb1032c25
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0c245b2)💡![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/thermionic_tubes__9.png "Emerald Electron Tube")![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/thermionic_tubes__7.png "Blazing Electron Tube") fix speed and power consumption
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/21e4bf2)📝Fix some tooltips have "format error"
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/af81f15)🔨Remove `grinding` trait and `Heavy Metal` TCon material
    > Heavy Metal is an unfinished, inconvenient and incomprehensible material. It was created to realize my dream of jumping on blocks so that they would crack and break. But some nonsense came out.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2430861)🔨Remove `TCon disassembling` feature
    > This feature allowed you to recycle damaged TCon tools with weird crafting table recipe.
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a2339f6)Rare script error on placing RFTools cells

  #### Balance

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6c67408)☢️Reduce all NC machines power usage by 50%
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a7df261)✏️Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/exnihilocreatio/block_end_cake__0.png "End Cake") recipe
    > RandomThings End Portal should be used instead
  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/29a00ce)🔦Undo ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/torch__0.png "Torch") nerf
    > Over the many years I've worked on E2EE, my understanding of what makes a good modpack has constantly grown. I now believe that it is far more interesting for players when vanilla mechanics are expanded upon-that is, when more ways to use them are introduced and the mechanic is continued rather than replaced.
    > 
    > Therefore, I've come to realize that nerfing vanilla torches only restricted a mechanic, instead of expanding upon it.
    > 
    > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/522

  #### Configs

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/445a882)🏋️Makealmost all `rftools` and `thaumcraft` blocks carryable

  #### Docs

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7db04ee)📝Make mek factory tooltip little shorter

  #### Gear

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/60925c6)🔨Nerf ![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania/livingwood__0.png "Livingwood") little more
    > And add `Modifiable II` to Alpha Fur

  #### JEI

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e8e695d)📝Sort JEI categories

  #### Quest

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a6c63d9)📖Add x2 `Mythic` crates into `Mythic` crate

  #### Worldgen

  * [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c600506)🌍Disable Lush Caves in space


## Mods changes
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/727/100/30/30/638080208599452100.png"            > |            [**MmmMmmMmmMmm (Target Dummy)**](https://www.curseforge.com/minecraft/mc-mods/mmmmmmmmmmmm)                | <nobr>TestDummy2-2.0.4</nobr><br><nobr>MmmMmmMmmMmm-1.12-2.0.5</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/142/108/30/30/636546700830987709.png"            > |                           [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker)                | <nobr>CraftTweaker2-1.12-4.1.20.707</nobr><br><nobr>CraftTweaker2-1.12-4.1.20.709</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1362/814/30/30/638885115958149175.png"           > |                           [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto)                | <nobr>PackagedAuto-1.12.2-1.0.21.68</nobr><br><nobr>PackagedAuto-1.12.2-1.0.23.71</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1362/816/30/30/638885116793099467.png"           > |                     [**PackagedExCrafting**](https://www.curseforge.com/minecraft/mc-mods/packagedexcrafting)          | <nobr>PackagedExCrafting-1.12.2-1.0.3.32</nobr><br><nobr>PackagedExCrafting-1.12.2-1.0.3.33</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1044/516/30/30/638572074817465930.webp"          > |         [**MakeUp - Ultra Fast \| Shaders**](https://www.curseforge.com/minecraft/shaders/makeup-ultra-fast-shader)    | <nobr>MakeUp-UltraFast-9.3c.zip</nobr><br><nobr>MakeUp-UltraFast-9.3d.zip</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.28.1</nobr><br><nobr>HadEnoughItems_1.12.2-4.29.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/538/146/30/30/637862893538783773.png"            > |                          [**JEI Utilities**](https://www.curseforge.com/minecraft/mc-mods/jei-utilities)               | <nobr>JEI-Utilities-1.12.2-0.2.12</nobr><br><nobr>JEI-Utilities-1.12.2-0.2.13</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/641/454/30/30/638043757664856777.png"            > |                       [**Universal Tweaks**](https://www.curseforge.com/minecraft/mc-mods/universal-tweaks)            | <nobr>UniversalTweaks-1.12.2-1.15.2</nobr><br><nobr>UniversalTweaks-1.12.2-1.16.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1111/53/30/30/638662497025737758.png"            > |                        [**Patchouli Books**](https://www.curseforge.com/minecraft/mc-mods/patchouli-books)             | <nobr>patchoulibooks-0.2.6</nobr><br><nobr>patchoulibooks-0.2.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/1128/28/30/30/638686145366913611.jpg"            > |                            [**Curvy Pipes**](https://www.curseforge.com/minecraft/mc-mods/curvy-pipes)                 | <nobr>curvy_pipes-1.12.2-1.12.4</nobr><br><nobr>curvy_pipes-1.12.2-1.12.6</nobr>
-----------
