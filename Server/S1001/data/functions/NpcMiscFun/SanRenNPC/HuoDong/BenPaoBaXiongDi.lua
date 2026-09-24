--奔跑吧兄弟
--#include "data\functions\Systems\ActivitySystem\benpaobaHandle.lua" once

NpcDialog[239] = {}

NpcDialog[239].main = function(sysarg)
	local cfg = StdActivityCfg.BenPaoBaXiongDi;
	local tCard = cfg.tCard;
	local times = cfg.tOpenTime.times[1]
	local activityTime = string.format("%02d:%02d-%02d:%02d", times[1], times[2], times[3], times[4], cfg.tOpenTime.openSvr);
	local tIcon = cfg.rewardicon;
	local strYBAward = string.format("%d元宝、%d元宝、%d元宝", cfg.tYBAwards[1], cfg.tYBAwards[2], cfg.tYBAwards[3]);
	local strBindAward = string.format("%d绑定元宝", cfg.tBindYBAward);
	
	--local sBtn = "";
	--if can_enter_bpbxd(sysarg, false) then
	--	sBtn = "<参与活动/@EnterScene>";
	--else
	--	local dVar = System.getDyanmicVar()			
	--		
	--	-- 活动结束且奖励还没有领
	--	if dVar.bpbxdTime == nil then
	--		local var = Actor.getStaticVar(sysarg)
	--		if var.days.pbpxdCardCount ~= nil then
	--			sBtn = "<领取奖励/@GetAward>";
	--		end
	--	end
	--end	
	
	local echo = [[
	
<(c0xFF00c0ff)活动描述:><(idecoLine#350)>
     <(c0xFFb6946c)1.奖励NPC在第二层的终点，点击可领取排名奖励哦！>
     <(c0xFFb6946c)2.活动场景内不可打开小地图，不可自动寻路>
     <(c0xFFb6946c)3.活动地图一、二层不可PK，第三层可PK且不红名>
     <(c0xFF00FF00)4.第三层将会刷新世界BOSS,携带大量宝藏,勇士们加油!>
 <PS:退出、掉线等再次进入需要从第一层跑起>
 <(c0xFF00c0ff)参与条件:><(idecoLine#350)>
    <(ifragments#16#18)><(c0xFFb6946c) 等级限制: ><(c0xFF00ff00)]]..cfg.level..[[级以上>
    <(ifragments#16#18)><(c0xFFb6946c) 活动时间: ><(c0xFF00ff00)]]..activityTime..[[>
 <(c0xFF00c0ff)活动奖励: >
    <(ifragments#16#18)><(c0xFFb6946c) 第一名:><(c0xFF00FF00)588元宝,288w绑定金币.>
    <(ifragments#16#18)><(c0xFFb6946c) 第二名:><(c0xFF00FF00)288元宝,220w绑定金币.>
    <(ifragments#16#18)><(c0xFFb6946c) 第三名:><(c0xFF00FF00)188元宝,188w绑定金币.>
    <(ifragments#16#18)><(c0xFFb6946c) 第4-10名:><(c0xFF00FF00)88元宝,158w绑定金币.>
    <(ifragments#16#18)><(c0xFFb6946c) 参与奖:><(c0xFF00FF00)128w绑定金币.>
]]..[[	<#BN参与活动/@EnterScene> 
<领取奖励/@GetAward>]]
	return echo;
end

-- 参加活动
NpcDialog[239].EnterScene = function(sysarg)
	enter_bpbxd(sysarg)
end

-- 领取奖励
NpcDialog[239].GetAward = function(sysarg)
	get_bpbxd_award(sysarg)
end