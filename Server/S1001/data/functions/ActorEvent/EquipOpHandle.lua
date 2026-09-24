--lua script
--处理法宝系统相关的操作

--#include "data\config\item\MagicItem.lua" once --
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\config\equipSynthesis\EquipSynthesisConfig.lua" once --装备兑换
--#include "data\config\equipSynthesis\EquipMelting.lua" once
--#include "data\config\equipSynthesis\EquipArtifact.lua" once
--#include "data\config\item\itemEnhance\GodEquip.lua" once
--#include "data\config\equipSynthesis\EquipInlayCfg.lua" once

EquipOpId = 
{
	enInsure = 1,		--装备投保
	enSynthesis = 2,    --装备合成
	enMelting = 3,		--装备回收
	enAlchemy = 4,		--炼金材料
	enAlchemyState = 5,	--获取炼金状态
	enEquipArtifact = 6, --天兵神器
	enExtractDiamond = 7, --提取金刚石
	enExChangeMaterial = 8, --材料兑换金刚石
	enGodMaterialSynth = 9, --神装材料兑换
	enGemstoneSynthesis = 10,	--合成宝石
	enEquipInlayStone = 11,	--镶嵌宝石
	enEquipUnloadStone = 12, --卸下宝石
}

EquipOpFuncList = {}

ExtractDiamondCfg =   --提取金刚石配置
{
	{
		needDiamond = 1,
		award={type=0,id=936,count=1},
	},
	{
		needDiamond = 10,
		award={type=0,id=936,count=10},
	},
	{
		needDiamond = 100,
		award={type=0,id=936,count=100},
	}
}
--MiscsImplement.EquipMedalInfoBack = function( sysarg,msgid,packet )

--MiscsImplement.HandleEquipArtifactLevel = function ( sysarg,msgid,packet )
	--sendRefreashArtifactLevel(sysarg)
--end

EventCallDispatcher.HandlerEquipOp = function (sysarg, args)
	--print("HandlerEquipOp================"..args[1])
	if args[1] == nil then return end   --
	local func = EquipOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args)
	end
end

-- 返回负数失败; 0 有合成但不命中; 1 有合成且命中
function DoEquipSynthesis(sysarg, synthesisItemCfg, isTooltip)
	if synthesisItemCfg == nil then return -1 end
	
	-- 检测材料是否足够
	local consume = synthesisItemCfg.consume
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, consume, isTooltip, consumeData)
	if ret == false or not ret then 
		return -1
	end
		
	local award = synthesisItemCfg.award	
	local dupCount = Item.getItemPropertyById(award.id, Item.ipItemDupCount) -- 叠加数
	
	local bind = 0;
	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	local nSuperLevel = 0
	local tNonEquip = {};
	local nCount = 1;
	for i, tab in ipairs(consume) do
		if tab.type ~= 0 then
			tNonEquip[nCount] = tab;
			nCount = nCount + 1;
		else
			for i = 1, tab.count do
				local nMaterialItem = Item.getBagItemPtrById(sysarg, tab.id)
				if nMaterialItem == nil then
					print("error 装备合成 nMaterialItem == nil actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..tab.id)
					return -1
				end
				
				if Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemBind) == 1 then
					bind = 1;
				end
				
				if Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemStrong) > nStrong then
					nStrong = Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemStrong)
					nStrongLimit = Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemStrongLimit)
				end
				if Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemAppraisal) > nBlood then
					nBlood = Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemAppraisal)
				end
				if Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemSuperAttrLevel) > nSuperLevel then
					nSuperLevel = Item.getItemProperty(sysarg, nMaterialItem, Item.ipItemSuperAttrLevel)
				end
				
				if Actor.removeItemByPtr(sysarg, nMaterialItem, 1) ~= 1 then
					print("error 装备合成 removePtr error actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..tab.id)
					return -1
				end

			end
		end
	end
	
	--扣除材料及费用
	ret = DeductAllConsume(sysarg, false, tNonEquip, GameLog.cNewEquipSynthesisConsume)
	if ret == false or not ret then 
		return -1
	end
		
	if math.random(1, 10000) > synthesisItemCfg.rate then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0003, Item.getItemName(award.id)), ttFlyTip)
		return 0 -- 不命中
	end	
	
	local nNewItem = Item.createItem(award.id, award.count, nStrong, 0, bind, 0);
	Item.addItem(sysarg, nNewItem, "合成面板锻造", 53)
	
	-- 不允许叠加的物品才能设置
	if dupCount == 1 then
		Item.setItemProperty(sysarg, nNewItem, Item.ipItemStrongLimit, nStrongLimit)
		Item.setItemProperty(sysarg, nNewItem, Item.ipItemAppraisal, nBlood)
		Item.setItemProperty(sysarg, nNewItem, Item.ipItemSuperAttrLevel, nSuperLevel)
	end

	Actor.triggerAchieveEvent(sysarg, 105, 1)

	OneHundredSynthesisEquip(sysarg, award.id)
	return 1 -- 命中
end

--装备合成
EquipOpFuncList[EquipOpId.enSynthesis] = function (sysarg,args)
    
--	local nSynthesisType = args[2] --合成类型
--	local nType = args[3] -- 子类型
--	local nIndex = args[4] --兑换物品的索引
--	local nItemId = args[5] --要兑换的ID
--	local isOneKey = args[6] --是否一键合成

--	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)

--	--判断配置是否存在
--	local config = EquipSynthesisConfig[nSynthesisType]
--	if config ~= nil then
--		config = config[nType]
--	end

--	if config == nil then 
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip)
--		return
--	end 

--	local synthesisCfg = config.synthesis[nJob]
--	if synthesisCfg == nil then
--		if nJob == 2 or nJob == 3 then
--			synthesisCfg = config.synthesis[1] -- 不分职业
--		end		
--	end

--	if synthesisCfg == nil then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip)
--		return
--	end

