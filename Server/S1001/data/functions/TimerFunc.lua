
--#include "data\config\activityconfig\QiBingDuoBao.lua" once
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua" once
--#include "data\config\activityconfig\TyrantsHeartConfig.lua" once
--#include "data\functions\Activity\PublicTest.lua" once
--#include "data\functions\modules\wangling.lua" once
--#include "data\functions\modules\garden.lua" once
--#include "data\functions\modules\practice_room.lua" once
--#include "data\functions\modules\challenge_fuben.lua" once
--#include "data\functions\Fuben\emoling.lua" once
--#include "data\functions\IdentifyCodeFunc.lua" once

--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ShenMiZhiDian.lua" once		--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ChuanSongYuan.lua" once		--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ChuJiDuanZaoShi.lua" once	--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\FuBenGuanLiYuan.lua" once	--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ZhanWuShuang.lua" once		--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ZhuangBeiHuiShou.lua" once	--2016/12/26 zer 移动更新
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\JunTuanGuanLiYuan.lua" once	--2016/12/26 zer 移动更新
--#include "data\functions\Systems\ActivitySystem\FuBen.lua" once
--#include "data\config\guild\JiQingGuildCfg.lua" once
--#include "data\functions\SpecialTitle.lua" once
--#include "data\functions\BossListInfo\BossListInfoEx.lua" once
--#include "data\config\VipGuaJiConfig.lua" once
--#include "data\config\CliffordConfig.lua" once
--#include "data\config\modules\TitleHasTime.lua" once
  --定时器ID定在文件：ActorTimerIds.lua
--#include "data\functions\ShieldAndTalismanRecory.lua" once
--#include "data\functions\Activity\YuanGuBiaoCheUtils.lua" once
--#include "data\config\activity\ShengXiaoGongDianCfg.lua" once
--#include "data\config\NpcMiscCfg\FuWenDiGongCfg.lua" once



--特定定时器对应的脚本回调
TimerFunc = {}
TimerFunc[1] = function(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.AlchemyTime then
		return
	end
	
	if not EquipMelting then return end
	local config = EquipMelting.EquipAlchemy
	
	var.AlchemyTime = var.AlchemyTime - 1
	if var.AlchemyTime <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf243,2048)
		Actor.deleteTimer(sysarg,ActorTimerIds.Alchemy)
		return
	end
end

TimerFunc[2] = function(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	local svar = Actor.getStaticVar(sysarg)

	if not dVar.Timer then dVar.Timer = 0 end

	if svar.ybstate == 1 then
		local monster = Actor.getEntity(svar.bcHandle)
		local playerX,playerY = Actor.getEntityPosition(sysarg,0,0)
		local monsterX,monsterY = Actor.getEntityPosition(monster,0,0)

		monsterX = monsterX - playerX
		monsterY = monsterY - monsterY
		
		local Distance = (monsterX*monsterX) + (monsterY*monsterY)

		if Distance > (4*4) then
			if dVar.Timer % 10 == 0 then
				local monsterX2,monsterY2 = Actor.getEntityPosition(monster,0,0)
				local nowSceneName = Actor.getSceneName(monster, 0, 0)
                
                if svar.autobiaoche == 1 then
                 
                     ContinueEscort(sysarg,nil)
                 else
                  
                    Actor.sendTipmsg(sysarg,string.format(Lang.Activity.k00048, nowSceneName,monsterX2,monsterY2), ttFlyTip)
				    SetDartTimer(sysarg,false)
				    -- 超出范围先暂停下
				    local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sPauseAutoDart)
				    if (pack ~= nil) then
					    DataPack.flush(pack)
				    end
                end

			end
		
			if dVar.Timer > 120 then
				dVar.Timer = nil
			end
			if dVar.Timer then
				dVar.Timer = dVar.Timer + 1
			end
		else
			if dVar.Timer > 0 then
				dVar.Timer = 0
			end
		end
	end
end

TimerFunc[3] = function(sysarg)	
	local dVar = Actor.getDyanmicVar(sysarg)
	if not dVar.TyrantsTimer then dVar.TyrantsTimer = 0 end
	dVar.TyrantsTimer = dVar.TyrantsTimer + TyrantsHeartConfig.interval
	if dVar.TyrantsTimer >= TyrantsHeartConfig.totalTime then
		dVar.TyrantsTimer = nil
		Actor.deleteTimer(sysarg,ActorTimerIds.Tuhaozhixin)
		return
	end

	local playerX,playerY = Actor.getEntityPosition(sysarg,0,0)
	local scenePtr = Actor.getScenePtr(sysarg)
	local nearPlayer = LuaHelp.getNearEntityListFromRange(scenePtr,playerX,playerY,4,4,0)
	if not nearPlayer then return end
	local nPlaCount = #nearPlayer
	if  nPlaCount - 1 <= 0 then return end
	if Actor.changeMoney(sysarg,mtBindCoin,-TyrantsHeartConfig.lostMoney*(nPlaCount - 1),GameLog.clConsumeBindCoin,Lang.LogTips.coin00006) == false then
		dVar.TyrantsTimer = nil
		Actor.deleteTimer(sysarg,ActorTimerIds.Tuhaozhixin)
		return
	end
	for k, plyPtr in pairs(nearPlayer or {}) do
		if plyPtr and not Actor.isDeath(plyPtr)  then
			if plyPtr ~= sysarg then
				Actor.changeMoney(plyPtr,mtBindCoin,TyrantsHeartConfig.getMoney,GameLog.cBossHeart,Lang.LogTips.coin00006)
			end
		end
	end
	
end

TimerFunc[4] = function(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.CFGCCD and System.getCurrMiniTime() >= dVar.CFGCCD+3600 then
		Actor.returnCity(sysarg)
	end
end	

TimerFunc[5] = function(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.avoidUpTime and sVar.avoidUpTime > 0 then
		sVar.avoidUpTime = sVar.avoidUpTime - 1
		if sVar.avoidUpTime <= 0 then
			local nCurLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL)
			Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_EXP,0)
			Actor.setIntProperty(sysarg,PROP_ACTOR_AVOIDINJURY_LEVEL,nCurLevel+1)
			Actor.collectOperate(sysarg,0) -- 重新计算角色属性
			Actor.FullAvoid(sysarg)
			sVar.avoidUpTime = nil
			Actor.deleteTimer(sysarg,ActorTimerIds.AvoidUp)
			return
		end
	end
end	

