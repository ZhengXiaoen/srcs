--360平台相关

--#include "data\config\platforms\360Config.lua" once

P360Cmds = 
{
	--客户端请求
	cGetGameBoxReward = 0,  --领取360游戏登录大厅礼包

	--服务端下发
	sSendGameBoxRewardFlag = 0, --下发给前端领取标志
}

function P360GetGameBoxRewrad(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.p360HasGetGameBox == nil or var.p360HasGetGameBox == 0 then
		local gameBoxReward = PlatformConfig.GameBoxReward
		if not gameBoxReward then
			print("[ERR] 360Platform gameBoxReward reward cfg not found")
			return
		end

		if Awards.Give(sysarg, gameBoxReward, 210, "360游戏大厅领取奖励") == false then
			return -- 背包空间不够
		end	
		Actor.sendTipmsg(sysarg,"游戏大厅奖励领取成功",ttFlyTip)
		var.p360HasGetGameBox = 1
		sendGet36GameBoxFlag(sysarg)
		return
	end
	Actor.sendTipmsg(sysarg,"游戏大厅奖励已经领取过",ttFlyTip)
end

function sendGet36GameBoxFlag(sysarg)
		-- 返回结果
	local var = Actor.getStaticVar(sysarg)
	if var.p360HasGetGameBox ~= nil then
		local netPack =  AllocPlatformPacket(sysarg, P360Cmds.sSendGameBoxRewardFlag)
		DataPack.writeUInt(netPack, var.p360HasGetGameBox) -- 领取成功，返回标志
		DataPack.flush(netPack)
	end
end


-- 注册消息
if (System.GetGameIndex() == GameIndexDef.BaZheZhiRen2) and (System.getSpid() == PlatformIDs._360) then
	PlatformImplement.registerMsgHandler(PlatformIDs._360, P360Cmds.cGetGameBoxReward, 	P360GetGameBoxRewrad)
end