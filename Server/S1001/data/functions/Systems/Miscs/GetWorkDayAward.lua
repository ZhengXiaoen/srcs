
--#include "data\config\activity\seckill.lua" once	--快乐上班
--#include "data\functions\Activity\Common\Consumes.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

MiscsImplement.GetWorkDayAward = function (sysarg, msgid, packet)
	
	local id = DataPack.readWord(packet) or 0	--活动id
	local isRepCost = DataPack.readByte(packet) or 0	--是否用元宝替代
	local model = DataPack.readByte(packet) or 0	--秒模式  0秒全部 1秒单次
	
	
	-- print("id="..id)
	-- print("isRepCost="..isRepCost)
	
	local result, consumes, awards = GetSeckillConsumesAndAwards(sysarg,id,model)
	if result ~= true then
		return 
	end
	
	if Consumes.SuccessCheck(sysarg, consumes, isRepCost) ~= successCheckResult.ok then 
		return
	end
	
	if Awards.CheckBagGridCount(sysarg, awards) ~= true then
		return
	end
	
	if Consumes.OnConsumes(sysarg, consumes, isRepCost, 0, 101,  Lang.Activity.l00097) ~= successCheckResult.ok then 
		return
	end
	
	if Awards.Give(sysarg, awards, 100, Lang.Activity.l00097) ~= true then
		return
	end
	if model == 1 then
		for i = 1, 3 do 
			if Actor.getWorkDayMask(sysarg, i, id) == false then
				Actor.setWorkDayMask(sysarg, i, id, true)
				break
			end
		end
	else
		for i = 1, 3 do 
			Actor.setWorkDayMask(sysarg, i, id, true)
		end
		
	end
	
	SendSeckillResult(sysarg, result)
	Actor.sendTipmsg(sysarg, Lang.Activity.a00204, ttFlyTip)
end

MiscsImplement.GetWorkDayConsumes = function (sysarg, msgid, packet)
	local id = DataPack.readWord(packet) or 0	--活动id
	
	local result, consumes, awards = GetSeckillConsumesAndAwards(sysarg,id)
	if result ~= true then
		return 
	end
	
	local npack = DataPack.allocPacket(sysarg, 139, 57)
	if not npack then return false end
	DataPack.writeShort(npack, id)
	
	DataPack.writeShort(npack, consumes[1].count)
	-- print("consumes[1].count:"..consumes[1].count)
	local count = table.getn(awards)
	DataPack.writeShort(npack, count)
	for k, v in pairs(awards) do
		-- print("type:"..v.type)
		-- print("id:"..v.id)
		
		DataPack.writeByte(npack, v.type)
		DataPack.writeInt(npack, v.id)
		local count = v.count
		if v.type == 20 then
			count = Actor.getActivityExp(sysarg, v.id, v.count, v.quality)
		end
		-- print("count:"..count)
		DataPack.writeInt(npack, count)
	end
	DataPack.flush(npack)
	return true
end



function SendSeckillResult(sysarg, result)
	local npack = DataPack.allocPacket(sysarg, 139, 58)
	if not npack then return false end
	DataPack.flush(npack)
	return true
end

function GetSeckillConsumesAndAwards(sysarg,id,model)
	local config = SecKill
	if not config then return false end

	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK1DAY))
	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK2DAY))
	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK3DAY))
	
	local index = 0
	for k, v in ipairs(config) do
		if v.id == id then
			index = k
		end
	end
	if index == 0 then return false end
	
	local workday = config[index]
	
	local times = 0
	for i = 1, 3 do 
		if Actor.getWorkDayMask(sysarg, i, id) == false then
			times = times + 1
		end
	end
	
	if times == 0 then return false end
	
	if model == 1 then	--领取单次
		times = 1
	end
	
	local consumes = {{type = 0, id = workday.consume.itemId, count = workday.consume.count*times, yb = workday.consume.yb}}
	
	local awards = {}
	for k, v in ipairs(workday.awards) do 
		local qualitytem = v.quality
		if not qualitytem then
			qualitytem = 0
		end
		local award = {type = v.type, id = v.id, count = v.count*times, quality = qualitytem, strong = v.strong, bind = v.bind}
		table.insert(awards, award)
	end
	
	return true, consumes, awards
end

MiscsImplement.registerMsgHandler(65, MiscsImplement.GetWorkDayConsumes)
MiscsImplement.registerMsgHandler(67, MiscsImplement.GetWorkDayAward)
