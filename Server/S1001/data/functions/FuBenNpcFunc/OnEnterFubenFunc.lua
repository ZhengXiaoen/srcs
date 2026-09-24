--lua script

--进入副本的个性化处理
--#include "data\envir\FubenBossSelect.lua" once
--#include "data\functions\Systems\PaTaSystem\PaTaCommon.lua" once
--#include "data\config\activityconfig\Festival\Demons.lua" once
--#include "data\config\activityconfig\ExpPig.lua" once


function OnEnterPaTaFb( sysarg, Fbhandle, fubenId)
	SendPaTaFubenPack(sysarg, SendOpt_CloseUI)
	local myJobId = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local fubenBossCfg = FubenBossSelect[fubenId]
	if fubenBossCfg then
		local bossCfg = fubenBossCfg[myJobId]
		local sceneId = Actor.getSceneId(sysarg)
		local hScene = Fuben.getSceneHandleById( sceneId, Fbhandle)
		for k, boss in ipairs(bossCfg or {}) do
			local monPrt = Fuben.createMonster( hScene, boss.entityid, boss.x, boss.y,0 )
		end
	end	
end

function OnEnterDrogonFb( sysarg, fbHandle, fubenId )
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben029, ttFlyTip)
end

function OnEnterHellFb( sysarg, fbHandle, fubenId )
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben030, ttFlyTip)
end

function OnEnterTryBattleFb( sysarg, fbHandle, fubenId )
	local sysDVar = System.getDyanmicVar()
	if sysDVar.TryBattleFlag then
		sysDVar.TryBattleFlag = nil
		local NpcPtr = Fuben.getNpcPtrFromAllScenes(Lang.EntityName.n00164)
		Actor.setEntityVisibleFlag( NpcPtr, false)
		Actor.unregScriptCallback(NpcPtr, "OnTryBattleFbOver")
		local teamLeaderName = Actor.getName(sysarg)
		local teamId = Actor.getTeamId(sysarg)
		if teamId > 0 then
			local leaderPtr = TeamFun.getTeamCaptain(teamId)
			if leaderPtr and leaderPtr ~= sysarg then
				teamLeaderName = Actor.getName(leaderPtr)
			end
		end
		local noticeStr = string.format(Lang.ScriptTips.meeting008, teamLeaderName)
		System.broadcastTipmsg(noticeStr, ttScreenCenter + ttChatWindow)
	end
end

function OnEnterDemonsFb(sysarg, fbHandle, fubenId)
	for sceneId, pos in pairs(DemonsConfig.BossDiedOpenTel) do
		local hFbScene = Fuben.getSceneHandleById(sceneId, fbHandle)
		Fuben.setTelportVisible(hFbScene, pos[1], pos[2], false)
	end
end

function OnExitFubenFunc(sysarg, fubenId )
	local cfg = OnExitCopyMap[fubenId]
	if cfg then
		cfg.OnExitFbFunc(sysarg, fubenId)
	end
end

-- 进入封印结界副本
function OnEnterFengYinFb(sysarg, fbHandle, fubenId)

	local var = Actor.getStaticVar(sysarg)
	
	if var.AddUpExp ~= nil then
		var.AddUpExp = nil --清除
	end
end

-- 退出封印结界副本
function OnExitFengYinFb(sysarg, fubenId)
	
	local var = Actor.getStaticVar(sysarg)
	
	--local itemId = 566
	--local itemCount = Actor.getItemCount(sysarg, itemId)
	--if itemCount > 0 then
		--Actor.removeItem(sysarg, itemId, itemCount)
	--end

	if var.AddUpExp ~= nil then
		local addUpExp = math.floor(tonumber(var.AddUpExp))	
		if addUpExp > 0 then
			Actor.addExp(sysarg, addUpExp, GameLog.clCumulativeExp, 0,0,true)		
			
			--全服公告
			local name = Actor.getName(sysarg)
			local msg = string.format(Lang.ScriptTips.f00061, name, addUpExp)
			System.broadcastTipmsg(msg, ttScreenCenter)
		end
		
		var.AddUpExp = nil
	end
		
	if var.FbItemflag ~= nil then
		var.FbItemflag = nil
	end

	if var.buyAstNum then
		var.buyAstNum = nil
	end
	--玩家退出副本，清楚怪物
	--local hfb = getFubenHandle(sysarg)
	--Fuben.clearAllMonster(hfb)
end

-- 进入灵兽献瑞副本
function OnEnterLingShouXianRuiFb(sysarg, fbHandle, fubenId)
end

-- 退出灵兽献瑞副本
function OnExitLingShouXianRuiFb(sysarg, fubenId)
end

-----------从副本总管进入的副本退出时
function OnExitFuBenZongGuanFb(sysarg,fubenId)
	local var = Actor.getStaticVar(sysarg)
	if var.fuBenAwardFlag then
		var.fuBenAwardFlag = nil
	end
end

-- 退出单人经验副本
function OnExitDanRenJingYanFB(sysarg,FBID)

end
-- 退出单人BOSS副本
function OnExitDanRenBOSSFB(sysarg,FBID)

end

-- 退出富贵兽副本
function OnExitFuBenFuGuiShouFb(sysarg,FBID)
	-- 删除富贵兽双倍经验BUFF(如果有)
	Actor.delBuff(sysarg, FuGuiShouFubenCfg.buffType, FuGuiShouFubenCfg.buffGroup)
	-- 启用多倍经验卷Buff
	Actor.EnableMultiExpRollerBuff(sysarg, true)
end

OnEnterCopyMap = {
	[5] =  { OnEnterFubenFunc = OnEnterDrogonFb},
	[12] = { OnEnterFubenFunc = OnEnterFengYinFb},
	[14] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[15] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[16] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[17] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[18] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[19] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[20] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[21] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[22] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[23] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[24] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[25] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[26] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[27] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[28] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[29] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[30] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[31] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[34] = { OnEnterFubenFunc = OnEnterTryBattleFb },
	[40] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[41] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[42] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[43] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[44] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[45] = { OnEnterFubenFunc = OnEnterPaTaFb },
	[67] = { OnEnterFubenFunc = OnEnterLingShouXianRuiFb },
 }

 OnExitCopyMap = {
	[12] = {OnExitFbFunc = OnExitFengYinFb},
	[1] = {OnExitFbFunc = OnExitDanRenJingYanFB},
	[2] = {OnExitFbFunc = OnExitDanRenBOSSFB},
	[67] = {OnExitFbFunc = OnExitLingShouXianRuiFb},	
	[3] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[4] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[5] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[6] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[7] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[8] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[9] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[10]= {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[100] = {OnExitFbFunc = OnExitFuBenZongGuanFb},
	[107] = {OnExitFbFunc = OnExitFuBenFuGuiShouFb},
 }