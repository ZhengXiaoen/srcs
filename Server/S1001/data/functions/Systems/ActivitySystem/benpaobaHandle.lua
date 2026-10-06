-- 奔跑吧兄弟
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once

local monsterData={
{66,109},
{67,110},
{68,111},
{69,112},
{70,113},
{71,114},
{72,115},
{73,116},
{66,110},
{67,111},
{68,112},
{69,113},
{70,114},
{71,115},
{72,116},
{73,117},
{65,110},
{66,111},
{67,112},
{68,113},
{69,114},
{70,115},
{71,116},
{72,117},
{64,110},
{65,111},
{66,112},
{67,113},
{68,114},
{69,115},
{70,116},
{71,117},
{72,118},
}


-- 开始奔跑吧兄弟活动
function StartActivity_bpbxdBefore5()

	if System.isCrossServer() ==true then
		return 
	end
	
	local cfg = StdActivityCfg.BenPaoBaXiongDi	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function StartActivity_bpbxd(sysarg, startTime, endTime)

	if System.isCrossServer() ==true then
		return 
	end
	
	print("奔跑吧兄弟活动 开始")	

	local svar = System.getStaticVar()
	
	-- 排行榜先清0
	Ranking.clear_ranking(1, true)

	local dVar = System.getDyanmicVar()
	dVar.bpbxdTime = startTime or System.getCurrMiniTime()
	--一二三层的名次
	--dVar.bpxdAwardNumber1=0
	dVar.bpxdAwardNumber2=0
	--dVar.bpxdAwardNumber3=0
	
	--System.addTimer("bpbxd_on_timer", 8000, -1)
	
	--创造怪物
	for i=1,#monsterData do 
		local nHandle = Fuben.getSceneHandleById(216,0)
		local left = dVar.bpbxdTime + 60 - System.getCurrMiniTime()
		if left > 0 then Fuben.createMonster(nHandle, 561, monsterData[i][1],monsterData[i][2], left) end -- 恢复时不重新生成已消失的起跑阻挡怪
	end
	-- 恢复场次时仅保留尚未到达的倒计时，避免重启后重新等待开跑。
	for _, timer in ipairs({{"bpbxd_left30", 30}, {"bpbxd_left10", 50}, {"bpbxd_left5", 55}, {"bpbxd_left0", 65}}) do
		local delay = dVar.bpbxdTime + timer[2] - System.getCurrMiniTime()
		if delay > 0 then System.addTimer(timer[1], delay * 1000, 1) end
	end
	
	local sceen = Fuben.getSceneById(342, 0)
	Fuben.clearSceneAllMonsters(sceen, 4)--把boss清除了
	local nHandle = Fuben.getSceneHandleById(342,0)
	Fuben.createMonster(nHandle, 575, 33, 30, 10800,true)--重新刷boss
end

function bpbxd_left30(leftTimes)
	local playerList = LuaHelp.getSceneActorListById(216)
	if playerList == nil then return end
	for i, v in ipairs(playerList) do
		if v~=nil then 
			--播东西
			Actor.sendTipmsg(v,"30秒后奔跑开启,预备~",ttScreenCenter)
			Actor.sendTipmsg(v,"30秒后奔跑开启,预备~",ttChatWindow)
		end
	end
	System.deleteTimer("bpbxd_left30")
end
function bpbxd_left10(leftTimes)
	local playerList = LuaHelp.getSceneActorListById(216)
	if playerList == nil then return end
	for i, v in ipairs(playerList) do
		if v~=nil then 
			--播东西
			Actor.sendTipmsg(v,"10秒后奔跑开启,预备~",ttScreenCenter)
			Actor.sendTipmsg(v,"10秒后奔跑开启,预备~",ttChatWindow)
		end
	end
	System.deleteTimer("bpbxd_left10")
