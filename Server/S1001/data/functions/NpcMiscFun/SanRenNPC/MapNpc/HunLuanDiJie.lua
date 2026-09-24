--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once
-- local t = {}
NpcDialog[399] = {}
NpcDialog[399].main = function(sysarg)
	--//主显示内容
	local echo = ""
	echo = [[
    
    <(c0xFF00c0ff)每日只限进入3次.单次可停留30分钟> <(c0xFFeabc78)剩余次数><(c0xFFffff00)%d><(c0xFFeabc78)次>

                    <VIP3以上玩家可进入> 
<(idecoLine#330)>

    <(c0xFFeabc78)BOSS刷新时间为：><(c0xFFffff00)90分钟>
    <(c0xFFeabc78)小怪刷新时间为：><(c0xFFffff00)10分钟>

<(idecoLine#330)>
                
                <进入混乱地界/@enter> <(c0xFFeabc78)（主产出玫瑰花、高级羽毛）>
                
<(idecoLine#330)>
    <(c0xFF00c0ff)《爆率展示》>
]];
local var = Actor.getStaticVar(sysarg)
if var.hldjdayc == nil then var.hldjdayc = 3 end
echo = string.format(echo,var.hldjdayc)
local smbl = {6219,6218,6217,6216,491,465,90,91,92,93,99,100,101,102,108,109,110,111};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end

  

	 return echo;
end

t.ipk = function(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end

NpcDialog[399].enter= function(sysarg)
    --

    if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < 3 then
        Actor.sendTipmsg(sysarg,"VIP等级不足3级,无法进入!",ttFlyTip)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.hldjdayc == nil then var.hldjdayc = 3 end
    if var.hldjdayc <= 0 then
        Actor.sendTipmsg(sysarg,"每日3次数已用完,无法进入,次日0点更新!",ttFlyTip)
        return
    end
 

    Actor.deleteTimer(sysarg, 28);
	set_d_val(sysarg,12,1800); --定时器记时用
	Actor.addTimer(sysarg, 28, 5000 ); --每5秒1判断，顺带给玩家提示倒计时

    Actor.enterScene(sysarg,568,-1,-1);

   
    var.hldjdayc = var.hldjdayc  - 1
    if var.hldjdayc < 0 then var.hldjdayc = 0 end

    	
	local strlog = string.format("<(n%s)>玩家实力非凡,踏入混乱地界,玫瑰花羽毛顶级装备随便爆!!<(x沙漠土城:172:130:[传])>",Actor.getName(sysarg))

	
	System.broadcastTipmsg(strlog,ttChatWindow+ ttScreenCenter)

    local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local ActorName = Actor.getName(sysarg)
	
	
	System.sendCommonLog(LogIds.jinruhunluandijie,ActorId,ActorName,var.hldjdayc,0,0,"剩余进入次数","","")
end


function GetHunLuanCount(sysarg,nCount)
   
    local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				local var = Actor.getStaticVar(player)
                var.hldjdayc = tonumber(nCount)
			end
		end
	end
end