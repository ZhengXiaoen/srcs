--#include "data\config\activity\StdActivityCfg.lua" once

local t = {}
t.main = function(sysarg)
    local sVar = System.getStaticVar()
    if sVar.wulin == nil then  
        sVar.wulin = {} 
        sVar.wulin.wulinMoney = 0
        sVar.wulin.wulinMaster = ""
    end

    local sMatster = "无"
    if sVar.wulin.wulinMaster ~= "" then
        sMatster = sVar.wulin.wulinMaster
    end
    if sVar.wulin.wulinMoney < 0 then
        sVar.wulin.wulinMoney = 0
    end
	--//主显示内容
	local echo = [[

    <(c0xFFb6946c)当前武林盟主:> <(c0xFFeabc78)]]..sMatster..[[>
    <(c0xFFb6946c)可><提取/@onTiQu|武林盟主可提取全服玩家膜拜的金币><(c0xFFb6946c)的膜拜金币:> <(c0xFF00FF00)]]..sVar.wulin.wulinMoney..[[>
<(idecoLine#350)>
    <(c0xFFb6946c)每天><(c0xFF00FF00)12:00><(c0xFFb6946c)-><(c0xFF00FF00)12:30><(c0xFFb6946c)/><(c0xFF00FF00)18:00><(c0xFFb6946c)-><(c0xFF00FF00)18:30><(c0xFFb6946c)可膜拜盟主雕像.>
    <(c0xFFb6946c)膜拜需> <(c0xFF00FF00)10万> <(c0xFFb6946c)金币、绑定金币.>
    <(c0xFFb6946c)根据><(c0xFF00FF00)自身等级><(c0xFFb6946c)每><(c0xFF00FF00)10秒><(c0xFFb6946c)获得一次经验与绑定金币>
    <(c0xFFb6946c)等级越><(c0xFF00FF00)高><(c0xFFb6946c)，经验越><(c0xFF00FF00)多><(c0xFFb6946c)！>
    <(c0xFFb6946c)靠近盟主雕像可获得经验，最远可达><(c0xFF00FF00)10格>

    <(c0xFF00c0ff)友情提示：准时参加可获得最大经验收益!\    (活动结束后BUFF消失)>
<(idecoLine#350)>
    <(c0xFFb6946c)想成为武林盟主吗?>
    <(c0xFFb6946c)每周一、三、五的><(c0xFF00FF00)13:20><(c0xFFb6946c)去找> <武林争霸/M威龙城:209:139:武林争霸> <(c0xFFb6946c)参加活动！>

<#BN开始膜拜盟主/@onMoBaiChengZhu>
]]
	 return echo;
end

t.onTiQu = function(sysarg)
    local sVar = System.getStaticVar()
    if sVar.wulin.wulinMaster ~= Actor.getName(sysarg) then
        Actor.sendTipmsg(sysarg, "您不是武林盟主,无法提取!",ttFlyTip)
        return
    end
    if sVar.wulin.wulinMoney <= 0 then
        Actor.sendTipmsg(sysarg,"没有可提取的金币!",ttFlyTip)
        return
    end

    if Actor.changeMoney(sysarg,mtBindCoin,sVar.wulin.wulinMoney,2306,"提取膜拜金币") then 
        Actor.sendTipmsg(sysarg,"提取膜拜金币"..sVar.wulin.wulinMoney,ttFlyTip)
        sVar.wulin.wulinMoney = 0
    else
        Actor.sendTipmsg(sysarg,"提取膜拜金币失败",ttFlyTip)
    end
    
    return t.main(sysarg)
    
end

t.onMoBaiChengZhu = function(sysarg)

    --规定时间才可以膜拜
	local cfg = StdActivityCfg.MoBeiChongZhu
	local times = cfg.tOpenTime.times
	local timeIdx = checkActivityTime(times)

	if timeIdx == 0 then	
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end


	local endHour = times[timeIdx][3]
	local endMin = times[timeIdx][4]
	local endSec = 0
	if endHour == 0 and endMin == 0 then
		endHour = 23
		endMin = 59
		endSec = 59
	end
	
	local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	if leftSecond == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end

	--膜拜次数
	local var = Actor.getStaticVar(sysarg)
	if var.days.MBleftTime ==nil then --1天有几次
		var.days.MBleftTime =#times
	end	

    local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
    if plv < 75 then
        Actor.sendTipmsg(sysarg, "等级不足<(c0xFF00FF00)75级>，无法参加", ttFlyTip)
        return;
    end
	
	if var.days.MBleftTime==0 then 
		Actor.sendTipmsg(sysarg,"今日膜拜次数已用完!",ttFlyTip)
        return
	end
	
	if Actor.hasBuffById(sysarg,162) then 
		Actor.sendTipmsg(sysarg,"已经存在膜拜buff了",ttFlyTip)
        return
	end
	
	
    --if var.d[33] == nil then
    --    var.d[33] = 0
    --end
    --if var.d[33] == 0 then
    --    Actor.sendTipmsg(sysarg,"今日膜拜次数已用完!",ttFlyTip)
    --    return
    --end
	
	
	--优先扣除绑定金币
    local dec_money = 100000
    if Actor.getMoneyCount(sysarg,mtBindCoin) < dec_money then
        if Actor.getMoneyCount(sysarg,mtCoin) < dec_money then
            Actor.sendTipmsg(sysarg,"金币不足,无法膜拜!",ttFlyTip)
            return
        end
        Actor.changeMoney(sysarg,mtCoin,-dec_money,2307,"膜拜盟主")
    else
        Actor.changeMoney(sysarg,mtBindCoin,-dec_money,2307,"膜拜盟主")
    end
    --添加增加经验的buff
    Actor.sendTipmsg(sysarg,"膜拜成功!",ttFlyTip)
    Actor.addBuffById(sysarg,162)
 
	OnFinish_Liveness(sysarg,16)

    --增加到提取的膜拜金币
    local sVar =  System.getStaticVar(sysarg)
    sVar.wulin.wulinMoney = sVar.wulin.wulinMoney + dec_money * 0.1 -- 百分之十
    --var.d[33] = var.d[33] - 1
	var.days.MBleftTime = var.days.MBleftTime -1
    return

end


--膜拜城主活动结束
function EndWorshipCity()
    print("膜拜城主活动结束")
    local playerList = LuaHelp.getAllActorList()
    for k, plyPtr in ipairs(playerList or {}) do
        if Actor.hasBuffById(plyPtr,162) then
            Actor.delBuffById(plyPtr,162)
        end

	end
end

function GetNpcBZDX() return t end