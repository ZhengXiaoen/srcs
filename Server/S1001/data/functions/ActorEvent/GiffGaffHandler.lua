--#include "data\functions\ActorEvent\Utils.lua" once

-- 红包在c++处理
-- 赠送索要操作
EventCallDispatcher.handleGiffGaffOpt = function(sysarg, args)
	local optType = args[1]				-- 子操作类型赠送、索要
	local nGiftType = args[2]			-- 礼物类型
	
	if optType == 2 then							-- 赠送给对方
		local itemPtr = args[3]				-- 物品指针
		local nValue = args[4]				-- 礼物里的数值(鲜花 1/9/99/999, 红包 元宝数)
		local nCount = args[5]				-- 数量
		local targetActor = args[6]			-- 目标指针
		local nGiftHandle = args[7]		-- 礼物句柄
		
		local bResult;
		if nGiftType == 1 then						-- 鲜花
			if not targetActor then
				return false;
			end
			return givingFlower(sysarg, nGiftType, itemPtr, nValue, nCount, targetActor, nGiftHandle);
		end
	elseif optType == 3 then					-- 向对方索要
		local pTagPtr = args[3]			-- 目标ID
		return claimGift(sysarg, nGiftType, pTagPtr);
	end
	return false;
end

-- 赠送鲜花
function givingFlower(sysarg, nGiftType, itemPtr, nValue, nCount, targetActor, nGiftHandle)
	local selftHandle = Actor.getHandle(sysarg);
	local nTargetHandle = Actor.getHandle(targetActor);

	local flowerCount = 0
	if selftHandle == nTargetHandle then
		-- 赠送给自己
		-- 删除物品
		local delCount = Item.removeItem(sysarg, itemPtr, 1, "赠送鲜花", LogIds.GivingGiftToFriands);
		if delCount <= 0 then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.GG00004), ttFlyTip);
			return false; 
		end
		
		-- 改变魅力值
		local nCharmNum = Actor.changeCharm(sysarg, nValue)
		
		local tipsmsg = string.format(Lang.ScriptTips.GG00002, nValue, nCharmNum);
		Actor.sendTipmsg(targetActor, tipsmsg, ttFlyTip);
		System.broadCastRecvFlower(itemID);
		
		flowerCount = nValue
	else
		-- 赠送给别人
		-- 删除物品
		local itemID = Item.getItemId(itemPtr);
		if itemID <= 0 then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.GG00004), ttFlyTip);
			return false; 
		end
		
		local delCount = Item.removeItem(sysarg, itemPtr, 1, "", LogIds.GivingGiftToFriands);
		if delCount <= 0 then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.GG00004), ttFlyTip);
			return false; 
		end
		
		local selftName = Actor.getName(sysarg);
		local targetName = Actor.getName(targetActor);

		-- xxx赠送1朵玫瑰给xxx,为对方增加1点魅力	
		--【系统】xxx赠送1朵玫瑰给xxx,为对方增加1点魅力我也要赠送
		-- 恭喜您获得3点魅力,数量:30点魅力
		
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.GG00006, nCount, targetName), ttFlyTip);
		
		-- 发离线消息提示对方
		local nActorId = Actor.getIntProperty(targetActor, PROP_ENTITY_ID);
		local nSrcId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
		local strTitle = string.format(Lang.ScriptTips.GG00101, selftName);
		
		-- 43消息类型 c++ mtGiveGiftToPlayer = 43,	// 赠送礼物给玩家
		-- 赠送 礼物类型 礼物句柄 物品id 数量 赠送者名
		--//鲜花基础ID定为470,玫瑰朵数
		local itemData = {1, 9, 99, 999};
		flowerCount = itemData[itemID - 470 + 1];
		
		local pack = DataPack.allocPacketEx();
		DataPack.writeByte(pack, 2);
		DataPack.writeByte(pack, 1);
    DataPack.writeUInt(pack, nGiftHandle);
    DataPack.writeWord(pack, itemID);
    DataPack.writeWord(pack, flowerCount);
    DataPack.writeInt(pack, System.getCurrSystemTime());
   	DataPack.writeString(pack, selftName);
		System.sendOfflineMsgEx(nActorId, 43, pack, nSrcId);
		DataPack.freePacketEx(pack)	
	end
	
	--完成成就
	Actor.triggerAchieveEvent(sysarg,38,flowerCount)
	return true;
