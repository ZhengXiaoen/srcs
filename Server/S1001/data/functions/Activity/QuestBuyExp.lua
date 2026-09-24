--主线购买经验
--#include "data\config\activity\QuestBuyExpCfg.lua" once
--#include "data\Config\property\LevelUpExp.lua" once --等级经验配置

--计算费用
function calcQuestBuyExpFee(sysarg)
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	for i,v in ipairs(QuestBuyExpConfig) do
		if nActorLevel >= v.level and nActorLevel < v.upLevel then
			local nCurrentExp = Actor.getIntProperty(sysarg,PROP_ACTOR_EXP)
			local nMaxExp = Actor.getIntProperty(sysarg,PROP_ACTOR_MAX_EXP)
			local nLevelDelta = v.upLevel - nActorLevel 
			local nExpDelta = nMaxExp - nCurrentExp
			if nLevelDelta > 1 then
				for i=1,nLevelDelta-1 do
					nExpDelta = nExpDelta + LevelUpExp[nActorLevel + i + 1]
				end
			end

			local nFee = math.ceil(nExpDelta/100000) * 1  --100元宝 1000w经验
			return true,nFee,v.upLevel,nExpDelta
		end
	end
	return false
end

MiscsImplement.GetQuestBuyExp = function (sysarg)
	local result,nFee,nUpLevel,nTotalExp = calcQuestBuyExpFee(sysarg)
	if result == true then
		if nFee > 0 then
			local nMyYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
			if nMyYb < nFee then
				--Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
				SendRecommendTips(sysarg,"1")
				return
			end
			if Actor.changeMoney( sysarg, mtYuanbao, -nFee ,GameLog.cQuestBuyExp,"主线购买经验") then
				System.sendCommonLog(GameLog.cQuestBuyExp,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),nUpLevel,nFee)
				Actor.addExp(sysarg,nTotalExp + 10) --避免100%不升级现象
				return
			end
		end
	end
end

--给端下发数据打开购买经验面板
function SendQuestBuyExpInfo(sysarg)
	local result,nFee,nUpLevel,nTotalExp = calcQuestBuyExpFee(sysarg)
	local expId = MainQuestPriority(sysarg)
	if result == true and nFee > 0 then
		local netPack = DataPack.allocPacket(sysarg, 139,146)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,nUpLevel)
		DataPack.writeUInt(netPack,nTotalExp)
		DataPack.writeShort(netPack,nFee)
		DataPack.writeByte(netPack,expId)
		DataPack.flush(netPack)	
	end
end

--给前端下发自动寻路经验最多的地方
function SendQuestExpLink(sysarg,bForce)

	--local nOpenDay = System.getDaysSinceOpenServer()
	--if nOpenDay < 2 then

		local var = Actor.getStaticVar(sysarg)
		local expId = MainQuestPriority(sysarg)
		if not bForce then
			if var.riChangTaskId ~= nil and var.riChangTaskId == expId then 
				return
			end
		end
		var.riChangTaskId = expId
		local netPack = DataPack.allocPacket(sysarg, 139,146)
		DataPack.writeByte(netPack,1)
		DataPack.writeByte(netPack,expId)
		DataPack.flush(netPack)	
	--end
end

--前端请求购买经验数据
MiscsImplement.GetQuestBuyExpInfo = function (sysarg)
	SendQuestBuyExpInfo(sysarg)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQuestBuyExp, MiscsImplement.GetQuestBuyExp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQueryQuestBuyExp, MiscsImplement.GetQuestBuyExpInfo)