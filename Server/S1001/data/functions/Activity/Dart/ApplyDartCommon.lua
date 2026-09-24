--lua script
--#include "data\functions\OldPlayerReturnFunc.lua" once
--活动：押镖活动通用处理

-- @brief: 押镖超时
function OnActorDartExpired(sysarg)	
	-- 失败处理
	OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailExpired)
	Quest_ShuaXin(sysarg);
end

--开始护送
--[[
    函数名称：StartGuildDart
    函数描述：创建镖车
    参数 sysarg 的描述：
    参数 type 的描述：是否随机选择 1随机 0不随 不随机默认选1 
 ]]

function StartApplyActorDart(sysarg, type)
	local dvar = Actor.getDyanmicVar(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	
	if sVar.bcpz == nil or sVar.bcpz == 0 then
		sVar.bcpz = 1
	end

	local bcpz = sVar.bcpz
	if type == 1 then 	
		-- 随机选一个镖车
		local randCnt = System.getRandomNumber(100)  -- 返回[0-100]的随机数	
		for i=1, table.getn(EscortDartConfig.DartHorse[bcpz].freshRate[1]) do
			if (randCnt < EscortDartConfig.DartHorse[bcpz].freshRate[1][i]) then
				bcpz = i
				break
			end		
		end
	end

	local monsterInfo = EscortDartConfig.DartHorse[bcpz]    --给予一档的镖车
	sVar.bcpz = bcpz

	if monsterInfo ~= nil then
		local monster = sVar.bcHandle or 0
		if monster > 0 then
		  --通知客户端清除怪物信息 
			local pack = DataPack.allocPacket(sysarg, 139, 13)
			DataPack.writeInt64(pack, monster)
			DataPack.flush(pack)
			Fuben.clearMonster(monster, false)
		end

		local bool = Actor.refreshActorObserveList(sysarg)     --刷新观察者，防止客户端延迟
	end
end

-- 请求开始押镖
function StartDart(sysarg, packet)
	--local buybx = DataPack.readByte( packet );	--是否购买保险
    local nIndex = DataPack.readByte(packet)
	local cfg = StdActivityCfg.DuoBeiYaSong;
    if nIndex < 1 or nIndex > table.getn(cfg.tBiaoche) then
        return
    end
	
	local sVar = Actor.getStaticVar(sysarg)
	
	-- 检查是否在NPC旁边(因为这个函数不是放在NPC的表中，所以避开了与NPC的距离的检查，因此这里要检查一下)
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId ~= 9 then
		return -- 与镖师不在同一场景
	end
	
	local actX, actY = Actor.getEntityPosition(sysarg, 0, 0)
	local npcX = 150
	local npcY = 140
	if (npcX > (actX + 12) or npcX < (actX - 12) or npcY > (actY + 12) or npcY < (actY - 12)) then
		return -- 与镖师距离太远
	end
   
	--押镖状态判断
	local ybstate = sVar.ybstate;
	if not ybstate then ybstate = 0; end

	if ybstate == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00010, ttFlyTip)
		return 
	end
	
	--押镖次数判断必须放在扣钱前面
	local darttms = sVar.days.darttms
	if not darttms then darttms = 0; end
	
	--黄金特权多1次
	local maxDart = cfg.maxEscort
	if IsSpeciaTitleVip(sysarg,3) ==true then 
		maxDart = cfg.maxEscort+1
	end
	
	if darttms >= maxDart then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00013, cfg.maxEscort), ttFlyTip)
		return;
	end
	
	
    --检测需要需求
    if Actor.getMoneyCount(sysarg,cfg.tBiaoche[nIndex].need.type) < cfg.tBiaoche[nIndex].need.count then
        local str = "金币不足，无法押镖！"
        if cfg.tBiaoche[nIndex].need.type == 3 then 
            str = "元宝不足，无法押镖！"
        end
        Actor.sendTipmsg(sysarg,str, ttFlyTip)
        return
    end
    if not Actor.changeMoney(sysarg,cfg.tBiaoche[nIndex].need.type,-cfg.tBiaoche[nIndex].need.count,LogIds.yabiaoyajin,cfg.tBiaoche[nIndex].monName.."押金") then
        Actor.sendTipmsg(sysarg,"扣除押金失败!", ttFlyTip)
        return
    end
    

--	if not buybx then buybx = 0; end
--	if buybx == 1 then
--		if Actor.changeMoney(sysarg, mtYuanbao, -cfg.insurance, LogIds.ybBuyInsuranceConsume, Lang.LogTips.yb049) == false then
--			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00009, cfg.insurance), ttFlyTip);
--			sVar.buybx = nil;
--			return;
--		end
--		sVar.buybx = buybx;
--		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00001, cfg.insurance, cfg.tAwardPercent[4]*100), ttFlyTip);
--	end
	sVar.ybindex = nIndex
    sVar.bcpz = nIndex
	StartDartToDest(sysarg)
    
	Actor.closeDialogs(sysarg,diDart)
	Quest_ShuaXin(sysarg);
    ContinueEscort(sysarg,nil)
end