end
function bpbxd_left5(leftTimes)
	local playerList = LuaHelp.getSceneActorListById(216)
	if playerList == nil then return end
	for i, v in ipairs(playerList) do
		if v~=nil then 
			--播东西
			Actor.sendTipmsg(v,"5秒后奔跑开启,预备~",ttScreenCenter)
			Actor.sendTipmsg(v,"5秒后奔跑开启,预备~",ttChatWindow)
			
			local netPack = DataPack.allocPacket(v, 139, 211)
			DataPack.flush(netPack)
		end
	end
	System.deleteTimer("bpbxd_left5")	
end
function bpbxd_left0(leftTimes)
	local playerList = LuaHelp.getSceneActorListById(216)
	if playerList == nil then return end
	for i, v in ipairs(playerList) do
		if v~=nil then 
			--播东西
			Actor.sendTipmsg(v,"开始！可使用加速让自己奔跑速度得以提升,可使用减速使别人速度减慢,可使用解来解除减速效果.合理搭配必拿第一！",ttChatWindow)
		end
	end
	System.deleteTimer("bpbxd_left0")
end


-- 结束奔跑吧兄弟活动
function EndActivity_bpbxd()

	if System.isCrossServer() ==true then
		return 
	end
	
	print("奔跑吧兄弟活动 结束")	
	
	--System.deleteTimer("bpbxd_on_timer")
	local dVar = System.getDyanmicVar()		
	dVar.bpbxdTime = nil
	
	Ranking.save_ranking(1, true)
	
	local cfg = StdActivityCfg.BenPaoBaXiongDi

	local playerList = LuaHelp.getSceneActorListById(216)
	if playerList~=nil then 
		for i, v in ipairs(playerList or {}) do
			if v~=nil then 
				exit_bpbxd(v)
				Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			end			
		end	
	end
	
	--local playerList = LuaHelp.getSceneActorListById(217)		
	--if playerList~=nil then 
	--	for i, v in ipairs(playerList or {}) do
	--		if v~=nil then 
	--			exit_bpbxd(v)
	--			Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
	--		end	
	--	end	
	--end
	
	local playerList = LuaHelp.getSceneActorListById(218)	
	if playerList~=nil then 	
		for i, v in ipairs(playerList or {}) do
			if v~=nil then 
				exit_bpbxd(v)
				Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			end	
		end	
	end
	
	local playerList = LuaHelp.getSceneActorListById(342)	
	if playerList~=nil then 	
		for i, v in ipairs(playerList or {}) do
			if v~=nil then 
				exit_bpbxd(v)
				Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			end	
		end	
	end
	
end

--function bpbxd_on_timer(leftTimes)
--	local dVar = System.getDyanmicVar()
--	if dVar.bpbxdTime == nil then return end
--	
--	local cfg = StdActivityCfg.BenPaoBaXiongDi
--	
--	local playerList = LuaHelp.getSceneActorListById(cfg.sceneid)
--	if playerList == nil then return end
--
--	for i, v in ipairs(playerList) do
--		bpbxd_give_reward(v, cfg.pdAward)
--	end
--end
--
---- 计算经验奖励
--function bpbxd_calc_exp_award(sysarg, award_list)
--	local exp = 0
--	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
--	
--	for i, v in ipairs(award_list) do
--		if level >= v.minlv and (level <= v.maxlv or v.maxlv == -1) then
--			exp = v.exp
--			break
--		end
--	end
--	
--	return exp
--end

-- 每8秒发一次奖励
--function bpbxd_give_reward(sysarg, award_list)		
--	-- 是否还活着
--	if Actor.isDeath(sysarg) then return end
--	
--	local addexp = bpbxd_calc_exp_award(sysarg, award_list)
--	
--	local var = Actor.getStaticVar(sysarg)
--	local bpbxdExp = var.days.bpbxdExp
--	if bpbxdExp == nil then
--		bpbxdExp = addexp
--	else
--		bpbxdExp = bpbxdExp + addexp
--	end
--	var.days.bpbxdExp = bpbxdExp	
--	
--	Actor.addExp(sysarg, addexp, LogIds.bpbxdAddExp, 0)	
--end