TimerFunc[6] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	local st = QiBingDuoBaoConfig.startTime
	local et = QiBingDuoBaoConfig.endTime
		
	if (sceneId == QiBingDuoBaoConfig.SceneId and System.isInTimeRange(st[1], st[2], st[3], et[1], et[2], et[3])) then		
		Actor.addExp(sysarg, QiBingDuoBaoConfig.exp, GameLog.cDuoBaoQiBingAward, 0, 1)
		if QiBingDuoBaoConfig.coin > 0 then
			Actor.changeMoney(sysarg, mtCoin, QiBingDuoBaoConfig.coin, GameLog.cDuoBaoQiBingAward, "DuoBao")			
		end
		System.broadcastTipmsg(string.format(Lang.Activity.qbdb0005,Actor.getName(sysarg)),2+128)
	else
		--print("No delete timer, here delete the timer")
		if Actor.hasTopTitle(sysarg,QiBingDuoBaoConfig.titleId) then
			Actor.setTopTitle(sysarg,QiBingDuoBaoConfig.titleId,false)
			Actor.removeItem(sysarg,QiBingDuoBaoConfig.propId,1)
			Actor.addItem(sysarg,QiBingDuoBaoConfig.giftId,0,0,1,0,0,"TimerFunc6",1)

			local dVar = Actor.getDyanmicVar(sysarg)
			if dVar.SpidTitle then
				Actor.setTopTitle(player,31,true)
			end
		end
		Actor.exitActivityScene(sysarg)
		return 0
	end
end

TimerFunc[7] = function(sysarg)
	local cfg = PublicTestCfg.TitleCfg
	
	if Actor.hasTopTitle(sysarg, cfg.titleId) then
		Actor.setTopTitle(sysarg, cfg.titleId, false)
	end

	SendPublicTestTitleOver(sysarg)
	
	--[[
	local name = StringFromAwardType(cfg.consume.type)
	if name == nil then return 0 end
	
	local str = string.format("您的绝版称号<(c0xffffff00)霸者天下>已经过期了，花费<(c0xFF00FF00)%d>%s可以继续使用<(c0xFF00FF00)%d>天", cfg.consume.count, name, cfg.validDay)
	Actor.messageBox(sysarg,0,0,str, "续费/publicTest_buyTitle,1", "以后再说吧/publicTest_buyTitle,0", NULL, 0)
	--]]
	
	-- 返回 0 则删除
	return 0
end

TimerFunc[8] = function(sysarg)
	wangling_exit_scene(sysarg)

	return 0 -- 返回 0 则删除定时器
end

TimerFunc[9] = function(sysarg)
	return on_garden_timer_cb(sysarg)
end

TimerFunc[10] = function(sysarg)
	return on_practice_room_timer_cb(sysarg)
end

TimerFunc[11] = function(sysarg)
	return on_challenge_fuben_timer_cb(sysarg)
end

TimerFunc[12] = function(sysarg)
	return on_challenge_fuben_refresh_monsters_timer_cb(sysarg)
end

-- 恶魔岭副本准备时间定时器
TimerFunc[13] = function(sysarg)
    emoling_start(sysarg,nil)
	--return on_emoling_ready_timer_cb(sysarg)
end


-- 主线任务,转变场景找npc
TimerFunc[14] = function(sysarg)
	 
	local tvar =get_taskflags_val(sysarg)
	local ta = task_all[tvar]
	if ta == nil then 
        System.trace("找不到任务:"..tvar)
		
		return echo 
	end --没有任务了
	--print("get_taskflags_val(sysarg)="..get_taskflags_val(sysarg))
		
	if get_taskflags_val(sysarg) == 71 then --出了恶魔领，继续当前任务。
		Actor.autoFindPathToNpc( sysarg, ta.mapid, ta.npcname)
	elseif get_taskflags_val(sysarg) == 30 or get_taskflags_val(sysarg) == 49 or get_taskflags_val(sysarg) == 72 or get_taskflags_val(sysarg)== 96 then --传送员任务的两个特殊情况
		MasterStokeAcceptTask(sysarg,ta.npcid)	
		--print(MasterStokeAcceptTask)
	elseif get_taskflags_val(sysarg) == 1 then 
		local actormapid = Actor.getSceneId(sysarg)
		Actor.autoFindPathToNpc( sysarg, actormapid, ta.npcname)
	else
		if get_taskflags_val(sysarg)~=85 and get_taskflags_val(sysarg)~=91 and  get_taskflags_val(sysarg)~= 97 then  
			if ta.type == 3 then
				Actor.autoFindPathToKillMonster(sysarg, ta.mapid , ta.mx , ta.my , ta.monid)
			elseif ta.type ==7 then --收集装备
				 Actor.openguajiGuide(sysarg,1)
			else 
				Actor.autoFindPathToNpc( sysarg, ta.mapid, ta.npcname)
			end
		end
	end
	if get_taskflags_val(sysarg) == 97 then
		Quest_ShuaXin(sysarg)
	end
    Actor.deleteTimer(sysarg, 14);
end

TimerFunc[15] = function(sysarg)


	local findnpcdata = {
		{tval = 5, npcname = Lang.EntityName.n00333, },
		{tval = 8, npcname = Lang.EntityName.n00334, },
		{tval = 10, npcname = Lang.EntityName.n00334, },
		{tval = 15, npcname = Lang.EntityName.n00335, },
		{tval = 19, npcname = Lang.EntityName.n00336, },
		{tval = 12, npcname = Lang.EntityName.n00334, },
		{tval = 17, npcname = Lang.EntityName.n00336, },
		{tval = 21, npcname = Lang.EntityName.n00337, },
		{tval = 23, npcname = Lang.EntityName.n00337, },
	};
	for i = 1,#findnpcdata do
		if get_taskflags_val(sysarg) == findnpcdata[i].tval then
			Actor.autoFindPathToNpc( sysarg, 1, findnpcdata[i].npcname );
			Actor.deleteTimer(sysarg,15);
			return 0;
		end
	end
end



--恶魔岭刷怪更新定时器
TimerFunc[18] = function(sysarg)
    return on_emoling_update_timer_cb(sysarg)
end

--散人传说 BOSS之家定时器
TimerFunc[19] = function(sysarg)
	local mfb = {
		{mapid = 77, vlv = 1, bl = 34},
		{mapid = 78, vlv = 2, bl = 35},
		{mapid = 79, vlv = 3, bl = 36},
	};
	local mid = Actor.getSceneId(sysarg);
	local u = 0;
	for i = 1,#mfb do
		if mfb[i].mapid == mid then
			u = mfb[i].bl;
		end
	end
	if u == 0 or get_d_val(sysarg,u) < 1 then 
		Actor.returnCity(sysarg);
		Actor.deleteTimer(sysarg,19);
		return 0;
	else
		if get_d_val(sysarg,u) > 0 then
			del_d_val(sysarg,u,1);
			Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)失去> <(c0xFF0090ff)%s(%s)分钟当前地图时间>", 1, get_d_val(sysarg,u)),1);
		end
	end
end

