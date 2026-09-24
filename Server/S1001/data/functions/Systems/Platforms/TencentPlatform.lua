--腾讯平台
--#include "data\config\platforms\TencentVipConfig.lua" once
--#include "data\config\platforms\TencentConfigs.lua" once
--#include "data\functions\ActorEvent\OfflineMsg.lua" once
--#include "data\functions\json.lua" once

-- var.TXFlags 标志位
-- 0:是否已领取黄钻礼包
-- 1:是否已领取每日礼包
-- 2:等级1礼包
-- 3:等级2礼包
-- 4:等级3礼包
-- 5:等级4礼包
-- 6:等级5礼包
-- 7:等级6礼包
-- 8:等级7礼包
-- 9:等级8礼包
-- 10:等级9礼包
-- 11:等级10礼包
-- 12:添加图标到面板
-- 13:领取快捷登陆礼包
-- 14:领取收藏礼包
-- 15:领取腾讯开通黄钻礼包
-- 16:是否邀请过腾讯好友
-- 17:邀请好友奖励1
-- 18:邀请好友奖励2
-- 19:邀请好友奖励3
-- 20:邀请好友奖励4
-- 21:邀请好友奖励5
-- 22:邀请好友升级奖励1
-- 23:邀请好友升级奖励2
-- 24:邀请好友升级奖励3
-- 25:邀请好友升级奖励4
-- 26:邀请好友升级奖励5
-- 27:进入游戏奖励
-- 28:连续登陆奖励
-- 29:任务步骤2
-- 30:任务步骤3


--消息ID
TencentApply = 
{
	--前端请求
	cGetData = 0,				--获取相应数据
	
	--黄钻部分
	cGetDialogInfo = 1,			--请求面板信息	黄钻
	cGetYellowGift = 2,			--黄钻礼包
	cGetEveryDayGift = 3,		--每日礼包
	cGetLevelGift = 4,			--等级礼包
	
	--好友邀请部分
	cGetFriendDialogInfo = 5,	--请求面板信息	好友邀请
	cBeingInvitedEnter = 6,		--有角色被邀请进游戏
	cGetDayInvitationGift = 7,	--每日邀请奖励
	cGetInvitationGift = 8,		--邀请奖励
	cGetInvitationLevelUp = 9,	--邀请的好友升级奖励
	
	--评分
	cGetApplyScoretime = 10,	--请求面板信息	评分
	cApplyApplicationScore = 11,--评分相关请求
	
	--快捷登陆
	cAddIconToPanel = 12,		--通知已经添加到面板
	cGetQuickLoginGift = 13,	--请求领取快捷登陆礼包
	
	--收藏礼包
	--cGetCollectionGift = 13,	--请求领取收藏礼包
	
	--添加到面板
	--cGetAddToPanelAward = 15,	--领取添加到面板奖励
	
	--好友邀请补充
	cInvitationSuccess = 14,	--发送了好友邀请
		
	--后端下发
	sSendDialogInfo = 1,		--下发面板信息	黄钻
	sSendFriendDialogInfo = 2,	--下发面板信息	好友邀请
	sSendApplyScoreTime = 3,	--下发面板信息	评分
}

-- {"qqvip":"71760110100111100010001", "time":1407123562, "sign":"26c7ffd72312d437f50c8762eabd5537"}
-- 帐号名：xsp_txn

