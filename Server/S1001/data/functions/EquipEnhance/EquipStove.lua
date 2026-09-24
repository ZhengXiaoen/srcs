--#include "data\config\equipSynthesis\EquipStoveCfg.lua" once
--#include "data\functions\modules\headtitle.lua" once
--#include "data\functions\FunctionGift\FunctionGift.lua" once
--#include "data\config\equipSynthesis\EquipFourGuardCfg.lua" once
--#include "data\config\equipSynthesis\EquipWarCfg.lua" once

--function TestEquipFourGuard(sysarg,nType)
--    nType = tonumber(nType)
--    MiscsImplement.EquipFourGuard(sysarg,nil,nType)
--end

--function TestGetFourGuardInfo( sysarg)
--   MiscsImplement.GetFourGuardInfo (sysarg,1) 
--end

--获取神炉守护信息
MiscsImplement.GetFourGuardInfo = function( sysarg, msgid, packet )
    local nType = DataPack.readByte(packet)
   
    if nType < 1 or nType > 4 then return end

    local nAuxRetValue = 0
  
    local cfg = nil
    local attrcfg = nil
    local upattrcfg = nil
    local epos, elevel, elevelsCfg = GetEquipPosAndLevelByType(sysarg, nType)	
    local equipItem_ptr = Item.getEquipByPos(sysarg, epos)
    if equipItem_ptr == nil then return end
   
    local m = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemInsureTimes,nAuxRetValue)
    local stage = System.getIntByte(m,0)
    local star = System.getIntByte(m,1)

    --激活

   
    if stage == 0 and star == 0 then
        cfg = EquipFourGuardCfg.upLevel[nType].need[1]
       
        upattrcfg = EquipFourGuardCfg.guardAttr[nType].attr[1]
        attrcfg = EquipFourGuardCfg.guardAttr[nType].attr[1]
    else
        local nIndex = (stage -1) * 10 + star + 1
        if nIndex <= 0 then return end 
        if nIndex > table.getn(EquipFourGuardCfg.upLevel[nType].need) then
            Actor.sendTipmsg(sysarg,"已满级,无法再次升级",ttFlyTip)
            return --已满级
        end
        cfg =  EquipFourGuardCfg.upLevel[nType].need[nIndex]
       

        upattrcfg = EquipFourGuardCfg.guardAttr[nType].attr[nIndex - 1]
        attrcfg = EquipFourGuardCfg.guardAttr[nType].attr[nIndex]
    end
   
    local pack = DataPack.allocPacket(sysarg,151,31)
    DataPack.writeInt(pack,cfg.needlevel)
    DataPack.writeByte(pack,#cfg.consume)
    for i  =1,#cfg.consume do
        DataPack.writeByte(pack,cfg.consume[i].type)
        DataPack.writeInt(pack,cfg.consume[i].count)
    end
    local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    --当前属性-
    DataPack.writeByte(pack,#upattrcfg[nJob])
    for i =1,#upattrcfg[nJob] do
        DataPack.writeByte(pack,upattrcfg[nJob][i].type)
        DataPack.writeInt(pack,upattrcfg[nJob][i].value)
    end
    --下一级属性
    DataPack.writeByte(pack,#attrcfg[nJob])
    for i =1,#attrcfg[nJob] do
        DataPack.writeByte(pack,attrcfg[nJob][i].type)
        DataPack.writeInt(pack,attrcfg[nJob][i].value)
    end
    DataPack.flush(pack)
end
--神炉守护
MiscsImplement.EquipFourGuard = function( sysarg, msgid, packet )
    --护符=1、护盾=2、宝石=3、圣珠=4
    local nType = DataPack.readByte(packet)
--    local nType = 0
--    if msgid ~= nil then
--        nType = DataPack.readByte(packet)
--    else
--        nType = packet
--    end
	if nType < 1 or nType > 4 then return end
    
   
   
    local nAuxRetValue = 0
  
    local cfg = nil
    local epos, elevel, elevelsCfg = GetEquipPosAndLevelByType(sysarg, nType)	
    local equipItem_ptr = Item.getEquipByPos(sysarg, epos)
    if equipItem_ptr == nil then return end
   
    local m = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemInsureTimes,nAuxRetValue)
    local stage = System.getIntByte(m,0)
    local star = System.getIntByte(m,1)

    --激活
   
    if stage == 0 and star == 0 then
        cfg = EquipFourGuardCfg.upLevel[nType].need[1]
      
        if elevel < cfg.needlevel then
            return
        end
    else
        local nIndex = (stage -1) * 10 + star + 1
        if nIndex <= 0 then return end 
        if nIndex > table.getn(EquipFourGuardCfg.upLevel[nType].need) then
            Actor.sendTipmsg(sysarg,"已满级,无法再次升级",ttFlyTip)
            return --已满级
        end
        cfg =  EquipFourGuardCfg.upLevel[nType].need[nIndex]
    end
    --等级不足 无法激活
    
    if star == 10 and elevel < cfg.needlevel  then
        Actor.sendTipmsg(sysarg,"神炉对应装备等级不足"..cfg.needlevel.."无法升级",ttFlyTip)
        return
    end

    --检查消耗
    for i = 1,table.getn(cfg.consume) do
        if cfg.consume[i].type == 1 then --绑金/金币
            local nCoid = Actor.getIntProperty(sysarg,PROP_ACTOR_BIND_COIN)
            if nCoid < cfg.consume[i].count then
                local nCoid =Actor.getIntProperty(sysarg,PROP_ACTOR_COIN)
                if nCoid < cfg.consume[i].count then
                    Actor.sendTipmsg(sysarg,"升级失败,绑金/金币不足"..cfg.consume[i].count,ttFlyTip)
                    return
                end
            end
        elseif cfg.consume[i].type == 2 then --护符碎片
            if Actor.getIntProperty(sysarg,PROP_ACTOR_MAGIC_SOUL) < cfg.consume[i].count then
                Actor.sendTipmsg(sysarg,"升级失败,护符碎片不足"..cfg.consume[i].count,ttFlyTip)
                return
            end
        elseif cfg.consume[i].type == 3 then --护盾碎片
             if Actor.getIntProperty(sysarg,PROP_ACTOR_SHIELD_SPIRIT) < cfg.consume[i].count then
                Actor.sendTipmsg(sysarg,"升级失败,护盾碎片不足"..cfg.consume[i].count,ttFlyTip)
                return
            end
        elseif cfg.consume[i].type == 4 then --宝石碎片
            if Actor.getIntProperty(sysarg,PROP_ACTOR_GEM_CRYSTAL) < cfg.consume[i].count then
                Actor.sendTipmsg(sysarg,"升级失败,宝石结晶不足"..cfg.consume[i].count,ttFlyTip)
                return
            end
        elseif cfg.consume[i].type == 5 then --圣珠碎片
           if Actor.getIntProperty(sysarg,PROP_ACTOR_PEARL_CHIP) < cfg.consume[i].count then
                Actor.sendTipmsg(sysarg,"升级失败,圣珠结晶不足"..cfg.consume[i].count,ttFlyTip)
                return
            end 
        end

    end
    local nOldCount = 0
    local nNewCount = 0
    --扣除消耗
    for i = 1,table.getn(cfg.consume) do
        if cfg.consume[i].type == 1 then --绑金/金币
            
            local nCoid = Actor.getIntProperty(sysarg,PROP_ACTOR_BIND_COIN)
            
            if nCoid < cfg.consume[i].count then
                Actor.changeMoney(sysarg,mtCoin,-cfg.consume[i].count,LogIds.consumefourguard,"神炉守护")
            else
                Actor.changeMoney(sysarg,mtBindCoin,-cfg.consume[i].count,LogIds.consumefourguard,"神炉守护")
            end
        elseif cfg.consume[i].type == 2 then --护符碎片
            local nCount  =Actor.getIntProperty(sysarg,PROP_ACTOR_MAGIC_SOUL)
            nOldCount = nCount
            nCount =  nCount - cfg.consume[i].count
            Actor.setIntProperty(sysarg,PROP_ACTOR_MAGIC_SOUL,nCount)
            nNewCount = nCount
        elseif cfg.consume[i].type == 3 then --护盾碎片
             local nCount  =Actor.getIntProperty(sysarg,PROP_ACTOR_SHIELD_SPIRIT)
              nOldCount = nCount
             nCount =  nCount - cfg.consume[i].count
             nNewCount = nCount
             Actor.setIntProperty(sysarg,PROP_ACTOR_SHIELD_SPIRIT,nCount)
        elseif cfg.consume[i].type == 4 then --宝石碎片
             local nCount  =Actor.getIntProperty(sysarg,PROP_ACTOR_GEM_CRYSTAL)
              nOldCount = nCount
             nCount =  nCount - cfg.consume[i].count
              nNewCount = nCount
             Actor.setIntProperty(sysarg,PROP_ACTOR_GEM_CRYSTAL,nCount)
        elseif cfg.consume[i].type == 5 then --圣珠碎片
             local nCount  =Actor.getIntProperty(sysarg,PROP_ACTOR_PEARL_CHIP)
             nOldCount = nCount
             nCount =  nCount - cfg.consume[i].count
             nNewCount = nCount
             Actor.setIntProperty(sysarg,PROP_ACTOR_PEARL_CHIP,nCount)
        end
    end
    local oldStage = stage
    local oldstar = star
    star = star + 1
    if star >= 11 then
        stage = stage + 1
        star = 1
    end
   
    --激活
     local sbrostr = ""
     local showId = EquipFourGuardCfg.upLevel[nType].showId
    
    if stage == 0 then
        star = 1
        stage = 1
        Actor.sendTipmsg(sysarg,"恭喜您,成功激活"..EquipFourGuardCfg.upLevel[nType].name,ttFlyTip)
        sbrostr = string.format("<(n%s)>成功激活%s。<我也要去/@@showWin,129,%d>",Actor.getName(sysarg),EquipFourGuardCfg.upLevel[nType].name,showId)
    else
        Actor.sendTipmsg(sysarg,string.format("升级成功,守护等级提升至%d阶%d星.",stage,star),ttFlyTip)
        sbrostr = string.format("<(n%s)>成功突破%s,达到%d阶%d星!<我也要去/@@showWin,129,%d>",Actor.getName(sysarg),EquipFourGuardCfg.upLevel[nType].name,stage,star,showId)
    end
    m=0
    m = System.setIntByte(m,0,stage)
    m = System.setIntByte(m,1,star)
    --print("m:"..m.."stage:"..stage.."star:"..star)
    Item.setItemProperty(sysarg,equipItem_ptr,Item.ipItemInsureTimes,m)
--     m = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemInsureTimes,nAuxRetValue)
--     stage = System.getIntByte(m,0)
--     star = System.getIntByte(m,1)
--     print("22m:"..m.."stage:"..stage.."star:"..star)
    
    --记录日志
    
    System.sendCommonLog(LogIds.uplevelfourguard,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nNewCount - nOldCount,nOldCount,nNewCount,"",string.sub(EquipFourGuardCfg.upLevel[nType].name,1,6).. oldStage.."-"..oldstar.." "..stage.."-"..star)
    System.broadcastTipmsg(sbrostr,ttChatWindow)
    Actor.collectOperate(sysarg,0)
 
    local pack = DataPack.allocPacket(sysarg,151,24)
    DataPack.writeByte(pack,stage)
    DataPack.writeByte(pack,star)
    DataPack.flush(pack)
end
--装备升级
MiscsImplement.EquipStovelRelated = function( sysarg, msgid, packet )
	--护符=1、护盾=2、宝石=3、圣珠=4、麻痹戒指=5、护身戒指=6、复活戒指=7、勋章=8
	local nType = DataPack.readByte(packet)
	if nType < 1 or nType > 8 then return end
   
	EquipForging(sysarg,nType)
end

-- 返回装备位置，装备等级，等级列表配置
function GetEquipPosAndLevelByType(sysarg, nType)
	local pos_list = {itMeterialPos,itShieldPos,itEquipDiamondPos,itSealPos,itLeftSpecialRingPos,itLeftSpecialRingPos,itLeftSpecialRingPos,itDecorationPos}
	local pos = -1
	local level = -1
	local levelsCfg = nil
	
	if nType == 5 or nType == 6 or nType == 7 then
		local tNames = {"麻痹戒指", "重生戒指", "护体戒指"};
		levelsCfg = EquipStoveCfg.SpecialRing[nType - 4]
		local equipItem_ptr = Item.getEquipByPos(sysarg, itLeftSpecialRingPos)
		local left_itemId = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemID)

		equipItem_ptr = Item.getEquipByPos(sysarg, itRightSpecialRingPos)
		local right_itemId = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemID)
		
		if left_itemId == 0 and right_itemId == 0 then
			-- 检查背包是否存在
			local isExist = false;
			for i,v in ipairs(levelsCfg) do
				if Item.getBagItemPtrById(sysarg, v.award.id) ~= nil then
					isExist = true;
					break;
				end
			end
			
			if isExist == true then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.es00003, tNames[nType - 4]), ttFlyTip);
				return itLeftSpecialRingPos, -1, levelsCfg;
			else
				return itLeftSpecialRingPos, 0, levelsCfg
			end
		end
		
		
		local left_itemLevel = 0
		local right_itemLevel = 0
		for i,v in ipairs(levelsCfg) do
			if v.award.id == left_itemId then
				left_itemLevel = i
				if right_itemLevel > 0 then
					break
				end
			elseif v.award.id == right_itemId then
				right_itemLevel = i
				if left_itemLevel > 0 then
					break
				end
			end
		end
		
		if left_itemLevel > 0 then
			return itLeftSpecialRingPos, left_itemLevel, levelsCfg
		elseif right_itemLevel > 0 then
			return itRightSpecialRingPos, right_itemLevel, levelsCfg
		else
			-- 检查背包是否存在
			local isExist = false;
			for i,v in ipairs(levelsCfg) do
				local itemptr = Item.getBagItemPtrById(sysarg, v.award.id);
				if itemptr ~= nil then
					isExist = true;
					break;
				end
			end
			
			if isExist == true then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.es00003, tNames[nType - 4]), ttFlyTip);
				return itLeftSpecialRingPos, -1, levelsCfg
			else
				if left_itemId > 0 and left_itemLevel == 0 and right_itemId == 0 then
					return itRightSpecialRingPos, 0, levelsCfg;
				else
					return itLeftSpecialRingPos, 0, levelsCfg;
				end
			end
		end
	elseif nType >= 1 and nType <= 4 or nType == 8 then
		if nType == 1 then
			local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
			levelsCfg = EquipStoveCfg.TalismanInfo[nJob]
		elseif nType == 2 then
			levelsCfg = EquipStoveCfg.ShieldUpgrade
		elseif nType == 3 then
			levelsCfg = EquipStoveCfg.GemUpgrade
		elseif nType == 4 then
			levelsCfg = EquipStoveCfg.MagicalOrb
		elseif nType == 8 then
			local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
			levelsCfg = EquipStoveCfg.BadgeUpgradeEx[nJob]
		end

		local pos = pos_list[nType]
		local equipItem_ptr = Item.getEquipByPos(sysarg, pos)
		local itemId = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemID)
		
		if itemId == 0 then return pos, 0, levelsCfg end

		for i,v in ipairs(levelsCfg) do
			if v.award.id == itemId then
				return pos, i, levelsCfg
			end
		end

		return pos, -1, levelsCfg
	else
		return -1, -1, nil
	end
