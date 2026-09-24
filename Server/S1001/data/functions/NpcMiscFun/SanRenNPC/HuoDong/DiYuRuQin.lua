--#include "data\config\guild\GuildFight.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once
local t = {}
t.main = function(sysarg)
	local strRewardicon = string.format("<(%s)> <(%s)> <(%s)>","iaward#2#1","iaward#5#1","iaward#11#1")
	local BTN=[[<#BN参加活动/@StartActivity>]]

	local BTN2=[[	   
		<领取奖励(免费领取)/@Zgiveaward,1|免费领取奖励>	

		<三倍领取奖励(所需%d元宝)/@Zgiveaward,2|需要%d元宝>]]
	local echo = [[

 <(c0xFF00c0ff)活动描述>
<(idecoLine#308)>
  <(c0xFFb6946c)1.共有15波入侵小怪,来挑战吧>
  <(c0xFFb6946c)2.行会群众所需齐心协力保护圣碑.圣碑破则活动失败.>
  <(c0xFFb6946c)3.击败入侵怪物,每击败一只,便可获得收益>
  <(c0xFFb6946c)4.活动中可利用便捷方式来提升实力,是男人就坚持到底>
  <(c0xFFb6946c)5.当活动结束后，前往NPC处领取奖励！>
  <(c0xFFee0909)（奖励次日清空，请当日内领取）>

 <(c0xFF00c0ff)参与条件>
<(idecoLine#308)>
  <(ifragments#16#18)><(c0xFFb6946c)特殊限制: ><(c0xFF00FF00)必须加入任意一方行会>
  <(ifragments#16#18)><(c0xFFb6946c)活动时间: >]].."<(c0xFF00FF00)".."每周三,每周日晚上 20:00-21:00"..[[>
  <(ifragments#16#18)><(c0xFFb6946c)活动奖励: ><(c0xFF00FF00)每只怪必掉>\	     ]]..strRewardicon..[[

]]
	local nGold,nExp,nHuDun = System.GetGuildFightAward(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.GuildFightTime ==nil then 
		if nGold~=0 then 
			echo = echo	.." <(c0xFF00c0ff)收益奖励:>\<(c0xFFb6946c)金币:"..nGold.."><(c0xFFb6946c)经验:"..nExp.."><(c0xFFb6946c)1级羽毛:"..nHuDun..">"			
			echo = echo..string.format(BTN2,nHuDun*10,nHuDun*10)
		else 
			echo=echo..BTN
		end
		
	elseif System.GuildFightActivityEnd(sysarg) then  --已经打完了，并且不有参与过活动
		if nGold ~= 0 then 

		    echo = echo	.." <(c0xFF00c0ff)收益奖励:>\<(c0xFFb6946c)金币:"..nGold.."><(c0xFFb6946c)经验:"..nExp.."><(c0xFFb6946c)1级羽毛:"..nHuDun..">"			
			echo=echo..string.format(BTN2,nHuDun*10,nHuDun*10)
		else 
			echo=echo..BTN
		end
	else 
		echo=echo..BTN
	end 




	--//主显示内容
--	local echo = [[
--
--   阿大aa使的<参加活动!/@StartActivity> <领取奖励/@Zgiveaward,1><领取三倍奖励/@Zgiveaward,2>
--]]
--    local nGold,nExp,nHuDun = System.GetGuildFightAward(sysarg)
--    if nGold > 0 then
--        echo = echo.."金币:"..nGold.."经验:"..nExp.."护盾碎片:"..nHuDun
--    end
	 return echo;
end


t.StartActivity = function(sysarg)
    --if checkActivityTime(GuildFight.OpenTime) == 0 then
    --    return "活动尚未开启!"
    --end
	local dVar = System.getDyanmicVar()
	if dVar.GuildFightTime == nil then 
		--	print("dVar.GuildFightTime:"..dVar.GuildFightTime)
		Actor.sendTipmsg(sysarg,"活动还未开启", ttFlyTip) 
		--return "活动还没开启"
	elseif Actor.getGuildId(sysarg) == 0 then
		Actor.sendTipmsg(sysarg,"请加入任意一个行会!", ttFlyTip) 
		--return "还没有行会!"

    else   
        local nRet = System.EnterGuildFight(sysarg)
        if nRet ~= 5 then
            Actor.sendTipmsg(sysarg,"活动已经结束"..nRet, ttFlyTip) 	
        end
		
        --return "已经打完了"
    end

    --System.SetGuildFightAward(sysarg,0,0,0)
end

t.Zgiveaward = function(sysarg,n)
   
    local nGold,nExp,nHuDun = System.GetGuildFightAward(sysarg)
    if Item.getBagEmptyGridCount(sysarg) < math.ceil(nHuDun / 200) then Actor.sendTipmsg(sysarg,string.format("您的包裹格子空格数不足%s,领取失败...",math.ceil(nHuDun / 200)), 256); return; end
	if tonumber(n)==2 then--取三倍经验
		local moneyCount = Actor.getMoneyCount(sysarg, 3)
        local needMoney = nHuDun * 10
		if moneyCount< needMoney then 
			Actor.sendTipmsg(sysarg, "不足"..needMoney.."元宝，无法领取奖励", ttFlyTip)
			return 
		end
		nGold=nGold*3
		nExp=nExp*3
		nHuDun=nHuDun*3
        Actor.changeMoney(sysarg,3,-needMoney,1,"抵御入侵三倍扣除")
	end
    Actor.changeMoney(sysarg,mtBindCoin,nGold,1,"抵御入侵")
    Actor.addExp(sysarg,nExp,1,0)
    System.SetGuildFightAward(sysarg,0,0,0)
    Actor.addItem(sysarg,464,0,0,nHuDun,1,0,"抵御入侵",1)
   -- local nValue = Actor.getIntProperty(sysarg,PROP_ACTOR_SHIELD_SPIRIT)
   -- nValue = nValue + nHuDun
   -- Actor.setIntProperty(sysarg,PROP_ACTOR_SHIELD_SPIRIT,nValue)

    return t.main(sysarg)
end

function GetNpcSanDiYuRuQin() return t end

function onstartguildfight_Before5()
	local cfg = StdActivityCfg.HangHuiShouHu	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function onstartguildfight()
	local dVar = System.getDyanmicVar()
	dVar.GuildFightTime = System.getCurrMiniTime()
	System.StartGuildFight()
end

function onstopguildfight()
	local dVar = System.getDyanmicVar()
	dVar.GuildFightTime = nil
	System.StopGuildFight()
end