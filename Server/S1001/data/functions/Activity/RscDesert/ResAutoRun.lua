--[[File:Auto.lua]]

--#include "data\config\activityconfig\ResDesert\ResDesertCfg.lua" once 

-- 开始
function PreStartResDesert()	
	System.broadcastTipmsg(Lang.Activity.res0008,8)
end

-- 开始
function StartResDesert()
	print("StartResDesert");
	local sysVar =  System.getDyanmicVar();
	sysVar.ResWasteStarted = true;
		
	-- 设置场景时间
	local hScene = Fuben.getSceneHandleById(ResDesertCfg.scene, 0);
	Fuben.setSceneTime(hScene, ResDesertCfg.activityTime);
	System.broadcastTipmsg(Lang.Activity.res0009,8)
	-- 注册个倒计时 ResEndCountdown
	Actor.regScriptTimer( System.getGlobalNpc(), 0, ResDesertCfg.activityTime-ResDesertCfg.endCountdown, 0, 1, "ResEndCountdown");
	Actor.regScriptTimer( System.getGlobalNpc(), 0, 0, ResDesertCfg.CreateMonstersInterval, -1, "ResCreateMonster");
	
	local v = ResDesertCfg.ResRankPt;
	Rank.Init(v.RankName, v.RankFile, v.RankColumn, v.ClinetShowCount, v.ClientShow);
end


-- 结束
function PreEndResDesert()
	System.broadcastTipmsg(Lang.Activity.res0010,8)
	Actor.unregScriptCallback( System.getGlobalNpc(), "ResCreateMonster");
end

-- 结束
function EndResDesert()
	print("EndResDesert");
	local sysVar =  System.getDyanmicVar();
	sysVar.ResWasteStarted = nil;
	System.broadcastTipmsg(Lang.Activity.res0011,8)
end

function OnLeaveResDesert()

end

-- 结束倒计时
function ResEndCountdown()
	local hScene = Fuben.getSceneHandleById(ResDesertCfg.scene, 0);
	Fuben.sendMsgToScene(hScene, string.format(Lang.Activity.res0012,ResDesertCfg.endCountdown), ttChatWindow);
	Fuben.sendCountDown(hScene, ResDesertCfg.endCountdown);
	-- 删除计时器
	Actor.unregScriptCallback( System.getGlobalNpc(), "ResEndCountdown");
end

function ResCreateMonster()
	local hScene = Fuben.getSceneHandleById(ResDesertCfg.scene, 0);
	for _, v in pairs(ResDesertCfg.Monsters)do
		Fuben.createOneMonsters(hScene, v.nMonsterID, v.posX1, v.posX2, v.posY, v.nCount, v.nLiveTime);
	end
end

function ClearResRank()
	local v = ResDesertCfg.ResRankPt;
	Rank.Fina(v.RankName, v.RankFile);
end

