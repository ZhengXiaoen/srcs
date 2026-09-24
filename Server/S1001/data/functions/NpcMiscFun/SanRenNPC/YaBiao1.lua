-- 接镖NPC

--#include "data\language\LangCode.txt" once --语言包 
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua"
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\config\activity\StdActivityCfg.lua" once

local t = {}
t.main = function(sysarg)
	local sData = OpenDartDialog(sysarg, nil);
	if not sData then
		return ;
	end
	Actor.openDialogs(sysarg, diDart, sData);
    return "null"
end


function GetNpcYaBiao1() return t end

--[[

-- 购买保险
NpcDialog[222].buyinsurance = function(sysarg)
	local var = Actor.getStaticVar(sysarg);
	local bcHandle = var.bcHandle;
	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00010, ttFlyTip)
		return 
	end
	
	if not var.buybx then
		var.buybx = 1;
	else
		var.buybx = nil;
	end
	return NpcDialog[222].main(sysarg);
end

-- 刷新品质
NpcDialog[222].refleshquality = function(sysarg)
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local var = Actor.getStaticVar(sysarg);
	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00010, ttFlyTip)
		return 
	end
	
	local bcpz = var.bcpz;
	if not bcpz then bcpz = 1; end
	
	local pzxstms = var.days.pzxstms;
	if not pzxstms then pzxstms = 0; end

	if pzxstms >= cfg.maxRefresh then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00007, pzxstms), ttFlyTip);
		return NpcDialog[222].main(sysarg);
	end

	tBiaoche = cfg.tBiaoche;
	if (bcpz + 1) > #tBiaoche then
		local name = string.format("<(%s)%s>", tBiaoche[bcpz].color, tBiaoche[bcpz].monName);
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00008, name), ttFlyTip);
		return NpcDialog[222].main(sysarg);
	end
	
	local tYBL = cfg.tYBL;
	if Actor.removeItem(sysarg, tYBL.id, tYBL.count, -1, -1, -1, "扣除运镖令") ~= tYBL.count then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00004, tYBL.name, tYBL.count), ttFlyTip);
		return NpcDialog[222].main(sysarg);
	end
	
	var.days.pzxstms = pzxstms + 1;
	if math.random(10000) > tBiaoche[bcpz + 1].freshRate then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00003, ttFlyTip);
		return NpcDialog[222].main(sysarg);
	end
	
	var.bcpz = bcpz + 1;
	local name = string.format("<(%s)%s>", tBiaoche[var.bcpz].color, tBiaoche[var.bcpz].monName);
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00002, name), ttFlyTip);
	return NpcDialog[222].main(sysarg);
end

-- 开始护送
NpcDialog[222].startdrat = function(sysarg)
	local cfg = StdActivityCfg.DuoBeiYaSong;
	local var = Actor.getStaticVar(sysarg)

	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bc00010, ttFlyTip)
		return 
	end
	
	local buybx = var.buybx;
	if not buybx then buybx = 0; end
	if buybx == 1 then
		if Actor.changeMoney(sysarg, mtYuanbao, -cfg.insurance, LogIds.ybBuyInsuranceConsume, Lang.LogTips.yb049) == false then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00009, cfg.insurance), ttFlyTip);
			var.buybx = nil;
			return NpcDialog[222].main(sysarg);
		end
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bc00001, cfg.insurance, cfg.tAwardPercent[4]*100), ttFlyTip);
	end
	
	StartDartToDest(sysarg)
	Actor.closeNPCDialog(sysarg)
	Quest_ShuaXin(sysarg);
end
--]]
--------------------------------------------------------------------------------------------------
--[[
--放弃护送
NpcDialog[222].GiveUpApplyDart = function(sysarg)
	return string.format("%s\\<%s/@OnGiveUpDart>\\<%s/@OnCancleGiveUp>", Lang.Activity.g00029,Lang.Activity.g00006, Lang.Activity.g00007)
end

NpcDialog[222].OnGiveUpDart = function(sysarg)
	ResetActorDartInfo(sysarg, false, true)
	Actor.closeNPCDialog(sysarg)
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;
	Quest_ShuaXin(sysarg,5002,nil,d[30],"百草园",d[32],20);
end

NpcDialog[222].OnCancleGiveUp = function(sysarg)
	Actor.closeNPCDialog(sysarg)
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;
	Quest_ShuaXin(sysarg,5002,nil,d[30],"百草园",d[32],20);
end
--]]