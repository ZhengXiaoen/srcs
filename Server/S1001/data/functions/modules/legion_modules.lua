
function on_msg_legionDonate(sysarg,sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cLegionDonate then
		print("error on_msg_legionDonate, sysid="..sysid)
		return
	end
	
	local type = DataPack.readByte(packet)
	local count = DataPack.readInt(packet)
	count = math.abs(count)
	donateGoldEx(sysarg,type,count)
	
end

--捐献金币
--type 金币类型
--count 金币数量
function donateGoldEx(sysarg,type,count)

	type = tonumber(type)
	count = tonumber(count)
	if type ~= mtCoin and type ~= mtBindCoin then
		return
	end
	if Actor.getMoneyCount(sysarg,type) < count then
		Actor.sendTipmsg(sysarg,"金币不足，无法捐献",ttFlyTip)
		return
	end
	--要写日志
	Actor.changeMoney(sysarg,type,-count,LogIds.juntuanJuanXian,"军团捐献")
	local var = Actor.getStaticVar(sysarg)
	var.legionOffer = var.legionOffer + count
	
	Actor.sendTipmsg(sysarg,"捐献成功,获得"..count.."点贡献值",ttFlyTip)
	
	--判断是否超过军团长
	local sVar = System.getStaticVar()
	local legionId = Actor.getLegionId(sysarg)
	
	sVar.legion[legionId].AllOffer = sVar.legion[legionId].AllOffer + count --加军团总贡献度
	
	local actor = nil
	
	if var.legionOffer > sVar.legion[legionId].Offer and Actor.getName(sysarg) ~= sVar.legion[legionId].Master then
		--将之前的军团长的称号撤下
		if sVar.legion[legionId].Master ~=  "" then
			actor = Actor.getActorPtrByName(sVar.legion[legionId].Master)
			if actor ~= nil then
				
				Actor.setTopTitle(actor,LEGIONID[legionId].HeadTitle,false)
			end
			
		end
		
		--给予新的军团长称号称号
		sVar.legion[legionId].Offer = var.legionOffer
		sVar.legion[legionId].Master = Actor.getName(sysarg)
        sVar.legion[legionId].ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		Actor.setTopTitle(sysarg,LEGIONID[legionId].HeadTitle,true)

		Actor.sendTipmsg(sysarg,"恭喜你成为军团长，享受5%攻击倍率",ttFlyTip)
		
		local sTips = "恭喜【"..Actor.getName(sysarg).."】成为"..LEGIONID[legionId].Name.."军团长,享受5%攻击倍率.[军团使者]处可以提升为军团长!"
		System.broadcastTipmsg(sTips,ttScreenCenter)
		System.broadcastTipmsg(sTips,ttChatWindow)
	end
	--同步军团战贡献度
	
	if Actor.getName(sysarg) == sVar.legion[legionId].Master then
		sVar.legion[legionId].Offer = var.legionOffer
	end
	
	local netPack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sLegionDonate)
	DataPack.writeByte(netPack,11)
	DataPack.flush(netPack)
	
end