--	local synthesisItemCfg = synthesisCfg[nIndex]
--	if synthesisItemCfg == nil then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
--		return
--	end

--	-- 0表示一直显示, 其他数值为新区第几天后显示
--	if synthesisItemCfg.openday ~= nil and synthesisItemCfg.openday > 0 then
--		local days = System.getDaysSinceOpenServer();		
--		if days < synthesisItemCfg.openday then
--			return;
--		end
--	end

--	local award = synthesisItemCfg.award
--	if not award or award.id ~= nItemId then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
--		return 
--	end

--	-- 背包至少要有一个空格子
--	if Item.getBagEmptyGridCount(sysarg) <= 0 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.c00007, ttFlyTip)
--		return
--	end

--	local successCount = -1

--	if isOneKey == 0 then
--		successCount = DoEquipSynthesis(sysarg, synthesisItemCfg, true)		
--	else
--        local nLoopIndex = 0
--		while true do
--			local _ret = DoEquipSynthesis(sysarg, synthesisItemCfg, successCount <= 0)
--			if _ret < 0 then
--				break
--			else
--				successCount = successCount + _ret
--			end
--            nLoopIndex = nLoopIndex + 1
--            if nLoopIndex > 10000 then
--                 System.trace("LoopIndex EquipOpFuncList[EquipOpId.enSynthesis]")
--                 break
--            end
--		end
--	end

--	if successCount < 0 then
--		return
--	elseif successCount == 0 then
--		Actor.sendTipmsg(sysarg, "合成失败！概率未命中", ttFlyTip)
--		return
--	end

--	local successName = Item.getItemName(award.id)
--	Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.eoh0004, successName), ttFlyTip)

--	local netPack = DataPack.allocPacket(sysarg, 8, 19)
--	DataPack.writeByte(netPack, nSynthesisType)
--	DataPack.flush(netPack)

--	if synthesisCfg.notice ~= nil and synthesisCfg.notice == true then
--		local name = Actor.getName(sysarg)
--		local result = string.format(Lang.ScriptTips.eoh0006, name, successName)
--		System.broadcastTipmsg(result, 2048)
--	end
end

-- 材料合成
EquipOpFuncList[EquipOpId.enGemstoneSynthesis] = function(sysarg, args)
--[[
	local nSynthesisType = args[2] --1 普通合成  2 高级合成
	local nType = args[3] -- 兑换的类型
	local nIndex = args[4] --兑换物品的索引
	local nItemId = args[5] --要兑换的ID
	
	--判断配置是否存在
	local config = EquipSynthesisConfig[nSynthesisType][nType];
	if not config then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip)
		return;
	end

	local synthesisCfg = config.synthesis[1][nIndex];
	if not synthesisCfg then
		Actor.sendTipmsg( sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
	end

	-- 0表示一直显示, 其他数值为新区第几天后显示
	if synthesisCfg.openday > 0 then
		local days = System.getDaysSinceOpenServer();
		if not days then
			return;
		end
		
		if days < synthesisCfg.openday then
			return;
		end
	end

	local award = synthesisCfg.award
	if not award or award.id ~= nItemId then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
		return 
	end

	-- 检测材料是否足够
	local consume = synthesisCfg.consume
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, consume, true, consumeData)
	if ret == false or not ret then 
	--	Actor.sendTipmsg( sysarg, Lang.ScriptTips.eoh0007, ttFlyTip)
		return false 
	end
	
	--扣除材料及费用
	ret = DeductAllConsume(sysarg, false, consume, GameLog.cNewEquipSynthesisConsume)
	if ret == false or not ret then return false end
	
	if math.random(1, 10000) > synthesisCfg.rate then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0003, Item.getItemName(award.id)), ttFlyTip)
		return;
	end
	
	local nNewItem = Item.createItem(award.id, award.count);
	Item.addItem(sysarg, nNewItem, "合成面板锻造", 53)
	local successName = Item.getItemName(award.id)
	Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.eoh0004, successName), ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 8, 19)
	DataPack.writeByte(netPack, nSynthesisType)
	DataPack.flush(netPack)
	
	if synthesisCfg.notice == false then return false end
	local name = Actor.getName(sysarg)
	local result = string.format(Lang.ScriptTips.eoh0006, name, successName)
	System.broadcastTipmsg(result, 2048)
	--]]
end

--镶嵌宝石
EquipOpFuncList[EquipOpId.enEquipInlayStone] = function(sysarg, args)
--	local btHole = args[2];
--	local equipPtr = args[3];				-- 装备指针
--	local stonePtr = args[4];				-- 宝石指针

--	--装备镶嵌
--	-- 镶嵌孔开启标记
--	local tHoleIsOpen = {
--		Item.ipItemHole1IsOpen,
--		Item.ipItemHole2IsOpen,
--		Item.ipItemHole3IsOpen,
--		Item.ipItemHole4IsOpen,
--		Item.ipItemHole5IsOpen,
--	}
--	-- 镶嵌孔位
--	local tHoleEnum = {
--		Item.ipItemHole1Item,
--		Item.ipItemHole2Item,
--		Item.ipItemHole3Item,
--		Item.ipItemHole4Item,
--		Item.ipItemHole5Item,
--	}

--	if btHole < 1 or btHole > 5 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
--		return false;
--	end

--	local stoneID = Item.getItemId(stonePtr);
--	local stoneName = Item.getItemName(stoneID);

--	-- 此宝石是否可用来镶嵌
--	local nCurrIndex = 0;
--	local tStoneID = EquipInlayCfg[btHole];
--	for i=1, #tStoneID do
--		if stoneID == tStoneID[i] then
--			nCurrIndex = i;
--			break;
--		end
--	end

--	if nCurrIndex == 0 then
--		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0010, stoneName), ttFlyTip);
--		return false;
--	end


