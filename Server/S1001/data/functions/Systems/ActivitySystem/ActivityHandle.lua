
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once
--#include "data\functions\Activity\KillEvil\KillEvilCommon.lua" once
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua" once
--#include "ProbabilityIndexDrop.lua" once
--#include "data\functions\Activity\NpcStatue\WorshipCommon.lua" once

--#include "data\config\item\EquipChange.lua" once --套装装备转换

--#include "data\config\activity\StdActivityCfg.lua" once
--#include "BiGuanXiuLianHandle.lua" once
--#include "GuildFight.lua" once
--#include "jumozhichaoHandle.lua" once
--#include "quanfushuangbeiHandle.lua" once
--#include "worshipHandle.lua" once
--#include "wlzbPaoDianHandle.lua" once
--#include "YuanbaoJiaNianHua.lua" once
--#include "benpaobaHandle.lua" once
--#include "JuntuanZhan.lua" once
--#include "data\functions\Systems\ActivitySystem\MiJingZhiLv.lua" once
--#include "data\functions\Systems\ActivitySystem\DuoBaoQiBing.lua" once
--#include "data\functions\Systems\ActivitySystem\WorldBoss.lua" once
--#include "data\functions\Systems\ActivitySystem\taotieshendian.lua" once
--#include "data\functions\Systems\ActivitySystem\JiQingGuildHandle.lua" once
--#include "data\functions\Systems\ActivitySystem\ArdourCampHandle.lua" once
--#include "data\functions\Activity\CombineKingCityBoss.lua" once --王城boss活动
--#include "data\functions\Activity\QingDianActivityBoss.lua" once --庆典活动王城boss
--#include "data\functions\Activity\NationalDayBoss.lua" --国庆活动boss

