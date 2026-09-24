--vip挂机地图
--#include "data\config\VipGuaJiConfig.lua" once

--进入地图的处理：增加定时器，发送协议给前端
enterGuaJiScene = function(sysarg)

	--增加定时器发奖励
	Actor.addTimer(sysarg,41,1000*5)
	
	--给前端协议让它知道是否是双倍经验的
	local var = Actor.getStaticVar(sysarg)
	if var.vipGuaJi == nil then 
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJi)
		DataPack.writeUInt(netPack, 0) --1是双倍的，0是非双倍的
		DataPack.flush(netPack)
	else 
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJi) 
		DataPack.writeUInt(netPack, var.vipGuaJi * 5) --1是双倍的，0是非双倍的
		DataPack.flush(netPack)
	end
	
end


--Vip挂机(请求购买双倍收益)
function VipGuaJi(sysarg,sysid,packet)
 	
	--判断是否已经购买了
	local var = Actor.getStaticVar(sysarg)
	--if var.vipGuaJi ~= nil then 
		--Actor.sendTipmsg(sysarg,"您已经是双倍经验中，无需再购买",ttFlyTip)
		--return 
	--end
	--判断是否够钱
	if VipGuaJiConfig.NeedMoney > Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO) then
		Actor.sendTipmsg(sysarg,"您的元宝数量不足",ttFlyTip)
		return 
	end
	--扣钱
	Actor.changeMoney(sysarg,3,-VipGuaJiConfig.NeedMoney,LogIds.BuyVipGuaJiDouble,"vip挂机双倍奖励") 
	--给奖励
	if var.vipGuaJi == nil then
		var.vipGuaJi = VipGuaJiConfig.DoubleExpTime
	else 
		var.vipGuaJi = VipGuaJiConfig.DoubleExpTime + var.vipGuaJi
	end
	
	--给前端协议告诉前端
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sVipGuaJi)
	DataPack.writeUInt(netPack, var.vipGuaJi * 5) --1是双倍的，0是非双倍的
	DataPack.flush(netPack)
	
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cVipGuaJi, VipGuaJi)