-- 开始押镖
function StartDartToDest(sysarg)
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local sVar = Actor.getStaticVar(sysarg)
	local dvar = Actor.getDyanmicVar(sysarg)
	
	if not sVar.bcpz then sVar.bcpz = 1 end
	local bcpz = sVar.bcpz
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local monsterInfo = cfg.tBiaoche[bcpz]    --给予一档的镖车

	if monsterInfo ~= nil then
		local monster = sVar.bcHandle or 0
		if monster > 0 then
		  --通知客户端清除怪物信息 
			local pack = DataPack.allocPacket(sysarg, 139, 13)
			DataPack.writeInt64(pack, monster)
			DataPack.flush(pack)
			Fuben.clearMonster(monster, false)
		end
		
		-- 创建镖车
		local x, y = Actor.getEntityPosition(sysarg, 0, 0)		--获取实体X Y坐标
		if CreateDartCar(sysarg, cfg, monsterInfo, x, y, cfg.time) == true then
			sVar.ybstate = cfg.DartSetup.CampDartStatusAccept
			Actor.setDartFlag(sysarg, 1) --设置普通押镖
			Actor.onTakeOffRide(sysarg);
			sVar.ActorDartTime = System.getCurrMiniTime() --开始护镖时间 
			local darttms = sVar.days.darttms;
			if not darttms then darttms = 0; end
			sVar.days.darttms = darttms + 1
			UpdateDartInfo(sysarg, sVar, cfg, sVar.bcpz, sVar.ActorDartDelayTime);
			
			local RwData = cfg.RwData;
			local name = Actor.getName(sysarg)
			local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
			local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
           
	        if bcpz == 1 or bcpz == 2 then return true end --1 2级镖车不提示
			local bcname = string.format("<(%s)%s>", monsterInfo.color, monsterInfo.monName);
			System.broadcastTipmsg(string.format(Lang.ScriptTips.bc00016, name, bcname), ttScreenCenter)
			System.broadcastTipmsg(string.format(Lang.ScriptTips.bc00005, name, bcname, NpcName, NpctFly), ttChatWindow)
            SetDartTimer(sysarg,true)
   
			return true;
		end
	end
	return false;
end

-- 更新活动数据
function sendActivityDataDartInfo(sysarg, args)
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 4) -- 活动类型
	
	for i, v in ipairs(args) do
		DataPack.writeInt(netPack, v)
	end
	
	DataPack.flush(netPack)
end

-- 更新押镖信息
function UpdateDartInfo(sysarg, var, cfg, bcpz, startTime)
	local tOpenTime = cfg.tOpenTime.times;
	local nIdx = checkActivityTime(tOpenTime);
	local monsterInfo = cfg.tBiaoche[bcpz];
	local args = {}
	args[1] = bcpz;
	if not var.buybx then
		args[2] = 0;
	else
		args[2] = 1;
	end
	args[3] = startTime;
	
	local nExp = 0;				-- 经验
	local nBindCion = 0;	-- 绑金
	local nMana = 0;			-- 功勋值
	local activitytime = 0; -- 活动剩余时间
	if nIdx > 0 then
		args[4] = 1;
		 nExp = monsterInfo.Awards[1].count * 2;
		nBindCion = monsterInfo.Awards[2].count * 2;
		nMana = monsterInfo.Awards[3].count * 2;
		if var.buybx == 1 then
			 nExp = nExp * cfg.tAwardPercent[4];
			nBindCion = nBindCion * cfg.tAwardPercent[4];
			nMana = nMana * cfg.tAwardPercent[4];
		end
		activitytime = System.ResidualTime(tonumber(tOpenTime[nIdx][3]), tonumber(tOpenTime[nIdx][4]), 0);
	else
		args[4] = 0;
		--DataPack.writeByte(pack, 0);
		 nExp = monsterInfo.Awards[1].count;
		nBindCion = monsterInfo.Awards[2].count;
		nMana = monsterInfo.Awards[3].count;
		if var.buybx == 1 then
			 nExp = nExp * cfg.tAwardPercent[4];
			nBindCion = nBindCion * cfg.tAwardPercent[4];
			nMana = nMana * cfg.tAwardPercent[4];
		end
		activitytime = 0;
	end
    
	args[5] =  0;		-- 经验
	args[6] =  nBindCion;		-- 绑金
	args[7] =  nMana;		-- 战将灵力
	args[8] =  activitytime;		-- 活动剩余时间
	sendActivityDataDartInfo(sysarg, args);
end

