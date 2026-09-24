--#include "data\config\equipSynthesis\RingGodCfg.lua" once

handleRingGodSystem = function( sysarg, msgid, packet )
	local nType = DataPack.readByte(packet)
	if	nType== 1 then --获得信息
		SendRingGodInfo(sysarg)
	elseif nType== 2 then --升级戒灵
		RingGodLevelUp(sysarg)
	
	end
end

--获得信息
function SendRingGodInfo(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sRingGodSystem)
	DataPack.writeByte(netPack,1)--2外观广播(在c++实现了)
	DataPack.writeInt(netPack,Actor.getRingGodValue(sysarg))
	DataPack.writeInt(netPack,Actor.getRingGodLevel(sysarg))
	DataPack.flush(netPack)
end

--升级
function RingGodLevelUp(sysarg)
	
	local nowValue = Actor.getRingGodValue(sysarg)
	local nowLevel = Actor.getRingGodLevel(sysarg)
	
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local types =
	{	
		{5,6},
		{6,7},
		{6,7},
	}
	
	local epos, elevel1, elevelsCfg = GetEquipPosAndLevelByType(sysarg, types[myJob][1])	
	local epos, elevel2, elevelsCfg = GetEquipPosAndLevelByType(sysarg, types[myJob][2])	
	--print("elevel1="..elevel1)
	--print("elevel2="..elevel2)
	
	local minLevel = elevel1
	if minLevel>elevel2 then 
		minLevel = elevel2
	end
	
	local canTouchLevel  = 0
	local cfg = RingGodCfg.limitLevel
	local cfg2 = RingGodCfg.levelUp[nowLevel+1]
	
	for i=#cfg, 1 ,-1 do 
		if minLevel>=cfg[i][1] then 
			canTouchLevel =cfg[i][2]
			break
		end
	end

	if canTouchLevel==0 then 
		--Actor.sendTipmsg(sysarg,"系统未开启",ttFlyTip)
		return
	end
	
	if cfg2==nil then 
		Actor.sendTipmsg(sysarg,"已经满级",ttFlyTip)
		return
	end
	
	if nowLevel+1> canTouchLevel then 
		Actor.sendTipmsg(sysarg,"特戒等级不足，戒灵无法升星",ttFlyTip)
		return
	end 
	
	local needMoney = cfg2.needMoney
	--金钱是否足够
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= needMoney then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= needMoney then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,"金币/绑定金币不足",ttFlyTip);
		return
	end
	
	local needValue = cfg2.needValue
	if nowValue<needValue then 
		Actor.sendTipmsg(sysarg,"戒灵粉尘不足",ttFlyTip);
		return
	end
	
	--扣金钱
	Actor.changeMoney(sysarg,MC,-needMoney,LogIds.RingGodLevelUp,"戒灵升星")
	Actor.setRingGodValue(sysarg,nowValue-needValue)
	Actor.setRingGodLevel(sysarg,nowLevel+1)
	
	System.sendCommonLog(LogIds.RingGodLevelUp,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),nowLevel+1,nowValue ,nowValue-needValue, "","","戒灵升星","","")
	
	--给前端发协议
	SendRingGodInfo(sysarg)
	
	Actor.sendTipmsg(sysarg,"升星成功",ttFlyTip)
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	
	local tips = {{50,"攻击神威"},{100,"流星火雨"},{150,"戒灵护体"},{200,"戒灵破甲"},{250,"戒灵暴走"},{300,"戒灵吞噬"},}
	local hasTips =false
	for i=1,#tips do 
		if tips[i][1]==nowLevel+1 then 
			System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家将戒灵升至%s星,激活%s<我要升星/@@showWin,194>",Actor.getName(sysarg),tips[i][1],tips[i][2]),   ttChatWindow)	
			hasTips =true
			break
		end
	end
		
	if (nowLevel+1)%10==0 and hasTips ==false then 
		System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家将戒灵升至%s星,实力大增<我要升星/@@showWin,194>",Actor.getName(sysarg),nowLevel+1),   ttChatWindow)	
	end
end

function addRingGodValue(sysarg,value)
	value =tonumber(value)
	Actor.setRingGodValue(sysarg,value)
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cRingGodSystem, handleRingGodSystem)