--	-- 装备是否可以镶嵌
--	local itemType = Item.getItemProperty( sysarg, equipPtr, Item.ipItemType, 0);
--	if not itemType or itemType < 1 or itemType > 10 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.eoh0011, ttFlyTip)
--		return false;
--	end

--	-- 开启镶嵌孔
--	if Item.getItemProperty(sysarg, equipPtr, tHoleIsOpen[btHole], 0) == 0 then
--		Item.setItemProperty(sysarg, equipPtr, tHoleIsOpen[btHole], 1);
--	end

--	-- 孔位上镶有宝石
--	local oldItemIDIndex = Item.getItemProperty(sysarg, equipPtr, tHoleEnum[btHole], 0);
--	if oldItemIDIndex ~= nil and oldItemIDIndex > 0 then
--		-- 孔位上的宝石跟需要当前的宝石一个等级
--		if tStoneID[oldItemIDIndex] == tStoneID[nCurrIndex] then
--			return false;
--		end

--		-- 获取背包格子
--		local count = Item.getBagEmptyGridCount(sysarg)
--		if count <= 0 then
--			Actor.sendTipmsg(sysarg, Lang.ScriptTips.dm010, ttFlyTip);
--			return false;
--		end

--		-- 将旧的宝石卸下放回背包,再换当前要镶嵌的
--		local oldItemPtr = Item.createItem(tStoneID[oldItemIDIndex], 1, 0, 0, 1);
--		Item.addItem(sysarg, oldItemPtr, "宝石卸下放回背包", LogIds.EquipInlayStone, 1);
--		Item.setItemProperty(sysarg, equipPtr, tHoleEnum[btHole], 0);
--	end

--	-- 删除物品
--	if Actor.removeItemByPtr(sysarg, stonePtr, 1, true, stoneName, LogIds.EquipInlayStone) <= 0 then
--		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0009, stoneName), ttFlyTip);
--		return false;
--	end

--	Item.setItemProperty(sysarg, equipPtr, tHoleEnum[btHole], nCurrIndex);
--	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0012, stoneName), ttFlyTip);

--	local netPack = DataPack.allocPacket(sysarg, 8, 31)
--	DataPack.flush(netPack)
	return true;
end

--卸下宝石
EquipOpFuncList[EquipOpId.enEquipUnloadStone] = function(sysarg, args)
--	local btHole = args[2];
--	local equipPtr = args[3];				-- 装备指针

--	if btHole > 5 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
--		return false;
--	end

--	-- 镶嵌孔位
--	local tHoleEnum = {
--		Item.ipItemHole1Item,
--		Item.ipItemHole2Item,
--		Item.ipItemHole3Item,
--		Item.ipItemHole4Item,
--		Item.ipItemHole5Item,
--	}

--	local itemIDIndex = Item.getItemProperty(sysarg, equipPtr, tHoleEnum[btHole], 0);
--	if not itemIDIndex or itemIDIndex <= 0 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.eoh0014, ttFlyTip)
--		return false;
--	end

--	-- 获取背包格子
--	local count = Item.getBagEmptyGridCount(sysarg)
--	if count <= 0 then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.dm010, ttFlyTip);
--		return false;
--	end

--	local tStoneID = EquipInlayCfg[btHole];
--	local stoneName = Item.getItemName(tStoneID[itemIDIndex]);
--	local stonePtr = Item.createItem(tStoneID[itemIDIndex], 1, 0, 0, 1);
--	Item.addItem(sysarg, stonePtr, "宝石卸下放回背包", LogIds.EquipInlayStone, 1);
--	Item.setItemProperty(sysarg, equipPtr, tHoleEnum[btHole], 0);
--	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.eoh0013, stoneName), ttFlyTip);

--	local netPack = DataPack.allocPacket(sysarg, 8, 31)
--	DataPack.flush(netPack)
	return true;
end

--百服活动合成装备
function OneHundredSynthesisEquip(sysarg,nItemId)
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	if not OneHundredActivityCfg then return end
	local config = OneHundredActivityCfg.MissionStepGift[5]
	
	local var = Actor.getStaticVar(sysarg)
	
	if not var.MissionStep then
		return
	elseif var.MissionStep ~= 4 then 
		return
	end
	
	if not var.HundreaSynthesisEquipNum then
		var.HundreaSynthesisEquipNum = 0
	end
	
	local needCircle = Item.getItemPropertyById(nItemId, Item.ipItemNeedCircle)
	if needCircle < config.synthesisEquipCircle then
		return
	end
	
	var.HundreaSynthesisEquipNum = var.HundreaSynthesisEquipNum + 1
	if var.HundreaSynthesisEquipNum >= config.finishCount then
		var.MissionStep = 6
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf356,5),ttDialog)
	end
end

--提取金刚石
EquipOpFuncList[EquipOpId.enExtractDiamond] = function (sysarg,args)
--	local nType = args[2] --提取的类型 1 提取10颗 2提取100颗

--	if nType == 1 or nType == 2 or nType == 3 then
--		local config = ExtractDiamondCfg[nType]

--		local nGridCount= Item.getBagEmptyGridCount(sysarg)
--		local nNeedCount = 1

--		if nGridCount < nNeedCount then
--			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf242,ttFlyTip)
--			return
--		end

--		local stone = Actor.getUIntProperty(sysarg, PROP_ACTOR_STONE)		
--		if stone < config.needDiamond then
--			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf249,config.needDiamond),ttFlyTip)
--			return
--		end

--		stone = stone - config.needDiamond
--		Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)

--		Actor.addItem(sysarg,config.award.id,0,0,config.award.count,config.award.bind,0,"提取金刚石",952,-1)
--		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf251,ttFlyTip)
--	end
end