-- 交镖
function SubmitDart(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if not var.ybstate or var.ybstate ~= 1 then
        Actor.sendTipmsg(sysarg,"交镖失败,当前不在押镖状态!",ttFlyTip)
		return
	end
	
	if ChechDartDist(sysarg) == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00015, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local tBiaoche = cfg.tBiaoche;
	local bcpz = var.bcpz;
	if not bcpz or bcpz > #tBiaoche then
		ResetActorDartInfo(sysarg, false, true);
        Actor.sendTipmsg(sysarg,"交镖失败,镖车等级错误!",ttFlyTip)
		return;
	end
	
	-- 是否在活动期间
	local tOpenTime = cfg.tOpenTime.times;
	local nIdx = checkActivityTime(tOpenTime);

	-- 活动期间有双倍
	local nlogid = 0;
	local slogtip = "";
	local nMultiple = 1;
	if nIdx == 0 then
		nlogid = LogIds.NormalDartAward;
		slogtip = Lang.LogTips.dt001;
	else
		nlogid = LogIds.MultipleDartAward;
		slogtip = Lang.LogTips.dt002;
		nMultiple = 2;
	end
	
	local buybx = var.buybx;
	if not buybx then buybx = 0; end
	
	local tAwardPercent = cfg.tAwardPercent;
	local ybfail = var.ybfail;
	local tAwards = 
                   {
                        {type = 0, id = 0, count = 0, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					    {type = 0, id = 0, count = 0, quality = 0, strong = 0, bind = 0, param = 0},	--绑金
					    {type = 0, id = 0, count = 0, quality = 0, strong = 0, bind = 0, param = 0},	--功勋值
                   }
    for i = 1,table.getn(tAwards) do
        tAwards[i].type = tBiaoche[bcpz].Awards[i].type
        tAwards[i].count = tBiaoche[bcpz].Awards[i].count
        --table.insert 是引用
       -- table.insert(tAwards,tBiaoche[bcpz].Awards[i])
    end
	if not ybfail then ybfail = 0; end
	
	local exp = tAwards[1].count;
	local bindcion = tAwards[2].count;
	local mana = tAwards[3].count;
    --屏蔽奖励经验
	tAwards[1].count = 0
	if buybx == 1 then
		-- 买了保险
		if ybfail == 0 then
			-- 成功了
			--tAwards[1].count = exp * nMultiple * tAwardPercent[4];
			tAwards[2].count = bindcion * nMultiple * tAwardPercent[4];
			tAwards[3].count = mana * nMultiple * tAwardPercent[4];
		else
			--tAwards[1].count = exp * nMultiple * tAwardPercent[3];
			tAwards[2].count = bindcion * nMultiple * tAwardPercent[3];
			tAwards[3].count = mana * nMultiple * tAwardPercent[3];
		end
	else
		if ybfail == 0 then
			-- 成功了
			--tAwards[1].count = exp * nMultiple * tAwardPercent[2];
			tAwards[2].count = bindcion * nMultiple * tAwardPercent[2];
			tAwards[3].count = mana * nMultiple * tAwardPercent[2];
		else
			--tAwards[1].count = exp * nMultiple * tAwardPercent[1];
			tAwards[2].count = bindcion * nMultiple * tAwardPercent[1];
			tAwards[3].count = mana * nMultiple * tAwardPercent[1];
		end
	end
    --老兵回归
    local sys = System.getStaticVar()
    if sys.oldplayer ~= nil then
        local aVar = InitOldPlayerReturnInfo(sysarg)
        if aVar.oldplayret.isold == 1 then
            tAwards[2].count = tAwards[2].count * OldPlayerReturnCfg[1].Daily.rate
            tAwards[3].count  = tAwards[3].count  * OldPlayerReturnCfg[1].Daily.rate
        end
    end
    Actor.sendTipmsg("<(c0xFFFFFF00)获得功勋"..tAwards[3].count..">",ttTipmsgWindow)
	Awards.Give(sysarg, tAwards, nlogid, slogtip);
	
	--押镖完成的总次数
	if var.dtTotaltms == nil then
		var.dtTotaltms = 1
	else
		var.dtTotaltms = var.dtTotaltms + 1
	end

	-- 护送镖车总次数,参数1表示总次数
	Actor.triggerAchieveEvent(sysarg, 101, var.dtTotaltms)
	
	--完成活跃度任务
	OnFinish_Liveness(sysarg,14)
	--FinishLivenessTask(sysarg, 3)
--	RandGiveSwingStoneBox(sysarg)
	
--	Actor.openquestarrowsguide(sysarg,"");
    --返回押金
    Actor.changeMoney(sysarg,cfg.tBiaoche[var.ybindex].need.type,cfg.tBiaoche[var.ybindex].need.count,1,"押镖返还!")
	if var.days.darttms==nil then 
		var.days.darttms=0
	end
	local sData = tostring(bcpz)..","..tostring(tAwards[1].count)..","..tostring(tAwards[2].count)..","..tostring(tAwards[3].count)..","..tostring(var.days.darttms);
	ResetActorDartInfo(sysarg, false, true)
	Quest_ShuaXin(sysarg);
    --功勋值飞行特效
    Actor.playEnergyEffect(sysarg,3,0)
	return sData;
end

--发送下属
function SendActorDartInfo(sysarg,monsterId)
	local dVar = Actor.getStaticVar(sysarg)
	local svar = Actor.getDyanmicVar(sysarg)
	
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local dest = cfg.Dest  --目标 信息

	if dVar.ActorDartName == nil or svar.bcHandle == nil then
		return
	end

	if dest ~= nil then
	    		--Actor.regScriptCallback(monster, nil, 15000, 15000, -1, "OnCheckFollowDist")
				-- 发消息通知客户端设置归属。消息内容：归属怪物句柄、是否有目标点、[目标场景id、目标npc名称]				
		local pack = DataPack.allocPacket(sysarg, 139, 12)
		if (pack ~= nil) then
			DataPack.writeInt64(pack,svar.bcHandle)    --下属句柄
			DataPack.writeString(pack,dVar.ActorDartName)		-- 下属名称							
			DataPack.writeInt(pack, monsterId)			-- 下属模型Id
			DataPack.writeChar(pack, 1)                            --消息中是否有目标点信息 1表示后面紧跟着目标点信息 0表示后面无目标点信息
			DataPack.writeInt(pack, dest.destsceneid)       --目标点场景ID
			DataPack.writeString(pack, dest.destnpcname)    --目标NPC名称
			DataPack.flush(pack)
		end
	end
end

--下发移除下属
function DeleteActorDartInfo(sysarg, bcHandle)
	local pack = DataPack.allocPacket(sysarg, 139, 13)
	if (pack ~= nil) then
		DataPack.writeInt64(pack, bcHandle)    --下属句柄
		DataPack.flush(pack)
	end

end

-- 打开押镖对话框
function OpenDartDialog(sysarg, packet)
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if pLv < cfg.level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00006, cfg.level), ttFlyTip);
		return;
	end
	
	local var = Actor.getStaticVar(sysarg);
	local bcpz = var.bcpz; -- 镖车等级
	if not bcpz then bcpz = 1 end
	
	local pzxstms = var.days.pzxstms; -- 刷新次数
	if not pzxstms then pzxstms = 0; end
	
	local darttms = var.days.darttms; -- 运镖次数
	if not darttms then darttms = 0; end
	
	local tBiaoche = cfg.tBiaoche[bcpz];
	if not tBiaoche then -- 没有该等级的镖车
		var.bcpz = nil
		bcpz = 1
		tBiaoche = cfg.tBiaoche[bcpz]
		if not tBiaoche then return end
	end
	
	local tOpenTime = cfg.tOpenTime.times;
	local bDouble = 0; -- 是否双倍活动时间
	local endHour = 0;
	local endMin = 0;
	for i = 1, #tOpenTime do
		local starHour = tonumber(tOpenTime[i][1]);
		--if starHour == 0 then
		--	starHour = 24;
		--end
		
		endHour = tonumber(tOpenTime[i][3]);
		if endHour == 0 then
			endHour = 24;
		end
		
		endMin = tonumber(tOpenTime[i][4]);
		if (System.isInTimeRange(starHour, tonumber(tOpenTime[i][2]), 0, endHour, endMin, 0)) == true then
			bDouble = 1; -- 双倍活动时间
			break;
		end
	end
  
    --print("刷新次数:"..pzxstms.."镖车品质:"..bcpz.."运镖次数:"..darttms)
    --145 23
	--[[local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sSendOpenYBDlgData)
	if (pack ~= nil) then
		DataPack.writeByte(pack, bcpz)    		-- 镖车品质
		DataPack.writeByte(pack, pzxstms)			-- 刷新次数
		DataPack.writeByte(pack, darttms)			-- 运镖次数
		DataPack.writeByte(pack, bDouble)			-- 是否双倍活动时间
		DataPack.flush(pack)
	end]]--
	
	pzxstms = var.d[37]
	-- 镖车等级,刷新次数,运镖次数,是否双倍活动时间
	local sData = tostring(bcpz)..","..tostring(pzxstms)..","..tostring(darttms)..","..tostring(bDouble)
	--print(sData);
	return sData;
