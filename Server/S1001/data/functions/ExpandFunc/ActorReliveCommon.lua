--#include "data\config\activityconfig\RushToxic\ToxicRankFile.lua" once

 --#include "data\functions\SpaceCopys\SpaceChallenge.lua" once
--#include "data\functions\Systems\pkSystem\PkZhanHun.lua" once
--#include "data\functions\Systems\pkSystem\PkExp.lua" once
--#include "data\config\misc\ReliveConfig.lua" once
--#include "RedActorRelive.lua" once
--#include "data\functions\Activity\WeekEnd\HuntingCommon.lua" once
--#include "data\config\vip\VipPrivilegesCfg.lua" once
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\config\guild\JiQingGuildCfg.lua" once
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--检查是否不用显示杀人者名字（用星号代替)
function IsNotShowName(sysarg)
	if IsInHuntScene(sysarg) then
		return true
	end
	local nSceneId = Actor.getSceneId(sysarg)
	for k, sId in ipairs(ReliveConfig.NoShowNameScene) do
		if nSceneId == sId then
			return true
		end
	end
	return false
end

--打开复活窗口
--nLiveTime: 窗口剩余时间
function OpenReliveDialog(sysarg, nLiveTime)
	--print("OpenReliveDialog")
	local nDropZhanHun = 0
	local nDropExp = 0
	
	local svar = Actor.getStaticVar(sysarg)	
	local data = svar.killerData	--被击杀信息
	if not data then 
		svar.killerData = {}
		data = svar.killerData
		data[6] = 2
	end
	local campId = data[2]
	local killerName = data[3]
	local killerType = data[6]
	
	if not killerName then killerName = "" end
	if not killerType then killerType = 2 end
	if killerType == 0 then
		nDropZhanHun = CalcOnKillDropZhanHun(sysarg)
		nDropExp = CalcOnKillDropExp(sysarg)
		data[7] = nDropZhanHun
		data[8] = nDropExp
	end
	
	--print(killerName)
	--print(killerType)
	--print(nDropZhanHun)
	--print(nDropExp)
	
	--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00031,Lang.ScriptTips.x00066.."/UseItemRelive",Lang.ScriptTips.x00067.."/safeResurrection", nil, ReliveConfig.reliveTime*1000)
	
	if IsNotShowName(sysarg) then
		killerName = "******"
	end
	
	SendToClientReliveMsg(sysarg, killerType, campId, killerName, nDropZhanHun, nDropExp,nLiveTime)
	
end

--打开复活窗口不计算数值
function OpenReliveDialogNotCalc(sysarg,nLiveTime)
	local svar = Actor.getStaticVar(sysarg)	
	local data = svar.killerData	--被击杀信息
	if not data then 
		svar.killerData = {}
		data = svar.killerData
		data[6] = 2
	end
	local campId = data[2]
	local killerName = data[3]
	local killerType = data[6]
	local nDropZhanHun = data[7]
	local nDropExp = data[8]
	if not killerName then killerName = "" end
	if not killerType then killerType = 2 end
	if not nDropZhanHun then nDropZhanHun = 0 end
	if not nDropExp then nDropExp = 0 end
	
	SendToClientReliveMsg(sysarg, killerType, campId, killerName, nDropZhanHun, nDropExp, nLiveTime)
end

