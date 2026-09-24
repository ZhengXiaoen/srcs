--福利官员

NpcDialog[227] = {}
NpcDialog[227].main = function(sysarg)

	if FuLiGuanYuan_HasGift(sysarg) == false then -- 没有补偿礼包可领的界面
		return FuLiGuanYuan_HasnotGift_main()
	end
	
	local echo = [[
\\\\	   
  	<(c0xFF00ffff)您有补偿奖励可领取,请点击领取按钮>\\
  	<(c0xFF00ffff)每位玩家只可领取一次.补偿奖励请留意官网通知！>

    			<#BN领取补偿礼包/@GetCompensateGifts>
]]
    
	
	 return echo;
end

-- 没有补偿礼包可领的界面
function FuLiGuanYuan_HasnotGift_main(sysarg)
	local echo = [[

  		\\\\	   <(c0xFF00ffff)没有补偿奖励领取哦,请关注官网通知！！>

]]   
	
	 return echo;
end

NpcDialog[227].GetCompensateGifts = function(sysarg)
	if FuLiGuanYuan_HasGift(sysarg) == false then
		Actor.sendTipmsg(sysarg, "暂无奖励", ttFlyTip)
		return
	end
	
	if LuaStaticData.FuLiGuanYuan == nil then return end
	
	local fuLiGuanYuanData = LuaStaticData.FuLiGuanYuan.data
	if fuLiGuanYuanData == nil then return end
	
	if fuLiGuanYuanData.version == nil then return end
	
	if fuLiGuanYuanData.circle > 0 then
		if Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE) < fuLiGuanYuanData.circle then
			Actor.sendTipmsg(sysarg, "需要达到"..fuLiGuanYuanData.circle.."转才能领取该奖励", ttFlyTip)
			return
		end
	end
	
	if fuLiGuanYuanData.level > 80 then
		if Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) < fuLiGuanYuanData.level then
			Actor.sendTipmsg(sysarg, "需要达到"..fuLiGuanYuanData.level.."级才能领取该奖励", ttFlyTip)
			return
		end
	end
	
	local award = {}
	for i, item in ipairs(fuLiGuanYuanData.giftList) do
		table.insert(award, {type = 0, id = item[1], count = item[2], bind = item[3]})
	end
	
	--检查背包
	if not Awards.CheckBagGridCount(sysarg, award) then
		return
	end
	
	Awards.Give(sysarg, award, GameLog.cCompensateAward, "补偿礼包["..fuLiGuanYuanData.version.."]")
	
	local var = Actor.getStaticVar(sysarg)
	var.fuLiGuanYuanVersion = fuLiGuanYuanData.version
	
	Actor.closeNPCDialog(sysarg)
	
	Actor.sendTipmsg(sysarg, "您成功领取了补偿礼包", ttFlyTip)
	
end

function FuLiGuanYuan_HasGift(sysarg)
	if LuaStaticData.FuLiGuanYuan == nil or LuaStaticData.FuLiGuanYuan.state == 0 then
		return false
	end
	
	local fuLiGuanYuanData = LuaStaticData.FuLiGuanYuan.data
	if fuLiGuanYuanData == nil then
		return false
	end
	
	if fuLiGuanYuanData.version == nil then
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	local version = var.fuLiGuanYuanVersion
	if version == nil then version = 0 end
	
	if version == fuLiGuanYuanData.version then -- 已经领过了
		return false
	end
	
	return true
end

function FuLiGuanYuan_ParseGiftListString(str, tbl)
	local giftList = lua_string_split(str, "#")
	for i, v in ipairs(giftList) do
		local itemList = lua_string_split(v, ",")
		if #itemList < 2 then
			return false
		end
		
		local itemId = tonumber(itemList[1])
		local itemCount = tonumber(itemList[2])
		local isBind = tonumber(itemList[3]) -- 不指定则不绑定
		if itemId == nil or itemCount == nil or itemCount == 0 then
			return false
		end
						
		local itemType = Item.getItemPropertyById(itemId, Item.ipItemType)
		if itemType == 0 then
			return false -- 物品ID 无效
		end
		
		if isBind == nil or isBind == 0 then
			isBind = 0
		else
			isBind = 1
		end

		table.insert(tbl, {itemId, itemCount, isBind})
	end
	
	return true	
