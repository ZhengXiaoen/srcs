--#include "data\config\activity\OpenServerAwardCfg.lua" once
----#include "data\functions\Activity\AwardConditions.lua" once

-- 获取开服奖励剩余名额（-1为不限制名额）
function GetOpenServerAwardLeftQuota(quota, openSrvAward, awardType, awardIndex)
	quota=tonumber(quota)
	--print("quota"..quota)
	if quota == nil then print("quota")return -1 end -- 不限制名额
	if quota == 0 then
		return 0
	elseif quota < 0 then
		return -1 -- 不限制名额	
	end
	if openSrvAward == nil then return quota end
	local awardData = openSrvAward[awardType]
	if awardData == nil then return quota end
	local gotCount = awardData[awardIndex]
	if gotCount == nil then return quota end
	return quota - gotCount
end

-- 玩家是否已经获取了活动的奖励(nil 为错误)
function IsGotOpenServerAward(flags, awardType, awardIndex)
	if flags == nil then return false end
	if awardType < 1 or awardType > 5 then return nil end -- 错误，不能领取
	if awardIndex < 1 or awardIndex > 5 then return nil end -- 错误，不能领取
	
	-- 每个活动预留 5 位
	local bitIdx = (awardType - 1) * 5 + (awardIndex - 1)
	
	local f = System.getIntBit(flags, bitIdx)
	return (f ~= 0) and true or false
end

-- 下发玩家领取开服奖励结果
function SendGiveOpenServerAwardResult(sysarg, awardType, awardIndex, result, gotCount)	
	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGiveOpenServerAward)
	DataPack.writeByte(netPack, awardType)
	DataPack.writeByte(netPack, awardIndex)
	--DataPack.writeByte(netPack, result) -- 是否成功, 0失败，1成功
	DataPack.writeInt(netPack, gotCount) -- 下发已经领取的名额,-1 为不限制
	DataPack.writeUInt(netPack, (var.openSrvFlags == nil) and 0 or var.openSrvFlags)
	--DataPack.writeUInt(netPack, (var.openSrvFlags2 == nil) and 0 or var.openSrvFlags2)
	DataPack.flush(netPack)
end

