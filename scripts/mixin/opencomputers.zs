#modloaded opencomputers
#loader mixin

import native.mezz.jei.api.recipe.IRecipeCategoryRegistration;
import native.mezz.jei.api.IModRegistry;
import native.java.util.Collection;

#mixin {targets: "li.cil.oc.integration.opencomputers.DriverUpgradeTank$"}
zenClass MixinDriverUpgradeTank {
    #mixin ModifyConstant {method: "createEnvironment", constant: {intValue: 16000}}
    function modifyCapacity(value as int) as int {
        return 20000000;
    }
}

#mixin {targets: "li.cil.oc.server.component.UpgradeTractorBeam$Common"}
zenClass MixinUpgradeTractorBeam {
    #mixin Static
    #mixin ModifyConstant {method: "<init>", constant: {intValue: 3}}
    function modifyPickupRadius(value as int) as int {
        return 16;
    }
}

#mixin {targets: "li.cil.oc.server.machine.luac.LuaStateFactory"}
zenClass MixinLuaStateFactory {
    #mixin Inject {method: "init", at: {value: "HEAD"}, cancellable: true}
    function skipUnusedLibs(ci as mixin.CallbackInfo) as void {
        if(this0.version() as string != '53') ci.cancel();
    }
}

#mixin {targets: "li.cil.oc.integration.jei.ModPluginOpenComputers"}
zenClass MixinModPluginOpenComputers {
    #mixin Overwrite
    function registerCategories(registry as IRecipeCategoryRegistration) as void {
        // NO-OP
    }

    #mixin ModifyArg
    #{
    #    method: "register",
    #    at: {
    #        value: "INVOKE",
    #        target: "Lmezz/jei/api/IModRegistry;handleRecipes(Ljava/lang/Class;Lmezz/jei/api/recipe/IRecipeWrapperFactory;Ljava/lang/String;)V"
    #    },
    #    index: 2
    #}
    function skipHandleRecipesByUid(originalUid as string) as string {
        return originalUid == 'oc.manual' || originalUid == 'oc.api' ? '__invalid_removed_uid__' : originalUid;
    }

    #mixin Redirect
    #{
    #   method: "register",
    #   at: {
    #       value: "INVOKE",
    #       target: "Lmezz/jei/api/IModRegistry;addRecipes(Ljava/util/Collection;Ljava/lang/String;)V"
    #   }
    #}
    function preventManualRegistration(registry as IModRegistry, c as Collection, s as string) as void {
        // NO-OP
    }
}

#mixin {targets: "li.cil.oc.integration.jei.CallbackDocHandler$CallbackDocRecipeCategory$"}
zenClass MixinCallbackDocRecipeCategory {
    #mixn Overwrite
    function initialize() as void { /* NO-OP */ }
}

#mixin {targets: "li.cil.oc.integration.jei.ManualUsageHandler$ManualUsageRecipeCategory$"}
zenClass MixinManualUsageRecipeCategory {
    #mixn Overwrite
    function initialize() as void { /* NO-OP */ }
}