--向前端发送当前神器神甲法宝等级
function sendRefreashArtifactLevel(sysarg)
	local var = Actor.getStaticVar(sysarg)

	local nEquipWeaponLevel = var.equipWeaponLevel
	if not var.equipWeaponLevel then
		nEquipWeaponLevel = 0
	end

	local nEquipMentLevel = var.equipMentLevel
	if not var.equipMentLevel then
		nEquipMentLevel = 0
	end

	local nMagicEquipLevel = var.magicEquipLevel
	if not var.magicEquipLevel then
		nMagicEquipLevel = 0
	end

	local netPack = DataPack.allocPacket(sysarg, 139,129)
	DataPack.writeByte(netPack, nEquipWeaponLevel)  -- 1
	DataPack.writeByte(netPack,nEquipMentLevel)
	DataPack.writeByte(netPack,nMagicEquipLevel)
	DataPack.flush(netPack)

end

--天兵神器
EquipOpFuncList[EquipOpId.enEquipArtifact] = function (sysarg,args)
	---声明这么多变量 还不如分函数处理  下次优化
	local nType = args[2] --类型
	local level = args[3] --兑换的等级
	local config = nil
	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local nGridCount = nil
	local var = Actor.getStaticVar(sysarg)
	local consume = {}
	local consumeData = {}
	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = -1
	local award = {}
	local itemName,isOk,nMaterialItem,ret

	if nType == 1 or nType == 2 then --1神器2神甲3法宝
		if level <= 0 then return end
		
		if nType == 1 then 
			config = EquipArtifact.EquipWeapon[level]
		elseif nType == 2 then
			config = EquipArtifact.EquipMent[level]
		end
		if config == nil then return end

		nGridCount= Item.getBagEmptyGridCount(sysarg)
		local nNeedCount = 1

		if nGridCount < nNeedCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf242,ttFlyTip)
			return
		end
		
		local stone = Actor.getUIntProperty(sysarg, PROP_ACTOR_STONE)
		if stone < config.needDiamond then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf249,config.needDiamond),ttFlyTip)
			return
		end
		
		local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX )

		for i=1,table.getn(config.consume) do
			if (config.consume[i].sex == nil or config.consume[i].sex == nSex) then
				table.insert(consume,config.consume[i])
			end
		end
		
		ret = CheckAllConsume(sysarg, false, consume, true, consumeData)
		if ret == false or not ret then return false end

		nMaterialItem = Item.getBagItemPtrById(sysarg,consume[1].id)

		if nMaterialItem then		
			if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong) > nStrong then
				nStrong = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong)
				nStrongLimit = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrongLimit)
			end
			if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal) > nBlood then
				nBlood = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal)
			end
		end

		isOk = DeductAllConsume(sysarg, false, consume, GameLog.cNewEquipArtifactConsume)
		if isOk == false then return end

		stone = stone - config.needDiamond
		Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)

		for i=1,table.getn(config.award) do
			if config.award[i].sex == nil or config.award[i].sex == nSex then
				award = config.award[i]
			end
		end

		itemName = Item.getItemName(award.id)
		Actor.addItem(sysarg,award.id,0,nStrong,award.count,award.bind,0,"天兵神器锻造",2301,-1,nBlood,nStrongLimit)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf250,Actor.getName(sysarg),itemName),128+2)
		System.sendCommonLog(2302,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),award.id)

		if nType == 1 then
			-- var.equipWeaponLevel = level
			-- if level == 1 then
			-- 	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf666,"一",2),2048)
			-- 	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf672,Actor.getName(sysarg),"一",2),2)
			-- 	System.sendCommonLog(2300,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),2)
			-- 	stone = stone + 2
			-- 	Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)
			-- elseif level == 2 then
			-- 	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf666,"二",4),2048)
			-- 	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf672,Actor.getName(sysarg),"二",4),2)
			-- 	System.sendCommonLog(2300,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),award.id,4)
			-- 	stone = stone + 4
			-- 	Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)
			-- elseif level == 3 then
			-- 	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf666,"三",8),2048)
			-- 	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf672,Actor.getName(sysarg),"三",8),2)
			-- 	System.sendCommonLog(2300,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),award.id,8)
			-- 	stone = stone + 8
			-- 	Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)
			-- end
			Quest_ShuaXin(sysarg)
		elseif nType == 2 then
			var.equipMentLevel = level
		elseif nType == 3 then
			var.magicEquipLevel = level
		end

		--学习技能
		local skillIds = {68,72,73}
		local fullSkillID = skillIds[nJob]
		if var.equipWeaponLevel ~= nil and var.equipWeaponLevel >= 12 and var.equipMentLevel ~= nil and var.equipMentLevel >= 12 then
			if Actor.getSkillLevel(sysarg,fullSkillID) == 0 then
				Actor.startLearnSkill(sysarg,fullSkillID,1)
			end
		end

		sendRefreashArtifactLevel(sysarg)

	elseif nType == 3 then
		local nDays = System.getDaysSinceOpenServer();	--开区天数
		--法宝在第五天开启 前4天请求无效
		if nDays < 5 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf658,ttFlyTip)
			return
		end
		config = EquipArtifact.MagicEquip[level]
		if not config then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf659,ttFlyTip)
			return
		end

		if var.magicEquipLevel ~= nil and var.magicEquipLevel >= level then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf660,ttFlyTip)
			return
		end

		nGridCount= Item.getBagEmptyGridCount(sysarg)
		if nGridCount < 1 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf242,ttFlyTip)
			return
		end

		local stone = Actor.getUIntProperty(sysarg, PROP_ACTOR_STONE)
		if stone < config.needDiamond then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf249,config.needDiamond),ttFlyTip)
			return
		end
		
		for i=1,table.getn(config.consume) do
			if config.consume[i].job == nil or config.consume[i].job == nJob then
				table.insert(consume,config.consume[i])
			end
		end

		ret = CheckAllConsume(sysarg, false, consume, true, consumeData)
		if ret == false or not ret then return false end

		if level > 1 then

			-- 由于后面新加配置没有将装备放在配置的最前端 在这个地方单独做个ID判断
			local magicItemID = consume[1].id
			if magicItemID == 900 then
				magicItemID = consume[2].id
			end
			nMaterialItem = Item.getBagItemPtrById(sysarg,magicItemID)
			if nMaterialItem then		
				if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong) > nStrong then
					nStrong = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong)
					nStrongLimit = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrongLimit)
				end
				if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal) > nBlood then
					nBlood = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal)
				end
			end
		else
			nStrong = 0
			nStrongLimit = 12
			nBlood = 0
		end

		isOk = DeductAllConsume(sysarg, false, consume, GameLog.cNewMagicEquipConsume)
		if isOk == false then return end
		for i=1,table.getn(config.award) do
			if config.award[i].job == nJob then
				award = config.award[i]
			end
		end
		stone = stone - config.needDiamond
		Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)
		
		local itemName = Item.getItemName(award.id)
		Actor.addItem(sysarg,award.id,0,nStrong,award.count,award.bind,0,"法宝锻造",2301,-1,nBlood,nStrongLimit)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf250,Actor.getName(sysarg),itemName),128+2)
		System.sendCommonLog(2302,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL),award.id)
		if nType == 1 then
			var.equipWeaponLevel = level
		elseif nType == 2 then
			var.equipMentLevel = level
		elseif nType == 3 then
			var.magicEquipLevel = level
		end
		sendRefreashArtifactLevel(sysarg)
	end
