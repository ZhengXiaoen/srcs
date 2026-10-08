--#include "data\config\item\FuHunLevelInfo.lua" once

function OnFuHunHandle(sysarg,sysid,packet)
	--判断是否够5转
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle<5 then 
		return 
	end
    local nType = DataPack.readByte(packet)
	if nType==1 then --装备附魂
		OnEquitFuHun(sysarg,packet)
	elseif  nType==2 then --附魂升级
		OnEquitFuHunLvUp(sysarg,packet)
	elseif nType==3 then --附魂转移
		OnFunHunMove(sysarg,packet)
	elseif nType==4 then --一键附魂
		LocalDT.FuHunAll(sysarg,packet)
	end
end

--装备位置是否合适
function IsSuitFuHunType(sysarg,ItemPtr)
	local nItemType = Item.getItemProperty( sysarg, ItemPtr, Item.ipItemType, 0)
	local Types = {1,2,3,4,6,7,8,9}
	for i=1,#Types do 
		if nItemType ==Types[i] then  
			return true
		end
	end
	return false
end

--装备附魂
function OnEquitFuHun(sysarg,packet)

	local zhuItem = DataPack.readInt64(packet)
	local cailiaoItem = DataPack.readInt64(packet)
	LocalDT.FuHunConsume(sysarg,zhuItem,cailiaoItem,false)
end

-- 单次和批量附魂共用校验、扣除与经验继承逻辑。
LocalDT.FuHunConsume = function(sysarg,zhuItem,cailiaoItem,isBatch)
	
	if zhuItem==cailiaoItem then 
		return 
	end
	
	
	local pzhuItemPtr = Item.getEquipPtrByGuid(sysarg,zhuItem)
	local pcailiaoItemPtr = Item.getBagItemPtrByGuid(sysarg,cailiaoItem)
	
	if pzhuItemPtr==nil then 
		Actor.sendTipmsg(sysarg,"没有穿戴主装备",ttFlyTip)
		return
	end
	
	if pcailiaoItemPtr==nil then 
		Actor.sendTipmsg(sysarg,"背包没有材料装备",ttFlyTip)
		return
	end
	
	if Item.getFuHunInfo(pzhuItemPtr,1)>=25 then 
		Actor.sendTipmsg(sysarg,"主装备已经满级",ttFlyTip)
		return 
	end
	
	--判断主装备类型
	if IsSuitFuHunType(sysarg,pzhuItemPtr)==false then 
		Actor.sendTipmsg(sysarg,"主装备类型不满足",ttFlyTip)
		return 
	end
	
	--判断材料装备类型
	if IsSuitFuHunType(sysarg,pcailiaoItemPtr)==false then 
		Actor.sendTipmsg(sysarg,"材料装备类型不满足",ttFlyTip)
		return 
	end
	
	--主是否够转数
	local zhuItemId = Item.getItemId(pzhuItemPtr)
	local needCircle = Item.getItemPropertyById(zhuItemId,Item.ipItemNeedCircle)
	if needCircle<5 then 
		Actor.sendTipmsg(sysarg,"主装备小于5转",ttFlyTip)
		return
	end
	
	--材料装备是否够转数
	local cailiaoItemId = Item.getItemId(pcailiaoItemPtr)
	needCircle = Item.getItemPropertyById(cailiaoItemId,Item.ipItemNeedCircle)
	if needCircle<4 then 
		Actor.sendTipmsg(sysarg,"材料装备小于4转",ttFlyTip)
		return
	end
	
	--材料装备是否是龙装
	local dragonEquipLevel = Item.getItemProperty(sysarg,pcailiaoItemPtr,Item.ipDragonEquipLevel)
	if dragonEquipLevel~=0 then 
		Actor.sendTipmsg(sysarg,"龙装不能作为材料装备",ttFlyTip)
		return
	end
	
	--材料装备是否是王.帝
	local  beishu = 1
	local nSuperLevel = Item.getItemProperty(sysarg,pcailiaoItemPtr,Item.ipItemSuperAttrLevel)
    if nSuperLevel > 0 then 
		if nSuperLevel % 2 ==1 then 
			beishu =3
		elseif  nSuperLevel % 2 ==0  then 
			beishu =9
		end
	end
	
	--不同类型的不能附魂
	local nItemType1 = Item.getItemProperty( sysarg, pzhuItemPtr, Item.ipItemType, 0)
	local nItemType2 = Item.getItemProperty( sysarg, pcailiaoItemPtr, Item.ipItemType, 0)
	if nItemType1~=nItemType2 then 
		return 
	end
	
	
	--材料装备本身的经验
	local addExp1 = Item.getItemProperty(sysarg,pcailiaoItemPtr,Item.ipItemaddFuHunExp) * beishu
	--print("addExp1="..addExp1)
	--材料装备升级用了多少经验
	local addExp2 = calFuHunLevelUpUsedExp(sysarg,pcailiaoItemPtr)
	--print("addExp2="..addExp2)
	--材料装备剩余多少经验
	local addExp3 = Item.getFuHunInfo(pcailiaoItemPtr,2)
	--print("addExp3="..addExp3)
	
	--把材料扣除
	if Actor.removeItemByPtr(sysarg,pcailiaoItemPtr,1,true,"附魂",LogIds.zhuangbeifuhun)==0 then 
		Actor.sendTipmsg(sysarg,"扣除失败",ttFlyTip)
		return 
	end
				
	--给经验给主装备
	
	local hasExp0 = Item.getFuHunInfo(pzhuItemPtr,2)
	--print("hasExp0="..hasExp0)
	Item.setFuHunInfo(sysarg,pzhuItemPtr,2,hasExp0+addExp1+addExp2+addExp3)
	--print("all="..(hasExp0+addExp1+addExp2+addExp3))
	
	if not isBatch then
		Actor.sendTipmsg(sysarg,"附魂成功",ttFlyTip)
	end
	
	System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,hasExp0, Item.getFuHunInfo(pzhuItemPtr,2), "","","装备附魂","","",Item.getItemGuidStr(pzhuItemPtr),"",Item.getItemName(pzhuItemPtr))
	
	--告诉前端成功了
	if not isBatch then
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sFuHunHandle)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
	end
	return true
	

