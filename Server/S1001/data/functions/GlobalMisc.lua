--全局的比较零散的函数，放在这里,被全局脚本包含 

--管理每日记录数据的key
DayAnswerCount = "dayAnswerCount"
ActorSmithCount = "actorSmithCount"
DayWishBottle = "daywishbottle"
FireworkGiveExp = "fireworkGiveExpCount"
MyBottleCount = "MySelfBottleCount"
FestivalFire = "FestivalFireCnt"

--玩家开始游戏要执行的参数
function startPlay(sysarg)
	--添加初始的任务
	
	--角色大于10级的，重做任务的话是有问题的。
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel>10 then 
		return 
	end
	
	local sceneId = Actor.getSceneId(sysarg)
	local qId = FirstEnterQuestMap[sceneId]

	if qId then
		Actor.addQuest(sysarg, qId)
	else
		--print("sceneId====",sceneId)
	end	

	--炎龙传奇主线任务相关
	Actor.addQuest(sysarg,5000);
	Actor.addQuest(sysarg,5001);
	set_taskflags_val(sysarg, 1)
	Quest_ShuaXin(sysarg)	
	--自动寻路点击"新手接待员" 
	Actor.autoFindPathToNpc( sysarg, Actor.getSceneId(sysarg), Lang.EntityName.n00002 )
end

function checkFirstQuest(sysarg)

	if Actor.getQuestCount(sysarg) == 0 then
		local boResult = true
		for k, qid in pairs(FirstEnterQuestMap) do
			if Actor.isFinishQuest(sysarg, qid) then
				boResult = false
				break
			end
		end
		if boResult then
			Actor.openDialogs(sysarg,diStartPlay)
		end
	end
end

--检查活动礼包各种卡
--[[
	4、内测新手卡；
	5、好评卡（100万张）；
	6、VIP特权礼包（5万张）；
	7、王者礼包（5万张）；
--]]
function checkNewPlayerNumber(sysarg,number,typeid)
	checkPlayerNumber(sysarg,number,typeid)
end

function checkPlayerNumber(sysarg,number,type)
	if (not number) then return false end
	--设置动态变量 用于判断输入窗口类型 
	local sDvar = Actor.getDyanmicVar(sysarg)
	--sDvar.getRewardCodeBag = tonumber(type)  --增值类型  用于限制每个按钮只能固定输入类型 

	sDvar.getRewardCodeBag = 0
	Actor.queryServicesAddCard(sysarg, number, true)
end

--传送到某个场景
function telportScene(sysarg,sceneid,x,y)
	System.telportScene(sysarg,sceneid,x,y)
end

--打开购买某个物品的窗口
function buyThisItem(sysarg,itemId)
	Actor.openDialogs(sysarg,diBuyAnItem,itemId)
end

--什么都不执行的函数，是空函数，不要删除
function emptyFunc(sysarg)
end

--什么都不执行的函数，是空函数，不要删除
function cancelFunction(sysarg)
end


function ResetDayData(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	sVar.TodayFalgs = {}
end

--获取当天的一些标记
function getTodayFlag( sysarg, key )
	local sVar = Actor.getStaticVar(sysarg)
	if not sVar.TodayFalgs then
		sVar.TodayFalgs = {}
	end
	return sVar.TodayFalgs[key]
end

--设置当天的一些标记
function setTodayFlag(sysarg, key, value )
	local sVar = Actor.getStaticVar(sysarg)
	if not sVar.TodayFalgs then
		sVar.TodayFalgs = {}
	end
	sVar.TodayFalgs[key] = value
end


-- 现时是否在时间段内
-- 时间是个table， {year=2013, month=2, day=17, hour=0,min=0,sec=0}
function CheckTime(starTime, endTime)	
	if  ((not starTime) or  (not endTime)) then return false; end
	return System.isInDateRange(starTime.year,starTime.month,starTime.day,starTime.hour,starTime.min,starTime.sec,
								endTime.year,endTime.month,endTime.day,endTime.hour,endTime.min,endTime.sec);
end

--检查背包格子数是否够
function gCheckBagGrids( sysarg, rewardCfg)
	local count = 0
	for k, v in ipairs( rewardCfg or {} ) do
		if v.type == 0 then
			count = count + Item.getAddItemNeedGridCount( sysarg, v.id, v.count, v.quality or 0, v.strong or 0)
		end
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < count then
		Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count), ttFlyTip)
		return false
	end
	return true
end