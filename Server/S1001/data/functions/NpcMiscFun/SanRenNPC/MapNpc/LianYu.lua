--炼狱 副本 NPC

--#include "data\functions\Fuben\emoling.lua

local t = {};

t.main = function(sysarg)

	local var = Actor.getStaticVar(sysarg)
	local addUpExp = var.EMoLingAddUpExp
	if addUpExp == nil or addUpExp == 0 then
		return t.show_emoling_npc_dlg(sysarg, var)
	else
		return t.show_emoling_reward_npc_dlg(sysarg, var, addUpExp)
	end
	


end

 t.emoling_npc_dlg_common_string = function(sysarg)
	local echo = [[

    <(c0xFFeabc78)炼狱 每天参加一下炼狱除魔,海量经验助你升级!>


    <(c0xFFff9000)毒雾师:> <(c0xFFeabc78)群毒术练的出神入化,化毒为无形!>
    <(c0xFFff9000)冰法神:> <(c0xFFeabc78)一手冰龙咆哮,占据法神巅峰!>
    <(c0xFFff9000)火炎神:> <(c0xFFeabc78)强大的火墙秘术化为降妖火海!>
    <(c0xFFff9000)雷电神:> <(c0xFFeabc78)单体最强伤害,炼狱BOSS最害怕单位!>

    <(c0xFFeabc78)合理搭配成就通关秘诀.>
]]

	--主线任务
	if get_taskflags_val(sysarg) == 29 then
		task_ts = [[
达到<70级>后可以在我这里进行炼狱副本.
每天可以进行2次炼狱副本,每次完成后最少可获得300万经验值.
]]
		Actor.sendTipmsg(sysarg, task_ts, 4);
	end
	if get_taskflags_val(sysarg) == 29 then
		set_taskflags_val(sysarg, 30);
		Quest_ShuaXin(sysarg);
		Actor.addItem(sysarg,1780,0,0,1,1,0,"liuanyu",1);
		Actor.addEffect(sysarg,161,6,500,0);
	end


	return echo
