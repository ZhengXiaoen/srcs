--#include "data\config\activity\ActivityGiftConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

 function GetLoginGiftResult(sysarg,IsLogin)
	
	--获取玩家是否领取登录器奖励标示	
	local var = Actor.getStaticVar(sysarg)
	if not var.LoginMark then
		var.LoginMark = 0
	end 

	--已领取过
	if var.LoginMark == 1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.c000181,ttFlyTip)
		return
	end

	--0:网页登录   1：登陆器登录
	if IsLogin == 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf547,ttFlyTip)
		return
	end

	--检查背包空格
	if not Awards.CheckBagGridCount(sysarg, ActivityGiftConfig.LoginGiftConfig) then
		return
	end
	
	--奖品一个物品给玩家
	Awards.Give(sysarg, ActivityGiftConfig.LoginGiftConfig, 209, Lang.ScriptTips.zf548)
	
	var.LoginMark = 1
	--Actor.setUIntProperty(sysarg, PROP_ACTOR_LOGINMARKS, 1)
	--下发客户端成功领取
--[[	local netPack = DataPack.allocPacket(sysarg, 139, 87)
	DataPack.writeByte(netPack, 0)
	DataPack.flush(netPack)--]]
    --腾讯QQ空间
    local str = ""
    if System.getSpid()==99 then
        str = string.format("<(n%s)>首次登录QQ空间《散人传说》,领取了登录特权奖励。",Actor.getName(sysarg))
    else
        string.format(Lang.ScriptTips.zf601,Actor.getName(sysarg))
    end
	System.broadcastTipmsg(str,128)
	Quest_ShuaXin(sysarg)
	return true
end

MiscsImplement.handleGetLoginGiftOp = function (sysarg, msgid,packet)
	if not packet then return false end
	local IsLoginToots = DataPack.readByte(packet)
	if IsLoginToots >= 0 then
		GetLoginGiftResult(sysarg, IsLoginToots)
	end
end

--收藏游戏
MiscsImplement.handleCollectGame = function (sysarg, msgid,packet)
	--if System.getSpid() ~= 1 then -- XY 平台
	--	print("error handleCollectGame platformId ~= XYT")
	--	return
	--end
	
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < 1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.qrj006,ttFlyTip) --等级不足
		return
	end
	
	--获取玩家是否领取登录器奖励标示	
	local var = Actor.getStaticVar(sysarg)
	if var.CollectGame then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.c000181,ttFlyTip) --已领取过
		return
	end 
	
	--奖品一个物品给玩家
	if Awards.Give(sysarg, ActivityGiftConfig.CollectGameGiftConfig, 209, "CollectGame award") ~= true then
		return -- 背包空间不够
	end
	
	var.CollectGame = 1

	--关闭图标
	AllActivityButtonState(sysarg,93,0)
end

--注册回调函数	
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.sSendLoginGiftResult, MiscsImplement.handleGetLoginGiftOp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cCollectGame, MiscsImplement.handleCollectGame)