end

--装备投保
EquipOpFuncList[EquipOpId.enInsure] = function (sysarg,args)
--	local itemPtr = args[2]	--处理的装备指针
--	local nCount = args[3]	--投保次数

--	local nCount = tonumber(nCount)

--	local equipGuid = Item.getItemGuid(itemPtr)
--	local equipPtr, nItemPos, nHeroId = Item.getEquipItemPtr(sysarg, equipGuid, 0, 0)

--	if equipPtr == nil then return end

--	if nItemPos ~= 1 and nItemPos ~= 2 and nItemPos ~= 3 then return end

--	local bBind = Item.getItemProperty(sysarg, equipPtr, Item.ipItemBind,0)
--	if bBind ~= 0 then 
--		return 
--	end

--	local nowTimes = Item.getItemProperty(sysarg, equipPtr, Item.ipItemInsureTimes,0)

--	if nowTimes >= 10000 then 
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.insure001, ttFlyTip)
--		return 
--	end

--	local needPrice = Item.getItemProperty(sysarg, equipPtr, Item.ipItemInsure,0)

--	local needYb = nCount * needPrice

--	local needGold = nCount * GlobalConfig.equipInsureGold

--	if needYb <= 0 or needGold <= 0 then return end

--	local goldCount = Actor.getMoneyCount(sysarg, mtCoin)
--	if goldCount < needGold then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.insure002, ttFlyTip)
--		return 
--	end

--	local ybCount = Actor.getMoneyCount(sysarg, mtYuanbao)
--	if ybCount < needYb then
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.insure003, ttFlyTip)
--		return 
--	end

--	if Actor.changeMoney(sysarg, mtCoin, -needGold, GameLog.clEquipInsure, Lang.LogTips.l00164) ~= true then
--		return 
--	end
--	if Actor.changeMoney(sysarg, mtYuanbao, -needYb, GameLog.clEquipInsure, Lang.LogTips.l00164) ~= true then
--		return 
--	end

--	if Item.setItemProperty(sysarg, equipPtr, Item.ipItemInsureTimes, nowTimes + nCount) ~= true then
--		System.trace("set equip insure error guid=%I64d",equipGuid)
--		return
--	end

--	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.insure004, Item.getItemName(Item.getItemId(equipPtr)), nowTimes + nCount), ttFlyTip)

end

function CheckSameGuid(GuidList,Guid)
	
	for i = 1,table.getn(GuidList) do
		if Item.IsGuidSame(GuidList[i],Guid) then
			return false
		end
	end
	return true
end

function GetnCurEquipValue(itemType,config)
	
	if itemType >= 3 and config.equipPos >= 3 then
		return true
	elseif config.equipPos == Item.itWeapon and itemType == Item.itWeapon then
		return true
	elseif config.equipPos == Item.itDress and itemType == Item.itDress then
		return true
	end
	
	return false
end

function AddAwardToList(award, awardList)	
	if award.count <= 0 then return end
	
	--每天回收的总经验有限制，所以只要是奖励经验的都归到id==0那里去，避免配置出错时(type=2,id~=0)造成总经验不准
	local id = award.id
	if award.type == 2 then id = 0 end	
	
	if awardList[award.type] == nil then
		awardList[award.type] = {}
		awardList[award.type][id] = award.count
	elseif awardList[award.type][id] == nil then
		awardList[award.type][id] = award.count
	else
		awardList[award.type][id] = awardList[award.type][id] + award.count
	end				
end

function GetEquipReclaimAward(sysarg, config, nItemId, itemPtr)
	-- local minCircle = Item.getItemPropertyById(nItemId, Item.ipItemNeedCircle)
	-- local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0)

	-- if config.CircleEquip ~= nil and minCircle > 0 then
	-- 	for _,circleCfg in ipairs(config.CircleEquip) do
	-- 		if circleCfg.circle == minCircle then
	-- 			if GetnCurEquipValue(itemType,circleCfg) then				
	-- 				return circleCfg.award
	-- 			end
	-- 		end
	-- 	end	
	-- else
		-- local needLevel = Item.getItemPropertyById(nItemId, Item.ipItemActorLevel)
		for _,normalCfg in ipairs(config.NormalEquip) do				
			if nItemId >= normalCfg.minid and nItemId <= normalCfg.maxid then
				-- if GetnCurEquipValue(itemType,normalCfg) then				
					return normalCfg.award					
				-- end
			end
		end
	-- end
	
	return nil
end

function GetEquipReclaimExpFromAwards(awards)
	if awards == nil then return 0 end
	
	local awardexp = 0
	for _,one_award in ipairs(awards) do
		if one_award.type == 2 then
			awardexp = awardexp + one_award.count
		end
	end
	return awardexp
