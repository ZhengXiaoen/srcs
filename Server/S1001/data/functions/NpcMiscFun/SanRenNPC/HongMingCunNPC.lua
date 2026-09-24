--#include "data\functions\Systems\ActivitySystem\JuntuanZhan.lua" once

local t = {}

t.main = function(sysarg)
	--//主显示内容

	local str = string.format(" <(c0xFF888888)当前pk值为><(c0xFFfada8b)%s>", Actor.getUIntProperty(sysarg,PROP_ACTOR_PK_VALUE))
	local echo = [[
	<(idecoLine#350)>

    <(c0xFF888888)进入这里就表示你已经触发了PK惩罚！就安心在这里反省吧>\
   	   <(c0xFF888888)每分钟减少><(c0xFFfada8b)2点> <(c0xFF888888)pk值>   ]]..str..[[\
    	  <(c0xFF888888)当pk值低于><(c0xFFfada8b)50点><(c0xFF888888)时，可以点击离开红名村！>





		<#BN离开红名村/@ExitRedNameCity>
    ]]

	 return echo;
end


t.ExitRedNameCity= function(sysarg)

	--是否能出红名村的判断，c++已经做了
	local mname = Fuben.getSceneNameById(9)
	System.telportSceneDefaultPoint(sysarg,mname)
		
end



function GetNpcHMCNPC() return t end