--主线任务,触发点击
TimerFunc[20] = function(sysarg)

	Actor.deleteTimer(sysarg, 20)
	
	--让NPC翻页
	function changeTalkPage(sysarg,str)
		local netPack = DataPack.allocPacket(sysarg, 0, 11)
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt64(netPack, Actor.getNpc(sysarg))-- 更新数据的类型
		DataPack.writeString(netPack,str)
		DataPack.flush(netPack)
	end
	
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	if ta==nil then return end
	local npcName = Actor.getTalkNpcName(sysarg)
	local sVar = Actor.getDyanmicVar(sysarg)
	
	--装备回收的任务引导
	local taskfor1 = {
		{nowVar = 29, type = 4},
		{nowVar = 42, type = 4},
		{nowVar = 61, type = 4},
		{nowVar = 83, type = 4},
		{nowVar = 86, type = 4},
		{nowVar = 90, type = 4},
		{nowVar = 98, type = 4},
	};
	for i = 1,#taskfor1 do
		if ta~=nil and  nowVar == taskfor1[i].nowVar and ta.type == taskfor1[i].type and ((npcName~=nil and npcName == "装备回收" ) or npcName==nil ) then
			if i== 6 or i == 7 then
				Actor.closeNPCDialog(sysarg)
				Actor.closeDialogs(sysarg,3)
				GetNpcZhuangBeiHuiShou().onItemHuiShouFunc(sysarg,2)
			else 
				Actor.closeNPCDialog(sysarg)
				Actor.closeDialogs(sysarg,3)
				GetNpcZhuangBeiHuiShou().onItemHuiShouFunc(sysarg,1)
			end
			
		end
	end
	
	--传送员
	if nowVar == 30 and ta.type == 4 and npcName~=nil and npcName == "传送员" then
		GetNpcChuanSongYuan().maptoEX(sysarg,2,4)
	end

	if nowVar == 49 and ta.type == 4 and npcName~=nil and npcName == "传送员" then
		GetNpcChuanSongYuan().maptoEX(sysarg,2,5)
	end
	
	if nowVar == 72 and ta.type == 4 and npcName~=nil and npcName == "传送员" then
		GetNpcChuanSongYuan().maptoEX(sysarg,2,6)
	end
	
	--军团使者
	if nowVar == 67 and ta.type == 4 and sVar.nowNumberOfStep ==1 and npcName~=nil and npcName == "军团使者" then
		GetNpcJunTuanGuanLiYuan().addLegion(sysarg,tonumber(GetNpcJunTuanGuanLiYuan().getLegionLowCount(sysarg)))
	end
	
	--散人殿堂
	if nowVar == 87 and ta.type == 4 and npcName~=nil and npcName == "散人殿堂" then
		GetNpcANYINMIDIAN().enterScene(sysarg,1)
	end
	
	--副本管理员
	if nowVar == 95 and ta.type == 4 and npcName~=nil and npcName == "副本管理员" then
		GetNpcFuBenGuanLiYuan().rpfb(sysarg,1)
	end
	if nowVar == 96 and ta.type == 4 and npcName~=nil and npcName == "副本管理员" then
		GetNpcFuBenGuanLiYuan().rpfb(sysarg,2)
	end
	
	--炼狱	
	if nowVar == 71 and ta.type == 4 and npcName~=nil and npcName == "炼狱" then
		local var = Actor.getStaticVar(sysarg)
		local addUpExp = var.EMoLingAddUpExp
		if addUpExp == nil or addUpExp == 0 then
			GetNpcShouWeiZhan().on_enter_emoling(sysarg)
		else
			GetNpcShouWeiZhan().on_get_emoling_reward(sysarg,3)
		end
	end
	
	--战无双
	if nowVar == 64 and ta.type == 4  and npcName~=nil and npcName == "战无双"  then
		GetNpcRiChangChuMo().rcJieShouRenWu(sysarg)
	end
	if nowVar == 65 and npcName~=nil and npcName == "战无双"  then
		GetNpcRiChangChuMo().rcWanChengRenWu(sysarg)
		Actor.closeNPCDialog(sysarg)
	end
	
  
end

--副本,进入副本后刷怪
TimerFunc[21] = function(sysarg)
	
	local nowSceneId = Actor.getSceneId(sysarg)
	local FubenIndex=nowSceneId-90
	
	if nowSceneId==427 then	
		FubenIndex = 8 
	end
	
	if nowSceneId==643 then	
		FubenIndex = 9 
	end
	
	if nowSceneId==649 then	
		FubenIndex = 10 
	end
	
	if nowSceneId==665 then	
		FubenIndex = 11 
	end
	
	if nowSceneId==696 then	
		FubenIndex = 12 
	end
	
	if FubenIndex<1 or FubenIndex>12 then --以免定时器走完，还没有传到这个场景！！
		Actor.deleteTimer(sysarg,21)
		return 
	end
	--print("FubenIndex:"..FubenIndex)
	--if FubenIndex ==1 or FubenIndex ==3 or FubenIndex ==6 or FubenIndex ==7 then
		ShuaGuai(sysarg,FubenIndex,1)
	--end
	 Actor.openguajiGuide(sysarg,1)
	--Actor.autoFindPathToKillMonster(sysarg, nowSceneId , FubenMonsterData[FubenIndex].cgf[1].x1 ,FubenMonsterData[FubenIndex].cgf[1].y1 , FubenMonsterData[FubenIndex].cgf[1].monsterId)
	Actor.deleteTimer(sysarg,21)
end


--押镖暂停与跑步
TimerFunc[23] = function(sysarg)
   

--    Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowPasue)
--   if Actor.getIsDartFlag(sysarg) == 0 then
--        Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowPasue)
--        return
--   end
--   local Var = Actor.getStaticVar(sysarg)
--   local handle = Var.bcHandle
--   local pBiaoChePtr = Actor.getEntity(handle)
--   if pBiaoChePtr == nil then
--        Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowPasue)
--        return
--   end
--   local nBiaoCheX = Actor.getIntProperty(pBiaoChePtr,PROP_ENTITY_POSX)
--   local nBiaoCheY = Actor.getIntProperty(pBiaoChePtr,PROP_ENTITY_POSY)

--   local nSelfX = Actor.getIntProperty(sysarg,PROP_ENTITY_POSX)
--   local nSelfY = Actor.getIntProperty(sysarg,PROP_ENTITY_POSY)
--   print("x:".. math.abs(nSelfX - nBiaoCheX).."y:"..math.abs(nSelfY - nBiaoCheY))
--   if math.abs(nSelfX - nBiaoCheX) >= 3 or math.abs(nSelfY - nBiaoCheY) >= 3 then
--        --判断镖车之间的距离
--        ContinueEscort(sysarg,nil)
--   end

--    local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sPauseAutoDart)
--	DataPack.writeByte(pack, 1) 
--    DataPack.flush(pack)
--    Actor.addTimer(sysarg,ActorTimerIds.DartFollowRun,3000)
end

TimerFunc[24] = function(sysarg)
--     Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowRun)
--     if Actor.getIsDartFlag(sysarg) == 0 then
--        return
--    end
--    ContinueEscort(sysarg,nil)

--    Actor.addTimer(sysarg,ActorTimerIds.DartFollowPasue,1000)
end

