--#include "data\config\item\ImmortalConfig.lua" once

ImmortalOpFuncList = {}

EventCallDispatcher.HandleImmortalOp = function (sysarg, args)
	if args[1] == nil then return end
	local func = ImmortalOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args)
	end
end

function getImmortalConfig(nImmortalLevel,nType)
	
	if not ImmortalConfig then return nil end
	if nImmortalLevel >= table.getn(ImmortalConfig.breakthrough) then
		return nil
	elseif nImmortalLevel >= nType then
		return nil
	end
	
	return ImmortalConfig.breakthrough[nImmortalLevel+1]
end

--突破境界
ImmortalOpFuncList[1] = function(sysarg,args)

	local nType = args[2]
	
	local nImmortalLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_IMMORTAL)
	local nConfig = getImmortalConfig(nImmortalLevel,nType)
	if not nConfig then return end

	if not Actor.checkActorLevel(sysarg,nConfig.needLevel,nConfig.needCircle) then 
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf295,nConfig.needCircle,nConfig.needLevel),ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local d = var.d
	for _,config in ipairs(nConfig.consume) do
		if config.type > 0 then			
			local myVal = Actor.getUIntProperty(sysarg, config.id)
			if myVal < config.count then
				local nName = {[130] = "金刚石",[132] = "真元值"}
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf296,config.count,nName[config.id]),ttFlyTip)
				return
			end
		else
			local nItemCount = Actor.getItemCount(sysarg,config.id)
			if nItemCount < config.count then
				return
			end
		end
	end
	
	if nConfig.Probability >= math.random(1,100) then
		Actor.setIntProperty(sysarg, PROP_ACTOR_IMMORTAL, nImmortalLevel+1)	
		Actor.collectOperate(sysarg,0) -- 重新计算角色属性		
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf298,ttFlyTip)
		
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		local nName = Actor.getName(sysarg)
		System.sendCommonLog(1022,nActorId,nName,nImmortalLevel+1,0,0,Lang.LogTips.l00229)
	else
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf297,ttFlyTip)
	end
	
	for _,config in ipairs(nConfig.consume) do
		if config.type > 0 then
			local myVal = Actor.getUIntProperty(sysarg, config.id)
			myVal = myVal - config.count
			Actor.setUIntProperty(sysarg, config.id, myVal)
		else
			Actor.removeItem(sysarg,config.id,config.count)
		end
	end
	
end

--进入霸者宝窟
ImmortalOpFuncList[2] = function(sysarg,args)
	
	if not ImmortalConfig.breakthrough then return end

	local nFuBenId = Actor.getFubenId(sysarg)
	if nFuBenId > 0 then
		Actor.sendTipmsg(sysarg,"副本中不能传到到任意地图",ttFlyTip)
		return
	end	
	
	local nImmortalLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_IMMORTAL)
	local nSceneId = 0
	if nImmortalLevel == 0 then
		nSceneId = ImmortalConfig.breakthrough[1].sceneID
	elseif nImmortalLevel == ImmortalConfig.breakthrough[nImmortalLevel].id then
		nSceneId = ImmortalConfig.breakthrough[nImmortalLevel].sceneID
	else
		for _,Immortal in ipairs(ImmortalConfig.breakthrough) do
			if Immortal.id == nImmortalLevel then
				nSceneId = Immortal.sceneID
				break
			end
		end
	end
	
	if nSceneId == 0 then return end

	local consume = {type = 5,id = 0,count = 200000,logs = {1030,"进入霸者宝窟扣除金币"}}
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, consume, true, consumeData)				
	if not isok then return end	
	isok = DeductOneConsume(sysarg, false, consume, GameLog.cNewImmortalConsume)	
	if not isok then return end	

	Actor.enterScene(sysarg,nSceneId)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf309,Actor.getName(sysarg),Fuben.getSceneNameById(nSceneId)), 128+2)
end

--注册回调函数	
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeImmortalEvent, EventCallDispatcher.HandleImmortalOp) 