end

function EquipForging(sysarg,nType)
	local equipNames = { "护符","护盾","宝石","圣珠","麻痹戒指","重生戒指","护体戒指","勋章" }
	local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if myLevel < EquipStoveCfg.activeLevels[nType] then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.es00002, EquipStoveCfg.activeLevels[nType], equipNames[nType]), ttFlyTip);
		return
	end

	local epos, elevel, elevelsCfg = GetEquipPosAndLevelByType(sysarg, nType)	
	if epos == -1 or elevel < 0 or elevelsCfg == nil then
		print("config error EquipForging")
		return
	end

	local nextLevelCfg = elevelsCfg[elevel + 1]
	if nextLevelCfg == nil then --已经满级
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf677,equipNames[nType]), ttFlyTip)
		return
	end

	local nextItemId = nextLevelCfg.award.id
	local needLevel = Item.getItemPropertyById(nextItemId, Item.ipItemActorLevel)
	local needCircle = Item.getItemPropertyById(nextItemId, Item.ipItemNeedCircle)
	local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);

	--if not Actor.checkActorLevel(sysarg,needLevel,needCircle) then -- 不要用这个来判断，因为是否可穿该装备也不是这样判断的
	if myLevel < needLevel or myCircle < needCircle then
		Actor.sendTipmsg(sysarg,string.format("当前等级低于下阶装备所需的 %s 级",needLevel), ttFlyTip)
		return
	end

	--先加到背包再装备上，所以要检查背包格子数
	local nGridCount = Item.getBagEmptyGridCount(sysarg)
	if nGridCount < 1 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf060,1), ttFlyTip)
		return;
	end
	
	local equipItem_ptr = Item.getEquipByPos(sysarg, epos)
	if equipItem_ptr == nil and elevel > 0 then
		print("error, EquipForging1 actorId="..Actor.getIntProperty(sysarg,PROP_ENTITY_ID)..",nextItemId="..nextItemId)
		return
	end
	
	-- 因为 护符、护盾、宝石、圣珠、勋章 在装备栏为空时是免费送给玩家的，所以穿上了就不能脱了，避免玩家刷这些装备
	
	local consume = nextLevelCfg.consume
	if consume ~= nil then
		if nType == 8 then -- [勋章] 成就积分只检查够了没有，不进行扣除
			local point_count = consume[1].count
			if point_count == nil then return end
			
			if Actor.getUIntProperty(sysarg, PROP_ACTOR_ACIEVEPOINT) < point_count then
				Actor.sendTipmsg(sysarg, string.format("成就积分不足%d", point_count), ttFlyTip)
				return
			end
		else
			--检查消耗
			local consumeData = {}
			local isok = CheckAllConsume(sysarg, false, consume, true, consumeData)
			if not isok then return end

			--扣除消耗
			isok = DeductAllConsume(sysarg, false, consume, GameLog.cEquipStove, tostring(nextItemId))
			if not isok then return end
		end
	end	

	local nStrong = 0
	local nStrongLimit = 0
	local nBlood = 0
    local nAuxRetValue = 0
    local nGuardLevel = 0
	if equipItem_ptr ~= nil then
		nStrong = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemStrong)
		nStrongLimit = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemStrongLimit)
		nBlood = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemAppraisal)
        nGuardLevel = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemInsureTimes,nAuxRetValue)
	end
     
	if equipItem_ptr ~= nil and Item.removeEquip(sysarg,equipItem_ptr,"锻造删物品",GameLog.cEquipStove) < 1 then
		local emsg = string.format("error, EquipForging2 actorId=%d,strong=%d,strongLimit=%d,blood=%d,nextItemId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID),nStrong,nStrongLimit,nBlood,nextItemId)
		--print(emsg)
		return
	end

	local newEquip_ptr = Item.createItem(nextItemId,nextLevelCfg.award.count,nStrong,0,nextLevelCfg.award.bind)
	if not newEquip_ptr then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.es00001, ttFlyTip);
		local emsg = string.format("error, EquipForging2 actorId=%d,strong=%d,strongLimit=%d,blood=%d,nextItemId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID),nStrong,nStrongLimit,nBlood,nextItemId)
		--print(emsg)
		return
	end	

	local addCount = Item.addItem(sysarg,newEquip_ptr,"锻造"..equipNames[nType],GameLog.cEquipStove)
	if addCount < nextLevelCfg.award.count then
		local emsg = string.format("error, EquipForging2 actorId=%d,strong=%d,strongLimit=%d,blood=%d,nextItemId=%d,addCount=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID),nStrong,nStrongLimit,nBlood,nextItemId,addCount)
		--print(emsg)
		return
	end
	
	-- 需要先放背包或装备栏中才能设置属性
	Item.setItemProperty(sysarg,newEquip_ptr,Item.ipItemStrongLimit,nStrongLimit)
	Item.setItemProperty(sysarg,newEquip_ptr,Item.ipItemAppraisal,nBlood)
    Item.setItemProperty(sysarg,newEquip_ptr,Item.ipItemInsureTimes,nGuardLevel)
	Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf124, equipNames[nType], Item.getItemName(nextItemId)), ttFlyTip)
	
	local name=Actor.getName(sysarg)
	local tip
	if(epos~=itDecorationPos) then
	    -- --策划要求选择第一种提示
		-- if System.getDaysSinceOpenServer() ~=1 then --不是第一天就有限制显示
		-- 	if epos == itMeterialPos or epos == itShieldPos then --护符护盾
		-- 		if elevel + 1>=20 and (elevel + 1)%5==0 then 
		-- 			tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,129>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
		-- 		end
		-- 	elseif epos == itEquipDiamondPos or epos == itSealPos then --宝石圣珠
		-- 		if elevel + 1>=15 and (elevel + 1)%2==1 then 
		-- 			tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,129>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
		-- 		end
		-- 	else 
		-- 		tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,129>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
		-- 	end
		-- else 
		-- 	tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,129>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
		-- end

		--这里新版改了数值,所以每级都提示 2017/05/17 zer
		tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,194>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
	else 
		if System.getDaysSinceOpenServer() ~=1 then 
			if elevel + 1>=10 and (elevel + 1)%2==0 then  --勋章
				tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,19>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
			end
		else 
			tip= string.format("恭喜<(n%s)>玩家将<(c0xFFff0000)%s>升级至 %s,<我要提升/@@showWin,19>",name,equipNames[nType],Item.getItemLinkMsg(nextItemId))
		end
		--tip= string.format("恭喜<(n%s)>玩家获得<(c0xFFff0000)%s>,<我也要获得/@@showWin,19>",name,Item.getItemName(nextItemId))
	end
	System.broadcastTipmsg(tip,ttChatWindow)
	--System.getDaysSinceOpenServer() ~=1
	OnFinish_Liveness(sysarg,21)
	
	-- 称号
    --屏蔽称号