end

-- 只处理当前穿戴主装备对应的背包材料，倒序扣除避免背包索引移动漏扣。
LocalDT.FuHunAll = function(sysarg,packet)
	local zhuItem = DataPack.readInt64(packet)
	local mainPtr = Item.getEquipPtrByGuid(sysarg,zhuItem)
	if mainPtr == nil then
		Actor.sendTipmsg(sysarg,"没有穿戴主装备",ttFlyTip)
		return
	end
	if not IsSuitFuHunType(sysarg,mainPtr) or
		Item.getItemPropertyById(Item.getItemId(mainPtr),Item.ipItemNeedCircle) < 5 then
		Actor.sendTipmsg(sysarg,"主装备不满足附魂条件",ttFlyTip)
		return
	end
	if Item.getFuHunInfo(mainPtr,1) >= 25 then
		Actor.sendTipmsg(sysarg,"主装备已经满级",ttFlyTip)
		return
	end
	local mainType = Item.getItemProperty(sysarg,mainPtr,Item.ipItemType,0)
	local count = 0
	for index = Item.getBagItemCount(sysarg) - 1, 0, -1 do
		local materialPtr = Item.getItemPtrByIndex(sysarg,index)
		if materialPtr and
			Item.getItemProperty(sysarg,materialPtr,Item.ipItemType,0) == mainType and
			Item.getItemPropertyById(Item.getItemId(materialPtr),Item.ipItemNeedCircle) >= 4 and
			Item.getItemProperty(sysarg,materialPtr,Item.ipDragonEquipLevel) == 0 then
			if LocalDT.FuHunConsume(sysarg,zhuItem,Item.getItemGuid(materialPtr),true) then
				count = count + 1
			else
				break
			end
		end
	end
	if count > 0 then
		Actor.sendTipmsg(sysarg,"一键附魂成功，消耗材料装备"..count.."件",ttFlyTip)
	else
		Actor.sendTipmsg(sysarg,"没有可用的附魂材料装备",ttFlyTip)
	end
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sFuHunHandle)
	DataPack.writeByte(pack,4)
	DataPack.flush(pack)
end

--计算材料装备升级用了多少经验
function calFuHunLevelUpUsedExp (sysarg,pcailiaoItemPtr)
	local level  = Item.getFuHunInfo(pcailiaoItemPtr,1)
	if level==0 then 
		return 0
	else 
		local cfg = findFuHunConfig(pcailiaoItemPtr)
		if cfg==nil then 
			return 0
		end
		--等级
		if level<0 or level>#cfg then 
			return 0
		end
		
		local needExp = 0
		for i=1,level do 
			if cfg[i]==nil then 
				return 0
			end
			needExp = needExp +cfg[i].lvUpNeedExp
		end
		return needExp
	end
end

