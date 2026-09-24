--#include "data\config\item\SwingEquip.lua" once
--#include "data\functions\ActorEvent\Utils.lua" once
--#include "data\functions\modules\headtitle.lua" once
--#include "data\functions\FunctionGift\FunctionGift.lua" once
--#include "data\functions\ActorEvent\AdvanceSwing.lua" once

--下发翅膀操作结果

-- 消耗成功扣除羽毛或元宝
local function isConsumeSuccess(sysarg, bYBBuy, equipCfg, starLvCfg, itemCount,upType,LXTimes)
    local needCount = 0
   
    if upType == 1 then
        for i = LXTimes + 1,starLvCfg[1] do
            needCount =needCount +  starLvCfg[2]
        end
    else
        needCount = starLvCfg[2]
    end 
    
	if itemCount >= needCount then
		local delCount = Actor.removeItem(sysarg, equipCfg.consume.id, needCount);
		if delCount <= 0 then
			return false;
		end
	else
		-- 是否使用元宝
		if bYBBuy == 0 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00003, ttFlyTip);
			return false;
		end
		
		local needYbCount =  0
        if upType == 0 then
            needYbCount =  (starLvCfg[2] - itemCount) * equipCfg.consume.yb
           
        else    
            
            nAmount = needCount - itemCount 
            
            needYbCount = nAmount * equipCfg.consume.yb ;
        end

        
      
		if Actor.getMoneyCount(sysarg,mtYuanbao) < needYbCount then 
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf063, ttFlyTip);
			return false
		end
		
		if Actor.changeMoney(sysarg, mtYuanbao, -needYbCount, GameLog.clBuyStoreItem, Lang.LogTips.s00001) == false then
			return false
		end
		if itemCount~= 0 and Actor.removeItem(sysarg, equipCfg.consume.id, needCount)<=0 then 
			return false
		end
	end
	return true;
end

-- 下发翅膀id, 外观, 星星级别, 当前提升次数
local function sendSwingData(sysarg, LXTimes)
	local netPack = DataPack.allocPacket(sysarg, 52, 1)
--	DataPack.writeUInt(netPack, swingEquipId);
--	DataPack.writeUInt(netPack, appearanceID);
--	DataPack.writeByte(netPack, currStarLV);
	DataPack.writeUInt(netPack, LXTimes);
	DataPack.flush(netPack);
	return true;
end

-- 进阶翅膀装备
local function UpSwingEquip(sysarg, bYBBuy,upType)
	-- 玩家没有翅膀装备，不能进阶
	local swingEquipId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID);
	if not swingEquipId or swingEquipId == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00001, ttFlyTip)
		return false;
	end
	
	local oldSwingId = swingEquipId
	-- 星星级别
	local currStarLV = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWING_EXP);
	if not currStarLV then
		currStarLV = 0;
		return false;
	end
	local oldSwingStarLV = currStarLV
	
	-- 升级次数
	local var = Actor.getStaticVar(sysarg);
	local LXTimes = var.LXTimes;
	if not LXTimes then
		LXTimes = 0;
	end
	
	-- 配置出错，没有找到这件装备
	
	local nIndxBase = SwingEquipConfig.SwingEquipTable[1].id - 1;					-- 因为翅膀ID是按顺序从684~708, 使用数组方式读取数据
	local equipCfg = SwingEquipConfig.SwingEquipTable[swingEquipId - nIndxBase];
	local nextEquipCfg = SwingEquipConfig.SwingEquipTable[swingEquipId - nIndxBase + 1];
	if not equipCfg then
		print("config error, UpSwingEquip() SwingEquip[" .. swingEquipId .. "]不存在!")
		return false;
	end
	-- 不能再进阶了
	if not nextEquipCfg and currStarLV >= table.getn(equipCfg.starLv) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00002, ttFlyTip);
		return false;
	end