--发送数据客户端打开复活界面
function SendToClientReliveMsg(sysarg, killerType, campId, killerName, nDropZhanHun, nDropExp, nLiveTime)
	local nDropZhanHun = tonumber(nDropZhanHun)
	local nDropExp = tonumber(nDropExp)
	local nLiveTime = tonumber(nLiveTime)
	
	--print("SendToClientReliveMsg")
	-- print("killerType:"..killerType)
	--print("killerName:"..killerName)
	--print("nDropZhanHun:"..nDropZhanHun)
	--print("nDropExp:"..nDropExp)
	--print("nLiveTime:"..nLiveTime)
	--通知客户端
	--[[
	if killerType == 0 then 
		--local campName = Camp.getCampName(Camp.getCampById(campId))
		killerName = string.format(Lang.ScriptTips.x00161,campName,killerName)
	elseif killerType == 1 then
		killerName = string.format(Lang.ScriptTips.x00162,killerName)
	end
	--]]
	local nFlag = 12
	-- if (Actor.hasMapAreaAttri(sysarg, aaEndPkCanHereRelive) == true) then
		-- nFlag = 7
		-- killerName = Lang.ScriptTips.mt00023
	-- end
	
	if Actor.hasMapAreaAttri(sysarg, aaNotHereRelive) then		--要判断是否禁止原地复活
		nFlag = 4
	end
	-- print("nFlag:"..nFlag)
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sOpenReliveDialog)
	if npack == nil then return end
	DataPack.writeByte(npack,killerType)	--击杀者类型  0 玩家 1怪物 2其他
	DataPack.writeString(npack,killerName)	--击杀者名字
	DataPack.writeInt(npack,nDropZhanHun) --掉落战魂
	DataPack.writeInt(npack,nDropExp)	--掉落经验
	DataPack.writeInt(npack,nLiveTime)	--窗口存活剩余时间
	DataPack.writeByte(npack,nFlag)	--复活按钮显示
	DataPack.flush(npack)
end

---------------------------------------------原地复活-----------------------------------------------

--点击确定  原地复活按钮 type 复活类型  1复活石复活 2元宝复活 3安全复活 4原地复活---------------------------
function GoReliveFunc(sysarg, type)
	--print("原地复活!!!!!!")
--    if Actor.getIntProperty(sysarg,PROP_ENTITY_ID) == 84108150 then
--        System.trace("GoReliveFunc:"..Actor.getIntProperty(sysarg,PROP_CREATURE_HP).."reliveType:"..type)
--    end
	--print("GoReliveFunc")
	-- local MaxHp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
	-- local MaxMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
	-- local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
	-- Actor.changeHp(sysarg,MaxHp)
	-- if MaxMp - actorMp == 0 then
		-- Actor.changeMp(sysarg,-1)
	-- else 
		-- Actor.changeMp(sysarg,MaxMp-actorMp-1)
	-- end
--    local var = Actor.getStaticVar(sysarg)
--    local nVipFreeCount = 0
--    if var.days ~= nil and  var.days.VipFreeRelive ~= nil then
--        nVipFreeCount = var.days.VipFreeRelive
--    end

--    System.sendCommonLog(LogIds.ReliveLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),tonumber(type),nVipFreeCount)
 
	if Actor.hasMapAreaAttri(sysarg, aaNotHereRelive) then		--要判断是否禁止原地复活
		safeResurrection(sysarg,{type})
	end
	--[[
	local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
	Actor.changeHp(sysarg,maxhp*ReliveConfig.placeRate)
	--local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
	local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
	Actor.changeMp(sysarg,maxmp*ReliveConfig.placeRate)
	--]]
	--改为满血满蓝满内功
	local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
	Actor.changeHp(sysarg,maxhp)
	local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
	Actor.changeMp(sysarg,maxmp)
	local maxinner = Actor.getUIntProperty(sysarg,PROP_ACTOR_MAX_INNER)
	Actor.setUIntProperty(sysarg,PROP_ACTOR_INNER,maxinner)
	
	local buff = ReliveConfig.protectBuff
	if buff.type > 0 then
		Actor.addBuff(sysarg,buff.type,1,1,1,buff.time,Lang.ScriptTips.b00009)
	end
	Actor.clearReliveTimeOut(sysarg)
	--版号服 暂时屏蔽
	--if Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE) >= GlobalConfig.nEnterJailPkValue then
	--	TranRedActorToRedSceen(sysarg,true)
	--else
		Actor.onRelive(sysarg,0)
	--end
	--清除击杀者信息
	ClearKillerData(sysarg)
    --原地复活- 如果场景是禁止穿人 判断原地复活的坐标是否有人，有就随机一格
    local pScene= Actor.getScenePtr(sysarg)
    local pos_x = Actor.getIntProperty(sysarg,PROP_ENTITY_POSX)
    local pos_y = Actor.getIntProperty(sysarg,PROP_ENTITY_POSY)
    local bHandle = Fuben.getSceneHandleById(Actor.getSceneId(sysarg) ,0)
    if Fuben.hasMapAreaAttri(pScene, pos_x, pos_y, aaNotCrossMan) then
        if Fuben.PointHasActor(sysarg,pScene,pos_x,pos_y) then
            local nIndex = 0
            while true do
                nIndex = nIndex + 1
                local x = pos_x + math.random(-10,10)
                local y = pos_y + math.random(-10,10)
                if nIndex >= 100 then break end
                if Fuben.onCanMove(bHandle,x,y) then
                    if not Fuben.PointHasActor(sysarg,pScene,x,y) then
                        System.telportScene(sysarg, Actor.getSceneId(sysarg), x, y)
                        break
                    end
                end 
            end
        end
        

    end
