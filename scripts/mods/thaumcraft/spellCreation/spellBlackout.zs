#priority 100
#modloaded thaumcraft

import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.potions.IPotion;
import crafttweaker.util.Math;
import crafttweaker.world.IWorld;
import native.com.blamejared.compat.thaumcraft.handlers.ThaumCraft;
import native.net.minecraft.block.Block;
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.entity.Entity;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraft.util.SoundCategory;
import native.net.minecraft.util.SoundEvent;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.util.math.RayTraceResult;
import native.net.minecraft.world.World;
import native.net.minecraftforge.fml.common.network.NetworkRegistry;
import native.thaumcraft.api.aspects.Aspect;
import native.thaumcraft.api.casters.FocusEffect;
import native.thaumcraft.api.casters.FocusEngine;
import native.thaumcraft.api.casters.NodeSetting;
import native.thaumcraft.api.casters.Trajectory;
import native.thaumcraft.client.fx.ParticleEngine;
import native.thaumcraft.client.fx.particles.FXGeneric;
import native.thaumcraft.common.lib.SoundsTC;
import native.thaumcraft.common.lib.network.PacketHandler;
import native.thaumcraft.common.lib.network.fx.PacketFXEssentiaSource;
import native.thaumcraft.common.lib.network.fx.PacketFXFocusPartImpact;
import thaumcraft.aspect.CTAspectStack;

zenClass SpellBlackout extends FocusEffect {

    zenConstructor() {
        super();
    }

    //======================
    //Set up some basic info
    //======================

    function getResearch() as string {
        return 'BLACKOUT';
    }
    
    function getKey() as string {
        return 'thaumcraft.BLACKOUT';
    }

    //===================================
    //Set up focalmanipulator spell stats
    //===================================
    
    function getAspect() as Aspect {
        return ThaumCraft.getAspect(Aspects('🌑')[0]);
    }

    function getComplexity() as int {
        return  5 * pow(2, this.getSettingValue('range'));
    }

    function createSettings() as NodeSetting[] {
        return [
            NodeSetting('range', 'focus.common.range', NodeSetting.NodeSettingIntList( [1, 2, 3, 4], ['20', '40', '80', '160']))
            ];
    }

    //==========================
    //Set up executable function
    //==========================

    function execute(target as RayTraceResult, trajectory as Trajectory, finalPower as float, num as int) as bool {
     PacketHandler.INSTANCE.sendToAllAround(PacketFXFocusPartImpact(target.hitVec.x, target.hitVec.y, target.hitVec.z, [getKey()]), NetworkRegistry.TargetPoint(this.getPackage().world.provider.getDimension(), target.hitVec.x, target.hitVec.y, target.hitVec.z, 64.0));
     val startX = target.hitVec.x as int;
     val startY = target.hitVec.y as int;
     val startZ = target.hitVec.z as int;
     if(target.typeOfHit == RayTraceResult.Type.BLOCK){
      val world = this.getPackage().world;
      val range = 10 * pow(2, this.getSettingValue('range'));
      val list = [] as [BlockPos];
      print("Range:" ~ range);
        
      world.wrapper.catenation().run( //TODO move it to persisted catenation - i don't want to :(
       function(world, context){
        for x in (startX - range) .. (startX + range) {
         for y in Math.max(0, startY - range) .. Math.min(255, startY + range) {
          for z in (startZ - range) .. (startZ + range) {
           if(((startX - x)*(startX - x) + (startY - y)*(startY - y) + (startZ - z)*(startZ - z)) > (range * range)) continue;
           val pos = BlockPos(x, y, z);
           val blockState = world.native.getBlockState(pos);
           val block = blockState.getBlock();
           if(blockState.getLightOpacity(world.native, pos) == 0 && block.getDefaultState().getLightValue() > 5 && blockState.getBlockHardness(world.native, pos) < 10) list.add(pos);
          }
         }
        }
       }).sleepUntil(
       function(world, context){
        if(list.isEmpty()) return true;
        print(list.length);
        val index = world.random.nextInt(list.length);
        val pos = list[index];
        list.removeByIndex(index, index);
        val blockState = world.native.getBlockState(pos);
        if(blockState.getLightOpacity(world.native, pos) == 0 && blockState.getBlock().getDefaultState().getLightValue() > 5 && blockState.getBlockHardness(world.native, pos) < 10){
         world.native.setBlockToAir(pos);
         world.native.playSound(null, pos, SoundsTC.wind, SoundCategory.AMBIENT, 1.0f, world.random.nextFloat() * 0.4f + 0.8f);
         PacketHandler.INSTANCE.sendToAllAround(
          PacketFXEssentiaSource(BlockPos(startX, startY, startZ), startX - pos.getX(), startY - pos.getY(), startZ - pos.getZ() , 16777113, 20),
          NetworkRegistry.TargetPoint(world.native.provider.getDimension(), pos.getX(), pos.getY(), pos.getZ(), 32.0)
         );
        }
        return false;
       }).onStop(function(world, context){
      }).start();
      return true;
     }
     
     if(!isNull(target.entityHit) && target.typeOfHit == RayTraceResult.Type.ENTITY){
      val entity = target.entityHit.wrapper;
      if(entity instanceof IEntityLivingBase){
        val entityLivingBase as IEntityLivingBase = entity;
        val potion = <potion:minecraft:blindness>;
        if(!entityLivingBase.isPotionActive(potion)) entityLivingBase.addPotionEffect(potion.makePotionEffect((finalPower * 200) as int, this.getSettingValue('range') - 1));
        return true;
      }
     } 
     return false;
    }

    function onCast(caster as Entity) { //optional
        
    }

    //==================
    //Particle rendering
    //==================

    function renderParticleFX(world as World, posX as double, posY as double, posZ as double, motionX as double, motionY as double, motionZ as double) as void {
        
        val fb as FXGeneric = FXGeneric(world, posX, posY, posZ, motionX * 0.5, motionY * 0.5, motionZ * 0.5);
    
        fb.setMaxAge(this.getSettingValue('range') * 200); //Particle lifetime (in ticks)
        fb.setRBGColorF(0.05f + world.rand.nextFloat() * 0.01, 0.05f + world.rand.nextFloat() * 0.01, 0.05f + world.rand.nextFloat() * 0.01);
        //fb.setAlphaF(0.0f); //Transparency
        fb.setGridSize(16); //Particle texture size
        fb.setParticles(72 + world.rand.nextInt(4), 1, 1);
        fb.setScale(20.0f + world.rand.nextFloat() * 4.0); //Particle size
        fb.setLoop(false);
        fb.setSlowDown(0.8);
        fb.setGravity(0.0f);
        fb.setRotationSpeed(world.rand.nextFloat(), 0.1f);
    
        ParticleEngine.addEffectWithDelay(world, fb, world.rand.nextInt(4));
    }

    
}