-- 返回 vip_level(0 为不是VIP会员) 和 vip_type，返回 nil 则解释失败
function Tencent_ParsePlatformData(sysarg, str_data)
	if str_data == nil then return end
    System.trace("Tencent_ParsePlatformData_begin:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
	System.trace(str_data)
	-- 空串则不是VIP会员
	if str_data == "" then
		return 0, 0 -- 不是 vip 会员
	end
	
	-- json 解码
	local vip_info = json.decode(str_data)
	if vip_info == nil then return end
		
	local qqvip = vip_info.qqvip -- VIP信息字符串长度为23
	local time = vip_info.time
	local sign = vip_info.sign
	
	if qqvip == nil or time == nil or sign == nil or string.len(sign) ~= 32 or string.len(qqvip) ~= 23 then
		return
	end
	
	time = tonumber(time)
	
	local key = "eTuH4545jpwA5j89d"
	local spid = System.getSpid()
	
	-- 得到带后缀的账号名（如：7A79E87118363E474C0B0DE95871AD7A_txn）
	local accountName = Actor.getActorAccountName(sysarg)
	if accountName == nil then accountName = "" end
	
	local hash_data = string.format("%s%s%d%s", accountName, qqvip, time, key)
	
	-- token 校验
	if System.doMd5AndCmp(hash_data, -1, sign, 32) == false then
		print("[ERR] Tencent_ParsePlatformData : token check fail, str_data="..str_data)
		return
	end
	
	-- 黄钻等级位置 3
	-- 黄钻标志位位置 19
	-- 年费黄钻位置 13
	local vip_level = string.byte(qqvip, 3) - 48 -- '0' 为 48
	
	-- 黄钻如果过期了,等级还在,但是会有个标志位
	local is_yellow = string.byte(qqvip, 19) - 48
	if is_yellow == 0 then -- 黄钻过期了
		vip_level = 0
	end
	
	local vip_type = string.byte(qqvip, 13) - 48 -- '0' 为 48
	
	return vip_level, vip_type
end

--获取相应数据
function RecvTencentVipData(sysarg, platformId, msgid, packet)
	if System.getSpid() ~= TencentBZZR_PlatformIDs._Tencent then 
		print("[ERR] RecvTencentVipData : GameIndex or Spid error")
		return
	end

	if msgid ~= TencentApply.cGetData then
		print("[ERR] RecvTencentVipData : msgid ~= TencentApply.cGetData")
		return
	end
	
	--取字符串
	local _ = DataPack.readByte(packet)
	local str_data = DataPack.readString(packet)
	
	local vip_level, vip_type = Tencent_ParsePlatformData(sysarg, str_data)
	if vip_level == nil or vip_type == nil then
		print("[ERR] Tencent_ParsePlatformData() str_data="..str_data)
		return
	end
	
	-- 设置平台的Vip信息
	Actor.setPlatformVipInfo(sysarg, vip_level, vip_type)
	
	if vip_level <= 0 then -- 不是 黄钻
		--print("---------------not Tencent vip")
		return
	end
	--Actor.setUIntProperty(sysarg, PROP_TELNEL_VIPLEVEL, vip_level)	
	--如果有黄钻则设置称号	
	--第15位为是否有黄钻年费，第16到第23位为黄钻等级(第2个byte)
	local topTitle = Actor.getUIntProperty(sysarg, PROP_TELNEL_VIPLEVEL)
	local oldTopTitle = topTitle

	topTitle = System.setIntByte(topTitle, 2, vip_level)

	if vip_type == 0 then
		topTitle = System.setIntBit(topTitle, 15, false)
	else
		topTitle = System.setIntBit(topTitle, 15, true)
	end

	if topTitle ~= oldTopTitle then

		Actor.setUIntProperty(sysarg, PROP_TELNEL_VIPLEVEL, topTitle)		
		--Actor.collectOperate(sysarg,0)
	end
end

--黄钻礼包
function TencentVIPGetYellowGift(sysarg, platformId, msgid, packet)
	if 0 == Actor.getPlatformVipLevel(sysarg) then
		--不是黄钻
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.TXYellowVIP001,ttFlyTip)
		return
	end
	
	--判断已领取
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	if System.getIntBit(TXFlags, 0) ~= 0 then -- 0:是否已领取黄钻礼包
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00041,ttFlyTip)
		return
	end
	
	local config = TencentVipConfig.YellowGift
	
	--判断背包&发放奖励
	if not Awards.Give(sysarg, config, LogIds.TencentYellowAward, "TXYellowGift") then
		--背包不足
		return
	end
	
	--修改标志位
	TXFlags = System.setIntBit(TXFlags, 0, true)
	var.TXFlags = TXFlags
	
	--提示
	Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
	
	local str = ""
	for i = 1, #config do
		str = str .. Item.getItemName(config[i].id) .. "*" .. config[i].count .. "."
	end
	System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "黄钻贵族面板", str), ttScreenCenter)
	
	--刷新面板
	SendTencentVIPDialogInfo(sysarg, platformId)
	
	--记录
	print("TencentVIPGetYellowGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))	
end

--每日礼包
function TencentVIPGetEveryDayGift(sysarg, platformId, msgid, packet)
	--领取的礼包索引
	local index = DataPack.readByte(packet)
	local vipLevel = Actor.getPlatformVipLevel(sysarg)
	
	--等级判断
	if vipLevel == 0 or index ~= vipLevel then
		--等级不足
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.TXYellowVIP002,ttFlyTip)
		return
	end
	
	--领取标记
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	if System.getIntBit(TXFlags, 1) ~= 0 then -- 1:是否已领取每日礼包
		--已领取
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00041,ttFlyTip)
		return
	end
	
	local config = TencentVipConfig.EveryDayGift.awards[index]
	if not config then
		print("TencentVIPGetEveryDayGift get config[" .. index .. "] faild")
		return
	end
	
	--年费黄钻还有其他东西
	local awards = nil
	if 0 ~= Actor.getPlatformVipType(sysarg) then
		awards = {}
		for i = 1, #config do
			table.insert(awards, config[i])
		end
		
		for i = 1, #TencentVipConfig.EveryDayGift.Additional do
			table.insert(awards, TencentVipConfig.EveryDayGift.Additional[i])
		end
	end
	
	--判断是不是有年费奖励
	if nil ~= awards then
		config = awards
	end
	
	--判断背包&发放奖励
	if not Awards.Give(sysarg, config, LogIds.TencentYellowEveryDayGift, "TXDayGift") then
		--背包不足
		return
	end
	
	--修改标志位
	TXFlags = System.setIntBit(TXFlags, 1, true)
	var.TXFlags = TXFlags
	
	--提示
	Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
	
	local str = ""
	for i = 1, #config do
		str = str .. Item.getItemName(config[i].id) .. "*" .. config[i].count .. "."
	end
	System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "黄钻贵族面板", str), ttScreenCenter)
	
	--刷新面板
	SendTencentVIPDialogInfo(sysarg, platformId)
	
	--记录
	print("TencentVIPGetEveryDayGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
end

--等级礼包
function TencentVIPGetLevelGift(sysarg, platformId, msgid, packet)
	if 0 == Actor.getPlatformVipLevel(sysarg) then
		--不是黄钻
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.TXYellowVIP001,ttFlyTip)
		return
	end
	
	--领取的礼包索引
	local index = DataPack.readByte(packet)
	if index < 1 or index > 10 then
		print("error, TencentVIPGetLevelGift index="..index)
		return
	end
	
	--领取标记
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	-- 2:等级1礼包
	-- ......
	-- 11:等级10礼包
	
	if System.getIntBit(TXFlags, index + 1) ~= 0 then
		--已领取
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00041,ttFlyTip)
		return
	end
	
	local config = TencentVipConfig.LevelGift[index]
	if not config then
		print("TencentVIPGetLevelGift get config[" .. index .. "] faild")
		return
	end
	
	--判断等级
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)	
	if actorLevel < config.NeedLevel then
		--等级不足
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf541,ttFlyTip)
		return
	end
	
	--判断背包&发放奖励
	if not Awards.Give(sysarg, config.awards, LogIds.TencentYellowLevelGift, "TXLevelGift") then
		--背包不足
		return
	end
	
	--修改标志位
	TXFlags = System.setIntBit(TXFlags, index + 1, true)
	var.TXFlags = TXFlags
		
	--提示
	Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
	
	local str = ""
	for i = 1, #config.awards do
		str = str .. Item.getItemName(config.awards[i].id) .. "*" .. config.awards[i].count .. "."
	end
	System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "黄钻贵族面板", str), ttScreenCenter)
	
	--刷新面板
	SendTencentVIPDialogInfo(sysarg, platformId)
	
	--记录
	print("TencentVIPGetLevelGift, ActorID = " .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
end

--发送面板信息
function SendTencentVIPDialogInfo(sysarg, platformId)
	local pack = AllocPlatformPacket(sysarg, platformId, TencentApply.sSendDialogInfo)
	if not pack then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
		
	--黄钻礼包
	if System.getIntBit(TXFlags, 0) == 0 then -- 0:是否已领取黄钻礼包
		DataPack.writeByte(pack, 0)
	else
		DataPack.writeByte(pack, 1)
	end
	
	--每日礼包
	local level = Actor.getPlatformVipLevel(sysarg)
	if 0 == level or System.getIntBit(TXFlags, 1) ~= 0 then
		--已领取
		DataPack.writeByte(pack, 0)
	else
		--未领取直接发黄钻等级
		DataPack.writeByte(pack, level)
	end
	
	--等级礼包
	local count = #TencentVipConfig.LevelGift
	if count > 10 then count = 10 end
	
	DataPack.writeByte(pack, count)
	for i = 1, count do
		if System.getIntBit(TXFlags, i + 1) == 0 then
			DataPack.writeByte(pack, 0)
		else
			DataPack.writeByte(pack, 1)
		end
	end
		
	DataPack.flush(pack)
end

--每日数据清理
function TencentVIPEveryDayClear(sysarg, var)
	
	local TXFlags = var.TXFlags
	if TXFlags ~= nil then
		TXFlags = System.setIntBit(TXFlags, 1, false) --每日礼包
		
		var.TXFlags = TXFlags
	end
	
	--每日邀请数量
	var.TXInvitationCount = nil
	--每日抽奖次数
	var.TXDrawCount = nil

end

--评分
function ApplicationScore(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local config = ApplicationScoreConfig

	if not var.TXScoreAward then			--还未评分
		--记录点击时间
		var.TXScoreAward = System.getCurrMiniTime()
	elseif -1 == var.TXScoreAward then		--已领取
		--提示已领取
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010,ttFlyTip)
	elseif System.getCurrMiniTime() - var.TXScoreAward < config.LimitTime then
		--提示时间不足
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.x00071,ttFlyTip)
	else
		--可领取
		if not Awards.Give(sysarg, config.awards, LogIds.TencentApplicationScoreAward, "TXScoreAward") then
			--背包格子不足
		else
			--标记已领取
			var.TXScoreAward = -1
			
			--关闭图标
			--AllActivityButtonState(sysarg, config.IconID, 0)
			
			--提示
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000173,ttFlyTip)
			
			local str = ""
			for i = 1, #config.awards do
				str = str .. Item.getItemName(config.awards[i].id) .. "*" .. config.awards[i].count .. "."
			end
			System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "评分奖励面板", str), ttScreenCenter)
		end
	end
	
	--刷新界面
	SendApplyScoreTime(sysarg)
