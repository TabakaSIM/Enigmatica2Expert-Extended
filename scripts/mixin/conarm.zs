#modloaded conarm
#loader mixin

#mixin {targets: "c4.conarm.common.armor.modifiers.ModEmerald"}
zenClass MixinModEmerald {
    #mixin ModifyConstant {method: "applyEffect", constant: {intValue: 2}}
    function buffDurabilityBonus(value as int) as int {
        return 1;
    }
}
