-- 杂七杂八
--得到沙巴克状态
--#include "data\functions\ActorFlags.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\config\activityconfig\Answer\AnswerAwardCgf.lua" once
--#include "data\functions\ItemFunc\TresureBox.lua" once
--#include "data\config\UpdateGiftCfg.lua" once
--#include "data\config\InnerExchange\InnerExchangeCfg.lua" once
--#include "data\config\GodSoulCfg.lua" once
--#include "data\config\equipSynthesis\EquipSlotGemDataCfg.lua" once
--#include "data\functions\OpenServerGiftCfg.lua" once
--#include "data\functions\ItemFunc\RandomBoxItem.lua" once
--#include "data\functions\SpecialQuest.lua" once

function GiveSBKstate(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cSbkState then
		return
	end
	local netPack = DataPack.allocPacket(sysarg, 139, 212)
	if System.IsInSBKWar()==true then 
		DataPack.writeByte(netPack, 1)
	else 
		DataPack.writeByte(netPack, 0)
	end
	DataPack.flush(netPack)
end

function GetSurplusActivityCount(sysarg, sysid, packet)
    local netPack = DataPack.allocPacket(sysarg, 139, 213)
    --战无双
    DataPack.writeByte(netPack,get_d_val(sysarg,2))

    --个人副本
    local var = Actor.getStaticVar(sysarg);
    local gerenfuben={20,21,22,23,24,25,32}
    local count = 0
    for i = 1,table.getn(gerenfuben) do
        count = count + get_d_val(sysarg,gerenfuben[i])
    end
    DataPack.writeByte(netPack,count)
    --炼狱次数
    count = 2
    if var.days ~= 0 and var.days.emolingCount ~= nil then
        count = 2 - var.days.emolingCount
    end
    DataPack.writeByte(netPack,count)
	-- 押镖每日只进行一次，黄金特权的原次数并入奖励
	count = StdActivityCfg.DuoBeiYaSong.maxEscort
	
    if var.days ~= 0 and var.days.darttms ~= nil then
        count = math.max(0, count - var.days.darttms)
    end
    DataPack.writeByte(netPack,count)

    DataPack.flush(netPack)
end

--江湖万事通   /  答题
function GiveAnswerAward(sysarg, sysid, packet)
	local itemCount = Actor.getItemCount(sysarg,549)
	--身上没有答题令
	if itemCount==0 then 
		Actor.sendTipmsg(sysarg,"您身上没有江湖万事通",ttFlyTip)
		return 
	end
    local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
    if nLevel >= 80 then
        local addgold = 100 * itemCount;
        Actor.removeItem(sysarg,549,itemCount);

        Actor.changeMoney(sysarg,0, addgold, GameLog.cBigGift, "领取答题奖励");
        Actor.sendTipmsg(sysarg,"80级以上自动使用所有<江湖万事通>,每张增加100绑定金币.",256+128)
        return
    end
	local GiftConfig = {}
	local randomNumber = math.random(table.getn(AnswerAwardCfg))
	table.insert(GiftConfig, AnswerAwardCfg[randomNumber])
	if Actor.removeItem(sysarg,549,1)==1 then 
		Awards.Give(sysarg, GiftConfig, GameLog.cBigGift, "领取答题奖励")
		Actor.sendTipmsg(sysarg,"恭喜您回答正确,获得"..AnswerAwardCfg[randomNumber].name.."*"..AnswerAwardCfg[randomNumber].count,ttFlyTip)
		Actor.playEnergyEffect(sysarg,3,0)
	end
end

--元宝清除pk值
function YuanBaoClearPkValue(sysarg,sysid,packet)
    local nPk = Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE)
    if nPk == 0 then
        Actor.sendTipmsg(sysarg,"PK值为0，无需清洗！",ttFlyTip)
        return
    end
    local needMoney = 100
    if Actor.getMoneyCount(sysarg,mtYuanbao) < 100 then
         Actor.sendTipmsg(sysarg,"元宝不足"..needMoney.."，无法清洗PK值！",ttFlyTip)
        return
    end
    if Actor.changeMoney(sysarg,mtYuanbao,-needMoney,LogIds.clearPk,"一键洗红",false) then
        nPk = nPk - 200
        if nPk < 0 then nPk = 0 end
        Actor.setUIntProperty(sysarg,PROP_ACTOR_PK_VALUE,nPk)
        Actor.sendTipmsg(sysarg,"洗红成功，当前PK值："..nPk,ttFlyTip)
    end

end

function MiscYaoTresureBox(sysarg,sysid,packet)
    YaoTresureBoxItem(sysarg)