end

--下发评分相关
function SendApplyScoreTime(sysarg)
	local pack = AllocPlatformPacket(sysarg, TencentApply.sSendApplyScoreTime)
	if not pack then
		return
	end
	
	--0代表还没评分, -1代表已领取, -2代表可以领取, 其他数值代表剩余时间
	local var = Actor.getStaticVar(sysarg)
	if var.TXScoreAward and -1 ~= var.TXScoreAward then
		local tTime = var.TXScoreAward + ApplicationScoreConfig.LimitTime - System.getCurrMiniTime()
		if 0 > tTime then
			tTime = -2
		end

		DataPack.writeInt(pack, tTime)
	else
		DataPack.writeInt(pack, var.TXScoreAward)
	end
	
	DataPack.flush(pack)
end

--领取快捷登陆
function GetQuickLoginGift(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
		
	--要先添加图标到面板后才能领
	if System.getIntBit(TXFlags, 12) == 0 then -- 12:添加图标到面板
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.TXYellowVIP003,ttFlyTip)
		return
	end
	
	if System.getIntBit(TXFlags, 13) ~= 0 then -- 13:领取快捷登陆礼包
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010,ttFlyTip)
		return
	end
	
	local config = TencentConfigs.QuickLoginGift
	if not Awards.Give(sysarg, config.award, LogIds.TencentQuickLoginGift, "GetQuickLoginGift") then
		return
	end
	
	TXFlags = System.setIntBit(TXFlags, 13, true)
	var.TXFlags = TXFlags
		
	--提示
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000173,ttFlyTip)
	
	local str = ""
	for i = 1, #config.award do
		str = str .. Item.getItemName(config.award[i].id) .. "*" .. config.award[i].count .. "."
	end
	System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "快捷登陆面板", str), ttScreenCenter)
	
	--关闭图标
	--AllActivityButtonState(sysarg, TencentConfigs.QuickLoginGift.IconID, 0)
