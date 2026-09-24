--腾讯平台 好友邀请
--#include "data\config\platforms\TencentVipConfig.lua" once
--#include "data\functions\ActorEvent\OfflineMsg.lua" once

--成功发送好友邀请
function InvitationSuccess(sysarg, platformId, msgid, packet)
	--读取邀请的人数
	local count = DataPack.readByte(packet)

	--增加邀请人数
	local var = Actor.getStaticVar(sysarg)
	var.TXInvitationCount = (var.TXInvitationCount or 0) + count
	
	--邀请标记
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 16) == 0 then -- 16:是否邀请过腾讯好友
		TXFlags = System.setIntBit(TXFlags, 16, true)
		var.TXFlags = TXFlags
	end
		
	--刷新界面
	SendTencentFriendDialog(sysarg, platformId)
end

--有角色被邀请进入游戏
function TXActorBeingInvitedEnter(sysarg, platformId, msgid, packet)
	local _ = DataPack.readByte(packet)
	local _ = DataPack.readString(packet)
	
	--取邀请者ID
	local InvitationID = DataPack.readUInt(packet)--Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if not InvitationID or 0 == InvitationID then
		print("TXActorBeingInvitedEnter InvitationID is nil!")
		return
	end
	
	--在角色身上储存邀请者,以便于升级的时候通知
	local var = Actor.getStaticVar(sysarg)
	var.TXActorBeingInvited = InvitationID
	
	--离线消息通知角色邀请成功一个, 加上角色用户名字...
	SendScriptOfflineMsg(InvitationID, Lang.ScriptTips.TXInvitation001, nil, OfflineMsgIds.TXInvitationSuccess, Actor.getActorAccountName(sysarg))
	
	print("TXActorBeingInvitedEnter, InvitationID = " .. InvitationID .. ", ActorName = " .. Actor.getName(sysarg))
end

--成功邀请一个好友进入离线消息
-- 返回 true 则删除该消息，返回 false 则不删除
function OfflineMsgTXInvitationSuccess(sysarg, msgId, strParams)
	--如果不是千年传奇不处理
	if System.GetGameIndex() ~= GameIndexDef.TencentBaZheZhiRen2 then
		print("recv TXInvitationSuccessOfflineMsg but not TencentBaZheZhiRen2")
		return true
	end

	if not strParams or strParams == "" then
		print("recv TXInvitationSuccessOfflineMsg strParams nil")
		return true
	end

	--给角色的邀请数量+1
	local var = Actor.getStaticVar(sysarg)

	--检测重复邀请
	if not var.TXInvitationActorList then
		var.TXInvitationActorList = {}
	end

	-- strParams 是账号名
	if var.TXInvitationActorList[strParams] then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXInvitation006,ttFlyTip)
		--print("recv TXInvitationSuccessOfflineMsg str repeat = " .. strParams)
		return true
	end

	var.TXInvitationActorList[strParams] = true

	var.TXInvitationActorCount = (var.TXInvitationActorCount or 0) + 1
	
	--要不要刷新?
	
	return true
end

--被邀请的角色升级
function TXBeingInvitedLevelUp(sysarg, level)
	--如果不是千年传奇不处理
	if System.GetGameIndex() ~= GameIndexDef.TencentBaZheZhiRen2 then
		return
	end

	--判断是不是升到了奖励等级
	if TencentInvitationConfig.InvitationFriendLevelUpAward.AwardLevel > level then
		return
	end
	
	--查找是不是有邀请者
	local var = Actor.getStaticVar(sysarg)
	if not var.TXActorBeingInvited then
		return
	end
	
	--给邀请者发送消息
	local title = string.format(Lang.ScriptTips.TXInvitation002, TencentInvitationConfig.InvitationFriendLevelUpAward.AwardLevel)
	SendScriptOfflineMsg(var.TXActorBeingInvited, title, nil, OfflineMsgIds.TXInvitationLevelUp)

	--发送完成之后清掉邀请者
	var.TXActorBeingInvited = nil
