--#include "data\functions\Systems\ActivitySystem\taotieshendian.lua" once
local t = {}--
t.main = function(sysarg)
	--//主显示内容
	local strRewardicon = string.format(" <(%s)> <(%s)>","iaward#24#1","iaward#6#1")
	local echo = [[

 <(c0xFF00c0ff)饕餮神殿简单描述:><(idecoLine#350)>
      <(c0xFFb6946c)1.饕餮神殿共刷新25波BOSS>
      <(c0xFFb6946c)2.击败每层Boss后会掉落大量装备>
      <(c0xFFb6946c)3.活动限时30分钟，超时后玩家将被自动传出>
      <(c0xFFb6946c)4.地图PK不红名>
      <(c0xFFee0909)5.每一波怪物实力都不同,并且伴随着掉落也不同,越到后面越极品哦!>

 <(c0xFF00c0ff)饕餮活动参与条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFFeabc78)80级>
      <(ifragments#16#18)><(c0xFFb6946c)早上活动时间: ><(c0xFFeabc78)10:00 - 10:30> 
      <(ifragments#16#18)><(c0xFFb6946c)下午活动时间: ><(c0xFFeabc78)15:30 - 16:00> 
      <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[


<#BN参加活动/@enterScene>


]]
	return echo;
end
t.enterScene =function (sysarg)
	enter_TTSD(sysarg)
end



function GetNpcTiaoTieShenDan() return t end