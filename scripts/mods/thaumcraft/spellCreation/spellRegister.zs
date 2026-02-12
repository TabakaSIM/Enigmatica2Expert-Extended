#priority 10
#modloaded thaumcraft

import native.net.minecraft.util.ResourceLocation;
import native.thaumcraft.api.casters.FocusEngine;
import scripts.mods.thaumcraft.spellCreation.spellVampirysm.SpellVampirysm;
import scripts.mods.thaumcraft.spellCreation.spellBlackout.SpellBlackout;

//Do not make fully black color - it fails to render it!
FocusEngine.registerElement(SpellVampirysm.class, ResourceLocation("thaumcraft", "textures/foci/vampirysm.png"), 0xFF781212);
FocusEngine.registerElement(SpellBlackout.class,  ResourceLocation("thaumcraft", "textures/foci/blackout.png"),  0xFF101010);
