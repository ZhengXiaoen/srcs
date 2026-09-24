
--#include "AutoRun.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "..\CombineActivity\MysiticShopOp.lua" once

function AddExp_Init(npcobj)
	
	if not thisNPC then return end
	local config = HotSpringConfig
	if Actor.getSceneId(thisNPC) ~= config.actArea.sid then return end
	Actor.unregScriptCallback(thisNPC, "AddExp")
	--注册个时间
	local result = Actor.regScriptCallback(thisNPC, thisNPC, 0, config.timeAward.interval*1000, -1, "AddExp")
	if not result then 
		System.trace("Register HotSpring AddExp Error!!!")
		return 
	end
end

function AddExp()
	local config = HotSpringConfig
	local playerList = LuaHelp.getSceneActorListById(config.actArea.sid)  --获取某场景玩家对象列表
	if not playerList then return end
	local dvar = System.getDyanmicVar()
	local hotSpring = dvar.hotSpring
	
	local awards = config.timeAward.nomal
	if hotSpring then
		awards = config.timeAward.spcial
	end

	local nRate = GetCombineActivityRate()
	
	local addAwards = {}
	for k, v in ipairs(awards) do
		
		local award = {type = v.type, id = v.id, count = v.count*(1+config.timeAward.kissAdd), param = v.param}
		table.insert(addAwards, award)
	end
	
	for i = 1, #playerList do
		local player = playerList[i]
		if player then
			if Actor.hasBuff(player, config.buff.buffType, config.buff.groupId) == true then
				local giveAwards = awards
				
				if Actor.hasState(player, esStateKiss) ~= false then
					giveAwards = addAwards
				end
				if Actor.hasState(player, esStateSwim) ~= false then
					--Awards.Give(player, giveAwards, 205, Lang.LogTips.l00090)	--
					for j=1,table.getn(giveAwards) do
						local quality = giveAwards[j].quality;
						local bind = giveAwards[j].bind
						local strong = giveAwards[j].strong
						if quality == nil then quality =0 end
						if bind == nil then bind =0 end
						if strong == nil then strong =0 end
						
						Actor.giveAward(player, giveAwards[j].type,giveAwards[j].id,giveAwards[j].count * nRate,quality,strong,bind,0,205,Lang.LogTips.l00090)
					end
				end
			else
				--没BUFF踢出
				--Actor.enterScene(player, config.returnArea.sid, config.returnArea.x, config.returnArea.y)
				--Actor.sendTipmsg(player, "您的温泉时间已用完", ttFlyTip)
			end
		end
	end
	
end





table.insert(InitFnTable, AddExp_Init)