end

-- 扣除刷新镖车等级消耗
function RefreshActorDartLevelConsume(sysarg)
    --免费刷新次数
    local var = Actor.getStaticVar(sysarg)
    if var.d[37] == nil then var.d[37] = 0 end
    if var.d[37] > 0 then
        var.d[37] = var.d[37] - 1
        return true,"消耗一次免费刷新机会"
    end
	local tYBL = StdActivityCfg.DuoBeiYaSong.tYBL
	
	if Actor.removeItem(sysarg, tYBL.itemId, 1, -1, -1, -1, "扣除运镖令") >= 1 then
		return true,"消耗一个押镖令"
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -tYBL.yb, LogIds.ybBuyYBLConsume, Lang.LogTips.yb050) == true then
		return true,"消耗50元宝"
	end
	
	local itemName = Item.getItemName(tYBL.itemId)
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00012, itemName, tYBL.yb), ttFlyTip)
	return false
end

-- 刷新镖车等级
function RefreshActorDartLevel(sysarg, packet)
	local toLevel = DataPack.readByte(packet)	-- 一键刷新到几级
	
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local var = Actor.getStaticVar(sysarg);
	if var.ybstate == 1 then -- 正在押镖
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00010, ttFlyTip)
		return 
	end
	
	local bcpz = var.bcpz; -- 镖车等级
	if not bcpz then bcpz = 1; end
	
	if toLevel <= bcpz then
		Actor.sendTipmsg(sysarg, "<(c0xFFffff00)当前镖车等级为><(c0xFF00ff00)" .. bcpz .. "级>", ttFlyTip)
		return
	end
	
	local tBiaoche = cfg.tBiaoche;
	local biaocheCount = #tBiaoche
	if bcpz >= biaocheCount then -- 已是最高等级
		local name = string.format("<(%s)%s>", tBiaoche[biaocheCount].color, tBiaoche[biaocheCount].monName);
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00008, name), ttFlyTip);
		return
	end
	
	if toLevel > biaocheCount then
		toLevel = biaocheCount
	end
    local nRet,tipstr = RefreshActorDartLevelConsume(sysarg)
	if nRet == false then
        return
    end
    
	--local pzxstms = var.days.pzxstms; -- 刷新次数
    --local pzxstms = var.d[37]
	--if not pzxstms then pzxstms = 0; end
	
	local oldlevel = bcpz	
	local isUpdateClient = false
	if math.random(10000) <= tBiaoche[bcpz + 1].freshRate then -- 命中
			bcpz = bcpz + 1
			var.bcpz = bcpz
           
	else
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00003..tipstr, ttFlyTip); -- 不命中
	end
     isUpdateClient = true
    
--	while bcpz < toLevel do	
--		if pzxstms >= cfg.maxRefresh then
--			if RefreshActorDartLevelConsume(sysarg) == false then
--				break
--			end
--		end

--		isUpdateClient = true

--		pzxstms = pzxstms + 1
--		var.days.pzxstms = pzxstms

--		if math.random(10000) <= tBiaoche[bcpz + 1].freshRate then -- 命中
--			bcpz = bcpz + 1
--			var.bcpz = bcpz
--		else
--			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00003, ttFlyTip); -- 不命中
--		end
--	end	
	
	if bcpz ~= oldlevel	then
		local name = string.format("<(%s)%s>", tBiaoche[bcpz].color, tBiaoche[bcpz].monName);
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00002, name,tipstr), ttFlyTip);
	end

	if isUpdateClient then
        local pzxstms = var.d[37]
	    if not pzxstms then pzxstms = 0; end
		sendDartRefresh(sysarg, bcpz, pzxstms); -- 更新界面
	end
