/*

Example file to show possibilities of `fluidintetweaker`
for adding JEI recipes.

*/

#modloaded exnihilocreatio fluidintetweaker
#reloadable
#norun

import mods.fluidintetweaker.FBTweaker;

static FluidState as int[string] = {
  source: 0,
  flowing: 1,
  all: 2,
} as int[string];

FBTweaker.addJEIRecipeWrapper(
  <liquid:witchwater>, FluidState.all,
  FBTweaker.outputBuilder()
    .addEvent(
      FBTweaker.eventBuilder()
        .createEntityConversionEvent(<entity:minecraft:zombie>, <entity:minecraft:pig>)));