--	if epos == itSealPos then -- 珠光宝气 (开服7天内, 圣珠装备提升至20阶)
--		if (elevel + 1) >= 20 and System.getDaysSinceOpenServer() <= 7 then
--			--ht_set_titleflags(sysarg, 3, true)
--			--珠光宝气- 屏蔽该称号
--			if not Actor.hasTopTitle(sysarg,Title.BeadEquipLevel) then
--				Actor.setTopTitle(sysarg, Title.BeadEquipLevel, true)
--				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "珠光宝气"), ttFlyTip)
--			end
--		end
--	elseif epos == itEquipDiamondPos then -- 铄石流金 (开服7天内,宝石装备提升至20阶)
--		if (elevel + 1) >= 20 and System.getDaysSinceOpenServer() <= 7 then
--			ht_set_titleflags(sysarg, 4, true)

--			if not Actor.hasTopTitle(sysarg,Title.StoneEquipLevel) then
--				Actor.setTopTitle(sysarg, Title.StoneEquipLevel, true)
--				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "铄石流金"), ttFlyTip)
--			end
--		end
--	end
		
	-- 发装备升级结果
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendEquipStoveResult)
	DataPack.writeByte(netPack, nType)
	DataPack.writeUInt(netPack, elevel + 1)
	DataPack.flush(netPack)
	
	Actor.triggerAchieveEvent(sysarg, 104, nType, elevel + 1)
    --功能礼包激活
    if nType == 1 and elevel == 0 then
        OnCompleteGiftTask(sysarg,1)
    end