--进入副本自动挂机的定时器
TimerFunc[25] = function(sysarg)

   Actor.openguajiGuide(sysarg,1)------弹出挂机窗口
   Actor.deleteTimer(sysarg,25)
end

--传送，然后打开NPC对话框
TimerFunc[26] = function(sysarg)
	Actor.deleteTimer(sysarg,26)
	local dvar = Actor.getDyanmicVar(sysarg)
	local index = dvar.HelpToStrongIndex
	if 	index ~=nil then 
		if index==1 then 
			Actor.npcTalkByNameEx(sysarg,"装备回收")
		elseif index==2 then 
			Actor.npcTalkByNameEx(sysarg,"炼狱")
		elseif index==3 then 
			Actor.npcTalkByNameEx(sysarg,"龙门镖局")
		elseif index==4 then 
			Actor.npcTalkByNameEx(sysarg,"装备回收")
		elseif index==5 then 
			Actor.npcTalkByNameEx(sysarg,"首领之家")
		elseif index==6 then 
			Actor.npcTalkByNameEx(sysarg,"散人殿堂")
		elseif index==7 then 
			Actor.npcTalkByNameEx(sysarg,"战无双")
		elseif index==8 then 
			Actor.npcTalkByNameEx(sysarg,"游戏推广员")
		elseif index==9 then 
			Actor.npcTalkByNameEx(sysarg,"秦始皇陵")
		elseif index==13 then 
			Actor.npcTalkByNameEx(sysarg,"军团使者")
		elseif index==11 then 
			Actor.npcTalkByNameEx(sysarg,"散人殿堂")
		elseif index==12 then 
			Actor.npcTalkByNameEx(sysarg,"传送员")
		end
	end
	
	index = dvar.StrongStoneFromWhereIndex 
	if 	index ~=nil then
		if index==2 then 
			Actor.npcTalkByNameEx(sysarg,"副本管理员")
		elseif index==3 then 
			Actor.npcTalkByNameEx(sysarg,"传送员")
		end
	end
	
end

--散人传说 每在线10秒自动回收装备设置
TimerFunc[27] = function(sysarg)
   
    if System.isCrossServer() == true then return end
	for v = 118,129 do
		if get_d_val(sysarg, v) == 1 then
			local i = v - 117;
            
			--不回收矿石
			if i~=3 and i~=16 and i~=17 and i~=18 then 
				onVipItemHuiShouFuncEx(sysarg,i);
			end
		end
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.dealAutoSell ==nil then 
		var.dealAutoSell={}
	end		
	for i=13,20 do 
        if i ~= 19 then
            if var.dealAutoSell[i]~=nil and var.dealAutoSell[i]==1 then 
			--不回收矿石
			    if i~=3 and i~=16 and i~=17 and i~=18 then 
				    onVipItemHuiShouFuncEx(sysarg,i);
			    end
		    end
        end
		--print("i="..i)

	end
	

	if get_d_val(sysarg,110) >= 10 then
		ShuaXinFengHao(sysarg);
	end

    if var.autorecoyhufu ~= nil then
        onShieldAndTalismanRecory(sysarg,1,4)
    end
end

--地图定时器
TimerFunc[28] = function(sysarg)

	local sceneId = Actor.getSceneId(sysarg);
	for i = 279,286 do 
		if i == sceneId then 
			if get_d_val(sysarg,12) <= 0 then
				Actor.sendTipmsg(sysarg,"进入荒古区域时间已经超过30分钟,已将您传送回威龙城.",4);
				Actor.deleteTimer(sysarg,28);
				System.telportScene(sysarg, 9); --回去威龙城
			else
				del_d_val(sysarg,12,5);
				Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>", get_d_val(sysarg,12)), 1);
			end
			break;
		end
	end
	for i = 266,268 do 
		if i == sceneId then 
			if get_d_val(sysarg,12) <= 0 then
				Actor.sendTipmsg(sysarg,"进入秦始皇陵时间已经超过60分钟,已将您传送回沙漠土城.",4);
				Actor.deleteTimer(sysarg,28);
				System.telportScene(sysarg, 83); --回去威龙城
			else
				local hp = Actor.getIntProperty(sysarg,PROP_CREATURE_HP);

				if i == 267 then
                    hp = hp - 2888
				elseif i == 268 then
                    hp = hp - 5888
				end
                if hp < 0 then hp = 0 end
                Actor.setIntProperty(sysarg,PROP_CREATURE_HP,hp);
				del_d_val(sysarg,12,5);
				Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>", get_d_val(sysarg,12)), 1);
			end
			break;
		end
	end
	for i = 256,261 do 
		if i == sceneId then 
			if get_d_val(sysarg,12) <= 0 then
				Actor.sendTipmsg(sysarg,"进入暗黑区域时间已经超过30分钟,已将您传送回暗黑沙漠.",4);
				Actor.deleteTimer(sysarg,28);
				System.telportScene(sysarg, 265); --回去暗黑沙漠
			else
				del_d_val(sysarg,12,5);
				Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>", get_d_val(sysarg,12)), 1);
			end
			break;
		end
	end
    --混乱地界
    if sceneId == 568 then
        if get_d_val(sysarg,12) <= 0 then
				Actor.sendTipmsg(sysarg,"进入混乱地界时间已经超过30分钟,已将您传送回沙漠土城安全区.",4);
				Actor.deleteTimer(sysarg,28);
				System.telportScene(sysarg, 83,169,130); --沙漠土城安全区
			else
				del_d_val(sysarg,12,5);
				Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>", get_d_val(sysarg,12)), 1);
			end
    end

    --
    if sceneId == 567 then
            if get_d_val(sysarg,12) <= 0 then
				Actor.sendTipmsg(sysarg,"进入尸王殿时间已经超过30分钟,已将您传送回沙漠土城安全区.",4);
				Actor.deleteTimer(sysarg,28);
				System.telportScene(sysarg, 83,157,128); --沙漠土城安全区
			else
				del_d_val(sysarg,12,5);
				Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>", get_d_val(sysarg,12)), 1);
			end

    end
end

--参加激情行会定时器
TimerFunc[29] = function(sysarg)

	--进入激情行会场景
    Actor.enterScene(sysarg,JiQingGuildCfg.MapID,-1,-1)
	
	local sysVar = System.getDyanmicVar()
	local leftSecond = JiQingGuildCfg.leftTime-(System.getCurrMiniTime() - sysVar.jiqingguild)

    --给10秒无敌buff
    Actor.addBuffById(sysarg,JiQingGuildCfg.WuDiBuffID)
    --初始化个人积分与奖励
    local var = Actor.getStaticVar(sysarg)
    var.JiQingKillV = 0
    var.JiQingGive = nil --设置未领取奖励标记

    --发送排行榜数据
	Actor.deleteTimer(sysarg,29)
	
	--参加活动
	sendJoinActivity(sysarg, 23, leftSecond)
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 23) -- 活动类型
	DataPack.writeByte(netPack, 1) -- 行会排行榜信息

	local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
	local rankcount = Ranking.getRankItemCount(pRank) --排行榜数量
	DataPack.writeByte(netPack, rankcount) -- 传过去的行会个数	
	
	for i = 1,rankcount do
		local pRankitem = Ranking.getItemFromIndex(pRank,i -1) --索引
		local szGuildName = Ranking.getSub(pRankitem,0) --第一列为行会名称
		local value = Ranking.getPoint(pRankitem) --取得行会积分
		DataPack.writeString(netPack, szGuildName)
		DataPack.writeUInt(netPack, value)
	end
	DataPack.flush(netPack)

