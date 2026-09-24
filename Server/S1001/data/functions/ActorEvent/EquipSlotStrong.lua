--#include "data\config\equipSynthesis\EquipSlotStrongCfg.lua" once
--#include "data\functions\FunctionGift\FunctionGift.lua" once
--#include "data\config\equipSynthesis\EquipSlotGemDataCfg.lua" once
-- 返回 -1 失败, >= 65535 成功且升级，否则返回增加的经验
function handleEquipSlotStrong(sysarg, args)
	
	local slotIdx = args[1] + 1
	local isYbExchange = args[2]
	local strongLevel = args[3]
	local strongExp = args[4]
	local isOneKey = args[5]  --是否一键升星
	--print(isOneKey)
    --神器和神甲暂时不能强化
	if slotIdx > 18 then return end 
	local nextLevel = strongLevel + 1
 	
	local openLevel = EquipSlotStrongCfg.openLevels[nextLevel]
	if openLevel == nil then return -1 end
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < openLevel then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, openLevel), ttFlyTip)
		return -1
	end	
	local consumeCfg = EquipSlotStrongCfg.consume[nextLevel]
	if consumeCfg == nil then return -1 end
	
	local slotCfg = EquipSlotStrongCfg.slotList[slotIdx]
	if slotCfg == nil then return -1 end
	
	local levelCfg = slotCfg.upgradeCfgs[nextLevel]
	if levelCfg == nil then return -1 end
	
	local minExp = levelCfg[3] -- 60%的概率获得最小值，40%的概率获得最小到最大之间的随机值
	local maxExp = levelCfg[4]
	
	local nRandoExp = minExp -- 当前随机获取的经验
	if System.getRandomNumber(10000) <= 4000 then
		nRandoExp = nRandoExp + System.getRandomNumber(maxExp - minExp)
	end
	
	local newExp = strongExp + nRandoExp
	local isUpgrade = newExp >= levelCfg[1]
	
	local logmsg
	if isUpgrade then
		logmsg = string.format("%d,%d-%d,%d", nextLevel, 0, strongLevel, strongExp)
	else
		logmsg = string.format("%d,%d-%d,%d", strongLevel, newExp, strongLevel, strongExp)
	end
	local consume
	local needCount = 1
	local needExp
	if isOneKey == 1 then
		needExp = levelCfg[1] - strongExp
		needCount = math.ceil(needExp/levelCfg[3])  -- 如果配置不是正好整数升级时候 会出现多扣的情况
		consume = { type = 0, id = consumeCfg[1], count = levelCfg[2]*needCount, yb = consumeCfg[2], 
						tips = {{Lang.ScriptTips.q00102, ttFlyTip}, -- 材料不足且不用元宝代替时的提示
						{Lang.ScriptTips.zf066, ttFlyTip}, -- 代替材料的元宝不够的提示
						{Lang.ScriptTips.zf067, ttFlyTip}}, -- 不能用元宝代替的提示		
					}
		logmsg = string.format("%d,%d-%d,%d", nextLevel, 0, strongLevel, needCount*levelCfg[3])
	else
		consume = { type = 0, id = consumeCfg[1], count = levelCfg[2], yb = consumeCfg[2], 
						tips = {{Lang.ScriptTips.q00102, ttFlyTip}, -- 材料不足且不用元宝代替时的提示
						{Lang.ScriptTips.zf066, ttFlyTip}, -- 代替材料的元宝不够的提示
						{Lang.ScriptTips.zf067, ttFlyTip}}, -- 不能用元宝代替的提示		
					}
	end

	-- 检查
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, isYbExchange ~= 0, consume, true, consumeData)
	if not ret then	return -1 end

    local needGold = EquipSlotStrongCfg.gold[strongLevel+1] * needCount
    local bHaveGold = false
    if Actor.getMoneyCount(sysarg,mtBindCoin) >= needGold then
        Actor.changeMoney(sysarg,mtBindCoin,-needGold,LogIds.strongchangemoney,"强化扣除")
        bHaveGold = true
    end	
    if bHaveGold == false then
         if Actor.getMoneyCount(sysarg,mtCoin) >= needGold then
            bHaveGold = true
             Actor.changeMoney(sysarg,mtCoin,-needGold,LogIds.strongchangemoney,"强化扣除")
         end
    end
    if bHaveGold == false then
        Actor.sendTipmsg(sysarg,"绑定金币或金币不足"..needGold,ttFlyTip)
        return -1
    end
	--扣费
	ret = DeductOneConsume(sysarg, isYbExchange ~= 0, consume, LogIds.EquipSlotStrong, logmsg)
	if not ret then	return -1 end
		
	local slotNames = {"武器", "衣服", "头盔", "项链", "左手镯", "右手镯", "左戒指", "腰带", "鞋子", "右戒指", "勋章", "宝石", "护符", "护盾", "圣珠", "左特戒", "右特戒", "军印","神器","神甲"}


	if isUpgrade or isOneKey == 1 then
		if nextLevel >= EquipSlotStrongCfg.noticeLevel then			
			local actorName = Actor.getName(sysarg)
			local noticeStr = string.format(Lang.ScriptTips.q00106, actorName, slotNames[slotIdx], nextLevel)
			System.broadcastTipmsg(noticeStr, ttChatWindow);
			noticeStr = string.format(Lang.ScriptTips.q00107, actorName, slotNames[slotIdx], nextLevel)
			System.broadcastTipmsg(noticeStr, ttScreenCenter);
		else
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.q00105, slotNames[slotIdx], nextLevel), ttFlyTip)
		end
		--强化成就
		Actor.triggerAchieveEvent(sysarg, 113,1)
		OnFinish_Liveness(sysarg,18)
		-- if isOneKey == 1 then
		-- 	local remianExp = needCount*levelCfg[3] - levelCfg[1]
		-- 	if remianExp > 0 then
		-- 		return 65534,remianExp
		-- 	end	
		-- end
        if nextLevel == 1 then
            OnCompleteGiftTask(sysarg,3)
        end
       
		return 65535 -- 成功且升级
	else	
		local strTips
		if nRandoExp > minExp then
			strTips = string.format(Lang.ScriptTips.q00104, slotNames[slotIdx], nRandoExp)
		else
			strTips = string.format(Lang.ScriptTips.q00103, slotNames[slotIdx], nRandoExp)
		end
		Actor.sendTipmsg(sysarg, strTips, ttFlyTip)
			--强化成就
		Actor.triggerAchieveEvent(sysarg, 113,1)
		OnFinish_Liveness(sysarg,18)
		return nRandoExp -- 成功
	end
	
	return -1
