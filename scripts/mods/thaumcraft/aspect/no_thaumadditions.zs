/*
  If there is no thaumadditions, fallback its aspects to vanilla
*/
// Should be `!thaumadditions`, but ZenUtils reads modid from mcmod.info verbatim
// https://github.com/friendlyhj/ZenUtils/issues/138
#modloaded !thaumicadditions thaumcraft
#priority 3500
#reloadable

val emojiMap = scripts.mods.thaumcraft.aspect.emoji.emojiMap;

emojiMap['☀️'] = <aspect:humanus>;
emojiMap['💣'] = <aspect:perditio>;
emojiMap['♒'] = <aspect:motus>;
emojiMap['🙌'] = <aspect:machina>;
emojiMap['🧨'] = <aspect:ignis>;
emojiMap['🛎️'] = <aspect:alkimia>;
emojiMap['🍃'] = <aspect:permutatio>;
emojiMap['👁️'] = <aspect:auram>;