end


--夺宝奇兵
TimerFunc[30] = function(sysarg)
    local dVar = System.getDyanmicVar()
	if dVar.duobaoqibingTime == nil then
        Actor.deleteTimer(sysarg,30)
        return
    end

    --增加元宝
    Actor.changeMoney(sysarg,mtYuanbao,10,LogIds.dbqbaddyuanbao,"夺宝奇兵定时元宝")
    Actor.sendTipmsg(sysarg,"获得10元宝",ttFlyTip)
end

--特权
TimerFunc[31] = function(sysarg)
	--在跨服里面跨服buff不实时更新
	if System.isCrossServer() ==true then
		return
	end


	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
    local bAllHave = true
	local bAllNotHave =0
    local var = GetSpecialTitleVar(sysarg)
    for i =1,table.getn(SpecialTitleCfg.title) do
       if not IsSpeciaTitleVip(sysarg,SpecialTitleCfg.title[i].id) then
			bAllNotHave=bAllNotHave+1
           Actor.setTopTitle(sysarg,SpecialTitleCfg.headtitleid,false)
		   	for j=1,#SpecialTitleCfg.title[i].buffid do 
				if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[i].buffid[j])== true then 
					Actor.delBuffById(sysarg,SpecialTitleCfg.title[i].buffid[j])
				end
			end
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[i].buffid2[myJob])== true then 
				Actor.delBuffById(sysarg,SpecialTitleCfg.title[i].buffid2[myJob])
			end	
           --Actor.deleteTimer(sysarg,31)
           --break
       end
    end
	--3个特权都没有了
	if bAllNotHave == table.getn(SpecialTitleCfg.title) then 
		Actor.deleteTimer(sysarg,31)
	end
end

--挖矿自动出售
TimerFunc[32] = function(sysarg)

	local sceneId = Actor.getSceneId(sysarg)
	if 343 ~=sceneId then 
		Actor.deleteTimer(sysarg,32)
		return
	end

	--检查是否包裹满了
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs == 0 and Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) >= 2 then 
		SellMineralFunc(sysarg)
	end
end

--挖矿自动合成
TimerFunc[33] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	if 343 ~=sceneId then 
		Actor.deleteTimer(sysarg,33)
		return
	end
	--检查是否可以自动合成
	MakeStoneByMineralFunc(sysarg,2)
end

--挖矿双倍收益
TimerFunc[34] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	if 343 ~=sceneId then 
		Actor.deleteTimer(sysarg,34)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.doubleWK ==nil then 
		var.doubleWK = 0
	end
	
	var.doubleWK = var.doubleWK -1
	
	if var.doubleWK <= 0 then 
		Actor.deleteTimer(sysarg,34)
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
		DataPack.writeByte(netPack, 6)--双倍的时间
		DataPack.writeInt(netPack,var.doubleWK) --挖矿间隔时间
		DataPack.flush(netPack)
		return
	end
	
	if Actor.hasState(sysarg,15)==false then --停止挖矿的话，就停止定时器
		Actor.deleteTimer(sysarg,34)
		return
	end
end

--激情大本营加经验定时器
TimerFunc[35] = function(sysarg)
    
	    Actor.addExp(sysarg,ArdourCampCfg.secaddexp,LogIds.ardourcampaddexp,0)
end

--特殊药品控制, 高级太阳水 使用间隔
TimerFunc[36] = function(sysarg)
    set_d_val(sysarg,198,1);
end


--混沌世界传出定时器
TimerFunc[37] = function(sysarg)
    Actor.returnCity(sysarg)
    Actor.sendTipmsg(sysarg,"混沌世界时间已到。",ttFlyTip)
end

--混沌世界倒计时定时器
TimerFunc[38] = function(sysarg)
  local dVar = Actor.getDyanmicVar(sysarg) 
  if dVar.hdCountDown  == nil then return end
   dVar.hdCountDown  = dVar.hdCountDown - HunDunShiJieCfg.CountdownTime / 1000
   Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>",dVar.hdCountDown),ttTipmsgWindow)
end

--Boss刷新栏定时器
TimerFunc[39] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg);
	HandlePlayerEnterSceneBossTips(sysarg,sceneId);

end
--激情大本营活动结束后延时打开npc对话框面板
TimerFunc[40] = function(sysarg)
	Actor.deleteTimer(sysarg,40)
	Actor.npcTalkByNameEx(sysarg,"激情大本营","main")

end