end

-- 下发刷新镖车结果
function sendDartRefresh(sysarg, bcpz, pzxstms)
	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sDartRefreshPuality)
	if not pack then return; end
	
	DataPack.writeByte(pack, bcpz)    		-- 镖车品质
	DataPack.writeByte(pack, pzxstms)			-- 刷新次数
	DataPack.flush(pack)
end

-- @brief: 护送失败处理处理。(type = 1护镖超时、3镖车死亡、4玩家放弃、5玩家退出游戏、6玩家死亡 镖车被劫)
function OnActorDartFailed(sysarg, reason,killplay,monster,bDelayDestroy)
    	
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local DartSetup = cfg.DartSetup;
	reason = reason or cfg.DartSetup.CampDartFailUnknown
    local bAddCount = false
    local var = nil
    if sysarg ~= nil then
        var = Actor.getStaticVar(sysarg)
       
        if not var.bcpz then var.bcpz = 1 end
	    
    end
    
	if Actor.getIsDartFlag(sysarg) == 1 then -- 普通押镖
		Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end

    local bcpz = 0
    local nYbIndex = 0
    local nActorId = 0
    if monster ~= nil then
        nActorId = Actor.getBCMonsterOwnerId(monster)
        local nTag = Actor.getBCMonsterTag(monster)
        nYbIndex = System.getIntByte(nTag,0)
        bcpz = System.getIntByte(nTag,1)

    else
        nYbIndex = var.ybindex
        bcpz = var.bcpz
    end
    
    if nYbIndex == nil or cfg.tBiaoche[nYbIndex] == nil then -- 没有打开该类型的镖车
    	local __actorId = 0
    	if sysarg ~= nil then
    		__actorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    	else
    		__actorId = nActorId
    	end
    		
    	if nYbIndex == nil then
    		print("error, OnActorDartFailed nYbIndex==nil, actorId=" .. __actorId)
    	else
    		print("error, OnActorDartFailed nYbIndex=="..nYbIndex.."actorId=" .. __actorId)
    	end
    	
    	return
    end
      
	if reason == DartSetup.CampDartFailObjDie then	-- 镖车被杀，被劫镖
		--ResetActorDartInfo(sysarg, false, true)
		--Actor.sendTipmsg(player, Lang.ScriptTips.bc00011, ttFlyTip);
		--Actor.regScriptTimer(sysarg, 0, cfg.relivetime*1000, 1000, 1, "ReliveDart")
        bAddCount = true
        --返还押金20%
     
       if sysarg ~= nil then       		
            local str = "押镖失败,返还20%押金:"..tostring(tonumber(cfg.tBiaoche[nYbIndex].need.count * 0.20))
            local nGoldType= "元宝"
             if cfg.tBiaoche[nYbIndex].need.type == 0 then
               nGoldType = "绑金"
            end
            str = str..nGoldType
            Actor.sendTipmsg(sysarg, str, ttFlyTip);
            Actor.changeMoney(sysarg,cfg.tBiaoche[nYbIndex].need.type,cfg.tBiaoche[nYbIndex].need.count * 0.20,1,"被劫返还押金")
       --else--镖车被劫镖的情况下 发邮件
--       print("code:2".."bcpz:"..bcpz)
--        if cfg.tBiaoche[bcpz].addMailId ~= nil then
--              print("code:1")
--            local szMail = "您押送"..cfg.tBiaoche[bcpz].monName.."镖车被攻破,特此返还20%押金,白金-钻石-王者镖车会返还一次押镖机会。如镖车因超时导致消失则不返还押金以及押镖机会。"
--            System.AddMail(nActorId,6,0,"押镖失败",szMail,0,0,cfg.tBiaoche[bcpz].addMailId..",1,1")
--        end
       
       end

        --劫镖者75%
