--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
	local echo = [[

  <(c0xFF00c0ff)神威活动简单描述:><(idecoLine#350)>
      <(c0xFFb6946c)1.神威狱入口开放 ><(c0xFF00FF00)15分钟>
      <(c0xFFb6946c)2.神威狱共 ><(c0xFF00FF00)10层><(c0xFFb6946c),击败每层Boss后会掉落大量装备>
      <(c0xFFb6946c)3.精英怪><(c0xFF00FF00)必掉神域通行证>
      <(c0xFFb6946c)4.进入下一层需消耗一定数量的><(c0xFF00FF00)神域通行证><(c0xFFb6946c)或使用><(c0xFF00FF00)元宝>
      <(c0xFFb6946c)5.活动限时 ><(c0xFF00FF00)90分钟><(c0xFFb6946c)，超时后玩家将被自动传出>
      <(c0xFFb6946c)6.神威狱地图><(c0xFF00FF00)PK不红名>
      <(c0xFF00FF00)7.神威顶层刷新世界boss，掉落大量装备，先到先得！>

   <PS：退出、掉线等再次进入到去过的层不消耗神域通行证>

 <(c0xFF00c0ff)神威活动参与条件:><(idecoLine#350)>
   <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFF00FF00)80级>
   <(ifragments#16#18)><(c0xFFb6946c)活动时间: ><(c0xFFb6946c)上午><(c0xFF00FF00)10:00 - 11:30><(c0xFFb6946c)(入口关闭时间为><(c0xFF00FF00)10:15><(c0xFF705e45))>
   <            ><(c0xFFb6946c)晚上><(c0xFF00FF00)22:00 - 23:30><(c0xFFb6946c)(入口关闭时间为><(c0xFF00FF00)22:15><(c0xFF705e45))>
                  




<#BN参加活动/@EnterActivity>
]]
	 return echo;
end

t.EnterActivity = function (sysarg)
	enter_jmzc(sysarg)
end


function GetNpcSHENWEIRUKOU() return t end