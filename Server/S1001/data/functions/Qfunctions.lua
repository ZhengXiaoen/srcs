--#include "data\config\item\NormalItemDatas.lua" once
--#include "data\envir\FubenCountConfig.lua" once
--#include "data\config\activity\BigGiftBagConfig.lua" once
--#include "data\config\circle\CircleConsumes.lua" once	--转生消耗配置
--#include "data\config\item\YbGifts.lua" once
--#include "data\config\modules\wardrobe_cfg.lua" once
--#include "data\config\vip\VipPrivilegesCfg.lua" once
--#include "data\functions\Fuben\emoling.lua" once
--#include "data\functions\TreasureTrove\TreasureTrove.lua" once
 --#inlcude "data\functions\ItemFunc\TresureBox.lua" once
 --#include "data\functions\ItemFunc\RandomBoxItem.lua" once
 --#include "data\config\SportsTitleCfg.lua" once
 --#include "data\config\modules\TitleHasTime.lua" once
----#include "data\config\NewZodiac.lua" once
--#include "data\functions\player.lua" once
--#include "data\functions\new_activity\festival\ActivityRankFunc.lua" once
-- 使用金条、绑元、绑金、元宝、金条等
function onZhaoCaiFu(sysarg, itemidx, itemPtr, ItemTable, delType, itemUserNum)
	local ItemZz = Item.getItemLinkMsg(ItemTable.item_id);
	local maxUseTimes = 20;
	local var = Actor.getStaticVar(sysarg);
	local barsNum = var.days.barsNum;						-- 金条次数
	if var.days.barsNum == nil then
		barsNum = 0;
	end
	
	local nItemName = Item.getItemName(ItemTable.item_id);
	
	--金条使用次数限制
	if ItemTable.type == 0 and ItemTable.maxUseTimes ~= -1 then
		local vipLeve = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE);
		local tbMaxCount = #VipPrivilegesCfg
		if vipLeve > tbMaxCount then
			maxUseTimes = VipPrivilegesCfg[tbMaxCount].barscount;
		elseif vipLeve > 0 then
			maxUseTimes = VipPrivilegesCfg[vipLeve].barscount;
		end
		
		if maxUseTimes ~= nil then		
			if (barsNum + itemUserNum) > maxUseTimes then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00013, nItemName, (maxUseTimes - barsNum)), ttFlyTip);
				return false;
			end
		end
	end

	if Actor.removeItemByPtr(sysarg,itemPtr, itemUserNum, true, nItemName, 5) >= itemUserNum then
		Actor.changeMoney(sysarg, ItemTable.type, ItemTable.value*itemUserNum, GameLog.clNpcGiveMoney);
		
		local moneyNum = 0;
		if ItemTable.type == 0 then
			moneyNum = Actor.getIntProperty(sysarg, PROP_ACTOR_BIND_COIN);
		elseif ItemTable.type == 1 then
			moneyNum = Actor.getIntProperty(sysarg, PROP_ACTOR_COIN);
		elseif ItemTable.type == 2 then
			moneyNum = Actor.getIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO);
		elseif ItemTable.type == 3 then
			moneyNum = Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO);
		end

		if ItemTable.type == 0 and ItemTable.maxUseTimes ~= -1 then
			-- 金条次数统计
			var.days.barsNum = barsNum + itemUserNum;
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00007, ItemTable.str, ItemTable.value*itemUserNum, moneyNum, maxUseTimes - var.days.barsNum), ttFlyTip);
		else
			-- 其它提示
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*itemUserNum, moneyNum), ttFlyTip);
		end
	end
	return true;
end

function onChongWuTiShengJuan(sysarg,itemidx,itemPtr,ItemTable,delType)
	local ItemZz = Item.getItemLinkMsg(ItemTable.item_id);
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;

	if ItemTable.dparam then
		if d[ItemTable.dparam] < 1 then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00001,ItemZz,d[ItemTable.dparam]),4);
			return true;
		end
	end

	local result = Actor.canGiveAward(sysarg, ItemTable.drops.type,ItemTable.drops.id, ItemTable.drops.count,ItemTable.drops.quality,ItemTable.drops.strong,ItemTable.drops.bind,true);
	if not result then
		return false
	end
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,itemPtr,1,true,nItemName,5) > 0 then
		if ItemTable.dparam then
			d[ItemTable.dparam] = d[ItemTable.dparam] - 1;
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00002,ItemZz,d[ItemTable.dparam]),128);
		end
	 Actor.giveAward(sysarg, ItemTable.drops.type,ItemTable.drops.id, ItemTable.drops.count,ItemTable.drops.quality,ItemTable.drops.strong,ItemTable.drops.bind);
	 end
	 return true;


end

--使用随机宝箱
function onRandomBoxFunc(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) >= itemUserNum then
       
        InitRandomBoxItem(sysarg,ItemTable.param)
       --InitTreasureTrove(sysarg,nil,ItemTable.param)
    end
    return true

end
function onTeasureTroveFunc(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) >= itemUserNum then
      
       InitTreasureTrove(sysarg,nil,ItemTable.param)
    end
    return true
end
-- 使用PK物品功能接口(如：赎罪药水...)
function onPkItemInterfaceFunc(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local nPkValue = Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE);	
	if nPkValue <= 0 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00003), ttFlyTip)
		return true;
	end
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) >= itemUserNum then
	--if Actor.removeItem(sysarg,itemidx,itemUserNum) == itemUserNum then
		local nDS = ItemTable.value*itemUserNum;
		Actor.setUIntProperty(sysarg, PROP_ACTOR_PK_VALUE, nPkValue - nDS);
		nPkValue = Actor.getIntProperty(sysarg, PROP_ACTOR_PK_VALUE);
		if nPkValue < 0 then Actor.setUIntProperty(sysarg, PROP_ACTOR_PK_VALUE,0); end
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00011, nDS, nPkValue), ttFlyTip);
	end
	return true;
end

function onDayAwardItemFunc(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local var = Actor.getStaticVar(sysarg)
    if var.daygiveitem == nil then 
         var.daygiveitem = {}
         var.daygiveitem.count = 0
         var.daygiveitem.id={}
    end
    for i =1,var.daygiveitem.count do
        if var.daygiveitem.id[i] == ItemTable.item_id then
            Actor.sendTipmsg(sysarg,"今天已使用过，请等明天使用！",ttFlyTip)
            return true
        end
    end
    var.daygiveitem.count =  var.daygiveitem.count + 1
    var.daygiveitem.id[var.daygiveitem.count] = ItemTable.item_id
    award = ItemTable.award
    local day = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua)
    local daymax = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDuaMax)

     if day == 0 then
        Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5)
        return true
    end
    
    local dayaward = (daymax - day ) / 1000 + 1
    day = day - 1000
    Item.setItemProperty(sysarg,itemPtr,Item.ipItemDua,day)
    if day == 0 then
        Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5)
    end
    --print("当前耐久度:"..day.."最大耐久度:"..daymax)
    --领取奖励
     if award[dayaward] == nil then 
        Actor.sendTipmsg(sysarg,"配置出错！",ttFlyTip)
        return true
     end
     local cfg = award[dayaward]
     for i =1,table.getn(cfg) do
        if cfg[i].type == 0 then
            Actor.changeMoney(sysarg,cfg[i].param,cfg[i].count,LogIds.dalibaoaa,"大礼包")
            Actor.sendTipmsg(sysarg,"获得金币"..cfg[i].count,ttFlyTip)
        elseif cfg[i].type == 1 then
            Actor.addExp(sysarg,cfg[i].count,LogIds.dalibaoaa,0)
            Actor.sendTipmsg(sysarg,"获得经验"..cfg[i].count,ttFlyTip)
        end 

     end
     return true
end
function onRuneEssenceFunc(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local var = Actor.getStaticVar(sysarg)
    if var.RuneCount == nil then var.RuneCount = 0 end
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) >= itemUserNum then
        local nCount = itemUserNum* 1
            var.RuneCount = var.RuneCount + nCount
            Actor.sendTipmsg(sysarg,"获得符文精华"..nCount.."个",ttFlyTip)

            local pack = DataPack.allocPacket(sysarg,139,209)
            DataPack.writeUInt(pack,var.RuneCount)
            DataPack.flush(pack)
    end
    return true
end

-- 初始化PK物品接口
function zInitPkItemFunc(sysarg)
	for i = 1,table.getn(zPKItemTable) do
		local x = zPKItemTable[i];
		GlobalItemFn[x.item_id] = { func = onPkItemInterfaceFunc, params = x };
	end	
    --宝藏宝箱
    
    for i = 1,table.getn(zTeasureTrove) do
		local x = zTeasureTrove[i];
		GlobalItemFn[x.item_id] = { func = onTeasureTroveFunc, params = x };
	end	
    
    for i = 1,table.getn(zRuneEssence) do
		local x = zRuneEssence[i];
		GlobalItemFn[x.item_id] = { func = onRuneEssenceFunc, params = x };
	end	
end
--金币大礼包，经验大礼包
function zInitDayAward(sysarg)
    for i = 1,table.getn(DayAwardItem) do
        local x = DayAwardItem[i];
        GlobalItemFn[x.item_id] = { func = onDayAwardItemFunc, params = x };
    end

    for i = 1,table.getn(RandomBoxItem) do
        local x = RandomBoxItem[i]
        GlobalItemFn[x.item_id] = {func = onRandomBoxFunc,params=x}
    end
end

function onZBuffItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    --print("使用道具")
    if Actor.removeItemByPtr(sysarg,itemPtr, itemUserNum, true, nItemName, 5) >= itemUserNum then
        Actor.addBuffById(sysarg,ItemTable.buffid)
    end
end

function onNewZodiacItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local nIndex = tonumber(ItemTable.index)
    local nCount = tonumber(ItemTable.count)
    --初始化生肖信息
    if Actor.removeItemByPtr(sysarg,itemPtr, itemUserNum, true, nItemName, 5) >= itemUserNum then
        InitNewZodiacInfo(sysarg);
        local svar =Actor.getStaticVar(sysarg)
        if svar.newzodiac[nIndex] == nil or svar.newzodiac[nIndex].level == nil then 
            svar.newzodiac[nIndex] = {} 
            svar.newzodiac[nIndex].level = -1
            svar.newzodiac[nIndex].exp = 0
        end
        svar.newzodiac[nIndex].exp = svar.newzodiac[nIndex].exp + itemUserNum * nCount
     
        Actor.sendTipmsg(sysarg,NewZodiacCfg.BasicAttr[nIndex].name.."经验增加:"..(itemUserNum * nCount),ttFlyTip)
        SendNewZodiacInfo(sysarg)
    end