end

--检测复活消耗 原地复活类型 1复活石复活 2元宝复活 3 VIP每日限定免费复活
function CheckReliveFunc(sysarg, nType)
    --激情行会
    if Actor.getSceneId(sysarg) == JiQingGuildCfg.MapID then
        GoReliveFunc(sysarg, nType)
        --加十秒无敌buff
        Actor.addBuffById(sysarg,JiQingGuildCfg.WuDiBuffID)
        return
    end
    --激情大本营
    if Actor.getSceneId(sysarg) == ArdourCampCfg.mapid then
        GoReliveFunc(sysarg, 0)
        --加十秒无敌buff
        Actor.addBuffById(sysarg,ArdourCampCfg.wudibuffid)
        return
    end
	--print("CheckReliveFunc")
	--print(nType)
	local nType = tonumber(nType)
	if Actor.getIntProperty(sysarg,PROP_CREATURE_HP) == 0 then 
		if Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) > ReliveConfig.limitLevel then 
			if nType == 1 then
				if Actor.getItemCount(sysarg,ReliveConfig.item.id,-1,-1) < ReliveConfig.item.count
				or Actor.removeItem(sysarg,ReliveConfig.item.id,ReliveConfig.item.count,-1,-1,-1,Lang.LogTips.l00020, 34) < ReliveConfig.item.count then
					--OpenReliveDialog(sysarg)
					Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00032,Lang.ScriptTips.x00068.."/buyResurrecStone",Lang.ScriptTips.x00069.."/cancelFunc",nil)
					return
				end
			elseif nType == 2 then
				if (Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO ) < ReliveConfig.yuanbao)
				or Actor.changeMoney(sysarg, 3, -ReliveConfig.yuanbao, GameLog.clEquipInlayMoney, Lang.LogTips.l00021)	== false then 
					local nLiveTime = Actor.getReliveTimeOut(sysarg)
					OpenReliveDialog(sysarg, nLiveTime)
					return 
				end
			end
		end
		
		GoReliveFunc(sysarg, nType)
	end
end

--使用复活石 原地复活按钮
function UseItemRelive(sysarg)
	--print("UseItemRelive")
	local liveTime = Actor.getReliveTimeOut(sysarg)
	----print("liveTime:"..liveTime)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level <= ReliveConfig.limitLevel then 
		GoReliveFunc(sysarg, 3)
		return
	end	
	if Actor.getItemCount(sysarg,ReliveConfig.item.id,-1,-1) < ReliveConfig.item.count then   --itemid为复活石的ID
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00003,ttTipmsgWindow)
		Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00032,Lang.ScriptTips.x00068.."/buyResurrecStone",Lang.ScriptTips.x00069.."/cancelFunc",nil)
		return 
	else
		CheckReliveFunc(sysarg, 1)
		--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00033,Lang.ScriptTips.x00068.."/CheckReliveFunc,1",Lang.ScriptTips.x00069.."/cancelFunc",nil)
	end
