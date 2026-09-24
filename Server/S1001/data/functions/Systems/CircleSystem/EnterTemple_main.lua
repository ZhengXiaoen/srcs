--NPC执行：转生老人（盟重土城）

--#include "data\config\circle\EnterTemple.lua" once	--转生神殿消耗配置
--#include "data\functions\Activity\Common\Consumes.lua" --消耗 通用
--#include "data\config\circle\CircleConsumes.lua" once	--转生信息

--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function EnterTemple_Main(sysarg)
	local config = EnterTemple
	if (not config) then return "" end
	local str = ""
	str = str.."\\<#BL".."进入转生神殿".."/@OnEnterTemple>"  --<进入转生神殿>
	return str
end


--我要进行nCircle次转生
function EnterTemple(sysarg)
	local config = EnterTemple
	local currentLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	--条件检测
	local bCheck = CheckCircleCondition(sysarg, false, config)
	
	if bCheck ~= true then return end
	
	--消耗检测
	if Consumes.Check(sysarg, config.consumes) ~= true then
		return
	end
	
	local sAskMsg = string.format("您将消耗%d转生灵魄，转生至%d转，同时自身等级将变为%d级。是否转生？", nReqSoul, nCircle, currentLevel-config.chgLevel)
	local NPChandle = Actor.getHandle(thisNPC)

	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,"确定转生".."/OnCircle,"..nCircle,"暂不转生".."/Cancel",nil)
	
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

--转生
function OnCircle(sysarg, nCircle)
	local nCircle = tonumber(nCircle)
	local config = CircleConsumes[nCircle]
	if not config then
		System.trace("Can not find CircleConsumes config, circle="..nCircle)
		return 
	end
	
	--条件检测
	local bCheck, nReqSoul = CheckCircleCondition(sysarg, false, config)
	
	if bCheck ~= true then return end
	
	local logStr = string.format("玩家%d转", nCircle)
	local bResult = Consumes.CheckAndRemove(sysarg, config.consumes, 809, logStr)
	if bResult ~= true then return end
	local currentLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	--转生
	Actor.setActorCircle(sysarg, nCircle, currentLevel-config.chgLevel)
	--保存总共掉落的级别
	AddOnceLevels(sysarg, currentLevel)
	return string.format("恭喜您%d转成功！", nCircle)
end

function Cancel(sysarg)
end

function AboutCircle(sysarg)
	return "转生说明............"
end

table.insert(MainFnTable, EnterTemple_Main)