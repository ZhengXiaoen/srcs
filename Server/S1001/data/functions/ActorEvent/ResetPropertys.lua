-- 脚本重置属性事件
--#include "data\config\achieve\weiMingCfg.lua" once
--#include "data\config\SportsTitleCfg.lua" once
--#include "data\config\NewZodiac.lua" once
--#include "data\config\guild\GuildFlagConfig.lua" once
--#include "data\config\item\TreasureSystemCfg.lua" once
--#include "data\functions\modules\yuanshen.lua" once -- 元神系统
--#include "data\config\item\NewSuitConfig.lua" once --法宝套装属性
--#include "data\config\GodWeaponCfg.lua" once 
--#include "data\config\item\FuHunLevelInfo.lua" once --穿戴装备的附魂属性
--#include "data\functions\BossRuneExFunc.lua" once --boss符文盘扩展
--#include "data\config\ActorEvent\XiuZhenCfg.lua" once
--#include "data\config\equipSynthesis\XueLianCfg.lua" once --血练属性
--#include "data\config\item\ZhizunEquipCfg.lua" once --至尊装备套装属性
--#include "data\functions\modules\guard_dragon.lua" once -- 龙灵守护系统
--#include "data/functions/modules/spirit_fighter.lua" once -- 战灵系统
--#include "data\config\equipSynthesis\ThorEquipCfg.lua" once
--#include "data/functions/modules/spirit_pet.lua" once -- 灵兽
--#include "data\config\equipSynthesis\XinFaSystemCfg.lua" once --心法系统
--#include "data\config\equipSynthesis\LongTengCfg.lua" once --龙腾系统
--#include "data\config\equipSynthesis\RingGodCfg.lua" once 
--#include "data\functions\SkyRingFunc.lua" once
--#include "data\config\equipSynthesis\ShenDunCfg.lua" once --神盾
--#include "data\config\ImmortalSystemConfig.lua" once --仙装
--#include "data\functions\ImmortalSystemFunc.lua" once --仙装强化
-- C++ 也会调用
function GetNextWeiMingAchievePoint(point,isBrocast,sysarg)

    if isBrocast == nil or sysarg == nil then isBrocast = 0 end   
    
	local curIdx = 0
	local nextValue = 4294967295 -- UINT 最大值
	for i, v in ipairs(WeiMingCfg.List) do
		if point < v.need then
			nextValue = v.need
			break
		else
			curIdx = i
		end
	end
    
    if isBrocast == 1 and curIdx > 0 then
    	local str =string.format("恭喜<(n%s)>玩家威名荣升%s,战斗力得到巨大提升。<我也要提升/@@showWin,19,3>", Actor.getName(sysarg), WeiMingCfg.List[curIdx].name)
        System.broadcastTipmsg(str,ttChatWindow)    	
    end
	
	return nextValue
end

--重设仙装属性
function ResetImmortalEquipPropertys(sysarg,calc)
    local list_count = {}
    local nStartPos = 93
    local cfg =  ImmortalSystemConfig.SuitAttr
    local var = Actor.getStaticVar(sysarg) 
    for i = 1,#cfg.equip do
        local pEquip = Item.getEquipByPos(sysarg,nStartPos)
        if pEquip ~= nil then
            
            local nItemId = Item.getItemProperty(sysarg,pEquip,Item.ipItemID,0)
            local arrequip = cfg.equip[i]
            for j=1,#arrequip do
                if nItemId == arrequip[j] then
                   
                    if list_count[j] == nil then list_count[j] = 0 end
                    list_count[j] = list_count[j] + 1
                     
                    break 
                end
            end

        end
        nStartPos = nStartPos + 1
    end
    
    for i = 1,#cfg.equip[1] do
       
        if list_count[i] ~= nil and list_count[i] > 0 then
            
            cfg =  ImmortalSystemConfig.SuitAttr.attr[i]
            local nIndex = 0
            for j = 1,#cfg do
                if cfg[j].count > list_count[i] then
                    nIndex = j - 1
                    break
                else 
                    nIndex = j
                end
            end

            if nIndex > 0 then
                LuaHelp.calcActorAttrs(sysarg, calc, cfg[nIndex].attr)
            end

            if var.immortalbro == nil then 
                var.immortalbro = {}
            end
            local arrBro = {2,4,6} --两件套,四件套,六件套
            for j=1,#arrBro do
                if list_count[i] == arrBro[j] and var.immortalbro[j] == nil then --
                    local szFont = {"两" ,"四","六"}
                     local szTips= string.format("<(n%s)>玩家穿戴了仙装%s件套!<我也要穿戴/@@showWin,263>",Actor.getName(sysarg),szFont[j] )
                    System.broadcastTipmsg(szTips, ttScreenCenter+ttChatWindow)
                     var.immortalbro[j] = 1
                end
            end
            
        end

    end
    