end

--使用金钱 原地复活按钮
function UseMoneyRelive(sysarg)
	--print("UseMoneyRelive")
	local liveTime = Actor.getReliveTimeOut(sysarg)
	----print("liveTime:"..liveTime)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	--信春哥等级
	if level <= ReliveConfig.limitLevel then 
		GoReliveFunc(sysarg, 3)
		return
	end	
	
	if (Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO ) < ReliveConfig.yuanbao) then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00160,ttTipmsgWindow)
		local nLiveTime = Actor.getReliveTimeOut(sysarg)
		OpenReliveDialogNotCalc(sysarg, nLiveTime)
		return 
	else 
		CheckReliveFunc(sysarg, 2)
		--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00033,Lang.ScriptTips.x00068.."/CheckReliveFunc,2",Lang.ScriptTips.x00069.."/cancelFunc",nil)
	end
end

------------------------------原地复活--------------------------------------
function OnPlaceRelive(sysarg)
   if Actor.getSceneId(sysarg) == ArdourCampCfg.mapid then
        GoReliveFunc(sysarg, nType)
        --加十秒无敌buff
        Actor.addBuffById(sysarg,JiQingGuildCfg.WuDiBuffID)
        return
   end
	if Actor.hasMapAreaAttri(sysarg, aaNotHereRelive) then		--要判断是否禁止原地复活
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00026, ttTipmsgWindow)
		local nLiveTime = Actor.getReliveTimeOut(sysarg)
		OpenReliveDialogNotCalc(sysarg, nLiveTime)
		return
	end
	--print("OnPlaceRelive")
	local liveTime = Actor.getReliveTimeOut(sysarg)
	----print("liveTime:"..liveTime)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level <= ReliveConfig.limitLevel then 
		GoReliveFunc(sysarg, 4)
		return
	end	
	
	local nIsFree = false
	local nVipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
	local var = Actor.getStaticVar(sysarg)
	local nMaxFreeRelive = 0
	
	if nVipLevel > 0 then
		local reliveCount = VipPrivilegesCfg[nVipLevel].relive; 
		if not reliveCount then return end
		if not var.days.VipFreeRelive then
			var.days.VipFreeRelive = 0
		end
		
		if var.days.VipFreeRelive < reliveCount then
			nIsFree = true
			nMaxFreeRelive = reliveCount
		end
	end
	
	if nIsFree == false then 	
		if Actor.getItemCount(sysarg,ReliveConfig.item.id,-1,-1) < ReliveConfig.item.count 
		and (Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO ) < ReliveConfig.yuanbao) then   --itemid为复活石的ID
			local itemName = Item.getItemName(ReliveConfig.item.id)
			local tips = string.format(Lang.ScriptTips.mt00024, itemName, ReliveConfig.yuanbao)
			Actor.sendTipmsg(sysarg,tips,ttTipmsgWindow)
			cancelFunc(sysarg)
			
			--local tips = string.format("您的背包没有%s或者%d元宝，是否充值？", itemName, ReliveConfig.yuanbao)
			--Actor.messageBox(sysarg,0,0,tips,"充值".."/buyResurrecStone",Lang.ScriptTips.x00069.."/cancelFunc",nil)
			return 
		else
			if Actor.getItemCount(sysarg,ReliveConfig.item.id,-1,-1,-1) >= ReliveConfig.item.count then
				CheckReliveFunc(sysarg, 1)
			else
				CheckReliveFunc(sysarg, 2)
			end
			--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00033,Lang.ScriptTips.x00068.."/CheckReliveFunc,1",Lang.ScriptTips.x00069.."/cancelFunc",nil)
		end
	else
		var.days.VipFreeRelive = var.days.VipFreeRelive + 1
		CheckReliveFunc(sysarg,3)
		local npack = DataPack.allocPacket(sysarg,139,122)  --申请一个数据包
		if (npack == nil) then return end
		DataPack.writeByte(npack, nMaxFreeRelive-var.days.VipFreeRelive)
		DataPack.flush(npack)
        System.sendCommonLog(LogIds.VipReliveCount,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nMaxFreeRelive-var.days.VipFreeRelive)
	end

	local npack = DataPack.allocPacket(sysarg,139,105)  --申请一个数据包
	if (npack == nil) then return end
	DataPack.writeByte(npack,1)
	DataPack.flush(npack)
