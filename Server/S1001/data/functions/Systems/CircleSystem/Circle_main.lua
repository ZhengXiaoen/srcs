--NPC执行：转生老人（盟重土城）

--#include "data\config\circle\CircleConsumes.lua" once	--转生消耗配置
--#include "data\functions\Activity\Common\Consumes.lua" --消耗 通用
--#include "data\functions\Consume.lua" once

--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function Circle_Main(sysarg)
	local config = Circle.CircleConsumes
	if (not config) then return "" end
	local userName = Actor.getName(sysarg)
	
	local cultureLeve = 0 --System.getCultureLevel()--获取世界文明等级
	local maxCircle = System.getMaxCircleTimes()		--当前能转生的最大次数

	local circle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local circleSoul = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL)
	local str = string.format(Lang.ScriptTips.c000001,userName, cultureLeve, maxCircle, circle, circleSoul)

	if circle < maxCircle then
		if circle < table.getn(config) then
			str = str.."\\<#BL"..string.format(Lang.ScriptTips.c000002, circle+1).."/@AskCircle, "..(circle+1)..">"  --<我要进行x+1次转生>
		end
	end
	if config[circle+1] then
		str = str.."\\<#BL"..Lang.ScriptTips.c000003.."/@AboutCircle>"  --<转生说明>
	end
	
	return str
end


--我要进行nCircle次转生
function AskCircle(sysarg, nCircle)

	local nCircle = tonumber(nCircle)
	local config = Circle.CircleConsumes[nCircle]
	if not config then
		System.trace("Can not find CircleConsumes config, circle="..nCircle)
		return 
	end
	
	local maxCircle = System.getMaxCircleTimes()		--当前能转生的最大次数
	if (nCircle-1) >= maxCircle then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000063, maxCircle), ttFlyTip)
		return
	end

	--条件检测
	local bCheck, nReqSoul, reqGold = CheckCircleCondition(sysarg, false, config)
	
	if bCheck ~= true then return end
	
	--消耗检测
	if Consumes.Check(sysarg, config.consumes) ~= true then
		return
	end
	local currentLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local sAskMsg = string.format(Lang.ScriptTips.c000004, nReqSoul, reqGold, nCircle, currentLevel-config.chgLevel)
	local NPChandle = Actor.getHandle(thisNPC)
	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,Lang.ScriptTips.c000005.."/OnCircle,"..nCircle,Lang.ScriptTips.c000006.."/Cancel",nil)
	
end

--转生条件检测
function CheckCircleCondition(sysarg, isProtect, config)

	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < config.reqLevel then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000007, config.reqLevel), ttFlyTip)
		return false, 0
	end	
		
	local reqSoul = 0
	for k, v in ipairs(config.consumes) do
		if v.type == 22 then 
			reqSoul = v.count
		end
		if v.type == 6 then
			reqGold = v.count
		end
	end

	local cSoul = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL)
	if cSoul < reqSoul then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000008, reqSoul), ttFlyTip)
		return false, reqSoul
	end
	
	--[[local consumeData = {}
	local result = CheckAllConsume(sysarg,false, config.Gold,true,consumeData)	
	if result == true then
		if isProtect == nil or isProtect == false or config.Protect == nil then
			return true, 1, reqGold
		end
		
		result = CheckAllConsume(sysarg,false, config.Protect,true,consumeData)
		if result == true then
			return true, 1, reqGold
		end
	end--]]
	
	--[[consumeData = {}
	result = CheckAllConsume(sysarg,false, .cconfigonsumes,true,consumeData)
	if result == true then
		if isProtect == nil or isProtect == false or config.Protect == nil then
			return true, 2, reqGold
		end
		
		result = CheckAllConsume(sysarg,false, config.Protect,true,consumeData)
		if result == true then
			return true, 2, reqGold
		end
	end	--]]
	
	return true, reqSoul, reqGold
end

--保存曾经到达过的最高等级
function AddOnceLevels( sysarg , nCurrentLevel)
	local var = Actor.getStaticVar( sysarg )
	if not var.OnceLevel then
		var.OnceLevel=0
	end
	if nCurrentLevel>var.OnceLevel then
	var.OnceLevel = nCurrentLevel
	end
end

function CircleHandleImpl(sysarg, nCircle, isProtect)
	
	local config = Circle.CircleConsumes[nCircle]
	if not config then
		System.trace("Can not find CircleConsumes config, circle="..nCircle)
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00119,ttFlyTip)
		return 1
	end
	
	--条件检测
	local bCheck, nReqSoul = CheckCircleCondition(sysarg, isProtect, config)
			
	if bCheck ~= true then return 2 end
	local  bResult = 0
	
	local currentSoul = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE_SOUL)
	Actor.setIntProperty(sysarg,PROP_ACTOR_CIRCLE_SOUL,currentSoul - nReqSoul)

	local currentLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	
	--转生
	Actor.setActorCircle(sysarg, nCircle,currentLevel-config.chgLevel)
	--保存总共掉落的级别
	AddOnceLevels(sysarg, currentLevel)
	
	Actor.triggerAchieveEvent(sysarg, 78,nCircle)

--	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.c000024,nCircle), ttScreenCenterBigNotice)
	return 0
end

--转生
function OnCircle(sysarg, nCircle)

	local nCircle = tonumber(nCircle)
	local optResult = CircleHandleImpl(sysarg, nCircle)
	if optResult == 0 then
		return string.format(Lang.ScriptTips.c000009, nCircle)
	end
end

function Cancel(sysarg)
end

function AboutCircle(sysarg)
	
	local config = Circle.CircleConsumes
	local circle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local str = string.format(Lang.ScriptTips.c000010,config[circle+1].reqLevel)
	str = str.."\\<#BL"..Lang.ScriptTips.c000011.."/@main>"
	return str
end

table.insert(MainFnTable, Circle_Main)