end

--竞技称号属性计算
function ResetSportsTitle(sysarg,calc)
    local var = Actor.getStaticVar(sysarg)
    if var.sportstitle == nil then
        var.sportstitle = {}
    end
    for i = 1,#SportsTitleCfg do
        if var.sportstitle[i] ~= nil then
            local nIndex = var.sportstitle[i] + 1
            local cfg = SportsTitleCfg[i]
            if nIndex <= #cfg.Attr then
                LuaHelp.calcActorAttrs(sysarg, calc, cfg.Attr[nIndex])
            end
        end
    end

end


--十二生肖属性计算
function ResetNewZodiacPropertys(sysarg,calc)
    InitNewZodiacInfo(sysarg)
    local svar = Actor.getStaticVar(sysarg)
   
    for i = 1,#NewZodiacCfg.BasicAttr do
        if svar.newzodiac[i] == nil or svar.newzodiac[i].level == nil then 
            svar.newzodiac[i] = {} 
            svar.newzodiac[i].level = -1
            svar.newzodiac[i].exp = 0
        end
     
        if  svar.newzodiac[i].level >= 0 then
            local cfg = NewZodiacCfg.BasicAttr[i]
            cfg = cfg.level[svar.newzodiac[i].level + 1]
            if cfg ~= nil then
                LuaHelp.calcActorAttrs(sysarg, calc, cfg.attr)
            end
        end

    end

    --套装属性  
   
    if svar.newzodiaclevel > 0 then
         for i = #NewZodiacCfg.SuitAttr,1,-1 do
            if svar.newzodiaclevel >= NewZodiacCfg.SuitAttr[i].level then
                 LuaHelp.calcActorAttrs(sysarg, calc, NewZodiacCfg.SuitAttr[i].attr)
                break
            end

         end

    end

end
-- 威名属性计算
function ResetWeiMingPropertys(sysarg, calc)	
	local point = Actor.getUIntProperty(sysarg, PROP_ACTOR_ACIEVEPOINT)
	
	local levelCfg
	for i, v in ipairs(WeiMingCfg.List) do
		if point < v.need then
			break
		else
			levelCfg = v
		end
	end
	
	if levelCfg == nil then return end
	if levelCfg.id == 0 then return end -- 空属性
	
	LuaHelp.calcActorAttrs(sysarg, calc, levelCfg.attriArr)
end

--行会旗帜属性
function ResetGuildFlagPropertys(sysarg,calc)
    local nGuildId = Actor.getGuildId(sysarg)
    if nGuildId > 0 then
        local nGuildFlagLevel = Guild.getFlagLevel(nGuildId)
        if nGuildFlagLevel > 0 and nGuildFlagLevel <= #GuildFlagConfig then
            LuaHelp.calcActorAttrs(sysarg, calc, GuildFlagConfig[nGuildFlagLevel].Attr)
        end

    end

end

