--#include "data\functions\Systems\ActivitySystem\MiJingZhiLv.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
	local strRewardicon = string.format("<(%s)> <(%s)> <(%s)>","iaward#10#1","iaward#24#1","iaward#6#1")
	local echo = [[
	
 <(c0xFF00c0ff)活动描述><(idecoLine#350)>
     <(c0xFFb6946c)1. 秘境之旅共10层，每层都有boss>
     <(c0xFFb6946c)2. 击败所有的怪物才可进入下一层>
     <(c0xFFb6946c)3. 活动地图内pk不增加pk值>

 <(c0xFF00c0ff)参与条件><(idecoLine#350)>
     <(ifragments#16#18)><(c0xFFb6946c)特殊限制: ><(c0xFF00FF00)必须加入行会且等级达到80级>
     <(ifragments#16#18)><(c0xFFb6946c)活动时间: >]].."<(c0xFF00FF00)".."每周一,周五晚上 20:00-21:00"..[[>
     <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[
<#BN参加活动/@EnterActivity>
]]
	 return echo;
end

t.EnterActivity = function (sysarg)
	enter_MiJingZhiLv(sysarg)
end

function GetNpcMiJingZhiLv() return t end