end
function  MiscGiveTresureBox(sysarg,sysid,packet)
    local nType = DataPack.readByte(packet)
    GetTresureBoxItem(sysarg,nType)
end

function MiscDuihuanNeiGong(sysarg,sysid,packet)
   
    local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
    local nOldLevel = nLevel
    if nLevel < InnerExchangeCfg.level then
        Actor.sendTipmsg(sysarg,"等级低于"..InnerExchangeCfg.level.."级，无法兑换！",ttFlyTip)
        return
    end
   
    local var = Actor.getStaticVar(sysarg)
    if var.ngexchangecount == nil then
        var.ngexchangecount= InnerExchangeCfg.daycount
    end
    if var.ngexchangecount == 0 then
         Actor.sendTipmsg(sysarg,"今日兑换内功次数已满！",ttFlyTip)
         return
    end
    
    for i =1,table.getn(InnerExchangeCfg.exp) do
        if InnerExchangeCfg.exp[i].level == nLevel then
            nLevel = nLevel -1
            local exp  =Actor.getIntProperty(sysarg,PROP_ACTOR_INNER_EXP)
            exp = exp + InnerExchangeCfg.exp[i].exp
            Actor.setIntProperty(sysarg,PROP_ACTOR_INNER_EXP,exp)
            Actor.sendTipmsg(sysarg,"兑换成功，获得内功值为"..InnerExchangeCfg.exp[i].exp,ttFlyTip)

            var.ngexchangecount = var.ngexchangecount - 1
            MiscGetDuihuanNgCount(sysarg)
            Actor.setIntProperty(sysarg,PROP_CREATURE_LEVEL,nLevel)
            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            System.sendCommonLog(LogIds.duihuanneigong,nActorId,Actor.getName(sysarg),nLevel,exp-InnerExchangeCfg.exp[i].exp,exp,"等级兑换内功")
			System.sendCommonLog(500,nActorId,Actor.getName(sysarg),0,nLevel+1,nLevel,"等级兑换内功")


            break
        end

    end
   --更新排行榜
	local newpos, oldpos = System.rankingUpdateValue(0, sysarg, nLevel, nOldLevel)
end

function MiscGetArdourCampIsOpen(sysarg,sysid,packet)
    local sVar = System.getStaticVar()
    local isOpen = 1
    if sVar.ArdourCampPoint == nil then sVar.ArdourCampPoint = 0 end
    if sVar.ArdourCampPoint == nil or sVar.ArdourCampPoint < ArdourCampCfg.ardourcamppoint  then
         isOpen = 0
    end
    local sysVar = System.getDyanmicVar()
    if sysVar.ardourcamping  ~= nil then
        isOpen = 1
    end
    local netPack = DataPack.allocPacket(sysarg,139,225)
    DataPack.writeByte(netPack,isOpen)
    DataPack.writeInt(netPack,sVar.ArdourCampPoint)
    DataPack.flush(netPack)
end
function MiscGetDuihuanNgCount(sysarg,sysid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.ngexchangecount == nil then
         var.ngexchangecount= InnerExchangeCfg.daycount
    end
    
    local netPack = DataPack.allocPacket(sysarg,139,224)
    DataPack.writeByte(netPack,var.ngexchangecount)
    DataPack.flush(netPack)

end
--使用经验玉
function UseExpBallMisc(sysarg,sysid,packet)
 
    local itemSec = DataPack.readInt64(packet)
    local nType = DataPack.readByte(packet)
    local itemPtr = Item.getBagItemPtrByGuid(sysarg,itemSec)
    local nExp = 5000000
    local nFreeExp = 1000000
    local rate = {0,1,2,3,4}
   
    if nType < 0 or nType > table.getn(rate) then
        Actor.sendTipmsg(sysarg,"经验玉索引错误",ttDialog)
        return
    end
    --vip等级
    local vipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) 
    if vipLevel < rate[nType] then
        Actor.sendTipmsg(sysarg,"vip等级不足"..rate[nType].."无法领取！",ttFlyTip)
        return
    end
    if itemPtr == nil then
        --Actor.sendTipmsg(sysarg,"经验玉指针错误",ttFlyTip)
        return false
    end
	
	--print("Item.getItemId(itemPtr)="..Item.getItemId(itemPtr))
	if 482 ~=Item.getItemId(itemPtr)then --传过来的物品不能错
		 Actor.sendTipmsg(sysarg,"此物品不是经验玉",ttFlyTip)
		return 
	end
	
    local nValue = 0
	local nDua = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,nValue)
	
	if nDua <= 0 then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00065,256 )
		return
	end	
	
	local itemId = Item.getItemProperty(sysarg,itemPtr,0,nValue)	
	local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
	--满了才能使用
	if nDua < maxDua then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00125,256 )
		return
	end
    if Item.removeItem(sysarg,itemPtr,1,"useexpball",LogIds.useexpball) then
        local nAllExp = nExp * rate[nType]
        if rate[nType] == 0 then
            nAllExp = nFreeExp
        end
        
        Actor.addExp(sysarg,nAllExp,LogIds.useexpball,"sueexpball")
        local netPack = DataPack.allocPacket(sysarg,139,220)
        DataPack.writeInt(netPack,nAllExp)
        DataPack.flush(netPack)

        local str = string.format("<(n%s)>使用%s获得<%s>点经验.",Actor.getName(sysarg),Item.getItemLinkMsg(482),nAllExp)

        System.broadcastTipmsg(str,ttChatWindow)
    end
    


