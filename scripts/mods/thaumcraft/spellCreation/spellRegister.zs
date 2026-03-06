#priority 10
#modloaded thaumcraft

import native.net.minecraft.util.ResourceLocation;
import native.thaumcraft.api.casters.FocusEngine;
import scripts.mods.thaumcraft.spellCreation.spellVampirysm.SpellVampirysm;
import scripts.mods.thaumcraft.spellCreation.spellBlackout.SpellBlackout;
import scripts.mods.thaumcraft.spellCreation.spellLineage.SpellLineage;
import scripts.mods.thaumcraft.spellCreation.spellRootwake.SpellRootwake;
import scripts.mods.thaumcraft.spellCreation.spellGerminare.SpellGerminare;

//Do not make fully black color - it fails to render it!
FocusEngine.registerElement(SpellVampirysm.class, ResourceLocation("thaumcraft", "textures/foci/vampirysm.png"), 0xFF781212);
FocusEngine.registerElement(SpellBlackout.class,  ResourceLocation("thaumcraft", "textures/foci/blackout.png"),  0xFF101010);
FocusEngine.registerElement(SpellLineage.class,   ResourceLocation("thaumcraft", "textures/foci/lineage.png"),   0xFFFFFF10);
FocusEngine.registerElement(SpellRootwake.class,  ResourceLocation("thaumcraft", "textures/foci/rootwake.png"),  0xFF8BC763);
FocusEngine.registerElement(SpellGerminare.class, ResourceLocation("thaumcraft", "textures/foci/germinare.png"), 0xFFDCB250);