end


MiscsImplement.HandleEquipArtifactLevel = function ( sysarg,msgid,packet )
	sendRefreashArtifactLevel(sysarg)
end

MiscsImplement.EquipMedalInfoBack = function( sysarg,msgid,packet )
	local var = Actor.getStaticVar(sysarg)
	if not var.hasGetEquipMedal then
		local netPack = DataPack.allocPacket(sysarg, 139,128)
		DataPack.writeByte(netPack, 1)  -- 1
		DataPack.writeByte(netPack,1)
		DataPack.flush(netPack)
	end
end

--function TestMiscExWarEquipUpLev(sysarg,nType)
--    MiscExWarEquipUpLev(sysarg,nType,packet)

--end
--战装升级
function MiscExWarEquipUpLev(sysarg,msgid,packet)
    local nType = DataPack.readByte(packet)
  -- local nType = msgid
   nType = tonumber(nType)
   local nEquipPos = 0
    if nType < itWeaponPos or nType > itMaxEquipPos then return end
    if nType < itWarWeaponPos or nType > itWarShoesPos then
        return
    end
    local cfg = nil
    for i = 1,#EquipWarCfg do
        for j = 1,#EquipWarCfg[i].equipPos do
           if EquipWarCfg[i].equipPos[j] == nType then
                cfg = EquipWarCfg[i]
                nEquipPos = j - 1
                break
            end
        end
        if cfg ~= nil then break end
    end     
       
    if cfg == nil then
        Actor.sendTipmsg(sysarg,"未找到该位置配置!",ttFlyTip)
        return
    end 
    local equip_ptr = Item.getEquipByPos(sysarg,nType)
    --激活要预留一个格子空位
    local nIndex = 1
    local stage = 0
    local star = 0
    local m = 0
    if equip_ptr == nil then 
        if Item.getBagEmptyGridCount(sysarg) <= 0 then
            Actor.sendTipmsg(sysarg,"请预留一个包裹格子!",ttFlyTip)
            return
        end
    else
        local nAuxRetValue = 0
         m = Item.getItemProperty(sysarg,equip_ptr,Item.ipItemInsureTimes,nAuxRetValue)
        stage = System.getIntByte(m,0)
        star = System.getIntByte(m,1)
        nIndex = (stage -1) * 10 + star + 1
        if nIndex <= 0 then return end 
        if nIndex > table.getn(cfg.upLev) then
            Actor.sendTipmsg(sysarg,"已满级,无法再次升级",ttFlyTip)
            return --已满级
        end
    end
    local needCfg = nil
    --检查消耗需求
    needCfg = cfg.upLev[nIndex]
    if needCfg == nil then 
        Actor.sendTipmsg(sysarg,"无法找到对应配置!",ttFlyTip)
        return 
    end 
    for i =1,#needCfg.consume do
        if needCfg.consume[i].type == 1 then --绑金/金币
            local nCoid = Actor.getIntProperty(sysarg,PROP_ACTOR_BIND_COIN)
            if nCoid < needCfg.consume[i].count then
                local nCoid =Actor.getIntProperty(sysarg,PROP_ACTOR_COIN)
                if nCoid < needCfg.consume[i].count then
                    Actor.sendTipmsg(sysarg,"升级失败,绑金/金币不足"..needCfg.consume[i].count,ttFlyTip)
                    return
                end
            end
        elseif needCfg.consume[i].type == 2 then --道具
            if Actor.getItemCount(sysarg,needCfg.consume[i].itemid) < needCfg.consume[i].count then
                Actor.sendTipmsg(sysarg,string.format("%s不足%d个。",Item.getItemName(needCfg.consume[i].itemid),needCfg.consume[i].count),ttFlyTip)
                return
            end
        else 
            return 
        end
    end
    
 
    --扣除消耗
     for i =1,#needCfg.consume do
        if needCfg.consume[i].type == 1 then --绑金/金币
            local nCoid = Actor.getIntProperty(sysarg,PROP_ACTOR_BIND_COIN)
            if nCoid < needCfg.consume[i].count then
                Actor.changeMoney(sysarg,mtCoin,-needCfg.consume[i].count,LogIds.WarEquipUplevel,"战装升级")
            else
                Actor.changeMoney(sysarg,mtBindCoin,-needCfg.consume[i].count,LogIds.WarEquipUplevel,"战装升级")
            end
        elseif needCfg.consume[i].type == 2 then --道具
            Actor.removeItem(sysarg,needCfg.consume[i].itemid,needCfg.consume[i].count)
        end
    end
    --
    local oldStage = stage
    local oldstar = star
    star = star + 1
    if star >= 11 then
        stage = stage + 1
        star = 1
    end
    --给予新的装备
    local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)+1
    local strEx = ""
    if equip_ptr == nil then 
        star = 1
        stage = 1
        
  
        equip_ptr = Item.createItem(needCfg.destItemId[nJob][nSex],1,0,0,1)
        if equip_ptr == nil then
            System.trace("warequip create item error!"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
            return
        end
        Item.addItem(sysarg,equip_ptr,"战装激活",LogIds.WarEquipActive,1)
        Item.equipItem(sysarg,equip_ptr,0,nEquipPos)
        strEx = "激活"
    else --替换装备id
        local nAuxRetValue = 0
        local nOldItemId = Item.getItemProperty(sysarg,equip_ptr,Item.ipItemID,nAuxRetValue)
        local nNewItemId = needCfg.destItemId[nJob][nSex]
        if Item.getItemName(nNewItemId) == nil then
            System.trace("warequip create item error!"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID).."not find itemid:"..nNewItemId)
            return
        end
        if nNewItemId ~= nOldItemId then
            Item.setItemProperty(sysarg,equip_ptr,Item.ipItemID,nNewItemId)

        end
         --加入到系统日志
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        System.sendCommonLog(LogIds.WarEquipUplevel,nActorId,Actor.getName(sysarg),nOldItemId,nNewItemId,0,""," "..oldStage.."-"..oldstar.." "..stage.."-"..star,Item.getItemName(nNewItemId))
        strEx = "升阶"
    end
    m=0
    m = System.setIntByte(m,0,stage)
    m = System.setIntByte(m,1,star)
    Item.setItemProperty(sysarg,equip_ptr,Item.ipItemInsureTimes,m)
    local str = string.format("<(n%s)>%s%s！<我也要去/@@showWin,222>",Actor.getName(sysarg),strEx,Item.getItemName(needCfg.destItemId[nJob][nSex])..star.."星")
    --重新计算外观
    Actor.collectOperate(sysarg,1)
    System.broadcastTipmsg(str,ttChatWindow)

    local pack = DataPack.allocPacket(sysarg,151,30)
    DataPack.writeByte(pack,nType)
    DataPack.flush(pack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEquipStove, MiscsImplement.EquipStovelRelated)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cFourGuard, MiscsImplement.EquipFourGuard)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFourGuardInfo,MiscsImplement.GetFourGuardInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQueryEquipMedal,MiscsImplement.EquipMedalInfoBack)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQueryArtifactLevel,MiscsImplement.HandleEquipArtifactLevel)



--用来替换错误的勋章
--@func changeXunZang "xxx"
function changeXunZang(sysarg,name)
	local name =tostring(name)
	
	local pActor = Actor.getActorByName(name)
	if pActor then
		local epos, elevel, elevelsCfg = GetEquipPosAndLevelByType(pActor, 8)	
		
		local equipItem_ptr = Item.getEquipByPos(pActor, epos)
		
		if equipItem_ptr ~= nil and Item.removeEquip(pActor,equipItem_ptr,"GM删物品") < 1 then
			--return
		end
		
		local nextItemId = 1172

		local myJob = Actor.getIntProperty( pActor, PROP_ACTOR_VOCATION )
		if myJob ==1 then 
			nextItemId = 1070
		elseif myJob ==2 then
			nextItemId = 1121
		elseif myJob ==3 then 	
			nextItemId = 1172
		end
	
		local newEquip_ptr = Item.createItem(nextItemId,1,0,0,1)
		if not newEquip_ptr then
			return
		end	
		
		Item.addItem(pActor,newEquip_ptr,"GM替换",0,1)
		Item.equipItem(pActor, newEquip_ptr, 0, -1)	
		
		Actor.sendTipmsg(sysarg, "替换成功", ttFlyTip);
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end