--vip挂机地图
TimerFunc[41] = function(sysarg)
	--场景不对，退出
	local var = Actor.getStaticVar(sysarg)
	local dvar = Actor.getDyanmicVar(sysarg)
	if Actor.getSceneId(sysarg) ~= 105 and Actor.getSceneId(sysarg) ~= 104 then
		Actor.deleteTimer(sysarg,41)
		return 
	end
	 
	--vip等级
	local viplevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)

	
	local cgf = nil 
	if viplevel< 1 then 
		cgf = VipGuaJiConfig.NoVipAward[1]
	elseif  Actor.getSceneId(sysarg) == 104 then --所有人进了普通地图，都给普通奖励,即使是vip
		cgf = VipGuaJiConfig.NoVipAward[1]
	else 
		if viplevel>#VipGuaJiConfig.Award then --配置大于vip等级了
			cgf = VipGuaJiConfig.Award[#VipGuaJiConfig.Award]
		else
			cgf = VipGuaJiConfig.Award[viplevel]
		end
	end
			
	if cgf ==nil then 
		return 
	end
		
	 
	--判断是否是双倍 --给奖励
	if var.vipGuaJi == nil then --不是双倍的

		Actor.addExp(sysarg,cgf.Exps,"vip地图挂机",0); --经验
		
		local jadeNum = Actor.getUIntProperty(sysarg, 124) --护符碎片
		jadeNum = jadeNum + cgf.HuFuSuiPian
		Actor.setUIntProperty(sysarg, 124, jadeNum);
		Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", cgf.HuFuSuiPian), 1)
		
		Actor.changeMoney(sysarg,0,cgf.BindGold,0,"vip地图挂机")--给绑定金币----------------------------------------------------
		
		
		
		--提示
		if dvar.vipGuaJiExpAll == nil then 
			dvar.vipGuaJiExpAll = cgf.Exps
		else 
			dvar.vipGuaJiExpAll = dvar.vipGuaJiExpAll + cgf.Exps
		end
		Actor.sendTipmsg(sysarg, string.format("<获得> <%s经验,当前总量为 %s>", cgf.Exps,dvar.vipGuaJiExpAll), ttFlyTip)
		
		--提示
		if dvar.vipGuaJiHFAll == nil then 
			dvar.vipGuaJiHFAll = cgf.HuFuSuiPian
		else 
			dvar.vipGuaJiHFAll = dvar.vipGuaJiHFAll + cgf.HuFuSuiPian
		end
		
		if dvar.vipGuaJiJingBi ==nil then 
			dvar.vipGuaJiJingBi = cgf.BindGold
		else 
			dvar.vipGuaJiJingBi = dvar.vipGuaJiJingBi + cgf.BindGold
		end
		
		Actor.sendTipmsg(sysarg, string.format("<获得> <%s护符碎片,当前总量为 %s>", cgf.HuFuSuiPian,dvar.vipGuaJiHFAll), ttFlyTip)
		
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJiInfo)
		DataPack.writeInt64(netPack, dvar.vipGuaJiExpAll) 
		DataPack.writeInt64(netPack, dvar.vipGuaJiHFAll) 
		DataPack.writeInt64(netPack, dvar.vipGuaJiJingBi) 
		DataPack.flush(netPack)
			
		
		
		
	else --双倍的
		Actor.addExp(sysarg,2*cgf.Exps,"vip地图挂机",0); --经验		
	
		local jadeNum = Actor.getUIntProperty(sysarg, 124) --护符碎片
		jadeNum = jadeNum + 2*cgf.HuFuSuiPian
		Actor.setUIntProperty(sysarg, 124, jadeNum);
		Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", 2*cgf.HuFuSuiPian), 1)
		
		Actor.changeMoney(sysarg,0,2*cgf.BindGold,0,"vip地图挂机")--给绑定金币----------------------------------------------------
		
		--扣取双倍的次数
		var.vipGuaJi = var.vipGuaJi - 1
		
		--要是次数没了，给前端发协议
		if var.vipGuaJi<=0 then 
			var.vipGuaJi = nil
			local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJi) ----------------------------------------------------------------
			DataPack.writeUInt(netPack, 0) --1是双倍的，0是非双倍的
			DataPack.flush(netPack)
		end
		
		
		
		--提示
		if dvar.vipGuaJiExpAll == nil then 
			dvar.vipGuaJiExpAll = 2*cgf.Exps
		else 
			dvar.vipGuaJiExpAll = dvar.vipGuaJiExpAll + 2*cgf.Exps
		end
		Actor.sendTipmsg(sysarg, string.format("<获得> <%s经验,当前总量为 %s>", 2*cgf.Exps,dvar.vipGuaJiExpAll), ttFlyTip)
		
		--提示
		if dvar.vipGuaJiHFAll == nil then 
			dvar.vipGuaJiHFAll = 2*cgf.HuFuSuiPian
		else 
			dvar.vipGuaJiHFAll = dvar.vipGuaJiHFAll + 2*cgf.HuFuSuiPian
		end
		Actor.sendTipmsg(sysarg, string.format("<获得> <%s护符碎片,当前总量为 %s>", 2*cgf.HuFuSuiPian,dvar.vipGuaJiHFAll), ttFlyTip)
		
		
		if dvar.vipGuaJiJingBi ==nil then 
			dvar.vipGuaJiJingBi = 2*cgf.BindGold
		else 
			dvar.vipGuaJiJingBi = dvar.vipGuaJiJingBi + 2*cgf.BindGold
		end
		
		
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJiInfo)
		DataPack.writeInt64(netPack, dvar.vipGuaJiExpAll) 
		DataPack.writeInt64(netPack, dvar.vipGuaJiHFAll) 
		DataPack.writeInt64(netPack, dvar.vipGuaJiJingBi) 
		DataPack.flush(netPack)
		
	end
	
end

--勇闯天关刷怪定时器
TimerFunc[42] = function(sysarg)
	--怪物id 837~ 837+29
	Actor.deleteTimer(sysarg,42)
		
	local var = Actor.getStaticVar(sysarg) 
	if var.SYCGLayer == nil then 
		var.SYCGLayer = 1
	end
	if not (Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377 ) then  --在副本中才创造怪物
		return 
	end
	
	Actor.createMonster(sysarg,837+ var.SYCGLayer -1,35,30,0,false)
	
	--给个倒计时打怪，打不完就走
	Actor.deleteTimer(sysarg, 43)
	Actor.addTimer(sysarg, 43, 180*1000)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sYongChuangTianGuan) 
	DataPack.writeByte(netPack, 2) --打怪的1分钟倒计时
	DataPack.flush(netPack)
		

end

--勇闯天关1分钟退出定时器
TimerFunc[43] = function(sysarg)
	Actor.deleteTimer(sysarg,43)
	if Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377  then --在副本中才退出
		Actor.returnCity(sysarg)
	end
end

--勇闯天关杀怪后，10秒钟进入下一层
TimerFunc[44] = function(sysarg)
	local var = Actor.getStaticVar(sysarg) 
	Actor.deleteTimer(sysarg,44)
	
	if Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377  then --在副本中才进行
		--进入下一关
		if Actor.getSceneId(sysarg)~=377 then --不是最后一关
			local fbid = var.SYCGLayer -1 + 122
			local Hfuben = Fuben.createFuBen(fbid)  --1:表示副本ID
			if Hfuben == 0 then return end
			if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return  end  --从NPC那将玩家传进副本
			Actor.addTimer(sysarg,25,5*1000) --自动挂机
			--给个倒计时刷怪
			Actor.sendTipmsg(sysarg,"怪物将在5秒后刷出",ttFlyTip)
			Actor.addTimer(sysarg,42, 5*1000)
			
			
			--随机库的index-----------------------------------------------------------------
			if var.newdays.YZCGaward==nil then 
				var.newdays.YZCGaward={}
			end
			
			local index = math.floor((var.SYCGLayer-1)/5)+1
			local cfg =YongChuangTianGuanCfg.award[index] 
			
			if var.newdays.YZCGaward[var.SYCGLayer]==nil then 
				var.newdays.YZCGaward[var.SYCGLayer]={}
				
			end
			
			--如果这个数字没有随机出来
			if #var.newdays.YZCGaward[var.SYCGLayer]==0 then 
				var.newdays.YZCGaward[var.SYCGLayer][1]=1
			
				for j=1,#cfg do 
					local nRandNum = System.getRandomNumber(10000) + 1		--随机数
					if nRandNum<=cfg[j].rate then 
						var.newdays.YZCGaward[var.SYCGLayer][1]=j
					end
				end
			
			end
			--随机库的index-----------------------------------------------------------------
	
			local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sYongChuangTianGuan) 
			DataPack.writeByte(netPack, 1) --进入的5秒倒计时
			DataPack.writeByte(netPack, var.SYCGLayer) --进入第几关
			DataPack.writeByte(netPack, var.newdays.YZCGaward[var.SYCGLayer][1])
			DataPack.flush(netPack)
		
		else	--最后一关了 
			Actor.returnCity(sysarg)
		end
	end