end


 t.show_emoling_npc_dlg = function(sysarg, var)
	local enterCount = var.days.emolingCount
	if enterCount == nil then enterCount = 0 end
	
	local countStr = fuben_emoling_cfg.enter_count_daily - tostring(enterCount)
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	
	if  ta~=nil and nowVar == 71 and ta.type == 4 then   --需要改的now
		local sVar = Actor.getDyanmicVar(sysarg)
		sVar.nowNumberOfStep=1
		Actor.openarrowsguide(sysarg, 1005, 247, 438, 1);
		Actor.addTimer(sysarg,20,7*1000)
	end
	
	local echo =  t.emoling_npc_dlg_common_string(sysarg)
	echo = echo .. [[

 <(c0xFF00c0ff)参与条件><(idecoLine#350)>
    <(c0xFFb6946c)今天剩余副本次数:> <(c0xFFeabc78)]]..countStr..[[ / ]]..fuben_emoling_cfg.enter_count_daily..[[><(c0xFFb6946c)(每天0点刷新)> 
    <(c0xFFb6946c)参与炼狱等级:> <(c0xFFeabc78)]] .. fuben_emoling_cfg.need_level .. [[ 级>
    <(c0xFFb6946c)参与炼狱奖励:> <(c0xFFeabc78)3,000,000经验><(可免费3倍领取)>
    <(c0xFFdac220)黄金特权: ><(c0xFFb6946c)经验加成10%> <详细查看/@detailedlook>
<#BN开始炼狱/@on_enter_emoling>

]]
	return echo
end
t.detailedlook = function(sysarg)
    Actor.openDialogs(sysarg,187)

end
t.show_emoling_reward_npc_dlg = function(sysarg, var, addUpExp)
	
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 71 and ta.type == 4 and sVar.nowNumberOfStep ~= nil and sVar.nowNumberOfStep ==1 then	--箭头
		Actor.openarrowsguide(sysarg, 1005, 30, 345, 2);
		Actor.addTimer(sysarg,20,7*1000)
	end
	
	local Free =""
	if get_taskflags_val(sysarg) == 71 then 
	Free ="(免费赠送)"
	end
	
	local echo =  t.emoling_npc_dlg_common_string(sysarg)
--	echo = echo .. [[
--<(idecoLine#330)>
--
--    <领取炼狱奖励/@on_get_emoling_reward,1> <(c0xFF705e45)奖励:><(c0xFFeabc78)]] .. addUpExp .. [[ 经验> 
--
--<(idecoLine#330)>
--
--    <消耗29元宝领取3倍奖励/@on_get_emoling_reward,3> <(c0xFF705e45)奖励:><(c0xFFeabc78)]] .. (addUpExp * 3) .. [[ 经验> 
--
--    <消耗99元宝领取5倍奖励/@on_get_emoling_reward,5> <(c0xFF705e45)奖励:><(c0xFFeabc78)]] .. (addUpExp * 5) .. [[ 经验\    ]]..Free..[[>
--
--]]
	if get_taskflags_val(sysarg) ==  71 then 
		echo = echo .. [[
<(idecoLine#330)>

    <领取炼狱奖励/@on_get_emoling_reward,1> <(c0xFF705e45)奖励:><(c0xFFeabc78)]] .. addUpExp .. [[ 经验> 

<(idecoLine#330)>

    <免费领取 3倍奖励/@on_get_emoling_reward,3> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 3) .. [[经验> 
]]
	else	--粗略做了个判断
	addUpExp = addUpExp * 3;	--初始的经验给3倍
	echo = echo .. [[
<(idecoLine#330)>

    <免费领取 3倍奖励/@on_get_emoling_reward,1> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. addUpExp .. [[ 经验> 

<(idecoLine#330)>

    <VIP1领取 6倍奖励/@on_get_emoling_reward,2|所需150元宝> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 2) .. [[经验 > 
    <VIP3领取 9倍奖励/@on_get_emoling_reward,3|所需300元宝> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 3) .. [[经验 > 
    <VIP5领取12倍奖励/@on_get_emoling_reward,4|所需400元宝> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 4) .. [[经验 > 
    <VIP7领取15倍奖励/@on_get_emoling_reward,5|所需500元宝> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 5) .. [[经验 > 
    <VIP9领取18倍奖励/@on_get_emoling_reward,6|所需600元宝> <(c0xFF705e45)可获得:><(c0xFFeabc78)]] .. (addUpExp * 6) .. [[经验 > 

]]
	end

	return echo
end

-- VIP1领取2倍奖励  消耗 150 元宝   可获得 18000000 经验
-- VIP3领取3倍奖励  消耗 300 元宝   可获得 27000000 经验
-- VIP5领取4倍奖励  消耗 400 元宝   可获得 36000000 经验
-- VIP7领取5倍奖励  消耗 500 元宝   可获得 45000000 经验
-- VIP9领取6倍奖励  消耗 600 元宝   可获得 54000000 经验

t.on_enter_emoling = function(sysarg)
		--local nowVar =get_taskflags_val(sysarg)
		--local ta = task_all[nowVar]
		--local sVar = Actor.getDyanmicVar(sysarg)
		--	if nowVar == 47 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		--		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		--		MasterStokeAcceptTask(sysarg,ta.npcid)	
		--	end
	enter_emoling(sysarg)	
end

t.on_get_emoling_reward = function(sysarg, rate)
	rate = tonumber(rate)
	--if rate ~= 1 and rate ~= 3 and rate ~= 5 then
	--	return
	--end
	
	--主线获取奖励后进行下一个任务
	local nowVar =get_taskflags_val(sysarg)
	if nowVar == 71 then 
		get_emoling_reward(sysarg, rate)
		--OnFinish_Liveness(sysarg,6)--活跃度增加
		return
	else 
		get_emoling_reward(sysarg, rate)
	end
    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.lianyurate,nActorID,Actor.getName(sysarg),rate)
	--OnFinish_Liveness(sysarg,6)--活跃度增加
	local var = Actor.getStaticVar(sysarg)
	if var.EMoLingAddUpExp == nil then
		-- 领取奖励后显示正常界面
		return  t.show_emoling_npc_dlg(sysarg, var)
	end
    
end

---------------------------------------------------------------------------
function GetNpcShouWeiZhan() return t end