end


-- 鲜花离线消息处理
function flowerOfflineMsgHandle(sysarg, strGiverName, itemID)
	if not itemID or itemID <= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.GG00007, ttFlyTip);
		return false;
	end
	
	-- 全服添加鲜花buff并全服播放鲜花特效
	local itemData = {1, 9, 99, 999};
	local nValue = itemData[itemID - 470 + 1];
	if not nValue then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.GG00007, ttFlyTip);
		return false;
	end
	
	-- 改变魅力值
	local nCharmNum = Actor.changeCharm(sysarg, nValue)
	
	-- 广播全服
	local selftName = Actor.getName(sysarg);
	local tipmsg = string.format(Lang.ScriptTips.GG00005, strGiverName, nValue, nValue);
	local sysmsg = string.format(Lang.ScriptTips.GG00001, strGiverName, nValue, selftName, nValue);
	Actor.sendTipmsg(sysarg, tipmsg, ttFlyTip);
	System.broadcastTipmsg(sysmsg, ttScreenCenter + ttChatWindow);
	
	System.broadCastRecvFlower(itemID);
	return true;
end

-- 红包离线消息处理
function redPacketOfflineMsgHandle(sysarg, strGiverName, nGiverID, itemID, nCount)

end

-- 赠送红包
function givingRedPacket(sysarg, nGiftType, llItemGuid, nCount, nTargetHandle, targetActor)

end


-- 向对方索要
function claimGift(sysarg, nGiftType, pTagPtr)
	-- 是否向自己索要
	if Actor.getHandle(targetActor) == Actor.getHandle(sysarg) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.GG00003, ttFlyTip);
		return false;
	end
	
	-- 发离线消息提示对方
	local nSrcId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
	local nActorID = Actor.getIntProperty(pTagPtr, PROP_ENTITY_ID);
	local selftName = Actor.getName(sysarg);
	local targetName = Actor.getName(pTagPtr);
	
	local strTips;
	if nGiftType == 1 then
		strTips = string.format(Lang.ScriptTips.GG00011, targetName);
	elseif nGiftType == 2 then
		strTips = string.format(Lang.ScriptTips.GG00012, targetName);
	end
	Actor.sendTipmsg(sysarg, strTips, ttFlyTip);
	
	-- 43消息类型 c++ mtGiveGiftToPlayer = 43,					// 赠送礼物给玩家
	-- 索要 礼物类型 角色名 
	local strMsg = "3"..tostring(nGiftType)..selftName;
	
	local pack = DataPack.allocPacketEx();
	DataPack.writeByte(pack, 3);
	DataPack.writeByte(pack, nGiftType);
  DataPack.writeString(pack, selftName);
	System.sendOfflineMsgEx(nActorID, 43, pack, nSrcId);
	DataPack.freePacketEx(pack);
	return true;
end

-- 赠送礼物离线处理
EventCallDispatcher.OfflineMsgHanldeGivingGift = function(sysarg, args)
	local optType = args[1];
	local nGiftType = args[2];
	local itemID = args[3];
	local strGiveName = args[4];
	local ret = false;
	if nGiftType == 1 then						-- 鲜花
		ret = flowerOfflineMsgHandle(sysarg, strGiveName, itemID);
	end
	return ret;
end

--注册回调函数
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGiffGaffOpt, EventCallDispatcher.handleGiffGaffOpt)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGivingGiftOfflineOpt, EventCallDispatcher.OfflineMsgHanldeGivingGift);