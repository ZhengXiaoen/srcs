--#include "data\config\item\AvoidInjury.lua" once 

---真气事件

AvoidEventId = 
{
	InjectOre = 1,
	HalfTheTime = 2,
	UpgradeToNow = 3,
	GetLevelUpTime = 4,
}

AvoidItemOpFuncList = {}

EventCallDispatcher.HandleAvoidEvent = function(sysarg,args)
	if args[1] == nil then return end
		
	local func = AvoidItemOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args)
	end
end

AvoidItemOpFuncList[AvoidEventId.InjectOre] = function(sysarg,args)
	
--[[ 屏蔽，改为潜能了
	local nNeedItemNum = Actor.getItemCount(sysarg,AvoidinjuryCfg.InjectItem,-1,-1,-1);
	
	local svar = Actor.getStaticVar(sysarg)
	if svar.avoidUpTime then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf627,ttFlyTip);
		return false 
	end
	
	if nNeedItemNum > 0 then
		local itemPtr
		for i = 1,56 do 
			itemPtr = Item.getBagItemBySortID(sysarg,i)
			if Item.getItemProperty(sysarg,itemPtr,Item.ipItemID) == AvoidinjuryCfg.InjectItem then
				break
			end
		end

		if not itemPtr then return false end
		local nPurity = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,0);

		if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"提升真气经验消耗黑铁矿",984) > 0 then
			local nCurExp 	= Actor.getIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_EXP)
			local nCurLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL)
			local nLevelUpCfg = AvoidinjuryCfg.AvoidInjury
			
			if not nLevelUpCfg then return false end
			if nPurity+nCurExp >= nLevelUpCfg[nCurLevel+1].maxExp and nCurLevel < #nLevelUpCfg then
				Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_EXP,nLevelUpCfg[nCurLevel+1].maxExp)
				local needTime = 0
				if not svar.avoidUpTime then
					svar.avoidUpTime = nLevelUpCfg[nCurLevel+1].needTime
					Actor.addTimer(sysarg,ActorTimerIds.AvoidUp,1000)
					local npack = DataPack.allocPacket(sysarg, 55, 3)
					if not npack then return end 
					DataPack.writeInt(npack,svar.avoidUpTime)	
					DataPack.flush(npack)
				end
			else
				Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_EXP,nPurity+nCurExp)
			end
		else
			print("Delete Ore Failure,Actor ID = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		end

	else
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf626,ttFlyTip);
	end
--]]
end

AvoidItemOpFuncList[AvoidEventId.HalfTheTime] = function(sysarg,args)
--[[ 屏蔽，改为潜能了
	local svar = Actor.getStaticVar(sysarg)
	local config = AvoidinjuryCfg.AvoidInjury
	
	if not config then return false end
		
	if svar.avoidUpTime and svar.avoidUpTime > 0 then
		local nCurLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL)
		if Actor.changeMoney(sysarg,3,-config[nCurLevel+1].halfTimeYb,GameLog.cConsumeHalfTime,"真气升级时间减半消耗") == false then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf628,ttFlyTip);
		else
			svar.avoidUpTime = svar.avoidUpTime/2
		end
	end
--]]
end

AvoidItemOpFuncList[AvoidEventId.UpgradeToNow] = function(sysarg,args)
--[[ 屏蔽，改为潜能了
	local svar = Actor.getStaticVar(sysarg)
	local config = AvoidinjuryCfg.AvoidInjury
	
	if not config then return false end
		
	if svar.avoidUpTime and svar.avoidUpTime > 0 then
		local nCurLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL)
		if Actor.changeMoney(sysarg,3,-config[nCurLevel+1].nowLevelYb,GameLog.cConsumeNowTime,"扣除元宝真气直接升级") == false then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf629,ttFlyTip);
		else
			Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_EXP,0)
			Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL,nCurLevel+1)
			--print(nCurLevel,nCurLevel+1)
			Actor.collectOperate(sysarg,0) -- 重新计算角色属性
			Actor.FullAvoid(sysarg)
			svar.avoidUpTime = nil
			Actor.deleteTimer(sysarg,ActorTimerIds.AvoidUp)
			
			local npack = DataPack.allocPacket(sysarg, 55, 3)
			if not npack then return end 
			DataPack.writeInt(npack,0)
			DataPack.flush(npack)
			return
		end
	end
--]]
end

AvoidItemOpFuncList[AvoidEventId.GetLevelUpTime] = function(sysarg,args)
	
	local svar = Actor.getStaticVar(sysarg)
	local npack = DataPack.allocPacket(sysarg, 55, 3)
	if not npack then return end 
	if svar.avoidUpTime and svar.avoidUpTime > 0 then
		DataPack.writeInt(npack,svar.avoidUpTime)
	else
		DataPack.writeInt(npack,0)
	end
	DataPack.flush(npack)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeAvoidEvent, EventCallDispatcher.HandleAvoidEvent)