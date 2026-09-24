--天降红包
--#include "data\config\ActorEvent\TianJiangHongBaoCfg.lua" once

function TianJiangHongBao(sysarg, sysid, packet)
	local nType = DataPack.readByte(packet)
	if nType == 1 then --请求数据
		SendTianJiangHongBao(sysarg)
	elseif nType == 2 then --请求领取红包
		local index = DataPack.readByte(packet) --第几个红包
		local var = Actor.getStaticVar(sysarg)
		
		--已经领取过天降红包b的不能领取天降红包a
		if var.TJHB_index2 ~=nil and var.TJHB_index2~=0 then 
			return 
		end
	
		if var.TJHB_index ==nil then 
			var.TJHB_index =0
		end
		if var.TJHB_index >= index then 
			Actor.sendTipmsg(sysarg,"已经领取该红包了，不能再领", ttFlyTip) 
			return 
		end
		
		if var.TJHB_index+1 < index then 	
			Actor.sendTipmsg(sysarg,"请把上一档领取了，再领这一档", ttFlyTip) 
			return 
		end
		
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		if index ==1 then --直接领取
			if pLv<TianJiangHongBaoCfg.startLevel1 then --等级不满足要求
				Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
				return 
			end
			if not Awards.CheckBagGridCount(sysarg, TianJiangHongBaoCfg.Awards1) then
				return
			end
			var.TJHB_index =1
			Awards.Give(sysarg, TianJiangHongBaoCfg.Awards1, LogIds.TianJiangHongBao, "天降红包1")
			System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
			SendTianJiangHongBao(sysarg)
			
		elseif index ==2 then --要判断金钱够不够
			if pLv<TianJiangHongBaoCfg.startLevel2 then --等级不满足要求
				Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
				return 
			end
            if not Awards.CheckBagGridCount(sysarg, TianJiangHongBaoCfg.Awards2) then
                --Actor.sendTipmsg(sysarg, "包裹空间不足。", ttFlyTip)
				return
			end
			
			--天降红包2改为不需要钱
			--if Actor.changeMoney(sysarg,3,-TianJiangHongBaoCfg.needmoney,LogIds.TianJiangHongBao, "天降红包2")==false then 
			--	Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
			--	return 
			--end

			var.TJHB_index =2
			Awards.Give(sysarg, TianJiangHongBaoCfg.Awards2, LogIds.TianJiangHongBao, "天降红包2")
			System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
			SendTianJiangHongBao(sysarg)
		elseif index ==3 then --要判断金钱够不够
			if pLv<TianJiangHongBaoCfg.startLevel3  then --等级不满足要求
				Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
				return 
			end
            if not Awards.CheckBagGridCount(sysarg, TianJiangHongBaoCfg.Awards3) then
				return
			end
			if Actor.changeMoney(sysarg,3,-TianJiangHongBaoCfg.needmoney1,LogIds.TianJiangHongBao, "天降红包3")==false then 
				Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
				return 
			end

			var.TJHB_index =3
			Awards.Give(sysarg, TianJiangHongBaoCfg.Awards3, LogIds.TianJiangHongBao, "天降红包3")
			System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
			SendTianJiangHongBao(sysarg)
			
		elseif index ==4 then --要判断金钱够不够
			if pLv<TianJiangHongBaoCfg.startLevel4  then --等级不满足要求
				Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
				return 
			end
            if not Awards.CheckBagGridCount(sysarg, TianJiangHongBaoCfg.Awards4) then
				return
			end
			if Actor.changeMoney(sysarg,3,-TianJiangHongBaoCfg.needmoney2,LogIds.TianJiangHongBao, "天降红包4")==false then 
				Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
				return 
			end

			var.TJHB_index =4
			Awards.Give(sysarg, TianJiangHongBaoCfg.Awards4, LogIds.TianJiangHongBao, "天降红包4")
			System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
			SendTianJiangHongBao(sysarg)

		elseif index ==5 then --要判断金钱够不够
			if pLv<TianJiangHongBaoCfg.startLevel5  then --等级不满足要求
				Actor.sendTipmsg(sysarg, "等级不满足要求", ttFlyTip)
				return 
			end
            if not Awards.CheckBagGridCount(sysarg, TianJiangHongBaoCfg.Awards5) then
				return
			end
			if Actor.changeMoney(sysarg,3,-TianJiangHongBaoCfg.needmoney3,LogIds.TianJiangHongBao, "天降红包5")==false then 
				Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
				return 
			end

			var.TJHB_index =5
			Awards.Give(sysarg, TianJiangHongBaoCfg.Awards5, LogIds.TianJiangHongBao, "天降红包5")
			System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红包，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
			SendTianJiangHongBao(sysarg)
		end
	elseif nType == 3 then
        local var = Actor.getStaticVar(sysarg)
		if var.TJHL_index == nil then
            var.TJHL_index = 0
        end
        local index = DataPack.readByte(packet) --第几个红包

       if var.TJHL_index >= index or var.TJHL_index >= #SkyDropBonusCfg then 
			Actor.sendTipmsg(sysarg,"已经领取该红利了，不能再领", ttFlyTip) 
			return 
		end
		
		if var.TJHL_index+1 < index then 	
			Actor.sendTipmsg(sysarg,"请把上一档领取了，再领这一档", ttFlyTip) 
			return 
		end
       
        local cfg = SkyDropBonusCfg[var.TJHL_index + 1]
        local nPower = Actor.getIntProperty(sysarg,PROP_ACTOR_BATTLE_POWER)
        if nPower < cfg.batter then
            Actor.sendTipmsg(sysarg,"战力不足,无法领取", ttFlyTip) 
			return 
        end
        if not Awards.CheckBagGridCount(sysarg, cfg.award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取", ttFlyTip) 
				return
		end
        if Actor.changeMoney(sysarg,3,-cfg.needYB,LogIds.tianjianghongli, "天降红利"..index)==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
			return 
		end

        Awards.Give(sysarg, cfg.award, LogIds.tianjianghongli, "天降红利"..index)
		System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红利，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
        var.TJHL_index = var.TJHL_index  +1
		SendTianJiangHongBao(sysarg)
        
    end
	

end
function SendTianJiangHongBao(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.TJHB_index ==nil then 
		var.TJHB_index = 0
	end

	local netPack = DataPack.allocPacket(sysarg, 139, 232)
	DataPack.writeByte(netPack,2)
	DataPack.writeByte(netPack,var.TJHB_index)
	DataPack.flush(netPack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cTianJiangHongBao, TianJiangHongBao)