
--#include "data\functions\ExpandFunc\ActorReliveCommon.lua" once
	--#include "data\functions\Tasks\WuLinZhengBa\OnActorRelive.lua" once	--武林争霸晋级场复活

MiscsImplement.ClickReliveIcon = function (sysarg, msgid, packet)
	local reliveType = DataPack.readByte(packet) --复活类型，0 复活石复活 1元宝复活 2安全复活 3原地信春哥复活 4原地复活(先消耗物品再消耗元宝)
--    if Actor.getIntProperty(sysarg,PROP_ENTITY_ID) == 84108150 then
--        System.trace("ClickReliveIcon:"..Actor.getIntProperty(sysarg,PROP_CREATURE_HP).."reliveType:"..reliveType)
--    end
   -- print("复活类型:"..reliveType)
	if reliveType == 0 then
		UseItemRelive(sysarg)
	elseif reliveType == 1 then
		UseMoneyRelive(sysarg)
	elseif reliveType == 3 then
		-- local sid = Actor.getSceneId(sysarg)
		-- if WuLinZhengBaConst.RiseMapId == sid then
			-- OnWuLinZhengBaRelive(sysarg)
		-- else
			-- GoReliveFunc(sysarg, 4)
		-- end
	elseif reliveType == 4 then
		OnPlaceRelive(sysarg)
	else 
		safeResurrection(sysarg,{reliveType})
	end
	if Actor.hasBuff(sysarg,54,112) then
		local buffTime = Actor.getBuffRemainTime(sysarg,54,112)
		if buffTime > 0 then
			Actor.addEffect(sysarg,20,6,buffTime*1000)
		end
	end
    --记录一下日志
    local var = Actor.getStaticVar(sysarg)
    local nVipFreeCount = 0
    if var.days ~= nil and  var.days.VipFreeRelive ~= nil then
        nVipFreeCount = var.days.VipFreeRelive
    end
    System.sendCommonLog(LogIds.ReliveLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),tonumber(reliveType),nVipFreeCount)
end

MiscsImplement.ReliveTimeHandle = function (sysarg, msgid, packet)
	local nType = DataPack.readByte(packet) --类型，0 获取复活冻结时间 1元宝将冻结时间清零
	if nType == 0 then
		local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sActorReliveTimeHandle)  --申请一个数据包	
		if npack == nil then
			print("allocPacket is nil!")
			return
		end
		DataPack.writeInt(npack,Actor.getReliveTimeCD(sysarg,0))
		DataPack.flush(npack)
	else
		if Actor.getMoneyCount(sysarg,mtYuanbao) < 1000 then return end
		if Actor.getReliveTimeCD(sysarg,0) == 0 then
			Actor.sendTipmsg(sysarg,"您不需要刷新复活时间",ttFlyTip)
			return
		end
		--购买复活时间
		Actor.changeMoney(sysarg,mtYuanbao,-1000,GameLog.clConsumeYb,"使用元宝购买复活时间")
		Actor.setReliveTimeCD(sysarg,0,0)

		local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sActorReliveTimeHandle)  --申请一个数据包	
		if npack == nil then
			print("allocPacket is nil!")
			return
		end
		DataPack.writeInt(npack,Actor.getReliveTimeCD(sysarg,0))
		DataPack.flush(npack)
	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cClickReliveIcon, MiscsImplement.ClickReliveIcon)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cActorReliveTimeHandle, MiscsImplement.ReliveTimeHandle)