end
function TiYanCarIsUse(sysarg,sysid,packet)
	local var = Actor.getStaticVar(sysarg)
	if var.TiyanCard ~= nil and var.TiyanCard== 1 then 
		local netPack = DataPack.allocPacket(sysarg,139,230)
        DataPack.writeByte(netPack,1)--已经开启了体验卡
        DataPack.flush(netPack)
	else 
		local netPack = DataPack.allocPacket(sysarg,139,230)
        DataPack.writeByte(netPack,0)--没有开启体验卡
        DataPack.flush(netPack)
	end
end

function MiscGetUpdateGiftState(sysarg,sysid,packet)

    local pack = DataPack.allocPacket(sysarg,139,238)
     local sVar = System.getDyanmicVar()
     local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if sVar.openupdategift == nil or sVar.openupdategift == 0 then
        DataPack.writeByte(pack,0)
        DataPack.flush(pack)
        return
    else
        if sVar.GiveUpdateGift == nil then
             sVar.GiveUpdateGift = {} 
             sVar.GiveUpdateGift.count = 0 
             sVar.GiveUpdateGift.list = {}
        end
        if sVar.GiveUpdateGift.count > 0 then
            for i = 1,sVar.GiveUpdateGift.count do
                if sVar.GiveUpdateGift.list[i] == nActorId then
                  DataPack.writeByte(pack,2)
                  DataPack.flush(pack)
                  return
                end
            end
        end
        DataPack.writeByte(pack,1)
        DataPack.flush(pack)
    end

end
function  MiscGiveUpdateGift(sysarg,sysid,packet)
    local sVar = System.getDyanmicVar()
    if sVar.openupdategift == nil or sVar.openupdategift == 0 then
         Actor.sendTipmsg(sysarg,"无法领取，当前礼包未开启！",ttFlyTip)
        return
    end
    if sVar.GiveUpdateGift == nil then
         sVar.GiveUpdateGift = {} 
         sVar.GiveUpdateGift.count = 0 
         sVar.GiveUpdateGift.list = {}
    end
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if sVar.GiveUpdateGift.count > 0 then
        for i = 1,sVar.GiveUpdateGift.count do
            if sVar.GiveUpdateGift.list[i] == nActorId then
                Actor.sendTipmsg(sysarg,"您已经领取过礼包了，无法再次领取！",ttFlyTip)
                return
            end

        end
    end
    
    if Awards.CheckBagGridCount(sysarg,UpdateGiftCfg.award) then
		Awards.Give(sysarg,UpdateGiftCfg.award,LogIds.updategift,"更新礼包")
        Actor.sendTipmsg(sysarg,"领取更新礼包成功！",ttFlyTip)
        sVar.GiveUpdateGift.count = sVar.GiveUpdateGift.count + 1
        sVar.GiveUpdateGift.list[sVar.GiveUpdateGift.count] = nActorId

        local pack = DataPack.allocPacket(sysarg,139,238)
        DataPack.writeByte(pack,2)
        DataPack.flush(pack)
	else
        Actor.sendTipmsg(sysarg,"包裹格子不足，请清理包裹！",ttFlyTip)
        return
    end

end

--传音喇叭的是否自动用金钱代替喇叭的状态
function ChuanYinLaBaState(sysarg,sysid,packet)
 
    local nType = DataPack.readByte(packet)
	local var = Actor.getStaticVar(sysarg)
	if nType== 1 then --获取状态
		if var.ChuanYinLaBaS ==nil then 
			var.ChuanYinLaBaS = 0 --未开启
		end
		
		local pack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sChuanYinLaBaState)
        DataPack.writeByte(pack,var.ChuanYinLaBaS)
        DataPack.flush(pack)
		
	elseif nType== 2 then --改变状态
		local state = DataPack.readByte(packet)
		var.ChuanYinLaBaS = state
		
		local pack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sChuanYinLaBaState)
        DataPack.writeByte(pack,var.ChuanYinLaBaS)
        DataPack.flush(pack)
	end	
	
