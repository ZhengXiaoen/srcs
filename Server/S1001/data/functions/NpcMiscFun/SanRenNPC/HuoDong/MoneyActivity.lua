--#include "data\config\activityconfig\ScatteredTreasure\ScatteredTreasureCfg.lua" once

---黑龙魔君散宝
function StartMoneyActivity()
	
	local config = TreasureBossCfg
	if not config then return end
	if not config.DropMoney then return end
	local DropMoney = config.DropMoney
	
	local playerList = LuaHelp.getSceneAliveActorListById(config.sceneId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			local x, y=Actor.getEntityPosition(player,0,0)
			if x >= DropMoney.centerPos[1] and x <= DropMoney.centerPos[1] + DropMoney.range[1] and y >= DropMoney.centerPos[2] and y <= DropMoney.centerPos[2] + DropMoney.range[2] then
				local netPack = DataPack.allocPacket(player, 26, 19)
				DataPack.writeWord(netPack,2)
				DataPack.writeInt(netPack,DropMoney.effectTime)
				DataPack.writeInt(netPack,0)
				DataPack.writeInt(netPack,0)
				DataPack.flush(netPack)
			end
		end
	end
    for i = 0,DropMoney.count do
		if System.getRandomNumber(1000) < DropMoney.rate then
			System.createDropBox(config.sceneId,DropMoney.centerPos[1] + System.getRandomNumber(DropMoney.range[1]),DropMoney.centerPos[2] + System.getRandomNumber(DropMoney.range[2]),6,0,DropMoney.coin[1] + System.getRandomNumber(DropMoney.coin[2]-DropMoney.coin[1]),DropMoney.time)
		else
			local ItemId = System.getRandomNumber(#DropMoney.drop)
			ItemId = ItemId +1
			System.createDropBox(config.sceneId,DropMoney.centerPos[1] + System.getRandomNumber(DropMoney.range[1]),DropMoney.centerPos[2] + System.getRandomNumber(DropMoney.range[2]),0,DropMoney.drop[ItemId].id,DropMoney.drop[ItemId].count,DropMoney.time)
		end
	end
end

function CreateTreasureBoss()
	
	local config = TreasureBossCfg
	if not config then return end
	local hScene = Fuben.getSceneHandleById(config.sceneId, 0)
	Fuben.createMonster(hScene,config.bossId,config.bossPos[1],config.bossPos[2],config.levelTime)
end

function StartKillTreasureBoss()

	local dlgStr = string.format("@onEnterTreasureBoss,%d",TreasureBossCfg.sceneId)
	StrTipsFunc(dlgStr,activityTips[10].tips,10)  
	
	CreateTreasureBoss()
	
	System.broadcastTipmsg(Lang.Activity.money0002,2+128)
end

function EndKillTreasureBoss()
	
	local config = TreasureBossCfg
	if not config then return end
	local hScene = Fuben.getSceneHandleById(config.sceneId, 0)
	Fuben.clearMonster(hScene,config.bossId)
	
	System.broadcastTipmsg(Lang.Activity.money0003,2+128)
end

function PreStartTreasureBoss()
	System.broadcastTipmsg(Lang.Activity.money0001,2+128)
end

function DragonEscape()
	System.broadcastTipmsg(Lang.ScriptTips.zf175,2048)
end
