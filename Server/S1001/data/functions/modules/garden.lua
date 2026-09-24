-- 果园
--#include "data\config\modules\garden_cfg.lua" once

s2c_garden_msgids = {
	garder_data = 1, -- 果园数据
	upgrade_grid = 2, -- 升级土地
	sow_seed = 3, -- 播种
	fruit_ripe = 4, -- 果实成熟
	grid_data = 5, -- 土地数据
	use_fertilizer = 6, -- 使用化肥
}

-- 土地状态(按位存)
-- 0:使用了化肥
-- 1:果实已摘

function garden_get_seed_cfg(seed_id)
	for i,v in ipairs(garden_cfg.seeds_cfg) do
		if v.seed_id == seed_id then
			return v
		end
	end
	
	return nil
end

function garden_get_fertilizer_cfg(item_id)
	for i,v in ipairs(garden_cfg.fertilizer_list) do
		if v.item_id == item_id then
			return v
		end
	end
	
	return nil
end

function garden_init_grid(sysarg, garden, i)
	if garden.grids[i] ~= nil then
		return
	end
	
	garden.grids[i] = {}
	local grid = garden.grids[i]
	
	grid[1] = 0 -- 0土地等级 1土地状态 23土地种子
	grid[2] = 0 -- 果实成熟时间
end

function garden_init(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden ~= nil then return end
	
	var.garden = {}
	garden = var.garden
	
	garden.grids = {}
	garden.gridcount = 0
	
	-- 初始开启 6 块普通土地
	for i=1, 6 do
		garden_add_grid(sysarg, garden)	
	end

end

-- 增加土地
function garden_add_grid(sysarg, garden)
	if garden == nil then return false end
	
	-- 土地数量
	local gridcount = garden.gridcount
	if gridcount >= 18 then
		--Actor.sendTipmsg(sysarg, "您的土地数量已达到最大值", ttFlyTip)
		return false
	end
			
	garden_init_grid(sysarg, garden, gridcount + 1)
	gridcount = gridcount + 1
	garden.gridcount = gridcount
	
	return true	
end

-- 下发果园数据
function send_garden_data(sysarg)	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.garder_data) -- 果园数据
	
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	
	if garden == nil then
		garden_init(sysarg)
		garden = var.garden
	end

	-- 土地数量
	local gridcount = garden and garden.gridcount or 0
	DataPack.writeByte(netPack, gridcount)
	if gridcount <= 0 then
		DataPack.flush(netPack)
		return
	elseif gridcount > 18 then		
		gridcount = 18
		garden.gridcount = gridcount
		
		local actorid = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("error,garden gridcount="..gridcount..",大于18,actorId="..actorid)
	end
	
	for i=1, gridcount do
		local grid = garden.grids[i]
		DataPack.writeUInt(netPack, grid[1]) -- 0土地等级 1土地状态 23土地种子
		DataPack.writeUInt(netPack, grid[2]) -- 果实成熟时间
	end	
	
	DataPack.flush(netPack)
end

-- 下发土地数据
function send_garden_grid_data(sysarg, grid_idx, grid)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.grid_data) -- 土地数据
	DataPack.writeByte(netPack, grid_idx) 
	DataPack.writeUInt(netPack, grid[1]) -- 0土地等级 1土地状态 23土地种子
	DataPack.writeUInt(netPack, grid[2]) -- 果实成熟时间
	DataPack.flush(netPack)
end

-- 下发有果实成熟了
function send_garden_fruit_ripe(sysarg, ripe_count)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.fruit_ripe) -- 果实成熟		
	DataPack.flush(netPack)
end