function can_enter_bpbxd(sysarg, isTip)		
	local dVar = System.getDyanmicVar()
	if dVar.bpbxdTime == nil then -- 活动还没开始
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local cfg = StdActivityCfg.BenPaoBaXiongDi	
	
	if Actor.checkActorLevel(sysarg, cfg.level, 0) ~= true then
		if isTip then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.wl00005, cfg.level), ttFlyTip)
		end
		return
	end
	
	--在武林争霸中
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == 58 then
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		end
		return false
	end
	
	if curSceneId == cfg.sceneid then
		if isTip then
			Actor.sendTipmsg(sysarg, "您已经在活动中了!", ttFlyTip)
		end
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	--运镖中
	if var.ybstate ~= nil and var.ybstate == 1 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip)
		end
		return false
	end
	
	-- 在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		end
		return false
	end

	--if checkActivityTime(cfg.tOpenTime.times) == 0 then
	--	if isTip then
	--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	end
	--	return false
	--end
	
	return true
end

-- 参加活动 奔跑吧兄弟
function enter_bpbxd(sysarg)
	if not can_enter_bpbxd(sysarg, true) then
		return
	end
	
	local cfg = StdActivityCfg.BenPaoBaXiongDi
	
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
	--
	--local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--if leftSecond == 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end	
	local dVar = System.getDyanmicVar()
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.bpbxdTime)
	
	if Actor.enterScene(sysarg, 216, 33, 173) == false then
		return
	end
	
	--local svar = Actor.getStaticVar(sysarg)
	--svar.days.pbpxdCardCount = 0
			
	local RwData = cfg.RwData
	local name = Actor.getName(sysarg)
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])

	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00001, name, RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00002, name, RwData[1], NpcName, NpctFly), ttChatWindow)
	
	sVar=Actor.getStaticVar(sysarg)
	if sVar.days.bpxdAwadeFlage == nil then 
		sVar.days.bpxdAwadeFlage = 1 --(表示是否第一次领取奖励，是第一次才能领取,1代表是，2代表不是)
		--sVar.days.bpxdAwadeFlage = 0
		sVar.days.bpAB1=0 --奔跑兄弟addbuff
		sVar.days.bpAB2=0
		sVar.days.bpAB3=0
	end

	sendJoinActivity(sysarg, cfg.id, leftSecond)
	sendActivityDataBPBXD(sysarg,216)
	
	OnFinish_Liveness(sysarg,4)
	
	--if sVar.days.bpxdAwadeFlage ==1 then 
	--	Actor.sendTipmsg(sysarg, string.format("您已最高跑至2层,跑完的层将不会获得对应活动奖励!"), ttDialog)	
	--elseif sVar.days.bpxdAwadeFlage ==2 then 
	--	Actor.sendTipmsg(sysarg, string.format("您已最高跑至3层,跑完的层将不会获得对应活动奖励!"), ttDialog)	
	--elseif sVar.days.bpxdAwadeFlage ==3 then 
	--	Actor.sendTipmsg(sysarg, string.format("您已最高跑至4层,跑完的层将不会获得对应活动奖励!"), ttDialog)	
	--end
	--
	SendMsgs(sysarg,1)
	SendMsgs(sysarg,2)
	SendMsgs(sysarg,3)
end
function SendMsgs(sysarg,index)
	index = tonumber(index)
	local sVar=Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, 210)
	DataPack.writeByte(netPack, index) 
	local tosend =nil 
	if index ==1 then 
		DataPack.writeByte(netPack, sVar.days.bpAB1) 
	elseif index ==2 then 
		DataPack.writeByte(netPack, sVar.days.bpAB2) 
	elseif index ==3 then 
		DataPack.writeByte(netPack, sVar.days.bpAB3) 
	end
	DataPack.flush(netPack)
end

function exit_bpbxd(sysarg)
	Actor.exitActivityScene(sysarg)	
	sendExitActivity(sysarg, 8)
end