end
--------------------------------------------------------------------------------------------------

------------------------------------安全复活-----------------------------------------------------

--回城复活
function backResurrection(sysarg)
	Actor.returnCity(sysarg)
	if Actor.getIntProperty(sysarg,PROP_CREATURE_HP) == 0 then 
		------------------------------------------------------------
		--掉落操作
		PkDropFunc(sysarg)
		
		--清除击杀者信息
		ClearKillerData(sysarg)
		----------------------------------------------------------
		
		--[[
		local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
		Actor.changeHp(sysarg,maxhp*ReliveConfig.safeRate)
		--local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
		local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
		Actor.changeMp(sysarg,maxmp*ReliveConfig.safeRate)
		-- Actor.changeHp(sysarg,1)
		-- local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
		-- Actor.changeMp(sysarg,-400)
		--]]
		--改为满血满蓝满内功
		local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
		Actor.changeHp(sysarg,maxhp)
		local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
		Actor.changeMp(sysarg,maxmp)
		local maxinner = Actor.getUIntProperty(sysarg,PROP_ACTOR_MAX_INNER)
		Actor.setUIntProperty(sysarg,PROP_ACTOR_INNER,maxinner)
	end
	local buff = ReliveConfig.protectBuff
	if buff.type > 0 then
		Actor.addBuff(sysarg,buff.type,1,1,1,buff.time,Lang.ScriptTips.b00009)
	end
end
--角色复活事件
EventCallDispatcher.OnPlayerRelive = function(sysarg,arg)
    local nAutoRelive = arg[1] --1为自动复活 0为手动复活
    --print("复活类型:"..nAutoRelive)
