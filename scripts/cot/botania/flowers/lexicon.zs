import mods.botania.Lexicon;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

mods.botania.Lexicon.addEntry("botania.entry.campanimia", "botania.category.generationFlowers", <botania:specialflower>.withTag({type: "campanimia"}));
mods.botania.Lexicon.setEntryKnowledgeType("botania.entry.campanimia", "alfheim");
mods.botania.Lexicon.addTextPage("botania.page.campanimia0", "botania.entry.campanimia", 0);
mods.botania.Lexicon.addTextPage("botania.page.campanimia1", "botania.entry.campanimia", 1);
mods.botania.Lexicon.addRecipeMapping(<botania:specialflower>.withTag({type: "campanimia"}), "botania.entry.campanimia", 1);