--         local nValue = tonumber(cfg.tBiaoche[var.ybindex].need.count * 0.75)
--        str = "劫镖成功，获得"..tostring(nValue)
--        if cfg.tBiaoche[var.ybindex].need.type == 1 then
--            str= str.."绑金"
--        else
--            str  = str.."元宝"
--        end
    --创建掉落道具
        local dropPtr = sysarg
        if dropPtr == nil then
            dropPtr = monster
        else
            local bcHandle = var.bcHandle;
	        if  bcHandle ~= nil then
		        local bcptr = Actor.getEntity(bcHandle);
                if bcptr ~= nil then
                    dropPtr = bcptr
                end
	        end
        end
       local nLoopCount = 0
       if killplay ~= nil then

            nLoopCount = table.getn(cfg.tBiaoche[nYbIndex].DropMoney)
            for i = 1,nLoopCount do
                local tMoney = cfg.tBiaoche[nYbIndex].DropMoney[i]
           
                Item.createDropMoneyItem(dropPtr,tMoney.type,tMoney.count,LogIds.jiebiao,"劫镖"..Actor.getName(sysarg),nil)
        
            end
       end

        --Actor.sendTipmsg(killplay,str , ttFlyTip);
        --System.broadcastTipmsg(string.format("<(n%s)>劫取了<(n%s)>的%s,获得大量赏金,真是刺激啊！",Actor.getName(killplay),Actor.getName(sysarg),cfg.tBiaoche[var.ybindex].monName),ttScreenCenter+ttChatWindow)

       -- Actor.changeMoney(killplay,cfg.tBiaoche[ var.ybindex].need.type,cfg.tBiaoche[ var.ybindex].need.count * 0.75,1,"被劫返还押金")
   
       if sysarg ~= nil then
            AbandonEscort(sysarg,true,bDelayDestroy)
       end

        --str = string.format("<(n%s)>劫了<(n%s)>的镖车,获得了%d%s！",Actor.getName(killplay),Actor.getName(sysarg),nValue,nGoldType)
       -- print("str:"..str)
	    
        if killplay ~= nil then
             local szActorName = ""
            if sysarg ~= nil then
                szActorName = Actor.getName(sysarg)
            else
                szActorName = Actor.getMonsterStrEx(monster)         
            end
		    local name = string.format("<(%s)%s>", cfg.tBiaoche[bcpz].color, cfg.tBiaoche[bcpz].monName);
            local str = ""
            if nLoopCount == 0 then
                str = string.format("<(n%s)>劫了<(n%s)>的%s，人狠话不多，竟然连%s都不放过！",Actor.getName(killplay),szActorName,name,name)
            else
               str  = string.format("<(n%s)>劫了<(n%s)>的%s,镖车掉落了大量赏金,见者有份啊！",Actor.getName(killplay),szActorName,name)
            end
		
		    System.broadcastTipmsg(str,ttChatWindow)
        end
	   
	elseif reason == DartSetup.CampDartFailExpired then		-- 超时
        AbandonEscort(sysarg,true,bDelayDestroy)
       -- ResetActorDartInfo(sysarg, false, true)
		--if not var.ybfail then var.ybfail = 1; end
	elseif reason == cfg.DartSetup.CampDartFailActorLogout then	-- 下线
		--ResetActorDartInfo(sysarg, false, false)
        OnBiaoCheOffice(sysarg)

	elseif reason == cfg.DartSetup.CampDartFailBeLoot then	-- 玩家死亡 镖车被劫
       -- ResetActorDartInfo(sysarg, false, true)
        AbandonEscort(sysarg,true,bDelayDestroy)
        bAddCount = true 
		--local bcptr = Actor.getEntity(var.bcHandle);
		--Actor.changeHp(bcptr, 0);
	elseif reason == cfg.DartSetup.CampDartFailUnknown then	-- 未知原因
		--ResetActorDartInfo(sysarg, false, true)
        AbandonEscort(sysarg,true,bDelayDestroy)
	end
    --返还押镖次数
    if bAddCount == true and cfg.tBiaoche[bcpz].notReturn == 0 then
        if sysarg ~= nil then
            local sVar = Actor.getStaticVar(sysarg)
			
			if sVar.days.darttms==nil then 
				sVar.days.darttms=0
			end
	
	
            sVar.days.darttms = sVar.days.darttms - 1
            if sVar.days.darttms < 0 then sVar.days.darttms = 0 end
            local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sDartFail)
	        DataPack.flush(pack)
        
        end
       
    end
  
end

-- @brief: 重置护送相关的数据
function ResetActorDartInfo(sysarg, bDelayRemove, bResetData)
	if (bDelayRemove == nil) then bDelayRemove=false end

	local dVar = Actor.getDyanmicVar(sysarg)
	local svar = Actor.getStaticVar(sysarg)

	-- 清除镖车
	if (svar.bcHandle ~= nil and svar.bcHandle ~= 0) then
		if bDelayRemove == false then
			Fuben.clearMonster(svar.bcHandle,bDelayRemove)
		end
		DeleteActorDartInfo(sysarg, svar.bcHandle);
	end

	Actor.unregScriptCallback(sysarg, "OnActorDartExpired")
	
	if Actor.getIsDartFlag(sysarg) == 1 then -- 普通押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
	
	if bResetData then
		dVar.ActorDartacceptNpc = nil
		dVar.ActorDartdestnpcname = nil;
		dVar.ActorDartdestsceneid = nil;
		
		svar.days.pzxstms = nil;
		svar.buybx = nil;
		svar.ybfail = nil;
		svar.bcHandle = nil;
		svar.ActorDartDelayTime = nil
		svar.ybstate = nil
		svar.bcpz = nil
		svar.ActorDartTime = nil
		svar.bcHandle = nil
        svar.ybindex = nil
		if not svar.ybfail then svar.ybfail = nil; end
		
	else
		-- 押镖失败
		if not svar.ybfail then svar.ybfail = 1; end
	end
	
--	if Actor.hasBuff(sysarg,EscortDartConfig.AddBuff[1].buffType,EscortDartConfig.AddBuff[1].buffGroup) then
--		Actor.delBuff(sysarg,EscortDartConfig.AddBuff[1].buffType,EscortDartConfig.AddBuff[1].buffGroup)
--	end
end


