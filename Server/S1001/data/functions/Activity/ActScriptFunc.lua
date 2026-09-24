--#include "data\config\activityconfig\ExpPig.lua" once
--#include "data\config\activityconfig\WesternDesert.lua" once
--#include "data\config\activityconfig\fountain.lua" once
--#include "data\functions\ExpandFunc\ActivityTipsFunc.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\HuoDong\MoneyActivity.lua" once	--掉落金钱 2016/12/26 zer 移动更新
--#include "data\envir\FubenConfig\LingShouXianRui.lua" once
--#include "data\config\activityconfig\Prestige\PrestigeConfig.lua" once
----#include "data\config\activity\StdActivityCfg.lua" once

ActivityFunc = {}

ActivityFunc.main = function()
	local dlgStr = "No Activity Function Name";
	return dlgStr;
end

--活动开启面板内容

function ActivitySameCondition(sysarg)
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return false
	end
	
	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false
	end

	if Actor.checkActorLevel(sysarg, 60, 0) ~= true then
		local msg = string.format(Lang.ScriptTips.zf572,60)
		Actor.sendTipmsg(sysarg,msg, ttFlyTip) 
		return false
	end	
	
	return true
end

--富贵兽献瑞 
function OnEnterFuGuiShou(sysarg,sceneId)

	if not ActivitySameCondition(sysarg) then
		return
	end
	
	local posTab = FuGuiShouConfig.nPos
	local nRandamPos = math.random(table.getn(posTab))
	Actor.enterScene(sysarg,sceneId,posTab[nRandamPos][1]+math.random(-5,5),posTab[nRandamPos][2]+math.random(-7,7))
end

---膜拜城主雕像
function OnWorship(sysarg,sceneId)
	
	if ActivitySameCondition(sysarg) == false then
		return
	end
	
	local enterPos = {162,178}
	Actor.enterScene(sysarg,tonumber(sceneId),enterPos[1]+math.random(-8,8),enterPos[2]+math.random(-10,10))
end

--武林争霸报名
function WuLinSignUp(sysarg)

	if not ActivitySameCondition(sysarg) then
		return
	end
	
	local nHour,nMin,nSec = System.getTime()
	local nHour,nMin,nSec = System.getTime()
	if nHour == 12 and nMin < 40 then
		return
	elseif nHour == 13 and nMin >= 50 then
		return
	end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.days.WuLinZhengBaSignUpFlag then
		var.days.WuLinZhengBaSignUpFlag = 1
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf135, ttFlyTip);
	else
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf133, ttFlyTip);
		return
	end
	
	System.sendCommonLog(1085,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg))
end

--武林争霸入场
function TakePartToJuniorWuLin( sysarg,sceneId )

	if not ActivitySameCondition(sysarg) then
		return
	end

	local nHour,nMin,nSec = System.getTime()
	if nHour == 12 and nMin < 50 then
		return
	elseif nHour == 13 and nMin > 20 then
		return
	end

	local svar = System.getDyanmicVar()
	if svar.WuLinZhengBaStartFlag == nil then		--开始武林争霸的标志
		svar.WuLinZhengBaStartFlag = 0
	end

	if svar.WuLinZhengBaStartFlag == 0 then			--不在活动时间内
		Actor.sendTipmsg(sysarg, Lang.Activity.w00004, ttFlyTip)
		return
	end

	if svar.WuLinEnterFlag and svar.WuLinEnterFlag == 1 then			--活动开始已过10分钟不能再进入
		Actor.sendTipmsg(sysarg, Lang.Activity.w00005, ttFlyTip)
		return
	end

	local var = Actor.getStaticVar(sysarg)
	if not var.days.WuLinZhengBaSignUpFlag then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf134, ttFlyTip);	
		return
	elseif var.days.WuLinZhengBaSignUpFlag == 2 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf136, ttFlyTip);	
		return
	elseif var.days.WuLinZhengBaSignUpFlag == 3 then 
		return 
	end
	
	if var.days.WuLinZhengBaSignUpFlag == 1 then
		local cfg = StdActivity[6];
		local nPosX = math.random(cfg.wMapX[1], cfg.wMapX[2])
		local nPosY = math.random(cfg.wMapY[1], cfg.wMapY[2])
		local nHandle = Fuben.getSceneHandleById(cfg.lowSceenId, 0)
		local bResult = Actor.enterFuBen(sysarg,nHandle,StdActivityCfg.WuLinZhengBa.lowSceenId,nPosX,nPosY)
		if bResult then
			EnterFightDelPet(sysarg)
		end
	end
