#modloaded thaumicaugmentation
#loader mixin

import mixin.CallbackInfo;

/*
  This mixin changes the default light level of CastedLight
  (the Thaumcraft spell that creates a nitor-like light block).

  It is used by the Blackout spell
  (scripts/mods/thaumcraft/spellCreation/spellBlackout.zs),
  which requires the block to have positive default light level.
*/
#mixin { targets = 'thecodex6824.thaumicaugmentation.common.block.BlockCastedLight' }
zenClass MixinBlockCastedLight {
  #mixin Inject { method: '<init>', at: { value: 'TAIL' } }
  function afterInit(ci as CallbackInfo) as void {
    this0.setLightLevel(1.0);
  }
}