end

--激活神甲
function MiscActivateGodDress(sysarg,sysid,packet)
    local cfg = GodSoulCfg.Activate
    local pEquip = Item.getEquipByPos(sysarg,itPayDressPos)
    local id = GetGodEquipItemId(sysarg,cfg.DestItem)
    if id == nil then return end
    if pEquip ~= nil then
        Actor.sendTipmsg(sysarg,"已经有神甲了，无法再次激活！",ttFlyTip)
       return
    end
    --是否有5个神器碎片
    if Actor.getItemCount(sysarg,cfg.ItemId) < cfg.Count then
      Actor.sendTipmsg(sysarg,"神器碎片不足"..cfg.Count.."个，无法升级！",ttFlyTip)
       return
    end
    --检查包裹格子空间
    if Item.getBagEmptyGridCount(sysarg) <= 0 then 
        Actor.sendTipmsg(sysarg,"包裹空间不足,请清理1格！",ttFlyTip)
        return
    end   
    if not Actor.removeItem(sysarg,cfg.ItemId,cfg.Count,-1,-1,-1,"激活神甲",LogIds.ActivateGodDress) then
        Actor.sendTipmsg(sysarg,"激活神甲失败,未知错误！",ttFlyTip)
        return
    end

    local pUserItem = Item.createItem(id,1,0,0,1)
    if pUserItem == nil then
        Actor.sendTipmsg(sysarg,"激活神甲失败,未知错误1！",ttFlyTip)
        return
    end 
    Item.addItem(sysarg,pUserItem,"激活神甲给予",LogIds.ActivateGodDress)
    Item.equipItem(sysarg,pUserItem) 
    Actor.sendTipmsg(sysarg,"激活神甲成功！",ttFlyTip)
end

--神器升级
function MiscGodEquipUpLev(sysarg,sysid,packet)
    local equipType = DataPack.readByte(packet)
    if equipType ~= 1 and equipType ~= 2 then return end
    local cfg = GodSoulCfg.UpLev.GodWeapon
    local nEquipPos = itPayWeaponPos
    if equipType == 2 then
        cfg = GodSoulCfg.UpLev.GodDress
        nEquipPos = itPayDressPos
    end
    local pItem = Item.getEquipByPos(sysarg,nEquipPos)
    if pItem == nil then
         Actor.sendTipmsg(sysarg,"没有激活该神器，无法升级！",ttFlyTip)
        return
    end
   
    local nNeedSoulValue= -1
    local nDestItemId = 0
    local nItemId = Item.getItemProperty(sysarg,pItem,ipItemID) 
    local nLev = 0
    for i=1,table.getn(cfg) do
        for j= 1,table.getn(cfg[i].SrcItem) do
            if cfg[i].SrcItem[j] == nItemId then
                nLev = i
                if i == table.getn(cfg) then
                    Actor.sendTipmsg(sysarg,"升级失败，神器已满级！",ttFlyTip)
                    return
                end
                nNeedSoulValue =  cfg[i].NeedSoulValue
                nDestItemId = GetGodEquipItemId(sysarg,cfg[i].DestItem)
                if nDestItemId == nil or nDestItemId <= 0 then
                    Actor.sendTipmsg(sysarg,"升级失败，无法找到配置！",ttFlyTip)
                    return
                end
                break
            end
        end
        if nLev > 0 then break end
    end
    if nNeedSoulValue == -1 then
        Actor.sendTipmsg(sysarg,"升级失败，无法找到该物品id！",ttFlyTip)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.godSoulValue == nil then var.godSoulValue = 0 end
    if var.godSoulValue < nNeedSoulValue then
        Actor.sendTipmsg(sysarg,"升级失败，神魂值不足"..nNeedSoulValue.."！",ttFlyTip)
        return
    end
	
	System.sendCommonLog(LogIds.shenhunzhibianhua,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,var.godSoulValue,var.godSoulValue - nNeedSoulValue,'','','','','','','',"升级消耗")
    var.godSoulValue = var.godSoulValue - nNeedSoulValue
    Item.setItemProperty(sysarg,pItem,ipItemID,nDestItemId)
    Actor.sendTipmsg(sysarg,"升级成功！",ttFlyTip)
    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.goduplevel,nActorID,Actor.getName(sysarg),nLev,nItemId,nDestItemId,"","",Item.getItemName(nDestItemId),"","",Item.getItemName(nItemId)) 
    local str = "<(n%s)>成功升级获得%s,<我也要去升级/@@showWin,200>"
    str = string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(nDestItemId))
    System.broadcastTipmsg(str,ttChatWindow)
    MiscGetGodSoul(sysarg)
    local pack = DataPack.allocPacket(sysarg,139,253)
    DataPack.flush(pack)


