-- --#include "data\config\activity\NationalDayCfg.lua" once
--[[
--国庆活动

S2C_NationalDayMsgId = {
	GetNationalDayInfo = 1, --获取国庆活动信息
	GetNationalDayFlags = 2, --下发领取国庆活动标志
	IconStatus = 3, --下发图标状态
}

-- var.days.NationalData.flags
NationalDayFlags = {
	--国庆活动7天登陆奖励领取状态
	LoginAward1 = 0,
	LoginAward2 = 1,
	LoginAward3 = 2,
	LoginAward4 = 3,
	LoginAward5 = 4,
	LoginAward6 = 5,
	LoginAward7 = 6,
	
	--活跃度等级奖励领取状态
	LivenessAward1 = 16,
	LivenessAward2 = 17,
	LivenessAward3 = 18,
	LivenessAward4 = 19,
	LivenessAward5 = 20,	
}


function IsNationalDayTime()
	if NationalDayCfg.isOpen == false then return false end
	
	local time = NationalDayCfg.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

function IsNationalDayDoubleExp(checkTime)
	if checkTime ~= nil and checkTime == true then
		if not IsNationalDayTime() then
			return false
		end
	end
	
	-- nDoubleExpOpenServerDay 开服前3天双倍经验
	-- 如果是开服前3天则国庆双倍经验无效	
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays <= 3 then return false end
	
	return true
end

function GetActorNationalDayFlag(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! GetActorNationalDayFlag flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.NationalData == nil then return false end
	
	local flags = var.days.NationalData.flags
	if flags == nil then return false end
	
	local f = System.getIntBit(flags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function SetActorNationalDayFlag(sysarg, flag, true_or_false)
	if flag < 0 or flag > 31 then
		print("----error! SetActorNationalDayFlag flag="..flag)
		return
	end
	
	local flags = 0
	local var = Actor.getStaticVar(sysarg)
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		flags = var.days.NationalData.flags
		if flags == nil then flags = 0 end
	end
		
	flags = System.setIntBit(flags, flag, true_or_false)
	var.days.NationalData.flags = flags
end

--下发领取国庆活动标志
function SendActorNationalDayFlags(sysarg, var)
	if var == nil then
		var = Actor.getStaticVar(sysarg)
	end
	
	local flags = 0
	if var.days.NationalData ~= nil then		
		flags = var.days.NationalData.flags
		if flags == nil then flags = 0 end
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sNationalDayActivity)
	DataPack.writeByte(netPack, S2C_NationalDayMsgId.GetNationalDayFlags)
	
	DataPack.writeUInt(netPack, flags)
	DataPack.flush(netPack)
end

--领取国庆活动每日登陆奖励
function GetNationalDayLoginAward(sysarg, packet)
	if not IsNationalDayTime() then
		Actor.sendTipmsg(sysarg, "非国庆活动期间不可领取奖励。", ttFlyTip)
		return
	end
	
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < NationalDayCfg.loginAwardNeedLevel then
		Actor.sendTipmsg(sysarg, "您的等级不足"..NationalDayCfg.loginAwardNeedLevel.."级,无法领取该奖励！", ttFlyTip)
		return
	end
	
	local year, month, day = System.getDate()
	if day < 1 or day > #NationalDayCfg.loginAwardList then
		print("error, GetNationalDayLoginAward day error, day="..day)
		return
	end	
	
	if GetActorNationalDayFlag(sysarg, day - 1) then
		Actor.sendTipmsg(sysarg, "您已经领取了今天的登陆奖励，不可重复领取！", ttFlyTip)
		return
	end	
	
	if Awards.Give(sysarg, NationalDayCfg.loginAwardList[day], GameLog.cGetNationalLoginAward, tostring(day)) == false then
		return
	end
	
	SetActorNationalDayFlag(sysarg, day - 1, true)
	Actor.sendTipmsg(sysarg, "您领取了国庆活动第"..day.."天的登陆奖励", ttFlyTip)
	
	--下发玩家标志
	SendActorNationalDayFlags(sysarg)
	
	-- 下发国庆活动图标状态
	SendNationalDayIconStatus(sysarg)
end

--国庆活动字帖兑换
function NationalDayCharItemsExchange(sysarg, packet)
	if not IsNationalDayTime() then
		Actor.sendTipmsg(sysarg, "非国庆活动期间不可进行字帖对换。", ttFlyTip)
		return
	end
	
	local exchangeType = DataPack.readByte(packet)
	if exchangeType < 1 or exchangeType > #NationalDayCfg.charItems then
		print("error, NationalDayCharItemsExchange exchangeType error, exchangeType="..exchangeType)
		return
	end
	
	local cfg = NationalDayCfg.charItems[exchangeType]
	--检查字帖是否收集完
	for i,itemid in ipairs(cfg.items) do
		if Actor.getItemCount(sysarg, itemid) <= 0 then
			Actor.sendTipmsg(sysarg, "请您收集完字帖后再来对换。", ttFlyTip)
			return
		end
	end
	
	for i,itemid in ipairs(cfg.items) do
		if Actor.removeItem(sysarg, itemid, 1, -1,-1,-1,"字帖兑换") <= 0 then
			Actor.sendTipmsg(sysarg, "删除字帖失败!", ttFlyTip)
			local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			print("delete item error, NationalDayCharItemsExchange actorid="..actorId..",charItem="..itemid)
			return
		end
	end
	
	if Awards.Give(sysarg, cfg.award, GameLog.cNationalCharItems, tostring(exchangeType)) == false then
		Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, NationalDayCharItemsExchange actorid="..actorId..",exchangeType="..exchangeType)
		return
	end
	local reslut 
	local actorName = Actor.getName(sysarg)

	System.broadcastTipmsg("<(c0xff00ff00)"..actorName..">参加国庆兑换字帖活动,获得大量元宝",2+128+2048)	
	Actor.sendTipmsg(sysarg, "兑换字帖奖励成功", ttFlyTip)
end

--回为是接的时候就减次数了，不是完成的时候，所以另开字段来算吧
--获得当天降妖除魔完成次数
--function GetXiangYaoChuMoFinishTimes(sysarg, var)
--	if var == nil then
--		var = Actor.getStaticVar(sysarg)
--	end
--		
--	local leftTimes = var.d[2]
--	if leftTimes == nil or leftTimes < 0 then leftTimes = 0 end
--	
--	local times = NationalDayCfg.livenessTask[1].limitTimes - leftTimes - (5 - var.d[5])	
--	if times < 0 then times = 0 end
--	
--	return times
--end

--获得当天采集珍珠完成次数
--function GetCaiJiZhenZhuFinishTimes(sysarg, var)
--	if var == nil then
--		var = Actor.getStaticVar(sysarg)
--	end
--	
--	local times = 0
--	if var.BuyPearlTimes ~= nil then
--		times = NationalDayCfg.livenessTask[2].limitTimes - var.d[31] - var.BuyPearlTimes
--	else
--		times = NationalDayCfg.livenessTask[2].limitTimes - var.d[31] - 3
--	end
--	
--	if times < 0 then times = 0 end
--	return times
--end


--返回国庆活动信息给前端
function GetNationalDayInfo(sysarg, packet)

	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sNationalDayActivity)
	DataPack.writeByte(netPack, S2C_NationalDayMsgId.GetNationalDayInfo) -- 获取国庆活动信息
	
	local flags = 0
	local liveness = 0
	
	local data = var.days.NationalData
	if data ~= nil then
		if data.flags ~= nil then
			flags = data.flags
		end
		
		if data.liveness ~= nil then
			liveness = data.liveness
		end		
	end	
	
	DataPack.writeUInt(netPack, flags)	
	DataPack.writeUInt(netPack, liveness) -- 当前活跃度		
	
	local counts = {0,0,0,0,0,0}
	
	if data ~= nil then
		counts[1] = data.xycmCount -- 降妖除魔完成次数
		counts[2] = data.cjzzCount	-- 采集珍珠完成次数		
		counts[5] = data.pkCount -- 激情PK完成次数
		counts[6] = data.donateCount -- 行会捐献完成次数	
	end
	
	counts[3] = var.days.DartTimes -- 护送皇杠完成次数
	
	-- 屠魔圣殿完成次数
	if var.d[51] < 0 then --全部完成 
		counts[4] = 3
	else
		counts[4] = 3 - var.d[51]
	end	
		
	DataPack.writeByte(netPack, 6) -- 共有 6 项

	for i = 1, 6 do
		if counts[i] ~= nil then
			DataPack.writeByte(netPack, counts[i])
		else
			DataPack.writeByte(netPack, 0)
		end
	end
		
	DataPack.flush(netPack)

end

--领取国庆活动活跃度奖励
function GetNationalDayLivenessAward(sysarg, packet)
	if not IsNationalDayTime() then
		Actor.sendTipmsg(sysarg, "非国庆活动期间不可以领取活跃度奖励。", ttFlyTip)
		return
	end

	local liveness = 0
	local var = Actor.getStaticVar(sysarg)
	if var.days.NationalData ~= nil then
		liveness = var.days.NationalData.liveness
	end	
	
	if liveness == nil or liveness <= 0 then
		Actor.sendTipmsg(sysarg, "您的活跃度不足，无法领取该奖励。", ttFlyTip)
		return
	end

	local index = DataPack.readByte(packet) -- 从1开始
	if index < 1 or index > 32 then return end

	local cfg = NationalDayCfg.livenessLevels[index]
	if cfg == nil then return end

	if liveness < cfg.liveness then
		Actor.sendTipmsg(sysarg, "您的活跃度不足，无法领取该奖励。", ttFlyTip)
		return
	end

	local bit = NationalDayFlags.LivenessAward1 + (index - 1)
	if bit >= 32 then return end

	if GetActorNationalDayFlag(sysarg, bit) then
		Actor.sendTipmsg(sysarg, "您已经领取了该奖励!", ttFlyTip)
		return
	end 

	if Awards.Give(sysarg, cfg.award, GameLog.cGetNationalLivenessAward, tostring(index)) == false then
		Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)		
		return
	end

	SetActorNationalDayFlag(sysarg, bit, true)	
	
	--下发领取国庆活动活跃度奖励结果
	SendActorNationalDayFlags(sysarg, var)
	
	-- 下发国庆活动图标状态
	SendNationalDayIconStatus(sysarg)
	
	Actor.sendTipmsg(sysarg, "您成功领取了活跃度等级"..index.."的奖励。", ttFlyTip)
end

--国庆活动收集字帖，返回抽中的字帖ID，返回0则没有抽中
function DmkjNationalDayRandCharItem(sysarg, randval)
	-- 不中
	if randval > NationalDayCfg.dmkjCharItemRand then		
		return 0
	end
	
	-- 非国庆活动期间
	if not IsNationalDayTime() then
		return 0
	end
	
	-- 抽中一个字帖，则看抽中的是哪个字帖
	local rnd = System.getRandomNumber(10000)
	for i,v in ipairs(NationalDayCfg.dmkjCharItems) do
		if rnd >= v.rand[1] and rnd <= v.rand[2] then
			return v.itemId -- 抽中该字帖
		end
	end
	
	return 0
end

--完成活跃度任务
function NationalDayFinishLivenessTask(sysarg, taskId)
	if not IsNationalDayTime() then
		return
	end
	
	local task = NationalDayCfg.livenessTask[taskId]
	if task == nil then
		print("error, NationalDayFinishLivenessTask taskId="..taskId)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	--增加活跃度信息
	local liveness = 0
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		liveness = var.days.NationalData.liveness
		if liveness == nil then liveness = 0 end
	end	

	liveness = liveness + task.score
	var.days.NationalData.liveness = liveness	
	
	Actor.sendTipmsg(sysarg, string.format("您的活跃度增加了%d，活跃度为%d",task.score, liveness), ttFlyTip)
	
	-- 下发国庆活动图标状态
	SendNationalDayIconStatus(sysarg)
end

-- 完成降妖除魔
function OnNationalDayFinishXiangYaoChuMo(sysarg)
	if not IsNationalDayTime() then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)

	local xycmCount = 0
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		xycmCount = var.days.NationalData.xycmCount
		if xycmCount == nil then xycmCount = 0 end
	end
	
	if xycmCount >= NationalDayCfg.livenessTask[1].limitTimes then
		return
	end
	
	xycmCount = xycmCount + 1
	var.days.NationalData.xycmCount = xycmCount
		
	NationalDayFinishLivenessTask(sysarg, 1)
