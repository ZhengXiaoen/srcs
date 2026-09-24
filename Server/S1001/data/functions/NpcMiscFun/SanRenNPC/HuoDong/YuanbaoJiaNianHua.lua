-- 元宝嘉年华
--#include "data\functions\Systems\ActivitySystem\YuanbaoJiaNianHua.lua" once

NpcDialog[204] = {}

NpcDialog[204].main = function(sysarg)
	
	local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	local times = mycfg.tOpenTime.times	
	local tbSize = #times
	local strTimes = ""

	for i=1, tbSize do
		local time = times[i]
		if i == 1 then
			strTimes = strTimes .. string.format("%02d:%02d-%02d:%02d", time[1], time[2], time[3], time[4])
		else
			strTimes = strTimes .. string.format("、%02d:%02d-%02d:%02d", time[1], time[2], time[3], time[4])
		end
	end
	
	local strRewardicon = ""
	local tbSize = #mycfg.rewardicon
	for i=1, tbSize do
		local icon = mycfg.rewardicon[i]
		if i < tbSize then
			strRewardicon = strRewardicon .. string.format("<(%s)>", icon)
		else
			strRewardicon = strRewardicon .. string.format("<(%s)", icon)
		end
	end
	local BTN=[[<#BN参加活动/@onEnterScene>]]
	local needYB = 0
	local svar = Actor.getStaticVar(sysarg)
	if svar.days.countOfCoin ==nil then 
		needYB = 0
	else 
		needYB = math.ceil (svar.days.countOfCoin/4000)
	end
	
	local canGetCount = 0 
	if svar.days.countOfCoin ~= nil then 
		canGetCount=svar.days.countOfCoin * 3 
	end
	
	local BTN2=[[				<领取三倍奖励/@FiveTimeAwards|需要]]..needYB..[[元宝,可以获得金币]]..canGetCount..[[>]]

	local echo = [[

 <(c0xFF00c0ff)活动描述><(idecoLine#350)>
 
     <(c0xFFb6946c)1.活动期间共有 ><(c0xFF00FF00)5波 ><(c0xFFb6946c)猪猪商队出现>
     <(c0xFFb6946c)2.击败他们可获得><(c0xFF00FF00)丰厚奖励>

	<重点.活动结束后可来我这里领取三倍奖励哦!>

 <(c0xFF00c0ff)参与条件><(idecoLine#350)>

     <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFF00FF00)80级以上>

     <(ifragments#16#18)><(c0xFFb6946c)活动时间: >]].."<(c0xFF00FF00)"..strTimes..[[>

     <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[>

]];

	local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	local svar = Actor.getStaticVar(sysarg)
	--if checkActivityTime(mycfg.tOpenTime.times) == 0 then--不在活动时间，并且不有参与过活动
	local dVar = System.getDyanmicVar()
	if dVar.yuanbaojianianhuaTime == nil then --不在活动时间，并且不有参与过活动
		if svar.days.countOfCoin ~= nil then 
			echo=echo..BTN2
		else 
			echo=echo..BTN
		end
	else 
		echo=echo..BTN
	end
	
	
	return echo;
end

NpcDialog[204].onEnterScene = function(sysarg)
	EnterScene_YuanbaoJiaNianHua(sysarg)	
end

NpcDialog[204].FiveTimeAwards = function(sysarg)
	local svar = Actor.getStaticVar(sysarg)
	if svar.days.countOfCoin ==nil or svar.days.countOfCoin ==0 then 
		Actor.sendTipmsg(sysarg, "没有捡到金币，没有奖励", ttFlyTip)
		return 
	end
	local moneyCount = Actor.getMoneyCount(sysarg, 3)
	if moneyCount<math.ceil (svar.days.countOfCoin/4000) then 
		Actor.sendTipmsg(sysarg, "元宝不足，无法领取奖励", ttFlyTip)
		return 
	end
	
	
	
	Actor.changeMoney(sysarg,3,-math.ceil (svar.days.countOfCoin/4000),101,"劫杀兽人3倍奖励扣除元宝")
	Actor.changeMoney(sysarg,1,svar.days.countOfCoin*3,100,"劫杀兽人3倍奖励")
	svar.days.countOfCoin =nil
	return NpcDialog[204].main(sysarg)
	
end