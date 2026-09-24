--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once

local t = {}
local needYB={10,20,30,40,80,100,150,200,249}
t.main = function(sysarg)
	--//主显示内容
local echo = [[

		      <(c0xFF00c0ff)神威狱传送员><(idecoLine#350)>
 
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱1层需要><(c0xFF00FF00)1><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱2层需要><(c0xFF00FF00)2><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱3层需要><(c0xFF00FF00)4><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱4层需要><(c0xFF00FF00)8><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱5层需要><(c0xFF00FF00)12><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱6层需要><(c0xFF00FF00)20><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱7层需要><(c0xFF00FF00)32><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱8层需要><(c0xFF00FF00)52><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)通关神威狱9层需要><(c0xFF00FF00)84><(c0xFFb6946c)个神域通行证和击杀boss>
     <(ifragments#16#18)><(c0xFFb6946c)神威狱10层刷新世界boss，掉落大量装备、材料>
<(c0xFFff9000)PS：神威共10层，每层都会刷新对应阶数的boss,掉落各种装备>
<#BN进入下一层/@NextLayer>]]
	local svar = Actor.getStaticVar(sysarg)
	local hScene = Actor.getSceneId(sysarg)
	local numberofplies = NumberOfPlies(hScene)--获得当前的层数
	if svar.days.shenweiyuHighestLayer~=nil and  svar.days.shenweiyuHighestLayer <= numberofplies then --判断今天是否是第一次收取通行证
		echo=echo..[[
		    <]]..needYB[numberofplies]..[[元宝进入下一层/@NextLayerByYB,]]..needYB[numberofplies]..[[>]]
	end
	return echo;
end
--用元宝通关
t.NextLayerByYB = function(sysarg,needYBNumber)

	local sysvar = System.getStaticVar(sysarg)
	local hScene = Actor.getSceneId(sysarg)
	local numberofplies = NumberOfPlies(hScene)--获得当前的层数
	
	if numberofplies > sysvar.ShenWeiYuBoss then 
		Actor.sendTipmsg(sysarg, "本层首领还没有被击败，请击败了再来", ttFlyTip)
		return 
	end

	--判断元宝是否足够
	local moneyCount = Actor.getMoneyCount(sysarg, 3)
	needYBNumber =tonumber(needYBNumber)
	if moneyCount< needYBNumber then 
		Actor.sendTipmsg(sysarg, "元宝不足，无法领取奖励", ttFlyTip)
		return 
	end
	
	--扣除元宝
	local cfg = StdActivityCfg.ShenWeiYu
	if Actor.changeMoney(sysarg,3,-needYBNumber,2608,"神威狱元宝通关") then 
		local hScene = Actor.getSceneId(sysarg)
		--local numberofplies = NumberOfPlies(hScene)--获得当前的层数
		local tItems = cfg.Awards[numberofplies]
		--local randomNmber = math.random(tItems.mincount,tItems.maxcount)
		--Actor.changeMoney(sysarg, mtBindCoin, randomNmber,100,"神威狱通关给金钱奖励")
		
		--Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + tItems[1]));
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护符碎片>",tItems[1]),1);
		--Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + tItems[2]));
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护盾碎片>",tItems[2]),1);
		Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE,Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE)+tItems[1]) --给灵力值
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", tItems[1], "灵力值"), 1);
			
		--成就积分
		local nOldCount = Actor.getIntProperty(sysarg,PROP_ACTOR_ACIEVEPOINT)
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s成就值>",tItems[2]),1);
		Actor.addAchievePoint(sysarg, tItems[2])
		
		--Actor.changeMoney(sysarg, mtBindCoin, tItems[3],100,"神威狱通关给金钱奖励")
		

		if numberofplies == 10 then --已经是最高层了
			Actor.enterScene(sysarg,83,142,128)
			--退出活动
			print("提前结束活动")
			return
		end
		local svar = Actor.getStaticVar(sysarg)
		svar.days.shenweiyuHighestLayer = svar.days.shenweiyuHighestLayer + 1
		updateAndsendActivityData_jmzc(sysarg,1)
        local sSceneName = Fuben.getSceneNameById(cfg.scenes[numberofplies + 1])
	
        Actor.telportSceneRandPos(sysarg,sSceneName) 
		--Actor.enterScene(sysarg, cfg.scenes[numberofplies + 1], -1, -1)
	end
end

t.NextLayer = function (sysarg)

	local sysvar = System.getStaticVar(sysarg)
	local hScene = Actor.getSceneId(sysarg)
	local numberofplies = NumberOfPlies(hScene)--获得当前的层数
	
	if numberofplies > sysvar.ShenWeiYuBoss then 
		Actor.sendTipmsg(sysarg, "本层首领还没有被击败，请击败了再来", ttFlyTip)
		return 
	end
	
	local cfg = StdActivityCfg.ShenWeiYu
	local n = Actor.getItemCount(sysarg,cfg.needItems[numberofplies].id);
	
	local svar = Actor.getStaticVar(sysarg)
	
	if svar.days.shenweiyuHighestLayer~=nil and svar.days.shenweiyuHighestLayer <= numberofplies then --判断今天是否是第一次收取通行证
		if n<cfg.needItems[numberofplies].count then 
			Actor.sendTipmsg(sysarg, "您是没有足够的通行证，请获取了再来", ttFlyTip)
			return
		end
		
		--领取奖励（奖励在扣除之前，以免扣除了，没有得到奖励）
		local tItems = cfg.Awards[numberofplies]
		Actor.removeItem(sysarg,cfg.needItems[numberofplies].id,cfg.needItems[numberofplies].count,-1,-1,-1)--扣除通关物品
		
		--if Awards.Give(sysarg, tItems) ~= true then
		--	return
		--end
		--print(tItems.mincount,tItems.mincount)
		--local randomNmber = math.random(tItems.mincount,tItems.maxcount)
		
		--Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + tItems[1]));
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护符碎片>",tItems[1]),1);
		--Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + tItems[2]));
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s护盾碎片>",tItems[2]),1);
		
		Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE,Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE)+tItems[1]) --给灵力值
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", tItems[1], "灵力值"), 1);
			
		--成就积分
		local nOldCount = Actor.getIntProperty(sysarg,PROP_ACTOR_ACIEVEPOINT)
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s成就值>",tItems[2]),1);
		Actor.addAchievePoint(sysarg, tItems[2])
		
		
		--Actor.changeMoney(sysarg, mtBindCoin, tItems[3],100,"神威狱通关给金钱奖励")
		
				
		if numberofplies == 10 then --已经是最高层了
			Actor.enterScene(sysarg,83,142,128)
			--退出活动
			print("提前结束活动")
			return
		end
		
		svar.days.shenweiyuHighestLayer = svar.days.shenweiyuHighestLayer + 1
	end
	
	updateAndsendActivityData_jmzc(sysarg,1)
    local sSceneName = Fuben.getSceneNameById(cfg.scenes[numberofplies + 1])
	
    Actor.telportSceneRandPos(sysarg,sSceneName) 
	--Actor.enterScene(sysarg, cfg.scenes[numberofplies + 1], -1, -1)
end


function GetNpcSHENWEICHUANSONG() return t end