end

-- 完成采集珍珠
function OnNationalDayFinishCaiJiZhenZhu(sysarg)
	if not IsNationalDayTime() then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)

	local cjzzCount = 0
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		cjzzCount = var.days.NationalData.cjzzCount
		if cjzzCount == nil then cjzzCount = 0 end
	end
	
	if cjzzCount >= NationalDayCfg.livenessTask[2].limitTimes then
		return
	end
	
	cjzzCount = cjzzCount + 1
	var.days.NationalData.cjzzCount = cjzzCount
		
	NationalDayFinishLivenessTask(sysarg, 2)
end

-- 激情PK
function OnNationalDayPlayerDie(sysarg, killer)
	if not IsNationalDayTime() then
		return
	end
	
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < NationalDayCfg.livenessTask[5].level then
		return
	end
	
	local var = Actor.getStaticVar(killer)

	local pkCount = 0
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		pkCount = var.days.NationalData.pkCount
		if pkCount == nil then pkCount = 0 end
	end
	
	if pkCount >= NationalDayCfg.livenessTask[5].limitTimes then
		return
	end
	
	pkCount = pkCount + 1
	var.days.NationalData.pkCount = pkCount
		
	NationalDayFinishLivenessTask(killer, 5)
end

-- 行会捐献
function OnNationalDayGuildDonateResult(sysarg, bindCoinCount)
	if not IsNationalDayTime() then
		return
	end

	-- 每次捐献 100000
	if bindCoinCount < 100000 then return end
	
	local var = Actor.getStaticVar(sysarg)

	local donateCount = 0
	if var.days.NationalData == nil then
		var.days.NationalData = {}
	else
		donateCount = var.days.NationalData.donateCount
		if donateCount == nil then donateCount = 0 end
	end
	
	if donateCount >= NationalDayCfg.livenessTask[6].limitTimes then
		return
	end
	
	donateCount = donateCount + 1
	var.days.NationalData.donateCount = donateCount
		
	NationalDayFinishLivenessTask(sysarg, 6)