end

local function GetGodEquipRecycleAward(sysarg, config, nItemId, itemPtr)
	local minCircle = Item.getItemPropertyById(nItemId, Item.ipItemNeedCircle)
	local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0)

	for i,v in ipairs(config[minCircle]) do
		if itemType == v.equipPos then
			return v.award
		end
	end
	return nil
end

--神装回收
local function GodEquipRecyle(sysarg,args)
	if not EquipMelting then return end
	local config = EquipMelting.EquipReclaim.GodEquip
	if config == nil then return end

	local nItemCount = args[2]
	local packet = args[4]

	local nEquipItemPtr = {}   --存储物品指针用来最后删除
	local nEquipGuidList = {}  --把取出的每个物品的GUID储存,用来检测是否已存在一样的,有则是通过非法手段来进行
	local awardList = {{type = 0, count = 0 ,id = 716},{type = 0, count = 0 ,id = 718},{type=5,count=0,id=0}}
	local nCount = 0
	for i=1,nItemCount do
		local itemGuid = DataPack.readUint64(packet)
		if not CheckSameGuid(nEquipGuidList,itemGuid) then return end

		local itemPtr = Item.getBagItemPtrByGuid(sysarg,itemGuid)
		if not itemPtr then return end
		local nItemId = Item.getItemId(itemPtr)
		local denyReclaim = Item.getItemPropertyById(nItemId, Item.ipItemDenyReclaim)
		if denyReclaim > 0 then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf248,Item.getItemName(nItemId)), ttFlyTip)
			return
		end
		local awards = GetGodEquipRecycleAward(sysarg, config, nItemId, itemPtr)		
		if awards ~= nil then
			for _,one_award in ipairs(awards) do
				for __,v in ipairs(awardList) do
					if v.type == 0 then
						if v.id == one_award.id then
							v.count = v.count + one_award.count
						end
					else
						if v.type == one_award.type then
							v.count = v.count + one_award.count
						end
					end
				end								
			end
		end
						
		table.insert(nEquipGuidList,itemGuid)
		table.insert(nEquipItemPtr,itemPtr)	
		nCount = nCount + 1
	end

	if nCount < 1 then return end

	--检查背包格子是否足够
	if not Awards.CheckBagGridCount(sysarg,awardList) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.dm010, ttFlyTip)
		return
	end

	local nResult = true
	for _,itemPtr in ipairs(nEquipItemPtr or {}) do
		local nItemId = Item.getItemId(itemPtr)
		if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"背包装备回收",GameLog.cEquipRecycling) ~= 1 then
			nResult = false
			break
		end
	end

	if not nResult then 
		local npack = DataPack.allocPacket(sysarg,7,13)  --申请一个数据包
		DataPack.writeByte(npack,0)
		DataPack.flush(npack)
		return
	end

	Awards.Give(sysarg,awardList,GameLog.CGodEquipMetarailSysnth,"转生装备回收")

	local npack = DataPack.allocPacket(sysarg,7,13)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	DataPack.writeByte(npack,1)
	DataPack.writeUInt(npack,0)
	DataPack.writeUInt(npack,0)
	DataPack.flush(npack)
	
end

EquipOpFuncList[EquipOpId.enMelting] = function (sysarg,args)
	local btRecoveryType = args[4];
	if btRecoveryType == 2 then			-- vip随身回收
		local vipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
		if vipLevel <= 0 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.v00002, ttFlyTip)
			return;
		end
		
		if VipPrivilegesCfg[vipLevel].recovery == 0 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.v00004, ttFlyTip)
			return;
		end
	end
	
	if not EquipMelting then return end
	local config = EquipMelting.EquipReclaim
		
	local var = Actor.getStaticVar(sysarg)
	local totalReclaimExp = var.days.TReclaimExp
	if totalReclaimExp == nil then totalReclaimExp = 0 end
	
	--print("-------------------- 回收前="..totalReclaimExp)	
	
	if config.ReclaimExpLimit >= 0 and totalReclaimExp >= config.ReclaimExpLimit then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf402, ttFlyTip)
		return
	end	
	local nType = args[3]
	if nType == 2 then
		GodEquipRecyle(sysarg,args)
		return
	end
	local nItemCount = args[2]
	local packet = args[5]
	
	local nEquipItemPtr = {}   --存储物品指针用来最后删除
	local nEquipGuidList = {}  --把取出的每个物品的GUID储存,用来检测是否已存在一样的,有则是通过非法手段来进行
	local awardList = {}
	
	local count = 0
	for i = 1,nItemCount do
		local itemGuid = DataPack.readUint64(packet)
		if not CheckSameGuid(nEquipGuidList,itemGuid) then return end
	
		local itemPtr = Item.getBagItemPtrByGuid(sysarg,itemGuid)
		if not itemPtr then return end
		local nItemId = Item.getItemId(itemPtr)
		
		local denyReclaim = Item.getItemPropertyById(nItemId, Item.ipItemDenyReclaim)
		
		if denyReclaim > 0 then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf248,Item.getItemName(nItemId)), ttFlyTip)
			return
		end
		
		local awards = GetEquipReclaimAward(sysarg, config, nItemId, itemPtr)
		if awards ~= nil and config.ReclaimExpLimit >= 0 then				
			local awardexp = GetEquipReclaimExpFromAwards(awards)
			if awardexp > 0 then
				local addexp = 0
				if awardList[2] ~= nil then addexp = awardList[2][0] end
					
				if (totalReclaimExp + addexp + awardexp) > config.ReclaimExpLimit then
					if count == 0 then
						Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf402, ttFlyTip)
						return
					end
					
					Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf403, ttFlyTip)					
					break
				end
			end			
		end
		
		if awards ~= nil then
			for _,one_award in ipairs(awards) do
				AddAwardToList(one_award, awardList)							
			end
		end
						
		table.insert(nEquipGuidList,itemGuid)
		table.insert(nEquipItemPtr,itemPtr)	
		
		count = count + 1	
	end
	
	if count <= 0 then return end	

	local nResult = true
	for _,itemPtr in ipairs(nEquipItemPtr or {}) do
		local nItemId = Item.getItemId(itemPtr)
		if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"背包装备回收",1002) ~= 1 then
			nResult = false
			break
		end
		OneHundredRecoverEquip(sysarg,nItemId)
	end
	
	if not nResult then 
		local npack = DataPack.allocPacket(sysarg,7,13)  --申请一个数据包
		DataPack.writeByte(npack,0)
		DataPack.flush(npack)
		return
	end
	
	local str = ""
	local name = {[2] = "经验",[5] = "绑金",[49] = "炼金值",[46] = "符魄值", [55] = "天宫神锤"}
		
	for _type, l in pairs(awardList) do
		for id, c in pairs(l) do
			Actor.giveAward(sysarg,_type,id,c,0,0,0,0,1003,"背包回收装备奖励")
			if name[_type] ~= nil then
				str = str .. name[_type] .. "*" .. c .. ","
			end
		end
	end
	
	local addexp = 0
	if awardList[2] ~= nil then
		addexp = awardList[2][0]
		totalReclaimExp = totalReclaimExp + addexp
		var.days.TReclaimExp = totalReclaimExp
		
		--print("-------------------- 增加=" .. addexp)
	end	
	
	--print("-------------------- 回收后=".. var.days.TReclaimExp)
	
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf246,str), 256)	
		
	local npack = DataPack.allocPacket(sysarg,7,13)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	DataPack.writeByte(npack,1)
	DataPack.writeUInt(npack,addexp)
	DataPack.writeUInt(npack,totalReclaimExp)
	DataPack.flush(npack)
