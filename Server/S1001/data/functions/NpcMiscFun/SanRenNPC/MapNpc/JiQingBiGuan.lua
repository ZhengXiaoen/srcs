--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
  local strRewardicon = string.format("<(%s)> <(%s)> <(%s)>","iaward#20#1" ,"iaward#8#1","iaward#2#1") ---圣珠 成就 禁言
	local echo = [[

  <(c0xFF00c0ff)激情闯关简单介绍:><(idecoLine#350)>

    <(c0xFFb6946c)1. 进入活动场景每><(c0xFF00FF00) 10秒><(c0xFFb6946c)可获得><(c0xFF00FF00)圣珠结晶><(c0xFFb6946c)、><(c0xFF00FF00)成就><(c0xFFb6946c)、><(c0xFF00FF00)经验>
    <(c0xFFb6946c)2. 活动地图中><(c0xFF00FF00)安全区><(c0xFFb6946c)和><(c0xFF00FF00)pk区><(c0xFFb6946c)奖励不同>
    <(c0xFFb6946c)3. 活动中存在><(c0xFF00FF00)多倍泡点><(c0xFFb6946c)，抢占对应泡点获得><(c0xFF00FF00)多倍收益>
    <(c0xFFb6946c)4. 最高可获得 ><(c0xFF00FF00)6倍><(c0xFFb6946c)泡点收益>
    <(c0xFFb6946c)5. 活动地图><(c0xFF00FF00)PK不红名>

    <PS：在活动内待得越久，获得奖励越多>

  <(c0xFF00c0ff)激情闯关参与条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFFeabc78)等级达到><(c0xFF00FF00)80级>
      <(ifragments#16#18)><(c0xFFb6946c)进入时间: ><(c0xFFeabc78)每天 ><(c0xFF00FF00)15:00 - 15:20> 
      <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[

      



<#BN参加活动/@EnterActivity>
]]
	 return echo;
end

t.EnterActivity = function (sysarg)
	enter_bgxl(sysarg)
end

function GetNpcJIQINGBIGUAN() return t end