-- 领取奖励
function get_bpbxd_award(sysarg)
	local my_rank =0 
	local dVar = System.getDyanmicVar()
	local randomNmber =0
	local GiftConfig =nil
	local floorNumber = 0 
	sVar=Actor.getStaticVar(sysarg)
	if Actor.getSceneId(sysarg) == 216 then 
		--if sVar.days.bpxdAwadeFlage == 0 then --第一次领取奖励
		--	floorNumber =1 
		--	my_rank = dVar.bpxdAwardNumber1+1
		--	dVar.bpxdAwardNumber1=my_rank
		--	sVar.days.bpxdAwadeFlage = 1
		--	
		--	if my_rank <=0 then
		--		return 
		--	elseif my_rank >=1 and my_rank <=3 then
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[1][1]
		--	elseif my_rank <=20 then
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[2][1]
		--	else
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[3][1]
		--	end
		--	
		--	--randomNmber = math.random(1,#GiftConfig)
		--	--local Gift=GiftConfig[randomNmber]
		--	--local Gifts={}
		--	--table.insert(Gifts, Gift)
		--	--
		--	--if not Awards.CheckBagGridCount(sysarg, Gifts) then
		--	--	Actor.sendTipmsg(sysarg,"背包空间不足以容纳奖品 ", ttFlyTip) 
		--	--	return
		--	--end
		--    --
		--	--Awards.Give(sysarg, Gifts,2616,"bengpaoxiongdiAwards")
		--	--print("得到奖励1")
		--	Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + GiftConfig[1]));
		--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护符碎片>",GiftConfig[1]),1);
		--	Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + GiftConfig[2]));
		--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护盾碎片>",GiftConfig[2]),1);
		--	Actor.changeMoney(sysarg, mtBindCoin, GiftConfig[3],2616,"bengpaoxiongdiAwards")
		--	
		--end
		--Actor.enterScene(sysarg, 217, 90, 185)
		--System.broadcastTipmsg(string.format("<(n%s)>玩家运气与实力并存,竟然让他走到了%s,厉害了我的哥",Actor.getName(sysarg),Fuben.getSceneNameById(217)), ttChatWindow)	
		--sendActivityDataBPBXD(sysarg,217)
	elseif Actor.getSceneId(sysarg) == 218 then --第一次领取奖励
		if sVar.days.bpxdAwadeFlage == 1 then 
			floorNumber =2
			my_rank = dVar.bpxdAwardNumber2+1
			dVar.bpxdAwardNumber2=my_rank
			sVar.days.bpxdAwadeFlage = 2
			
			if my_rank <=0 then
				return 
			--elseif my_rank >=1 and my_rank <=3 then
			--	GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[1][1]
			--elseif my_rank <=20 then
			--	GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[2][1]
			--else
			--	GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[3][1]
			elseif my_rank==1 then --第一名
				GiftConfig = StdActivityCfg.BenPaoBaXiongDi.rewards[1]
			elseif my_rank==2 then --第2名
				GiftConfig = StdActivityCfg.BenPaoBaXiongDi.rewards[2]
			elseif my_rank==3 then --第3名
				GiftConfig = StdActivityCfg.BenPaoBaXiongDi.rewards[3]
			elseif my_rank>=4 and  my_rank<=10 then --4~10名
				GiftConfig = StdActivityCfg.BenPaoBaXiongDi.rewards[4]
			else --参与奖
				GiftConfig = StdActivityCfg.BenPaoBaXiongDi.rewards[5]
			end
		
			--randomNmber = math.random(1,#GiftConfig)
			--local Gift=GiftConfig[randomNmber]
			--local Gifts={}
			--table.insert(Gifts, Gift)
			--
			--if not Awards.CheckBagGridCount(sysarg, Gifts) then
			--	Actor.sendTipmsg(sysarg,"背包空间不足以容纳奖品 ", ttFlyTip) 
			--	return
			--end
		    --
			--Awards.Give(sysarg, Gifts,2616,"bengpaoxiongdiAwards")
			--print("得到奖励2")
			
			--Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + GiftConfig[1]));
			--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护符碎片>",GiftConfig[1]),1);
			--Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + GiftConfig[2]));
			--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护盾碎片>",GiftConfig[2]),1);
			--Actor.changeMoney(sysarg, mtBindCoin, GiftConfig[3],2616,"bengpaoxiongdiAwards")
			
			if Awards.Give(sysarg,GiftConfig,2616,"bengpaoxiongdiAwards") == false then
				return
			end
		else 
			Actor.sendTipmsg(sysarg,"您已经领取过奖励，不能再领了 ", ttFlyTip) 
		end
		--Actor.enterScene(sysarg, 218, 115, 195)
		--System.broadcastTipmsg(string.format("<(n%s)>玩家运气与实力并存,竟然让他走到了%s,厉害了我的哥",Actor.getName(sysarg),Fuben.getSceneNameById(218)), ttChatWindow)	
		sendActivityDataBPBXD(sysarg,217)
	elseif 	Actor.getSceneId(sysarg) == 217 then --第一次领取奖励
		--if sVar.days.bpxdAwadeFlage == 2 then
		--	floorNumber =3
		--	my_rank = dVar.bpxdAwardNumber3+1
		--	dVar.bpxdAwardNumber3=my_rank
		--	sVar.days.bpxdAwadeFlage = 3
		--	
		--	if my_rank <=0 then
		--		return 
		--	elseif my_rank >=1 and my_rank <=3 then
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[1][1]
		--	elseif my_rank <=20 then
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[2][1]
		--	else
		--		GiftConfig=StdActivityCfg.BenPaoBaXiongDi.rewards[3][1]
		--	end
		--	
		--	--randomNmber = math.random(1,#GiftConfig)
		--	--local Gift=GiftConfig[randomNmber]
		--	--local Gifts={}
		--	--table.insert(Gifts, Gift)
		--	--
		--	--if not Awards.CheckBagGridCount(sysarg, Gifts) then
		--	--	Actor.sendTipmsg(sysarg,"背包空间不足以容纳奖品 ", ttFlyTip) 
		--	--	return
		--	--end
		--    --
		--	--Awards.Give(sysarg, Gifts,2616,"bengpaoxiongdiAwards")
		--	--print("得到奖励3")	
		--	
		--	Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + GiftConfig[1]));
		--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护符碎片>",GiftConfig[1]),1);
		--	Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + GiftConfig[2]));
		--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护盾碎片>",GiftConfig[2]),1);
		--	--Actor.changeMoney(sysarg, mtBindCoin, GiftConfig[3],2616,"bengpaoxiongdiAwards")		
		--end
		---- Actor.enterScene(sysarg, 342, 30, 44)--取到奔跑4层
		---- System.broadcastTipmsg(string.format("<(n%s)>玩家运气与实力并存,竟然让他走到了%s,厉害了我的哥",Actor.getName(sysarg),Fuben.getSceneNameById(342)), ttChatWindow)	
		---- sendActivityDataBPBXD(sysarg,342)
		----exit_bpbxd(sysarg)
	end
	
	--print("my_rank.."..my_rank)
	if my_rank <=0 then
		return 
	--elseif my_rank >=1 and my_rank <=3 then
	--	--Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ,绑定金币 x%s", my_rank,GiftConfig[1],GiftConfig[2],GiftConfig[3]), ttDialog)
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ", my_rank,GiftConfig[1],GiftConfig[2]), ttDialog)
	--	---if randomNmber~=1 then Actor.playEnergyEffect(sysarg,4,0) end
	--	Actor.playEnergyEffect(sysarg,4,0)
	--	--System.broadcastTipmsg(string.format("<(n%s)>玩家成功领取了奔跑吧兄弟第%s层 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ,绑定金币 x%s",Actor.getName(sysarg),floorNumber, my_rank,GiftConfig[1],GiftConfig[2],GiftConfig[3]), ttChatWindow)	
	--	--System.broadcastTipmsg(string.format("<(n%s)>玩家成功领取了奔跑吧兄弟第%s层 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ",Actor.getName(sysarg),floorNumber, my_rank,GiftConfig[1],GiftConfig[2]), ttChatWindow)	
	--	System.broadcastTipmsg(string.format("<(n%s)>玩家成功领取了奔跑吧兄弟第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ",Actor.getName(sysarg), my_rank,GiftConfig[1],GiftConfig[2]), ttChatWindow)	
	--elseif my_rank <=20 then
	--	--if randomNmber~=1 then Actor.playEnergyEffect(sysarg,4,0) end
	--	Actor.playEnergyEffect(sysarg,4,0)
	--	--Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ,绑定金币 x%s", my_rank,GiftConfig[1],GiftConfig[2],GiftConfig[3]), ttDialog)
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:护符碎片 x%s,护盾碎片 x%s ", my_rank,GiftConfig[1],GiftConfig[2]), ttDialog)
	--else
	--	Actor.playEnergyEffect(sysarg,4,0)
	--	---Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 参与奖:护符碎片 x%s,护盾碎片 x%s ,绑定金币 x%s", GiftConfig[1],GiftConfig[2],GiftConfig[3]), ttDialog)
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 参与奖:护符碎片 x%s,护盾碎片 x%s ", GiftConfig[1],GiftConfig[2]), ttDialog)
	elseif my_rank==1 then --第一名
		Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:元宝 x%s,绑定金币 x%s", my_rank,GiftConfig[1].count,GiftConfig[2].count), ttDialog)
	elseif my_rank==2 then --第2名
		Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:元宝 x%s,绑定金币 x%s", my_rank,GiftConfig[1].count,GiftConfig[2].count), ttDialog)
	elseif my_rank==3 then --第3名
		Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:元宝 x%s,绑定金币 x%s", my_rank,GiftConfig[1].count,GiftConfig[2].count), ttDialog)
	elseif my_rank>=4 and  my_rank<=10 then --4~10名
		Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 第%s名的奖励:元宝 x%s,绑定金币 x%s", my_rank,GiftConfig[1].count,GiftConfig[2].count), ttDialog)
	else --参与奖
		Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 参与奖奖励:绑定金币 x%s",GiftConfig[1].count), ttDialog)
	end

		
	--local dVar = System.getDyanmicVar()
	--if dVar.bpbxdTime ~= nil then -- 活动中, 还不能领取奖励
	--	return
	--end
	--
	--local var = Actor.getStaticVar(sysarg)
	--if var.days.pbpxdCardCount == nil then
	--	return -- 没有参与活动或者已经领取了
	--end
	--
	--if var.days.pbpxdCardCount == 0 then 
	--	return
	--end
	--
	--local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	---- 从 0 开始, -1 为没有进排行榜
	--local myRank = Ranking.find_actor_ranking(1, actorId)
	--myRank = myRank + 1				
	--	
	--local cfg = StdActivityCfg.BenPaoBaXiongDi
	--
	--if myRank >= 1 and myRank <= 3 then
	--	Actor.changeMoney(sysarg, mtYuanbao, cfg.tYBAwards[myRank], LogIds.bpbxdGetAward, tostring(myRank))		
	--else -- 参与奖
	--	Actor.changeMoney(sysarg, mtBindYuanbao, cfg.tBindYBAward, LogIds.bpbxdGetAward, "")
	--end
	--
	--var.days.pbpxdCardCount = nil -- 已经领取了
	--
	--if myRank == 1 then
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 [第一名] 的奖励 %d 元宝", cfg.tYBAwards[1]), ttFlyTip)
	--elseif myRank == 2 then
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 [第二名] 的奖励 %d 元宝", cfg.tYBAwards[2]), ttFlyTip)
	--elseif myRank == 3 then
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 [第三名] 的奖励 %d 元宝", cfg.tYBAwards[3]), ttFlyTip)
	--else
	--	Actor.sendTipmsg(sysarg, string.format("您成功领取了奔跑吧兄弟 [参与奖] 的奖励 %d 绑定元宝", cfg.tBindYBAward), ttFlyTip)
	--end