end

function SendTodayTotalReclaimExp(sysarg)
    if System.isCrossServer() == true then return end
	local var = Actor.getStaticVar(sysarg)
	local totalReclaimExp = var.days.TReclaimExp
	if totalReclaimExp == nil then totalReclaimExp = 0 end
	
	local pack = DataPack.allocPacket(sysarg, 7, 14)
	DataPack.writeUInt(pack,totalReclaimExp)
	DataPack.flush(pack)
end

--百服活动回收装备
function OneHundredRecoverEquip(sysarg,nItemId)
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	if not OneHundredActivityCfg then return end
	local config = OneHundredActivityCfg.MissionStepGift[4]
	
	local var = Actor.getStaticVar(sysarg)
	
	if not var.MissionStep then
		return
	elseif var.MissionStep ~= 3 then 
		return
	end
	
	if not var.HundreaRecoverEquipNum then
		var.HundreaRecoverEquipNum = 0
	end
	
	local needLevel = Item.getItemPropertyById(nItemId, Item.ipItemActorLevel)
	if needLevel < config.reclaimEquipLevel then
		return
	end
	
	var.HundreaRecoverEquipNum = var.HundreaRecoverEquipNum + 1
	if var.HundreaRecoverEquipNum >= config.finishCount then
		var.MissionStep = 4
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf356,var.MissionStep),ttDialog)
	end
end

--炼金材料
EquipOpFuncList[EquipOpId.enAlchemy] = function (sysarg,args)

--	local nType = args[2]

--	if not EquipMelting then return end
--	local config = EquipMelting.EquipAlchemy
--	if nType == 1 then
--		StartAlchemy(sysarg,config)
--	elseif nType == 2 then
--		GiveAlchemyAward(sysarg,config)
--	end
end

function StartAlchemy(sysarg,config)
	
	local var = Actor.getStaticVar(sysarg)
	
	if var.AlchemyTime then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf240,ttFlyTip)
		return
	end
	
	local d = var.d
	if d[52] < config.needAchemy then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf241,config.needAchemy),ttFlyTip)
		return
	end
	
	d[52] = d[52] - config.needAchemy
	var.AlchemyTime = config.coolingTime
	Actor.addTimer(sysarg,ActorTimerIds.Alchemy,1000)
	
	GetAlchemyState(sysarg)
end

function GiveAlchemyAward(sysarg,config)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.AlchemyTime then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf244,ttFlyTip)
		return
	elseif var.AlchemyTime > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf240,ttFlyTip)
		return
	end

	local award = config.awardId
	local itemNum = math.random(unpack(config.randomNum))
	--local nGridCount= Item.getBagEmptyGridCount(sysarg)
	--local nNeedCount = Item.getAddItemNeedGridCount(sysarg,award.id,itemNum)

	--if nGridCount < nNeedCount then
	--	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf242,ttFlyTip)
	--	return
	--end
	
	--Actor.giveAward(sysarg,award.type,award.id,itemNum,0,0,0,0,1004,"炼金结束领取奖励")

	local stone = Actor.getUIntProperty(sysarg, PROP_ACTOR_STONE)
	stone = stone + itemNum
	Actor.setUIntProperty(sysarg, PROP_ACTOR_STONE, stone)
		
	var.AlchemyTime = nil
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf245,itemNum),2048)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf247,Actor.getName(sysarg),itemNum),128+2)
	
	GetAlchemyState(sysarg)
end

function GetAlchemyState(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local npack = DataPack.allocPacket(sysarg,8,30)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	
	if not var.AlchemyTime then
		DataPack.writeInt(npack,-1)
	elseif var.AlchemyTime > 0 then
		DataPack.writeInt(npack,var.AlchemyTime)
	else
		DataPack.writeInt(npack,0)
	end
	
	DataPack.flush(npack)
	
end
	

--炼金状态
EquipOpFuncList[EquipOpId.enAlchemyState] = function (sysarg,args)
	--GetAlchemyState(sysarg)
end


EquipOpFuncList[EquipOpId.enExChangeMaterial] = function (sysarg,args)
	
--	local nType = args[2]
--	local config = EquipArtifact.ExChangeMaterial[nType]
--	if not config then
--		return
--	end

--	local consumeData = {}
--	local ret = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
--	if not ret then return false end

--	if not Awards.CheckBagGridCount(sysarg,config.award) then
--		return
--	end

--	ret = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewChangeMaterialConsume)
--	if not ret then return end

