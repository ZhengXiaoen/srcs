--符文兑换
--#include "data\config\BossRune\BossRuneCfg.lua" once

function FuWenChange(sysarg, sysid, packet)

	local msgid = DataPack.readByte(packet)
	if  msgid == 1 then --兑换方式1
		local level = DataPack.readByte(packet)
		onChangeAllFuWen(sysarg,level)
	elseif msgid == 2 then --兑换方式2
		onChangeFuWen(sysarg,packet)
	end

end

function onChangeFuWen(sysarg,packet)
	local count = DataPack.readByte(packet)
	
	local itemTable ={}
	local addItemcount = 0
	for i=1,count do 	
		itemTable[i] = DataPack.readInt64(packet)
        local pItemPtr =Item.getBagItemPtrByGuid(sysarg,itemTable[i])
		
		--不存在
        if pItemPtr == nil then
			return 
		end

		local itemID = Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID) 
		--print("i="..i)
		--print("itemID="..itemID)
		
		for j=1,#BossRuneCfg.exchange do
			if BossRuneCfg.exchange[j]~=nil then 
				if BossRuneCfg.exchange[j].value~=0 then 
					if itemID>=BossRuneCfg.exchange[j].item[1] and itemID<=BossRuneCfg.exchange[j].item[#BossRuneCfg.exchange[j].item] then 
						addItemcount = addItemcount + BossRuneCfg.exchange[j].value
						System.sendCommonLog(2666,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"兑换符文"..itemID)
						break
					end
				end
			end
		end
	end
	
	--扣除物品
	for i=1,count do 
		Item.removeItem(sysarg,Item.getBagItemPtrByGuid(sysarg,itemTable[i]),1,"兑换符文",2666)
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.RuneCount == nil then var.RuneCount = 0 end
	var.RuneCount = var.RuneCount + addItemcount
		
	--Actor.addItem(sysarg, BossRuneCfg.semenitemid, 0,0,addItemcount,0,0)
	Actor.sendTipmsg(sysarg,string.format("获得符文精华%s,当前总数为%s",addItemcount,var.RuneCount),256)
	
	--返还给前端兑换成功
	local netPack = DataPack.allocPacket(sysarg, 139, 208)
	DataPack.flush(netPack)
end

function onChangeAllFuWen(sysarg,level)
	level = tonumber(level)
	local index =  level
	--if level>11 or level <1 or level==8 or level ==10 then 
	--	return 
	--end
	--if level==9 then 
	--	index = 8
	--elseif level==11 then 
	--	index = 9
	--end
	
	local cgf = BossRuneCfg.exchange[index]
	local itemCount = 0
	local addJingHuaCount = 0
	if cgf~=nil then
		for i=1,#cgf.item do 
			local oneCount = 0
			oneCount = Actor.getItemCount(sysarg,cgf.item[i])
			if oneCount~= 0 then 
				if 	Actor.removeItem(sysarg,cgf.item[i],oneCount,-1,-1,-1,"兑换符文",2666) then 
					itemCount = itemCount + oneCount
				end
			end
		end
	end
	--判断背包的容量问题(不用判断，因为符文不可以叠加，副本精华可以叠加)
	if itemCount~= 0 then 
		addJingHuaCount = itemCount*cgf.value
		--Actor.addItem(sysarg, BossRuneCfg.semenitemid, 0,0,addJingHuaCount,0,0)
		local var = Actor.getStaticVar(sysarg)
		if var.RuneCount == nil then var.RuneCount = 0 end
		var.RuneCount = var.RuneCount + addJingHuaCount
		
		Actor.sendTipmsg(sysarg,string.format("获得符文精华%s,当前总数为%s",addJingHuaCount,var.RuneCount),256)
		
		System.sendCommonLog(2666,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"兑换"..index.."转s符文")
		
		--返还给前端兑换成功
		local netPack = DataPack.allocPacket(sysarg, 139, 208)
		DataPack.flush(netPack)
	else 
		Actor.sendTipmsg(sysarg,string.format("您的背包里面没有此类符文碎片"),256)
	end
end


--前端发送协议
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cFuWenChange, FuWenChange)