end

--勇闯天关5秒定时器，检测是否场景中，不在就删除buff
TimerFunc[45] = function(sysarg)
	if not (Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377 ) then --在副本中才进行
		Actor.deleteTimer(sysarg,42)
		Actor.deleteTimer(sysarg,43)
		Actor.deleteTimer(sysarg,44)
		
		Actor.delBuffByIdRange(sysarg,222,281)  --删除范围buff
		Actor.deleteTimer(sysarg,45)
	end
end

--祈福在线时间定时器
TimerFunc[46] = function(sysarg)

	local var = Actor.getStaticVar(sysarg)
    if var.clifford == nil then 
        Actor.deleteTimer(sysarg,46)
        return
    end
    if var.clifford.time == 0 and var.clifford.free >= CliffordConfig.FreeCliffordCount then 
        Actor.deleteTimer(sysarg,46)
        return
    end
    if var.clifford.time > 0 then
        var.clifford.time = var.clifford.time - CliffordConfig.DecTimer
    end
    if var.clifford.time < 0 then var.clifford.time = 0 end
end


--战无双的自动处理
TimerFunc[47] = function(sysarg)
	Actor.deleteTimer(sysarg,47)
	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if myLevel>75 then  --取消自动处理
		return 
	end	
	local npcName = Actor.getTalkNpcName(sysarg)
	if npcName~="战无双" then 
		return 
	end
	
	--只有在任务等级不够的情况下才自动做！！！
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local ta = task_all[get_taskflags_val(sysarg)]
	if ta==nil then 
		return 
	end
	if ta.lv <= pLv then
		return 
	end			
	
	--让NPC翻页
	function changeTalkPage(sysarg,str)
		local netPack = DataPack.allocPacket(sysarg, 0, 11)
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt64(netPack, Actor.getNpc(sysarg))-- 更新数据的类型
		DataPack.writeString(netPack,str)
		DataPack.flush(netPack)
	end
	
	
	local Var = Actor.getStaticVar(sysarg)
	if Var.RiChangRenWuFlag ==nil or Var.RiChangRenWuFlag ==0 then --没有接受任务
		GetNpcRiChangChuMo().rcJieShouRenWu(sysarg)
	elseif Var.RiChangRenWuFinish ==nil or Var.RiChangRenWuFinish ==0 then --显示继续前往任务
		GetNpcRiChangChuMo().rcQianWangRenWuScene(sysarg)
	else--完成了任务
		if get_d_val(sysarg,7) == 10 then
			changeTalkPage(sysarg,GetNpcRiChangChuMo().rcWanChengRenWu(sysarg))
		else --没有刷星
			changeTalkPage(sysarg,GetNpcRiChangChuMo().dlxx(sysarg,1))
		end
	end
end


TimerFunc[48] = function(sysarg)
    Actor.deleteTimer(sysarg,48)
    sendHyperLink(sysarg,"@@showWinWithGuide,8")

end

-- 跨服BOSS界面定时刷新
TimerFunc[49] = function(sysarg)
	RefreshCrossBossInfoUIToActor(sysarg)
end

-- 跨服押镖超时
TimerFunc[50] = function(sysarg)
	CrossYaBiaoTimeout(sysarg)
end

-- 跨服镖车跟随失败时定时器
TimerFunc[51] = function(sysarg)
	-- 返回 0 则删除定时器
	return CrossDartFollowFail(sysarg)
end

--限时称号
TimerFunc[52] = function(sysarg)
	--限时称号
	local var = Actor.getStaticVar(sysarg)
	if var.LinShiTitle==nil then 
		var.LinShiTitle={}
	end
		
	--if var.LinShiTitle[44]~=nil then  --鸿运当头
	--	if System.getCurrMiniTime()>var.LinShiTitle[44] then 
	--		Actor.setTopTitle(sysarg, 44, false)
	--		--Actor.deleteTimer(sysarg,52)
	--		var.LinShiTitle[44]=nil
	--	end
	--end
	--
	--if var.LinShiTitle[61]~=nil then  --名人堂唯我独尊
	--	if System.getCurrMiniTime()>var.LinShiTitle[61] then 
	--		Actor.setTopTitle(sysarg, 61, false)
	--		var.LinShiTitle[61]=nil
	--	end
	--end
	--
	--if var.LinShiTitle[62]~=nil then  --名人堂叱咤风云
	--	if System.getCurrMiniTime()>var.LinShiTitle[62] then 
	--		Actor.setTopTitle(sysarg, 62, false)
	--		var.LinShiTitle[62]=nil
	--	end
	--end
	--
	--if var.LinShiTitle[63]~=nil then  --名人堂名扬天下
	--	if System.getCurrMiniTime()>var.LinShiTitle[63] then 
	--		Actor.setTopTitle(sysarg, 63, false)
	--		var.LinShiTitle[63]=nil
	--	end
	--end
	
	for i=1,#TitleHasTime do 
		local titleId = TitleHasTime[i].titleId
		
		if var.LinShiTitle[titleId]~=nil then  --名人堂名扬天下
			if System.getCurrMiniTime()>var.LinShiTitle[titleId] then 
				Actor.setTopTitle(sysarg, titleId, false)
				var.LinShiTitle[titleId]=nil
			end
		end
	end
end