end
-- 卷轴类接口
function onJuanZhouAdd(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)

	local var = Actor.getStaticVar(sysarg);
    if ItemTable.dayuseitem ~= nil then  
        local bFish = false
  
       
        if var.useDayItem == nil  then
            var.useDayItem = {}
            var.useDayItem.count = 0
            var.useDayItem.item = {}
        end
         if var.useDayItem.count == nil then
             var.useDayItem.count = 0
             var.useDayItem.item = {}
         end
        if var.useDayItem.count > 0 then
             for i = 1,var.useDayItem.count do
                
                if var.useDayItem.item[i].id == ItemTable.item_id then
                    if var.useDayItem.item[i].count >= ItemTable.dayuseitem then
                        Actor.sendTipmsg(sysarg,"今日使用次数已超出"..ItemTable.dayuseitem.."次,请明日再使用!",ttFlyTip)
                        return
                    else
                        bFish = true
                        var.useDayItem.item[i].count = var.useDayItem.item[i].count + itemUserNum
                    end
                end
            end
        end
        if bFish == false then
            var.useDayItem.count = var.useDayItem.count + 1
            var.useDayItem.item[var.useDayItem.count] = {}
            var.useDayItem.item[var.useDayItem.count].id = ItemTable.item_id
            var.useDayItem.item[var.useDayItem.count].count = 1
        end
    end
	local d = var.d;
	ItemTable.item_id = tonumber(ItemTable.item_id);
	local myProperty;
	ItemTable.type = tonumber(ItemTable.type);
	
	local nOpenDays = System.getDaysSinceOpenServer()
	local nstr = "";

	--开区前四天经验丹每天只能用100次
	-- if ItemTable.type == 3 and ItemTable.staticId > 0 and nOpenDays <= 3 then
	-- 	if d[ItemTable.staticId] <= 0 then
	-- 		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00014,Item.getItemName(ItemTable.item_id)), ttFlyTip);
	-- 		return
	-- 	end
		
	-- 	if d[ItemTable.staticId] < itemUserNum then
	-- 		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00014,Item.getItemName(ItemTable.item_id),d[ItemTable.staticId]),ttFlyTip);
	-- 		return
	-- 	end
	-- end
    local nOldCount = 0
    local nNewCount = 0
	local nItemName = Item.getItemName(ItemTable.item_id)
	if ItemTable.type then
		if Actor.removeItemByPtr(sysarg,itemPtr, itemUserNum, true, nItemName, 5) >= itemUserNum then
		--if Actor.removeItem(sysarg,itemidx,itemUserNum) >= itemUserNum then
			if ItemTable.type == 1 then
				myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_CRYSTAL);
                nOldCount = myProperty
				Actor.changeCrystal(sysarg,ItemTable.value*itemUserNum);
				myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_CRYSTAL);
                nNewCount = myProperty
				nstr = string.format(Lang.ScriptTips.Qf00008,ItemTable.str,ItemTable.value*itemUserNum,myProperty);
			elseif ItemTable.type == 2 then
				myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY);
                nOldCount = myProperty
				Actor.changeEnergy(sysarg,ItemTable.value*itemUserNum);
				myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY);
                nNewCount = myProperty
				nstr = string.format(Lang.ScriptTips.Qf00008,ItemTable.str,ItemTable.value*itemUserNum,myProperty);
			elseif ItemTable.type == 3 then
				myProperty = ItemTable.value*itemUserNum;
				-- if ItemTable.staticId > 0 then
				-- 	--if nOpenDays <= 3 then
				-- 		--d[ItemTable.staticId] = d[ItemTable.staticId] - itemUserNum
				-- 		nstr = string.format(Lang.ScriptTips.Qf00007,ItemTable.str,ItemTable.value*itemUserNum,myProperty,d[ItemTable.staticId])
				-- 		--else
				-- 		--nstr = string.format("<(c0xFF00ff00)%s>增加<(c0xFF00aaff)%s>",ItemTable.str,myProperty)
				nstr = string.format("<(c0xFF00ff00)%s>增加<(c0xFF00aaff)%s>",ItemTable.str,myProperty)
				-- 	--end
				-- else
				-- 	nstr = string.format("",ItemTable.str,myProperty)	
				-- end
				
				Actor.addExp(sysarg,myProperty)
			elseif ItemTable.type == 4 then
			--	print("使用次数 "..d[ItemTable.dparam]);
            	myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_ACIEVEPOINT);
                nOldCount = myProperty
            
				myProperty = Actor.addAchievePoint(sysarg, ItemTable.value*itemUserNum)		
                nNewCount = myProperty		
				nstr = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*itemUserNum, myProperty);
            elseif ItemTable.type == 5 then
                local var = Actor.getStaticVar(sysarg)
                if var.godSoulValue == nil then var.godSoulValue = 0 end
                nOldCount = var.godSoulValue
				System.sendCommonLog(LogIds.shenhunzhibianhua,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,var.godSoulValue,var.godSoulValue + ItemTable.value*itemUserNum,'','','','','','','',"使用神魂")
                var.godSoulValue = var.godSoulValue + ItemTable.value*itemUserNum
                nNewCount =  var.godSoulValue	
                nstr = string.format("%s增加%d", ItemTable.str, ItemTable.value*itemUserNum);
               
                local netPack = DataPack.allocPacket(sysarg, 139, 240)
                DataPack.writeInt(netPack,var.godSoulValue) 
                DataPack.flush(netPack)
			elseif ItemTable.type == 8 then --内功经验
				local addExp = Actor.addInnerExp(sysarg, ItemTable.value*itemUserNum)
				myProperty = Actor.getUIntProperty(sysarg, PROP_ACTOR_INNER_EXP);
				nstr = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, addExp, myProperty);
				local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
				System.sendCommonLog(LogIds.shiyongneigongjingyanquan,nActorId,Actor.getName(sysarg),0,myProperty-addExp,myProperty,"使用内功经验券")
			elseif ItemTable.type == 9 then --斗笠值
				local var = Actor.getStaticVar(sysarg)
				if var.MianJinZhi ==nil then  var.MianJinZhi =0 end
				var.MianJinZhi=var.MianJinZhi+ItemTable.value*itemUserNum
				SendMianJuInfo(sysarg)
				nstr = string.format("<(c0xFFb90303)获得><(c0xFF0090ff)%d%s>",ItemTable.value*itemUserNum, ItemTable.str);
				
				local nstr2 = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*itemUserNum, var.MianJinZhi);
				Actor.sendTipmsg(sysarg, nstr2, ttFlyTip)
			elseif ItemTable.type ==10 then --血练精华
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%d%s>", ItemTable.value*itemUserNum, "血练精华"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
				
				local nowValue =Actor.getXueLianValue(sysarg)
				Actor.setXueLianValue(sysarg,nowValue+ItemTable.value*itemUserNum)
				
				System.sendCommonLog(LogIds.xuelianValue,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),itemUserNum,nowValue , Actor.getXueLianValue(sysarg), "","","使用血练丹","","")
				
				local netPack = DataPack.allocPacket(sysarg, 73, 2) -- 下发当前血练精华
				DataPack.writeInt(netPack, Actor.getXueLianValue(sysarg))
				DataPack.writeByte(netPack, 1)		
				DataPack.writeByte(netPack, Actor.getXueLianData(sysarg,0))	
				DataPack.flush(netPack)	
			elseif ItemTable.type ==11 then --仙力
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%d%s>", ItemTable.value*itemUserNum, "仙力"), 1);
				local nowValue =Actor.getThorEquipValue(sysarg)
				Actor.setThorEquipValue(sysarg,nowValue+ItemTable.value*itemUserNum)

				System.sendCommonLog(LogIds.ThorEquipValueChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getThorEquipValue(sysarg) -ItemTable.value*itemUserNum , Actor.getThorEquipValue(sysarg), "","","使用仙力丹"..itemUserNum,"","")
			elseif ItemTable.type ==12 then --心法值
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%d%s>", ItemTable.value*itemUserNum, "心法值"), 1);
				local nowValue =Actor.getXinFaValue(sysarg)
				Actor.setXinFaValue(sysarg,nowValue+ItemTable.value*itemUserNum)

				System.sendCommonLog(LogIds.xinfaValueChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getXinFaValue(sysarg) -ItemTable.value*itemUserNum , Actor.getXinFaValue(sysarg), "","","使用心法丹","","")
			elseif ItemTable.type ==13 then --戒灵值
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%d%s>", ItemTable.value*itemUserNum, "戒灵粉尘"), 1);
				local nowValue =Actor.getRingGodValue(sysarg)				
				Actor.setRingGodValue(sysarg,nowValue+ItemTable.value*itemUserNum)

				SendRingGodInfo(sysarg)
				System.sendCommonLog(LogIds.UseRingGodAddValueItem,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getRingGodValue(sysarg) -ItemTable.value*itemUserNum , Actor.getRingGodValue(sysarg), "","","使用戒灵粉尘","","")
			elseif ItemTable.type == 14 then --仙钻
                local var = Actor.getStaticVar(sysarg)
                if var.xianzuan == nil then var.xianzuan = 0 end
                var.xianzuan = var.xianzuan + ItemTable.value*itemUserNum
                Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%d%s>", ItemTable.value*itemUserNum, "仙钻"), 1+ ttFlyTip);
                System.sendCommonLog(LogIds.xianzuan,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,var.xianzuan -ItemTable.value*itemUserNum , var.xianzuan, "","","使用仙钻","","")
			    send_actor_data_on_login(sysarg)
            end

			local showType;
			if ItemTable.type == 4 or ItemTable.type == 5 then
				showType = ttFlyTip;
			elseif ItemTable.type == 9 then 
				showType = 1
			else
				showType = 128;
			end
			
			if ItemTable.type ~=10  and  ItemTable.type ~=11 and  ItemTable.type ~=12 and  ItemTable.type ~=13 and ItemTable.type ~= 14 then 
				Actor.sendTipmsg(sysarg, nstr, showType);
			end
		end
	else
		if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) == itemUserNum then
			ItemTable.pr = tonumber(ItemTable.pr);
			ItemTable.value = tonumber(ItemTable.value);
			
			local val = Actor.getUIntProperty(sysarg, ItemTable.pr)
            nOldCount = val
			val = val + ItemTable.value*itemUserNum
            nNewCount = val
			Actor.setUIntProperty(sysarg, ItemTable.pr, val)
			
			local nstr = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*itemUserNum, val);
			--Actor.sendTipmsg(sysarg,nstr,1);
			Actor.sendTipmsg(sysarg, nstr, ttFlyTip);
			---更新佣兵经验
			if ItemTable.pr == 133 then 
				Hero.UpdateHeroValue(sysarg);
			end

            if ItemTable.pr == 125 then --宝石
                HandleAddNewRankCount(sysarg,6,ItemTable.value*itemUserNum)
            elseif ItemTable.pr == 127 then --圣珠
                HandleAddNewRankCount(sysarg,7,ItemTable.value*itemUserNum)
            elseif ItemTable.pr == 131 then --特戒
                HandleAddNewRankCount(sysarg,9,ItemTable.value*itemUserNum)
            end
		end
	end
	if ItemTable.logid ~= nil then
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local szActorName = Actor.getName(sysarg)
		System.sendCommonLog(ItemTable.logid,nActorId,szActorName,nNewCount - nOldCount,nOldCount,nNewCount,"","","count:"..tostring(itemUserNum).."id:"..tostring(ItemTable.item_id))

    end
	return true;
end


-- 成就函数接口调用
function onAchievementFunc(sysarg, itemidx, itemPtr, ItemTable, delType, itemUserNum)
	local myProperty;
	local var = Actor.getStaticVar(sysarg);
	local chjTimes = var.days.chjTimes;
	if var.days.chjTimes == nil then
		chjTimes = 0;
	end

	ItemTable.item_id = tonumber(ItemTable.item_id);
	ItemTable.type = tonumber(ItemTable.type);
	ItemTable.maxUseTimes = tonumber(ItemTable.maxUseTimes);
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	-- 使用的次数-1为无限次
	if ItemTable.maxUseTimes ~= -1 then
		if chjTimes + itemUserNum > ItemTable.maxUseTimes then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00013, nItemName, ItemTable.maxUseTimes - chjTimes), ttFlyTip);
			return false;
		end
	end

	-- 扣除物品
	if Actor.removeItemByPtr(sysarg, itemPtr, itemUserNum, true, nItemName, 5) >= itemUserNum then
		if ItemTable.maxUseTimes ~= -1 then
			var.days.chjTimes = chjTimes + itemUserNum;
		end
		local nOldCount = Actor.getIntProperty(sysarg,PROP_ACTOR_ACIEVEPOINT)

		myProperty = Actor.addAchievePoint(sysarg, ItemTable.value*itemUserNum)
		
		if ItemTable.maxUseTimes ~= -1 then
			nstr = string.format(Lang.ScriptTips.Qf00007, ItemTable.str, ItemTable.value*itemUserNum, myProperty, tostring(ItemTable.maxUseTimes - var.days.chjTimes));
		else
			nstr = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*itemUserNum, myProperty);
		end
		Actor.sendTipmsg(sysarg, nstr, ttFlyTip);
        if ItemTable.logid ~= nil then
            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            local szActorName = Actor.getName(sysarg)
		    System.sendCommonLog(ItemTable.logid,nActorId,szActorName,0,nOldCount,myProperty)

        end
	end
	return true;
end


-- 成就函数接口初始化
function zInitItemAchievementFunc()
	for i = 1,table.getn(zAchievement) do
		local x = zAchievement[i];
		GlobalItemFn[x.item_id] = { func = onAchievementFunc, params = x };
	end	
end


function onBigGiftBagAdd(sysarg,itemidx,itemPtr,ItemTable,delType)	
	
	if not BigGiftBagConfig then return false end
	local bigGiftconfig = BigGiftBagConfig[ItemTable.type]
	if not bigGiftconfig then return false end
		
	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	
	local netPack = DataPack.allocPacket(sysarg,139,101)      
	if netPack then
		DataPack.writeByte( netPack, ItemTable.type)
		DataPack.writeString(netPack, bigGiftconfig.name)
		DataPack.writeString(netPack, bigGiftconfig.tips)
		local reward
		if ItemTable.type == 1 then 
			reward = bigGiftconfig.reward[nSex+1]
		else
			reward = bigGiftconfig.reward
		end
		if not reward or #reward <= 0 then return true end
		DataPack.writeByte(netPack,#reward)
		for key ,value in ipairs(reward) do
			DataPack.writeByte( netPack, value.type)
			DataPack.writeInt(netPack, value.id)     
			DataPack.writeInt(netPack, value.count)
			DataPack.writeByte(netPack, value.strong)
			DataPack.writeByte(netPack, value.bind)
		end
	end
	DataPack.flush(netPack)
	
	return true
end

function zGnItemForxy(sysarg)
	for i = 1,table.getn(zGnItem100) do
		local x = zGnItem100[i];
		GlobalItemFn[x.item_id] = { func = onZhaoCaiFu, params = x };
--		if zGnItem100[i].types == 2 then
--			local x = zGnItem100[i];
--			GlobalItemFn[x.item_id] = { func = onChongWuTiShengJuan, params = x };
--		end
	end
end


-- 等级仙丹接口
function onUpgradeElixir(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	local nDeifyLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_APOTHEOSIZE_LEVEL);
	local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local MaxLevel = System.getPlayerMaxLevel(nCircle)
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then

		if myLevel >= ItemTable.level then
			Actor.addExp(sysarg,ItemTable.value,0,0)
			Actor.sendTipmsg(sysarg,string.format("恭喜您成功使用等级提升丹,增加了%s经验",ItemTable.value),ttFlyTip);
		else
			Actor.setLevel(sysarg,myLevel+ItemTable.n)
			Actor.sendTipmsg(sysarg,string.format("恭喜您成功使用等级提升丹,提升了%s级",ItemTable.n), ttFlyTip);
		end

		
		-- 等级增加并提示
		--Actor.setLevel(sysarg, myLevel+ItemTable.n)
		--myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
		--local str = string.format(Lang.ScriptTips.Qf00010, ItemTable.str, ItemTable.n, myLevel);
		--Actor.sendTipmsg(sysarg, str, ttFlyTip);
		--local actorName = Actor.getName(sysarg);
		--System.broadcastTipmsg(string.format(Lang.ScriptTips.Qf00012, actorName, ItemTable.str, ItemTable.n), ttScreenCenter + ttChatWindow);
	end
end

function onNewSkill(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
			
	local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if myLevel < ItemTable.level then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00016, ItemTable.level), ttFlyTip);
		return true;
	end

	local SkillLv = Actor.getSkillProperty(sysarg,ItemTable.value,1);
--print(SkillLv)
	if SkillLv ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00017, ttFlyTip);
		return true;
	end

	local JOB = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
		
	if JOB ~= ItemTable.type then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00018, ttFlyTip);
		return true;
	end

	Actor.startLearnSkill(sysarg,ItemTable.value,1);

	local PersonName = Actor.getName(sysarg);
	System.broadcastTipmsg(string.format(Lang.ScriptTips.Qf00019,PersonName,Item.getItemLinkMsg(ItemTable.item_id),Item.getItemName(ItemTable.item_id)), ttChatWindow);	
	Item.removeItem(sysarg,itemPtr,itemUserNum)
	return true;
end

-- boss积分接口
function onBOSSintegral(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,itemUserNum)

	local ItemZz = Item.getItemLinkMsg(ItemTable.item_id);
	ItemTable.value = tonumber(ItemTable.value);

	if Actor.removeItem(sysarg,ItemIdx, itemUserNum, 0, 0, -1, "使用BOSS积分", 102) >= itemUserNum then	
		if ItemTable.dparam then
			local addvalue = ItemTable.value * itemUserNum;
			--print(Lang.ScriptTips.Qf00008, addvalue, get_d_val(sysarg, ItemTable.dparam))
			add_d_val(sysarg, ItemTable.dparam, addvalue);
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00021, addvalue, get_d_val(sysarg, ItemTable.dparam) ), 1);
		end
	end

	return true;