--	--不能再进阶了
--	if(Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID) - nIndxBase+1 > table.getn(SwingEquipConfig.SwingEquipTable)) then
--        print("111")
--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00002, ttFlyTip);
--		return false;
--	end
	
    if equipCfg.starLv[currStarLV + 1] == nil then
        currStarLV = 0
    end
    
    if nextEquipCfg ~= nil  and Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL) < nextEquipCfg.needLv then 	
		Actor.sendTipmsg(sysarg,string.format("您的人物角色未达%d级,不能进阶。",nextEquipCfg.needLv), ttFlyTip);
		return false;
	end
	
	if LXTimes+1 >= equipCfg.starLv[currStarLV + 1][1] and currStarLV+1 >= table.getn(equipCfg.starLv) then  
		-- 星升完了，到了升级了
		if nextEquipCfg == nil then -- 升到最高等级了
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00002, ttFlyTip);
			return false;
		end
	end
   
	
	-- 扣除羽毛或元宝
    local starLvCfg = equipCfg.starLv[currStarLV + 1];
    local itemCount = Actor.getItemCount(sysarg, equipCfg.consume.id);
    
    if upType == 1 and bYBBuy == 0 then --材料一键升星
        local needCount = 0
       
        for i = LXTimes + 1,starLvCfg[1] do
            needCount =needCount +  starLvCfg[2]
        end
        
        if itemCount < needCount  then
            Actor.sendTipmsg(sysarg,"材料不足"..needCount.."个,无法升级。",ttFlyTip)
            return
        end
        
        local delCount = Actor.removeItem(sysarg, equipCfg.consume.id,needCount);
		if delCount <= 0 then
			return false;
		end
        LXTimes = starLvCfg[1]
    else
        
	    
	    if isConsumeSuccess(sysarg, bYBBuy, equipCfg, starLvCfg, itemCount,upType,LXTimes) == false then
		    return false;
	    end
          --一键升星
    
	    if bYBBuy == 1 and upType == 1 then
            LXTimes = starLvCfg[1]
       
        else
            LXTimes = LXTimes + 1;
        end
    end
	
	local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID);
	local ActorName = Actor.getName(sysarg);

	
	if LXTimes >= starLvCfg[1] then
		-- 亮星
		LXTimes = 0;
		currStarLV = currStarLV + 1;
				
		
		local bLXTips = true;			-- 是否提示点亮星星
		-- 进阶
		if currStarLV >= table.getn(equipCfg.starLv) then
			if nextEquipCfg ~= nil then
				currStarLV = 0;
				swingEquipId = swingEquipId + 1;

				Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGID, nextEquipCfg.id);
				Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGAPPEARANCE, nextEquipCfg.appearance);
				
				--local newItemPtr = Item.createItem(nextEquipCfg.id);
				local oldname = Item.getItemName(equipCfg.id);
				local newname = Item.getItemName(nextEquipCfg.id);
				--local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID);
				--local ActorName = Actor.getName(sysarg);
				System.sendCommonLog(GameLog.cWingLevel, ActorId, ActorName, equipCfg.id, nextEquipCfg.id, 0, oldname, newname, Lang.ScriptTips.s00007);
				
				local tipmsg = string.format(Lang.ScriptTips.s00005, oldname, newname);
				Actor.sendTipmsg(sysarg, tipmsg, ttFlyTip);
				
				--%s将%s进阶至%s,实力大增!
				local sysMsg = string.format(Lang.ScriptTips.s00006, ActorName, oldname, newname);
				System.broadcastTipmsg(sysMsg, ttChatWindow);
				sysMsg = string.format(Lang.ScriptTips.s00010, ActorName, oldname, newname);
				System.broadcastTipmsg(sysMsg, ttScreenCenter);
				bLXTips = false;
				
				local newLvl = swingEquipId - nIndxBase
--				if newLvl >= 7 and System.getDaysSinceOpenServer() <= 7 then
--					ht_set_titleflags(sysarg, 2, true)
					
--					if not Actor.hasTopTitle(sysarg, Title.SwingLevel7) then						
--						Actor.setTopTitle(sysarg, Title.SwingLevel7, true)
--					end
--				end
			end
			
			Actor.setUIntProperty(sysarg, PROP_ACTOR_SWING_EXP, currStarLV);
		end
		
		if bLXTips == true then
			local itemName = Item.getItemName(equipCfg.id);
			local tipmsg = string.format(Lang.ScriptTips.s00004, itemName, currStarLV);
			Actor.sendTipmsg(sysarg, tipmsg, ttFlyTip);
		end
		
		local swingID = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)
		--print("+++++++++++++++"..(swingID - nIndxBase - 1)*10 + currStarLV);
		Actor.triggerAchieveEvent(sysarg, 106, (swingID - nIndxBase - 1)*10 + currStarLV);
		Actor.setUIntProperty(sysarg, PROP_ACTOR_SWING_EXP, currStarLV);
		Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
		
	end
	local swingID = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	local newpos, oldpos = System.rankingUpdateValue(3, sysarg, (swingID-684+1)*100+currStarLV, (oldSwingId-684+1)*100+oldSwingStarLV)
	
	
	System.sendCommonLog(LogIds.swingAddStar, ActorId, ActorName, currStarLV-1, currStarLV, 0, "", "", "翅膀星星变化");
	System.sendCommonLog(LogIds.swingAddExp, ActorId, ActorName, var.LXTimes, LXTimes, 0, "", "", "翅膀经验段变化");
		
	var.LXTimes = LXTimes;

	-- 发送翅膀数据
	sendSwingData(sysarg, var.LXTimes);
