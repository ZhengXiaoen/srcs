--#include "data\config\activity\RatherActivitityConfig.lua" once

--数组查找指定数据
local function ArrayFind(arr, value)
	for k, v in pairs(arr) do
		if value == v then
		return true
		end
	end
	
	return false
end

--活动开启
--这样有问题,如果是在活动期间服务器重启了,那么重启之后,活动不会继续
function ActivityStart(type, value)
	--判断是不是存在,存在删除下
	ActivityEnd()

	--注册定时回调函数
	System.registerTimeCall(NULL, "ActivityAddExp", NULL, 1, false, type, value)
end

--活动结束
function ActivityEnd()
	--删除定时器
	local timerH = System.getTimeCall(NULL, "ActivityAddExp")
	if timerH then
		System.unregisterTimeCall(timerH)
	end
end

function ActivityAddExp(type, value)
	--多个区域,遍历进行奖励
	for k, Area in pairs(Activities.ActivitieArea) do
		if Area then
			--获取场景的handle
			local scenehandle = Fuben.getSceneHandleById(Area.SceneID, 0)
			
			--给奖励
			Fuben.giveSceneAllMemberAward(scenehandle, Area.AreaIndex, type, value)
		end
	end
end

--活动期间抽奖前五分钟的提示
function ActivityNotice(level)
	--5分钟后，幸运大抽奖即将抽出本次的%d等奖！大家不要下线哦！
	System.broadcastTipmsg(string.format(Lang.ScriptTips.gather00001, level), 128 + 2)
end

--[[
	抽奖活动规则:
		1.只计算50级以上的角色
		2.如果50级以上的角色超过70个,那么中过奖的人不允许再次中奖.否则反之.
		3.同一次抽奖当然不允许一个人中两份奖
]]

--活动期间的抽奖
function ActivityLuckDraw(index)	
	--获取配置
--	local config = Activities.ActivitiesLuckDraw[tonumber(index)]
--	if not config then
--		print("抽奖活动,索引[" .. index .. "]获取失败!")
--		return
--	end

--	--人数判定,大于这个值,中奖人不重复,小于这个值,中奖人可以重复
--	local ActorNumLimit = 70
--	local CanRepeat = false

--	--随机玩家进行奖励
--	local finderlist = {}	--保存已经中奖后又被随机到的
--	local finderlistsize = 0

--	--获取在线列表,按策划要求,只计算50级以上的
--	local AllActorList = LuaHelp.getAllActorList(50)
--	if not AllActorList then
--		return
--	end

--	--查找个数
--	local findcount = config.actorcount
--	local onlineCount = #AllActorList
--	--先查看下在线人数是不是比要找的人少啊...省的死循环
--	if onlineCount < findcount then
--		findcount = onlineCount
--	end

--	--判定下人数要求
--	if ActorNumLimit > onlineCount then
--		CanRepeat = true
--	end

--	--保存抽到的角色名字用于广播
--	local AwardNameList = ""

--	--随机到的人数
--	local findernum = 1
--	while findernum <= ActivityLuckDraw do
--		--从在线数量里随机一个
--		local num = System.getRandomNumber(onlineCount) + 1

--		--检查角色
--		local sysarg = AllActorList[num]
--		if nil ~= sysarg then

--			--判断是不是本次抽取到过
--			if not ArrayFind(finderlist, num) then
--				--本次没抽取到,可以被抽取

--				--判断是不是允许重复和已中奖
--				local var = Actor.getStaticVar(sysarg)
--				if CanRepeat or not var.activityLuckDraw then
--					--如果允许重复,或者没中奖,则可以中奖
--					for k, award in pairs(config.item) do
--						if award then
--							Actor.giveAward(sysarg, award.type, award.id, award.value, award.quality, award.strong, award.bindflag, 0, 0, "ActivityLuckDraw")
--						end
--					end

--					--然后抽中的玩家给个提示框：
--					--恭喜您成为本次幸运抽奖的X等奖，奖励自动发放背包，请查收！
--					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gather00002, index), 4)

--					--保存名字
--					if 1 ~= findernum then
--						AwardNameList = AwardNameList .. ","
--					end

--					AwardNameList = AwardNameList .. Actor.getName(sysarg)

--					--索引+1
--					findernum = findernum + 1	
--					--设置已中奖
--					var.activityLuckDraw = 1

--					--加入到列表
--					finderlist[finderlistsize] = num
--					finderlistsize = finderlistsize + 1
--				else
--					--这样要减去一个
--					onlineCount = onlineCount - 1
--					if onlineCount < findcount then
--						findcount = onlineCount
--					end
--				end
--			end
			
			
			
			--[[local var = Actor.getStaticVar(sysarg)
			if not var.activityLuckDraw then
				--没中过奖,循环发放奖品
				for k, award in pairs(config.item) do
					if award then
						Actor.giveAward(sysarg, award.type, award.id, award.value, award.quality, award.strong, award.bindflag, 0, 0, "ActivityLuckDraw")
					end
				end
				
				--然后抽中的玩家给个提示框：
				--恭喜您成为本次幸运抽奖的X等奖，奖励自动发放背包，请查收！
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gather00002, index), 4)
				
				--保存名字
				if 1 ~= findernum then
					AwardNameList = AwardNameList .. ","
				end
				
				AwardNameList = AwardNameList .. Actor.getName(sysarg)
				
				--索引+1
				findernum = findernum + 1	
				
				--如果不允许重复的话,则设置已中奖
				if not CanRepeat then
					var.activityLuckDraw = 1
				end
			else
				--以下操作是为了防止在线人数少于需求人数且其中有人已经中奖过,会一直遍历随机查找造成死循环
				--如果角色中奖过,那就要在在线人数里面减去一个
				--如果角色被随机到两次????就多减了一次....
				if not ArrayFind(finderlist) then
					onlineCount = onlineCount - 1
					if onlineCount < findcount then
						findcount = onlineCount
					end
					
					--加入到列表
					finderlist[finderlistsize] = num
					finderlistsize = finderlistsize + 1
				end
			end]]
--		end
--	end
	
	--抽奖结束全服提示
--	if "" ~= AwardNameList then
--		--本次幸运大抽奖抽出了X等奖%s真是新年行大运！可喜可贺！
--		System.broadcastTipmsg(string.format(Lang.ScriptTips.gather00003, index, AwardNameList), 128 + 2)
--	end
	
end