end

-- 转生物品接口
function onCircleExp(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	local var = Actor.getStaticVar(sysarg);
	
	--[[ 去掉转生物品使用次数计算
	local d = var.d;
	local leftTimes = d[185]
	if leftTimes == nil then leftTimes = 10 end -- 每天初始化为10次
	
	if leftTimes <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.b003, ttFlyTip)
		return false
	end
	
	if ItemUserNum > leftTimes then ItemUserNum = leftTimes end
	--]]
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		local NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
		Actor.setIntProperty(sysarg,PROP_ACTOR_CIRCLE_SOUL,NowExp+ItemTable.value*ItemUserNum);
		NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
		--d[185] = d[185] - ItemUserNum
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.b005, ItemTable.str, ItemTable.value*ItemUserNum, NowExp), ttFlyTip)
		
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.sendCommonLog(LogIds.shiyongzhuanshengxiuweidan,nActorId,Actor.getName(sysarg),0,NowExp-(ItemTable.value*ItemUserNum),NowExp,"使用转生修为丹")
		return true
	else
		print("Delete Item error actor name is "..Actor.getName(sysarg));
	end

end

function onAddItemToPlayer(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	local nItemName = Item.getItemName(ItemTable.item_id)
	
	
	--检测背包空间 awards:奖励表
	CheckBagGridCount = function (sysarg, awards)
		if not awards then return false, 1000000 end
		local needCount = 0
		local vocation = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
		for k,v in pairs(awards) do
			if v.type == 0 then
				local quality = v.quality or 0
				local strong = v.strong or 0
				local bind = v.bind or 0
				local param = v.param or nil
				local guid = 0
				local job = v.job or 0
				if job == 0 or job == vocation then
					if v.type == 0 and type(param) ~= 'number' and param ~= nil then
						v.id = Item.getItemProperty(sysarg, param, Item.ipItemID, 0)  --获得物品的ID 
					end
					local count = math.floor(v.cout)
					needCount = needCount + Item.getAddItemNeedGridCount(sysarg, v.id, count, quality, strong, bind, guid)
				end
			end
		end
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		if hasCount < needCount then 
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, needCount), ttFlyTip)
			return false, needCount
		end
		return true, needCount
	end
	
	if not CheckBagGridCount(sysarg, ItemTable.additem) then
		return false
	end

	--上面内容是增加背包空间检查
	
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		local str = "";
		for i = 1,#ItemTable.additem do
			if ItemTable.additem[i].type  == 15 and ItemTable.IsTestItem then
				Actor.giveAward(sysarg,ItemTable.additem[i].type,ItemTable.additem[i].id,ItemTable.additem[i].cout*ItemUserNum,0,0,ItemTable.additem[i].bind,0,138,"",-1,0,-1,0,0);
			else
				Actor.giveAward(sysarg,ItemTable.additem[i].type,ItemTable.additem[i].id,ItemTable.additem[i].cout*ItemUserNum,0,0,ItemTable.additem[i].bind,0,0,"",-1,0,-1,0,0);
			end

			if ItemTable.additem[i].type == 0 then
				str = str..Item.getItemName(ItemTable.additem[i].id).."*"..ItemTable.additem[i].cout*ItemUserNum..".";
			else
				if  ItemTable.additem[i].type  == 15 then
					str = str.."元宝"..ItemTable.additem[i].cout*ItemUserNum..",";
				elseif  ItemTable.additem[i].type  == 5 then
					str = str.."绑金"..ItemTable.additem[i].cout*ItemUserNum..",";
				elseif  ItemTable.additem[i].type  == 71 then
					str = str.."注魂值"..ItemTable.additem[i].cout*ItemUserNum..",";

					System.sendCommonLog(LogIds.useZhuHunDan,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getSoulValue(sysarg)-ItemTable.additem[i].cout*ItemUserNum,Actor.getSoulValue(sysarg),'','','','','','','',"使用注魂丹")
				end
			end
		end
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00020, str), ttFlyTip);
		return true
	end
	
	return false
end

-- 护符碎片接口
function onFuSoulAdd(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	local var = Actor.getStaticVar(sysarg);
	--[[
	local d = var.d;
	if ItemTable.staticId > 0 then
		if d[ItemTable.staticId] <= 0 then
			Actor.sendTipmsg(sysarg,string.format("您今天使用%s的次数已为0",Item.getItemName(ItemTable.item_id)),ttFlyTip);
			return false
		end
		if d[ItemTable.staticId] < ItemUserNum then
			Actor.sendTipmsg(sysarg,string.format("您今天使用%s的次数剩余%d次,当前使用数量已超出",Item.getItemName(ItemTable.item_id),d[ItemTable.staticId]),ttFlyTip);
			return false
		end
	end
	--]]
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		local jadeNum = Actor.getUIntProperty(sysarg, ItemTable.pr)
        local nOldNum = jadeNum
		jadeNum = jadeNum + ItemTable.value*ItemUserNum
		Actor.setUIntProperty(sysarg, ItemTable.pr, jadeNum)

        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local szActorName = Actor.getName(sysarg)
		System.sendCommonLog(LogIds.hufusuipian,nActorId,szActorName,nOldNum,jadeNum)
		local nstr = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, ItemTable.value*ItemUserNum, jadeNum);
		Actor.sendTipmsg(sysarg, nstr, ttFlyTip);
	end

	return true
end

function onTempAttrAdd(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	
	local nPetPtr = CheckTempAddAttr(sysarg,ItemTable.value)
	if not nPetPtr then return false end
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		TempAddAttr(sysarg,ItemTable.value,nPetPtr)
	end
	
	return true
end

function onAlchemyAdd(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)		
	local nItemName = Item.getItemName(ItemTable.item_id)
	local deleteCount = Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true, nItemName,5)
	if deleteCount <= 0 then
		return false
	end
	
	local addVal = ItemTable.value*deleteCount
	local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
    local nOldCount = val
	val = val + addVal
    local nNewCount = val
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, val)

	local nstr = string.format(Lang.ScriptTips.Qf00008, nItemName, addVal, val);
	Actor.sendTipmsg(sysarg, nstr, ttFlyTip);
    if ItemTable.logid ~= nil then
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local szActorName = Actor.getName(sysarg)
		System.sendCommonLog(ItemTable.logid,nActorId,szActorName,0,nOldCount,nNewCount)
    end
	return true
end

function onBossAdd(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	
	 local nSceneId = Actor.getSceneId(sysarg)
	-- if nSceneId ~= 62 then
	-- 	Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00021, ttFlyTip);
	-- 	return false
	-- end

    local KingCity = 10
	if nSceneId ~= KingCity and 6127 ~=ItemIdx then
        Actor.sendTipmsg(sysarg, "该道具只允许在热血王城使用!", ttFlyTip);
        return false
	elseif 6127 ==ItemIdx and nSceneId~=413 then 
        Actor.sendTipmsg(sysarg, "该道具只允许在军魂之地使用!", ttFlyTip);
        return false
    end
	local x,y = Actor.getEntityPosition(sysarg,0,0)

	
	if ItemTable.mapScope then
		local mmm = ItemTable.mapScope;
		local xmax = mmm.x + mmm.s;
		local xmin = mmm.x - mmm.s;
		local ymax = mmm.y + mmm.s;
		local ymin = mmm.y - mmm.s;
		if x > xmax or x < xmin or y > ymax or y < ymin then
			--Actor.sendTipmsg(sysarg, string.format( "x:%s,y:%s,mmm.x:%s,mmm.y:%s,mmm.s:%s", x,y,mmm.x, mmm.y, mmm.s ), ttFlyTip);
			if 6127 ~=ItemIdx then 
				Actor.sendTipmsg(sysarg, string.format( "该道具只允许在热血王城的坐标<%s>,<%s>的<%s>格范围内使用.", mmm.x, mmm.y, mmm.s ), ttFlyTip);
			else 
				Actor.sendTipmsg(sysarg, string.format( "该道具只允许在军魂之地的坐标<%s>,<%s>的<%s>格范围内使用.", mmm.x, mmm.y, mmm.s ), ttFlyTip);
			end 
			return false
		end
	end
	
	-----------------------------------召唤boss的次数限制------------------------------------------------
	local itemIds ={5125,5126,5127}
	local bossIds = 
	{
	737,
	738,
	739,
	740,
	741,
	742,
	743,
	744,
	745,
	}
	
	local monsterCount = 0
	for i=1,#itemIds do 
		if ItemTable.item_id==itemIds[i] then 
			for j=1,#bossIds do 
				local listMonster = LuaHelp.getSceneMonsterListById(Actor.getScenePtr(sysarg),bossIds[j])
				if listMonster then 
					for i,v in ipairs(listMonster) do 
						if v then 
							monsterCount = monsterCount+1
						end
					end
				end
			end 
		end
	end
	if monsterCount>=5 then 
		Actor.sendTipmsg(sysarg, "最多召唤5只，请击杀后再召唤", ttFlyTip);
		return 
	end
	------------------------------------------召唤boss的次数限制------------------------------------------------

	local nItemName = Item.getItemName(ItemTable.item_id)
    local nNumRate = 0
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		local nRate = System.getRandomNumber(10000)+1
		
		for _,boss in ipairs(ItemTable.boss) do
          
            nNumRate = nNumRate + boss.rate
			if nRate <= nNumRate then
				local nHandle = Actor.getSceneHandle(sysarg)
--                local nSceneWidth = Fuben.getSceenWidth(nHandle)
--                local nSceneHeight = Fuben.getSceenWidth(nHandle)
--                local x = 0
--                local y = 0
--                local bEnter= false
--                for i = 1,100 do
--                    x = math.random(1,nSceneWidth)
--                    y = math.random(1,nSceneHeight)
--                    if Fuben.onCanMove(nHandle,x,y) then
--                        bEnter = true
--                        break
--                    end
--                end
--                if bEnter == false then
--                    x = 130
--                    y = 136
--                end
				local pMonster = Fuben.createMonster(nHandle,boss.bossId,x,y,0)
                if pMonster == nil then
                    Actor.sendTipmsg(sysarg, "召唤失败了！", ttFlyTip);
                else
                    sMonsterName = boss.name
                    Actor.setIntProperty(pMonster,PROP_ENTITY_ICON,11111)
                   
					local str = ""
					if 6127 ~=ItemIdx then 
						str="<(n%s)>在热血王城使用了<%s>,顺利召唤出了<%s>.(我也去凑凑热闹<(x热血王城:133:145:[传])>)"
						str =  string.format(str,Actor.getName(sysarg),nItemName,sMonsterName)
						System.broadcastTipmsg(str,ttChatWindow)
					end
                end
				break
			--else
                
			end
		end
	end
	
	return true
end

function onCombinedSbkAward(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	
	if Item.getBagEmptyGridCount(sysarg) < ItemTable.AwardCount then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00021, ItemTable.AwardCount), ttFlyTip);
		return false
	end
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		for i = 1, ItemTable.AwardCount do
			local nItemId = math.random(unpack(ItemTable.Range))
			Actor.addItem(sysarg,nItemId,0,0,1,0,0,"合区王城礼包",1023)
		end
	end
	
	return true
end

--[[
function onBetaMediaAward(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	
	local nOpenTime = System.getServerOpenTime()
	local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(nOpenTime)
	if nYear < 2015 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00023, ttFlyTip);
		return false
	elseif nMonth == 1 and nDay < 15 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00023,ttFlyTip);
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.BetaMediaFlag then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00024, ttFlyTip);
		return false
	end

	if not Awards.CheckBagGridCount(sysarg,ItemTable.award) then
		return false
	end
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		Awards.Give(sysarg,ItemTable.award,1027,"公测媒体礼包")
		var.BetaMediaFlag = 1
	end
	
	return true
end
--]]

function onGiveHeadTitle(sysarg,ItemIdx,ItemPtr,ItemTable,DelType,ItemUserNum)
	
	local var = Actor.getStaticVar(sysarg)
	if var.JobHeadTitle then
		return false
	end
	
	local nItemName = Item.getItemName(ItemTable.item_id)
	if Actor.removeItemByPtr(sysarg,ItemPtr,ItemUserNum,true,nItemName,5) == ItemUserNum then
		if Actor.setTopTitle(sysarg,ItemTable.HeadTitleId,true) then
			var.JobHeadTitle = ItemTable.HeadTitleId
		end
	end
	
	return true
end

function onUseHonorTokenItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
			
	ItemTable.item_id = tonumber(ItemTable.item_id);
	local var = Actor.getStaticVar(sysarg);
	
	-- 每天只能使用一次
	if var.days.HonorUC ~= nil and var.days.HonorUC >= 1 then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.Qf00025,Item.getItemName(ItemTable.item_id)),ttFlyTip);
		return false
	end
	
	if itemUserNum > 1 then itemUserNum = 1 end	
	
	local nItemName = Item.getItemName(ItemTable.item_id)		
	if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,nItemName,5) == itemUserNum then
		ItemTable.value = tonumber(ItemTable.value)
		
		local honorValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
		honorValue = honorValue + ItemTable.value*itemUserNum
		Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, honorValue)				
		
		local nstr = string.format(Lang.ScriptTips.Qf00026,ItemTable.value*itemUserNum,honorValue);
		Actor.sendTipmsg(sysarg,nstr,ttScreenCenterBigNotice)
		
		if var.days.HonorUC == nil then
			var.days.HonorUC = 1
		else
			var.days.HonorUC = var.days.HonorUC + 1
		end	
	end	
	
	return true;
end

function onUseGuildGiftItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)	
	if 0 == Actor.getGuildId(sysarg) then -- 没加入行会
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.Qf00027, ttFlyTip)
		return false
	end
	
	local item_id = tonumber(ItemTable.item_id)
	local itemName = Item.getItemName(item_id)
	
	-- 每次只能使用一个	
	if not Awards.CheckBagGridCount(sysarg,ItemTable.award) then
		return false
	end

	if Actor.removeItemByPtr(sysarg,itemPtr,1,true,itemName,5) ~= 1 then
		return false
	end
	
	Awards.Give(sysarg,ItemTable.award,GameLog.cOpenGuildGift,"行会礼包")
	
	return true
