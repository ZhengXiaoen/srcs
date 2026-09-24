--#include "data\config\activity\ExpRefiningConfig.lua"
--#include "data\config\property\LevelUpExp.lua" once

--获取提炼经验

MiscsImplement.GetExpRefining = function(sysarg, msgid, packet)

	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay > #ExpRefiningConfig.ExpRefining then
		return
	elseif not Actor.checkActorLevel(sysarg,ExpRefiningConfig.neelLevel) then
		return
	end
	
	local config = ExpRefiningConfig.ExpRefining[nOpenDay]
	if not config then return end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.days.ExpRefiningFlag then
		var.days.ExpRefiningFlag = #config
	elseif var.days.ExpRefiningFlag <= 0 then
		return
	end
		
	local nTimes = #config - var.days.ExpRefiningFlag + 1
	if nTimes <= 0 then
		print("error, MiscsImplement.GetExpRefining nTimes="..nTimes)
		return
	end
	
	--print("config[nTimes].addExp:"..config[nTimes].addExp)
	--print("nextlevel:"..UptoLevelN(sysarg,config[nTimes].addExp))
	local consumeData = {}
	local result = CheckOneConsume(sysarg, false, config[nTimes].consume, true, consumeData)
	if not result or result == false then 
		return 
	end

	result = DeductOneConsume(sysarg, false, config[nTimes].consume, GameLog.cNewGiveExpRefining)
	if not result then
		return
	end
	
	Actor.addExp(sysarg,config[nTimes].addExp)
	var.days.ExpRefiningFlag = var.days.ExpRefiningFlag - 1
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf360,Actor.getName(sysarg),config[nTimes].addExp),2048) 
	SendExpRefiningTimes(sysarg)
	onGetUptoLevelN(sysarg)
    local str = string.format("<(n%s)>玩家花费了%d元宝经验炼制成功获得%d点经验值<我也要炼制经验/@@showWin,140>",Actor.getName(sysarg),config[nTimes].consume.count,config[nTimes].addExp)
  
    System.broadcastTipmsg(str,ttChatWindow);
	-- 记录日志
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	System.sendCommonLog(GameLog.cExpRefining,nActorId,'',0,0,0,'','','','','','','',"GiveOpenServerAward")

    --返还元宝
    if var.retexpyb == nil then
        var.retexpyb = {}
        for i=1,#ExpRefiningConfig.ExpRefining do
            var.retexpyb[i]= 0
        end
    end
    var.retexpyb[nOpenDay] = var.retexpyb[nOpenDay] + config[nTimes].consume.count
    print("经验炼制返还总额".. var.retexpyb[nOpenDay])
end


MiscsImplement.GetUptoLevelN = function(sysarg, msgid, packet)
	onGetUptoLevelN(sysarg)
end

onGetUptoLevelN =function(sysarg)
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay > #ExpRefiningConfig.ExpRefining then
		return
	end
	local var = Actor.getStaticVar(sysarg)
	local config = ExpRefiningConfig.ExpRefining[nOpenDay]
	if not config then return end
	--local nTimes = var.days.ExpRefiningFlag
	if not var.days.ExpRefiningFlag then
		var.days.ExpRefiningFlag = #config
	elseif var.days.ExpRefiningFlag <= 0 then
		return
	end
	local nTimes = #config - var.days.ExpRefiningFlag + 1
	local tolevel= UptoLevelN(sysarg,config[nTimes].addExp)
	--print("tolevel:"..tolevel)
	
	local netPack = DataPack.allocPacket(sysarg, 139,194)
	DataPack.writeByte(netPack,tolevel)
	DataPack.flush(netPack)


end


function UptoLevelN(sysarg,addExp)
	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local myexp = Actor.getIntProperty(sysarg,PROP_ACTOR_EXP)    --一开始的经验，什么数值都有可能。
	while(myLevel+1<=255 and LevelUpExp[myLevel+1] <= addExp + myexp)
	do
		if myLevel==Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL) then --第一次循环
			addExp=addExp-(LevelUpExp[myLevel+1]-myexp)
		else 
			addExp=addExp-LevelUpExp[myLevel+1]
		end
		myexp = 0 --每次升级，经验一定归0
		myLevel=myLevel+1
	end
	return myLevel
end

function SendExpRefiningTimes(sysarg)
	
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay > #ExpRefiningConfig.ExpRefining then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local config = ExpRefiningConfig.ExpRefining[nOpenDay]
	if not config then return end
	local nTimes = var.days.ExpRefiningFlag
	local netPack = DataPack.allocPacket(sysarg, 139,135)
	DataPack.writeByte(netPack, var.days.ExpRefiningFlag or #config) 
	DataPack.flush(netPack)
end



MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetExpRefining, MiscsImplement.GetExpRefining)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetExpUplevelTo, MiscsImplement.GetUptoLevelN)