end

--45级送翅膀
EventCallDispatcher.swingHandleActorLevelUp = function (sysarg, args)
--[[ 现在改为手动激活翅膀
	local swingId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	if swingId > 0 then	return end --有翅膀了
	local level = args[1]
	if SwingEquipConfig.givingSwing ~= nil and level < SwingEquipConfig.givingSwing then
		return --还没到激活等级
	end
	
	local config = SwingEquipConfig.SwingEquipTable
	if level >= SwingEquipConfig.givingSwing then 
		local newItemPtr = Item.createItem(config[1].id)
		Item.equipItem(sysarg, newItemPtr)
		--Item.ReplaceEquips(sysarg,newItemPtr)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_SWING_EXP, 0)--经验清0	
		Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGID, config[1].id)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGAPPEARANCE,config[1].appearance)--返回进阶翅膀外观ID
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf678, 1024)
		--local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sSendRecommendTips)  --申请一个数据包
		--if npack == nil then
		--	print("allocPacket is nil!")
		--	return
		--end
		--DataPack.writeString(npack,Lang.ScriptTips.zf556)
		--DataPack.flush(npack)
	end
	--System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>升到了45级,获得了系统赠送的翅膀！",Actor.getName(sysarg)),2);
--]]
end

-- 激活翅膀
function activeSwing(sysarg)
	local swingId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	if swingId > 0 then	
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.s00008, ttFlyTip)
		return true;
	end --有翅膀了
	
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if SwingEquipConfig.givingSwing ~= nil and pLv < SwingEquipConfig.givingSwing then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.s00009, SwingEquipConfig.givingSwing ), ttFlyTip)
		return false;
	end
		
	local config = SwingEquipConfig.SwingEquipTable;
	local newSwingId = config[1].id
	local newItemPtr = Item.createItem(newSwingId)
	Item.equipItem(sysarg, newItemPtr)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWING_EXP, 0)	--改为星星级别	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGID, newSwingId)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGAPPEARANCE,config[1].appearance)	--返回进阶翅膀外观ID
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf678, 1024)
	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	Actor.triggerAchieveEvent(sysarg, 106, 1)
	
	-- ranking_type_swing 		// 翅膀榜
	local newpos, oldpos = System.rankingUpdateValue(3, sysarg, (newSwingId-684+1)*100, 0)
    OnCompleteGiftTask(sysarg,2)
	return true;
end

-- 注魂处理
local function injectStone(sysarg)

end

--刻印处理
 function SwingKeYin(sysarg,yb_Buy)
	--翅膀等级是否足够
	local swingId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	local swingLevel = swingId-684 + 1
	if swingLevel<10 then 
		Actor.sendTipmsg(sysarg,"刻印系统还没有开启",ttFlyTip)
		return false
	end
	--是否有剩余的刻印次数
	local keYinValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWING_KEYIN_VALUE)	
	local indexOfCfg = swingLevel-9
	local cgf = SwingEquipConfig.SwingEquip_KEYIN[indexOfCfg]
	if cgf ==nil then 
		Actor.sendTipmsg(sysarg,"配置出错",ttFlyTip)
		return false
	end
	
	--翅膀刻印不足
	if cgf.maxCanKeYin<=keYinValue then
		if swingLevel==25 then 
			Actor.sendTipmsg(sysarg,"当前刻印已经是最高级",ttFlyTip)
			return 
		end
		Actor.sendTipmsg(sysarg,"当前翅膀刻印次数不足,请提升翅膀阶数！",ttFlyTip)
		return false
	end
	
	--道具是否满足
	local index=#SwingEquipConfig.SwingEquip_KEYIN
	for i=1,#SwingEquipConfig.SwingEquip_KEYIN do 
		if keYinValue<SwingEquipConfig.SwingEquip_KEYIN[i].maxCanKeYin then 
			index =i
			break
		end 
	end
	local needId = SwingEquipConfig.SwingEquip_KEYIN[index].consume.id
	local needCount = SwingEquipConfig.SwingEquip_KEYIN[index].consume.count

	yb_Buy = tonumber(yb_Buy)
	
	local itemCount = Actor.getItemCount(sysarg,needId)
	if itemCount< needCount and yb_Buy==0 then   --数量不够，没够勾选使用元宝
		Actor.sendTipmsg(sysarg,"刻印所需道具不足,刻印失败",ttFlyTip)
		return false
	elseif itemCount< needCount and yb_Buy==1 then  --数量不够，勾选了使用元宝
		if Cal_keYinConsume(sysarg,itemCount,needCount,SwingEquipConfig.SwingEquip_KEYIN[index].consume.yb,needId)~=true then 	
			return 
		end
	elseif itemCount>= needCount then  --数量足够
		local delCount = Actor.removeItem(sysarg, needId, needCount,-1,-1,-1,"翅膀刻印",LogIds.swingKeYin);  --直接扣羽毛
		if delCount <= 0 then
			return false
		end
	end
	 
	--刻印
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWING_KEYIN_VALUE,keYinValue+1)
	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	return true