-- 领取开服奖励
function GiveOpenServerAward(sysarg, awardType, awardIndex)	

	-- 因为要存玩家的领取状态，所以每个活动只分配了 5 位s
	if awardIndex < 1 or awardIndex > 5 then
		print("error: OpenServerAward["..awardType.."] awardIndex="..awardIndex)
		return
	end
	
	-- 暂时只有 5 种活动
	if awardType < 1 or awardType > 5 then
		print("error: OpenServerAward["..awardType.."] awardIndex="..awardIndex)
		return
	end
	
	if not OpenServerAward then return end
	local cfg = OpenServerAward[awardType]

   
	if awardType == 4  or awardType==5 then --4和5去下面了,成了8，9
		cfg = OpenServerAward[awardType+4]
	end
	
	if cfg == nil then
		print("error: config error, OpenServerAward["..awardType.."]==nil")
		return
	end
    if System.getDaysSinceOpenServer() < cfg.openTime[1] or System.getDaysSinceOpenServer() > cfg.openTime[2] then
        return
    end
	-- 是否还在活动时间内
	local openDay = System.getDaysSinceOpenServer()
	if openDay < cfg.openTime[1] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf264,ttFlyTip)
		return
	elseif openDay > cfg.openTime[2] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf662,ttFlyTip)
		return
	end
	
	local itemCfg = cfg.list[awardIndex]
	if itemCfg == nil then
		print("error: config error, OpenServerAward["..awardType.."].list["..awardIndex.."]==nil")
		return
	end

	local sVar = System.getStaticVar()
	
	-- 获取开服奖励剩余名额（-1为不限制名额）
	local leftQuota = GetOpenServerAwardLeftQuota(itemCfg.quota, sVar.openSrvAward, awardType, awardIndex)	
	
	if leftQuota == 0 then -- 没有名额了（-1为不限制名额）
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf663,ttFlyTip)
		--SendGiveOpenServerAwardResult(sysarg, awardType, awardIndex, 0, itemCfg.quota)	
		return
	end
	local var = Actor.getStaticVar(sysarg)
	local actorFlags, aType
	--if awardType >= 1 and awardType <= 4 then
		actorFlags = var.openSrvFlags
		aType = awardType
	--else
		--actorFlags = var.openSrvFlags2
		--aType = awardType - 4
	--end
	if actorFlags == nil then actorFlags = 0 end
	-- 玩家是否已经获取了活动的奖励(nil 为错误)
	local isGot = IsGotOpenServerAward(actorFlags, aType, awardIndex)
	if isGot == nil then
		return -- 错误
	elseif isGot == true then
		Actor.sendTipmsg(sysarg,"已经领过了",ttFlyTip) -- 已经领过了
		return
	end
	if checkIsEnoughtConditions(sysarg,itemCfg.conditions.type,itemCfg.conditions.params) ==false then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf665,ttFlyTip)
		return
	end
	
	--这里判断是否满足条件
	--local func = AwardConditionCheck[itemCfg.conditions.type]
	--if func == nil then
	--	print("error: AwardConditionCheck["..itemCfg.conditions.type.."]==nil")
	--	return
	--end
	--
	---- 检查领取条件
	--local condResult = func(sysarg, itemCfg.conditions.params)
	--if condResult == nil or condResult == false then		
	--	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf665,ttFlyTip) -- 条件不满足
	--	return
	--end
	
	
	
	
	-- 发放奖励
	--local activityStrs = {"level award","swing award","gem award","lingzhu award","strong award"}
	--local logDesc = activityStrs[awardType]..awardIndex
	if Awards.Give(sysarg, itemCfg.award, GameLog.cOpenServerAward, "开服活动") ~= true then
		return
	end
	Actor.sendTipmsg(sysarg,"领取了奖励",ttFlyTip)

	-- 修改领取名额
	local gotCount = -1
	if itemCfg.quota ~= nil and itemCfg.quota > 0 then -- 有名额限制
		if sVar.openSrvAward == nil then
			sVar.openSrvAward = {}
		end
		
		if sVar.openSrvAward[awardType] == nil then
			sVar.openSrvAward[awardType] = {}
		end
		
		gotCount = sVar.openSrvAward[awardType][awardIndex]	
		
		if gotCount == nil then
			gotCount = 1			
		else
			gotCount = tonumber(gotCount) + 1
		end
		
		sVar.openSrvAward[awardType][awardIndex] = gotCount
    
		--print("sVar.openSrvAward["..awardType.."]["..awardIndex.."]="..gotCount)	
	end	

	-- 修改玩家领取奖励标志	
	local bitIdx = (aType - 1) * 5 + (awardIndex - 1) -- 每个活动预留 5 位
	actorFlags = System.setIntBit(actorFlags, bitIdx, true)
	--if awardType >= 1 and awardType <= 4 then
		var.openSrvFlags = actorFlags
	--else
		--var.openSrvFlags2 = actorFlags
	--end

	--local name = {"等级竞技","翅膀竞技","宝石竞技","灵珠竞技","强化福利"}
	--
	--
	--local str = ""
	--if awardType == 1 then
	--	str = string.format(Lang.ScriptTips.zf367,Actor.getName(sysarg),name[awardType],itemCfg.conditions.params[1],itemCfg.conditions.params[2])
	--else
	--	str = string.format(Lang.ScriptTips.zf368,Actor.getName(sysarg),name[awardType],itemCfg.name)
	--	--Lang.ScriptTips.zf369 这个提示用不到了
	--end
	--System.broadcastTipmsg(str,128+2)
	
	-- 下发玩家领取开服奖励结果
	SendGiveOpenServerAwardResult(sysarg, awardType, awardIndex, 1, gotCount)

	-- 记录日志
	--local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	--if awardType == 1 then
	--	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',3,awardIndex,0,'','','','','','','',"GiveOpenServerAward")
	--elseif awardType == 2 then
	--	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',4,awardIndex,0,'','','','','','','',"GiveOpenServerAward")
	--elseif awardType == 3 then
	--	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',5,awardIndex,0,'','','','','','','',"GiveOpenServerAward")
	--elseif awardType == 4 then
	--	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',6,awardIndex,0,'','','','','','','',"GiveOpenServerAward")
	--elseif awardType == 5 then
	--	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',7,awardIndex,0,'','','','','','','',"GiveOpenServerAward")
	--end
end

MiscsImplement.GetNewServerEightDaysHandle =  function( sysarg, msgid, packet )
	--Actor.sendTipmsg(sysarg, "开服活动暂时未开放", ttFlyTip)

	-- 从 1 开始
	local awardType = DataPack.readByte(packet)
	-- 从 1 开始
	local awardIndex = DataPack.readByte(packet)

	GiveOpenServerAward(sysarg, awardType, awardIndex)

end