function ActivityHandleImpl(sysarg, systemid, msgid, packet)
   
	if msgid == LogicCmd.activitySys.sub.cRecoverEquip then
		RecoverEquip(sysarg, packet )
	elseif msgid == LogicCmd.activitySys.sub.cRequireStoneConfig then
		SendStoneConfig(sysarg, packet )
	elseif msgid == LogicCmd.activitySys.sub.cFreshActorDart then --刷新个人镖车等级
		--RefreshActorDartLevel(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cStartActorDart then	--开始押镖
		StartDart(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cOpenYBDialog then		-- 请求打开押镖对话框
		OpenDartDialog(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cWorshipMsg then		--膜拜或者鄙视皇城城主
		DespiseOrWorshipWCCZ(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cFreshWorshipRate then		--膜拜刷新倍率
		WorshipRefreshAward(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cAddWorshipTimes then		--增加膜拜的次数
		OnAddWorshipTimes(sysarg,packet)
	elseif msgid == LogicCmd.activitySys.sub.cExchangeEquip then			--装备转换
		--ExchangeEquip(sysarg, packet, msgid )
	elseif msgid == LogicCmd.activitySys.sub.cExchangeEquipComfire then --装备转换
		--ExchangeEquip(sysarg, packet, msgid )
	elseif msgid == LogicCmd.activitySys.sub.cExchangeEquipTimes then --装备转换剩余次数查询
		CheckExchangeEquipTimes( sysarg, packet )
	elseif msgid == LogicCmd.activitySys.sub.cOnEnterScene then --请求进入场景
		CheckOnEnterScene( sysarg, packet )
	elseif msgid == LogicCmd.activitySys.sub.cContinueEscort then --继续护送
		ContinueEscort(sysarg, packet) 
	elseif msgid == LogicCmd.activitySys.sub.cGetGiveUpDart then --请求放弃护送
		AbandonEscort(sysarg, packet);
	elseif msgid == LogicCmd.activitySys.sub.cUseInvincibleSkill then -- 无敌镖车技能
       
		UseInvincibleSkill(sysarg, packet);
	elseif msgid == LogicCmd.activitySys.sub.cUseGuildHelpSkill then -- 行会求救技能
       
		UseGuildHelpSkill(sysarg, packet);
	elseif msgid == LogicCmd.activitySys.sub.cExitActivity then				-- 退出活动
		exitActivity(sysarg, packet);
	elseif msgid == LogicCmd.activitySys.sub.cEnterNextLayer then			-- 进入下一层
		enterNextLayer(sysarg, packet);
	elseif msgid == LogicCmd.activitySys.sub.cGetActivityData then  -- 获得活动数据
		ClientGetActivityData(sysarg, packet)
    elseif msgid == LogicCmd.activitySys.sub.cAutoStopDart then --暂停或继续护送
        local b = DataPack.readByte(packet)
        if b == 1 then b = true else b = false end
        SetDartTimer(sysarg,b)
	end
end

-- 退出活动
function exitActivity(sysarg, packet)
	local actid = DataPack.readByte(packet)
	
	if actid == 1 then
		exit_bgxl(sysarg)
	elseif actid == 2 then
		exit_jmzc(sysarg)
	elseif actid == 6 then
		exit_wlzb(sysarg, actid)
	elseif actid == 7 then--元宝嘉年华
		exit_Yuanbaojianianhua(sysarg)
	elseif actid == 8 then
		exit_bpbxd(sysarg)
	elseif actid == 10 then
		exit_duobaoqibing(sysarg)
	elseif actid == 11 then
		exit_camp_battle(sysarg)
	elseif actid == 16 then
		exit_juntuanzhan(sysarg, actid)
	elseif actid ==17 then--神威狱
		exitDontClearData_ShenWeiYu(sysarg)
	elseif actid == 18 then --激情闭关
		exitDontClearData_bgxl(sysarg)
	elseif actid ==20 then --秘境之旅
		exit_MiJingZhiLv(sysarg)
    elseif actid == 21 then --世界BOSS
        exit_WorldBoss(sysarg)
	
	elseif actid == 22 then --饕餮
		exit_TTSD(sysarg)
	elseif actid ==23 then 
		exitJiQingGuild(sysarg)
    elseif acid == 10000 then --
        exitJiQingDaBenYing(sysarg)
	end
end

-- 玩家下线
EventCallDispatcher.OnActorLogout_ActivityHandler = function(sysarg, arg)
	
end

-- 进入下一层
function enterNextLayer(sysarg, packet)
	local actid = DataPack.readByte(packet)
	
	if actid == 2 then
		jmzc_enter_next_layer(sysarg)
	end
end

-- 获得活动数据
function ClientGetActivityData(sysarg, packet)
	local activityType = DataPack.readByte(packet)
	
	if activityType == 7 then -- 元宝嘉年华
		getActivityDataYBJNH(sysarg)
	end
end


function SendStoneConfig(sysarg, systemid, packet)
	local netPack = DataPack.allocPacket(sysarg, 145, LogicCmd.activitySys.sub.sSendStoneConfig)  --申请一个数据包
	if netPack then
		local expItemCount = 0
		for k, v in pairs(KillEvilConfig.ExpJade) do
			expItemCount = expItemCount + 1
		end
		DataPack.writeByte(netPack, #KillEvilConfig.Reward + expItemCount)
		DataPack.writeInt(netPack, KillEvilConfig.ItemId)
		for k, v in ipairs(KillEvilConfig.Reward) do
			DataPack.writeByte(netPack, v.equipMinLv)
			DataPack.writeWord(netPack, v.equipMaxLv)
			DataPack.writeByte(netPack, v.dbStoneCount)
			DataPack.writeByte(netPack, v.point)
		end
		for itemId, Cfg in pairs(KillEvilConfig.ExpJade) do
			DataPack.writeByte(netPack, 0)
			DataPack.writeWord(netPack, itemId)
			DataPack.writeByte(netPack, Cfg.dbStoneCount)
			DataPack.writeByte(netPack, Cfg.point)
		end
		DataPack.flush(netPack)
	end	
end

function SendRecoverResult( sysarg, result )
	local netPack = DataPack.allocPacket(sysarg, 145, LogicCmd.activitySys.sub.sSendRecoverResult)  --申请一个数据包
	if netPack then
		DataPack.writeByte(netPack, result)
		DataPack.flush(netPack)
	end
end

function CheckCanDropItem( nItemId )
	for k, itId in ipairs(KillEvilConfig.NoDropItems) do
		if nItemId == itId then
			return true
		end
	end
	return false
end

function RecoverEquip( sysarg, packet )
	local recoverType = DataPack.readByte( packet )
	local useGold = DataPack.readByte( packet )
	local equipCount = DataPack.readByte( packet )
	if equipCount == 0 or equipCount > KillEvilConfig.MaxEquipCount then
		return
	end
	local needItemCount = 0
	local pointCount = 0
	local equipPtrTab = {}
	for i = 1, equipCount do
		local equipGuid = DataPack.readUint64( packet )
		local equipPtr = Item.getBagItemPtrByGuid( sysarg, equipGuid)
		if equipPtr then
			local cfgTab = nil
			local itemId = Item.getItemId(equipPtr)
			local nItemType = Item.getItemProperty( sysarg, equipPtr, Item.ipItemType, 0)
			if nItemType == Item.itHpPot then
				local curExpCount = Item.getItemProperty(sysarg, equipPtr, Item.ipItemDua, 0)
				local maxExpCount = Item.getItemProperty(sysarg, equipPtr, Item.ipItemDuaMax, 0)
				if curExpCount < maxExpCount then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00045, Item.getItemName(itemId)), ttFlyTip)
					return
				end
				cfgTab = KillEvilConfig.ExpJade[itemId]
			else
				if nItemType < Item.itWeapon or nItemType >= Item.itEquipMax then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00046, Item.getItemName(itemId)), ttFlyTip)
					return
				end	
				local nLevel = Item.getItemProperty(sysarg, equipPtr, Item.ipItemActorLevel, 0)
				if nLevel < KillEvilConfig.MinEquipLevel then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00024, Item.getItemName(itemId), KillEvilConfig.MinEquipLevel), ttFlyTip)
					return
				end
				cfgTab = GetKillEvilCfgByLv(nLevel)
			end
			if cfgTab then
				pointCount = pointCount + cfgTab.point
				if recoverType == 2 then
					needItemCount = needItemCount + cfgTab.dbStoneCount
				end
				table.insert(equipPtrTab, equipPtr)
			end
			if CheckCanDropItem(itemId) then
				Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.mt00027, Item.getItemName(itemId)), ttFlyTip)
				return
			end
		end
	end
	if recoverType == 2 then
		local nGridCount= Item.getBagEmptyGridCount(sysarg)
		local needBagGrid = #equipPtrTab
		 if nGridCount < needBagGrid then
			Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.mt00029, needBagGrid*2, needBagGrid), ttScreenCenter)
			return
		 end
		local deductItemCount = needItemCount
		local myItemCount = Actor.getItemCount( sysarg, KillEvilConfig.ItemId )
		if myItemCount < needItemCount then
			deductItemCount = myItemCount
			if useGold == 1 then
				local needMoney = (needItemCount - myItemCount)*KillEvilConfig.ItemGold
				local myGold = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
				if myGold < needMoney then
					Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.zf093, needMoney - myGold), ttFlyTip )
					return
				end
				if not Actor.changeMoney(sysarg, mtYuanbao, -needMoney, GameLog.clRenowBuyConsumeMoney, Lang.LogTips.yb014) then
					return
				end
			else
				Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.zf092, needItemCount - myItemCount), ttFlyTip )
				return
			end
		end
		if deductItemCount > 0 and Actor.removeItem(sysarg, KillEvilConfig.ItemId, deductItemCount) ~= deductItemCount then
			return
		end
	end
	for k, ptr in ipairs(equipPtrTab) do
		local nItemType = Item.getItemProperty( sysarg, ptr, Item.ipItemType, 0)
		local cfgTab = nil
		local itemId = Item.getItemId(ptr)
		if nItemType == Item.itHpPot then
			cfgTab = KillEvilConfig.ExpJade[itemId]
		else
			local nLevel = Item.getItemProperty(sysarg, ptr, Item.ipItemActorLevel, 0)
			cfgTab = GetKillEvilCfgByLv(nLevel)
		end
		local rateId = cfgTab.normalRateId
		if recoverType == 2 then
			rateId = cfgTab.doubleRateId
		end
		if Actor.removeItemByPtr(sysarg, ptr, 1, true, Lang.LogTips.l00106, 94) > 0 then
			SetKillEvilPoint(sysarg, cfgTab.point)
			local cbInfo = ProbabilityIndexDropImpl[rateId]
			if cbInfo then
				for i = 1, recoverType do
					cbInfo.func(sysarg, cbInfo.params)
				end
			end
		end
	end
	SendRecoverResult(sysarg, 0)
	Actor.triggerQuestEvent(sysarg, 127, 50092, 1)
