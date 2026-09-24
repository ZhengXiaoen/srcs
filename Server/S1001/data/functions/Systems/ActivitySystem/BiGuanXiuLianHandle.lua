--#include "data\config\activity\StdActivityCfg.lua" once

-- 场景配置以下属性:
-- aaWar = 3,			// 战斗区域, 不修改PK值
-- asNoDropEquip = 80,	// 所在场景不爆装备

function StartActivity_BGXLBefore5()
	if System.isCrossServer() ==true then
		return 
	end
	print("闭关修炼活动 预告")	
	local cfg = StdActivityCfg.JiQingBiGuang	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
	
end



-- 开始闭关修炼活动
function StartActivity_BGXL()
	if System.isCrossServer() ==true then
		return 
	end
	print("闭关修炼活动 开始")	
	
	local sdVar = System.getDyanmicVar()
	sdVar.bgxlTime = System.getCurrMiniTime()
	sdVar.bgxlIfCan_broadcastTipmsg=1
	--sdVar.bgxlmultipleAwakeTime = nil
	
	System.addTimer("bgxl_on_timer", 10000, -1)--每10秒获得
end

-- 结束闭关修炼活动
function EndActivity_BGXL()
	if System.isCrossServer() ==true then
		return 
	end
	print("闭关修炼活动 结束")	
	System.deleteTimer("bgxl_on_timer")
	
	local sdVar = System.getDyanmicVar()
	sdVar.bgxlTime = nil
	--sdVar.bgxlmultipleAwakeTime = nil
	sdVar.bgxlIfCan_broadcastTipmsg=nil
	
	local cfg = StdActivityCfg.JiQingBiGuang
	--local playerList = LuaHelp.getSceneActorListById(cfg.sceneid)--全部人退出活动地图		
	--for i, v in ipairs(sdVar.bgxlActorList or {}) do
	
		--local name = Actor.getActorByName(v)
		--print(v)
		--exit_bgxl(v)
	--end	
	if sdVar.bgxlActorList == nil then return end
	for i=1,#sdVar.bgxlActorList do --全部进入过活动的人都要处理
		--print(sdVar.bgxlActorList[i])
		actor = Actor.getActorByName(sdVar.bgxlActorList[i])
		ExitAndClear_bgxl(actor)--离开活动，清除数据
	end
	
	sdVar.bgxlActorList = nil
end

function Start_multipleAwake()--5分钟后开启多重经验
	
	--local sdVar = System.getDyanmicVar()
	--sdVar.bgxlmultipleAwakeTime = System.getCurrMiniTime()
	--System.broadcastTipmsg("激情闭关的多倍泡点已经开启", ttScreenCenter)
	--System.broadcastTipmsg("激情闭关的多倍泡点已经开启", ttChatWindow)
end

function bgxl_on_timer(leftTimes)

	local dVar = System.getDyanmicVar()
	if dVar.bgxlTime == nil then return end
	
	dVar.bgxlIfCan_broadcastTipmsg = 1--每隔10秒才能广播一次
	
	local cfg = StdActivityCfg.JiQingBiGuang
	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneid)
	if playerList == nil then return end

	--local totalCount = #playerList
	
	--local rewardIdx = -1 
	--for i, v in ipairs(cfg.tReward) do                                        --这里是一共多少人，取得多少奖励，不同规则了
		--if totalCount >= v[1] and (v[2] == -1 or totalCount <= v[2]) then
			--rewardIdx = i
			--break
		--end
	--end
	
	--if rewardIdx == -1 then return end

	for i, v in ipairs(playerList) do
		bgxl_give_reward(v)
	end	
end

-- 下发奖励数据
--function bgxl_send_activity_data(sysarg, totalExp, totalDebris)
--function bgxl_send_activity_data(sysarg, totalExp)
function bgxl_send_activity_data(sysarg,types,totalShengZhu,totalExp,totalDebris) --type==0就就是进入时候发的，其他是得到奖励的时候发的
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 18) -- 活动ID
	
	DataPack.writeByte(netPack, types)
	
	DataPack.writeUInt(netPack, totalShengZhu)
	DataPack.writeUInt(netPack, totalExp)
	DataPack.writeUInt(netPack, totalDebris)
	DataPack.flush(netPack)
end