--附魂升级
function OnEquitFuHunLvUp(sysarg,packet)
	
	local zhuItem = DataPack.readInt64(packet)

	local pzhuItemPtr = Item.getEquipPtrByGuid(sysarg,zhuItem)

	if pzhuItemPtr==nil then 
		Actor.sendTipmsg(sysarg,"没有穿戴主装备",ttFlyTip)
		return
	end
	
	--主是否够转数
	local zhuItemId = Item.getItemId(pzhuItemPtr)
	local needCircle = Item.getItemPropertyById(zhuItemId,Item.ipItemNeedCircle)
	if needCircle<5 then 
		Actor.sendTipmsg(sysarg,"主装备小于5转",ttFlyTip)
		return
	end
	
	local hasExp0 = Item.getFuHunInfo(pzhuItemPtr,2)
	local needExp = calFuHunLevelUpNeedExp(sysarg,pzhuItemPtr)
	if needExp==-1 then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return 
	end

	
	if needExp==-2 then 
		Actor.sendTipmsg(sysarg,"已经是最高等级",ttFlyTip)
		return 
	end
	
	--对比经验是否足够
	if hasExp0<needExp then 
		Actor.sendTipmsg(sysarg,"经验不足",ttFlyTip)
		return 
	end
	--扣经验
	local leftExp = hasExp0 - needExp
	Item.setFuHunInfo(sysarg,pzhuItemPtr,2,leftExp)
	
	--加级
	Item.setFuHunInfo(sysarg,pzhuItemPtr,1,Item.getFuHunInfo(pzhuItemPtr,1)+1)
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	
	Actor.sendTipmsg(sysarg,"附魂升级成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,hasExp0, leftExp, "","","装备附魂升级","","",Item.getItemGuidStr(pzhuItemPtr),"",Item.getItemName(pzhuItemPtr))
	System.sendCommonLog(LogIds.zhuanbeifuhunLvChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Item.getFuHunInfo(pzhuItemPtr,1)-1, Item.getFuHunInfo(pzhuItemPtr,1), "","","装备附魂升级","","",Item.getItemGuidStr(pzhuItemPtr),"",Item.getItemName(pzhuItemPtr))
	
	--告诉前端成功了
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sFuHunHandle)
	DataPack.writeByte(pack,2)
	DataPack.flush(pack)

end

--计算升级多需经验
function calFuHunLevelUpNeedExp (sysarg,ItemPtr)

	local cfg =findFuHunConfig(ItemPtr)
	local level  = Item.getFuHunInfo(ItemPtr,1)
	
	if cfg==nil then 
		return -1
	end
	
	--等级
	if level>=#cfg then 
		return -2
	end
	
	if cfg[level+1]==nil then 
		return -1
	end
	
	return cfg[level+1].lvUpNeedExp
end

--附魂转移
function OnFunHunMove(sysarg,packet)
	local zhuItem = DataPack.readInt64(packet)
	local cailiaoItem = DataPack.readInt64(packet)
	
	if zhuItem==cailiaoItem then 
		return 
	end
	
	local pzhuItemPtr = Item.getBagItemPtrByGuid(sysarg,zhuItem)
	local pcailiaoItemPtr = Item.getBagItemPtrByGuid(sysarg,cailiaoItem)
	
	if pzhuItemPtr==nil then 
		Actor.sendTipmsg(sysarg,"背包没有主装备",ttFlyTip)
		return
	end
	
	if pcailiaoItemPtr==nil then 
		Actor.sendTipmsg(sysarg,"背包没有材料装备",ttFlyTip)
		return
	end
	
	if Item.getFuHunInfo(pzhuItemPtr,1)>=25 then 
		Actor.sendTipmsg(sysarg,"主装备已经满级",ttFlyTip)
		return 
	end
	
	
	--判断主装备类型
	if IsSuitFuHunType(sysarg,pzhuItemPtr)==false then 
		Actor.sendTipmsg(sysarg,"主装备类型不满足",ttFlyTip)
		return 
	end
	
	--判断材料装备类型
	if IsSuitFuHunType(sysarg,pcailiaoItemPtr)==false then 
		Actor.sendTipmsg(sysarg,"材料装备类型不满足",ttFlyTip)
		return 
	end
	
	--主是否够转数
	local zhuItemId = Item.getItemId(pzhuItemPtr)
	local needCircle = Item.getItemPropertyById(zhuItemId,Item.ipItemNeedCircle)
	if needCircle<5 then 
		Actor.sendTipmsg(sysarg,"主装备小于5转",ttFlyTip)
		return
	end
	
	--材料装备是否够转数
	local cailiaoItemId = Item.getItemId(pcailiaoItemPtr)
	needCircle = Item.getItemPropertyById(cailiaoItemId,Item.ipItemNeedCircle)
	if needCircle<4 then 
		Actor.sendTipmsg(sysarg,"材料装备小于4转",ttFlyTip)
		return
	end


	--材料装备升级用了多少经验
	local addExp2 = calFuHunLevelUpUsedExp(sysarg,pcailiaoItemPtr)
	--print("addExp2="..addExp2)
	--材料装备剩余多少经验
	local addExp3 = Item.getFuHunInfo(pcailiaoItemPtr,2)
	--print("addExp3="..addExp3)
	
	
	if addExp2==0 and addExp3 ==0 then 
		Actor.sendTipmsg(sysarg,"没有可以转移的附魂经验",ttFlyTip)
		return 
	end
	
	
	local needYb=2888
		
	if Actor.changeMoney(sysarg, mtYuanbao, -needYb, LogIds.zhungbeifuhunMove) == false then
		Actor.sendTipmsg(sysarg,"元宝不足"..needYb,ttFlyTip)
		return
	end	
	
	
	--给经验给主装备
	local hasExp0 = Item.getFuHunInfo(pzhuItemPtr,2)
	--print("hasExp0="..hasExp0)
	System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,hasExp0, hasExp0+addExp2+addExp3, "","","装备附魂转移","","",Item.getItemGuidStr(pzhuItemPtr),"",Item.getItemName(pzhuItemPtr))
	System.sendCommonLog(LogIds.zhuanbeifuhunLvChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Item.getFuHunInfo(pcailiaoItemPtr,1), 0, "","","装备附魂转移","","",Item.getItemGuidStr(pcailiaoItemPtr),"",Item.getItemName(pcailiaoItemPtr))
	System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Item.getFuHunInfo(pcailiaoItemPtr,2), 0, "","","装备附魂转移","","",Item.getItemGuidStr(pcailiaoItemPtr),"",Item.getItemName(pcailiaoItemPtr))
	
	
	Item.setFuHunInfo(sysarg,pzhuItemPtr,2,hasExp0+addExp2+addExp3)
	Item.setFuHunInfo(sysarg,pcailiaoItemPtr,1,0)
	Item.setFuHunInfo(sysarg,pcailiaoItemPtr,2,0)
			
	--print("all="..(hasExp0+addExp2+addExp3))
	
	Actor.sendTipmsg(sysarg,"附魂转移成功",ttFlyTip)
	
	--告诉前端成功了
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sFuHunHandle)
	DataPack.writeByte(pack,3)
	DataPack.flush(pack)
	
