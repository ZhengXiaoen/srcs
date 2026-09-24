-- XY平台

--#include "data\config\platforms\XY.lua" once
--#include "data\functions\json.lua" once

XYCmds = {
	-- 客户端消息
	cPlatformData = 0, 		-- 平台数据
	cGetVipGift = 1,		-- 领取Vip礼包
	cGetVipGiftFlag = 2,	-- 请求Vip礼包标识
	
	-- 服务器下发
	sPlatformData = 0,
	sGetVipGift = 1,
	sGetVipGiftFlag = 2,
}

-- 格式：{"vip_level":"6","time":1420626589,"sign":"5ab729ecdebabf15e52e19bb166351bf"}
-- 账号：4470098_xyg

-- 返回 vip_level(0 为不是VIP会员) 和 vip_type，返回 nil 则解释失败
function XY_ParsePlatformData(sysarg, str_data)
	if str_data == nil then return end
	
	-- 空串则不是VIP会员
	if str_data == "" then
		return 0, 0 -- 不是 vip 会员
	end
	
	-- json 解码
	local vip_info = json.decode(str_data)
	if vip_info == nil then return end
		
	local vip_level = vip_info.vip_level	
	local time = vip_info.time
	local sign = vip_info.sign
	
	if vip_level == nil or time == nil or sign == nil or string.len(sign) ~= 32 then
		return
	end
	
	vip_level = tonumber(vip_level) -- 不知道为什么，给个字符串过来
	time = tonumber(time)
	
	local key = "8554C64925FE570C29D643B349ABC531"
	local spid = System.getSpid()
	
	-- 得到带后缀的账号名（如：4470098_xyg）
	local accountName = Actor.getActorAccountName(sysarg)
	if accountName == nil then accountName = "" end
	
	local hash_data = string.format("%d%s%d%d%s", spid, accountName, vip_level, time, key)
	
	-- token 校验
	if System.doMd5AndCmp(hash_data, -1, sign, 32) == false then
		print("[ERR] XY_ParsePlatformData : token check fail, str_data="..str_data)
		return
	end
	
	return vip_level, 0
end

function XY_PlatformData(sysarg, platformId, msgid, packet)
	if platformId ~= PlatformIDs._xyg then
		print("[ERR] XY_PlatformData : platformId ~= PlatformIDs._xyg")
		return
	end

	if msgid ~= XYCmds.cPlatformData then
		print("[ERR] XY_PlatformData : msgid ~= XYCmds.cPlatformData")
		return
	end
	
	local str_data = DataPack.readString(packet)

	local vip_level, vip_type = XY_ParsePlatformData(sysarg, str_data)
	if vip_level == nil or vip_type == nil then
		print("[ERR] XY_ParsePlatformData() str_data="..str_data)
		return
	end

	-- 设置平台的Vip信息
	Actor.setPlatformVipInfo(sysarg, vip_level, vip_type)
	
	if vip_level <= 0 then -- 不是 vip
		--print("---------------not XY vip")
		return
	end
	
	-- 返回结果
	local netPack = AllocPlatformPacket(sysarg, XYCmds.sPlatformData)
	DataPack.writeInt(netPack, vip_level)
	DataPack.writeByte(netPack, vip_type)
	
	DataPack.flush(netPack)	
end

-- 检查领取礼包条件是否满足，返回 0 则成功，负数则失败
function XY_CheckGetVipGift(sysarg)
	-- 公测服不能领取
	if System.getServerId() > 30000 then
		return -1
	end		
	
	local openTime = System.getServerOpenTime()
	local curTime = System.getCurrMiniTime()	
	local diff = curTime - openTime
	
	-- 开服3天之内才能领取
	if diff < 0 or diff > 259200 then return -2 end
	
	return 0
end

function XY_GetVipGift(sysarg, platformId, msgid, packet)	
	
	local ret = XY_CheckGetVipGift(sysarg)
	if ret < 0 then
		print("[ERR] XY_GetVipGift XY_CheckGetVipGift() return "..ret)
		return
	end
	
	-- 玩家要领取的礼包
	local giftLevel = DataPack.readByte(packet)
	if giftLevel <= 0 or giftLevel >= 32 then
		return
	end
		
	-- 获取玩家XY等级
	local vip_level = Actor.getPlatformVipLevel(sysarg)	
	-- 不是XY会员
	if vip_level <= 0 then return end
	
	if giftLevel > vip_level then
		print("[ERR] XY_GetVipGift giftLevel["..giftLevel.."] > vip_level["..vip_level.."]")
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local XYFlags = var.XYFlags
	
	-- 是否已经领过了
	local isGot = System.getIntBit(XYFlags, giftLevel)
	if isGot ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf620, ttFlyTip)
		return
	end
	
	-- 获取等级对应的VIP礼包配置
	local rewardCfg
	for i, v in ipairs(XYPlatformCfg.VipRewards) do
		if v.level ~= nil and v.level == giftLevel then
			rewardCfg = v
			break
		end
	end

	if not rewardCfg then
		print("[ERR] XYPlatformCfg.VipRewards level["..giftLevel.."] reward cfg not found")
		return
	end

	-- LogID: clPlatformVipGift = 210,	//领取平台VIP礼包
	if Awards.Give(sysarg, rewardCfg.rewards, 210, "XY会员领取平台VIP礼包,level="..giftLevel) == false then
		return -- 背包空间不够
	end
	
	-- 设置领取标志
	XYFlags = System.setIntBit(XYFlags, giftLevel, true)
	var.XYFlags = XYFlags

	-- 返回结果
	local netPack =  AllocPlatformPacket(sysarg, XYCmds.sGetVipGift)
	DataPack.writeUInt(netPack, XYFlags) -- 领取成功，返回标志
	DataPack.flush(netPack)
end

function XY_GetVipGiftFlag(sysarg, platformId, msgid, packet)
	local var = Actor.getStaticVar(sysarg)
	
	local XYFlags = var.XYFlags
	if XYFlags == nil then XYFlags = 0 end

	local netPack =  AllocPlatformPacket(sysarg, XYCmds.sGetVipGiftFlag)
	DataPack.writeUInt(netPack, XYFlags)
	DataPack.flush(netPack)
end

--[[
function Platform_XY_Pay(sysarg, nYuanBao)
	
	if System.getSpid() ~= 2 then 
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.SendXYPayFlag then
		return 
	end
	
	local nCurTime = System.getCurrMiniTime()
	
	if not var.PayXYCount then
		var.PayXYCount = {}
		var.PayXYCount[1] = 0
		var.PayXYCount[2] = nCurTime
	end
	
	if not System.isSameMonth(nCurTime,nCurTime) then
		var.PayXYCount = nil
	end
	
	var.PayXYCount[1] = var.PayXYCount[1] + nYuanBao
	var.PayXYCount[2] = nCurTime
	
	if var.PayXYCount[1] >= 500000 or nYuanBao >= 200000 then
		local pack = DataPack.allocPacket(sysarg, 139, 130)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
		var.SendXYPayFlag = 1
	end
end
--]]

-- 注册消息
if (System.GetGameIndex() == GameIndexDef.BaZheZhiRen2) and (System.getSpid() == PlatformIDs._xyg) then
	PlatformImplement.registerMsgHandler(PlatformIDs._xyg, XYCmds.cPlatformData, 	XY_PlatformData)
	PlatformImplement.registerMsgHandler(PlatformIDs._xyg, XYCmds.cGetVipGift, 		XY_GetVipGift)
	PlatformImplement.registerMsgHandler(PlatformIDs._xyg, XYCmds.cGetVipGiftFlag, 	XY_GetVipGiftFlag)
end