end

-- 返回参数1：是否可以使用，参数2：是否显示销毁按钮
function useYuanbaoGiftTimeCheck(sysarg)
	local cfgTime = YuanbaoGiftUseTable.newServerTime	
	local newServerBeginTime = System.encodeNumTime(cfgTime[1], cfgTime[2], cfgTime[3], 0,0,0)
	local openTime = System.getServerOpenTime()
	
	-- 新服必需在7天之内才可以用，旧服则没有时间限制
	-- 有个小问题：新服时不用，等合区到旧服时，又可以用了，策划说这个无所谓，这个功能只是提高开服7天的活跃度而已
	-- 旧服什么时候都可以销毁，新服7天内不能销毁
	if openTime < newServerBeginTime then
		return true, true -- 旧服，可以使用，可以销毁
	end
	
	-- 新服
	if System.getDaysSinceOpenServer() > 7 then
		--Actor.sendTipmsg(sysarg, "该物品只能开服7天内有效", ttFlyTip)		
		return false, true -- 新服 7天后不能使用，可以销毁
	end
	
	return true, false -- 新服 7天内可以使用，不能销毁
end

-- 0 : 取消；1：使用；2：删除
function onUseYuanbaoGiftItemCB(sysarg, btn, index)
	btn = tonumber(btn)
	index = tonumber(index)
	
	if btn == 0 then return end -- 取消	
	
	local cfg = YuanbaoGiftUseTable.gifts[index]	
	if cfg == nil then return end
	
	local canUse, canDelete = useYuanbaoGiftTimeCheck(sysarg)	
	
	if btn == 2 then -- 玩家选择销毁物品
		if not canDelete then return end
		
		Actor.removeItem(sysarg,cfg.item_id,1,-1,-1,-1,itemName,GameLog.cActorDeleteItem)
		return
	end	
	
	if not canUse then return end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < cfg.needYb then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf063, ttFlyTip)
		return
	end	
	
	if not Awards.CheckBagGridCount(sysarg,cfg.award) then
		return
	end
	
	if Actor.removeItem(sysarg,cfg.item_id,1,-1,-1,-1,itemName,5) ~= 1 then
		return -- 没有该物品
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -cfg.needYb, GameLog.cUseYbGiftAward, tostring(cfg.item_id)) == false then
		print("error onUseYuanbaoGiftItemCB changeMoney actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..cfg.item_id)
		return
	end	
	
	if Awards.Give(sysarg,cfg.award,GameLog.cUseYbGiftAward,tostring(cfg.item_id)) == false then
		print("error onUseYuanbaoGiftItemCB Awards.Give actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..cfg.item_id)
		return
	end
	
	local msg = string.format(Lang.ScriptTips.Qf00028, Actor.getName(sysarg), cfg.needYb, Item.getItemName(cfg.item_id))
	
	for i, v in ipairs(cfg.award) do
		if v.type == 0 and v.id ~= 0 then -- 只提示物品吧，其他不好提示
			msg = msg .. "<(c0xFF00FF00)"..Item.getItemName(v.id)..">".."*"..v.count.." "
		end
	end
	
	System.broadcastTipmsg(msg, ttScreenCenterBigNotice)
end

function onUseYuanbaoGiftItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)	
	local index = tonumber(ItemTable._index_)
	local item_id = tonumber(ItemTable.item_id)	
	local itemName = Item.getItemName(item_id)

	local canUse, canDelete = useYuanbaoGiftTimeCheck(sysarg)
	if not canUse then
		if canDelete then
			local str = string.format("该物品只能在开服7天内有效\\您真的要销毁<(c0xFF00FF00)%s>吗?", itemName)
			local btn1 = "销毁/onUseYuanbaoGiftItemCB,2,"..index
			local btn2 = "以后再说/onUseYuanbaoGiftItemCB,0,"..index
			Actor.messageBox(sysarg,0,0,str, btn1, btn2, NULL, 0)
		end
		
		return
	end
		
	-- 这里就不要判断元宝了，要不然元宝不够时没法显示销毁按钮
	--local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	--if myYb < ItemTable.needYb then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf063, ttFlyTip)
	--	return false
	--end	
	
	local str = string.format("打开<(c0xFF00FF00)%s>需要<(c0xFF00FF00)元宝>*<(c0xFF00FF00)%d>,要帮您打开吗?", itemName, ItemTable.needYb)
	local btn1 = "打开/onUseYuanbaoGiftItemCB,1,"..index
	
	if canDelete then
		local btn2 = "销毁/onUseYuanbaoGiftItemCB,2,"..index
		local btn3 = "以后再说/onUseYuanbaoGiftItemCB,0,"..index
		Actor.messageBox(sysarg,0,0,str, btn1, btn2, btn3, 0)
	else
		local btn2 = "以后再说/onUseYuanbaoGiftItemCB,0,"..index
		Actor.messageBox(sysarg,0,0,str, btn1, btn2, NULL, 0)
	end
		
	return false -- 在回调中删除
end

function onUseLingliItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)	
	
	local addLingli = ItemTable.lingli * itemUserNum
	local lingli = Actor.getUIntProperty(sysarg,PROP_ACTOR_LINGLI_VALUE)
	lingli = lingli + addLingli
	
	if lingli > 4294967295 then
		Actor.sendTipmsg(sysarg,"灵力已达最大值",ttFlyTip);
		return false
	end

	local itemName = Item.getItemName(item_id)
	if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,5) ~= itemUserNum then
		return false
	end
	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE, lingli)
		
	local nstr = string.format("增加灵力%d", addLingli)
	Actor.sendTipmsg(sysarg,nstr,ttFlyTip)
		
	return true
end

function onUseSwingStoneBox(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)
		
	local needYb = ItemTable.needYb * itemUserNum
	
	if needYb > 0 then
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < needYb then
			-- 一个都不够
			if myYb < ItemTable.needYb then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf063, ttFlyTip)
				return
			else
				itemUserNum = math.floor(myYb / ItemTable.needYb)
				needYb = ItemTable.needYb * itemUserNum
			end
		end	
	end
	
	local itemName = Item.getItemName(item_id)
	
	local str
	if itemUserNum == 1 then
		str = string.format("是否使用<(c0xFF00FF00)%d元宝>开启<(c0xFF00FF00)%s>,开启后将获得珍贵道具以及大量经验", needYb, itemName)
	else
		str = string.format("是否使用<(c0xFF00FF00)%d元宝>开启<(c0xFF00FF00)%d个%s>,开启后将获得珍贵道具以及大量经验", needYb, itemUserNum, itemName)
	end
	
	local btn1 = "开启/onUseSwingStoneBoxCB,1,"..itemUserNum	
	local btn2 = "以后再说/onUseSwingStoneBoxCB,0,0"
	Actor.messageBox(sysarg,0,0,str, btn1, btn2, NULL, 0)
			
	return false -- 在回调中删除
end

-- 0 : 取消；1：使用
function onUseSwingStoneBoxCB(sysarg, btn, itemNum)
	btn = tonumber(btn)
	
	if btn == 0 then return end -- 取消	
	
	itemNum = tonumber(itemNum)
	if itemNum <= 0 then return end
	
	if Awards.CheckBagNeedGridCount(sysarg, itemNum) ~= true then return end
	
	local item_id = SwingStoneBoxUseTable.item_id
	if Actor.getItemCount(sysarg, item_id) < itemNum then return end
	
	local needYb = SwingStoneBoxUseTable.needYb * itemNum
	if needYb > 0 then
		if Actor.changeMoney(sysarg, mtYuanbao, -needYb, GameLog.cOpenSwingStoneBox, "") == false then
			return -- 元宝不足
		end
	end	
	
	local itemName = Item.getItemName(item_id)
	if Actor.removeItem(sysarg,item_id,itemNum,-1,-1,-1,itemName,GameLog.cOpenSwingStoneBox) < itemNum then
		return
	end
		
	-- 额外给经验
	local randExp = SwingStoneBoxUseTable.expRand[2] - SwingStoneBoxUseTable.expRand[1]
		
	for i = 1, itemNum do	
		-- 抽中一个物品
		local award_item_id = 687
		local rnd = System.getRandomNumber(100)
		for i,v in ipairs(SwingStoneBoxUseTable.itemList) do
			if rnd >= v.rand[1] and rnd <= v.rand[2] then
				award_item_id = v.itemId -- 抽中该字帖
				break
			end
		end
		
		local award = { {type=0, id=award_item_id, count=1, bind=1} }
		Awards.Give(sysarg,award,GameLog.cOpenSwingStoneBox,"开启魂石宝箱")
		
		local addExp = SwingStoneBoxUseTable.expRand[1]
		if randExp > 0 then
			addExp = addExp + System.getRandomNumber(randExp)
		end
		Actor.addExp(sysarg,addExp * 10000,GameLog.cOpenSwingStoneBox,0)
		
		itemName = Item.getItemName(award_item_id)
		local nstr = string.format(Lang.ScriptTips.Qf00031,itemName,addExp);
		Actor.sendTipmsg(sysarg,nstr,ttScreenCenterBigNotice)
	end
	
end

function onUseSwingStone(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)
	
	local ret = Actor.injectSwingStone(sysarg, item_id)
	return ret
end

function onUseDEggItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)
	local itemName = Item.getItemName(item_id)
	
	for i = 1, itemUserNum do
		if Awards.CheckBagNeedGridCount(sysarg, 1) ~= true then return false end
		
		if Actor.removeItem(sysarg,item_id,1,-1,-1,-1,itemName,LogIds.DEggUseItem) < 1 then
			return false
		end		

		local _itemid = ItemTable.award.item_ids[1] + System.getRandomNumber(ItemTable.award.item_ids[2]-ItemTable.award.item_ids[1] + 1)
		local award = {	{type=0, id=_itemid, count=1, bind=0}, } -- 装备不绑定
		
		Awards.Give(sysarg,award,LogIds.DEggUseItem,"使用"..itemName)
		
		local addExp = ItemTable.award.exp[1] + System.getRandomNumber(ItemTable.award.exp[2]-ItemTable.award.exp[1] + 1)
		Actor.addExp(sysarg,addExp * 10000,LogIds.DEggUseItem,0)
		
		local addBindCoin = ItemTable.award.bindCoin[1] + System.getRandomNumber(ItemTable.award.bindCoin[2]-ItemTable.award.bindCoin[1] + 1)
		Actor.changeMoney(sysarg, mtBindCoin, addBindCoin * 10000, LogIds.DEggUseItem, "使用"..itemName)		
		
		local nstr = string.format(Lang.ScriptTips.Qf00032,Item.getItemName(_itemid),addExp,addBindCoin)
		Actor.sendTipmsg(sysarg,nstr,ttScreenCenterBigNotice)
	end
		
	return true
end

--十二生肖道具
function  onZodiacItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
    local item_id = ItemTable.item_id;
    local bit = ItemTable.bit
    
    local zodiac = Actor.getIntProperty(sysarg,PROP_ACTOR_ZODIAC_VALUE)
    if System.getIntBit(zodiac,bit) ~= 0 then
        Actor.sendTipmsg(sysarg,"已经拥有，无法再次穿戴!",ttFlyTip)
        return false
    end
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple) ~= itemUserNum then
		return false
	end
    zodiac = System.setIntBit(zodiac,bit,1)

    Actor.setIntProperty(sysarg,PROP_ACTOR_ZODIAC_VALUE,zodiac)
    --重新计算属性
    Actor.collectOperate(sysarg,0)
    Actor.sendTipmsg(sysarg,"穿戴成功!",ttFlyTip)
    return true
end