end

--黄金满屋
function OnEnterPrestige(sysarg,sceneId)

	if ActivitySameCondition(sysarg) == false then
		return
	end

	local config = PrestigeActivityConfig
	local posTab = config.nPos
	local nRandam = config.nRandam
	local nPosX = math.random(posTab[1],posTab[2])
	local nPosY = math.random(posTab[3],posTab[4])
	local rPosX = nPosX + math.random(1,nRandam)
	local rPosY = nPosY + math.random(1,nRandam)
	
	Actor.enterScene(sysarg,sceneId,rPosX,rPosY)
end

--黑龙军团来袭
function OnEnterMonsterRaid(sysarg,sceneId)

	if not ActivitySameCondition(sysarg) then
		return
	end
	
	local enterPos = {126,109}
	Actor.enterScene(sysarg,sceneId,enterPos[1]+math.random(-14,14),enterPos[2]+math.random(-12,12))
end

--黑龙魔君入侵
function onEnterTreasureBoss(sysarg,sceneId)	
	
	if ActivitySameCondition(sysarg) == false then
		return
	end
	
	local enterPos = {57,51}
	Actor.enterScene(sysarg,sceneId,enterPos[1]+math.random(-8,8),enterPos[2]+math.random(-7,7))
end

--王城危机
function OnEnterMonsterSiege(sysarg,sceneId)
	
	if ActivitySameCondition(sysarg) == false then
		return
	end
	
	local enterPos = {163,175}
	Actor.enterScene(sysarg,sceneId,enterPos[1]+math.random(-8,8),enterPos[2]+math.random(-10,10))
end

--行会争霸
function OnEnterGuildCompete(sysarg,sceneId)
	
	sceneId = tonumber(sceneId)
	local nCurGuild = Actor.getIntProperty(sysarg, PROP_ACTOR_GUILD_ID)	
	if nCurGuild <= 0 then
		Actor.sendTipmsg(sysarg, Lang.Activity.w00119, ttFlyTip)
		return
	end
	
	if ActivitySameCondition(sysarg) == false then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.GuildCompeteFlag then
		Actor.sendTipmsg(sysarg, Lang.Activity.w00116, ttFlyTip)
		return
	end

	local sVar = System.getStaticVar()
	-- 1: 开启活动，可以进入  2：已过了进入时间
	if not sVar.EnterGuildCompete then
		Actor.sendTipmsg(sysarg, Lang.Activity.w00118, ttFlyTip)
		return
	elseif sVar.EnterGuildCompete == 2 then
		Actor.sendTipmsg(sysarg, Lang.Activity.w00117, ttFlyTip)
		return
	end
	
	if not Actor.checkActorLevel(sysarg,60) then
		Actor.sendTipmsg(sysarg, string.format(Lang.Activity.w00122,60), ttFlyTip)
		return
	end

	local enterPos = {48,48}
	Actor.enterScene(sysarg,sceneId,enterPos[1]+math.random(-10,10),enterPos[2]+math.random(-15,15))
	local var = Actor.getStaticVar(sysarg)
	if not var.days.GuildCompeteFlag then
		var.days.GuildCompeteFlag = 1
	end
	
	Actor.updateActorName(sysarg)
end

--佛光普照
function onEnterFoGuang(sysarg,sceneId)	
	
	if not ActivitySameCondition(sysarg) then
		return
	end
	
	sceneId = tonumber(sceneId)
	local enterPos = {{40,100},{20,85}}
	Actor.enterScene(sysarg,sceneId,math.random(unpack(enterPos[1])),math.random(unpack(enterPos[2])))
	InitActivityWin(sysarg,sceneId)
end


--泉水阵地
function OnEnterFountain(sysarg,sceneId)	
	
	if ActivitySameCondition(sysarg) == false then
		return
	end
	
	sceneId = tonumber(sceneId)
	local enterPos = {{40,100},{20,85}}
	Actor.enterScene(sysarg,sceneId,math.random(unpack(enterPos[1])),math.random(unpack(enterPos[2])))
	InitActivityWin(sysarg,sceneId)
end