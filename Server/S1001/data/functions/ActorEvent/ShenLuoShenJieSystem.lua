--森罗神戒
--#include "data\config\item\SenLuoShenJieConfig.lua" once

function ShenLuoShenJie(sysarg, sysid, packet)
	
	if sysid ~= LogicCmd.miscSys.sub.cShenLuoShenJie then
		return
	end
	
	local msgid = DataPack.readByte(packet)--1请求神戒的等级
	if  msgid == 1 then 
		GetTheRingInfo(sysarg)--2请求开启神戒
	elseif msgid == 2 then 
		if System.isCrossServer() then
			return 
		end
		GetTheRing(sysarg)
	end

end
function GetTheRingInfo(sysarg)
    if System.isCrossServer() == true then return end
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.SLSJc ==nil then 
		sVar.SLSJc =0 
	end
	local netPack = DataPack.allocPacket(sysarg, 139, 207)
	DataPack.writeByte(netPack, 1) -- 1为下发戒指信息
	local equipItem_ptr = Item.getEquipByPos(sysarg, 48)
	local idIndex = 0
	if equipItem_ptr~=nil then 
		local itemid = Item.getItemId(equipItem_ptr)
		for i=1,#SenLuoShenJieConfig.RingId do 
			if itemid == SenLuoShenJieConfig.RingId[i] then 
				idIndex = i
			end
		end
	end

	local index = sVar.SLSJc
	
	--今天首次开启，数量加1
	--if sVar.days.SLSJc == nil and index ~= #SenLuoShenJieConfig.RingId then 
	if index ~= #SenLuoShenJieConfig.RingId then 
		if idIndex == 0 then 
			DataPack.writeByte(netPack, index+1)
		else 
			DataPack.writeByte(netPack, idIndex)
		end
		
		if sVar.SLSJTime == nil then 
			DataPack.writeUInt(netPack, 0)
		elseif SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime) <= 0 then 
			if equipItem_ptr~=nil then 
				DataPack.writeUInt(netPack, 60)
			else 
				DataPack.writeUInt(netPack, 0)
			end
		else 
			DataPack.writeUInt(netPack, SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime))
			--print("SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime)="..SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime))
		end
		--print("查看资料index为="..index+1)
	else 
		if idIndex == 0 then 
			DataPack.writeByte(netPack, index)
		else 
			DataPack.writeByte(netPack, idIndex)
		end
		
		if sVar.SLSJTime == nil then 
			DataPack.writeUInt(netPack, 0)
		elseif SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime) <= 0 then 
			if equipItem_ptr~=nil then 
				DataPack.writeUInt(netPack, 60)
			else 
				DataPack.writeUInt(netPack, 0)
			end
		else 
			DataPack.writeUInt(netPack, SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime))
			--print("SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime)="..SenLuoShenJieConfig.leftTime-(System.getCurrMiniTime()-sVar.SLSJTime))
		end
		--print("查看资料index为="..index)
	end	
	DataPack.flush(netPack)
end

function GetTheRing(sysarg)
    if System.isCrossServer() == true then return end
	--print("请求得到戒指")
	--装备位置
	local equipItem_ptr = Item.getEquipByPos(sysarg, 48)
	if equipItem_ptr~=nil then 
		Actor.sendTipmsg(sysarg, string.format("您已经开启了森罗神戒"), ttFlyTip)
		return 
	end
	--背包数量
	local nGridCount = Item.getBagEmptyGridCount(sysarg)
	if nGridCount < 1 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf060,1), ttFlyTip)
		return
	end
	
	--先扣钱
	if Actor.changeMoney(sysarg,3,-SenLuoShenJieConfig.needYb,2631,"shenluoshenjie") then 
		
		local sVar = Actor.getStaticVar(sysarg)
		if sVar.SLSJc ==nil then 
			sVar.SLSJc =0 
		end
		
		--今天首次开启，数量加1
		--if sVar.days.SLSJc == nil then 
			sVar.SLSJc = sVar.SLSJc + 1 
			if sVar.SLSJc > #SenLuoShenJieConfig.RingId then --超过60，就为60
				sVar.SLSJc = #SenLuoShenJieConfig.RingId
			end
			--sVar.days.SLSJc = 1
		--end
		local id = SenLuoShenJieConfig.RingId[sVar.SLSJc]
		--根据等级，求ids
		local newEquip_ptr = Item.createItem(id,1,0,0,1,SenLuoShenJieConfig.leftTime)
		if newEquip_ptr~=nil then 
			Item.addItem(sysarg,newEquip_ptr,"shenluoshenjie")
			Item.equipItem(sysarg, newEquip_ptr, 0, 48)	
			Actor.sendTipmsg(sysarg, string.format("恭喜您,森罗神戒开启成功"), ttFlyTip)
			sVar.SLSJTime=System.getCurrMiniTime()
			--写上传数据给前端！！
			
			local netPack = DataPack.allocPacket(sysarg, 139, 207)
			DataPack.writeByte(netPack, 2) -- 2为激活戒指成功
			--DataPack.writeByte(netPack, sVar.SLSJc)
			DataPack.flush(netPack)
		end
	else 
		Actor.sendTipmsg(sysarg, string.format("您的元宝不足,无法开启"), ttFlyTip)
		return 
	end
end

--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cShenLuoShenJie, ShenLuoShenJie)
