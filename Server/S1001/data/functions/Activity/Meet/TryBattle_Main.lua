
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "RandNpcShopCommon.lua" once

function TryBattle_Main( sysarg )
	local dlgStr = string.format("<#BL%s/@TryBattleFunc>", Lang.ScriptTips.fuben031)
	return dlgStr
end

function TryBattleFunc( sysarg )
	local sysDVar = System.getDyanmicVar()
	if not sysDVar.TryBattleFlag then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.meeting007, ttFlyTip)
		return
	end
	readyEnterFB(sysarg, MeetConfig.FubenId)
end

function TryBattle_Init( npcObj )
	Actor.setEntityVisibleFlag( npcObj, false)
end

table.insert(MainFnTable, TryBattle_Main)
table.insert(InitFnTable, TryBattle_Init)