--#include "data\functions\Systems\ActivitySystem\taotieshendian.lua" once
local t = {}--
t.main = function(sysarg)
local cfg = StdActivityCfg.BenPaoBaXiongDi;
	local tCard = cfg.tCard;
	local times = cfg.tOpenTime.times[1]
	local activityTime = string.format("%02d:%02d-%02d:%02d", times[1], times[2], times[3], times[4], cfg.tOpenTime.openSvr);
	local tIcon = cfg.rewardicon;
	--local strYBAward = string.format("%d元宝、%d元宝、%d元宝", cfg.tYBAwards[1], cfg.tYBAwards[2], cfg.tYBAwards[3]);
	--local strBindAward = string.format("%d绑定元宝", cfg.tBindYBAward);
	
	local str=[[	<#BN参与活动/@EnterScene>]]
	local str2="领取奖励"
	
	if Actor.getSceneId(sysarg) == 218 then 
		str2="离开活动"
	end
	
	if Actor.getSceneId(sysarg) == 216 or Actor.getSceneId(sysarg) == 217 or Actor.getSceneId(sysarg) == 218 then 
		str=[[<#BN]]..str2..[[/@GetAward>\         
		
		
		
						
					   ]]
		--if	Actor.getSceneId(sysarg) ~= 218 then 
		--	str=str..[[进入下一层]]
		--end
	end
	local strRewardicon = string.format("<(%s)><(%s)>", "iaward#16#1","iaward#18#1")
	
	--local strRewardicon = ""..string.format("<(%s)>", "iaward#3#1")
	local echo = [[
	
 <(c0xFF00c0ff)活动描述><(idecoLine#350)>
     <(c0xFFb6946c)1.跑吧共3层，每层至少3组栅栏（你们休想过去）>
     <(c0xFFb6946c)2.击败障碍物获得道路才可通过>
     <(c0xFFb6946c)3.每层终点都有NPC，点击可领取排名奖励哦，并且传入下>
       <(c0xFFb6946c)一层继续奔跑>
 <(c0xFFff9000)PS:退出、掉线等再次进入需要从第一层跑起，跑吧活动地图PK>
    <(c0xFFff9000)不红名>
 <(c0xFF00c0ff)参与条件><(idecoLine#350)>
    <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFF00ff00)]]..cfg.level..[[级以上>
    <(ifragments#16#18)><(c0xFFb6946c)活动时间: ><(c0xFF00ff00)]]..activityTime..[[>
    <(ifragments#16#18)><(c0xFFb6946c)活动奖励: ><(idecoLine#350)>
    <(ifragments#16#18)><(c0xFFb6946c)前三名:护符碎片*6000,护盾碎片*6000,绑定金币*40万>
    <(ifragments#16#18)><(c0xFFb6946c)4-20名:护符碎片*2000,护盾碎片*2000,绑定金币*20万>
    <(ifragments#16#18)><(c0xFFb6946c)参与奖:护符碎片*1000,护盾碎片*1000,绑定金币*10万>
]]..str
	--print("echo="..echo)
	return echo;
end

t.EnterScene = function(sysarg)
	t.suijichuansong(sysarg)
end

t.GetAward = function(sysarg)
	t.suijichuansong(sysarg)
end

t.suijichuansong = function(sysarg)
	--随机传送
	--local Var = Actor.getStaticVar(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	--local mapname = Fuben.getSceneNameById(sceneId)
    --
	--
	--local h=0
	--local w=0
	--local times=0
	--for i=1,10000 do --循环1万次找随机点
	--	local bHandle = Fuben.getSceneHandleById(sceneId,0)
	--	
	--	h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
	--	w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
	--	Fuben.onCanMove(bHandle,h,w)
	--	if Fuben.onCanMove(bHandle,h,w)== true then
	--		break
	--	end
	--	times=i
	--end
	--if times <10000 then 
	--	System.telportScene(sysarg,	sceneId, h, w)
	--else 
	--	System.telportSceneDefaultPoint(sysarg,mapname)
	--end
	Actor.enterScene(sysarg,sceneId,40,124)
	Actor.sendTipmsg(sysarg, "真遗憾啊,你认错人了,我姓大名坑,所以请重新来过吧!", ttFlyTip);
end


function GetNpcBenPaoMiHuo() return t end