end

function handleEquipSlotGemData(sysarg,args)
    local slot = tonumber(args[1])
    local gem = tonumber(args[2])
  
    --if slot < 0 or slot > 18 then return end 
--    if gem < 0 or gem > 6 then return end
    local nLevel=  Actor.getEquipSlotGemLevel(sysarg,slot,gem)
    local cfg = EquipSlotGemDataCfg.GemSet[gem]
  
    if cfg == nil then return end
    if nLevel >= table.getn(cfg) then
        Actor.sendTipmsg(sysarg,"已经到达最高等级，无法镶嵌！",ttFlyTip)
        return
    end
    nLevel = nLevel + 1
    if Actor.getItemCount(sysarg,cfg[nLevel].itemid) < cfg[nLevel].count then
    
        Actor.sendTipmsg(sysarg,"镶嵌失败,"..Item.getItemLinkMsg(cfg[nLevel].itemid).."不足"..cfg[nLevel].count.."个!",ttFlyTip)
        return
    end
    --判断金币是否足够
    local nNeedMoney = cfg[nLevel].money
    if Actor.getMoneyCount(sysarg,mtBindCoin) <  nNeedMoney then
        if Actor.getMoneyCount(sysarg,mtCoin)  < nNeedMoney then
            Actor.sendTipmsg(sysarg,"镶嵌失败,绑金/金币不足"..nNeedMoney,ttFlyTip)
        return
        else
            Actor.changeMoney(sysarg,mtCoin,-nNeedMoney,LogIds.EquipSlotGemData,"镶嵌宝石")
        end
    else
        Actor.changeMoney(sysarg,mtBindCoin,-nNeedMoney,LogIds.EquipSlotGemData,"镶嵌宝石")
    end
    Actor.removeItem(sysarg,cfg[nLevel].itemid,cfg[nLevel].count,-1,-1,-1,"镶嵌宝石",LogIds.EquipSlotGemData) 
    Actor.setEquipSlotGemLevel(sysarg,slot,gem,nLevel)
    
    Actor.collectOperate(sysarg,0) --重新计算属性
    Actor.sendTipmsg(sysarg,"镶嵌成功!",ttFlyTip)
    
    local pack = DataPack.allocPacket(sysarg,7,21)
    DataPack.writeByte(pack,slot)
    DataPack.writeByte(pack,gem)
    DataPack.writeByte(pack,nLevel)
    DataPack.flush(pack)
end
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEquipSlotStrong, handleEquipSlotStrong) 
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEquipSlotGemData,handleEquipSlotGemData)

 