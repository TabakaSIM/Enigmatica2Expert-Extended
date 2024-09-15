import mods.botania.Lexicon;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//////////////////////
//Generating flowers//
//////////////////////

mods.botania.Lexicon.addEntry("botania.entry.campanimia", "botania.category.generationFlowers", <botania:specialflower>.withTag({type: "campanimia"}));
mods.botania.Lexicon.addTextPage("botania.page.campanimia0", "botania.entry.campanimia", 0);
mods.botania.Lexicon.addPetalPage("botania.page.campanimia1", "botania.entry.campanimia", 1, [<botania:specialflower>.withTag({type: "campanimia"})], [[
<botania:rune:1>,
<botania:rune:2>,
<botania:rune:3>,
<botania:rune>,
<quark:rune:14>,
<quark:rune:2>,
<quark:rune:4>,
]]);

mods.botania.Lexicon.addEntry("botania.entry.nuclianthus", "botania.category.generationFlowers", <botania:specialflower>.withTag({type: "nuclianthus"}));
mods.botania.Lexicon.setEntryKnowledgeType("botania.entry.nuclianthus", "alfheim");
mods.botania.Lexicon.addTextPage("botania.page.nuclianthus0", "botania.entry.nuclianthus", 0);
mods.botania.Lexicon.addPetalPage("botania.page.nuclianthus1", "botania.entry.nuclianthus", 1, [<botania:specialflower>.withTag({type: "nuclianthus"})], [[
<quark:rune:5>,
<quark:rune:4>,
<quark:rune:4>,
<quark:rune:1>,
<botania:manaresource:1>,
<botania:rune:6>,
<botania:rune:6>,
]]);

//////////////////////
//Functional flowers//
//////////////////////

mods.botania.Lexicon.addEntry("botania.entry.rokku_eryngium", "botania.category.functionalFlowers", <botania:specialflower>.withTag({type: "rokku_eryngium"}));
mods.botania.Lexicon.setEntryKnowledgeType("botania.entry.rokku_eryngium", "alfheim");
mods.botania.Lexicon.addTextPage("botania.page.rokku_eryngium0", "botania.entry.rokku_eryngium", 0);
mods.botania.Lexicon.addPetalPage("botania.page.rokku_eryngium1", "botania.entry.rokku_eryngium", 1, [<botania:specialflower>.withTag({type: "rokku_eryngium"})], [[
<botania:manaresource:5>,
<botania:manaresource:9>,
<botania:rune:11>,
<botania:rune:12>,
<quark:rune:11>,
<quark:rune>,
<quark:rune>,
]]);

mods.botania.Lexicon.addEntry("botania.entry.jikanacea", "botania.category.functionalFlowers", <botania:specialflower>.withTag({type: "jikanacea"}));
mods.botania.Lexicon.setEntryKnowledgeType("botania.entry.jikanacea", "alfheim");
mods.botania.Lexicon.addTextPage("botania.page.jikanacea0", "botania.entry.jikanacea", 0);
mods.botania.Lexicon.addPetalPage("botania.page.jikanacea1", "botania.entry.jikanacea", 1, [<botania:specialflower>.withTag({type: "jikanacea"})], [[
<astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.horologium", crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100}}}),
<botania:rune:14>,
<botania:rune:9>,
<quark:rune:2>,
<quark:rune:4>,
<quark:rune:4>,
<thaumicaugmentation:material:5>,
]]);

mods.botania.Lexicon.addEntry("botania.entry.echinacenko", "botania.category.functionalFlowers", <botania:specialflower>.withTag({type: "echinacenko"}));
mods.botania.Lexicon.setEntryKnowledgeType("botania.entry.echinacenko", "alfheim");
mods.botania.Lexicon.addTextPage("botania.page.echinacenko0", "botania.entry.echinacenko", 0);
mods.botania.Lexicon.addPetalPage("botania.page.echinacenko1", "botania.entry.echinacenko", 1, [<botania:specialflower>.withTag({type: "echinacenko"})], [[
<quark:rune:2>,
<quark:rune:2>,
<quark:rune:5>,
<botania:rune:10>,
<botania:rune:12>,
<botania:manaresource:8>,
]]);