function onTeHuiLiBaoAdd(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = ItemTable.item_id;
	local delgold = ItemTable.delgold;
	local value = ItemTable.value;
	local str = ItemTable.str;
	local additemid = ItemTable.additemid;
    local addMoney = ItemTable.addMoney
	local giveid = ItemTable.giveid;
	local var = ItemTable.var;
	local itemName = Item.getItemName(item_id);
	local val;
	local BBCount = Item.getBagEmptyGridCount(sysarg);

		if Actor.getMoneyCount(sysarg,3) < delgold then
			Actor.sendTipmsg(sysarg, string.format("您的元宝不足<%s>,无法开启此宝箱,请充值元宝后再打开吧.",delgold), 256);
			return true;
		end

		if value == 0 then
			local NeedBBCount = 0;
			for i = 1,#additemid do
				NeedBBCount = NeedBBCount + Item.getAddItemNeedGridCount(sysarg,additemid[i].giveid,additemid[i].num,0,0,1);
			end
			if NeedBBCount + 1 > BBCount then
				Actor.sendTipmsg(sysarg, string.format("您的包裹空格不足<%s>,清理包裹后再来打开此宝箱吧.",NeedBBCount+1), 256);
				return true;
			end
			Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple);
			Actor.changeMoney(sysarg,3,-delgold,7,itemName);
			for i = 1,#additemid do
				local gid = additemid[i].giveid;
				local gnm = additemid[i].num;
				local gbd = additemid[i].bind;
				Actor.addItem(sysarg,gid,0,0,gnm,gbd,0,"onTeHuiLiBaoAdd");
			end
			if addMoney ~= nil then
				for i =1,#addMoney do
					Actor.changeMoney(sysarg,addMoney[i].type,addMoney[i].count,LogIds.baoxiang,"onTeHuiLiBaoAdd")
				end
			end
          
            if ItemTable.count ~= nil then
			    local brocastr = string.format("<(n%s)>玩家开启了%s,获得%d个%s",Actor.getName(sysarg),Item.getItemLinkMsg(item_id),ItemTable.count,str)
                System.broadcastTipmsg(brocastr,ttChatWindow)
            end

			--关联特惠礼包
			GuanLianPreferentialGood(sysarg,item_id)
			return true;
		end

		if giveid then
			
			local NeedBBCount = Item.getAddItemNeedGridCount(sysarg,giveid,value,0,0,1);
			if NeedBBCount+1 > BBCount then
				Actor.sendTipmsg(sysarg, string.format("您的包裹空格不足<%s>,清理包裹后再来打开此宝箱吧.",NeedBBCount+1), 256);
				return true;
			end
			Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple);
			Actor.changeMoney(sysarg,3,-delgold,7,itemName);
			Actor.addItem(sysarg,giveid,0,0,value,1,0,"onTeHuiLiBaoAdd");
		end
		
		if var then
			--print("Hero.getHeroCount(sysarg):"..Hero.getHeroCount(sysarg))
			if var == 475691 and Hero.getHeroCount(sysarg) <1 then 
				Actor.sendTipmsg(sysarg, "请先激活战将，再使用此宝箱", 256)
				return true
			end
			Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple);
			Actor.changeMoney(sysarg,3,-delgold,7,itemName);
            local nNewCount = 0
            local nOldCount = 0
			if var == 475691 then
				--战将灵力值 
				local nCurrMana = Hero.getHeroMana(sysarg);
                nOldCount = nCurrMana
				nCurrMana = nCurrMana + value;
                nNewCount = nCurrMana
				if nCurrMana > 4294967295 then
					nCurrMana = 4294967295;
				end
				Hero.setHeroMana(sysarg, nCurrMana);
				val = Hero.getHeroMana(sysarg);
			else
				val = Actor.getUIntProperty(sysarg, var);
                nOldCount = val
				val = val + value;
				Actor.setUIntProperty(sysarg, var, val);
                nNewCount = val
                
			end
            local nActorId = Actor.getUIntProperty(sysarg,PROP_ENTITY_ID)
            if ItemTable.logid ~= nil then
               
                local szActorName = Actor.getName(sysarg)
		        System.sendCommonLog(ItemTable.logid,nActorId,szActorName,nNewCount - nOldCount,nOldCount,nNewCount)

            end
            System.sendCommonLog(LogIds.ItemVarConsume,Actor.getName(sysarg),0,value,val,"","",itemName)
			--if val ==nil then 
			--	print("val ==nil")
			--end
			--if value ==nil then 
			--	print("value ==nil")
			--end
			Actor.sendTipmsg(sysarg, string.format("<%s>增加<%s>,当前总数:<%s>",str,value,val), 256)
		end
		if additemid and additemid ~= 0 then
			Actor.addItem(sysarg,additemid,0,0,1,1,0,"HuiLiBaoAdd2");
		end
		if addMoney ~= nil then 
			for i =1,#addMoney do
					Actor.changeMoney(sysarg,addMoney[i].type,addMoney[i].count,LogIds.baoxiang,"onTeHuiLiBaoAdd")
			end
		end
	
		--关联特惠礼包
		GuanLianPreferentialGood(sysarg,item_id)
		return true;
end

--关联特惠礼包
function GuanLianPreferentialGood(sysarg,item_id)
	item_id = tonumber(item_id)
	local guanLianId = {{605 ,606, 607, 608, },{617, 618 ,619 ,620},{4735, 4736 ,4737 ,4738, 4739 },}
	local types = 0 --第几种奖励
	local Index = 0 --奖励到第几级
	for i=1,#guanLianId do 
		for j=1,#guanLianId[i] do
			if item_id ==guanLianId[i][j] then 
				types =i
				Index =j 
				break
			end
		end
	end
	
	--具体type转换看这里 data\config\misc\PreferentialGoods.lua
	local typesIndex = 0
	if not (types ==0 and Index == 0 )then 
		if types == 1 then --羽毛的类型是7
			typesIndex = 7
		elseif types == 2 then  --特戒的类型是10
			typesIndex = 10
		elseif types == 3 then  --金币的类型是9
			typesIndex = 9
		end
	local svar = Actor.getStaticVar(sysarg)
	svar.PreferentialGoods[typesIndex] = Index
	SendUpdatePacksInfo(sysarg)
	end
end

--特殊类药品
--ID:79	高级太阳水,新区第1天恢复1000,第2天2000,第3天之后3000
function onSpecialDrugs(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	itemUserNum = 1;
	Actor.addTimer(sysarg, 36, 650);
	if get_d_val(sysarg,198) == 0 then
		Actor.sendTipmsg(sysarg, "<请在物品冷却后使用>", 1)  
		return false;
	end

	if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,1) ~= itemUserNum then
		return true;
	end

	if ItemTable.type == 1 then
		local nDays = System.getDaysSinceOpenServer();	--开区天数
		--nDays = 2; --测试
		local add = 1000;
		for i = 1,table.getn(ItemTable.day) do
			if nDays >= i then
				add = ItemTable.day[i];
			end
		end
		local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP);
		local hp = Actor.getIntProperty(sysarg,PROP_CREATURE_HP);
		
		local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP);
		local mp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP);
		
		if hp < maxhp then
			local nexhp  = hp + add;
			if nexhp >= maxhp then
				--Actor.sendTipmsg(sysarg, string.format( "开区:<%s>天,HP+<%s>,<当前为满>.", nDays, add ), 128)  
				Actor.setIntProperty(sysarg,PROP_CREATURE_HP,maxhp);
			else
				--Actor.sendTipmsg(sysarg, string.format( "开区:<%s>天,HP+<%s>.", nDays, add ), 128)  
				Actor.setIntProperty(sysarg,PROP_CREATURE_HP,nexhp);
			end
		end

		if mp < maxmp then
			local nexmp  = mp + add;
			if nexmp >= maxmp then
				--Actor.sendTipmsg(sysarg, string.format( "开区:<%s>天,MP+<%s>,<当前为满>.", nDays, add ), 128)  
				Actor.setIntProperty(sysarg,PROP_CREATURE_MP,maxmp);
			else
				--Actor.sendTipmsg(sysarg, string.format( "开区:<%s>天,MP+<%s>.", nDays, add ), 128)  
				Actor.setIntProperty(sysarg,PROP_CREATURE_MP,nexmp);
			end
		end
		set_d_val(sysarg,198,0);

	end

    return false