--宝物的属性计算
function TreasureJieLevelPropertys(sysarg,calc)

	local Jie={}
	local Level={}

	local jieLevelCount = #TreasureSystemCfg.treasuerInfo
	for i=1,jieLevelCount do 
		Jie[i] = Actor.getFabaoJieByIndex(sysarg,i)
		Level[i] = Actor.getFabaoLevelByIndex(sysarg,i)
	end

	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )

	for i=1,jieLevelCount do 
		
		--没有激活的就不用算属性
		if Jie[i]~=0 then 
			local attrs = TreasureSystemCfg.treasuerInfo[i].classAttrs[myJob][Jie[i]]
			if attrs ~= nil then
				LuaHelp.calcActorAttrs(sysarg, calc, attrs)
			end
		end
		if Level[i]~=0 then 
			local attrs = TreasureSystemCfg.treasuerInfo[i].levelAttrs[myJob][Level[i]]
			if attrs ~= nil then
				LuaHelp.calcActorAttrs(sysarg, calc, attrs)
			end
		end
		
	end
	
	--套装属性
	local cfg = NewSuitConfig[3][myJob].attr
	--算出最小阶
	local MinJie = -1
	--for i=1,#TreasureSystemCfg.treasuerInfo do 
	for i=1,jieLevelCount do 
		if MinJie == -1 then
			MinJie = Jie[i]
		elseif Jie[i]<MinJie then 
			MinJie = Jie[i]
		end
	end
	
	--计算属性
	if MinJie > 0  then 
		local attrs = cfg[MinJie]
		if attrs == nil then
			attrs = cfg[#cfg]
		end
		
		if attrs~=nil then 
			LuaHelp.calcActorAttrs(sysarg, calc, attrs)
		else
			Actor.sendTipmsg(sysarg,string.format("宝物套装[%d]属性计算错误", MinJie),ttFlyTip)
		end
	end
	
		
end

function ResetGodWeaponPropertys(sysarg,calc)
    local var = Actor.getStaticVar(sysarg)
    if var.godweapon ~= nil then 
        for i =1,#GodWeaponCfg do
            if var.godweapon[i].active == 1 then
                 --神兵升级扩展
                if  var.godweapon[i].ex ~= nil and var.godweapon[i].ex > 0 then
                    LuaHelp.calcActorAttrs(sysarg, calc,  GodWeaponCfg[i].level[var.godweapon[i].ex].attr)
                else
                    LuaHelp.calcActorAttrs(sysarg, calc,  GodWeaponCfg[i].suitattr)
                end
                
            else
                for j =1,4 do
                    if var.godweapon[i].level[j] == 1 then
                         LuaHelp.calcActorAttrs(sysarg, calc,  GodWeaponCfg[i].levelattr[j].attr)
                    end
                end
            end
           
        end
    end

end


function FuHunPropertys(sysarg,calc)
	
	local pos = {itWeaponPos,itDressPos,itHelmetPos,itNecklacePos,itLeftBraceletPos,itRightBraceletPos,itLeftRingPos,itRightRingPos,itGirdlePos,itShoesPos}
	for i=1,#pos do 
		local ItemPtr = Item.getEquipByPos(sysarg, pos[i]);
		if ItemPtr then --这个槽位有物品
			local level  = Item.getFuHunInfo(ItemPtr,1)
			if level~=0 then 
				
				--转数
				local ItemPtrItemId = Item.getItemId(ItemPtr)
				local circle = Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedCircle)
				if circle >=5 then 
					circle = circle -4 --5转对应的是第一个
					if FuHunLevelInfo[circle]~=nil then
						--职业
						local job = Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedVocation)
						if job~=0 and FuHunLevelInfo[circle][job]~=nil then 
							
							local nItemType = Item.getItemProperty( sysarg, ItemPtr, Item.ipItemType, 0)
							local cfg =nil 
							if nItemType==1 then 
								cfg = FuHunLevelInfo[circle][job].weapon --武器
							elseif nItemType==2 then 
								cfg = FuHunLevelInfo[circle][job].dress--衣服
							elseif nItemType==3 then 
								cfg = FuHunLevelInfo[circle][job].helmet--头盔
							elseif nItemType==4 then 
								cfg = FuHunLevelInfo[circle][job].necklace--项链
							elseif nItemType==6 then 
								cfg = FuHunLevelInfo[circle][job].decoration--手镯
							elseif nItemType==7 then 	
								cfg = FuHunLevelInfo[circle][job].ring--戒指
							elseif nItemType==8 then 
								cfg = FuHunLevelInfo[circle][job].girdle--腰带
							elseif nItemType==9 then 
								cfg = FuHunLevelInfo[circle][job].shoes--鞋子
							end
							
							if cfg~=nil then 
								if cfg[level]~=nil then 
									LuaHelp.calcActorAttrs(sysarg, calc, cfg[level].attrs)
								end
							end
						end
					end
				end
		
			end
		end
	end
	
