-- 征途模块 -----------------------------------

--#include "data\config\modules\warpath_cfg.lua" once
--#include "data\functions\Activity\AwardConditions.lua" once


-- 点亮节点
function warpath_enable_node(sysarg, packet)
	-- 征途节点ID，从 1 开始
	local nodeId = DataPack.readByte(packet)
	if nodeId <= 0 then return end

	-- byte0:征途节点ID,byte1:战将练体等级
	local attrVal = Actor.getIntProperty(sysarg, PROP_ACTOR_WARPATH_ID)	
	local curNodeId = System.getIntByte(attrVal, 0)
	if (curNodeId + 1) ~= nodeId then
		Actor.sendTipmsg(sysarg, "请您按顺序点亮征途之魂", ttFlyTip)
		return
	end
	
	local nodeCfg = warpath_cfg.path[nodeId]
	if nodeCfg == nil then
		Actor.sendTipmsg(sysarg, "您已经点亮了所有的征途之魂", ttFlyTip)
		return
	end
	
	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < nodeCfg.level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, nodeCfg.level), ttFlyTip)
		return
	end
	
	if nodeCfg.conditions ~= nil then
		for _, cond in ipairs(nodeCfg.conditions) do
			local func = AwardConditionCheck[cond.type]
			if func == nil then
				print("error: warpath_enable_node() AwardConditionCheck["..cond.type.."]==nil")
				return
			end
			
			-- 检查领取条件
			local condResult = func(sysarg, cond.params)
			if condResult == nil or condResult == false then
				local str = GetAwardConditionStringFromType(cond.type)
				if str == nil then
					Actor.sendTipmsg(sysarg,"你的条件不满足，无法点亮该征途之魂",ttFlyTip) -- 条件不满足
				else
					Actor.sendTipmsg(sysarg,"你的条件["..str.."]不满足，无法点亮该征途之魂",ttFlyTip) -- 条件不满足
				end
				return
			end
		end
	end

	if nodeCfg.consume ~= nil then
		local consumeData = {}
		local ret = CheckAllConsume(sysarg, false, nodeCfg.consume, true, consumeData)
		if not ret then return end
	
		ret = DeductAllConsume(sysarg, false, nodeCfg.consume, GameLog.cWarpathConsume)
		if not ret then return end
	end

	local is_hit = true -- 是否命中
	if nodeCfg.ratio ~= nil and nodeCfg.ratio < 10000 then
		local rnd = System.getRandomNumber(10000)
		if rnd > nodeCfg.ratio then
			is_hit = false
		end
	end
	
	if is_hit == false then
		Actor.sendTipmsg(sysarg, "对不起，点亮征途之魂失败，请您再接再厉！", ttFlyTip)
		return
	end
	
	attrVal = System.setIntByte(attrVal, 0, curNodeId + 1)
	Actor.setIntProperty(sysarg, PROP_ACTOR_WARPATH_ID, attrVal)
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	Actor.sendTipmsg(sysarg, "您成功点亮了征途之魂:"..(curNodeId + 1).."个", ttFlyTip)
end

-- 客户端消息-征途
function on_msg_warpath(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cWarpathModule then
		print("error on_msg_warpath, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 点亮节点
		warpath_enable_node(sysarg, packet)		
	else
		print("error on_msg_warpath, unknown msgid="..msgid)
		return
	end

end


--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cWarpathModule, on_msg_warpath)