end

--找到配置
findFuHunConfig  = function(ItemPtr)

	if ItemPtr==nil then 
		return nil 
	end

	local ItemPtrItemId = Item.getItemId(ItemPtr)
	local circle = Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedCircle)
	if circle <5 then 
		return nil 
	end
	circle = circle -4 --5转对应的是第一个
	if FuHunLevelInfo[circle]==nil then
		return nil 
	end
	
	--职业
	local job = Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedVocation)
	if job==0 or  FuHunLevelInfo[circle][job]==nil then 
		return nil 
	end
	
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
	
	if cfg ==nil then 
		return nil 
	elseif cfg[1]==nil then 
		return nil 
	else 
		return cfg
	end
end

--@func setFuHunLvandExp "名字" 槽位 等级 经验
--需要脱下再穿上测试  
--@func setFuHunLvandExp "和尚洗头" 0 1 10
--设置附魂等级和经验
setFuHunLvandExp = function(sysarg,name,pos,lv,exps)
	local posTable = {itWeaponPos,itDressPos,itHelmetPos,itNecklacePos,itLeftBraceletPos,itRightBraceletPos,itLeftRingPos,itRightRingPos,itGirdlePos,itShoesPos}
	local name =tostring(name)
	local pos = tonumber(pos)
	local lv =tonumber(lv)
	local exps =tonumber(exps)
	print("lv="..lv)
	print("exps="..exps)
	
	
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		local cando =false
		for i=1,#posTable do 
			if pos ==posTable[i] then 
				cando =true
			end
		end
		if cando==true then 
			local ItemPtr = Item.getEquipByPos(sysarg, pos);
			if ItemPtr then 
				local ItemPtrItemId = Item.getItemId(ItemPtr)
				if Item.getItemPropertyById(ItemPtrItemId,Item.ipItemNeedCircle)<5 then 
					Actor.sendTipmsg(sysarg,"装备不够5转",ttFlyTip)
					return
				end
								
				System.sendCommonLog(LogIds.zhuanbeifuhunLvChange,Actor.getIntProperty(pActor, PROP_ENTITY_ID),Actor.getName(pActor),0,Item.getFuHunInfo(ItemPtr,1), lv, "","","gm设置","","",Item.getItemGuidStr(ItemPtr),"",Item.getItemName(ItemPtr))
				System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(pActor, PROP_ENTITY_ID),Actor.getName(pActor),0,Item.getFuHunInfo(ItemPtr,2), exps, "","","gm设置","","",Item.getItemGuidStr(ItemPtr),"",Item.getItemName(ItemPtr))
				
				Item.setFuHunInfo(pActor,ItemPtr,1,lv)
				Item.setFuHunInfo(pActor,ItemPtr,2,exps)
				Actor.sendTipmsg(sysarg,"设置成功",ttFlyTip)
			end
			
			--要下线再上线验证
		end
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
	
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cFuHunHandle,OnFuHunHandle) --获取老兵回归标记信息