end

--修真属性
function xiuzhenResetPropertys(sysarg,calc)

	local allLevel = 0
	local cfg = XiuZhenCfg.Postion
	for i=1,#cfg do 
		local pointLevel = Actor.getXiuZhenData(sysarg,i-1)
		
		--得到总等级
		allLevel = allLevel + pointLevel
		
		if pointLevel~=0 then 	
			local attrs = cfg[i].attr[pointLevel]
			if attrs~=nil then 
				LuaHelp.calcActorAttrs(sysarg, calc, attrs)
			end
		end
	end
	
	--套装属性
	if allLevel>=XiuZhenCfg.SuitAttr[1].allLevel then 
	
		local index =1
		local cfg = XiuZhenCfg.SuitAttr
		for i=2,#cfg do 
			if allLevel>=cfg[i].allLevel then 
				index=i
			else	
				break
			end
		end
		
		LuaHelp.calcActorAttrs(sysarg, calc, cfg[index].attr)
		
	end
end

--血练属性
function xuelianResetPropertys(sysarg,calc)
	
	local slotCount = #XueLianCfg.LevepUp
	for i=1,slotCount do 
		local cgf = XueLianCfg.LevepUp[i]
		local ItemPtr = Item.getEquipByPos(sysarg, cgf.position)
		if ItemPtr then --这个槽位有物品
			--转数
			local ItemPtrItemId = Item.getItemId(ItemPtr)
			local circle = Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedCircle)
			if (i>=10) or (circle>=3) then --10以上的槽位不用3转
				--有等级
				local xiuzhenPosLevel = Actor.getXueLianData(sysarg,i-1)
				if xiuzhenPosLevel~=0 then 
					if cgf.level[xiuzhenPosLevel]~=nil then 
						LuaHelp.calcActorAttrs(sysarg, calc, cgf.level[xiuzhenPosLevel].attr)
					end
				end
			end
		end
	end
	
	--计算套装属性
	local minLevel = -1
	for j=1,slotCount do 
		local xiuzhenPosLevel = Actor.getXueLianData(sysarg,j-1)
		if xiuzhenPosLevel == 0 then
			minLevel = -1
			break
		end
		
		if minLevel == -1 or minLevel > xiuzhenPosLevel then 
			minLevel = xiuzhenPosLevel
		end
	end
	
	if minLevel <= 0 then
		return
	end		
	
	local suitAttrCount = #XueLianCfg.SuitAttr
	for i=suitAttrCount, 1, -1 do
		--从后面计算到前面，看看哪个不符合
		local cfg = XueLianCfg.SuitAttr[i]
		if minLevel >= cfg.allNeedLevel then
			LuaHelp.calcActorAttrs(sysarg, calc, cfg.attr)
			break
		end		
	end	
	
end   

--至尊装备套装属性
function ResetZhizunEquipSuitPropertys(sysarg, calc)
	local pos_list = { itDragonSlayingPos, itZhizunDressPos, itZhizunHelmetPos, itZhizunNecklacePos, itZhizunLeftRingPos, 
		itZhizunRightRingPos, itZhizunLeftBraceletPos, itZhizunRightBraceletPos, itZhizunGirdlePos, itZhizunShoesPos }
	
	local equipCount = 0
	for i, v in ipairs(pos_list) do
		local equipItem_ptr = Item.getEquipByPos(sysarg, v)
		if equipItem_ptr ~= nil then
			equipCount = equipCount + 1
		end
	end
	
	if equipCount < ZhizunEquipSuitAttrs[1].equipCount then
		return
	end
	
	local listSize = #ZhizunEquipSuitAttrs
	for i=listSize, 1, -1 do
		local cfg = ZhizunEquipSuitAttrs[i]
		if equipCount >= cfg.equipCount then
			LuaHelp.calcActorAttrs(sysarg, calc, cfg.attr)
			break
		end
	end
