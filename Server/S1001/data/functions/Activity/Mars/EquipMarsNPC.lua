--[[File:EquipMarsNPC.lua]]
-- 装备战神闯关使者

--#include "MarsCommon" once

function EquipMarsNPC_Main(sysarg)	
	local strDlg = "";
	strDlg = GetGameGirdNum(sysarg);
	-- 兑换战神令
	strDlg = strDlg .. GetGameGirdNum(sysarg);
	-- 购买药品
	strDlg = strDlg .. Lang.Activity.a00004;
	strDlg = string.format("%s%s", strDlg, GetExitFubenOption(sysarg));
	strDlg = string.format("%s\\<#BL%s/@exit>", strDlg, Lang.Activity.lfg0004);
	return strDlg;
end

table.insert(MainFnTable, EquipMarsNPC_Main);