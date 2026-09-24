--定时调用的脚本，
--所有定时调用的脚本全部配置在config/misc/ScriptTimer.lua里，
--让策划配置在某个时间点调用什么函数，而具体调用的简单函数写在这个文件里
--现在把第二天的处理都放在Qfuntions里的player.lua里面，在线第二天会调用一次OnPlayerLogin


--#include "data\functions\SpecialQuest.lua" once
--#include "data\config\activityconfig\SwinPoolConfig.lua" once
--#include "data\functions\Activity\RscDesert\ResAutoRun.lua" once -- 资源荒地
--#include "data\config\Legion\LegionId.lua" once
function refreshZero()

	--//刷新玩家私人变量
	local players = LuaHelp.getAllActorList();
	if players then	
		for k, v in ipairs(players) do
			RefreshActorZero(v)			
			--清除玩家下次复活时间
			Actor.setReliveTimeCD(v,0)
		end
	end
	
	--行会争霸赛数据每日清除
	local sVar = System.getStaticVar()
	if sVar.EnterGuildCompete then sVar.EnterGuildCompete = nil end
	if sVar.DoubleEggWholePeople then sVar.DoubleEggWholePeople = nil end
	if sVar.BetaWholePeople then sVar.BetaWholePeople = nil end

	--ClearMonster()
end

--初始化系统全局定时器
function InitSystemTimer()
		--军团双倍经验减少定时器
	System.addTimer("LegionDoubleExpProcess",60 * 1000,-1)
	
end

function InitLegionInfo()
	local var = System.getStaticVar()
	if var.legion == nil then
		var.legion={}
		for i = 1,table.getn(LEGIONID) do
			var.legion[i]= {}
			var.legion[i].id = LEGIONID[i].ID
			var.legion[i].Master= "" --军团长
			var.legion[i].AllOffer = 0--军团总贡献值
			var.legion[i].Offer = 0 --军团长贡献值
			
			var.legion[i].Count = 0	--数量
			var.legion[i].Exp = 0 --双倍经验的分钟
		end
	end

end
--军团系统定时双倍经验
function LegionDoubleExpProcess()
	
	local sVar = System.getStaticVar()
	if sVar.legion ~= nil then
		for i = 1,table.getn(LEGIONID) do
            local id = LEGIONID[i].ID
            if sVar.legion[LEGIONID[i].ID] == nil  then sVar.legion[id] = {} end
            if sVar.legion[id].Exp == nil then sVar.legion[id].Exp = 0 end
			if  sVar.legion[LEGIONID[i].ID].Exp ~= nil and sVar.legion[LEGIONID[i].ID].Exp > 0 then
				sVar.legion[LEGIONID[i].ID].Exp = sVar.legion[LEGIONID[i].ID].Exp - 1 --一分钟
				if sVar.legion[LEGIONID[i].ID].Exp == 0 then
					System.broadcastTipmsg(LEGIONID[i].Name.."双倍经验buff已结束!", ttScreenCenter)
				end
			end
		end
	end
end


----刷新商城的动态商品
--function  refreshStore(labelId)
--    System.refreshStore(labelId)
--end
--

--每日刷新双倍活动剩余次数
function GuildPerDayRefreshDoubleActive()
	System.clearGuildDoubleActiveCount()
end
--
----定时给予战力竞技的奖励
--function CombatAwardPerDayRefresh()
--	FreshCombatAward()
--end
--
----定时给予战力竞技的提示
--function CombatAwardPerDayNotice()
--	CombatNoticeOnTime()
--end
--
----刷新元宝消费排行
--function YbConsumeRankFresh()
--	System.rfeshConsumeRank()
--end
--
----统计玩家在地图地人数
--function CountActorSceneNum()
--	System.sendActorSceneInfoToLog()
--end
--
----发送怪的死亡次数到后台
--function CountMonsterDeadToLog()
--	System.sendMonsterDeadToLog()
--end
--
----发送物品产出统计
--function CountItemOutPutToLog()
--	System.sendItemOutPutToLog()
--end
--
----新服开服双倍经验公告
--function OnOpenBroadDoubleExpMsg()
--	System.broadcastTipmsg(Lang.Activity.com018,8)
--end
--
----每半小时保存金币、元宝等日志
--function SaveMoneyComsumeLog()
--	System.sendMoneyConsumeLog()
--end