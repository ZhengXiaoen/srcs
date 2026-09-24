--lua script


  --#include "data\config\vocation\VocationConfig.lua" once

--疾风令的处理
--[[键入'ss'并按分号即可按模板生成脚本]]--
function RapidMoveItemCallback(sysarg,arg,award)
	local sceneID = arg[2]
	local posx = arg[3]
	local posy= arg[4]
	
	local svar = Actor.getStaticVar(sysarg)	
	local vipType = Actor.getVipType(sysarg)
	local isVip = Actor.isVip(sysarg)  -- 是否是VIP用户	
	
	if Actor.hasState(sysarg, esStateStall) then
		return
	end
	-- VIP免费传送剩余次数。如果为-1，不需要同步到客户端；如果不为-1，则同步给客户端
	local leftVIPFreeTelCount = -1
	local needConsumeItem = true
	if isVip then		
		local maxFreeTelCount = LocalDT.VIPFreeTelCountCfg[vipType+1] or 0
		if (maxFreeTelCount == -1) then			
			needConsumeItem = false
		else
			if (svar.days.VipFreeTelCnt == nil) then svar.days.VipFreeTelCnt = 0 end
			if (maxFreeTelCount > svar.days.VipFreeTelCnt) then
				svar.days.VipFreeTelCnt = svar.days.VipFreeTelCnt + 1
				leftVIPFreeTelCount = maxFreeTelCount - svar.days.VipFreeTelCnt
				needConsumeItem = false
				local npack = DataPack.allocPacket(sysarg,139,32)
				DataPack.writeInt(npack,leftVIPFreeTelCount)
				DataPack.flush(npack)	
			else
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000068, ttFlyTip)
			end
		end	
	end
	
	if (needConsumeItem) then
		if( 1==Actor.removeItem(sysarg,1559,1,-1,-1,-1," ",5) ) then      --删除一个物品
			System.telportScene(sysarg,sceneID,posx,posy)
		end
	end
end

registerScriptCallBack(5,RapidMoveItemCallback)

