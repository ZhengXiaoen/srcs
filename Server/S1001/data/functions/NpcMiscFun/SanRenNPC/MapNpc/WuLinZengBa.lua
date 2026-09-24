--武林争霸
--#include "data\functions\Systems\ActivitySystem\wlzbPaoDianHandle.lua" once

NpcDialog[240] = {}

NpcDialog[240].main = function(sysarg)

	--//主显示内容
	local strRewardicon = string.format("<(%s)> <(%s)>","iaward#26#1", "iaward#3#1" )

	local echo = [[

  <(c0xFF00c0ff)武林争霸介绍:><(idecoLine#350)>

    <(c0xFFb6946c)1.争霸地图内不增加PK值,无法原地复活>
    <(c0xFFb6946c)2.活动结束前地图内><(c0xFF00FF00)最后1人><(c0xFFb6946c)即可获得><(c0xFF00FF00)武林盟主><(c0xFFb6946c)称号>
    <(c0xFFb6946c)3.若当前地图只有一个人，则请记住><(c0xFF00FF00)点击npc领取奖励~>
    <(c0xFFb6946c)4.争夺到武林盟主奖励:> <1000元宝,专属称号,万民膜拜>
  
    <(c0xFFff9000)唯一准则 干掉你所见到的任何人,你就是盟主了!>

  <(c0xFF00c0ff)激情闯关参与条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFF00FF00)80级><(c0xFFb6946c)以上玩家即可参与>
      <(ifragments#16#18)><(c0xFFb6946c)进入时间: ><(c0xFF00FF00)13:20 - 13:50> <(c0xFFb6946c)(入口关闭时间为><(c0xFF00FF00)13:30><(c0xFF705e45))>
      <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[



]]
    echo = echo.."\\   <#BN"..Lang.Activity.a00057.."/@EnterKingScene>"		--参加武林争霸
	--echo = echo.."\\<"..Lang.Activity.w00105.."/@GetAward>"		--领取奖励
	--echo = echo.."\\\\   <"..Lang.Activity.a00059.."/@ActivityIntroduction>"		--活动详情
	return echo;
end


-- 进入活动场景
NpcDialog[240].EnterKingScene = function(sysarg)
	enter_wlzb(sysarg)
end

-- 领取奖励
NpcDialog[240].GetAward = function(sysarg)
	get_wlzb_award(sysarg)
end

NpcDialog[240].ActivityIntroduction = function(sysarg)
	local str = Lang.Activity.a00060
	str = str.."\\<#BN"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end