end

--刻印的金钱羽毛计算
Cal_keYinConsume =function(sysarg,itemCount,needCount,oneYb,needId)
	
	--计算需要的元宝
	local needYb=0 
	if(itemCount==0) then 
		needYb = oneYb*needCount
	else 
		needYb = (needCount-itemCount)*oneYb
	end
	
	--判断元宝是否足够
	if Actor.getMoneyCount(sysarg,3) < needYb then 
		Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		return false
	end
	
	--扣掉一部分的羽毛
	if(itemCount~=0) then 
		local delCount = Actor.removeItem(sysarg, needId, itemCount,-1,-1,-1,"翅膀刻印",LogIds.swingequiptakeon);  --扣羽毛
		if delCount <= 0 then
			return false
		end
	end
	
	--扣钱
	if Actor.changeMoney(sysarg,3,-needYb,LogIds.swingKeYin,"翅膀刻印")==false then 
		return false
	else 
		return true
	end
	
end

--穿上
function TakeOnSwingEquipment(sysarg,packet)

	local swingId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	if swingId <= 0 then	
		Actor.sendTipmsg(sysarg, "请先激活翅膀", ttFlyTip)
		return
	end
	
	--翅膀要先激活
	local series = DataPack.readUint64(packet)
	
	local cfg = SwingEquipConfig.SwingEquipment.ItemAttr
	local itemPer = Item.getBagItemPtrByGuid(sysarg,series)
	if (itemPer==nil )then 
		Actor.sendTipmsg(sysarg,"物品不存在",ttFlyTip)
		return 
	end
	local itemID = Item.getItemProperty(sysarg,itemPer,Item.ipItemID) 
	
	--查找出翅膀装备的类型
	local index =0
	local level =0
	for i=1,#cfg do 
		for j=1,#cfg[i].id do 
			if cfg[i].id[j]==itemID then 
				index =i
				level = j
			end
			if index~=0 then 
				break
			end
		end
		if index~=0 then 
			break
		end
	end
	--print("swingid:"..itemID)
	--print("swingindex:"..index)
	--print("swinglevel:"..level)
	
	if index==0 or level==0 or index > 4 then 
		Actor.sendTipmsg(sysarg,"物品类型不对",ttFlyTip)
		return 
	end
	
	--脱下装备
	local mySwingEquipment = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET)
	local nowlevel = System.getIntByte(mySwingEquipment, index - 1)
	--print("nowlevel="..nowlevel)
	
	--print("swingnowlevel:"..level)
	
	if nowlevel>#cfg[index].id then --数据混乱
		Actor.sendTipmsg(sysarg,"数据错乱1",ttFlyTip)
		return 
	elseif nowlevel==0 then  --本来没有物品
		
	elseif nowlevel>0 and nowlevel<=#cfg[index].id then --本来有物品，需要先脱下
		if TakeOffSwingEquipment(sysarg,index)==false then 
			return 
		end
	else 
		--负数是数据错乱
		Actor.sendTipmsg(sysarg,"数据错乱2",ttFlyTip)
		return 
	end 
	
	local zhaohuanqiangdu = Item.getItemProperty(sysarg,itemPer,Item.ipTaoStrong)
	--print("swingzhaohuanqiangdu="..zhaohuanqiangdu)
	
	--把穿上的物品扣除了
	if Actor.removeItemByPtr(sysarg,itemPer,1,true,"翅膀装备穿上",LogIds.swingequiptakeon)==0 then 
		Actor.sendTipmsg(sysarg,"穿戴失败",ttFlyTip)
		return 
	end
	

	local var = Actor.getStaticVar(sysarg)
	var.SwingTaoStrongPoints = System.setIntByte(var.SwingTaoStrongPoints, index - 1,zhaohuanqiangdu)
	
	
	
	mySwingEquipment = System.setIntByte(mySwingEquipment, index - 1, level)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET,mySwingEquipment)
	GetSwingEquipmentInfo(sysarg)
	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	