end

function CheckExchangeEquipTimes( sysarg, packet )
	local nRemainTimes = 0;
	local svar = Actor.getStaticVar(sysarg)
	if svar.changeEquipCount == nil then
		svar.changeEquipCount = 0
	elseif svar.changeEquipCount > ChangeVocationEquipTable.MaxCount then
		svar.changeEquipCount = ChangeVocationEquipTable.MaxCount
	end
	nRemainTimes = ChangeVocationEquipTable.MaxCount - svar.changeEquipCount

	local npack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, 17)
	DataPack.writeByte(npack, nRemainTimes )
	DataPack.flush(npack)
end

--进入场景前检测
function CheckOnEnterScene( sysarg, packet)
	local nSceneId = DataPack.readUInt( packet )
	if nSceneId == 62 then	--山泉屋
		local nmItemId = 592	--泉水罐			
		if Actor.canAddItem(sysarg , nmItemId, 1) then
			Actor.addItem(sysarg, nmItemId, 0, 0, 1, 1, 0, "getFountainBox", 1) 
		else
			Actor.sendTipmsg(sysarg,Lang.Activity.fou0007, ttFlyTip) 
			return false
		end
	end
	Fuben.OnEnterFuBen(sysarg,nSceneId)
end

--返回id,价格
function GetNewEquipID(changeID, oldItemID)
	local equipTB = ChangeVocationEquipTable[1]
	for i=1, table.getn(equipTB) do
	if i ~= changeID then	--不在要转换的目标行里面查找
		for k,v in ipairs(equipTB[i]) do
    		if v == oldItemID then
    			local targetTB = equipTB[changeID]
    			local priceTB = ChangeVocationEquipTable.price
    			return targetTB[k],priceTB[k]
    		end
    	end
    end
	end
	return 0,0