end
function onTiyanCard(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
   
	local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local var = Actor.getStaticVar(sysarg)
	
	if myLevel>= 82 then 
		Actor.sendTipmsg(sysarg, string.format("您已经超过81级别，无法使用体验卡"), ttFlyTip) 
		return 
	end
	
	if var.TiyanCard == nil then 
		var.TiyanCard =1 
		Actor.sendTipmsg(sysarg, string.format("使用体验卡成功"), ttFlyTip) 
		Actor.removeItemByPtr(sysarg,itemPtr,1,true)
		
		local netPack = DataPack.allocPacket(sysarg,139,230)
        DataPack.writeByte(netPack,1)--已经开启了体验卡
        DataPack.flush(netPack)
		System.broadcastTipmsg(string.format("<(n%s)>玩家使用了随身回收体验卡,可在82级以内随时随地打开VIP特享的在线回收. VIP2永久使用.<[成为VIP2]/@@showWin,14>",Actor.getName(sysarg)),ttChatWindow);
		
		
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		System.AddMail(myID,0,0,"获得VIP回收体验","亲爱的玩家，\\\\恭喜您获得vip随身回收体验卡，您可在82级之前随时随地打开VIP特享在线回收。\\\\祝您游戏愉快！")
		return true
	else 
		Actor.removeItemByPtr(sysarg,itemPtr,1,true)
		return false
	end
end


function onTresureBox(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local bagIdxs = Item.getBagEmptyGridCount( sysarg )
    if bagIdxs < 4 then
         Actor.sendTipmsg(sysarg, "背包格子少于4个开启失败，请清理后再次开启！", ttFlyTip)  
        return
    end
   
    if OnTresureBoxInit(sysarg) then
        if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple) ~= itemUserNum then
            return true;
	    end
    else
       Actor.sendTipmsg(sysarg, string.format("使用珍宝箱失败"), ttFlyTip)  
    end
    return false
end
function onMagicNuclear(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	Actor.closeNPCDialog(sysarg)
	local item_id = ItemTable.item_id;
	local type = ItemTable.type;
	local itemName = Item.getItemName(item_id);
	local max = 0;
	if ItemTable.max then
		max = ItemTable.max;
	end

		local netPack = DataPack.allocPacket(sysarg, 0, 11)
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt64(netPack, 0)-- 更新数据的类型
		if type == 1 then
			DataPack.writeString(netPack,onAllAddMoHeEx(sysarg,item_id,itemName,max))
		elseif type == 2 then
			DataPack.writeString(netPack,onAddMoHeSZEx(sysarg,item_id,itemName,max))
		end
		DataPack.flush(netPack)
end

--符文袋
function onFuWenBox(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)

	local AwardTable =
	{
	{3551,3552,3553,3554,3555,3556,3557,3558},--一转符文id
	{3559,3560,3561,3562,3563,3564,3565,3566},--二转符文id
	{3567,3568,3569,3570,3571,3572,3573,3574},--三转符文id
	{3575,3576,3577,3578,3579,3580,3581,3582},--四转符文id
	{3583,3584,3585,3586,3587,3588,3589,3590},--五转符文id
	{3591,3592,3593,3594,3595,3596,3597,3598},--六转符文id
	{3599,3600,3601,3602,3603,3604,3605,3606},--七转符文id
	{3607,3608,3609,3610,3611,3612,3613,3614},--九转符文id
	{3615,3616,3617,3618,3619,3620,3621,3622},--十一转符文id
	{5323,5338,5343,5348,5353,5358},--1级宝石袋
	{5324,5339,5344,5349,5354,5359},--2级宝石袋
	{5325,5340,5345,5350,5355,5360},--3级宝石袋
	{1783,1784,1785,1786,1787},--银杏战将装备箱
	{1788,1789,1790,1791,1792},--比奇战将装备箱
	{1793,1794,1795,1796,1797},--毒蛇战将装备箱
	{1798,1799,1800,1801,1802},--沃玛战将装备箱
	{1803,1804,1805,1806,1807},--祖玛战将装备箱
	{5326,5341,5346,5351,5356,5361},--4级宝石袋
	{5327,5342,5347,5352,5357,5362},--5级宝石袋
	

	}
	local item_id = ItemTable.item_id
	local index = ItemTable.index
    local logid = 0
    local logstr = itemName
    if ItemTable.logid ~= nil then logid = ItemTable.logid end
    if ItemTable.str ~= nil then logstr = logstr..ItemTable.logstr end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs<1 then 
		Actor.sendTipmsg(sysarg,"背包不足以容纳物品",ttFlyTip)
		return false
	end
	if Actor.removeItemByPtr(sysarg,itemPtr,1,true,logstr,logid) ~= 1 then
		return false
	else
		local addnum = math.random(#AwardTable[index]);
		
		local pUserItem = Item.createItem(AwardTable[index][addnum],1,0,0,1);
		local nHeroDamageRate = Item.getItemProperty(sysarg,pUserItem,Item.ipheroDamageRateEx)
		Item.SetItemRuneAttr(sysarg,pUserItem,-1,0,0)
		Item.addItem(sysarg,pUserItem);
        if nHeroDamageRate > 0 then
            -- 战将装备固定最高全属性倍率，其他共用字段的道具保留原有规则。
            local nItemType = Item.getItemProperty(sysarg,pUserItem,Item.ipItemType,0)
            local nRate = nHeroDamageRate
            if nItemType < 201 or nItemType > 205 then
                nRate = System.getRandomNumber(nHeroDamageRate) + 1
            end
            Item.setItemProperty(sysarg,pUserItem,Item.ipHeroDamageRate,nRate)
        end
		--Actor.addItem(sysarg,AwardTable[index][addnum],0,0,1,"FuwenBox");
	end
	
end

--集字礼包--随机给道具
function onJiZiLiBao(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local AwardTable =
	{
		{{507,1},{569,1},{536,1},{551,1},{537,1},{572,1},{488,1},{6403,1},{6217,1}},--低级集字礼包开出来的东西的id
		{{509,1},{536,1},{570,1},{573,1},{538,1},{489,1},{542,1},{552,1},{6403,5},{6218,1}},--中级集字礼包开出来的东西的id
		{{539,1},{574,1},{490,1},{553,1},{544,1},{536,10},{570,10},{6403,50},{6219,1}},--高级集字礼包开出来的东西的id

		{{509,1},{536,1},{570,1},{573,1},{538,1},{489,1},{542,1},{552,1}},--元旦礼包开出来的东西的id

		{{5657,1},{5658,1},{5659,1},{5660,1},{6223,1},{6224,1},{6225,1},{6226,1},{7157,1},{7158,1},{7159,1},{7160,1}},--幻羽礼盒
		{{5140,1},{5141,1},{5142,1},{5143,1},{5152,1},{5153,1},{5154,1},{5155,1}},--饰品箱
		{{6048,1},{6053,1},{6058,1},{6063,1},{6068,1},{6073,1},{6078,1},{6083,1},{6088,1},{6093,1},{6098,1},{6103,1}},--绿色生肖袋
		{{6104,1},{6099,1},{6094,1},{6089,1},{6084,1},{6079,1},{6074,1},{6069,1},{6064,1},{6059,1},{6054,1},{6049,1}},--蓝色生肖袋

		{{5947,1},{5948,1},{5949,1},{5950,1}},--时装礼盒
		{{6247,1},{6248,1},{6249,1},{6250,1},{7533,1},{7534,1},{7535,1},{7536,1}},--灵器礼盒
		{{6396,1},{6397,1},{6398,1},{6399,1},{6400,1},{6401,1}},--传世礼盒

		{{5657,1},{5658,1},{5659,1},{5660,1},{6223,1},{6224,1},{6225,1},{5947,1},{5948,1},{5949,1},{5950,1},{6247,1},{6248,1},{6249,1},{6250,1},{6226,1},{6396,1},{6397,1},{6398,1},{6399,1},{6400,1},{6401,1}},--女娲宝藏
		{{6691,10}},--时装碎片

		{{509,1},{536,1},{570,1},{573,1},{538,1},{489,1},{542,1},{552,1},{6403,5},{6217,1},{6817,5},{6862,5},{6271,5},{527,1},{485,1},{561,1}},--在线礼包

		{{5657,1},{5658,1},{5659,1},{5660,1},{6223,1},{6224,1},{6225,1},{5947,1},{5948,1},{5949,1},{5950,1},{6247,1},{6248,1},{6249,1},{6250,1},{6226,1},{6396,1},{6397,1},{6398,1},{6399,1},{6400,1},{6401,1},{6715,1},{7703,1},{6719,1},{6723,1},{6727,1}},--节日大奖
		
		{{5657,1},{5658,1},{5659,1},{5660,1},{6223,1},{6224,1},{6225,1},{6226,1},{5947,1},{5948,1},{5949,1},{5950,1},{6247,1},{6248,1},{6249,1},{6250,1},{7533,1},{7534,1},{7535,1},{7536,1},{7157,1},{7158,1},{7159,1},{7160,1}},--周年庆礼包①

		{{6396,1},{6397,1},{6398,1},{6399,1},{6400,1},{6401,1},{5963,1},{5964,1},{5965,1},{5966,1},{5967,1},{5968,1},{7204,1},{7205,1},{7206,1},{7207,1},{7208,1},{7209,1}},--周年庆礼包②

		{{6715,1},{6719,1},{6723,1},{6727,1},{7703,1},{6888,1},{6892,1},{6896,1},{6900,1},{6941,1},{7080,1},{7081,1},{7082,1},{7083,1},{7084,1},{7085,1}},--周年庆礼包③



		--{{5947,1,0},{5948,1,0},{5949,1,0},{5950,1,0}},--时装礼盒 --要是第3个参数写0，那就是不绑定的
	}
	local item_id = ItemTable.item_id
	local index = ItemTable.index
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs<1 then 
		Actor.sendTipmsg(sysarg,"背包不足以容纳物品",ttFlyTip)
		return false
	end
	if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"使用物品",logid) ~= 1 then
		return false
	else
		local addnum = math.random(#AwardTable[index]);
		if AwardTable[index][addnum][3]==nil or AwardTable[index][addnum][3]==1 then  --绑定的
			Actor.addItem(sysarg,AwardTable[index][addnum][1],0,0,AwardTable[index][addnum][2],1,0,ItemTable.logstr,LogIds.randomBox);
		else  --绑定的
			Actor.addItem(sysarg,AwardTable[index][addnum][1],0,0,AwardTable[index][addnum][2],0,0,ItemTable.logstr,LogIds.randomBox);
		end
		
		System.broadcastTipmsg(string.format("<(n%s)>玩家使用%s,获得%s" ,Actor.getName(sysarg), Item.getItemLinkMsg(ItemTable.item_id), Item.getItemLinkMsg(AwardTable[index][addnum][1])), ttChatWindow)
	end
end

--点击集字，获得经验
function onJiZiObject(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	if itemUserNum<= 0 then 	
		return 
	end
	local addExp = ItemTable.addExp * itemUserNum
	if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,"使用物品",LogIds.JiziAddExp) ~= itemUserNum then
		return false
	else
		Actor.addExp(sysarg,addExp,LogIds.JiziAddExp,0)	
	end
end

function onItemBoxFor2017(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = ItemTable.item_id;
	local type = ItemTable.type;
	local giveid = ItemTable.giveid;
	local itemName = Item.getItemName(item_id);
	itemUserNum = 1;
	local additemid = 0;
	local bind = 0;
	if ItemTable.bind then
		bind = ItemTable.bind;
	end
	local BBCount = Item.getBagEmptyGridCount(sysarg);
	if type == 99 then
		local nHour,nMinute,nSecond = System.getTime();

		if nHour == 21 then --散人宝藏箱
			if nMinute >= 5 and nMinute <= 15 then
				Actor.sendTipmsg(sysarg, "21点5分到21点15分时无法打开此宝箱,此时间段以外则可双击打开.", 256);
				return false;
			end
		end


		if 1 > BBCount then
			Actor.sendTipmsg(sysarg, string.format("您的包裹空格不足<%s>,清理包裹后再来打开此宝箱吧.",1), 256);
			return false;
		end
			if Actor.removeItemByPtr(sysarg,itemPtr,1,true,itemName,GameLog.clUserItem) ~= 1 then
				return false
			end
		local rtsc = "";


		-- local ardm = math.random(1,#giveid[1]);
		-- additemid = giveid[1][ardm];
		-- Actor.addItem(sysarg,additemid,0,0,1,bind,"ItemBoxFor2017");
		-- rtsc = rtsc .. Item.getItemLinkMsg(additemid) .. "<x1>";

		--for i = 2,#giveid do
			local i = 1;
			additemid = giveid[i].additemid;
			local addnum = math.random( giveid[i].num[1], giveid[i].num[2] );
			Actor.addItem(sysarg,additemid,0,0,addnum,bind,"ItemBoxFor2017");
			rtsc = rtsc .. "," .. Item.getItemLinkMsg(additemid) .. "<x" .. addnum .. ">";
		--end
		System.broadcastTipmsg(string.format("恭喜<(n%s)>开启了%s,获得了:%s.", Actor.getName(sysarg), Item.getItemLinkMsg(item_id), rtsc), ttChatWindow);
		return true;
	end






	if type == 1 then
		local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
		additemid = giveid[job][math.random(1,#giveid[job])];
	elseif type == 0 then
		additemid = giveid[math.random(1,#giveid)];
	end
		if giveid then
			
			--local NeedBBCount = Item.getAddItemNeedGridCount(sysarg,giveid,value,0,0,1);
			if 1 > BBCount then
				Actor.sendTipmsg(sysarg, string.format("您的包裹空格不足<%s>,清理包裹后再来打开此宝箱吧.",1), 256);
				return false;
			end
			if Actor.removeItemByPtr(sysarg,itemPtr,1,true,itemName) ~= 1 then
				return false
			end
			if item_id == 7827 or LocalDT.IsStackableActivationItem(additemid) then -- 激活道具保留配置属性，不附加随机装备属性
				Actor.addItem(sysarg, additemid, 0, 0, 1, bind, 0, "开启装备箱", 1);
			elseif additemid >= 6865 and additemid <= 6884 then -- 坐骑装备按固定召唤强度+6生成，避免随机属性影响堆叠
				Actor.addItem(sysarg, additemid, 0, 0, 1, bind, 0, "开启装备箱", 1, -1, 0, -1, 1, 6);
			else
				Actor.addItem(sysarg, additemid, 0, 0, 1, bind, 0, "开启装备箱" ,1,-1, 0, -1, 1, System.getRandomNumber(6)+1);
			end
			--Actor.addItem(sysarg,additemid,0,0,1,bind,"ItemBoxFor2017");
			
			if item_id == 373 or item_id == 374 then  --高阶，中阶宝箱
				if System.getDaysSinceOpenServer()>2 then  --开服大于3天
					return true
				end
			end
			System.broadcastTipmsg(string.format("<(n%s)>开启%s获得:%s.", Actor.getName(sysarg), Item.getItemLinkMsg(item_id), Item.getItemLinkMsg(additemid)), ttChatWindow);
		end
		return true;
end


function onUseYbConsumeRankingGift(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)
	local itemName = Item.getItemName(item_id)	
	
	if itemUserNum <= 0 then return end	
	itemUserNum = 1 -- 每次只能使用一个
	
	-- 每次只奖励一个物品
	if Awards.CheckBagNeedGridCount(sysarg, 1) ~= true then return end
	
	local awards
	local item_id2 = 0
	local rnd = System.getRandomNumber(10000)
	for i,v in ipairs(ItemTable.itemList) do
		if rnd >= v.rand[1] and rnd <= v.rand[2] then -- 抽中该物品
			awards = {}
			table.insert(awards, v.award)	
			item_id2 = v.award.id
			break
		end
	end
	
	if awards == nil then return end
	
	if Actor.removeItemByPtr(sysarg,itemPtr,1,true,itemName,LogIds.UseYbConsumeRankingGift) ~= 1 then
		return false
	end
		
	if Awards.Give(sysarg,awards,LogIds.UseYbConsumeRankingGift,tostring(item_id)) == false then
		print("error onUseYbConsumeRankingGift Awards.Give actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..item_id)
		return
	end
	
	local msg = string.format(Lang.ScriptTips.Qf00033,Actor.getName(sysarg),itemName,Item.getItemName(item_id2));
	System.broadcastTipmsg(msg, ttScreenCenterBigNotice)
	
end

function onUseSpringFirework(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable.item_id)	
	local itemName = Item.getItemName(item_id)
	
	local sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
	local itemList = PublicTestCfg.FireworkGift.itemList[sex + 1]
	if itemList == nil then return false end
	
	-- 做成批量使用玩家没感觉
	itemUserNum = 1

	local awardItemId = 0
	--for i = 1, itemUserNum do		
		if Awards.CheckBagNeedGridCount(sysarg, 1) ~= true then return false end
		
		-- 随机奖励一个物品	
		local award
		local rnd = System.getRandomNumber(10000)
		for i,v in ipairs(itemList) do
			if rnd >= v.rand[1] and rnd <= v.rand[2] then
				award = v.award -- 抽中该物品
				break
			end
		end
		
		if award == nil then award = itemList[1] end
		
		if Actor.removeItem(sysarg,item_id,1,-1,-1,-1,itemName,LogIds.OpenSpringFirework) < 1 then
			return false
		end				
		
		if not Awards.Give(sysarg, { award }, LogIds.OpenSpringFirework, "give awards") then
			print("error onUseSpringFirework Awards.Give actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",itemId="..award.id)
			return false
		end	
		
		awardItemId = award.id
	--end
	
	local msg
	if itemUserNum == 1 then
		msg = string.format(Lang.ScriptTips.Qf00033,Actor.getName(sysarg),itemName,Item.getItemName(awardItemId));
	else
		msg = string.format(Lang.ScriptTips.Qf00034,Actor.getName(sysarg),itemName)
	end
	
	System.broadcastTipmsg(msg, ttScreenCenterBigNotice)

	return true
end


function onUseWardrobeDress(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)		
	local item_id = tonumber(ItemTable[1])
	
	local slotId = 0
	for i, x in ipairs(wardrobe_cfg.dress_list[1]) do
		if x[1] == item_id then
			slotId = i
			break
		end
	end
	
	if slotId == 0 then
		for i, x in ipairs(wardrobe_cfg.dress_list[2]) do
			if x[1] == item_id then
				slotId = i
				break
			end
		end
	end
	
	if slotId == 0 then return end
	
	local itemName = Item.getItemName(item_id)	
	
	itemUserNum = Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.WardrobeDeleteDress)
	if itemUserNum <= 0 then return false end
	
	-- 衣橱(byte1-2:时装激活标志；byte3:穿戴的时装；byte4:衣橱等级)
	local wardrobe_data = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE)	
	if System.getIntBit(wardrobe_data, slotId - 1) == 0 then
		wardrobe_data = System.setIntBit(wardrobe_data, slotId - 1, true)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE, wardrobe_data)
	end
	
	local addExp = tonumber(ItemTable[2]) * itemUserNum
	if addExp <= 0 then return end
		
	local oldExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP)
	local newExp = oldExp + addExp
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARDROBE_EXP, newExp)
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorName = Actor.getName(sysarg)	
	System.sendCommonLog(LogIds.WardrobeAddExp, actorId, actorName, oldExp,newExp,dressId)
		
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00035, itemName, addExp), ttFlyTip)
end

-- 战将灵力丹
function onUseJSLingLiDan(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local item_id = tonumber(ItemTable.item_id)		
	local itemName = Item.getItemName(item_id)
	
	if ItemTable.value == 0 then return end

	--战将灵力值 
	local nCurrMana = Hero.getHeroMana(sysarg)

	--> 可使用物品数 = (UINT最大可存储值-当前值)/每个加的值  -by tzh  091916
	local nCanUse = math.floor( (4294967295 - nCurrMana) / ItemTable.value )
	if nCanUse < 1 then
		Actor.sendTipmsg(sysarg, "你的神将灵力值太大了", ttFlyTip)
		return
	elseif itemUserNum > nCanUse then
		itemUserNum = nCanUse
		print( string.format("error onUseJSLingLiDan: 已限制最多能使用 %d个= itemUserNum = nCanUse", itemUserNum) ) 
	end
	
	--删除道具物品 
	itemUserNum = Actor.removeItem(sysarg, item_id, itemUserNum)
	if itemUserNum == 0 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.Qf00036, itemName), ttFlyTip)
		return false
	end
	
	local addVal = ItemTable.value * itemUserNum	
    local nOldCount = nCurrMana
	nCurrMana = nCurrMana + addVal
    local nNewCount = nCurrMana
	if nCurrMana > 4294967295 then
		nCurrMana = 4294967295
	end
	Hero.setHeroMana(sysarg, nCurrMana)

	local str = string.format(Lang.ScriptTips.Qf00008, ItemTable.str, tostring(addVal), tostring(nCurrMana))
	Actor.sendTipmsg(sysarg, str, ttFlyTip)
    if ItemTable.logid ~= nil then
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local szActorName = Actor.getName(sysarg)
		System.sendCommonLog(ItemTable.logid,nActorId,szActorName,0,nOldCount,nNewCount)
    end
	return true
end

function onUseRandRateItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local nEmptrCount = Item.getBagEmptyGridCount(sysarg)
    if nEmptrCount < itemUserNum then
        itemUserNum = nEmptrCount
    end
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseCrazyApple) == itemUserNum then
        for i =1,itemUserNum do
            local nRand = System.getRandomNumber(10000)+1
            for j=1,table.getn(ItemTable.items) do
                if nRand < ItemTable.items[j].rate then
                    nRand = 0
                    Actor.addItem(sysarg,ItemTable.items[j].itemid,0,0,ItemTable.items[j].count,ItemTable.items[j].bind,0,"宝石袋")
                    break
                end
                nRand = nRand + ItemTable.items[j].rate
            end
            if nRand == 10000 then
                local j = table.getn(ItemTable.items)
                Actor.addItem(sysarg,ItemTable.items[j].itemid,0,0,ItemTable.items[j].count,ItemTable.items[j].bind,0,"宝石袋")
            end
        end
	end

end

--竞技证书
function OnRankCertificate(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local nIndex = ItemTable.index
    local var = Actor.getStaticVar(sysarg)
    if var.sportstitle == nil then
        var.sportstitle = {}
    end
    if  var.sportstitle[nIndex] ~= nil then
         Actor.sendTipmsg(sysarg,"您已经激活了该称号,无法再次激活！",ttFlyTip)
        return 
    end
    Actor.removeItem(sysarg,ItemTable.item_id,1)
    var.sportstitle[nIndex] = 0
    Actor.setTopTitle(sysarg,SportsTitleCfg[nIndex].TitleId,true)
    Actor.sendTipmsg(sysarg,"激活成功！",ttFlyTip)
    MiscExGetSportsTitleInfo(sysarg)
end
--技能书
function onUseSkillBook(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    local skill_lv = Actor.getSkillLevel(sysarg,ItemTable.id)
    local skill_name= System.getSkillNameById(ItemTable.id)
   if ItemTable.openday ~= nil and System.getDaysSinceOpenServer() < ItemTable.openday then
        Actor.sendTipmsg(sysarg,"开区第"..ItemTable.openday.."天后才可以学习该技能！",ttFlyTip)
        return
   end
   
   
    if skill_lv == 0 and ItemTable.lv == 1 then --学习一级的
       if Actor.learnSkill(sysarg,ItemTable.id,ItemTable.lv) ~= 0 then
		    Actor.sendTipmsg(sysarg,"学习技能"..skill_name.."失败!",ttFlyTip)
		    return
       else
            Actor.removeItem(sysarg,ItemTable.item_id,1)
            Actor.sendTipmsg(sysarg,"学习"..skill_name.."技能成功!",ttFlyTip)
            return
	   end
    else --升级的
		if ItemTable.highLevelSkill == 1 then --高级的
			if skill_lv<5 then --直接升级的
				if skill_lv == ItemTable.lv or ItemTable.lv < skill_lv then
					Actor.sendTipmsg(sysarg,"你已学会了该技能,无法再次学习!",ttFlyTip)
					return
				end
				if skill_lv + 1 ~= ItemTable.lv then
					Actor.sendTipmsg(sysarg,"学习此技能需要"..skill_name.."技能达到"..(ItemTable.lv - 1).."级",ttFlyTip)
					return
				end
				--Actor.delSkill(sysarg,ItemTable.id)
				Actor.learnSkill(sysarg,ItemTable.id,ItemTable.lv)
				Actor.removeItem(sysarg,ItemTable.item_id,1)
				Actor.sendTipmsg(sysarg,"学习"..skill_name.."技能等级"..ItemTable.lv.."成功!",ttFlyTip)
			else	--加经验的
				--下一级的熟练度
				local nextLevelExp = Actor.getSkillProperty(sysarg,ItemTable.id,3)
				if nextLevelExp==0 then 
					Actor.sendTipmsg(sysarg,"此技能已经是最高级了",ttFlyTip)
					return
				end
				--取得当前数量度
				local nowExp = Actor.getSkillProperty(sysarg,ItemTable.id,2)
				
				--加上熟练度，对比是否升级
				if nowExp+ItemTable.addShuLian >=nextLevelExp then 
					Actor.setSkillProperty(sysarg, ItemTable.id, 2, nextLevelExp)
					Actor.learnSkill(sysarg,ItemTable.id,skill_lv+1)
				else
					Actor.setSkillProperty(sysarg, ItemTable.id, 2, nowExp+ItemTable.addShuLian)
				end		
				
				Actor.removeItem(sysarg,ItemTable.item_id,1)
				Actor.sendTipmsg(sysarg,"技能熟练度增加"..ItemTable.addShuLian,ttFlyTip)
			end	
		else --低级的（无论怎样都能加熟练度的）
			--下一级的熟练度
			local nextLevelExp = Actor.getSkillProperty(sysarg,ItemTable.id,3)
			if nextLevelExp==0 then 
				Actor.sendTipmsg(sysarg,"此技能已经是最高级了",ttFlyTip)
				return
			end
			--取得当前数量度
			local nowExp = Actor.getSkillProperty(sysarg,ItemTable.id,2)
			
			--加上熟练度，对比是否升级
			if nowExp+ItemTable.addShuLian >=nextLevelExp then 
				Actor.setSkillProperty(sysarg, ItemTable.id, 2, nextLevelExp)
				Actor.learnSkill(sysarg,ItemTable.id,skill_lv+1)
			else
				Actor.setSkillProperty(sysarg, ItemTable.id, 2, nowExp+ItemTable.addShuLian)
			end	
			Actor.removeItem(sysarg,ItemTable.item_id,1)
			Actor.sendTipmsg(sysarg,"技能熟练度增加"..ItemTable.addShuLian,ttFlyTip)
		end
		
		
		
        
    end

end

--恶魔岭副本(炎龙守卫战副本)弓箭手令牌
function on_use_emoling_put_guarder(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local item_id = tonumber(ItemTable.item_id)
	
	local guarderIdx = 0
	for i, v in ipairs(fuben_emoling_cfg.guarder_tokens) do
		if item_id == v.token.itemid then
			guarderIdx = i
			break
		end
	end

	if guarderIdx == 0 then return false end
	
	return emoling_put_guarder(sysarg, guarderIdx)
end

--------------------------------------------------------------------------------------------------------------
-- 初始化卷轴类接口
function zGetJuanZhouAdd(sysarg)
	for i = 1,table.getn(zJuanZhouAdd) do
		local x = zJuanZhouAdd[i];
		GlobalItemFn[x.item_id] = { func = onJuanZhouAdd, params = x };
	end

    for i = 1,table.getn(zBuffItem) do
        local x = zBuffItem[i];
		GlobalItemFn[x.item_id] = { func = onZBuffItem, params = x };
    end
    --生肖碎片
    for i = 1,table.getn(zNewZodiacItem) do
		local x = zNewZodiacItem[i];
		GlobalItemFn[x.item_id] = { func = onNewZodiacItem, params = x };
	end
    
end

function zGetBigGiftBagAdd(sysarg)
	for i = 1,table.getn(BigGiftBag) do
		local x = BigGiftBag[i];
		GlobalItemFn[x.item_id] = { func = onBigGiftBagAdd, params = x };
	end
end

-- 初始化等级仙丹接口
function zUpgradeElixir(sysarg)
	for i = 1,table.getn(UpgradeElixir) do
		local x = UpgradeElixir[i];
		GlobalItemFn[x.item_id] = { func = onUpgradeElixir, params = x };
	end
end

function zaNewSkill(sysarg)
	for i = 1,table.getn(zNewSkill) do
		local x = zNewSkill[i];
		GlobalItemFn[x.item_id] = { func = onNewSkill, params = x };
	end
end

-- 初始化boss积分接品
function zBOSSintegral(sysarg)
	for i = 1,table.getn(BOSSintegral) do
		local x = BOSSintegral[i];
		GlobalItemFn[x.item_id] = { func = onBOSSintegral, params = x };
	end
end

-- 初始化转生物品接口
function zCircleExp(sysarg)
	for i = 1,table.getn(CircleExp) do
		local x = CircleExp[i];
		GlobalItemFn[x.item_id] = { func = onCircleExp, params = x };
	end
end

function zAddItemToPlayer(sysarg)
	for i = 1,table.getn(AddItemToPlayer) do
		local x = AddItemToPlayer[i];
		GlobalItemFn[x.item_id] = { func = onAddItemToPlayer, params = x };
	end
end

-- 初始化护符碎片接口
function zGetFuSoulAdd(sysarg)
	for i = 1,table.getn(FuSoulAdd) do
		local x = FuSoulAdd[i];
		GlobalItemFn[x.item_id] = { func = onFuSoulAdd, params = x };
	end
end

function zTempAttrAdd(sysarg)
	for i = 1,table.getn(TempAddAttrItem) do
		local x = TempAddAttrItem[i];
		GlobalItemFn[x.item_id] = { func = onTempAttrAdd, params = x };
	end
end

function zGetAlchemyAdd(sysarg)
	for i = 1,table.getn(Alchemy_Add) do
		local x = Alchemy_Add[i];
		GlobalItemFn[x.item_id] = { func = onAlchemyAdd, params = x };
	end
end

function zGetBossAdd(sysarg)
	for i = 1,table.getn(AddBossItem) do
		local x = AddBossItem[i];
		GlobalItemFn[x.item_id] = { func = onBossAdd, params = x };
	end
end

function zCombinedSbkAwardAdd(sysarg)
	for i = 1,table.getn(CombinedSbkAward) do
		local x = CombinedSbkAward[i];
		GlobalItemFn[x.item_id] = { func = onCombinedSbkAward, params = x };
	end
end

--[[
function zBetaMediaAdd(sysarg)
	for i = 1,table.getn(BetaMediaItem) do
		local x = BetaMediaItem[i];
		GlobalItemFn[x.item_id] = { func = onBetaMediaAward, params = x };
	end
end
--]]

function zHeadTitleAdd(sysarg)
	for i = 1,table.getn(JobHeadTitle) do
		local x = JobHeadTitle[i];
		GlobalItemFn[x.item_id] = { func = onGiveHeadTitle, params = x };
	end
end

function zInitYuanbaoGiftUseFunc(sysarg)
	for i, x in ipairs(YuanbaoGiftUseTable.gifts) do
		x._index_ = i
		GlobalItemFn[x.item_id] = { func = onUseYuanbaoGiftItem, params = x };
	end
end

-- 灵力丹
function zInitLingliItemUseFunc(sysarg)
	for i, x in ipairs(LingliItemUseTable) do
		GlobalItemFn[x.item_id] = { func = onUseLingliItem, params = x };
	end
end

-- 双蛋物品
function zInitDEggItemsUseFunc(sysarg)
	for i, x in ipairs(DEggItemsUseTable) do
		GlobalItemFn[x.item_id] = { func = onUseDEggItem, params = x };
	end
end

function onSuperStarTitle(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true) then
        local nTitleId = ItemTable.titleid
        local nTime = ItemTable.time * 86400 --1天等于86400秒
        local var = Actor.getStaticVar(sysarg)
        if var.superstartime ~= nil and System.getCurrMiniTime() >= var.superstartime then
            var.superstartime = nil
        end
        if var.superstartime == nil then var.superstartime = System.getCurrMiniTime() end
        var.superstartime = var.superstartime + nTime

        Actor.setTopTitle(sysarg,nTitleId,true)
    end


    
  

end

--给称号
function onGiveTitle(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local item_id = tonumber(ItemTable.item_id)
	local var = Actor.getStaticVar(sysarg)
	local titleName = "titles"..item_id
	if var.Give_Title_byItem ==nil then 
		var.Give_Title_byItem={}
	end

	var.Give_Title_byItem[titleName]=1 
	Actor.setTopTitle(sysarg,ItemTable.titleidId,true)
	Actor.removeItemByPtr(sysarg,itemPtr,1,true)
	
end

--杂物，每一样都特殊处理
function onMisTable(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local item_id = tonumber(ItemTable.item_id)
	
	local var = Actor.getStaticVar(sysarg)

	
	--给鸿运称号
	if (item_id==6012 or item_id==6356 or item_id==6357 or item_id==6358 or item_id==6361 or (ItemTable.isLinShi~=nil and ItemTable.isLinShi==1)) then 
		
		local titleId =0
		local Index =0
		if item_id==6012 then 
			titleId=44
			Index=1
		elseif item_id==6356 then 
			titleId=61
			Index=2
		elseif item_id==6357 then 
			titleId=62
			Index=3
		elseif item_id==6358 then 
			titleId=63
			Index=4
		elseif item_id==6361 then 
			titleId=67
			Index=5
		end
		
		
		if ItemTable.titleId~=nil then 	
			titleId = ItemTable.titleId
		end
		
		if ItemTable.index~=nil then 	
			Index = ItemTable.index
		end
		
		--print("titleId="..titleId)
		--print("Index="..Index)

		local nNowDt = System.getCurrMiniTime()
		
		if var.LinShiTitle==nil then 
			var.LinShiTitle={}
		end
		--记录过期时间
		if var.LinShiTitle[titleId]==nil or var.LinShiTitle[titleId]<=nNowDt then --如果为空，或者已经过期了
			var.LinShiTitle[titleId] = nNowDt + TitleHasTime[Index].liveTime
		else 
			var.LinShiTitle[titleId] = var.LinShiTitle[titleId] + TitleHasTime[Index].liveTime --剩下多少秒
		end
		Actor.setTopTitle(sysarg,titleId,true)
		Actor.removeItemByPtr(sysarg,itemPtr,1,true)
		Actor.addTimer(sysarg,52,5*1000) --5秒执行一次
		
		--告诉前端限时称号的剩余时间
		local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sSendLinShiTitleTime)
		DataPack.writeByte(netPack,titleId) --称号id
		DataPack.writeUint64(netPack,var.LinShiTitle[titleId]-nNowDt)
		DataPack.flush(netPack)
	
		return
	elseif (item_id==6021) then 
		local var = Actor.getStaticVar(sysarg)
		var.BYDH_Title=1 
		Actor.setTopTitle(sysarg,45,true)
		Actor.removeItemByPtr(sysarg,itemPtr,1,true)
	elseif (item_id==6278) then 
		local var = Actor.getStaticVar(sysarg)
		var.sVIP51_Title=1 
		Actor.setTopTitle(sysarg,58,true)
		Actor.removeItemByPtr(sysarg,itemPtr,1,true)
	--elseif item_id == 6649 then 
	--	var.spring_Titles=1 
	--	Actor.setTopTitle(sysarg,68,true)
	--	Actor.removeItemByPtr(sysarg,itemPtr,1,true)
	end
	
	local types = tonumber(ItemTable.types)
	if types== 1 then --使用花
		--有没有兄弟，没有兄弟就不能使用话
		local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	
		if myBrotherId~=0 then 
			if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,"使用鲜花",LogIds.shiyongxianhua)==itemUserNum then 
				if var.giveFlower ==nil then 
					var.giveFlower =0
				end
				var.giveFlower = var.giveFlower +(ItemTable.value/10)*itemUserNum
				
				local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX )
				if var.giveFlower>=1000 then 
					--男
					if nSex==0 then 
						Actor.setTopTitle(sysarg,56,true)
					else --女	
						Actor.setTopTitle(sysarg,57,true)
					end
				end
				
				System.sendCommonLog(LogIds.tishenjieyigongxiandu,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE),Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE)+(ItemTable.value)*itemUserNum,'','','','','','','',"送花")
				
				Actor.AwardtBrotherIntimacy(sysarg,(ItemTable.value)*itemUserNum)
				--提示
				Actor.sendTipmsg(sysarg,Actor.getName(sysarg).."玩家使用鲜花,亲密度提升"..(ItemTable.value)*itemUserNum,ttFlyTip)
				local pActor = System.getEntityPtrByActorID(myBrotherId)
				if pActor~=nil then 
					Actor.sendTipmsg(pActor,Actor.getName(sysarg).."玩家使用鲜花,亲密度提升"..(ItemTable.value)*itemUserNum,ttFlyTip)
				end
				
                if item_id == 6218 or item_id == 6219 then
                    local nSec = 5
                    if item_id == 6219 then nSec = 10 end
                    local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
					for k, plyPtr in ipairs(playerList or {}) do
						local netPack = DataPack.allocPacket(plyPtr,26,19)
                        DataPack.writeWord(netPack,1)
						DataPack.writeInt(netPack,nSec) --
                        DataPack.writeInt(netPack,0)
				        DataPack.writeInt(netPack,0)
						DataPack.flush(netPack)
					end
                
  
         
--				if (item_id==6218) then 
--					--播放全局特效
--					local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
--					for k, plyPtr in ipairs(playerList or {}) do
--						local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sBrotherInfo)
--						DataPack.writeByte(netPack,1) --结义信息，1为鲜花的特效
--						DataPack.flush(netPack)
--					end
--				elseif item_id==6219 then 
--					--播放全局特效
--					local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
--					for k, plyPtr in ipairs(playerList or {}) do
--						local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sBrotherInfo)
--						DataPack.writeByte(netPack,2) --结义信息，1为鲜花的特效
--						DataPack.flush(netPack)
--					end
					
				else 
					----兄弟播放特效
					--local pActor = System.getEntityPtrByActorID(myBrotherId)
					--if pActor~=nil then 
					--	--在线就播放特效，不在线就不播放
					--	local netPack = DataPack.allocPacket(pActor,151,LogicCmd.miscSysEx.sub.sBrotherInfo)
					--	DataPack.writeByte(netPack,1) --结义信息，1为鲜花的特效
					--	DataPack.flush(netPack)
					--end
					--
					----自己播特效
					--local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sBrotherInfo)
					--DataPack.writeByte(netPack,1) --结义信息，1为鲜花的特效
					--DataPack.flush(netPack)
				end
				if var.newdays.brotherTaskCon==nil then 
					var.newdays.brotherTaskCon={}
				end
				if var.newdays.brotherTaskCon[2]==nil then 
					var.newdays.brotherTaskCon[2]={}
				end
				
				local brotherName = Actor.getSocialActorName(sysarg,myBrotherId)
				
				if item_id==6217 then 
					var.newdays.brotherTaskCon[2][1]=1
				elseif item_id==6218 then 
					var.newdays.brotherTaskCon[2][2]=1
					if brotherName~=nil then 
						System.broadcastTipmsg(string.format("<(n%s)>赠送给<(n%s)>99朵鲜花*%s,烧黄纸斩鸡头,兄弟同心其利断金!挡者必诛之!",Actor.getName(sysarg),brotherName,itemUserNum),ttChatWindow+ttMousePosTip)
					end
				elseif item_id==6219 then 
					if brotherName~=nil then 
						System.broadcastTipmsg(string.format("<(n%s)>赠送给<(n%s)>999朵鲜花*%s,烧黄纸斩鸡头,兄弟同心其利断金!挡者必诛之!",Actor.getName(sysarg),brotherName,itemUserNum),ttChatWindow+ttMousePosTip)
					end
					var.newdays.brotherTaskCon[2][3]=1
				end
			end
		else	
			Actor.sendTipmsg(sysarg,"未结义不能使用鲜花",ttFlyTip)
		end
	end
	
	
	
	--使用内功丹
	if types== 2 then 
		if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"使用内功丹",0)==1 then 
			Actor.addBuffById(sysarg,ItemTable.buffId)
		end
	end
	
	--随机给物品
	if types==3 then 
		--随机
		local giveAward  = ItemTable.giveAward
		local hasGive = 0
		
		local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
		local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX) 
					
		for i=1,#giveAward do 
			local nRate = System.getRandomNumber(giveAward[i].rate)+1
			if nRate==1 then 
				--判断格子
				if not Awards.CheckBagGridCount(sysarg,giveAward[i].award) then
					return 
				end
				--扣除物品写日志
				if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"使用物品",0)==1 then 
					Awards.Give(sysarg,giveAward[i].award,LogIds.randomBoxByRate,ItemTable.txt)
									
					local awards= giveAward[i].award
					for j=1,#awards do 
						if (awards[j].sex==nil or awards[j].sex ==nSex)  and  (awards[j].job==nil or awards[j].job ==nJob) then 
							System.broadcastTipmsg(string.format("<(n%s)>玩家使用%s,获得%s" ,Actor.getName(sysarg), Item.getItemLinkMsg(ItemTable.item_id), Item.getItemLinkMsg(awards[j].id)), ttChatWindow)
							if 6653 ==item_id then 
								System.broadcastTipmsg(string.format("<(n%s)>玩家使用%s,获得%s" ,Actor.getName(sysarg), Item.getItemName(ItemTable.item_id), Item.getItemName(awards[j].id)), ttMousePosTip)
							end
						end
					end
					hasGive=i
					break
				end
			end
		end
		
		if hasGive==0 then 
			--判断格子
			if not Awards.CheckBagGridCount(sysarg,giveAward[1].award) then
				return 
			end
			--扣除物品写日志
			if Actor.removeItemByPtr(sysarg,itemPtr,1,true,"使用物品",0)==1 then 
				Awards.Give(sysarg,giveAward[1].award,LogIds.randomBoxByRate,ItemTable.txt)
				
				local awards= giveAward[1].award
				for j=1,#awards do 
					if (awards[j].sex==nil or awards[j].sex ==nSex)  and  (awards[j].job==nil or awards[j].job ==nJob) then 
						System.broadcastTipmsg(string.format("<(n%s)>玩家使用%s,获得%s" ,Actor.getName(sysarg), Item.getItemLinkMsg(ItemTable.item_id), Item.getItemLinkMsg(awards[j].id)), ttChatWindow)
						if 6653 ==item_id then 
							System.broadcastTipmsg(string.format("<(n%s)>玩家使用%s,获得%s" ,Actor.getName(sysarg), Item.getItemName(ItemTable.item_id), Item.getItemName(awards[j].id)), ttMousePosTip)
						end
					end
				end
					
				hasGive=1
			end
		end
		
		--爆竹
		if 6653 ==item_id then 
			--播放烟花特效
			local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
			for k, plyPtr in ipairs(playerList or {}) do
				if plyPtr then 
					local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sBroadDiffEffect)
               	    DataPack.writeByte(netPack,1)
					DataPack.flush(netPack)
				end 
			end
		end
		
		
		
	end
	