--获得开服奖励信息
MiscsImplement.HandleGetOpenServerAwardInfo =  function( sysarg, msgid, packet )

	--超过开服时间不处理，不下发信息
	if System.getDaysSinceOpenServer() < 1 or System.getDaysSinceOpenServer() > 7 then
        return
    end

	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetOpenServerAwardInfo)
	
	---- 领取名额
	local sVar = System.getStaticVar()
	
	local all_quotas = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- 40 个
	if sVar.openSrvAward ~= nil then
		for i = 1, 5 do
			local _quotas = sVar.openSrvAward[i]
			if _quotas ~= nil then				
				for j = 1, 5 do -- 每个活动分配了 5 位
					local number = _quotas[j]
					if number ~= nil then
						all_quotas[(i - 1) * 5 + j] = tonumber(number)
					end
				end
			end
		end
	end
	
	for i = 1, 25 do --一共有5个活动
		DataPack.writeWord(netPack, all_quotas[i])
	end
	
	-- 玩家领取标志
	local var = Actor.getStaticVar(sysarg)
	if var.openSrvFlags == nil then 
		DataPack.writeUInt(netPack, 0)
	else 
		DataPack.writeUInt(netPack, var.openSrvFlags)
	end
	--DataPack.writeUInt(netPack, (var.openSrvFlags2 ~= nil) and var.openSrvFlags2 or 0)
		
	DataPack.flush(netPack)
end

function checkIsEnoughtConditions(sysarg,types,params)
	--等级
	if types == 1 then
		if params[1] == nil or params[2] == nil then return false end
	
		if params[1] == 0 then -- 0则不检查转数
			local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
			return (actorLevel >= params[2])
		else
			return Actor.checkActorLevel(sysarg, params[2], params[1])
		end
	--战将等级	
	elseif types == 2 then 
		local herolevel = Hero.getHeroLevel(sysarg)
		return herolevel >= params[1]
	--翅膀
	elseif types == 3 then 
		local swingId = Actor.getIntProperty(sysarg, PROP_ACTOR_SWINGID)
		local value = 0
		for i1, v1 in ipairs(SwingEquipConfig.SwingEquipTable) do
			if v1.id == swingId then
				value = i1
				break
			end
		end
		return value >= params[1]
	--王城霸主
	--elseif types ==4 then 
	--	local sVar = System.getStaticVar()
	--	return false
	----消费排行
	--elseif types ==5 then  
	--	return false
	----宝石
	elseif types == 4 then 
		local equipPtr = Item.getEquipByType(sysarg, Item.itEquipDiamond)
		local value =0
		if equipPtr ~= nil then
			value = Item.getItemId(equipPtr) - 966 -- 459 为1阶
		end

		return value >= params[1]
	--圣珠
	elseif types == 5 then 
		local equipPtr = Item.getEquipByType(sysarg, Item.itSeal)
		if equipPtr ~= nil then
			value = Item.getItemId(equipPtr) - 1176 -- 824 为1阶
		end
			
		return value >= params[1]
	end
end

MiscsImplement.GetNewServerEightDaysHandle2 =  function( sysarg, msgid, packet )
	--Actor.sendTipmsg(sysarg, "开服活动暂时未开放", ttFlyTip)
	local n = DataPack.readByte(packet)
	n=tonumber(n)
	if n==1 then --请求信息
		UpDataInf2(sysarg)
	elseif n==2 then --领取奖励
		local var = Actor.getStaticVar(sysarg)
		if var.getkaifuhuodonglibao ==nil then var.getkaifuhuodonglibao=0 end
		if var.getkaifuhuodonglibao==1 then 
			Actor.sendTipmsg(sysarg, "已经购买过，不能再买", ttFlyTip)
			return
		end
		
		GiveTheAwards2(sysarg)
		UpDataInf2(sysarg)
	end
end

function GiveTheAwards2(sysarg)
	local itemCfg = OpenServerAward[6].list[1]
	
	if Actor.getMoneyCount(sysarg,3)<1 then
		Actor.sendTipmsg(sysarg,"您不够元宝", ttFlyTip) 
		return
	end
	if not Awards.CheckBagGridCount(sysarg,itemCfg.award) then
		--Actor.sendTipmsg(sysarg,"您背包不足以容纳物品", ttFlyTip) 
		return
	end
	
	if Actor.changeMoney(sysarg,3,-1,2615,"购买开服特惠装备")then 
		Awards.Give(sysarg, itemCfg.award, GameLog.cOpenServerAward, "开服活动")
	end
		
	local var = Actor.getStaticVar(sysarg)
	var.getkaifuhuodonglibao = 1
	Actor.sendTipmsg(sysarg, "购买成功", ttFlyTip)
	
end

function UpDataInf2(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.getkaifuhuodonglibao ==nil then var.getkaifuhuodonglibao=0 end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGiveOpenServerAward2)
	DataPack.writeByte(netPack,var.getkaifuhuodonglibao)
	DataPack.flush(netPack)