-- 购买土地
function garden_buy_grid(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden	
	if garden == nil then return end
	
	-- 土地数量
	local gridcount = garden.gridcount
	if gridcount >= 18 then
		Actor.sendTipmsg(sysarg, "您的土地数量已达到最大值", ttFlyTip)
		return
	elseif gridcount < 6 then -- 1 到 6 块土地免费
		garden_add_grid(sysarg, garden)	
		send_garden_data(sysarg)	
		Actor.sendTipmsg(sysarg, "您的土地已成功增加到了"..(gridcount+1).."块", ttFlyTip)
		return
	end
	
	local gridcfg = garden_cfg.grid_list[gridcount - 6 + 1]
	if gridcfg == nil then return end
		
	local myVipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
	if myVipLevel < gridcfg[1] then -- 需要VIP等级
		Actor.sendTipmsg(sysarg, "请您到达VIP"..(gridcfg[1]).."后再来吧", ttFlyTip)
		return
	end
	
	local needyb = gridcfg[2]
	if needyb > 0 then
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < needyb then
			SendRecommendTips(sysarg,"1")
			return
		end
		
		if not Actor.changeMoney(sysarg, mtYuanbao, -needyb, LogIds.BuyGardenGrid, tostring(gridcount + 1)) then
			return
		end
	end
	
	if garden_add_grid(sysarg, garden) == false then
		local actorid = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("error,buy garden grid fail, current gridcount="..gridcount..",actorId="..actorid..",myVipLevel="..myVipLevel)
		Actor.sendTipmsg(sysarg, "购买土地失败", ttFlyTip)
		return
	end

	send_garden_data(sysarg)
	
	Actor.sendTipmsg(sysarg, "您的土地已成功增加到了"..(gridcount+1).."块", ttFlyTip)
end

-- 升级土地
function garden_upgrade_grid(sysarg, packet)
	-- 土地索引（从1开始）
	local grid_idx = DataPack.readByte(packet)
	if grid_idx < 1 or grid_idx > 18 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden == nil then return end
	
	if grid_idx > garden.gridcount then
		return
	end
	
	local grid = garden.grids[grid_idx]
	if grid == nil then return end
	
	local val1 = grid[1] -- 0土地等级 1土地状态 23土地种子
	if val1 == nil then return end
	
	local grid_level = System.getIntByte(val1, 0)
	if grid_level >= 3 then
		Actor.sendTipmsg(sysarg, "这块土地的等级已达到最高级：3级,不能再升级了", ttFlyTip)
		return
	end
	
	local item_id = System.getInt2Byte(val1, false)
	if item_id ~= 0 then
		Actor.sendTipmsg(sysarg, "只有空地才可以升级", ttFlyTip)
		return
	end
	
	local need_money = garden_cfg.grid_levels[grid_level + 1].money
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < need_money then
		SendRecommendTips(sysarg,"1")
		return
	end
	
	local next_level = grid_level + 1
	local logstr = string.format("%d:%d", grid_idx, next_level)
	if not Actor.changeMoney(sysarg, mtYuanbao, -need_money, LogIds.UpGardenGrid, logstr) then
		return
	end
	
	val1 = System.setIntByte(val1, 0, next_level)
	grid[1] = val1
	
	-- 下发升级结果
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.upgrade_grid) -- 升级土地
	DataPack.writeByte(netPack, grid_idx) 
	DataPack.writeByte(netPack, next_level) 
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, string.format("您的第%d块土地已成功升级到了%d级", grid_idx, next_level), ttFlyTip)	
end

-- 计算果实成熟时间
function garden_calc_fruit_ripe_time(grid_level, seed_id, seed_cfg)
	local time = seed_cfg.time -- 秒
	
	local levelcfg = garden_cfg.grid_levels[grid_level]
	if levelcfg ~= nil then
		time = time - math.floor(time * levelcfg.speed / 100)
	end
	
	if time < 0 then time = 0 end
	
	return time
end

-- 播种
function garden_sow_seed(sysarg, packet)
	-- 土地索引（从1开始）
	local grid_idx = DataPack.readByte(packet)
	if grid_idx < 1 or grid_idx > 18 then
		return
	end
	
	local seed_id = DataPack.readUInt(packet)
	
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden == nil then return end
	
	if grid_idx > garden.gridcount then
		return
	end
	
	local grid = garden.grids[grid_idx]
	if grid == nil then return end
	
	local val1 = grid[1] -- 0土地等级 1土地状态 23土地种子
	
	local item_id = System.getInt2Byte(val1, false)
	if item_id ~= 0 then -- 只有空地才可以播种
		Actor.sendTipmsg(sysarg, "不可以种在这里哦!", ttFlyTip)
		return
	end
	
	local seed_cfg = garden_get_seed_cfg(seed_id)
	if seed_cfg == nil then return end -- 不是种子
	
	local itemName = Item.getItemName(seed_id)
	if Actor.removeItem(sysarg,seed_id,1,-1,-1,-1,itemName,LogIds.GardenSowSeed) < 1 then
		return
	end
	
	local grid_level = System.getIntByte(val1, 0)
	
	val1 = System.setInt2Byte(val1, false, seed_id)
	grid[1] = val1
	local ripe_time = garden_calc_fruit_ripe_time(grid_level, seed_id, seed_cfg)
	local curTime = System.getCurrMiniTime()
	ripe_time = curTime + ripe_time
	grid[2] = ripe_time	
			
	-- 下发播种结果
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.sow_seed) -- 播种
	DataPack.writeByte(netPack, grid_idx) 
	DataPack.writeUInt(netPack, seed_id) 
	DataPack.writeUInt(netPack, ripe_time) -- 果实成熟时间
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, string.format("您在第%d块土地上种下了%s", grid_idx, itemName), ttFlyTip)
	
	garden_check_grids(sysarg)
