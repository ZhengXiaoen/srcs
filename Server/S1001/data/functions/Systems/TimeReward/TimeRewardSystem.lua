--在线时间奖励

--#include "data\language\LangCode.txt" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\config\guide\OnlineTimeAward.lua" once

-- 获取每日在线奖励
function ClientMsgGetOnlineReward(sysarg, packet)
	local rewardId = DataPack.readByte(packet)
		
	local config = OnlineTimeAward[rewardId]
	if not config then
		print("ClientMsgGetOnlineReward error, OnlineTimeAward["..rewardId.."]==nil")
		return
	end
	
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	
	if onlineTime < config.online then -- 还没到领取时间
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00004,ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg) 
	local rewardFlags = var.days.OLRWDFlags -- 领取在线奖励标志
	if rewardFlags == nil then rewardFlags = 0 end

	local isGot = System.getIntBit(rewardFlags, rewardId - 1)
	if isGot ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf664, ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg, config.awards, GameLog.clOnlineAwardItem, Lang.LogTips.l00081) == false then
		return -- 背包空间不够
	end
		
	-- 设置领取标志
	rewardFlags = System.setIntBit(rewardFlags, rewardId - 1, true)
	var.days.OLRWDFlags = rewardFlags
	
	local str
	if config.awards[1].type == 5 then
		str = "您成功领取了在线奖励:<(c0xFF00ff00)" .. (config.awards[1].count / 10000) .. "万>绑金"
		System.broadcastTipmsg( string.format("玩家<(n%s)>在福利大厅领取了在线奖励:<(c0xFF00ff00)"..(config.awards[1].count/10000).."万>绑金,<我也要领取/@@showWin,92>", Actor.getName(sysarg)), 128+2+2048)
	else
		str = "您成功领取了在线奖励"
		System.broadcastTipmsg( string.format("玩家<(n%s)>在福利大厅领取了在线奖励,<我也要领取/@@showWin,92>", Actor.getName(sysarg)), 128+2+2048)
	end

	Actor.sendTipmsg(sysarg, str, 2048);
	
	-- 下发领取奖品结果
	local npack = DataPack.allocPacket(sysarg, 138, 2)  --申请一个数据包
	DataPack.writeUInt(npack, rewardFlags) -- 领取成功，返回标志
	DataPack.flush(npack)
end

function ClientMsgGetOnlineRewardInfo(sysarg, packet)
	--138 通知客户端一次在线奖励 1
	local npack = DataPack.allocPacket(sysarg, 138,4)  --申请一个数据包
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local rewardFlags = var.days.OLRWDFlags -- 领取在线奖励标志
	if rewardFlags == nil then rewardFlags = 0 end	
	
	DataPack.writeUInt(npack, onlineTime)
	DataPack.writeUInt(npack, rewardFlags)
	DataPack.flush(npack)
end

-- 在线时间抽奖
function ClientMsgRewardSystem(sysarg, systemid, msgid, packet)
	if msgid == 1 then				-- 获取每日在线奖励
		ClientMsgGetOnlineReward(sysarg, packet);
	elseif msgid == 4 then -- 获取每日在线奖励信息
		ClientMsgGetOnlineRewardInfo(sysarg, packet);
	end
end

SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.timeRewardSystem, ClientMsgRewardSystem)