--#include "data\config\ActorEvent\HeChengCfg.lua" once

function HeChengHandle(sysarg,sysid,packet)
	--种类
	local ndiffType = DataPack.readByte(packet)
	--类型
    local nType = DataPack.readByte(packet)
	--索引
	local index = DataPack.readByte(packet)
	
	if ndiffType<1 or nType<1 or index<1 then
		local msg = string.format("传的参数不对 ndiffType=%d,nType=%d,index=%d", ndiffType, nType, index)
		print(msg)
		return
	end
	
	local type1Cfg = HeChengCfg[ndiffType]
	if type1Cfg == nil then 
		print("传的参数不对 ndiffType="..ndiffType)
		return 
	end
	
	local type2Cfg = type1Cfg[nType]
	if type2Cfg == nil then 
		print("传的参数不对 nType="..nType)
		return 
	end
	
	local itemCfg = type2Cfg[index]
	if itemCfg == nil then 
		print("传的参数不对 index="..index)
		return 
	end
	
	--print("ndiffType="..ndiffType..",nType="..nType..",index="..index)
	local awardCount = 1
	--羽毛和强化石要传第4个参数
	if ndiffType==2 or ndiffType==3 or ndiffType==5 or ndiffType==8 then 
		if DataPack.getReadPackAvaliableLength(packet) >= 4 then
			awardCount = DataPack.readUInt(packet)
			if awardCount <= 0 or awardCount >= 100000 then
				return
			end
		end
	end
	
	if ndiffType==4 then 
		local CombineDays = System.getDaysSinceCombineServer()
		if CombineDays <= 0 then 	--合服之后再显示这个饰品
			print("合服之前不开")
			return 
		end
	end
	
	local bindFlag = -1
    
    --if ndiffType == 7 then -- 坐骑装备要非绑定的才能合成(不限制了，配绑定时合成之后就是绑定的)
    --	bindFlag = 0
    --end	
	
	--检查是否够物品
	local needItemId1= itemCfg.id1	
	local needItemId2= itemCfg.id2
	local needItemCount1 = itemCfg.needcount1 * awardCount	
	local needItemCount2 = itemCfg.needcount2 * awardCount
	local itemCount1 = Actor.getItemCount(sysarg,needItemId1, -1, -1, bindFlag)
	local itemCount2 = 0
	
	--两件相同的物品合成一件
	local isSame =  false
	if needItemId1==needItemId2 then
		isSame= true
		itemCount2 = itemCount1
	else
		itemCount2 = Actor.getItemCount(sysarg,needItemId2, -1, -1, bindFlag)
	end
	
	if isSame==true then 
		if itemCount1 < needItemCount1+needItemCount2 then 
				Actor.sendTipmsg(sysarg, "合成的材料不够", ttFlyTip)
			return 
		end
	else 
		if itemCount1 < needItemCount1 or itemCount2 < needItemCount2 then 
			Actor.sendTipmsg(sysarg, "合成的材料不够", ttFlyTip)
			return 
		end
	end
	
	--第8个三个物品，特殊处理下
	if ndiffType ==8 then 
		local needItemId0= itemCfg.id0
		local needItemCount0 = itemCfg.needcount0 * awardCount	
		local itemCount0 = Actor.getItemCount(sysarg,needItemId0, -1, -1, bindFlag)
		if itemCount0 < needItemCount0 then 
				Actor.sendTipmsg(sysarg, "合成的材料不够", ttFlyTip)
			return 
		end
	end
	
	--检查是否够空间（因为删物品吗，再增加，所以不用检查）
	local award = { {type=0, id=itemCfg.id3, count=awardCount, bind=itemCfg.isbind} }
	
	if Awards.CheckBagGridCount(sysarg,award)~=true then 
		return 
	end	
		
	--检查扣钱,支持两种货币
	local jb = itemCfg.neeMoney * awardCount
    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= jb then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= jb then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("绑金或金币不足 <%s> ,合成失败.",jb), 256);
        return ;
    end    	
    	
	--删东西
	if isSame==true then --相同的物品,一起删除
		if Actor.removeItem(sysarg,needItemId1,(needItemCount1+needItemCount2),-1,-1,bindFlag,"装备合成扣除",LogIds.exHeChengZhuangBei) < (needItemCount1+needItemCount2) then
			return
		end
	else --不相同的物品
		if Actor.removeItem(sysarg,needItemId1,needItemCount1,-1,-1,bindFlag,"装备合成扣除",LogIds.exHeChengZhuangBei) < needItemCount1 then
			return
		end
		
		if Actor.removeItem(sysarg,needItemId2,needItemCount2,-1,-1,bindFlag,"装备合成扣除",LogIds.exHeChengZhuangBei) < needItemCount2 then
			local actorid = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			print("error,HeChengHandle 1 actorId="..actorid..",needItemId1="..needItemId1..",count="..needItemCount1)
			return
		end
		
		
		--第8个三个物品，特殊处理下
		if ndiffType ==8 then 
			local needItemId0= itemCfg.id0
			local needItemCount0 = itemCfg.needcount0 * awardCount	
			if Actor.removeItem(sysarg,needItemId0,needItemCount0,-1,-1,bindFlag,"装备合成扣除",LogIds.exHeChengZhuangBei) < needItemCount0 then
				return
			end
		end
	end
	
	if jb > 0 and Actor.changeMoney(sysarg, MC, -jb,LogIds.exHeChengZhuangBei, "装备合成") == false then
		local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		local msg = string.format("error,HeChengHandle 2 actorId=%d,ndiffType=%d,nType=%d,index=%d", actorid, ndiffType, nType, index)
		print(msg)
    	return
    end
    
    local btTaoStrong = 0
    if itemCfg.isRandTaoStrong ~= nil and itemCfg.isRandTaoStrong == 1 then
        btTaoStrong = 6
    end
    
	--给东西
	if Actor.addItem(sysarg, itemCfg.id3, 0,0,awardCount,itemCfg.isbind,0, "装备合成",LogIds.exHeChengZhuangBei, -1,0,-1,1,btTaoStrong) < awardCount then
		local msg = string.format("error,HeChengHandle 3 actorId=%d,ndiffType=%d,nType=%d,index=%d", actorid, ndiffType, nType, index)
		print(msg)
	end
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sHeCheng)  --申请一个数据包
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, string.format("合成%s*%s",Item.getItemName(itemCfg.id3),awardCount), ttFlyTip)
	--返回成功
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cHeCheng, HeChengHandle)