end


--雷神属性计算
function OnThorEquipPropertys(sysarg,calc)

	--每个槽位的属性
	local cfg = ThorEquipCfg.ForLevelUp
	--local totalLevel =0
	local leastLevel =1000
	local leastLevel1 =1000
	local leastLevel2 =1000
	
	for i=1,#cfg do 
		local ThorEquipPosLevel = Actor.getThorEquipData(sysarg,i-1)
		if ThorEquipPosLevel~=0 then 
			local cfg2 = cfg[i].levelUpInfo[ThorEquipPosLevel]
			if cfg2~=nil and cfg2.attr~=nil then 
				LuaHelp.calcActorAttrs(sysarg, calc, cfg2.attr)
			end
			
			--totalLevel = totalLevel +ThorEquipPosLevel
		end
		
		if ThorEquipPosLevel<leastLevel then 
			leastLevel =ThorEquipPosLevel
		end
		
		if i==1 or i==2 then 
			if ThorEquipPosLevel<leastLevel1 then 
				leastLevel1=ThorEquipPosLevel
			end
		else 
			if ThorEquipPosLevel<leastLevel2 then 
				leastLevel2=ThorEquipPosLevel
			end		
		end
		
	end


	--套装属性1  (策划改了需求)
	local index = 0
	for i=1,#ThorEquipCfg.SuitAttr1 do 
		--if totalLevel<ThorEquipCfg.SuitAttr1[i].totalNeedLevel then 
		if leastLevel<ThorEquipCfg.SuitAttr1[i].totalNeedLevel then 
			break
		else 
			index = i
		end
	end
	
	local var = Actor.getStaticVar(sysarg)
	local thorSuitTipFlags = var.thorSuitTipFlags
	if thorSuitTipFlags == nil then thorSuitTipFlags = 0 end
	
	if index~=0 then 
		LuaHelp.calcActorAttrs(sysarg, calc, ThorEquipCfg.SuitAttr1[index].attr)
		if System.getIntBit(thorSuitTipFlags, 0) == 0 then 
			thorSuitTipFlags = System.setIntBit(thorSuitTipFlags, 0, true)
			var.thorSuitTipFlags = thorSuitTipFlags
	
			local str = string.format("恭喜<(n%s)>玩家激活了雷神套装属性,获得特殊属性助力,战斗力瞬间飙升！<我也要提升/@@showWin,1,0>",Actor.getName(sysarg))
			System.broadcastTipmsg(str,ttChatWindow)
		end
	end

	
	--套装属性2 和 3
	local jieLevel = {1,11,21,31,41}
	local index1 = 0
	local index2 = 0
	for i=1,#jieLevel do 
		if leastLevel1>=jieLevel[i] then 
			index1=i
		end
		
		if leastLevel2>=jieLevel[i] then 
			index2=i
		end	
	end
	
	if index1~=0 then 
		LuaHelp.calcActorAttrs(sysarg, calc, ThorEquipCfg.SuitAttr2[index1].attr)
		
		if System.getIntBit(thorSuitTipFlags, 1) == 0 then
			thorSuitTipFlags = System.setIntBit(thorSuitTipFlags, 1, true)
			var.thorSuitTipFlags = thorSuitTipFlags
			
			local str = string.format("恭喜<(n%s)>玩家激活了雷神套装属性,获得特殊属性助力,战斗力瞬间飙升！<我也要提升/@@showWin,1,0>",Actor.getName(sysarg))
			System.broadcastTipmsg(str,ttChatWindow)
		end
	end
	if index2~=0 then 
		LuaHelp.calcActorAttrs(sysarg, calc, ThorEquipCfg.SuitAttr3[index2].attr)
	
		if System.getIntBit(thorSuitTipFlags, 2) == 0 then
			thorSuitTipFlags = System.setIntBit(thorSuitTipFlags, 2, true)
			var.thorSuitTipFlags = thorSuitTipFlags
			
			local str = string.format("恭喜<(n%s)>玩家激活了雷神套装属性,获得特殊属性助力,战斗力瞬间飙升！<我也要提升/@@showWin,1,0>",Actor.getName(sysarg))
			System.broadcastTipmsg(str,ttChatWindow)
		end
	end