end

-- 获得国庆活动图标状态(0：隐藏，1：显示，2：有奖可领)
function GetNationalDayIconStatus(sysarg)
	if not IsNationalDayTime() then		
		return 0
	end
	
	-- 是否有奖可领
	local year, month, day = System.getDate()
	if day < 1 or day > #NationalDayCfg.loginAwardList then		
		return 1
	end	
	
	if GetActorNationalDayFlag(sysarg, day - 1) == false then		
		return 2
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.NationalData == nil then return 1 end
	
	local liveness = var.days.NationalData.liveness	
	if liveness == nil or liveness <= 0 then return 1 end
	
	local startBit = NationalDayFlags.LivenessAward1 - 1
	for i, v in ipairs(NationalDayCfg.livenessLevels) do
		if GetActorNationalDayFlag(sysarg, startBit + i) == false then
			if liveness >= v.liveness then
				return 2
			else
				return 1
			end
		end
	end
	
	return 1
end

--下发国庆活动图标状态
function SendNationalDayIconStatus(sysarg, status)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sNationalDayActivity)
	DataPack.writeByte(netPack, S2C_NationalDayMsgId.IconStatus)
	
	if status == nil then
		status = GetNationalDayIconStatus(sysarg)
	end	
	
	DataPack.writeByte(netPack, status)
	DataPack.flush(netPack)	
