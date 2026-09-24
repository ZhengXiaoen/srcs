--#include "data\config\modules\office_cfg.lua" once

-- 激活军印
function activate_office(sysarg, packet)
	if not Actor.checkActorLevel(sysarg, office_cfg.activated_level, 0) then				
		Actor.sendTipmsg(sysarg, string.format("激活军印需要%d级,努力升级吧", office_cfg.activated_level), ttFlyTip)	
		return 
	end
	
	local cur_level = Actor.getUIntProperty(sysarg, PROP_ACTOR_OFFICE)
	if cur_level > 0 then
		return -- 已经激活了
	end
	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_OFFICE, 1)
	Actor.collectOperate(sysarg,0)	
	Actor.triggerAchieveEvent(sysarg, 102, 1)
	
	-- ranking_type_office 		// 军印榜
	local newpos, oldpos = System.rankingUpdateValue(2, sysarg, 1, 0)
	
	Actor.sendTipmsg(sysarg, "您的军印已经成功激活", ttFlyTip)	
	
	local name=Actor.getName(sysarg)
	
	if System.getDaysSinceOpenServer() ==1 then  
		local tip= string.format("恭喜玩家<(n%s)>成功激活军印,<我要激活/@@showWin,129>",name)
		System.broadcastTipmsg(tip,ttChatWindow)
	end
	OnFinish_Liveness(sysarg,21)--触发活跃度
	
end

-- 升级军印
function upgrade_office(sysarg, packet)
	local cur_level = Actor.getUIntProperty(sysarg, PROP_ACTOR_OFFICE)
	if cur_level == 0 then
		-- 激活军印
		activate_office(sysarg, packet)
		return
	end	
	local next_cfg = office_cfg.level_list[cur_level + 1]
	if next_cfg == nil then
		Actor.sendTipmsg(sysarg, "您的军印已经升到最高级了!", ttFlyTip)	
		return
	end

	--开启等级
	local need_level = next_cfg.need_level
	if not Actor.checkActorLevel(sysarg,need_level[2], need_level[1]) then
		local msg
		if need_level[1] == 0 then
			msg = string.format("进阶当前军印需要%d级,努力升级吧", need_level[2])
		else
			msg = string.format("进阶当前军印需要%d转%d级,努力升级吧", need_level[1], need_level[2])
		end
		

		Actor.sendTipmsg(sysarg ,msg, ttFlyTip)		
		return 
	end

	--检查消耗
	local consumeData = {}
	local result = CheckOneConsume(sysarg, false, next_cfg.consume, true, consumeData)
	if not result or result == false then 
		return 
	end

	--扣除消耗
	result = DeductOneConsume(sysarg, false, next_cfg.consume, LogIds.OfficeUpgrade, tostring(cur_level + 1))
	if not result or result == false then 
		return
	end	

	Actor.setUIntProperty(sysarg, PROP_ACTOR_OFFICE, cur_level + 1)
	Actor.collectOperate(sysarg,0)
	
	Actor.triggerAchieveEvent(sysarg, 102, cur_level + 1)
	
	-- ranking_type_office 		// 军印榜
	local newpos, oldpos = System.rankingUpdateValue(2, sysarg, cur_level + 1, cur_level)
	
	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local jobcfg = next_cfg.jobs[job]
	if jobcfg ~= nil and jobcfg.name then
		--Actor.sendTipmsg(sysarg, "您的军印提升到<(c0xFF00FF00)".. jobcfg.name..">", ttFlyTip)
		if System.getDaysSinceOpenServer() ~=1 then  --不是第一天就有限制显示
			if cur_level>=20 and cur_level % 5 == 0 then 
				Actor.sendTipmsg(sysarg, "您的军印星级提升成功!", ttFlyTip)
				local name=Actor.getName(sysarg)
				
				local tip= string.format("恭喜玩家<(n%s)>军印的军阶提升成功,<我要提升/@@showWin,129>",name)
				System.broadcastTipmsg(tip,ttChatWindow)
			end
		else 
			Actor.sendTipmsg(sysarg, "您的军印星级提升成功!", ttFlyTip)
			local name=Actor.getName(sysarg)
			
			local tip= string.format("恭喜玩家<(n%s)>军印的军阶提升成功,<我要提升/@@showWin,129>",name)
			System.broadcastTipmsg(tip,ttChatWindow)
		end
	end
	OnFinish_Liveness(sysarg,21)--触发活跃度
end

-- 客户端消息-军印
function on_msg_office(sysarg, sysid, packet)
	
	if sysid ~= LogicCmd.miscSys.sub.cOfficeModule then
		print("error on_msg_office, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 升级或者激活
		upgrade_office(sysarg, packet)
	else
		print("error on_msg_office, unknown msgid="..msgid)
		return
	end

end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cOfficeModule, on_msg_office)