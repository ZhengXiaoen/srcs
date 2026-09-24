--天降红包
--#include "data\config\ActorEvent\TianJiangHongBao_BCfg.lua" once

function TianJiangHongBao2(sysarg, sysid, packet)
	local nType = DataPack.readByte(packet)
	if nType==0 then 
		SendTianJiangHongBaoAorB(sysarg)
	elseif nType == 1 then --请求数据
		SendTianJiangHongBao2(sysarg)
	elseif nType == 2 then --请求领取红包
		local index = DataPack.readByte(packet) --第几个红包
		local var = Actor.getStaticVar(sysarg)
		
		--已经用过天降红包a，不能领取天降红包b
		if var.TJHB_index~=nil and var.TJHB_index~=0 then 
			return 
		end
		
		--红包已经领取了
		if var.TJHB_index2 ==nil then 
			var.TJHB_index2 =0
		end
		if var.TJHB_index2 >= index then 
			Actor.sendTipmsg(sysarg,"已经领取该红包了，不能再领", ttFlyTip) 
			return 
		end
		
		--一档一档领取
		if var.TJHB_index2+1 < index then 	
			Actor.sendTipmsg(sysarg,"请把上一档领取了，再领这一档", ttFlyTip) 
			return 
		end
		
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		local cfg = TianJiangHongBaoCfg2[index]
		if  cfg==nil then 
			return 
		end
		if pLv<cfg.startLevel  then --等级不满足要求
			Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
			return 
		end
		if not Awards.CheckBagGridCount(sysarg, cfg.Awards) then
			return
		end
		if cfg.needmoney~=0 then 
			if Actor.changeMoney(sysarg,3,-cfg.needmoney,LogIds.TianJiangHongBao, "新天降红包"..index)==false then 
				Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
				return 
			end
		end
		var.TJHB_index2 =index
		Awards.Give(sysarg, cfg.Awards, LogIds.TianJiangHongBao, "新天降红包"..index)
		System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
		SendTianJiangHongBao2(sysarg)
	end

end
function SendTianJiangHongBao2(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	--已经用过天降红包a，不能领取天降红包b
	if var.TJHB_index~=nil and var.TJHB_index~=0 then 
		return 
	end
	if var.TJHB_index2 ==nil then 
		var.TJHB_index2 = 0
	end
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTianJiangHongBao2)
	DataPack.writeByte(netPack,1)
	DataPack.writeByte(netPack,var.TJHB_index2)
	DataPack.flush(netPack)
end

--检测是用天降红包A还是B
function SendTianJiangHongBaoAorB(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TJHB_index = var.TJHB_index
	if TJHB_index ==nil then 
		TJHB_index = 0
	end
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTianJiangHongBao2)
	DataPack.writeByte(netPack,0)
	if TJHB_index==0 then 
		DataPack.writeByte(netPack,2) --使用天降红包b
	else
		DataPack.writeByte(netPack,1) --使用天降红包a
	end
	DataPack.flush(netPack)
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTianJiangHongBao2,TianJiangHongBao2) 