end

--[[
--领取收藏礼包
function GetCollectionGift(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	--判断已领取
	if System.getIntBit(TXFlags, 14) ~= 0 then -- 14:领取收藏礼包
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010,ttFlyTip)
		return
	end
	
	local config = TencentConfigs.CollectionGift
	if not Awards.Give(sysarg, config, LogIds.TencentCollectionGift, "GetCollectionGift") then
		return
	end
	
	TXFlags = System.setIntBit(TXFlags, 14, true)
	var.TXFlags = TXFlags
	
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000173,ttFlyTip)
end
--]]

--添加图标到面板
function AddIconToPanel(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
		
	--已经添加图标到面板了
	if System.getIntBit(TXFlags, 12) ~= 0 then -- 12:添加图标到面板
		return
	end
	
	TXFlags = System.setIntBit(TXFlags, 12, true)
	var.TXFlags = TXFlags
end

--腾讯部分角色充值
function TXActorRecharge(sysarg, value)
	-- 暂时屏蔽，需要再打开，奖励的礼包配置还是旧的，打开的话要改下
--[[
	if System.GetGameIndex() ~= GameIndexDef.TencentBaZheZhiRen2 then
		return
	end

	local config = TencentConfigs.RechargeGift
	
	for i = 1, #config do
		if value == config[i].needMoney then
			--如果有这个,发送离线邮件
			local actorID = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
			SendScriptOfflineMsg(actorID, Lang.ScriptTips.TXYellowVIP004, nil, OfflineMsgIds.GetTXRechargeAward, tostring(i))
			
			break
		end
	end
--]]
end

EventCallDispatcher.handlePlatformVipScript = function(sysarg, args)
	if System.GetGameIndex() ~= GameIndexDef.TencentBaZheZhiRen2 then
		return -1 -- 失败
	end
	
	local yellow_level = args[1]
	-- 0 为非黄钻
	if yellow_level == 0 then return end
	
	--判断已经发放
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 15) ~= 0 then -- 15:领取腾讯开通黄钻礼包
		return 3
	end
	
	--发送邮件
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	print("actorID="..actorID..",yellow_level=" .. yellow_level)
	
	SendScriptOfflineMsg(actorID, Lang.ScriptTips.TXYellowVIP005, nil, OfflineMsgIds.GetTXYellowVipAward)
	
	return 0 -- 成功