end

-- 后台命令(开启补偿礼包): OpenFuLiGuanYuan|版号|描述|转数|等级|{道具ID,数量,绑定(0为不绑定，1为绑定)#道具ID,数量,绑定#...}
function backcmd_OpenFuLiGuanYuan(args)
	local version = tonumber(args[1]) -- 版号
	local desc = tonumber(args[2]) -- 描述
	local circle = tonumber(args[3]) -- 转数
	local level = tonumber(args[4]) -- 等级
	local giftList = args[5] -- 补偿礼包列表
	
	if version == nil or version == 0 or circle == nil or level == nil or giftList == nil then
		return false -- 参数错误
	end
	
	local fuLiGuanYuanData = {}
	fuLiGuanYuanData.version = version
	fuLiGuanYuanData.desc = desc
	fuLiGuanYuanData.circle = circle
	fuLiGuanYuanData.level = level
	fuLiGuanYuanData.giftList = {}
	
	if string.sub(giftList, 1, 1) ~= '{' then
		return false
	end
	
	local giftListLen = string.len(giftList)
	if giftListLen <= 4 or string.sub(giftList, giftListLen) ~= '}' then
		return false
	end
	
	if not FuLiGuanYuan_ParseGiftListString(string.sub(giftList, 2, giftListLen - 1), fuLiGuanYuanData.giftList) then
		return false
	end
	
	if LuaStaticData.FuLiGuanYuan == nil then
		LuaStaticData.FuLiGuanYuan = {}
	end
	
	LuaStaticData.FuLiGuanYuan.data = fuLiGuanYuanData
	LuaStaticData.FuLiGuanYuan.state = 1 -- -- 状态(0补偿关闭，1补偿开启)
	
	set_static_data_dirty()
	save_static_data()

	print(string.format("后台开启补偿礼包成功，版号=%d, 转数=%d, 等级=%d", version, circle, level))
	return true	
end

-- 后台命令(设置补偿礼包开启状态): SetFuLiGuanYuanOpen|状态(0补偿关闭，1补偿开启)
function backcmd_SetFuLiGuanYuanOpen(args)
	local state = tonumber(args[1]) -- 状态(0补偿关闭，1补偿开启)
	if state == nil or (state ~= 0 and state ~= 1) then
		return false
	end
	
	local oldState = 0
	if LuaStaticData.FuLiGuanYuan ~= nil then
		oldState = LuaStaticData.FuLiGuanYuan.state
		if oldState == nil then
			oldState = 0
		end
	end
	
	if oldState == state then
		if state == 0 then
			print("后台设置补偿礼包状态:关闭")
		else
			print("后台设置补偿礼包状态:开启")
		end
	
		return true
	end
	
	if LuaStaticData.FuLiGuanYuan == nil then
		LuaStaticData.FuLiGuanYuan = {}
	end
	
	LuaStaticData.FuLiGuanYuan.state = state -- 状态(0补偿关闭，1补偿开启)
	set_static_data_dirty()
	
	if state == 0 then
		print("后台设置补偿礼包状态:关闭")
	else
		print("后台设置补偿礼包状态:开启")
	end
	
	return true
end


-- 后台命令(开启补偿礼包): OpenFuLiGuanYuan|版号|描述|转数|等级|{道具ID,数量,绑定(0为不绑定，1为绑定)#道具ID,数量,绑定#...}
RegisterBackCmd("OpenFuLiGuanYuan", backcmd_OpenFuLiGuanYuan)

-- 后台命令(设置补偿礼包开启状态): SetFuLiGuanYuanOpen|状态(0补偿关闭，1补偿开启)
RegisterBackCmd("SetFuLiGuanYuanOpen", backcmd_SetFuLiGuanYuanOpen)



--function GetNpcFuLiGuanYuan() return NpcDialog[227] end
