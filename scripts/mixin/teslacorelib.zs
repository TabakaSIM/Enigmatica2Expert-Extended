#modloaded teslacorelib
#loader mixin

import mixin.CallbackInfo;
import native.net.ndrei.teslacorelib.inventory.EnergyStorage;

/*
  A generator that ended up holding power with a release rate of 0 is stuck forever:
  it can neither push that power out nor start a new fuel, and its GUI divides by the
  rate and crashes. Saves bitten by the [Petrified Fuel Generator] + [Burn Singularity]
  bug (see mixin/industrialforegoing.zs) are left in exactly that state, so drop the
  unreleasable power and let the machine start over.
*/
#mixin { targets: 'net.ndrei.teslacorelib.tileentities.ElectricGenerator' }
zenClass MixinElectricGenerator {
  #mixin Shadow
  var generatedPower as EnergyStorage;

  #mixin Inject
  #{
  #  method: 'protectedUpdate',
  #  at: { value: 'HEAD' }
  #}
  function dropUnreleasablePower(ci as CallbackInfo) as void {
    if (generatedPower.stored > 0 && generatedPower.getEnergyOutputRate() <= 0) {
      generatedPower.setCapacity(0);
    }
  }
}
