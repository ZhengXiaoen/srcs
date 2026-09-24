--[[File:MarsGuidNPC.lua]]
-- 战神闯关指引大使
--#include "data\config\activityconfig\Mars\MarsCfg.lua" once
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "MarsCommon" once

-- 主菜单
function MarsGuidNPC_Main(sysarg)
	local strDlg = "";
	strDlg = GetGameGirdNum(sysarg);
	local fubenId = MarsCfg.EquipMars.FubenId;
	local fubenCfg = FuBen[fubenId]
	local leftTimes = GetEnterFubenTimes( sysarg, fubenId );
	local totalTimes = FubenCountConfig[fubenCfg.groupId];
	strDlg = string.format("%s\\<#BL%s/@EnterEquipMarsMenu>", strDlg, string.format(Lang.Activity.lfg0002, (totalTimes - leftTimes), totalTimes ));
	strDlg = string.format("%s\\<#BL%s/@EnterExpMars>", strDlg, Lang.Activity.lfg0003);
	strDlg = string.format("%s\\<#BL%s/@exit>", strDlg, Lang.Activity.lfg0004);
	
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

-- 进入装备战神闯关
function EnterEquipMarsMenu(sysarg)
	local strDlg = string.format("\\<#BL%s/@EnterEquipMars>", Lang.Activity.lfg0008);	
	return strDlg .. Lang.ScriptTips.back001;	
end

function EnterEquipMars(sysarg)
--[[	
	local actorVar = Actor.getStaticVar(sysarg);
	actorVar.EnterEquipMarsTimes = actorVar.EnterEquipMarsTimes or 0;
	-- 判断当日的
	if actorVar.EnterEquipMarsTimes >= MarsCfg.EquipMars.EnterEquipMarsTimes then
		Actor.sendTipmsg( sysarg, Lang.Activity.lfg0009, ttFlyTip );
		return;
	end
	
	if not checkActorLevel(sysarg, MarsCfg.EquipMars.MinLevel, MarsCfg.EquipMars.Circle)  then
		Actor.sendTipmsg( sysarg, Lang.Activity.lfg0010, ttFlyTip );
		return;
	end
	
	actorVar.EnterEquipMarsTimes = actorVar.EnterEquipMarsTimes + 1;
	--]]
	-- 进入副本
	print("进入装备战神闯关副本");
	readyEnterFB(sysarg, MarsCfg.EquipMars.FubenId);
	-- 在面板显示
	-- 计时
end

-- 进入经验战神闯关
function EnterExpMars(sysarg)
	print("进入经验战神闯关副本");
	readyEnterFB(sysarg, MarsCfg.ExpMars.FubenId);
end

table.insert(MainFnTable, MarsGuidNPC_Main);
--]]]