--在生肖宫殿里面
TimerFunc[53] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	--print("sceneId="..sceneId)
	if sceneId~=564 then 
		Actor.deleteTimer(sysarg,53)
		RemindClientToChangeTimer(sysarg,0)
		return 
	end

	local var = Actor.getStaticVar(sysarg)
	--今天初始化时间
	if var.newdays.sxgdTime==nil then 
		var.newdays.sxgdTime = ShengXiaoGongDianCfg.freeGiveTime
	end 
	
	--有时间剩余，扣时间
	if var.newdays.sxgdTime>0 then
		var.newdays.sxgdTime = var.newdays.sxgdTime-1
		--print("var.newdays.sxgdTime="..var.newdays.sxgdTime)
	else --没有时间剩余
		--检测是否勾选，
		local dVar = Actor.getDyanmicVar(sysarg)	
		if dVar.SXGD_calTime==nil or dVar.SXGD_calTime>=ShengXiaoGongDianCfg.BuyTheTime[1] then 
			dVar.SXGD_calTime=1
		else 
			dVar.SXGD_calTime = dVar.SXGD_calTime+1
		end
		--print("dVar.SXGD_calTime="..dVar.SXGD_calTime)
		
		if dVar.isChoose_shengxiaogongdian==nil or  dVar.isChoose_shengxiaogongdian==0 then --没有勾选
			Actor.enterScene(sysarg,564 ,ShengXiaoGongDianCfg.ScenePoint.centerPoint[1],ShengXiaoGongDianCfg.ScenePoint.centerPoint[2])
			Actor.deleteTimer(sysarg,53)
			RemindClientToChangeTimer(sysarg,0)
		else --勾选了
			--时间到了
			if(dVar.SXGD_calTime>=ShengXiaoGongDianCfg.BuyTheTime[1]) then 
				--判断元宝是否足够
				if Actor.getMoneyCount(sysarg,3) < ShengXiaoGongDianCfg.BuyTheTime[2] then
					Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
					Actor.enterScene(sysarg,564 ,ShengXiaoGongDianCfg.ScenePoint.centerPoint[1],ShengXiaoGongDianCfg.ScenePoint.centerPoint[2])
					Actor.deleteTimer(sysarg,53)
					RemindClientToChangeTimer(sysarg,0)
					
					local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
					System.AddMail(actor_id, 0, 0, "生肖宫殿 ", "尊敬的玩家您好,\\\\您的元宝不足以支付在生肖殿中消费,系统已经将您移出房间");
				else	
					--扣钱
					Actor.changeMoney( sysarg, 3, -ShengXiaoGongDianCfg.BuyTheTime[2], LogIds.stayInshenxiaogongdian, "生肖宫殿计算时间扣费")
					
					--记录消费，告诉玩家
					if dVar.SXGD_calYb==nil then dVar.SXGD_calYb=0 end
					dVar.SXGD_calYb = dVar.SXGD_calYb +ShengXiaoGongDianCfg.BuyTheTime[2]
				end
			end
		end
	end
	
end

-- 元神场景定时器，时间到则退出该地图
TimerFunc[54] = function(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	if sceneId >= 569 and sceneId <= 574 then -- 元神场景
		Actor.returnCity(sysarg)
	end

	return 0 -- 返回 0 则删除定时器
end



--符文地宫传出定时器
TimerFunc[55] = function(sysarg)
    Actor.returnCity(sysarg)
    Actor.sendTipmsg(sysarg,"符文地宫时间已到。",ttFlyTip)
end

--符文地宫倒计时定时器
TimerFunc[56] = function(sysarg)
  local dVar = Actor.getDyanmicVar(sysarg) 
  local sceneId = Actor.getSceneId(sysarg)
  local isIn  = false
  for i=1,#FuWenDiGongCfg.MapId do 
	if sceneId==FuWenDiGongCfg.MapId[i] then 
		isIn = true
	end
  end
  
  if isIn ==false then 
	Actor.deleteTimer(sysarg,55)
	Actor.deleteTimer(sysarg,56)
	return 
  end
  
  if dVar.fwdgCountDown  == nil then return end
   dVar.fwdgCountDown  = dVar.fwdgCountDown - FuWenDiGongCfg.CountdownTime / 1000
   Actor.sendTipmsg(sysarg,string.format("当前地图剩余时间: <%s秒>",dVar.fwdgCountDown),ttTipmsgWindow)
end


--验证码下线状态
TimerFunc[57] = function(sysarg)
   IdentifyCodeTimerFunc(sysarg)

end

TimerFunc[58] = function(sysarg)

    createIdentifyCode(sysarg)
end

-- 退出熊猫林
TimerFunc[59] = function(sysarg)
	if Actor.getSceneId(sysarg) ~= 668 then -- 不在熊猫林中
		return 0 -- 返回 0 则删除定时器
	end
	
	Actor.returnCity(sysarg)
	return 0 -- 返回 0 则删除定时器
end





--通天塔刷怪定时器
TimerFunc[60] = function(sysarg)
	--怪物id 837~ 837+29
	Actor.deleteTimer(sysarg,60)
		
	local var = Actor.getStaticVar(sysarg) 
	if var.TTTLayer == nil then 
		var.TTTLayer = 1
	end
	if not (Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2] ) then  --在副本中才创造怪物
		return 
	end
	
	Actor.createMonster(sysarg,TongTiantaCfg.monsterid[1]+ var.TTTLayer -1,35,30,0,false)
	
	--给个倒计时打怪，打不完就走
	Actor.deleteTimer(sysarg, 61)
	Actor.addTimer(sysarg, 61, TongTiantaCfg.killMonsterTime*1000)
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTongTianTa) 
	DataPack.writeByte(netPack, 2) --打怪的1分钟倒计时
	DataPack.flush(netPack)
		
end

--通天塔1分钟退出定时器
TimerFunc[61] = function(sysarg)
	Actor.deleteTimer(sysarg,61)
	if Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2]  then --在副本中才退出
		Actor.returnCity(sysarg)
	end
end

--通天塔杀怪后，10秒钟进入下一层
TimerFunc[62] = function(sysarg)
	local var = Actor.getStaticVar(sysarg) 
	Actor.deleteTimer(sysarg,62)
	
	if Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2]  then --在副本中才进行
		--进入下一关
		if Actor.getSceneId(sysarg)~=TongTiantaCfg.sceneid[2] then --不是最后一关
			local fbid = var.TTTLayer -1 + TongTiantaCfg.funbenid[1]
			local Hfuben = Fuben.createFuBen(fbid)  --1:表示副本ID
			if Hfuben == 0 then return end
			if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return  end  --从NPC那将玩家传进副本
			Actor.addTimer(sysarg,25,TongTiantaCfg.makeMonsterTime*1000) --自动挂机
			--给个倒计时刷怪
			Actor.sendTipmsg(sysarg,"怪物将在"..TongTiantaCfg.makeMonsterTime.."秒后刷出",ttFlyTip)
			Actor.addTimer(sysarg,60, TongTiantaCfg.makeMonsterTime*1000)
			
			
			local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTongTianTa) 
			DataPack.writeByte(netPack, 1) --进入的5秒倒计时
			DataPack.writeByte(netPack, var.TTTLayer) --进入第几关
			--DataPack.writeByte(netPack, var.newdays.YZCGaward[var.TTTLayer][1])
			DataPack.flush(netPack)
		
		else	--最后一关了 
			Actor.returnCity(sysarg)
		end
	end
end

--通天塔5秒定时器，检测是否场景中，不在就删除buff
TimerFunc[63] = function(sysarg)
	if not (Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2] ) then --在副本中才进行
		Actor.deleteTimer(sysarg,60)
		Actor.deleteTimer(sysarg,61)
		Actor.deleteTimer(sysarg,62)
		
		Actor.delBuffByIdRange(sysarg,222,281)  --删除范围buff
		Actor.deleteTimer(sysarg,63)
	end
end

-- 退出圣诞地图定时器
TimerFunc[64] = function(sysarg)
	if Actor.getSceneId(sysarg) ~= 731 then -- 不在圣诞地图中
		return 0 -- 返回 0 则删除定时器
	end
	
	Actor.returnCity(sysarg)
	return 0 -- 返回 0 则删除定时器
end