end

function onUseSpiritFighterEnergyItem(sysarg,itemidx,itemPtr,ItemTable,delType,itemUserNum)
	local item_id = ItemTable.item_id
	
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then
		Actor.sendTipmsg(sysarg, "需要激活战灵后才能使用!", ttFlyTip)
		return false
	end
       
    local itemName = Item.getItemName(item_id)
    if Actor.removeItemByPtr(sysarg,itemPtr,itemUserNum,true,itemName,LogIds.UseSFighterEnergyItem) ~= itemUserNum then
		return false
	end
    
    local addExp = ItemTable.addExp * itemUserNum
    local oldExp = Actor.getSpiritFighterEnergyExp(sysarg)
    local newExp = oldExp + addExp
    Actor.setSpiritFighterEnergyExp(sysarg, newExp)
    
    -- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 8)
	DataPack.writeUInt(netPack, newExp)
	DataPack.flush(netPack)

    Actor.sendTipmsg(sysarg, "使用物品成功，增加战灵潜能："..addExp, ttFlyTip)
    return true
end

function zInitItemUseFunc(sysarg)
	
	if Actor.isDealing(sysarg) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00073, ttFlyTip)
		return
	end

	GlobalItemFn[HonorTokenItem.item_id] = { func = onUseHonorTokenItem, params = HonorTokenItem };
	GlobalItemFn[GuildGiftUseTable.item_id] = { func = onUseGuildGiftItem, params = GuildGiftUseTable };	
	GlobalItemFn[PublicTestCfg.FireworkGift.item_id] = { func = onUseSpringFirework, params = PublicTestCfg.FireworkGift };

	-- 月度活动 元宝消耗排行榜排名奖励
	for i, x in ipairs(YbConsumeRankingUseTable) do
		GlobalItemFn[x.item_id] = { func = onUseYbConsumeRankingGift, params = x };
	end
	
 
	-- 衣橱模块
	for i, x in ipairs(wardrobe_cfg.dress_list) do
		for j, y in ipairs(x) do
			GlobalItemFn[y[1]] = { func = onUseWardrobeDress, params = y }
		end
	end
	
	-- 翅膀魂石宝箱
	GlobalItemFn[SwingStoneBoxUseTable.item_id] = { func = onUseSwingStoneBox, params = SwingStoneBoxUseTable }
	-- 翅膀魂石
	for i, x in ipairs(SwingStoneUseTable) do
		GlobalItemFn[x.item_id] = { func = onUseSwingStone, params = x }
	end
	
	-- 战将灵力丹
	for i, x in ipairs(JSLingLiDanUseTable) do
		GlobalItemFn[x.item_id] = { func = onUseJSLingLiDan, params = x }
	end
	
	--技能书
	for i,x in ipairs(SkillBookTable) do
		GlobalItemFn[x.item_id] = {func = onUseSkillBook,params = x}
	end

    --段位证书
    for i,x in ipairs(RankCertificate) do
        GlobalItemFn[x.item_id] = {func = OnRankCertificate,params = x}

    end
	for i,x in ipairs(RandRateItem) do
        GlobalItemFn[x.item_id] = {func = onUseRandRateItem,params = x}    
    end
	--恶魔岭副本(炎龙守卫战副本)弓箭手令牌
	for i,x in ipairs(EmolingGuarderTokenTable) do
		GlobalItemFn[x.item_id] = {func = on_use_emoling_put_guarder, params = x}
	end

	--特惠礼包宝箱+3+5+7+9
	for i,x in ipairs(TeHuiLiBaoAdd) do
		GlobalItemFn[x.item_id] = {func = onTeHuiLiBaoAdd, params = x}
	end

	--装备箱 zer 2017/1/9
	for i,x in ipairs(ItemBoxFor2017) do
		GlobalItemFn[x.item_id] = {func = onItemBoxFor2017, params = x}
	end

    --十二生肖
    for i,x in ipairs(ZodiacItem) do
        GlobalItemFn[x.item_id] = {func = onZodiacItem, params = x}
    end

    --魔核
    for i,x in ipairs(MagicNuclear) do
        GlobalItemFn[x.item_id] = {func = onMagicNuclear, params = x}
    end

    --珍宝箱
    for i,x in ipairs(TreasureBox) do
        GlobalItemFn[x.item_id] = {func=onTresureBox,params = x}
    end
	
	 --符文箱
    for i,x in ipairs(FuWenBox) do
        GlobalItemFn[x.item_id] = {func = onFuWenBox, params = x}
    end
	
	--集字礼包
    for i,x in ipairs(JiZiLiBao) do
        GlobalItemFn[x.item_id] = {func = onJiZiLiBao, params = x}
    end
	
	--使用集字，获得经验
    for i,x in ipairs(JiZiObject) do
        GlobalItemFn[x.item_id] = {func = onJiZiObject, params = x}
    end
	
	 --特殊类药品
    for i,x in ipairs(SpecialDrugs) do
        GlobalItemFn[x.item_id] = {func = onSpecialDrugs, params = x}
    end
	
	--在线回收体验卡
    for i,x in ipairs(TiyanCard) do
        GlobalItemFn[x.item_id] = {func = onTiyanCard, params = x}
    end
	
	--在线回收体验卡
    for i,x in ipairs(TiyanCard) do
        GlobalItemFn[x.item_id] = {func = onTiyanCard, params = x}
    end
	
	
	--杂物
    for i,x in ipairs(MisTable) do
        GlobalItemFn[x.item_id] = {func = onMisTable, params = x}
    end
	
	for i,x in ipairs(GiveTitle) do
        GlobalItemFn[x.item_id] = {func = onGiveTitle, params = x}
    end

    for i,x in ipairs(SuperStarTitle) do
        GlobalItemFn[x.item_id] = {func = onSuperStarTitle, params = x}
    end
    
    -- 战灵潜能物品
    for i,x in ipairs(SpiritFighterEnergyItemTable) do
        GlobalItemFn[x.item_id] = {func = onUseSpiritFighterEnergyItem, params = x}
    end
    