-- 复活镖车
function ReliveDart(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate == 1 and var.bcpz then
		local bccfg = StdActivityCfg.DuoBeiYaSong.tBiaoche[var.bcpz];
		local x, y;
		if not var.bcposx or not var.bcposy then
				x, y = Actor.getEntityPosition(sysarg, 0, 0)		--获取实体X Y坐标
		else
			x = var.bcposx;
			y = var.bcposy;
		end
		
		local nTime = System.getCurrMiniTime()
		local lastTime = var.ActorDartTime + StdActivityCfg.DuoBeiYaSong.time - nTime
		if CreateDartCar(sysarg, cfg, bccfg, x, y, lastTime) == true then
			UpdateDartInfo(sysarg, var, cfg, var.bcpz, var.ActorDartDelayTime);
		end
	end
	Actor.unregScriptCallback(sysarg, "ReliveDart");
end



-- 创建镖车
function CreateDartCar(sysarg, cfg, bccfg, x, y, time,sceneid,bcHandle)
	local dvar = Actor.getDyanmicVar(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	local monster = nil
    if bcHandle ~= nil then
        monster = Actor.getEntity(bcHandle)
    end
    if monster == nil then
        monster = Actor.createMonster(sysarg, bccfg.id, x, y, 0,true,sceneid)
    end
	if monster ~= nil then
		Actor.followActor(monster, sysarg, cfg.distance[1], cfg.distance[3], true,true) --跟随某个玩家
        --因为镖车设置为了玩家下线后，镖车也不下线，用一个变量记录玩家id
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local nTag = 0
        nTag = System.setIntByte(nTag,0,sVar.ybindex)
        nTag = System.setIntByte(nTag,1,sVar.bcpz)
       
        Actor.setBCMonsterTag(monster,nTag )     
        
        Actor.setMonsterStrEx(monster,Actor.getName(sysarg))
        Actor.setBCMonsterOwnerId(monster,nActorId)
		Actor.setEntityTelByOwnderAttr(monster, true)   --设置实体是否跟着归属者传送
		Actor.setEntityLazyFollow(monster, true)        --设置实体是否惰性跟随
		Actor.setDenyAttackedByActor(monster, false)     --设置实体是否可被玩家攻击
		Actor.refreshActorObserveList(sysarg)     --刷新观察者，防止客户端延迟 
		
		-- 保存开始护镖时间、怪物指针和接镖NPC、目标NPC名称和目标NPC所在场景Id 奖励倍率
		sVar.bcHandle = Actor.getHandle(monster) --怪物句柄
		
		dvar.ActorDartacceptNpc = Actor.getHandle(thisNPC)  -- 貌似直接保存指针保存不了，这里保存句柄
		dvar.ActorDartdestnpcname = cfg.Dest.name  --目标NPC名称
		dvar.ActorDartdestsceneid = cfg.Dest.sceneid  --目标点场景ID
		dvar.ActorDartName = Actor.getName(monster)	--怪物名称

		SendActorDartInfo(sysarg, Actor.getIntProperty(monster, PROP_ENTITY_MODELID))
		
		-- 处理护镖超时
		Actor.unregScriptCallback(sysarg, "OnActorDartExpired")
		
		sVar.ActorDartDelayTime = time
		if sVar.ActorDartDelayTime < 0  then
			sVar.ActorDartDelayTime = 0;
		end
		if sVar.ActorDartDelayTime >= 0 then
			Actor.regScriptTimer(sysarg, 0, sVar.ActorDartDelayTime*1000, 10000, 1, "OnActorDartExpired")
		end
--				local buff = cfg.buff[1]
--				Actor.addBuff(sysarg, buff.type, buff.groupid, buff.value, buff.times, buff.interval, buff.buffName);
        
        Actor.setDartFlag(sysarg, 1) --设置普通押镖
        Actor.onTakeOffRide(sysarg)
        
		return true;
	end
	return false;
end

-- 放弃护送
function AbandonEscort(sysarg, packet,bDelayDestroy)
	if bDelayDestroy == nil then bDelayDestroy = false end
	
	ResetActorDartInfo(sysarg, bDelayDestroy, true);
	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sAbandonEscort)
	DataPack.writeByte(pack, 1)
	DataPack.flush(pack)
    SetDartTimer(sysarg,false)
end

function SetDartTimer(sysarg,isOpen)
    if isOpen == nil then isOpen = false end
    local var = Actor.getStaticVar(sysarg)
  
    if  var.autobiaoche == nil then  var.autobiaoche = 0 end
    if isOpen == true then
          var.autobiaoche = 1
    else
        var.autobiaoche = 0
    end
   
--    if isOpen == true then
--        Actor.addTimer(sysarg,ActorTimerIds.DartFollowPasue,3000)
--    else
--        Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowPasue)
--    end
--    if isOpen == true then
--        Actor.addTimer(sysarg,ActorTimerIds.DartFollowPasue,1000)
--        return
--    end

--    Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowPasue)
--    Actor.deleteTimer(sysarg,ActorTimerIds.DartFollowRun)
    
end
-- 继续护送
function ContinueEscort(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate ~= 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00014, ttFlyTip);
		return;
	end
	
	local bcHandle = var.bcHandle;
	if not bcHandle then
		return;
	end
	
	local bcptr = Actor.getEntity(bcHandle);
	if not bcptr then
		--print("bcptr is nil, bcHandle "..bcHandle);
		return;
	end
	local sceneid = Actor.getSceneId(bcptr);
	local sceneName, x, y = Actor.getSceneName( bcptr, 0, 0 );
	--取距离- 如果距离在镖车附近，就不下发跟随到镖车了
    local nx,ny = Actor.getEntityPosition(sysarg,0,0)
    dis = math.max(math.abs(x -nx),math.abs(y - ny))
    local cfg = StdActivityCfg.DuoBeiYaSong 
    --与镖车距离相近，移动到目标地点
  
    if dis <= cfg.distance[2] then
        --把客户端的GameData.AUTO_ESCORTCAR 设置为押镖状态
        local packEx = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sMoveToDartPos)
        DataPack.writeInt(packEx, 0)
        DataPack.flush(packEx)
        Actor.autoFindPathToNpc(sysarg,cfg.Dest.sceneid,cfg.Dest.name)
        SetDartTimer(sysarg,true)

        return
    end
    
	-- 下发移动到镖车旁
	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sMoveToDartPos)
	DataPack.writeInt(pack, sceneid)
	DataPack.writeString(pack, sceneName);
	DataPack.writeInt(pack, x)
	DataPack.writeInt(pack, y -1 );
	DataPack.flush(pack)
