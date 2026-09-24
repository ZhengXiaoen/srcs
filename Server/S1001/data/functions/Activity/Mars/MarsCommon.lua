--[[File:MarsCommon.lua]]

--#include "data\config\activityconfig\Mars\MarsCfg.lua" once

-- 显示我的战神令数量的字符串
function GetGameGirdNum(sysarg)
	local strDlg = "";
	local actorVar = Actor.getStaticVar(sysarg);
	actorVar.GameGird = actorVar.GameGird or 0; --  战神令数量
	strDlg = string.format(Lang.Activity.lfg0011, actorVar.GameGird);
	strDlg = string.format("%s\\<#BL%s/@BuyGameGirdMenu>", strDlg, Lang.Activity.lfg0001);
	return strDlg;
end


-- 兑换灵符
function BuyGameGirdMenu(sysarg)
	local strDlg = "";
	for k, v in pairs(MarsCfg.GameGird or {}) do
		local str = string.format(Lang.Activity.lfg0005, v.yb, v.nCount);
		strDlg = string.format("%s\\<#BL%s/@BuyGameGird,%d>",strDlg, str, k);
	end
	return strDlg .. Lang.ScriptTips.back001;
end

-- 购买灵符
function BuyGameGird(sysarg, id)
	id = tonumber(id);
	local v = MarsCfg.GameGird[id];
	local nYb =  Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO);
	if nYb < v.yb then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00205,ttFlyTip )
		return;
	end
	local itemName = Lang.Activity.lfg0006;
	if not Actor.changeMoney(sysarg, 3, -v.yb, GameLog.clUseProabilityItem, itemName) then -- print("扣取元宝" .. needYb .. "成功");
		local msg = string.format(Lang.ScriptTips.x00207, v.yb, itemName);
		Actor.sendTipmsg( sysarg, msg, ttFlyTip );
		return false;
	end
	-- 
	local actorVar = Actor.getStaticVar(sysarg);
	actorVar.GameGird = actorVar.GameGird or 0; -- 
	actorVar.GameGird = actorVar.GameGird + v.nCount; -- 得到战神令
	local msg = string.format(Lang.Activity.lfg0007, v.nCount);
	Actor.sendTipmsg( sysarg, msg, ttFlyTip );	
end

-- 退出副本 菜单
function GetExitFubenOption(sysarg)
	local strDlg = "";
	strDlg = string.format("%s\\<#BL%s/@onExitFubenFunc>", strDlg, Lang.Activity.lfg0012);
	return strDlg;
end