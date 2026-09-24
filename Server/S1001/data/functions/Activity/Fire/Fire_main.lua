--lua script


--#include "data\config\activityconfig\fire.lua" once
--#include "..\CombineActivity\MysiticShopOp.lua" once

function burnUpFire()
	Actor.regScriptCallback(thisNPC, thisNPC, ActFireConfig.GetExpInterval*1000, ActFireConfig.GetExpInterval*1000, -1, "loopGetExp")
	local scHd = Actor.getSceneHandle(thisNPC) --获取场景的handle
	local x=0
	local y=0
	x,y=Actor.getEntityPosition(thisNPC,x,y)
	
	--加经验的半径
	local count =#ActFireConfig.points
	
	for i=1,count do
		Fuben.createLandscape(scHd,ActFireConfig.LandscapeModelid,x +ActFireConfig.points[i][1] ,y +ActFireConfig.points[i][2],ActFireConfig.durTime)
	end
	Fuben.destroyLandscape(scHd, ActFireConfig.UnBurnModelId)
	Fuben.createLandscape(scHd, ActFireConfig.BurnModelId, x, y, ActFireConfig.durTime)
end

function fiveExpFire()
	local sysDvar = System.getDyanmicVar()
	sysDvar.FiveRateExpFlag = true

	local playerList = LuaHelp.getAllActorList(ActFireConfig.MinLevel)
	for k, ptr in ipairs(playerList or {}) do
		local netPack = DataPack.allocPacket(ptr,139, 64)  --申请一个数据包
		if netPack then
			DataPack.flush(netPack)   --发送数据包
		end
	end
end

function getFiveRateFire()
	local rate = 0
	local sysDvar = System.getDyanmicVar()
	if sysDvar.FiveRateExpFlag then
		rate = ActFireConfig.fiveRateExp - 1
	end
	return rate
end

function closeFiveExpFire()
	local sysDvar = System.getDyanmicVar()
	sysDvar.FiveRateExpFlag = nil
end

function burnOutFire()
	Actor.unregScriptCallback(thisNPC, "loopGetExp")
	local scHd = Actor.getSceneHandle(thisNPC) --获取场景的handle
	local x, y = Actor.getEntityPosition(thisNPC,0,0)
	Fuben.destroyLandscape(scHd, ActFireConfig.BurnModelId)
	Fuben.createLandscape(scHd, ActFireConfig.UnBurnModelId, x, y, -1)
	closeFiveExpFire()
end

function loopGetExp()
	local scHd = Actor.getSceneHandle(thisNPC) --获取场景的handle
	local x=0
	local y=0
	x,y=Actor.getEntityPosition(thisNPC,x,y)
	local scenePtr = Actor.getScenePtr(thisNPC)       
	
	--加经验的半径
	local count =#ActFireConfig.points
	local nRate = GetCombineActivityRate()

	for i=1,count do
		local nearPlayer = LuaHelp.getNearEntityListFromRange(scenePtr,x +ActFireConfig.points[i][1],y +ActFireConfig.points[i][2],0,0,0)
		for k, plyPtr in pairs(nearPlayer or {}) do
			local expVal = Actor.getActivityExp(plyPtr, ActFireConfig.TableIndex, ActFireConfig.FireExpRate, ActFireConfig.VipAddRate)
			if expVal > 0 then
				local allExpRate = getFiveRateFire() + (nRate - 1)
				Actor.addExp(plyPtr, expVal, 206, allExpRate, 1) 
			end
		end
	end
end