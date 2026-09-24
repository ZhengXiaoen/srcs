
--#include "data\config\monster\PetBabyCfg.lua"


EventCallDispatcher.OnUseSkill = function (sysarg, args)
	local SId = args[1]
	local SLv = args[2]
	local nMousesPosX = args[3]
	local nMousesPosY = args[4]
	
	local nCircleLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);	--转生等级
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);	--等级

    --道术 召唤术
    local nMonsterId = 375
    if SId == 170 then
        
        if Pet.getPetCountById(sysarg,375) >= 1 then
            Pet.delAllPet(sysarg)
        end
        local okPetId = Pet.addPet(sysarg,nMonsterId,1,17,0,true)
        if okPetId > 0 then
                 local pPet = Pet.getPetById(sysarg,okPetId)
                 if pPet  ~= nil then
                    Actor.collectOperate(pPet,0)
                 end
        end
        return
    end
	--//道士 大召唤术
   
	if SId == 21 then
		--判断普通召唤术是否召唤了白虎
        if Pet.getPetCountById(sysarg,375) >= 1 then
            Pet.delAllPet(sysarg)
           
           
        end

		local config = PetAttrCfg.call
		local nPetNum = 0;
		for key,value in ipairs(config) do
			nPetNum = nPetNum + Pet.getPetCountById(sysarg,value.PetId);
		end

--		if nPetNum >= 1 then

--			Pet.delAllPet(sysarg)
--		end
	
		local PetName = "暂无";
		local nAddPetId = 0
		local nIndex = 0
        local nAi = 0
		for i = 1, table.getn(config) do
			if i == #config and nLevel >= config[i].ActorLevel then
				nAddPetId = config[i].PetId
				nIndex = i
                nAi = config[i].Ai
				break
			elseif nLevel >= config[i].ActorLevel and nLevel < config[i+1].ActorLevel then
				nAddPetId = config[i].PetId
				nIndex = i
                nAi = config[i].Ai
				break
			end
            nPetNum = Pet.getPetCountById(sysarg,config[i].PetId)
            if nPetNum > 0 then
                Pet.delPetById(sysarg,config[i].PetId)
            end
		end
		
		if nAddPetId > 0 then
			local okPetId = Pet.addPet(sysarg,nAddPetId,1,nAi,0,true)
          
            if okPetId > 0 then
                 local pPet = Pet.getPetById(sysarg,okPetId)
                 if pPet  ~= nil then
                    Actor.collectOperate(pPet,0)
                 end
               
--                okPetId = okPetId - 1 --索引0下为下标

--                local nMaxHp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP) * PetAttrCfg.AttributeCfg.hp_rate

--                Actor.setIntProperty(pPet,PROP_CREATURE_MAXHP,nMaxHp)
--                Actor.setIntProperty(pPet,PROP_CREATURE_HP,nMaxHp)
--                --攻击力取道士的道术攻击
--                local nAttack_Min = Actor.getIntProperty(sysarg,PROP_CREATURE_WIZARD_ATTACK_MIN)
--                nAttack_Min =  math.ceil( nAttack_Min* PetAttrCfg.AttributeCfg.attack_rate)
--                local nAttack_Max = Actor.getIntProperty(sysarg,PROP_CREATURE_WIZARD_ATTACK_MAX)
--                nAttack_Max =   math.ceil(nAttack_Max *  PetAttrCfg.AttributeCfg.attack_rate)
--                Actor.setIntProperty(pPet,PROP_CREATURE_WIZARD_ATTACK_MIN,nAttack_Min)
--                Actor.setIntProperty(pPet,PROP_CREATURE_WIZARD_ATTACK_MAX,nAttack_Max)
--                Actor.setIntProperty(pPet,PROP_CREATURE_MAGIC_ATTACK_MIN,nAttack_Min)
--                Actor.setIntProperty(pPet,PROP_CREATURE_MAGIC_ATTACK_MAX,nAttack_Max)
--                Actor.setIntProperty(pPet,PROP_CREATURE_WIZARD_ATTACK_MIN,nAttack_Min)
--                Actor.setIntProperty(pPet,PROP_CREATURE_WIZARD_ATTACK_MAX,nAttack_Max)
--                Pet.SyncCritRate(sysarg,pPet,PetAttrCfg.AttributeCfg.crit_rate,PetAttrCfg.AttributeCfg.resistance_crite_rate)
--                Actor.sendTipmsg(sysarg,"召唤神兽成功，神兽攻击:"..nAttack_Min.."-"..nAttack_Max,ttFlyTip+ttChatWindow)
            end
		end
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUseSkill, EventCallDispatcher.OnUseSkill)
