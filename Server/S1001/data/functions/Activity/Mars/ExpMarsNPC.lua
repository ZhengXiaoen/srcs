--[[File:ExpMarsNPC.lua]]
-- 经验战神闯关使者
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "MarsCommon" once

function ExpMarsNPC_Main(sysarg)	
	local strDlg = "";
	strDlg = GetGameGirdNum(sysarg);
	local nMonCount = Fuben.getLiveMonsterCount(Actor.getSceneHandle(sysarg), 0);
	if nMonCount > 0 then
		-- 秒杀副本怪物
		-- 退出副本的函数
		strDlg = string.format("%s%s", strDlg, GetExitFubenOption(sysarg));
	else
		-- 切换菜单 ？？
		-- 战神令/元宝领取奖励并前进
		-- 绑定元宝领取奖励并前进
		-- 荣誉领取奖励并前进
		-- 领取奖励并离开
	end
	
	
	strDlg = string.format("%s\\<#BL%s/@exit>", strDlg, Lang.Activity.lfg0004);
	return strDlg;
end

table.insert(MainFnTable, ExpMarsNPC_Main);