end

function Tencent_OnPlayerLogin(sysarg, isCrossDay, var)
	--平台图标显示
	
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end

	--黄钻
	--AllActivityButtonState(sysarg, TencentVipConfig.IconID, 1)
	
	--评分
	--if -1 ~= var.TXScoreAward then
	--	AllActivityButtonState(sysarg, ApplicationScoreConfig.IconID, 1)
	--end
	
	--微信
	--if not var.WeiChatGift then
	--	AllActivityButtonState(sysarg, TencentConfigs.WeiChatGift.IconID, 1)
	--end
	
	--好友邀请
	--AllActivityButtonState(sysarg, TencentInvitationConfig.IconID, 1)
	
	--快捷登陆
	--if System.getIntBit(TXFlags, 13) == 0 then -- 13:领取快捷登陆礼包
	--	AllActivityButtonState(sysarg, TencentConfigs.QuickLoginGift.IconID, 1)
	--end
end

--领取腾讯部分角色充值奖励
-- 返回 true 则删除该消息，返回 false 则不删除
function OfflineMsgGetTXRechargeAward(sysarg, msgId, strParams)
	if msgId ~= OfflineMsgIds.GetTXRechargeAward then
		print("OfflineMsgGetTXRechargeAward msgId error")
		return false
	end
	
	if System.getSpid()~= TencentBZZR_PlatformIDs._Tencent then
		return false
	end
	
	local index = tonumber(strParams)
	
	local config = TencentConfigs.RechargeGift[index]
	if not config then
		print("TencentConfigs.RechargeGift[" .. index .. "] Get Faild!")
		return false
	end
	if #config.award == 0 then return true end
	if Awards.Give(sysarg, config.award, LogIds.TXRechargeAward, tostring(index)) == false then
		return false
	end
	
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000173,ttFlyTip)
	return true