function enter_bgxl(sysarg)
	local sdVar = System.getDyanmicVar()
	if sdVar.bgxlTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.JiQingBiGuang
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate ~= nil and Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return
	end
	
	--在武林争霸中
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == 58 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		return
	end
	
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local RwData = cfg.RwData;
	if plv < cfg.level then--等级限制
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bs00005, RwData[1], cfg.level), ttFlyTip)
		return;
	end
		
	--local times = cfg.tOpenTime.times
	--local timeIdx = checkActivityTime(times)
	--if timeIdx == 0 then	
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	--
	--local endHour = times[timeIdx][3]
	--local endMin = times[timeIdx][4]
	--local endSec = 0
	--if endHour == 0 and endMin == 0 then
	--	endHour = 23
	--	endMin = 59
	--	endSec = 59
	--end
	
	--local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--if leftSecond == 0 or cfg.second == 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - sdVar.bgxlTime)
	if curSceneId == cfg.sceneid then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
		return
	end
	
	if Actor.enterScene(sysarg, cfg.sceneid, 31, 57) == false then
		return
	end
	
	--local dvar = Actor.getDyanmicVar(sysarg)
	--dvar.bgxlExp = 0 --动态经验
	--dvar.bgxlDebris = 0--动态威望值

	if sdVar.bgxlActorList == nil then
		sdVar.bgxlActorList={}
	end
	
	--if Var.days.bgxlExp==nil and Var.days.bgxlDebris ==nil then --第一次进入活动
	if Var.days.bgxlExp==nil then --第一次进入活动
		local name = Actor.getName(sysarg)
		sdVar.bgxlActorList[#sdVar.bgxlActorList+1] = name --保存进入过活动的人的名字		
	end 
		
	if Var.days.bgxlShengZhu==nil then 
		Var.days.bgxlShengZhu=0 --静态威望值
	end
	
	if Var.days.bgxlExp==nil then 
		Var.days.bgxlExp=0 --静态经验
	end
	if Var.days.bgxlDebris==nil then 
		Var.days.bgxlDebris=0 --静态威望值
	end
	
	--进入成功进行广播
	if sdVar.bgxlIfCan_broadcastTipmsg==1 then --10秒才能广播一次，以免广播得太频繁
		local name = Actor.getName(sysarg)
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
		System.broadcastTipmsg(string.format(Lang.ScriptTips.bg00003, name, RwData[1], cfg.second), ttScreenCenter)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.bg00004, name, RwData[1], cfg.second, NpcName, NpctFly), ttChatWindow)
		sdVar.bgxlIfCan_broadcastTipmsg=0
	end
	
	--Actor.setPkMode(sysarg,fpPk)
	
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	
	OnFinish_Liveness(sysarg,12)
	
	bgxl_send_activity_data(sysarg, 0,Var.days.bgxlShengZhu,Var.days.bgxlExp,Var.days.bgxlDebris)--进入活动的时候也要下发经验
	--bgxl_send_activity_data(sysarg, Var.days.bgxlExp, Var.days.bgxlDebris)--进入活动的时候也要下发经验
end

--退出闭关修炼，不清除数据
function exitDontClearData_bgxl(sysarg)

	local sceneId = Actor.getSceneId(sysarg)
	if sceneId== StdActivityCfg.JiQingBiGuang.sceneid then 
		Actor.enterScene(sysarg,9,138,151)
	end
	sendExitActivity(sysarg, StdActivityCfg.JiQingBiGuang.id)	
	
	
end


-- 退出闭关修炼并且清除数据
function ExitAndClear_bgxl(sysarg)

	if sysarg == nil then return end --已经下线了
	
	local Var = Actor.getStaticVar(sysarg)
	local bgxlShengZhu = Var.days.bgxlShengZhu
	local bgxlExp = Var.days.bgxlExp 
	local bgxlDebris = Var.days.bgxlDebris 
	
	if bgxlExp == nil then  bgxlExp=0 end
	if bgxlDebris == nil then  bgxlDebris=0 end
	if bgxlShengZhu == nil then bgxlShengZhu =0 end
	
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		
	--local str = string.format("您在激情闭关活动中，总共获得圣珠结晶*%d，望再接再厉",bgxlExp)
	--System.AddMail(actorID, 3, 0, "激情闯关", str)
		
	Var.days.bgxlShengZhu =nil 
	Var.days.bgxlExp = nil
	Var.days.bgxlDebris = nil

	--local dvar = Actor.getDyanmicVar(sysarg)
	--dvar.bgxlExp = nil
	--dvar.bgxlDebris = nil
	local sceneId = Actor.getSceneId(sysarg)
	if sceneId== StdActivityCfg.JiQingBiGuang.sceneid then 
		Actor.enterScene(sysarg,9,138,151)
		Actor.sendTipmsg(actor, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
	end
	--Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00006, ttFlyTip)
	
	
	sendExitActivity(sysarg, StdActivityCfg.JiQingBiGuang.id)	
end

--已经下线的玩家，在下次上线的时候清除数据和发送邮件
function clearData_Jiqingbiguang(sysarg)

	local sdVar = System.getDyanmicVar()
	if sdVar.bgxlTime == nil then	
		
		local Var = Actor.getStaticVar(sysarg)
		local bgxlShengZhu = Var.days.bgxlShengZhu
		local bgxlExp = Var.days.bgxlExp 
		local bgxlDebris = Var.days.bgxlDebris 
		
		if bgxlExp == nil then  bgxlExp=0 end
		if bgxlDebris == nil then  bgxlDebris=0 end
		if bgxlShengZhu ==nil then bgxlShengZhu =0 end
		--if bgxlExp == 0 and bgxlDebris == 0 then return end
		--if bgxlExp == 0  then return end
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		
		--local str = string.format("您在激情闭关活动中，总共获得圣珠结晶*%d，望再接再厉",bgxlExp)
		--System.AddMail(actorID, 3, 0, "激情闯关", str)
	
		local Var = Actor.getStaticVar(sysarg)
		Var.days.bgxlExp = nil
		Var.days.bgxlDebris = nil
		Var.days.bgxlShengZhu =nil 

	end