end
--安全复活-----------------------  
function safeResurrection(sysarg,arg)
	
    if arg == nil then arg = {} end
    nReliveType = arg[1]
    if nReliveType == nil then nReliveType = 2 end
    local nAutoRelive = arg[2]
    local nTeamId = arg[3]
    local nReliveType = arg[4]
  
    if nAutoRelive == nil then nAutoRelive = 0 end
	if Actor.getIntProperty(sysarg,PROP_CREATURE_HP) == 0 then
     --激情大本营原地复活
        if Actor.getSceneId(sysarg) == ArdourCampCfg.mapid then
            GoReliveFunc(sysarg, nType)
            --加十秒无敌buff
            Actor.addBuffById(sysarg,ArdourCampCfg.wudibuffid)
            return
        end
		------------------------------------------------------------
		--掉落操作
		PkDropFunc(sysarg)
		
		----------------------------------------------------------
		--回血回蓝
		--[[
		local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
		Actor.changeHp(sysarg,maxhp*ReliveConfig.safeRate)
		--local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
		local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
		Actor.changeMp(sysarg,maxmp*ReliveConfig.safeRate)
		--]]
		--改为满血满蓝满内功
        --激情闭关恢复百分之五十
        local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
        local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
        if Actor.getSceneId(sysarg) == 110 then
            maxhp = maxhp * 0.1
            maxmp = maxmp * 0.1
        end
        local maxinner = Actor.getUIntProperty(sysarg,PROP_ACTOR_MAX_INNER)
        --远古战场安全复活10%血 10%蓝 10%内功
		if System.isCrossServer()==true and Actor.getEnterCrossType(sysarg) == 0 then
            maxhp = maxhp * 0.1
            maxmp = maxmp * 0.1
            maxinner = maxinner * 0.1
        end
		Actor.changeHp(sysarg,maxhp)
		
		Actor.changeMp(sysarg,maxmp)
		
		Actor.setUIntProperty(sysarg,PROP_ACTOR_INNER,maxinner)
        if nAutoRelive == 1 then
        		local var = Actor.getStaticVar(sysarg)
            local nVipFreeCount = 0
            if var.days ~= nil and  var.days.VipFreeRelive ~= nil then
                nVipFreeCount = var.days.VipFreeRelive
            end

            System.sendCommonLog(LogIds.ReliveLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),tonumber(nReliveType),nVipFreeCount)
        end

		--复活
		local boNotCheckRedName = false   --默认处理红名复活
		local zyId = Actor.getIntProperty( sysarg, PROP_ACTOR_ZY )
		local sceneId = Actor.getSceneId(sysarg)
		if zyId ~= 0 or sceneId == StdActivityCfg.JuntuanZhan.sceenId or sceneId == StdActivityCfg.JiQingBiGuang.sceneid then -- 在阵营战中 或 军团战 或者激情闭关
			boNotCheckRedName = true
		end
		for i=1,10 do--在神威狱中
			if sceneId == StdActivityCfg.ShenWeiYu.scenes[i] then 
				boNotCheckRedName =true
				break
			end
		end
	
		boNotCheckRedName =true	--现在没有红名村了，不用检查
		
		if not SendToFirstScene(sysarg) then
			if boNotCheckRedName == false then
				local oldSceneId = Actor.getSceneId(sysarg)
				if Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE) >= GlobalConfig.nEnterJailPkValue then
					
					--if oldSceneId == StdActivityCfg.WuLinZhengBa.lowSceenId or oldSceneId == 171 then
					--	OnAddPet(sysarg)
					--end
					
					local RedNameC = {id = 3, x = 126, y = 109};	--土城红名村坐标
					System.telportScene(sysarg, RedNameC.id, RedNameC.x, RedNameC.y)
				else  
					--if oldSceneId == StdActivityCfg.WuLinZhengBa.lowSceenId or oldSceneId == 171 then
					--	OnAddPet(sysarg)
					--end
					Actor.relive(sysarg,nAutoRelive)
				end
				if oldSceneId == 142 then
					Actor.updateActorName(sysarg)
				end
			else
                local bEnter = false
				Actor.onRelive(sysarg,0)
				local zyId = Actor.getIntProperty( sysarg, PROP_ACTOR_ZY )
				if zyId ~= 0 then -- 在阵营战中
					local zyzCfg = StdActivityCfg.ZhenYingZhan
					local x,y = -1,-1
					if zyId == 1 then
						x = math.random(zyzCfg.ACampPos[1],zyzCfg.ACampPos[2])
						y = math.random(zyzCfg.ACampPos[3],zyzCfg.ACampPos[4])
					elseif zyId == 2 then
						x = math.random(zyzCfg.BCampPos[1],zyzCfg.BCampPos[2])
						y = math.random(zyzCfg.BCampPos[3],zyzCfg.BCampPos[4])
					end
					Actor.enterScene(sysarg, zyzCfg.sceneId, x, y)	
                    bEnter = true
                    
				elseif sceneId == StdActivityCfg.JuntuanZhan.sceenId then -- 在军团战
					local legionId = Actor.getLegionId(sysarg)
					local pos = StdActivityCfg.JuntuanZhan.initPosList[legionId]
					Actor.enterScene(sysarg, StdActivityCfg.JuntuanZhan.sceenId, pos[1], pos[2])
                     bEnter = true
                    
				elseif sceneId == StdActivityCfg.JiQingBiGuang.sceneid then --在激情闭关中
					Actor.enterScene(sysarg, StdActivityCfg.JiQingBiGuang.sceneid, 31, 67)
                     bEnter = true
					 
				elseif sceneId == 342 then--奔跑第4层
                    Actor.enterScene(sysarg, 83, 155,137)
                    bEnter = true
				--elseif System.isCrossServer()==true then  --在跨服服务器中
				--	Actor.enterScene(sysarg, sceneId, 134,119)
                --    bEnter = true
                elseif sceneId == 563 then --3v3竞技
                    local Pos= {
                                {x =46,y = 218,},
                                {x = 206,y = 43},}    
                    bEnter = true
                    if nTeamId == nil then nTeamId = 0 end
                    nTeamId = tonumber(nTeamId)
                    Actor.enterScene(sysarg, sceneId, Pos[nTeamId + 1].x,Pos[nTeamId + 1].y)
                elseif sceneId == 670 then --个人竞技
                     local Pos= {
                                {x =44,y = 122,},
                                {x = 116,y = 31},}    
                    bEnter = true
                    if nTeamId == nil then nTeamId = 0 end
                    nTeamId = tonumber(nTeamId)
                    Actor.enterScene(sysarg, sceneId, Pos[nTeamId + 1].x,Pos[nTeamId + 1].y)
				elseif sceneId==564 then --在生肖地图中,就地复活
					if  Actor.hasMapAreaAttri(sysarg,80) then --如果有不爆装备的地图属性，就是在小房间内，否则在大厅
						local x = Actor.getIntProperty(sysarg, PROP_ENTITY_POSX)
						local y = Actor.getIntProperty(sysarg, PROP_ENTITY_POSY)
						Actor.enterScene(sysarg, 564,x,y)		
						bEnter = true						
					end
				else
					for i=1,10 do--在神威狱中
						if sceneId == StdActivityCfg.ShenWeiYu.scenes[i] then 
							Actor.enterScene(sysarg, 83 ,StdActivityCfg.ShenWeiYu.RwData[3], StdActivityCfg.ShenWeiYu.RwData[4])--沙漠土城NPC处复活
                            bEnter = true
							break
						end
					end 
                     
				end
                if bEnter == false then
                    Actor.returnCity(sysarg)
                end
			end
		end
		--加无敌罩
		local buff = ReliveConfig.protectBuff
		if buff.type > 0 then
			Actor.addBuff(sysarg,buff.type,1,1,1,buff.time,Lang.ScriptTips.b00009)
		end
		--清除复活倒计时
		Actor.clearReliveTimeOut(sysarg)
		
		------------------------------------------------------
		--阵营运镖 被劫
		--LootCampDart(sysarg)

		--帮派运镖 被劫
		--LootGuildDart(sysarg)

		--清除击杀者信息
		ClearKillerData(sysarg)

		--如果在行会副本处理
		--OnGuildFubenOp(sysarg)
		
		local npack = DataPack.allocPacket(sysarg,139,105)  --申请一个数据包
		if (npack == nil) then return end
		DataPack.writeByte(npack,1)
		DataPack.flush(npack)
		-------------------------------------------------------
	end	