end

--领取开通黄钻礼包
-- 返回 true 则删除该消息，返回 false 则不删除
function OfflineMsgGetTXYellowVipAward(sysarg, msgId, strParams)
	--判断已经领取
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 15) ~= 0 then -- 15:领取腾讯开通黄钻礼包
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.n00010,ttFlyTip)
		return true
	end
	
	--发放
	if not Awards.Give(sysarg, TencentConfigs.YellowVipGift, LogIds.TencentOpenYellowVipGift, "GetTXYellowVipAward") then
		return false
	end
	
	--标记已领取
	TXFlags = System.setIntBit(TXFlags, 15, true)
	var.TXFlags = TXFlags
		
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000173,ttFlyTip)
	return true
end


--if (System.GetGameIndex() == GameIndexDef.TencentBaZheZhiRen2) and (System.getSpid() == TencentBZZR_PlatformIDs._Tencent) then
if System.getSpid() == TencentBZZR_PlatformIDs._Tencent then
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetData, RecvTencentVipData)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetDialogInfo, SendTencentVIPDialogInfo)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetYellowGift, TencentVIPGetYellowGift)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetEveryDayGift, TencentVIPGetEveryDayGift)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetLevelGift, TencentVIPGetLevelGift)
	
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetApplyScoretime, SendApplyScoreTime)
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cApplyApplicationScore, ApplicationScore)
	
	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetQuickLoginGift, GetQuickLoginGift)
--	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetCollectionGift, GetCollectionGift)

	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cAddIconToPanel, AddIconToPanel)
--	PlatformImplement.registerMsgHandler(TencentBZZR_PlatformIDs._Tencent, TencentApply.cGetAddToPanelAward, GetAddToPanelAward)	
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aePlatformVipScript, EventCallDispatcher.handlePlatformVipScript)

-- 注册离线消息处理器
OfflineMsgFuncs[OfflineMsgIds.GetTXRechargeAward] = OfflineMsgGetTXRechargeAward
OfflineMsgFuncs[OfflineMsgIds.GetTXYellowVipAward] = OfflineMsgGetTXYellowVipAward