end

--好友成功升到一定等级
-- 返回 true 则删除该消息，返回 false 则不删除
function OfflineMsgTXInvitationLevelUp(sysarg, msgId, strParams)
	--如果不是千年传奇不处理
	if System.GetGameIndex() ~= GameIndexDef.TencentBaZheZhiRen2 then
		print("recv TXInvitationSuccessOfflineMsg but not LegendOfThousands")
		return true
	end
	
	--给角色的邀请好友等级数量+1
	local var = Actor.getStaticVar(sysarg)
	var.TXInvitationActorLevelCount = (var.TXInvitationActorLevelCount or 0) + 1
	
	--要不要刷新?
	
	return true
end

--领取每日邀请奖励
--邀请一个获得一个礼包,最多X次
function GetTXDayInvitationGift(sysarg, platformId, msgid, packet)
	local var = Actor.getStaticVar(sysarg)

	--配置
	local config = TencentInvitationConfig.InvitationLuckyDraw
	
	--抽奖次数判断
	if config.InvitationNum < (var.TXDrawCount or 0) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXInvitation003,ttFlyTip)
		return
	end
	
	--判断邀请数量
	if (var.TXInvitationCount or 0) <= (var.TXDrawCount or 0) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXInvitation004,ttFlyTip)
		return
	end
	
	--抽奖
	local num = System.getRandomNumber(config.MaxRandomNum)
	local award = nil
	for k, v in pairs(config.awards) do
		if v.Probability > num then
			award = {}
			award[1] = v
			break
		end
	end

	--什么都没抽到....
	if nil == award then
		print("概率配置有问题!什么都没抽到!")
		return
	end
	
	--抽奖次数+1
	var.TXDrawCount = (var.TXDrawCount or 0) + 1
	
	--发放奖励
	if not Awards.Give(sysarg, award, LogIds.TencentDayInvitationGift, "GetTXDayInvitationGift") then
		return
	end
	
	--刷新界面
	SendTencentFriendDialog(sysarg, platformId)
	
	--提示成功
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000160, ttFlyTip)
	
	--记录
	print("GetTXDayInvitationGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))	
end

--领取邀请奖励
function GetTXInvitationGift(sysarg, platformId, msgid, packet)
	--获取领取的索引
	local index = DataPack.readByte(packet)
	if index < 1 or index > 5 then
		return -- 配置最大为5级
	end
	
	--获取已邀请数量
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	--判断已领取
	-- 17:邀请好友奖励1
	-- 18:邀请好友奖励2
	-- 19:邀请好友奖励3
	-- 20:邀请好友奖励4
	-- 21:邀请好友奖励5
	if System.getIntBit(TXFlags, 16 + index) ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010, ttFlyTip)
		return
	end
	
	local config = TencentInvitationConfig.InvitationFriendAward[index]
	if not config then
		print("get TencentInvitationConfig.InvitationFriendAward[" .. index .. "] faild")
		return
	end
	
	--判断数量是不是足够
	if (var.TXInvitationActorCount or 0) < config.InvitationNum then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXInvitation004,ttFlyTip)
		return
	end
	
	--发放奖励
	if not Awards.Give(sysarg, config.awards, LogIds.TencentInvitationGift, "GetTXInvitationGift") then
		return
	end
	
	--修改标记
	TXFlags = System.setIntBit(TXFlags, 16 + index, true)
	var.TXFlags = TXFlags
	
	--刷新界面
	SendTencentFriendDialog(sysarg, platformId)
	
	--提示成功
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000160, ttFlyTip)
	
	--记录
	print("GetTXInvitationGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
end

--领取邀请升级奖励
function GetTXInvitationLevelUpGift(sysarg, platformId, msgid, packet)
	--获取领取的索引
	local index = DataPack.readByte(packet)
	if index < 1 or index > 5 then
		return -- 只有5个
	end
	
	--获取等级足够的数量
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end	
	
	--判断已领取
	-- 22:邀请好友升级奖励1
	-- 23:邀请好友升级奖励2
	-- 24:邀请好友升级奖励3
	-- 25:邀请好友升级奖励4
	-- 26:邀请好友升级奖励5
	if System.getIntBit(TXFlags, 21 + index) ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010, ttFlyTip)
		return
	end
	
	local config = TencentInvitationConfig.InvitationFriendLevelUpAward[index]
	if not config then
		print("get TencentInvitationConfig.InvitationFriendLevelUpAward[" .. index .. "] faild")
		return
	end
	
	--判断数量是不是足够
	if (var.TXInvitationActorLevelCount or 0) < config.InvitationNum then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXInvitation005, ttFlyTip)
		return
	end
	
	--发放奖励
	if not Awards.Give(sysarg, config.awards, LogIds.TencentInvitationLevelGift, "GetTXInvitationLevelUpGift") then
		return
	end
	
	--修改标记
	TXFlags = System.setIntBit(TXFlags, 21 + index, true)
	var.TXFlags = TXFlags
	
	--刷新界面
	SendTencentFriendDialog(sysarg, platformId)
	
	--提示成功
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000160, ttFlyTip)
	
	--记录
	print("GetTXInvitationLevelUpGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
end

function SendTencentFriendDialog(sysarg, platformId)
	local pack = AllocPlatformPacket(sysarg, TencentApply.sSendFriendDialogInfo, platformId)
	if not pack then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	local config = TencentInvitationConfig.InvitationLuckyDraw
	
	--每日邀请剩余次数
	local count = var.TXInvitationCount or 0
	if count > config.InvitationNum then
		--每日邀请抽奖次数限制
		count = config.InvitationNum
	end
	DataPack.writeByte(pack, count - (var.TXDrawCount or 0))
	
	--今天邀请的好友数量
	DataPack.writeByte(pack, var.TXInvitationCount)

	--邀请礼包
	local _c = #TencentInvitationConfig.InvitationFriendAward
	if _c > 5 then _c = 5 end
	
	DataPack.writeByte(pack, _c)
	for i = 1, _c do
		if System.getIntBit(TXFlags, 16 + i) == 0 then
			DataPack.writeByte(pack, 0)
		else
			DataPack.writeByte(pack, 1)
		end
	end
	
	--邀请的人数
	DataPack.writeWord(pack, var.TXInvitationActorCount)
	
	--好友等级礼包
	_c = #TencentInvitationConfig.InvitationFriendLevelUpAward
	if _c > 5 then _c = 5 end
		
	DataPack.writeByte(pack, _c)
	for i = 1, _c do
		if System.getIntBit(TXFlags, 21 + i) == 0 then
			DataPack.writeByte(pack, 0)
		else
			DataPack.writeByte(pack, 1)
		end
	end
	
	--等级达到的人数
	DataPack.writeWord(pack, var.TXInvitationActorLevelCount)
	
	DataPack.flush(pack)
end

if (System.GetGameIndex() == GameIndexDef.TencentBaZheZhiRen2) and (System.getSpid() == TencentBZZR_PlatformIDs._Tencent) then
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetFriendDialogInfo, SendTencentFriendDialog)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cBeingInvitedEnter, TXActorBeingInvitedEnter)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetDayInvitationGift, GetTXDayInvitationGift)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetInvitationGift, GetTXInvitationGift)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetInvitationLevelUp, GetTXInvitationLevelUpGift)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cInvitationSuccess, InvitationSuccess)
end

-- 注册离线消息处理器
OfflineMsgFuncs[OfflineMsgIds.TXInvitationSuccess] = OfflineMsgTXInvitationSuccess
OfflineMsgFuncs[OfflineMsgIds.TXInvitationLevelUp] = OfflineMsgTXInvitationLevelUp