end

table.insert(InitFnTable,zGnItemForxy)
table.insert(InitFnTable,zGetWanMeiQiangHuaFu)
table.insert(InitFnTable,zGetJuanZhouAdd)
table.insert(InitFnTable,zGetBigGiftBagAdd)
table.insert(InitFnTable,zUpgradeElixir)
table.insert(InitFnTable,zaNewSkill)
table.insert(InitFnTable,zBOSSintegral)
table.insert(InitFnTable,zCircleExp)
table.insert(InitFnTable,zAddItemToPlayer)
table.insert(InitFnTable,zGetFuSoulAdd)
table.insert(InitFnTable,zTempAttrAdd)
table.insert(InitFnTable,zGetAlchemyAdd)
table.insert(InitFnTable,zGetBossAdd)
table.insert(InitFnTable,zCombinedSbkAwardAdd)
table.insert(InitFnTable,zBetaMediaAdd)
table.insert(InitFnTable,zHeadTitleAdd)
table.insert(InitFnTable,zInitYuanbaoGiftUseFunc)
table.insert(InitFnTable,zInitLingliItemUseFunc)
table.insert(InitFnTable,zInitDEggItemsUseFunc)
table.insert(InitFnTable,zInitItemUseFunc)
table.insert(InitFnTable,zInitItemAchievementFunc)
table.insert(InitFnTable,zInitPkItemFunc)
table.insert(InitFnTable,zInitDayAward)

