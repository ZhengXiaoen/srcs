--#include "data\functions\Systems\ActivitySystem\JuntuanZhan.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
    local sSbkMaster = nil
    sSbkMaster = Guild.getSbkCityOwnerName()
    if sSbkMaster == nil then sSbkMaster = "无" end
    local sVar = System.getStaticVar()
    if sVar.wangchengMoney == nil then  sVar.wangchengMoney = 0 end

	local echo = [[

    <(c0xFFb6946c)当前王城城主:> <(c0xFFeabc78)]]..sSbkMaster..[[> 

    <(c0xFFb6946c)可><提取/@tiqu_give|王城城主可提取的王城基金><(c0xFFb6946c)的王城基金:> <(c0xFFeabc78)]]..sVar.wangchengMoney..[[>

<(idecoLine#315)>

    <(c0xFFb6946c)本服务器里面每死亡一只首领怪便会增加一定基金>\
    <(c0xFFff9000)上限基金为1000W,领取后清空>



    ]]

	 return echo;
end

t.tiqu_give = function(sysarg)
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local ownerId = Guild.getSbkCityOwner()
    if userId ~= ownerId then
        Actor.sendTipmsg(sysarg,"您不是王城城主,无法提取基金!",ttFlyTip)
        return
    end
    local sVar = System.getStaticVar()
    if sVar.wangchengMoney <= 0 then
         Actor.sendTipmsg(sysarg,"没有可提取的王城基金",ttFlyTip)
        return
    end
    Actor.changeMoney(sysarg,mtBindCoin,sVar.wangchengMoney,2307,"提取王城基金")
    Actor.sendTipmsg(sysarg,"提取王城基金成功!",ttFlyTip)
    sVar.wangchengMoney = 0
    return t.main(sysarg)
end




function GetNpcCZDX() return t end