end

-- 服务器跨天
function OnNationalDayServerNewDayArrive()
	local year, month, day = System.getDate()
		
	--国庆七天全服双倍经验
	if year == 2015 and month == 10 then
		if day == 1 then
			print("------跨天 国庆活动开启--------")	
			System.broadcastTipmsg(Lang.ScriptTips.zf682,128+2)			
		elseif day == 8 then
			--System.setActivtyExpRate(0,0)
			System.broadcastTipmsg(Lang.ScriptTips.zf683,128+2)
			print("------跨天 国庆七天全服双倍经验关闭--------")
		end
		
		if day >= 1 and day <= 7 then
			if NationalDayCfg.isOpen == true and IsNationalDayDoubleExp(false) then
				--local bResult = System.setActivtyExpRate(1,0)	--通过玩家Buff加了，这里就不加了		
				print("------跨天 国庆七天全服双倍经验开启--------")
			end
		end
	end
end

--在线跨天或跨天登陆
function OnNationalDayPlayerCrossDay(sysarg, var)
	local year, month, day = System.getDate()
	if year == 2015 and month == 10 then
		if day >= 1 and day <= 7 then
			if NationalDayCfg.isOpen == true and IsNationalDayDoubleExp(false) then
				if not Actor.hasBuffById(sysarg, 105) then
					Actor.addBuffById(sysarg, 105) -- 增加 BuffIcon，仅显示
				end
			end
		else
			Actor.delBuffById(sysarg, 105)
		end
	end	

	if var.days.NationalData == nil then
		return
	end
	
	-- 清空国庆活动数据
	local data = var.days.NationalData
	
	data.liveness = nil
	data.xycmCount = nil
	data.cjzzCount = nil	
	data.pkCount = nil
	data.donateCount = nil

	-- 清空国庆活动活跃度等级奖励领取状态	
	local flags = data.flags
	if flags ~= nil then
		for i = NationalDayFlags.LivenessAward1, NationalDayFlags.LivenessAward5 do
			flags = System.setIntBit(flags, i, false)
		end
		
		data.flags = flags
	end
end

function OnNationalDayPlayerLogin(sysarg, isCrossDay)
	if IsNationalDayDoubleExp(true) then
		Actor.addBuffById(sysarg, 105) -- 增加 BuffIcon，仅显示
	end
end

--国庆活动消息
function OnNationalDayActivity(sysarg, msgid, packet)
	if msgid ~= LogicCmd.miscSys.sub.cNationalDayActivity then
		print("error OnNationalDayActivity, msgid="..msgid)
		return
	end
	
	msgid = DataPack.readByte(packet)
		
	if msgid == 1 then --获取国庆活动信息
		GetNationalDayInfo(sysarg, packet)
	elseif msgid == 2 then --领取国庆活动每日登陆奖励
		GetNationalDayLoginAward(sysarg, packet)
	elseif msgid == 3 then --国庆活动字帖对换
		NationalDayCharItemsExchange(sysarg, packet)
	elseif msgid == 4 then --领取国庆活动活跃度奖励
		GetNationalDayLivenessAward(sysarg, packet)
	else
		print("error OnNationalDayActivity, unknown msgid="..msgid)
		return
	end
	
end
--]]