--#include "data\config\ActorEvent\HeChengNeedGrid.lua" once

function HeChengHandleByGrid(sysarg,sysid,packet)
	--种类
	local ndiffType = DataPack.readByte(packet)
	if ndiffType==1 then 
		HandleHeCheng_ZhiZhunTuLong(sysarg,packet)
	end

end

--至尊屠龙
HandleHeCheng_ZhiZhunTuLong =function(sysarg,packet)
	local index = DataPack.readByte(packet)

	local cfg =HeChengNeedGrid.ZhiZhunTuLong[index]
	if cfg == nil then return end
	
	local itemTable ={}
	local itemPtrTable ={}
	for i=1,#cfg.HeChengNeed do
		local guid = DataPack.readInt64(packet)

		local pItemPtr =Item.getBagItemPtrByGuid(sysarg,guid)
		--不存在
        if pItemPtr == nil then
		    Actor.sendTipmsg(sysarg, "物品不存在", ttFlyTip)
			return 
		end
		
		local nItemId = Item.getItemProperty(sysarg, pItemPtr, Item.ipItemID)
		if nItemId ~= cfg.HeChengNeed[i] then
			return
		end
		
		for j, v in ipairs(itemTable) do
			if v == guid then
				return -- 前端伪造协议，同一个GUID传了两次
			end
		end
		
		table.insert(itemTable, guid)
		table.insert(itemPtrTable, pItemPtr)
	end

	
	--检查扣钱,支持两种货币
	local jb = cfg.neeMoney 
    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= jb then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= jb then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("绑金或金币不足 <%s> ,合成失败.",jb), 256);
        return ;
    end   
	
	if jb > 0 and Actor.changeMoney(sysarg, MC, -jb,LogIds.exHeChengZhuangBei, "装备合成2") == false then
    	return
    end

	
	--扣除物品
	for i, ptr in ipairs(itemPtrTable) do
		if Item.removeItem(sysarg,ptr,1,"装备合成2",LogIds.exHeChengZhuangBei) ~=1 then 
			Actor.sendTipmsg(sysarg,"扣除物品失败", 256)
			System.trace("hecheng2 removeItem fail"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return 
		end
	end

	--给合成的物品
	local btTaoStrong = 0
    if cfg.isRandTaoStrong ~= nil and cfg.isRandTaoStrong == 1 then
        btTaoStrong = 6
    end
    
	--给东西
	if Actor.addItem(sysarg, cfg.id, 0,0,1,cfg.isbind,0, "装备合成2",LogIds.exHeChengZhuangBei, -1,0,-1,1,btTaoStrong) < 1 then
		System.trace("hecheng2 addItem fail"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
	end
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sHeChengByGrid)  --申请一个数据包
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, string.format("合成%s成功",Item.getItemName(cfg.id)), ttFlyTip)
	
	
	
	local szBracast = "<(c0xFFffd658)>震惊!!! <(c0xFF00c0ff)%s区><(c0xFFffd658)玩家><(c0xFF00c0ff)%s><(c0xFFffd658)合成了><(c0xFFFF0000)%s><(c0xFFffd658)!><(c0xFFffd658)以前揍过Ta的人要小心了!!>"

	local szLocalServer = ""
	local nLocalServerId = 0
	if System.isCrossServer() then
		nLocalServerId = Actor.getActorRawServerId(sysarg)
	else
		nLocalServerId = System.getLocalServerId()
	end
	szLocalServer = tostring(nLocalServerId)
                
	System.SendPlatformMsg(string.format(szBracast, szLocalServer, Actor.getName(sysarg), Item.getItemName(cfg.id)), ttMousePosTip)
	
end












MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cHeChengByGrid, HeChengHandleByGrid)