end

--用于测试查看当前的等级
function CheckSwingEquAllLevel(sysarg)
	local mySwingEquipment = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET)
	for i=1,4 do 
		local level = System.getIntByte(mySwingEquipment, i - 1)
		print("nowlevel"..i..":"..level)
	end
end

--脱下
function TakeOffSwingEquipment(sysarg,index)
	index = tonumber(index)
	--翅膀要先激活
	local swingId = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID)	
	if swingId <= 0 then	
		Actor.sendTipmsg(sysarg, "请先激活翅膀", ttFlyTip)
		return
	end
	
	local cfg = SwingEquipConfig.SwingEquipment.ItemAttr
	if index<1 or index>#cfg then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return false
	end
	
	local mySwingEquipment = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET)
	local nowlevel = System.getIntByte(mySwingEquipment, index - 1)
	--print("index:"..index)
	--print("nowlevel:"..nowlevel)
	--print("#cfg[index].id:"..#cfg[index].id)
	
	if nowlevel<1 or nowlevel>#cfg[index].id then 
		Actor.sendTipmsg(sysarg,"没有穿戴的物品可以脱下",ttFlyTip)
		return false
	end
	
	local hasCount = Item.getBagEmptyGridCount(sysarg)
	if hasCount<Item.getAddItemNeedGridCount(sysarg, cfg[index].id[nowlevel], 1, 0, 0, 0) then 
		Actor.sendTipmsg(sysarg,"背包不足,装备脱下失败",ttFlyTip)
		return false
	end
	
	--读取已经保存的召唤强度
	local var = Actor.getStaticVar(sysarg)
	local SwingTaoStrongPoints =var.SwingTaoStrongPoints
	if SwingTaoStrongPoints==nil then 
		SwingTaoStrongPoints=0
	end
	
	--记录一个道士宝宝强化点
	local nNewItem = Item.createItem(cfg[index].id[nowlevel],1,0,0,0)
	if (nNewItem==nil) then 
		Actor.sendTipmsg(sysarg,"脱下失败",ttFlyTip)
		return false
	end
	
	mySwingEquipment = System.setIntByte(mySwingEquipment, index - 1,0)
		
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET,mySwingEquipment)
	
	local zhaoHuanQiangDu = System.getIntByte(SwingTaoStrongPoints, index - 1)
	var.SwingTaoStrongPoints = System.setIntByte(var.SwingTaoStrongPoints, index - 1,0)
		
	Item.addItem(sysarg,nNewItem,"翅膀装备脱下",LogIds.swingequiptakeoff)
	Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu)

	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	GetSwingEquipmentInfo(sysarg)
	--print("swing2 take on success")
	return true
	
	
end

--得到翅膀装备的信息
function GetSwingEquipmentInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local SwingTaoStrongPoints =var.SwingTaoStrongPoints
	if SwingTaoStrongPoints==nil then 
		SwingTaoStrongPoints=0
	end
	
	local netPack = DataPack.allocPacket(sysarg, 52, 6) -- 下发召唤强度
	DataPack.writeInt(netPack, SwingTaoStrongPoints) -- 数量为1		
	DataPack.flush(netPack)	
end

--翅膀升阶函数接口
EventCallDispatcher.handleSwingEquipOp = function (sysarg, args)
	if not args then return false end
	
	local opType = args[1]

	if opType == 1 then
		return activeSwing(sysarg);
	elseif opType == 2 then
		return UpSwingEquip(sysarg, args[2], args[3]);
	elseif opType == 3 then
		return injectStone(sysarg);
	elseif opType == 4 then
		return AdvanceSwingUpgradeLevel(sysarg, args[2], args[3], args[4])
	elseif opType == 5 then
		return AdvanceSwingUpgradeClass(sysarg, args[2], args[3], args[4])
	--elseif opType == 6 then		
	elseif opType ==7 then 
		return SwingKeYin(sysarg,args[2])
	elseif opType ==9 then --穿上
		return 	TakeOnSwingEquipment(sysarg,args[2])
	elseif opType ==10 then --脱下
		return 	TakeOffSwingEquipment(sysarg,args[2])
	elseif opType ==11 then --取得翅膀装备的信息(召唤强度)
		GetSwingEquipmentInfo(sysarg)
		return 
	end
	return false;
end

--注册回调函数	
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSwingOp, EventCallDispatcher.handleSwingEquipOp) 
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLevel, EventCallDispatcher.swingHandleActorLevelUp)