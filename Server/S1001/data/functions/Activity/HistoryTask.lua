--#include "data\config\activity\HistoryTaskCfg.lua" once
--#include "data\functions\Activity\Common\Misc.lua" once

-- 1 日常经验珠	2 日常跑环	3 降妖除魔	4 采集珍珠	5 领取皇杠	6 屠魔将军

S2C_HistoryTaskMsgId = {
	GetInfoMsgId = 1, --获得昨天的任务信息
	FinishResult = 2, --下发完成昨天的任务结果
}

function ClearHistoryTaskData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	var.historyTask = nil
end

function SaveHistoryTaskData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	var.historyTask = {}
	
	-- 1 日常经验珠
	var.historyTask[1] = var.jadeTime and var.jadeTime or 0
	-- 2 日常跑环
	var.historyTask[2] = var.days.CircleQuestId and var.days.CircleQuestId or 0
	-- 3 降妖除魔
	var.historyTask[3] = var.days.xycmCount and var.days.xycmCount or 0
	-- 4 采集珍珠
	var.historyTask[4] = var.days.cjzzCount and var.days.cjzzCount or 0

	-- 6 屠魔将军
	if var.d == nil then var.d = {} end
	
	local tmjj = var.d[51]
	if tmjj == nil or tmjj < 0 then -- 全部完成 
		var.historyTask[6] = 3
	else
		var.historyTask[6] = 3 - tmjj
	end	
end

function SendHistoryTaskInfo(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sHistoryTask)
	DataPack.writeByte(netPack, S2C_HistoryTaskMsgId.GetInfoMsgId)
	
	local var = Actor.getStaticVar(sysarg)
	local htData = var.historyTask
	
	if htData == nil then
		for i = 1, 6 do
			DataPack.writeByte(netPack, 0)
		end
	else
		for i = 1, 6 do
			DataPack.writeByte(netPack, htData[i])
		end
	end
	
	DataPack.flush(netPack)
end

-- 获得昨天的任务信息
function GetHistoryTaskInfo(sysarg, packet)
	SendHistoryTaskInfo(sysarg)
end

-- 完成昨天的任务
function FinishHistoryTask(sysarg, packet)
	local index = DataPack.readByte(packet) -- 从1开始
	local moneyType = DataPack.readByte(packet)
	
	if index < 1 or index > 6 then return end
	-- mtBindYuanbao=2 mtYuanbao=3
	if moneyType ~= mtBindYuanbao and moneyType ~= mtYuanbao then
		return
	end
	
	if System.getDaysSinceOpenServer() <= 1 then
		Actor.sendTipmsg(sysarg, "开服第一天没有可追回的资源", ttFlyTip)
		return
	end
	
	local doCount = 0
	local var = Actor.getStaticVar(sysarg)
	if var.historyTask then	
		doCount = var.historyTask[index]
		if doCount == nil then doCount = 0 end
	end
	
	local cfg = HistoryTaskCfg[index]
	local leftCount = cfg.maxCount - doCount
	if leftCount <= 0 then
		return -- 任务已经完成了
	end
	
	local money = 0
	if moneyType == mtYuanbao then
		money = cfg.ybConsume * leftCount
	else
		money = cfg.bindYbConsume * leftCount
	end
	
	--为了弹出充值框，这里就不判断了
	--[[
	if Actor.getMoneyCount(sysarg, moneyType) < money then
		if moneyType == mtYuanbao then
			Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		else
			Actor.sendTipmsg(sysarg, "绑定元宝不足", ttFlyTip)
		end
		
		return
	end
	--]]
	
	if Actor.changeMoney(sysarg, moneyType, -money, GameLog.cHistoryTaskConsume, tostring(index), true) == false then		
		return
	end
	
	local tipmsg = ""
	local ratio = (moneyType == mtYuanbao) and 1 or 0.5
	local myAwards = { { type = 0, id = 0, count = 0 }, }
	
	for i, award in ipairs(cfg.awards) do
		if award.id ~= 0 then
			print("error, 资源追回不支持物品奖励, index="..index..",actorid="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
		else
			myAwards[1].type = award.type
			myAwards[1].count = math.floor(award.count * leftCount * ratio)
			
			Awards.Give(sysarg, myAwards, GameLog.cHistoryTaskAward, tostring(index))
			
			local str = BuildStringFromAwardItem(myAwards[1].type, 0, myAwards[1].count)
			if str ~= nil then
				if tipmsg == "" then
					tipmsg = str
				else
					tipmsg = tipmsg .. "," .. str
				end
			end
		end
	end
	
	if var.historyTask == nil then
		var.historyTask = {}
	end
	var.historyTask[index] = cfg.maxCount -- 领过了
	
	-- 下发结果
	--[[
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sHistoryTask)
	DataPack.writeByte(netPack, S2C_HistoryTaskMsgId.FinishResult)
	DataPack.writeByte(netPack, 1)
	DataPack.flush(netPack)	
	--]]
	SendHistoryTaskInfo(sysarg)
	
	-- 提示
	if tipmsg ~= "" then
		Actor.sendTipmsg(sysarg, "<(c0xFFFFFF00)您追回了资源：>" .. tipmsg, 256)
	end
end

-- 昨天未完成的任务
function OnHistoryTaskMsg(sysarg, msgid, packet)

	if msgid ~= LogicCmd.miscSys.sub.cHistoryTask then
		print("error OnHistoryTaskMsg, msgid="..msgid)
		return
	end
	
	msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 获得昨天的任务信息
		GetHistoryTaskInfo(sysarg, packet)
	elseif msgid == 2 then -- 追回昨天的资源
		FinishHistoryTask(sysarg, packet)	
	else
		print("error OnHistoryTaskMsg, unknown msgid="..msgid)
		return
	end

end