end

-- 摘取果实
function garden_pick_fruit(sysarg, packet)
	-- 土地索引（从1开始）
	local grid_idx = DataPack.readByte(packet)
	if grid_idx < 1 or grid_idx > 18 then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden == nil then return end
	
	if grid_idx > garden.gridcount then
		return
	end

	local grid = garden.grids[grid_idx]
	if grid == nil then return end
	
	local val1 = grid[1] -- 0土地等级 1土地状态 23土地种子
	local ripe_time = grid[2]
	
	local seed_id = System.getInt2Byte(val1, false)
	if seed_id == 0 then -- 没种有种子
		Actor.sendTipmsg(sysarg, "不能对空地进行这个操作!", ttFlyTip)
		return
	end
	
	local curTime = System.getCurrMiniTime()
	if ripe_time > curTime then
		Actor.sendTipmsg(sysarg, "果实还没成熟！不能摘取", ttFlyTip)
		return
	end
	
	local grid_state = System.getIntByte(val1, 1)
	local f = System.getIntBit(grid_state, 1) -- 1:果实已摘	
	if (f ~= 0) then
		Actor.sendTipmsg(sysarg, "果实已摘!", ttFlyTip)
		return
	end
	
	local seed_cfg = garden_get_seed_cfg(seed_id)
	if seed_cfg == nil then return end
	
	-- 土地等级只控制时间，不控制产量
	if not Awards.CheckBagGridCount(sysarg, seed_cfg.award) then
		return
	end

	if Awards.GiveNoCheck(sysarg, seed_cfg.award, LogIds.GardenPickFruit, tostring(seed_id)) == false then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give error, garden_pick_fruit actorid="..actorId..",seedId="..seed_id)
	end

	-- 不需要铲，摘取果实后就变为空地
	val1 = System.setIntByte(val1, 1, 0) -- 铲除果实
	val1 = System.setInt2Byte(val1, false, 0)
		
	-- 这是需要铲的
	--grid_state = System.setIntBit(grid_state, 1, true) -- 果实已摘
	--val1 = System.setIntByte(val1, 1, grid_state)
	
	
	grid[1] = val1
	grid[2] = 0

	-- 下发土地数据
	send_garden_grid_data(sysarg, grid_idx, grid)

	local msg = string.format("您成功摘取了果实:")	
	msg = msg .. BuildStringFromAllAwards(seed_cfg.award)
	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
end

--[[
-- 耕地(不需要铲，摘取果实后就变为空地)
function garden_plough(sysarg, packet)
	-- 土地索引（从1开始）
	local grid_idx = DataPack.readByte(packet)
	if grid_idx < 1 or grid_idx > 18 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden == nil then return end
	
	if grid_idx > garden.gridcount then
		return
	end
	
	local grid = garden.grids[grid_idx]
	if grid == nil then return end
	
	local val1 = grid[1] -- 0土地等级 1土地状态 23土地种子
	
	local grid_state = System.getIntByte(val1, 1)
	local f = System.getIntBit(grid_state, 1) -- 1:果实已摘	
	if (f == 0) then
		Actor.sendTipmsg(sysarg, "不能铲除", ttFlyTip)
		return
	end
	
	val1 = System.setIntByte(val1, 1, 0) -- 铲除果实
	val1 = System.setInt2Byte(val1, false, 0)
	grid[1] = val1
	grid[2] = 0
	
	-- 下发土地数据
	send_garden_grid_data(sysarg, grid_idx, grid)
	
	Actor.sendTipmsg(sysarg, "铲除成功", ttFlyTip)
end
--]]
		