end

function pbpxd_OnPlayerDie(sysarg, killer, killerType)
	--if killer == nil or killerType ~= 0 then return end
	--
	--local cfg = StdActivityCfg.BenPaoBaXiongDi
	--pbpxd_add_card(killer, cfg.tCard.actor)
end

function pbpxd_OnMonsterByKilled(monster, sysarg, monId, monsterType,sceneId)--	杀死怪物,全层的人广播
	--local count = 0	
	--local cfg = StdActivityCfg.BenPaoBaXiongDi
	--if monsterType == 4 then -- boss 怪
	--	count = cfg.tCard.boss
	--else
	--	count = cfg.tCard.monster
	--end
	--
	--pbpxd_add_card(sysarg, count)
	local playerList = LuaHelp.getSceneActorListById(sceneId)
	if playerList == nil then return end

	for i, v in ipairs(playerList) do
		sendActivityDataBPBXD(sysarg,sceneId)
	end
	
	
end

-- 更新活动数据
function sendActivityDataBPBXD(sysarg,sceneid)
--	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
--	DataPack.writeByte(netPack, 8) -- 活动类型
--	--print("sceneid="..sceneid)
--	local nHandle = Fuben.getSceneHandleById(sceneid, 0)
--	--print("Fuben.getLiveMonsterCount(nHandle)="..Fuben.getLiveMonsterCount(nHandle))
--	DataPack.writeByte(netPack, Fuben.getLiveMonsterCount(nHandle)) --怪物数量
--	if sceneid== 216 then 
--		DataPack.writeByte(netPack,1)
--	elseif sceneid==217 then 
--		DataPack.writeByte(netPack,2)
--	elseif  sceneid==218 then 
--		DataPack.writeByte(netPack,3)
--	else 
--		DataPack.writeByte(netPack,4)
--	end
--	DataPack.flush(netPack)
--	
--	--
--	--local var = Actor.getStaticVar(sysarg)
--	--local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
--	--
--	---- 我的排名, 从0开始, -1则不进排行榜
--	--local count, myRank = Ranking.packetRankingItems(netPack, 1, -1, actorId)	
--	--
--	--local cardCount = var.days.pbpxdCardCount
--	--if cardCount == nil then cardCount = 0 end
--	--
--	--local bpbxdExp = var.days.bpbxdExp
--	--if bpbxdExp == nil then bpbxdExp = 0 end	
--	--
--	--DataPack.writeByte(netPack, myRank + 1) -- 0 为不上榜
--	--DataPack.writeUInt(netPack, cardCount)
--	--DataPack.writeUInt(netPack, bpbxdExp)	
--	--
--	--DataPack.flush(netPack)
--	
--	--print(Actor.getName(sysarg),":",myRank+1)
end
function pbpxd_add_card(sysarg, count)
	--local sysdVar = System.getDyanmicVar()
	--if sysdVar.bpbxdTime == nil then -- 活动还没开始
	--	return
	--end
	--
	--local svar = Actor.getStaticVar(sysarg)
	--local cardCount = svar.days.pbpxdCardCount
	--if cardCount == nil then return end -- 没有参与活动
	--
	--cardCount = cardCount + count
	--svar.days.pbpxdCardCount = cardCount
	--
	---- 位置(从 0 开始): -1 不在排行榜中;
	--local newpos, oldpos = Ranking.update_value(1, sysarg, cardCount)	
	--
	--if newpos == oldpos then -- 排行榜没有改变则只更新自己
	--	sendActivityDataBPBXD(sysarg)
	--else
	--	local cfg = StdActivityCfg.BenPaoBaXiongDi
	--	local playerList = LuaHelp.getSceneActorListById(cfg.sceneid)		
	--	for i, v in ipairs(playerList or {}) do
	--		sendActivityDataBPBXD(v)
	--	end
	--end
end
function SS(sysarg,x,y)
	Actor.enterScene(sysarg,Actor.getSceneId(sysarg),x,y)
end