end



-- 每10秒发放一次奖励
function bgxl_give_reward(sysarg)
			
	-- 是否还活着
	if Actor.isDeath(sysarg) == true then
		--exit_bgxl(sysarg)
		return
	end
	
	local cfg = StdActivityCfg.JiQingBiGuang
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local myHonor = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
	local addShengZhu =0
	local addExp = 0
	local addHonor=0
	
	for i=1,#cfg.tReward do
		if plv>=cfg.tReward[i][1] and plv<=cfg.tReward[i][2] then 
			addShengZhu = cfg.tReward[i][3]
			addExp = cfg.tReward[i][4]
			addHonor = cfg.tReward[i][5]
			break
		end
	end
	
	if Actor.hasMapAreaAttri(sysarg,1)==true then --在安全区域内
		addShengZhu=addShengZhu
		addExp=addExp
		addHonor=addHonor
		
	else --非安全区，判断是否在点内
		local sdVar = System.getDyanmicVar()
		--if sdVar.bgxlmultipleAwakeTime ~= nil then --如果多倍经验已经开启
		
			local posx = Actor.getIntProperty(sysarg, PROP_ENTITY_POSX)
			local posy = Actor.getIntProperty(sysarg, PROP_ENTITY_POSY)
			local counter=0
			for i=1,#cfg.tPosMultiple do 
				if cfg.tPosMultiple[i][1]== posx and cfg.tPosMultiple[i][2]== posy then 
					addShengZhu = cfg.tPosMultiple[i][3]*addShengZhu
					addExp= cfg.tPosMultiple[i][3]*addExp
					addHonor = cfg.tPosMultiple[i][3]*addHonor
					break
				end
				counter=i
			end
			if counter == #cfg.tPosMultiple then 
				addShengZhu=addShengZhu*2
				addExp=addExp*2
				addHonor=addHonor*2
			end
		--else --如果多倍经验还没开启
		--	addExp=addExp
		--	addHonor=addHonor
		--end
	end
--[[
	local rate = 1
	local multIdx = -1
	for i, v in ipairs(cfg.tPosMultiple) do
		if posx == v[1] and posy == v[2] then
			rate = v[3]
			multIdx = i--索引
			break
		end
	end
	
	local rewardCfg = cfg.tReward[rewardIdx]
		
	local exp = rewardCfg[3] * rate -- 经验
	local debris = rewardCfg[4] * rate -- 碎片	
	--]]
	if addExp~=0 and addHonor ~=0 and addShengZhu~=0 then 
	--if addExp~=0 then 
		--local dvar = Actor.getDyanmicVar(sysarg)
		--local bgxlExp = dvar.bgxlExp
		--local bgxlDebris = dvar.bgxlDebris
		
		local Var = Actor.getStaticVar(sysarg)
		local bgxlShengZhu = Var.days.bgxlShengZhu
		local bgxlExp = Var.days.bgxlExp --静态经验
		local bgxlDebris = Var.days.bgxlDebris --静态威望值
	
		if not bgxlShengZhu then
			bgxlShengZhu = addShengZhu
		else
			bgxlShengZhu = bgxlShengZhu + addShengZhu
		end
	
		if not bgxlExp then
			bgxlExp = addExp
		else
			bgxlExp = bgxlExp + addExp
		end
		
		if not bgxlDebris then		
			bgxlDebris = addHonor
		else
			bgxlDebris = bgxlDebris + addHonor
		end
		
		--dvar.bgxlExp = bgxlExp
		--dvar.bgxlDebris = bgxlDebris
		Var.days.bgxlShengZhu = bgxlShengZhu
		Var.days.bgxlExp = bgxlExp
		Var.days.bgxlDebris = bgxlDebris
		
		-- 计算奖励
		Actor.addExp(sysarg, addExp, LogIds.bgxlAddExp, 0)
		
		Actor.addAchievePoint(sysarg, addHonor)		
				
		Actor.setUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP, (Actor.getUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP) + addShengZhu));
		
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", addShengZhu, "圣珠结晶"), 1);
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", addExp, "经验值"), 1);
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", addHonor, "成就值"), 1);
		Actor.playEnergyEffect(sysarg,4,0)
		
		
		--local currdebris = Actor.getIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT)
		--Actor.setIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT, currdebris + debris)	
			
		--if multIdx ~= -1 then
			--local multItem = cfg.tPosMultiple[multIdx]
			--Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bg00002, multItem[4], multItem[3]), ttFlyTip)
		--end
		--Actor.sendTipmsg(sysarg, string.format("恭喜您获得圣珠结晶 %d ", addExp), ttFlyTip)
		
		--下发前端更新数据
		bgxl_send_activity_data(sysarg,1, bgxlShengZhu,bgxlExp,bgxlDebris)
	end 
	
end