end



--心法系统属性计算
function OnXinFaResetPropertys(sysarg, calc)
	
	--心法属性
	local XinFaLevel = Actor.getXinFaData(sysarg)
	if XinFaLevel~=0 then 
		local cfg = XinFaSystemCfg.XinFaLevelUp[XinFaLevel]
		if cfg~=nil then 
			LuaHelp.calcActorAttrs(sysarg, calc, cfg.attr)
		end
	end
	
	--命格套装属性
	local minLevel = 1000
	for i=1,10 do 
		local thisMingGeLevel = Actor.getMingGeData(sysarg,i-1)
		if thisMingGeLevel<minLevel then 
			minLevel = thisMingGeLevel
		end
	end
	
	if minLevel==1000 then
		return 
	end
	
	local cfg2 = XinFaSystemCfg.SuitAttr
	for i=#cfg2 ,1 ,-1 do 
		if minLevel>=cfg2[i].allNeedLevel then 
			LuaHelp.calcActorAttrs(sysarg, calc, cfg2[i].attr)
			break
		end
	end
end
	--龙腾系统属性计算
function OnLongTengResetPropertys(sysarg,calc)
	
	--单个龙腾槽位的属性
	local cfg = LongTengCfg.StrongTheLongThengSlot
		
	local pos = {
		itLongTengWeaponPos,		
		itLongTengDressPos,			
		itLongTengHelmetPos,		
		itLongTengNecklacePos,		
		itLongTengLeftBraceletPos,	
		itLongTengRightBraceletPos,	
		itLongTengLeftRingPos,		
		itLongTengRightRingPos,		
		itLongTengGirdlePos,		
		itLongTengShoesPos,			
	}
	
	--男装备的阶数对应配置
	local posType = {1,2,4,5,6,6,7,7,8,9}
	--女装备的阶数对应配置
	local posType2 = {1,3,4,5,6,6,7,7,8,9}
	
	--装备对应的属性配置
	local posType3 = {1,2,3,4,5,5,6,6,7,8}
	
	local minJie = 1000
	for i=1,#pos do 
		local ItemPtr = Item.getEquipByPos(sysarg, pos[i]);
		if ItemPtr then --这个槽位有物品
			--强化等级
			local level  =  Actor.getLongTengData(sysarg,i-1)
			if level~=0 then 
				if cfg[i]~=nil then 
					local cfg2= cfg[i][level]
					if cfg2~=nil then 
						LuaHelp.calcActorAttrs(sysarg, calc, cfg2.attr)
					end
				end
			end
			
			local ItemPtrItemId = Item.getItemId(ItemPtr)
			
			--根据性别取不同的配置
			local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
			local myJie = 0
			if nSex==0 then 
				myJie = GetLongTengEquipmentJie(posType[i],ItemPtrItemId)
			else 
				myJie = GetLongTengEquipmentJie(posType2[i],ItemPtrItemId)
			end
			
			--有穿上东西，独立加上属性
			if myJie~=0 then 
				local cfgAttr = LongTengCfg.LongTengEquipmentDiffAttr[posType3[i]]
				if cfgAttr~=nil and cfgAttr[myJie]~=nil then 
					LuaHelp.calcActorAttrs(sysarg, calc, cfgAttr[myJie].attr)
				end	
			end
			
			--取得最小的阶
			if  myJie<minJie then 
				minJie = myJie
			end
		else 
			minJie = 0
		end
	end
	
	--套装属性，全部装备都齐全的属性
	if minJie~=0 and minJie~=1000 then 
		local cfg3 = LongTengCfg.SuitAttr
		for i=#cfg3,1,-1 do 
			if cfg3[i].allNeedLevel<=minJie then 
				LuaHelp.calcActorAttrs(sysarg, calc, cfg3[i].attr)
				break
			end
		end
	end
			
end