end

-- 使用无敌镖车技能
function UseInvincibleSkill(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
    local dVar = Actor.getDyanmicVar(sysarg)
    local buff = StdActivityCfg.DuoBeiYaSong.buff[1];
    if dVar.dartCD == nil then dVar.dartCD = 0 end
	if var.ybstate ~= 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00014, ttFlyTip);
		return;
	end
   
	if System.getTick() - dVar.dartCD < buff.cd * 1000 then --六十秒
        Actor.sendTipmsg(sysarg,"无敌镖车正在冷却中!",ttFlyTip)
        return
    end
    dVar.dartCD  = System.getTick()
	local bcHandle = var.bcHandle;
	if not bcHandle then
       
		return;
	end
	
	
   
	local bcptr = Actor.getEntity(bcHandle);
	if not bcptr then
		print("bcptr is nil");
		return
	end
	Actor.addBuffById(bcptr, buff.id, buff.value)
    Actor.sendTipmsg(sysarg,"开启了无敌镖车,持续5秒!!",ttFlyTip)
    --广播 显示buff图标
    Actor.addEffect(bcptr,10008,6,5000)
end

-- 

-- 检测镖车距离
function ChechDartDist(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	local svar = Actor.getStaticVar(sysarg)

	local monster = Actor.getEntity(svar.bcHandle)
	local playerX,playerY = Actor.getEntityPosition(sysarg,0,0)
	local monsterX,monsterY = Actor.getEntityPosition(monster,0,0)
    if Actor.getSceneId(monster) ~= Actor.getSceneId(sysarg) then
        return 0
    end
    
	monsterX = monsterX - playerX
	monsterY = monsterY - playerY
	
	local Distance = (monsterX*monsterX) + (monsterY*monsterY)
  
	if Distance > (10*10) then
		return 0;
	end
	return 1;	
end


-- 行会求救技能
function UseGuildHelpSkill(sysarg, packet)
	if Actor.getGuildId(sysarg) == 0 then
        Actor.sendTipmsg(sysarg,"您还未加入帮会",ttFlyTip)
        return
    end
    local item_id = 515 --行会召唤令
    if Actor.getItemCount(sysarg,item_id) <= 0 then
        Actor.sendTipmsg(sysarg,"行会召唤令不足,无法求救!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg,item_id,1)

    local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sGuildSOS)
	DataPack.flush(pack)
end

--[[
--下发押镖剩余次数
function SendActorLeftDactTimes(sysarg, leftTimes)
	if leftTimes < 0 then
		leftTimes = 0
	end

	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sDartSurplusTimes)
	DataPack.writeInt(pack, leftTimes)
	DataPack.flush(pack)
end
--]]
function onBroadcast_DuoBeiYaSong_StartBefore5(sysarg)
	if System.isCrossServer() ==true then
		return 
	end
	
	print("双倍押镖预告")
	local cfg = StdActivityCfg.DuoBeiYaSong
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟之后开启，请大家踊跃参加。", RwData[1] ), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟之后开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end
function onBroadcast_DuoBeiYaSong_Start(sysarg)

	if System.isCrossServer() ==true then
		return 
	end
	
	print("双倍押镖开始")
	local cfg = StdActivityCfg.DuoBeiYaSong
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动已经开启，请大家踊跃参加。", RwData[1] ), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动已经开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)
	
	local dVar = System.getDyanmicVar()
	dVar.duobeiyabiaoTime=System.getCurrMiniTime()
	
end
function OnBroadcast_DuoBeiYaSong_End(sysarg)
	
	if System.isCrossServer() ==true then
		return 
	end
	
	--print("双倍押镖结束")
	local cfg = StdActivityCfg.DuoBeiYaSong
	local RwData = cfg.RwData
	System.broadcastTipmsg(string.format("%s活动已经结束",RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动已经结束",RwData[1]), ttChatWindow)
	
	local dVar = System.getDyanmicVar()
	dVar.duobeiyabiaoTime=nil
end

function OnBiaoCheOffice(sysarg)
   
    local var = Actor.getStaticVar(sysarg)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local sVar = System.getStaticVar()
    if sVar.officebiaoche == nil then
        sVar.officebiaoche ={}
        sVar.officebiaoche.count = 0
        sVar.officebiaoche.l = {}
    end
    local nInsertPos = 0
    for i = 1,sVar.officebiaoche.count do
        if nInsertPos == 0 and sVar.officebiaoche.l[i] == nil then
            nInsertPos = i
        end
        if sVar.officebiaoche.l[i] ~= nil and sVar.officebiaoche.l[i].id == nActorId then
            sVar.officebiaoche.l[i].time = var.ActorDartTime
            sVar.officebiaoche.l[i].bcHandle = var.bcHandle
            return
        end
    end
   
    if nInsertPos<= 0 then
        sVar.officebiaoche.count = sVar.officebiaoche.count + 1
        nInsertPos = sVar.officebiaoche.count
    end
     sVar.officebiaoche.l[nInsertPos] = {}
   sVar.officebiaoche.l[nInsertPos].id = nActorId
   sVar.officebiaoche.l[nInsertPos].time = var.ActorDartTime
   sVar.officebiaoche.l[nInsertPos].bcHandle = var.bcHandle
   sVar.officebiaoche.l[nInsertPos].tag = 0
end