end
function GetGodEquipItemId(sysarg,cfg)
    local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
    for i=1,table.getn(cfg) do
        if cfg[i].job == nJob and cfg[i].sex == nSex then
            return cfg[i].id
        end
    end
    return nil
end
--神魂兑换
function MiscGodSoulExChange(sysarg,sysid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.daygodsoul==nil then var.daygodsoul = {} end
    if var.godSoulValue == nil then var.godSoulValue = 0 end
    local nIndex = DataPack.readByte(packet)
    
    if  nIndex <= 0 or nIndex > table.getn(GodSoulCfg.ExChange) then
         Actor.sendTipmsg(sysarg,"非法索引！",ttFlyTip)
        return
    end
    if var.daygodsoul[nIndex] ~= nil then
        Actor.sendTipmsg(sysarg,"兑换失败,今日已兑换！",ttFlyTip)
        System.trace("waigua..shenhun:name:"..Actor.getName(sysarg))
        return
    end
    local cfg = GodSoulCfg.ExChange[nIndex]
    if cfg == nil then return end
    local nDelItem = 0
    local nAllCount = cfg.Count
    local delItem= {}
    
    for i = 1,table.getn(cfg.SrcItemId) do
        local nBind = -1
        if cfg.SrcItemId[i] == 439 then nBind = 0 end --通天神剑兑换改为非绑定
        local nItemCount = Actor.getItemCount(sysarg,cfg.SrcItemId[i],0,-1,nBind)
       
        if  nItemCount > 0 then
                local lItem={}
                lItem.count = nItemCount
                lItem.itemid = cfg.SrcItemId[i]
                nAllCount = nAllCount - nItemCount
                if nAllCount < 0 then
                    lItem.count = lItem.count + nAllCount
                    table.insert(delItem,lItem)
                    nAllCount = 0
                    break
                end
                
                
                table.insert(delItem,lItem)
                if nAllCount == 0 then break end
                
        end

    end
    if nAllCount > 0 then
        Actor.sendTipmsg(sysarg,"兑换失败,物品数量不足！",ttFlyTip)
       return
    end
    for i = 1,table.getn(delItem) do
        Actor.removeItem(sysarg,delItem[i].itemid,delItem[i].count,-1,-1,-1,"神魂兑换",LogIds.godexchange)
    end
    local nOldSoul = var.godSoulValue
    var.godSoulValue = var.godSoulValue + cfg.Value
    local nActorId = Actor.getIntProperty(sysarg,nActorId)
    System.sendCommonLog(LogIds.exchangesoulEx,nActorId,Actor.getName(sysarg),nOldSoul,var.godSoulValue,cfg.Value)
    Actor.sendTipmsg(sysarg,"兑换成功,神魂值增加"..cfg.Value,ttFlyTip)
    var.daygodsoul[nIndex] = 1
    MiscGetGodSoul(sysarg)
    MiscGetDayGodSoulExChange(sysarg)
        --支线任务
    if var.showgodtask == 1 then
        if var.showgodtaskindex == nil then var.showgodtaskindex = 0 end
        var.showgodtaskindex = var.showgodtaskindex + 1
        if var.showgodtaskindex >= 3 then
            var.showgodtask = 0
             --支线任务完成奖励
            local awardid = 5171
            local awardcount = 15
            if Item.getBagEmptyGridCount(sysarg) > 0 then
                Actor.addItem(sysarg,awardid,0,0,awardcount,0,0,"神魂任务")
            else
               local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
                System.AddMail(actor_id,6,0,"神魂任务","神魂任务奖励",0,0,awardid..","..awardcount..",1")
            end
        end
        Quest_ShuaXin(sysarg)
       
        
     end
end

function MiscGetGodSoul(sysarg,sysid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.godSoulValue == nil then var.godSoulValue = 0 end
    local netPack = DataPack.allocPacket(sysarg, 139, 240)
    DataPack.writeInt(netPack,var.godSoulValue) 
    DataPack.flush(netPack)
end

function MiscBuyOldGodEquip(sysarg,sysid,packet)

    local var = Actor.getStaticVar( sysarg )
	local firstRecharge = var.FirstRechargeFlag
	if firstRecharge == nil or firstRecharge ~= 2 then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.zf375,ttFlyTip )
		return
	end
    if var.buyoldgod ~= nil then
    	Actor.sendTipmsg( sysarg,Lang.ScriptTips.zf375,ttFlyTip )
		return
    end
    local cfg = GodSoulCfg.OldBuy
    if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.NeedYuanBao then
         Actor.sendTipmsg(sysarg,"元宝不足"..cfg.NeedYuanBao.."，购买失败!",ttFlyTip)
        return
    end
    if not Awards.CheckBagGridCount(sysarg,cfg.Reawrd) then
        Actor.sendTipmsg(sysarg,"包裹空间不足，请清理!",ttFlyTip)
		return	
	end
    if Awards.Give(sysarg,cfg.Reawrd,LogIds.OldBuyGodEquip,"老区购买神器奖励") == false then
        Actor.sendTipmsg(sysarg,"购买失败，未知错误!",ttFlyTip)
		return	
    end
    Actor.changeMoney(sysarg,mtYuanbao,-cfg.NeedYuanBao,LogIds.OldBuyGodEquip,"老区购买神器") 

  
    Actor.sendTipmsg(sysarg,"购买成功!",ttFlyTip)
    var.buyoldgod = 1
    local pack = DataPack.allocPacket(sysarg,139,246)
    DataPack.flush(pack)
    var.showgodtask = 1--显示主线任务的标识
    Quest_ShuaXin(sysarg)
end

function MiscSendGiveGodEquipState(sysarg,sysid,packet)
    
    local var = Actor.getStaticVar( sysarg )
    local nState = 0
    if var.buyoldgod ~= nil then nState= 1 end
    -- 实际已穿戴神器的角色不依赖历史礼包领取标记。
    local pItem = Item.getEquipByPos(sysarg,itPayWeaponPos)
    if pItem ~= nil then
        local itemId = Item.getItemProperty(sysarg,pItem,ipItemID)
        for _, cfg in ipairs(GodSoulCfg.UpLev.GodWeapon) do
            for _, sourceId in ipairs(cfg.SrcItem) do
                if sourceId == itemId then nState = 1; break end
            end
            if nState == 1 then break end
        end
    end
    local pack = DataPack.allocPacket(sysarg,139,243)
    DataPack.writeByte(pack,nState)
    DataPack.flush(pack)
   
end
function MiscGetDayGodSoulExChange(sysarg,sysid,packet)
    local var = Actor.getStaticVar(sysarg) 
    if var.daygodsoul == nil then var.daygodsoul = {} end
    local cfg = GodSoulCfg.ExChange
    local pack = DataPack.allocPacket(sysarg,139,244)
    DataPack.writeByte(pack,table.getn(cfg))
    for i= 1,table.getn(cfg) do
        if var.daygodsoul[i] ~= nil then
             DataPack.writeByte(pack,1)
        else
            DataPack.writeByte(pack,0)
        end
    end
    DataPack.flush(pack)
end

--获取特惠礼包购买信息
function MiscGetTeHuiGiftInfo(sysarg,sysid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.tehuigift == nil then var.tehuigift = {} end
    local pack = DataPack.allocPacket(sysarg,139,247)
    DataPack.writeByte(pack,table.getn(OpenServerGiftCfg))
   
    for i  =1,table.getn(OpenServerGiftCfg) do
        if var.tehuigift[i] == nil then
            var.tehuigift[i]={}
        end
       
        for j = 1,table.getn(OpenServerGiftCfg[i].Files) do
            local give = var.tehuigift[i]
            local nTag = 0
            if give[j] ~= nil then
                nTag = 1
            end
            DataPack.writeByte(pack,nTag)
        end
       
    end
    DataPack.flush(pack)
end
--function SetOpenActityDay(day)
--    day = tonumber(day)
--    local svar = System.getStaticVar()
--    svar.tehuinewday = day
--    local playerList = LuaHelp.getAllActorList() 
--    for k, plyPtr in ipairs(playerList or {}) do
--		MiscGetTehuiNewDay(plyPtr)
--	end

--end
function MiscGetTehuiNewDay(sysarg,sysid,packet)
    local svar = System.getStaticVar()
    local nDay = System.getDaysSinceOpenServer()
    if nDay > 255 then return end
 --   svar.tehuinewday = nDay
--    if System.getDaysSinceCombineServer() <= 0 then
--        svar.tehuinewday = nDay
--    end
--    --只在第八天开启
--    if svar.tehuinewday ~= nil and nDay > 7 and svar.tehuinewday < 255 then nDay = svar.tehuinewday  end 

    local pack = DataPack.allocPacket(sysarg,139,249)
    DataPack.writeByte(pack,nDay)
    DataPack.flush(pack)
end
--购买特惠礼包
function MiscBuyTeHuiGiftInfo(sysarg,sysid,packet)
    
    local nType = DataPack.readByte(packet)
    local nIndex = DataPack.readByte(packet)
    if nType < 0 or nType > table.getn(OpenServerGiftCfg) then
        Actor.sendTipmsg(sysarg,"错误的下标",ttFlyTip)
        return 
    end
    local svar = System.getStaticVar()
--    if svar.tehuinewday == nil then 
--        if System.getDaysSinceOpenServer() == 8 then
--            svar.tehuinewday  = 8
--        else
--            return
--        end

--     end 
    local cfg = OpenServerGiftCfg[nType]
    local nOpenDay = System.getDaysSinceOpenServer()
    local isOpen =false
    for i = 1,table.getn(cfg.OpenDay) do
        if nOpenDay == cfg.OpenDay[i] then
            isOpen = true
            break
        end
    end
    if isOpen == false then return end
    if nIndex < 0 or nIndex > table.getn(cfg.Files) then
         Actor.sendTipmsg(sysarg,"错误的下标",ttFlyTip)
        return 
    end
    cfg = OpenServerGiftCfg[nType].Files[nIndex]
    
	local var = Actor.getStaticVar(sysarg)
	if var.tehuigift == nil then var.tehuigift = {} end
    local give = var.tehuigift[nType] 
	if give == nil then give = {} end
	
	--非法购买
	if nIndex==4 then
		if give[1] == nil then
			return
		end
	end
	if nIndex==5 then
		if give[2] == nil then
			return
		end
	end
	if nIndex==6 then
		if give[3] == nil then
			return
		end
	end
	if nIndex==7 then
		if give[1] == nil or give[4] == nil then
			return
		end
	end
	if nIndex==8 then
		if give[2] == nil or give[5] == nil then
			return
		end
	end
	if nIndex==9 then
		if give[3] == nil or give[6] == nil then
			return
		end
	end

    if give[nIndex] ~= nil then
        Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
        return
    end
	--判断元宝是否足够 	
    if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.NeedMoney then
       Actor.sendTipmsg(sysarg,"元宝不足"..cfg.NeedMoney..",购买失败",ttFlyTip)
        return
    end
   --包裹是否足够
    if not Awards.CheckBagGridCount(sysarg,cfg.Award) then
        Actor.sendTipmsg(sysarg,"包裹空间不足，请清理!",ttFlyTip)
		return	
	end
  
  
    Actor.changeMoney(sysarg,mtYuanbao,-cfg.NeedMoney,LogIds.buyetehuigift,cfg.name) 

    Awards.Give(sysarg,cfg.Award,LogIds.buyetehuigift,cfg.name)
    give[nIndex] =1
    MiscGetTeHuiGiftInfo(sysarg)
    Actor.sendTipmsg(sysarg,"购买成功!",ttFlyTip)
    local str = "<(n%s)>玩家购买了%s,获得大量神魂.神魂是提升神器的唯一材料.  <我也要购买/@@showWin,"..cfg.winId..">"
    if cfg.winId == 207 then
        str = "<(n%s)>玩家购买了%s,获得大量宝石. <我也要购买/@@showWin,"..cfg.winId..">"    
    end
    
    str = string.format(str,Actor.getName(sysarg),cfg.name)
    System.broadcastTipmsg(str,ttChatWindow)

end
--勇闯天关鼓舞
function YongChuanTianGuanGuWu(sysarg,sysid,packet)


	if not (Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377 ) then  --才能使用这个buffs
		return 
	end
	
--buff组  210
--ID 
local buffTable = 
{
 {222,224}, --1级：
 {225,227}, --2级：
 {228,230}, --3级：
 {231,233}, --4级：
 {234,236}, --5级：
 {237,239}, --6级：
 {240,242}, --7级：
 {243,245}, --8级：
 {246,248}, --9级：
 {249,251}, --10级：
}

local buffTable2 = 
{
 {252,254}, --1级：
 {255,257}, --2级：
 {258,260}, --3级：
 {261,263}, --4级：
 {264,266}, --5级：
 {267,269}, --6级：
 {270,272}, --7级：
 {273,275}, --8级：
 {276,278}, --9级：
 {279,281}, --10级：
}

		
	--local nIndex = tonumber(sysid) --方便测试
	local nIndex = DataPack.readByte(packet)
	if nIndex == 1 then --金币鼓舞（绑金或者金币）
		
		
		--判断是否达到最够层了,现在到达了第几层
		local buffLayer =0
		local hasFind = 0
		for i=1,10 do 
			for j=buffTable[i][1],buffTable[i][2] do 
				if Actor.hasBuffById(sysarg,j) then 
					hasFind=1
					break
				end
			end
			if hasFind== 1 then 
				break
			end
			buffLayer = buffLayer + 1
		end
		--buffLayer为n 就有n+1层buff，为10没有buff
		if buffLayer== 10 then 
			buffLayer = 0 
		else 
			buffLayer = buffLayer+1
		end
			
		if buffLayer==10 then
			Actor.sendTipmsg(sysarg,"您的buff已经达到最高层，不能继续添加",ttFlyTip)
			return 
		end
	
	
		--直接扣钱，判断前是否够
		if Actor.changeMoney(sysarg,0,-100000,LogIds.YongChuangTianGuan, "天关鼓舞")==false then 
			if Actor.changeMoney(sysarg,1,-100000,LogIds.YongChuangTianGuan, "天关鼓舞")==false then
				Actor.sendTipmsg(sysarg, "金币/绑定金币不足", ttFlyTip)
				return 
			end
		end
		--给buff
		--print("buffLayer+1="..buffLayer+1)
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][1])
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][1]+1)
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][2])
		
	elseif nIndex == 2 then --元宝鼓舞
		
		--判断是否达到最够层了,现在到达了第几层
		local buffLayer =0
		local hasFind = 0
		for i=1,10 do 
			for j=buffTable2[i][1],buffTable2[i][2] do 
				if Actor.hasBuffById(sysarg,j) then 
					hasFind=1
					break
				end
			end
			if hasFind== 1 then 
				break
			end
			buffLayer = buffLayer + 1
		end
		--buffLayer为n 就有n+1层buff，为10没有buff
		if buffLayer== 10 then 
			buffLayer = 0 
		else 
			buffLayer = buffLayer+1
		end
			
		if buffLayer==10 then
			Actor.sendTipmsg(sysarg,"您的buff已经达到最高层，不能继续添加",ttFlyTip)
			return 
		end
		
	
		if Actor.changeMoney(sysarg,3,-25,LogIds.YongChuangTianGuan, "天关鼓舞")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
			return 
		end
		
		--给buff
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][1])
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][1]+1)
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][2])

	end