--	Awards.Give(sysarg,config.award,1026,"材料兑换金刚石")
end

--神装材料合成
EquipOpFuncList[EquipOpId.enGodMaterialSynth] = function(sysarg,args)
--	local nType = args[2]

--	if EquipMelting.EquipReclaim.GodEquipMaterialCfg == nil then return end
--	if EquipMelting.EquipReclaim.LightEquipMaterialCfg == nil then return end

--	local cfg = nil
--	if nType == 1 or nType == 2 then
--		cfg = EquipMelting.EquipReclaim.GodEquipMaterialCfg[nType]
--	elseif nType == 3 or nType == 4 then
--		cfg = EquipMelting.EquipReclaim.LightEquipMaterialCfg[nType-2]
--	end

--	if cfg == nil then return end
--	local consume = {type=0,count=cfg.consume[1].count,id=cfg.consume[1].id}
--	local totalCount = Actor.getItemCount(sysarg,consume.id)

--	if totalCount < consume.count then return end
--	local rate = math.floor(totalCount/consume.count)
--	consume.count = consume.count*rate
--	local award = {type=0,count=cfg.award[1].count,id=cfg.award[1].id,bind=0}
--	award.count = award.count*rate

--	local consumeData = {}
--	local ret = CheckAllConsume(sysarg, false, {consume}, true, consumeData)
--	if ret == false or not ret then return false end
--	ret = DeductAllConsume(sysarg, false, {consume}, GameLog.CGodEquipMetarailSysnth)
--	if ret == false or not ret then return false end
--	if not Awards.CheckBagGridCount(sysarg,{award}) then return end
--	Awards.Give(sysarg,{award},GameLog.CGodEquipMetarailSysnth,"神装材料合成")
end


EventCallDispatcher.HandlerAddEquiment = function (sysarg, args)
	local equimentId = args[1]
	local equimentCount = args[2]
	local slotPos = args[3]
	
	-- 处理玩家佩戴装备
	OnPlayerDressEquiment(sysarg, equimentId, equimentCount, slotPos);
end

EventCallDispatcher.HandlerDelEquiment = function (sysarg, args)
	local equimentId = args[1]
	local equimentCount = args[2]
	
	-- 处理玩家佩戴装备
	OnPlayerDelEquiment(sysarg, equimentId, equimentCount);
end

function CanRecycleDmkjItem(itemPtr)
	if not itemPtr then return false end
	
	-- 只有装备才能回收
	local itemType = Item.getItemProperty(NULL, itemPtr, Item.ipItemType, 0)
	if itemType <= Item.itUndefinedType or itemType >= Item.itEquipMax  then
		return false --不能单靠 Item.ipItemDenyReclaim 这个来过滤
	end
					
	local nItemId = Item.getItemId(itemPtr)		
	local denyReclaim = Item.getItemPropertyById(nItemId, Item.ipItemDenyReclaim)
	if denyReclaim > 0 then return false end
	
	local itemLevel = Item.getItemPropertyById(nItemId, Item.ipItemLevel)
	if itemLevel >= 80 then return false end
	
	local itemCircle = Item.getItemPropertyById(nItemId, Item.ipItemNeedCircle)
	if itemCircle >= 1 then return false end
	
	return true
end

--宝藏回收物品
function DmkjRecycleItem(sysarg,args)
	local itemCount = Dmkj.getStoreCount(sysarg)
	if itemCount <= 0 then return end
	
	local config = EquipMelting.EquipReclaim
	
	local equipList = {}
	local awardList = {}
	
	for i = 1,itemCount do		
		local itemPtr = Dmkj.getStoreItem(sysarg,i-1)
		if CanRecycleDmkjItem(itemPtr) then
			local itemId = Item.getItemId(itemPtr)		
				
			local awards = GetEquipReclaimAward(sysarg, config, itemId, itemPtr)			
			if awards ~= nil then
				for _,one_award in ipairs(awards) do
					AddAwardToList(one_award, awardList)							
				end
			end
							
			table.insert(equipList,itemPtr)	
		end
	end
	
	if #equipList == 0 then return end	

	local deleteCount = 0
	for _,itemPtr in ipairs(equipList) do
		local itemId = Item.getItemId(itemPtr)	
		if Dmkj.deleteStoreItem(sysarg,itemPtr, GameLog.cDmkRecycleItem) == false then
			print("eror DmkjRecycleItem delete dmkj item error, actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..itemId)
			return
		end
		OneHundredRecoverEquip(sysarg,itemId)
		
		deleteCount = deleteCount + 1
	end
		
	local str = ""
	local name = {[2] = "经验",[5] = "绑金",[49] = "炼金值",[46] = "符魄值", [55] = "天宫神锤"}
		
	for _type, l in pairs(awardList) do
		for id, c in pairs(l) do
			Actor.giveAward(sysarg,_type,id,c,0,0,0,0,GameLog.cDmkRecycleItemAward,"宝藏回收装备奖励")
			if name[_type] ~= nil then
				str = str .. name[_type] .. "*" .. c .. ","
			end
		end
	end	
		
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf246,str), ttFlyTip)	
	
	if deleteCount > 0 then
		Dmkj.sendStoreItems(sysarg)
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEquipOp, EventCallDispatcher.HandlerEquipOp)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeAddEquiment, EventCallDispatcher.HandlerAddEquiment)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeDelEquiment, EventCallDispatcher.HandlerDelEquiment)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQueryArtifactLevel,MiscsImplement.HandleEquipArtifactLevel)