--得到龙腾武器的阶
function GetLongTengEquipmentJie(index,itemId)
	local cfg = LongTengCfg.LongTengEquipmentId[index]
	if cfg==nil then 
		return 0
	end
	
	for i=1,#cfg do 
		if cfg[i]==itemId then 
			return i
		end
	end
	return 0
end



--戒灵
function RingGodResetPropertys(sysarg,calc)
	--LuaHelp.calcActorAttrs(sysarg, calc, {{type = 171,value = 1,job =0},})

	local nowLevel = Actor.getRingGodLevel(sysarg)
	if nowLevel==0 then 
		return 
	end
	
	local cfg = RingGodCfg.levelUp[nowLevel]
	if cfg~=nil then 
		LuaHelp.calcActorAttrs(sysarg, calc, cfg.attr)
	end
	
	
	--套装属性
	local cfg2 = RingGodCfg.SuitAttr
	local index =0
	for i=1,#cfg2 do 
		if nowLevel <cfg2[i].allNeedLevel then 
			break
		end
		index = i
	end
	if index~=0 then 
		LuaHelp.calcActorAttrs(sysarg, calc, cfg2[index].attr)
	end
end


	--神盾系统
function ShenDunSystemPropertys(sysarg,calc)
	
	local slotCount = 6 -- 有6个槽位
	
	for i=1,slotCount do
		local shendunId = Actor.getShenDunInfo(sysarg,i-1)
		if shendunId~=0 then 
			local isOK=false
			for j=1,#ShenDunCfg.ShenDunInfo do 
				for k=1,#ShenDunCfg.ShenDunInfo[j] do 
					if ShenDunCfg.ShenDunInfo[j][k].id ==shendunId then 
						isOK = true
						LuaHelp.calcActorAttrs(sysarg, calc, ShenDunCfg.ShenDunInfo[j][k].attr)
					end
					if isOK==true then 
						break
					end
				end
				if isOK==true then 
					break
				end
			end
		end
	end
end

function OnActorResetPropertys(sysarg, args)
	local calc = args[1]
	
	-- 威名属性计算
	ResetWeiMingPropertys(sysarg, calc)
	--竞技称号
    ResetSportsTitle(sysarg,calc)
   --十二生肖
   ResetNewZodiacPropertys(sysarg,calc)
   --行会旗帜
   ResetGuildFlagPropertys(sysarg,calc)
   --宝物的属性计算
   TreasureJieLevelPropertys(sysarg,calc)
   -- 元神属性计算
   ResetActorYuanshenPropertys(sysarg, calc)

   --神兵属性计算
   ResetGodWeaponPropertys(sysarg,calc)
   
   --装备附魂属性计算
   FuHunPropertys(sysarg,calc)

   --boss符文盘扩展属性计算
   bossRuneResetPropertys(sysarg,calc)
   
   --修真属性
   xiuzhenResetPropertys(sysarg,calc)
   
   --血练属性
   xuelianResetPropertys(sysarg,calc)
   
   --至尊装备套装属性
   ResetZhizunEquipSuitPropertys(sysarg, calc)
   
   -- 龙灵守护属性计算
   ResetActorGuardDragonPropertys(sysarg, calc)
   
   -- 战灵属性计算
   OnSpiritFighterResetPropertys(sysarg, calc)
   
   --雷神装备属性计算
   OnThorEquipPropertys(sysarg,calc)
   
   -- 灵兽属性计算
   OnSpiritPetResetPropertys(sysarg, calc)
   
   --心法系统属性计算
   OnXinFaResetPropertys(sysarg, calc)
	
	--龙腾系统属性计算
	OnLongTengResetPropertys(sysarg,calc)
	
	--戒灵
	RingGodResetPropertys(sysarg,calc)
	
	--神盾系统
	ShenDunSystemPropertys(sysarg,calc)
  
    --天戒
    SkyRingResetPropertys(sysarg,calc)
  
    --仙装属性
    ResetImmortalEquipPropertys(sysarg,calc)
     
    --仙装强化
    ResetImmortalSystemPropertys(sysarg,calc)
end
 
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeResetPropertys, OnActorResetPropertys)