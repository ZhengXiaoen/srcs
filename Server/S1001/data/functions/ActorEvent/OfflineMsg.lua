
OfflineMsgFuncs = {}

OfflineMsgIds = {
	YbConsumeRanking1 = 1, -- 月度活动 元宝消耗排行榜第 1 名奖励
	YbConsumeRanking2 = 2, -- 月度活动 元宝消耗排行榜第 2 ~ 5 名奖励
	YbConsumeRanking3 = 3, -- 月度活动 元宝消耗排行榜第 6 ~ 20 名奖励
	TXInvitationSuccess = 4,		--腾讯好友邀请
	TXInvitationLevelUp = 5,		--腾讯邀请的好友升级
	GetTXRechargeAward = 6,			--腾讯充值礼包
	GetTXYellowVipAward = 7,		--腾讯开通黄钻礼包
	ActorGivingGift = 8,				-- 角色赠送的礼物
	spring_redpacket = 9, -- 春节红包
}


function SendScriptOfflineMsg(actorId, title, btnTxt, msgId, msg, srcActorId)
	local buf = tostring(msgId)
	if msg then
		buf = buf .. "," .. msg
	end
	
	if srcActorId == nil then srcActorId = 0 end
	
	return System.sendScriptOfflineMsg(actorId, title, btnTxt, buf, srcActorId)
end


-- 返回 true 则删除该消息，返回 false 则不删除
function OnScriptOfflineMsgEvent(sysarg, args)
	local strParams = args[1]
	local msgId = 0
	local pos = string.find(strParams, ',', 1) 
	if pos then
		local substr = string.sub(strParams, 1, pos - 1)
		msgId = tonumber(substr)
		strParams = string.sub(strParams, pos + 1)
	else
		msgId = tonumber(strParams)
		strParams = ""
	end
		
	local func = OfflineMsgFuncs[msgId]
	if not func then
		print("error, OfflineMsgFuncs[msgId] == nil,msgId=="..msgId)
		return false
	end
	
	local ret = func(sysarg, msgId, strParams)
	if ret == nil then ret = true end
	
	return ret
end

