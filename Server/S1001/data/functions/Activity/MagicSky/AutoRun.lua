
--#include "data\config\activityconfig\MagicSky\FloorConfig.lua" once	--每个楼层配置

--#include "RankPointer.lua" once
--#include "data\functions\Activity\Common\Scene.lua" once --活动通用 场景
--#include "RankInit.lua" once

--开始活动
function StartMagicSky()
	print("StartMagicSky")
	if (not FloorConfig) then return end
	MsRanking_Init()
	local pRank = Ranking.getRanking(MsRankPt.RankName)
	if not pRank then return end
	Ranking.clearRanking(pRank)

	local dval = System.getDyanmicVar()
	dval.MagicSkyStart = 1
	
	for k, v in pairs(FloorConfig) do
		local hScene = Fuben.getSceneHandleById(v.sid, 0)
		Fuben.setSceneTime(hScene, FloorConfig[1].actTime)
	end
	Actor.regScriptTimer( System.getGlobalNpc(), 0, (GiveFlootExp.Mins-60)*1000, GiveFlootExp.Mins*1000, -1, "OnNoticePre")
	Actor.regScriptTimer( System.getGlobalNpc(), 0, GiveFlootExp.Mins*1000, GiveFlootExp.Mins*1000, -1, "OnTenMins")
	System.broadcastTipmsg(Lang.Activity.a00053, ttScreenCenter+ttChatWindow)
	for k, v in pairs(MSBoss or {}) do
		Actor.regScriptTimer( System.getGlobalNpc(), 0, v.createTime, v.createTime, 1, "CreateMSBoss".. k)
	end
end
function CreateMSBoss1()
	CreateMSBoss(1);
end 
function CreateMSBoss2()
	CreateMSBoss(2);
end
function OnNoticePre()
	System.broadcastTipmsg(Lang.Activity.a00053b, ttScreenCenter+ttChatWindow)
end

--每十分钟给一次经验
function OnTenMins()
	local dval = System.getDyanmicVar()
	if dval.MagicSkyStart then
		for k, v in ipairs(FloorConfig) do
			local rateIdx = GiveFlootExp.ExpRates[k] or 0
			local playerList = LuaHelp.getSceneActorListById(v.sid)  --获取某场景玩家对象列表
			for _, plyPtr in ipairs(playerList or {}) do
				local nExp = Actor.getActivityExp(plyPtr, GiveFlootExp.TabIdx, rateIdx, GiveFlootExp.VipRate)
				if nExp > 0 then
					Actor.addExp(plyPtr, nExp, 0, 0)
				end
			end																										   
		end																											   
	end
	System.broadcastTipmsg(Lang.Activity.a00053c, ttScreenCenter+ttChatWindow)
end
BossData = {};
--结束活动
function OverMagicSky()
	if (not FloorConfig) then return end
	local dval = System.getDyanmicVar()
	dval.MagicSkyStart = nil
	dval.MagicSkyRank = nil
	
	for k, v in pairs(FloorConfig) do
		local playerList = LuaHelp.getSceneActorListById(v.sid)  --获取某场景玩家对象列表
		if playerList ~= nil then
			for i = 1, #playerList do
				local player = playerList[i]
				if player then
					--直接把玩家传出来
					ExitMsMap(player)
				end
			end
		end
	end
	
	Actor.unregScriptCallback(thisNPC, "OnTenMins")
	Actor.unregScriptCallback(thisNPC, "OnNoticePre")
	System.broadcastTipmsg(Lang.Activity.a00054, ttScreenCenter+ttChatWindow)
	MsRanking_Fina();
	BossData = BossData or {};
	for _, v in pairs(BossData) do
		v.L = nil;
		v.nMonsterID = nil;
	end
end

--离开场景
function ExitMsMap(sysarg)
	--直接把玩家传出来
	--local Pos = LuaHelp.getReloadMapPos(sysarg) 
	local retScene = FloorConfig[1].retScene
	if Actor.enterScene(sysarg, retScene.sid, unpack(retScene.range)) == true then
		Actor.closeActivityWind(sysarg)
	end
end

-- 刷Boss
function CreateMSBoss(idx)
	idx = tonumber(idx);
	print("CreateMSBoss");
	local c = MSBoss[idx];
	if not c then print("MSBoss[idx] got nil, idx = ",idx) return end;
	local L = c.Layers[1+System.getRandomNumber(#(c.Layers))]; -- 随机取场景id
	--print("L="..L);
	local sid = FloorConfig[L].sid;
	--print("sid="..sid);
	local weightTbl = {};
	for _, v in pairs(c.Boss or {}) do table.insert(weightTbl, v.weight or 0) end;
	local v = c.Boss[GetRandIndex(weightTbl)];
	
	if v then
		BossData[idx] = BossData[idx] or {};
		BossData[idx].L = L; 
		BossData[idx].nMonsterID = v.nMonsterID;  
		
		local hScene = Fuben.getSceneHandleById(sid, 0);
		Fuben.createMonstersInRange(hScene, v.nMonsterID, v.posX1, v.posY1, v.posX2, v.posY2, v.nCount, v.nLiveTime);
		System.broadcastTipmsg(string.format(c.WorldTips, L), ttScreenCenter+ttChatWindow);
		UpdateMSBoard();
	end
end

function UpdateMSBoard()
	print("UpdateMSBoard");
	local data = {};

	for _, v in pairs(BossData or {}) do
		print("v.L="..v.L, "v.nMonsterID="..v.nMonsterID);
		if v.L and v.nMonsterID then
			table.insert(data, string.format(Lang.Activity.a00056f13, System.getMonsterNameById(v.nMonsterID) or ""));
			table.insert(data, v.L);
		end
	end
	-- 更新活动面板
	for k, v in pairs(FloorConfig) do
		local hScene = Fuben.getSceneHandleById(v.sid, 0);
		local scTime = Fuben.getSceneTime(hScene);		
		local playerList = LuaHelp.getSceneActorListById(v.sid)  --获取某场景玩家对象列表
		for _, p in pairs(playerList or {})do
			Actor.initActivityWind(p, Lang.Activity.a00056a, scTime, Lang.Activity.a00056b
			,Lang.Activity.a00056c, k
			,Lang.Activity.a00056d, #FloorConfig
			,unpack(data)
			);
		end
	end
	
end

function OnMSBosskilled(monster,sysarg,monId)
	for _, v in pairs(MSBoss or {}) do
		if v.L and v.nMonsterID and monId == v.nMonsterID then
			v.L = nil;
			v.nMonsterID = nil;
		end
	end
	UpdateMSBoard();
end

-- 注册怪物死亡函数
for _, v in pairs(MSBoss or {})do
	for _, m in pairs(v.Boss or {})do
		MonDieDispatcher.register(m.nMonsterID,OnMSBosskilled);
	end
end