end


MiscsImplement.GetNewServerEightDaysHandle2 =  function( sysarg, msgid, packet )
	--Actor.sendTipmsg(sysarg, "开服活动暂时未开放", ttFlyTip)
	local n = DataPack.readByte(packet)
	n=tonumber(n)
	if n==1 then --请求信息
		UpDataInf2(sysarg)
	elseif n==2 then --领取奖励
		local var = Actor.getStaticVar(sysarg)
		if var.getkaifuhuodonglibao ==nil then var.getkaifuhuodonglibao=0 end
		if var.getkaifuhuodonglibao==1 then 
			Actor.sendTipmsg(sysarg, "已经购买过，不能再买", ttFlyTip)
			return
		end
		
		GiveTheAwards2(sysarg)
		UpDataInf2(sysarg)
	end
end

function UpDataInf3(sysarg)
    if System.getDaysSinceOpenServer() < OpenServerAward[7].openTime[1] or System.getDaysSinceOpenServer() > OpenServerAward[7].openTime[2] then
        return
    end
    
	local var = Actor.getStaticVar(sysarg)
	if var.qmBoss == nil then 
		var.qmBoss =0
	end
	if var.qmBossLB == nil then 
		var.qmBossLB =0
	end

	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGiveOpenServerAward3)
	DataPack.writeUInt(netPack,var.qmBoss)
	DataPack.writeByte(netPack,var.qmBossLB)
	
	local svar = System.getDyanmicVar(sysarg);
	local itemCfg = OpenServerAward[7].list[1].boss
	if svar.qmBossisKill==nil then svar.qmBossisKill={} end
	for _,v in pairs(itemCfg) do 
		if svar.qmBossisKill[v.id]==nil then svar.qmBossisKill[v.id] = 0 end
		DataPack.writeByte(netPack,svar.qmBossisKill[v.id])
		--print("svar.qmBossisKill[v.id]="..svar.qmBossisKill[v.id])
	end
	DataPack.flush(netPack)
end

function GiveTheAwards3(sysarg)
	local itemCfg = OpenServerAward[7].list[1]
	local var = Actor.getStaticVar(sysarg)
	if var.qmBoss == nil then 
		var.qmBoss =0
	end
	
	--print("var.qmBoss.."..var.qmBoss)
	if var.qmBoss~=63 then 
		Actor.sendTipmsg(sysarg, "条件未达到，不能领取奖品", ttFlyTip)
		return 
	end
	if not Awards.CheckBagGridCount(sysarg,itemCfg.award) then
		return
	end

	Awards.Give(sysarg, itemCfg.award, GameLog.cOpenServerAward, "开服活动")

		
	local var = Actor.getStaticVar(sysarg)
	var.qmBossLB = 1
	Actor.sendTipmsg(sysarg, "领取奖励成功", ttFlyTip)
	
end



--全民boss
MiscsImplement.GetNewServerEightDaysHandle3 =  function( sysarg, msgid, packet )

	local n = DataPack.readByte(packet)
	n=tonumber(n)
	if n==1 then --请求信息
		UpDataInf3(sysarg)
	elseif n==2 then --领取奖励
		local var = Actor.getStaticVar(sysarg)
		if var.qmBossLB ==nil then var.qmBossLB=0 end
		if var.qmBossLB==1 then 
			Actor.sendTipmsg(sysarg, "已经领取过礼包了，不能再领取", ttFlyTip)
			return
		end
		--
		GiveTheAwards3(sysarg)
		UpDataInf3(sysarg)
	end
end



MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetOpenServerAwardInfo, MiscsImplement.HandleGetOpenServerAwardInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveOpenServerAward, MiscsImplement.GetNewServerEightDaysHandle)
--新增加的礼包6
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveOpenServerAward2, MiscsImplement.GetNewServerEightDaysHandle2)
--新增boss礼包7
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveOpenServerAward3, MiscsImplement.GetNewServerEightDaysHandle3)

--测试用的，把已经领取的数据清空
function tobezero(sysarg)
	if not LocalDT.GmRequire(sysarg) then return end
	local sVar = System.getStaticVar()
	sVar.openSrvAward = nil
	System.saveStaticVar()
	-- 清除当前执行者的个人领取标志（如需清全服玩家需逐个处理）
	if sysarg then
		local var = Actor.getStaticVar(sysarg)
		var.openSrvFlags = 0
	end
	Actor.sendTipmsg(sysarg, "全服开服活动领取人数及自身领取标志已重置", ttFlyTip)
end

