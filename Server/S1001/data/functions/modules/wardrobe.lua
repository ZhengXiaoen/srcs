-- 衣橱模块 -----------------------------------

--#include "data\config\modules\wardrobe_cfg.lua" once


-- 激活时装
function wardrobe_activate_dress(sysarg, packet)
	-- 槽位ID，从 1 开始，最大 16
	local slotId = DataPack.readByte(packet)
	if slotId < 1 or slotId > 16 then return end
	
	local count = DataPack.readByte(packet)
	if count <= 0 then return end
	
	local sexDress = DataPack.readByte(packet) -- 0 为男时装；1 为女时装
	if sexDress ~= 0 or sexDress ~= 1 then return end
	
	local dressCfg = wardrobe_cfg.dress_list[sexDress][slotId]
	if not dressCfg then return end	
	
	local dressId = dressCfg[1]
	count = Actor.removeItem(sysarg,dressId,count,-1,-1,-1,itemName,LogIds.WardrobeDeleteDress)
	if count <= 0 then return end	
	
	-- 衣橱(byte1-2:时装激活标志；byte3:穿戴的时装；byte4:衣橱等级)
	local wardrobe_data = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE)	
	if System.getIntBit(wardrobe_data, slotId - 1) == 0 then
		wardrobe_data = System.setIntBit(wardrobe_data, slotId - 1, true)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE, wardrobe_data)
	end
	
	local addExp = dressCfg[2] * count
	if addExp <= 0 then return end
		
	local oldExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP)
	local newExp = oldExp + addExp
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP, newExp)
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorName = Actor.getName(sysarg)	
	System.sendCommonLog(LogIds.WardrobeAddExp, actorId, actorName, oldExp,newExp,dressId)
		
	local itemName = Item.getItemName(dressId)
	Actor.sendTipmsg(sysarg, "您成功激活了时装:"..itemName..",经验增加了:"..addExp, ttFlyTip)
end

-- 穿上时装
function wardrobe_take_on_dress(sysarg, packet)
	-- 槽位ID，从 1 开始，最大 16
	local slotId = DataPack.readByte(packet)
	if slotId < 1 or slotId > 16 then return end
	
	-- 衣橱(byte1-2:时装激活标志；byte3:穿戴的时装；byte4:衣橱等级)
	local wardrobe_data = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE)	
	if System.getIntBit(wardrobe_data, slotId - 1) == 0 then
		Actor.sendTipmsg(sysarg, "您还没有激活该时装", ttFlyTip)
		return
	end
	
	if System.getIntByte(wardrobe_data, 2) == slotId then
		return
	end
	
	wardrobe_data = System.setIntByte(wardrobe_data, 2, slotId)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE, wardrobe_data)
	
	if Actor.getSocialMask(sysarg, smWardrobeHideDress) == false then
		Actor.collectOperate(sysarg,1) -- 重新计算外观
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sWardrobeModule)
	DataPack.writeByte(netPack, 1)	-- 穿上时装
	DataPack.writeByte(netPack, 1)	-- 成功	
	DataPack.flush(netPack)
end

-- 脱下时装
function wardrobe_take_off_dress(sysarg, packet)	
	-- 衣橱(byte1-2:时装激活标志；byte3:穿戴的时装；byte4:衣橱等级)
	local wardrobe_data = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE)	
	if System.getIntByte(wardrobe_data, 2) == 0 then
		return -- 没有穿
	end	
	
	wardrobe_data = System.setIntByte(wardrobe_data, 2, 0)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE, wardrobe_data)
	
	if Actor.getSocialMask(sysarg, smWardrobeHideDress) == false then
		Actor.collectOperate(sysarg,1) -- 重新计算外观
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sWardrobeModule)
	DataPack.writeByte(netPack, 2)	-- 脱下时装
	DataPack.writeByte(netPack, 1)	-- 成功	
	DataPack.flush(netPack)	
end

-- 升级
function wardrobe_upgrade(sysarg, packet)	
	local exp = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP)
	if exp <= 0 then return end
	
	local wardrobe_data = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE)	
	local level = System.getIntByte(wardrobe_data, 3)
	local nextLevel = level + 1
	
	-- 改为只配基础属性，等级属性 = 基础属性 X 等级
	--local levelcfg = wardrobe_cfg.level_list[nextLevel]
	local levelcfg = wardrobe_cfg.level_list[1]
	if levelcfg == nil then return end
	
	local needExp = levelcfg.exp -- 需要的经验都一样
	
	if exp < needExp then
		Actor.sendTipmsg(sysarg, "升级需要衣橱经验："..needExp, ttFlyTip)
		return
	end
	
	local newExp = exp - needExp
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP, newExp)
	
	wardrobe_data = System.setIntByte(wardrobe_data, 3, nextLevel)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE, wardrobe_data)
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorName = Actor.getName(sysarg)	
	System.sendCommonLog(LogIds.WardrobeUpgrade, actorId, actorName, nextLevel,exp,newExp)
	
	Actor.collectOperate(sysarg,0) -- 重新计算角色属性
	
	Actor.sendTipmsg(sysarg, "您的衣橱成功升级到了"..nextLevel.."级", ttFlyTip)
end

-- 隐藏时装外观
function wardrobe_hide_dress(sysarg, packet)
	local isHide = DataPack.readByte(packet) ~= 0
	
	if Actor.getSocialMask(sysarg, smWardrobeHideDress) == isHide then
		return
	end
	
	Actor.setSocialMask(sysarg,smWardrobeHideDress,isHide)
	Actor.collectOperate(sysarg,1) -- 重新计算外观
end

-- 客户端消息-衣橱
function on_msg_wardrobe(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cWardrobeModule then
		print("error on_msg_wardrobe, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 激活时装
		wardrobe_activate_dress(sysarg, packet)	
	elseif msgid == 2 then -- 穿上时装
		wardrobe_take_on_dress(sysarg, packet)
	elseif msgid == 3 then -- 脱下时装
		wardrobe_take_off_dress(sysarg, packet)
	elseif msgid == 4 then -- 升级
		wardrobe_upgrade(sysarg, packet)
	elseif msgid == 5 then -- 隐藏时装外观
		wardrobe_hide_dress(sysarg, packet)
	else
		print("error on_msg_wardrobe, unknown msgid="..msgid)
		return
	end

end


--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cWardrobeModule, on_msg_wardrobe)