end

function ExchangeEquip( sysarg, packet, msgid )
	local nIdx = DataPack.readByte( packet )
	local equipCount = DataPack.readByte( packet )
	--这个可以单独配置
	if equipCount == 0 or equipCount > 20 then
		return
	end

	local svar = Actor.getStaticVar(sysarg)
	if svar.changeVocationFlag == nil then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00049, ttFlyTip)
		return				
	end
	
	if svar.changeVocationFlag == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00049, ttFlyTip)
		return				
	end

	if svar.changeEquipCount == nil then
		svar.changeEquipCount = 0
	end

	if svar.changeEquipCount + equipCount > ChangeVocationEquipTable.MaxCount then 
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00048, ChangeVocationEquipTable.MaxCount-svar.changeEquipCount), ttFlyTip)
		return		
	end
	
	local npack = nil
	if msgid== cExchangeEquip then
		npack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, 15)
		DataPack.writeByte(npack, equipCount)
	end	

	local equipPtrTab = {}
	for i = 1, equipCount do
		local equipGuid = DataPack.readUint64( packet )
		local equipPtr = Item.getBagItemPtrByGuid( sysarg, equipGuid)
		if equipPtr then
			local cfgTab = nil
			local itemId = Item.getItemId(equipPtr)
			local nItemType = Item.getItemProperty( sysarg, equipPtr, Item.ipItemType, 0)
			if nItemType < Item.itWeapon or nItemType >= Item.itEquipMax then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00047, Item.getItemName(itemId)), ttFlyTip)
				return
			end
			
			--取出新装备和价钱
			local nNewItemId, nNeedGold = GetNewEquipID(nIdx, itemId)
			
			--发送新提示
			if msgid== cExchangeEquip then
				DataPack.writeUInt(npack, itemId)
				DataPack.writeUInt(npack, nNewItemId)
				DataPack.writeUInt(npack, nNeedGold)
			elseif nNewItemId ~=0 then
				--判断钱够不够
				local GoldType= PROP_ACTOR_YUANBAO
				local GoldTypeChange= mtYuanbao
	
				local myGold = Actor.getIntProperty(sysarg,GoldType)
				if myGold < nNeedGold then
					Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.zf400, nNeedGold - myGold), ttFlyTip )
					return
				end
				
				--获取其他附加属性
				local propTab = {}
				--鉴定属性
				AuthValTab = {
					Item.ipItemForgeProperty1Value,
					Item.ipItemForgeProperty2Value,
					Item.ipItemForgeProperty3Value,
				}
				local authTimes = Item.getItemProperty( sysarg, equipPtr, Item.ipItemForgeTimes, 0 )
				propTab[Item.ipItemForgeTimes] = authTimes;
				for authIdx, authVar in ipairs(AuthValTab) do
					local tempVal = Item.getItemProperty( sysarg, equipPtr, authVar, 0)
					propTab[authVar] = tempVal
				end
				local initSmith = Item.getItemProperty( sysarg, equipPtr, Item.ipItemSpecSmith, 0)
				
				local nStrong = Item.getItemProperty(sysarg, equipPtr, Item.ipItemStrong, 0)
				if nStrong <= 0 then
					nStrong = 0
				end
				
				local nQuality = Item.getItemProperty( sysarg, equipPtr, Item.ipItemQuality, 0 )
				local nLuck = Item.getItemProperty( sysarg, equipPtr, Item.ipItemLuck, 0 )
				
				--扣钱
				if not Actor.changeMoney(sysarg, GoldTypeChange, -nNeedGold, GameLog.clUpgradeConsumeMoney, Lang.LogTips.l00160) then
					return
				end
				
				--删除旧物品
				local isItemInBag = true
				if Actor.removeItemByPtr(sysarg, equipPtr, 1, true, Lang.LogTips.l00161, 92) == 0 then
					if Item.removeEquip(sysarg, equipPtr, Lang.LogTips.l00161, 92, true) == 0 then
						return
					end
					isItemInBag = false
				end
	
				--创建新装备
				local newItemPtr = Item.createItem(nNewItemId, 1, nStrong, nQuality);
				if newItemPtr then
					Item.addItem(sysarg, newItemPtr, Lang.LogTips.l00070, 93)
					if initSmith > 0 then
						Item.setItemProperty( sysarg, newItemPtr, Item.ipItemSpecSmith, initSmith)
					end
					for propId, propVal in pairs(propTab) do
						Item.setItemProperty( sysarg, newItemPtr, propId, propVal)
					end
					if nLuck > 0 then
						Item.setItemProperty( sysarg, newItemPtr, Item.ipItemLuck, nLuck)
					end
					svar.changeEquipCount = svar.changeEquipCount+1
				end
			end --end if
		else --取不到物品指针
			if msgid== cExchangeEquip then
				DataPack.writeUInt(npack, itemId)
				DataPack.writeUInt(npack, 0)
				DataPack.writeUInt(npack, 0)
			end
		end --end if
	end --end for
	
	if msgid== cExchangeEquip then
		DataPack.flush(npack)
	end
end



table.insert(InitFnTable, InitProbabilityIndexDrop)
SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.enActivitySystem, ActivityHandleImpl)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout, EventCallDispatcher.OnActorLogout_ActivityHandler)