end

---------------------------------------------------------------------------

--购买复活石
function buyResurrecStone(sysarg)
	local liveTime = Actor.getReliveTimeOut(sysarg)
	--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00031,Lang.ScriptTips.x00066.."/UseItemRelive",Lang.ScriptTips.x00067.."/safeResurrection",nil,liveTime*1000)
	local nLiveTime = Actor.getReliveTimeOut(sysarg)
	OpenReliveDialogNotCalc(sysarg, nLiveTime)
	Actor.openDialogs(sysarg,diBuyAnItem,tostring(ReliveConfig.item.id))
end

--取消购买复活石 按钮的函数
function cancelFunc(sysarg)
 	local liveTime = Actor.getReliveTimeOut(sysarg)
	local nLiveTime = Actor.getReliveTimeOut(sysarg)
	OpenReliveDialogNotCalc(sysarg, nLiveTime)
	--Actor.messageBox(sysarg,0,0,Lang.ScriptTips.x00031,Lang.ScriptTips.x00066.."/UseItemRelive",Lang.ScriptTips.x00067.."/safeResurrection",nil,liveTime*1000)
end


--清除击杀者信息
function ClearKillerData(sysarg)
	--print("ClearKillerData")
	local svar = Actor.getStaticVar(sysarg)
	local data = svar.killerData	--被击杀者记录被杀信息
	if not data then 
		svar.killerData = {}
		data = svar.killerData
	end
	data[1] = nil	--击杀者等级
	data[2] = nil	--击杀者阵营ID
	data[3] = nil --击杀者名字
	data[6] = nil	--击杀者类型
	data[7] = nil
	data[8] = nil