-- 使用化肥
function use_fertilizer(sysarg, packet)
	-- 土地索引（从1开始）
	local grid_idx = DataPack.readByte(packet)
	if grid_idx < 1 or grid_idx > 18 then
		return
	end
	
	local fertilizer_id = DataPack.readUInt(packet)
	
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden
	if garden == nil then return end
	
	if grid_idx > garden.gridcount then
		return
	end

	local grid = garden.grids[grid_idx]
	if grid == nil then return end
	
	local val1 = grid[1] -- 0土地等级 1土地状态 23土地种子
	local ripe_time = grid[2]
	
	local seed_id = System.getInt2Byte(val1, false)
	if seed_id == 0 then -- 没种有种子
		Actor.sendTipmsg(sysarg, "不能对空地进行这个操作!", ttFlyTip)
		return
	end
	
	local curTime = System.getCurrMiniTime()
	if ripe_time <= curTime then
		Actor.sendTipmsg(sysarg, "果实已成熟！这块地不需要使用化肥了", ttFlyTip)
		return
	end
	
	local grid_state = System.getIntByte(val1, 1)
	local f = System.getIntBit(grid_state, 0) -- 0:使用了化肥
	if (f ~= 0) then
		Actor.sendTipmsg(sysarg, "一个种子只能使用一次化肥", ttFlyTip)
		return
	end
	
	local fertilizer_cfg = garden_get_fertilizer_cfg(fertilizer_id)
	if fertilizer_cfg == nil then return end -- 不是化肥
	
	local itemName = Item.getItemName(fertilizer_id)
	if Actor.removeItem(sysarg,fertilizer_id,1,-1,-1,-1,itemName,LogIds.GardenUseFertilizer) < 1 then
		return
	end
	
	grid_state = System.setIntBit(grid_state, 0, true) -- 0:使用了化肥
	val1 = System.setIntByte(val1, 1, grid_state)
	grid[1] = val1
	
	local diff = ripe_time - curTime
	diff = math.floor(diff * fertilizer_cfg.speed / 100)
	ripe_time = ripe_time - diff
	if ripe_time < 0 then ripe_time = 0 end
	
	grid[2] = ripe_time
	
	-- 下发使用化肥结果
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGardenModule)
	DataPack.writeByte(netPack, s2c_garden_msgids.use_fertilizer) -- 使用化肥
	DataPack.writeByte(netPack, grid_idx) 
	DataPack.writeUInt(netPack, fertilizer_id) 
	DataPack.writeUInt(netPack, ripe_time) -- 果实成熟时间
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, string.format("您在第%d块土地上使用了化肥%s", grid_idx, itemName), ttFlyTip)
	
	garden_check_grids(sysarg)
end
	
function garden_OnPlayerLogin(sysarg, isCrossDay, var)
	if var.garden ~= nil then
		garden_check_grids(sysarg)
	end
end

function on_garden_fruit_ripe(sysarg, garden, grid_idx, grid)
end

-- 返回（成熟的果实数，下次果实成熟的时间）
function garden_check_for_fruit_ripe(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local garden = var.garden	
	if garden == nil then return 0, 0 end
		
	local gridcount = garden.gridcount
	if gridcount <= 0 then return 0, 0 end	
	if gridcount > 18 then gridcount = 18 end
	
	local grids = garden.grids
	if grids == nil then return 0, 0 end	
	
	local curTime = System.getCurrMiniTime()	
	local ripe_count = 0
	local next_ripe_time = 0
	
	for i=1, gridcount do
		local grid = grids[i]
		local end_time = grid[2]
		
		if end_time > 0 then		
			if end_time <= curTime then
				ripe_count = ripe_count + 1
				on_garden_fruit_ripe(sysarg, garden, i, grid)
			else
				end_time = end_time - curTime
				if next_ripe_time == 0 then
					next_ripe_time = end_time
				elseif end_time < next_ripe_time then
					next_ripe_time = end_time
				end
			end
		end
	end
	
	return ripe_count, next_ripe_time
end

function garden_check_grids(sysarg)
	Actor.deleteTimer(sysarg, ActorTimerIds.garden)
	
	local ripe_count, next_ripe_time = garden_check_for_fruit_ripe(sysarg)
	if next_ripe_time > 0 then
		Actor.addTimer(sysarg, ActorTimerIds.garden, next_ripe_time*1000)
	end
	
	if ripe_count > 0 then
		send_garden_fruit_ripe(sysarg, ripe_count)
	end
end

-- 返回下次回调的间隔，返回 0 则删除定时器
function on_garden_timer_cb(sysarg)
	local ripe_count, next_ripe_time = garden_check_for_fruit_ripe(sysarg)
	
	if ripe_count > 0 then
		send_garden_fruit_ripe(sysarg, ripe_count)
	end
	
	return next_ripe_time
end

-- 客户端消息
function on_msg_garden(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cGardenModule then
		print("error on_msg_garden, sysid="..sysid)
		return
	end
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < garden_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, garden_cfg.need_level), ttFlyTip)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 下发果园数据
		send_garden_data(sysarg)
	elseif msgid == 2 then -- 购买土地
		garden_buy_grid(sysarg, packet)
	elseif msgid == 3 then -- 升级土地
		garden_upgrade_grid(sysarg, packet)
	elseif msgid == 4 then -- 播种
		garden_sow_seed(sysarg, packet)
	elseif msgid == 5 then -- 摘取果实
		garden_pick_fruit(sysarg, packet)
	elseif msgid == 6 then -- 耕地(不需要铲，摘取果实后就变为空地)
		--garden_plough(sysarg, packet)
	elseif msgid == 7 then -- 使用化肥
		use_fertilizer(sysarg, packet)
	else
		print("error on_msg_garden, unknown msgid="..msgid)
		return
	end
end