end
function MiscShakeRandomBox(sysarg,sysid,packet)
    
    SnakeRandomBoxItem(sysarg)
end

function MiscGiveRandomBox(sysarg,sysid,packet)
    GiveRandomBoxItem(sysarg)

end



--一键完成的功能,前端做出选择-----------------------------------------------------------------
function MiscYiJianWanChen(sysarg,sysid,packet)
	local nType = DataPack.readByte(packet)
	local index = DataPack.readByte(packet)
	if nType == 1 then 
		yijianwancheng1_sureFun(sysarg,index)
	elseif nType == 2 then 
		yijianwancheng2_sureFun(sysarg,index)
	end
end
--一键完成的功能-------------------------------------------------------------------------


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cChuanYinLaBaState, ChuanYinLaBaState)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSbkState, GiveSBKstate)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetSurplusActivityCount, GetSurplusActivityCount)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cAnswerQuest, GiveAnswerAward)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cClearPk,YuanBaoClearPkValue)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cUseExpBall,UseExpBallMisc)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cYaoTresureBox,MiscYaoTresureBox)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveTresureBox,MiscGiveTresureBox)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cDuihuanNeiGong,MiscDuihuanNeiGong)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetDuihuanNgCount,MiscGetDuihuanNgCount)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetArdourCampIsOpen,MiscGetArdourCampIsOpen)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cTiYanCardIsUse,TiYanCarIsUse)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveUpdateGift,MiscGiveUpdateGift)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetUpdateGiftState,MiscGetUpdateGiftState)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cActivateGodDress,MiscActivateGodDress)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGodEquipUpLev,MiscGodEquipUpLev)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGodSoulExChange,MiscGodSoulExChange)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetGodSoul,MiscGetGodSoul)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuyOldGodEquip,MiscBuyOldGodEquip)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetBuyGodEquip,MiscSendGiveGodEquipState)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetDayGodSoulExChange,MiscGetDayGodSoulExChange)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cYongChuangTianGuan,YongChuanTianGuanGuWu)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetTeHuiGiftInfo,MiscGetTeHuiGiftInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuyTeHuiGiftInfo,MiscBuyTeHuiGiftInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetTehuiNewDay,MiscGetTehuiNewDay)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cShakeRandomBox,MiscShakeRandomBox)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveRandomBox,MiscGiveRandomBox)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSendYiJianWanChengBox,MiscYiJianWanChen)

         