end

--掉落操作
function PkDropFunc(sysarg)
	local svar = Actor.getStaticVar(sysarg)	
	local data = svar.killerData	--被击杀信息
	if(data == nil) then return end
	local killerName	 = data[3]	--击杀者名字
	local dropExpCount = data[4]	--每日PK经验掉落次数
	local killerType = data[6]
	local nDropZhanHun = data[7]
	local nDropExp = data[8]
	--print(nDropZhanHun)
	if killerType == 0 then
		if nDropZhanHun and nDropZhanHun > 0 then
			Actor.giveAward(sysarg, 10,0, -nDropZhanHun, 0, 0, 1, 0, 205, "OnKillDropZhanHun")
		end
		--[[	--屏蔽PK经验掉落、获得功能
		if nDropExp and nDropExp > 0 then
			local pkExpConfig = PkConfig.pkExpParam
			local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
			--掉落概率
			local percent = pkExpConfig.dropPercent[level - pkExpConfig.levelStart + 1]
			--print("percent:"..percent)
			if percent and percent > 0 then 
				--判断概率
				local rand = math.random(1000)
				--print("rand:"..rand)
				if rand <= percent then 
					--Actor.giveAward(sysarg, 10, 0,-nDropExp, 0, 0, 1, 0, 205, "OnKillDropZhanHun")
					if Actor.giveAward(sysarg, 2, 0,-nDropExp, 0, 0, 1, 0, 205, "OnKillDropExp") == true then
						if not dropExpCount then dropExpCount = 0 end
						data[4] = dropExpCount + 1
						Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.pk00001, killerName, nDropExp), ttTipmsgWindow)
						
						--如果被杀者有掉落经验 则击杀者获得经验
						if nDropExp > 0 then
							OnKillGetExp(sysarg, nDropExp)
						end
						
					end
				end
			end
		end
		--]]
	end
end

--[[
--在行会副本处理
function OnGuildFubenOp(sysarg)
	local fhadle = Actor.getGuildFuBenHandle(sysarg)

	if fhadle <= 0 then
		return
	end

	if fhadle > 0 then
		if Actor.getFubenHandle(sysarg) ~= fhadle then
			return 
		end
	end
	
	local ranking = Ranking.getRanking(ToxicRankConfig.dayRankName)
	
	local mPoint = 0

	local nGuildId = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
	local nTimes = System.getToxicFreshTimes(nGuildId)

	if ranking then		
		local nItem = Ranking.getItemPtrFromId(ranking,nGuildId)

		if nItem then
			mPoint = Ranking.getPoint(nItem)
		end
	end

	local bFb = Actor.getFubenPrt(sysarg)
	local nCount = Fuben.getKillMonsterCount(bFb)

	local nTime = Fuben.getFbTime(bFb)
	Actor.initActivityWind(sysarg,Lang.Activity.w00102,nTime,Lang.Activity.w00111,Lang.Activity.w00103,nCount,Lang.Activity.w00104,nTimes)

end
--]]