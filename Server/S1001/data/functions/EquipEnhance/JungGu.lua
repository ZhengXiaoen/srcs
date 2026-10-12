--#include "data\config\equipSynthesis\JunGuCfg.lua" once
--#include "data\config\equipSynthesis\JunHunPingCfg.lua" once
GetJunGuInfo = function( sysarg, msgid, packet )
	--开区第4天开启
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<4 then 
		return 
	end
	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		SendJunGuInfo(sysarg)
	elseif nType== 1 then --激活军鼓/军鼓升级
		JunGuLevelUp(sysarg)
	end
end

function SendJunGuInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.JunGuZhi ==nil then  var.JunGuZhi =0 end
	if var.JunGuZhi<=0 then var.JunGuZhi=0 end 
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSendJunGuInfo)
	DataPack.writeUint64(netPack,var.JunGuZhi)
	DataPack.flush(netPack)
end

function JunGuLevelUp (sysarg)

	local equipItem_ptr = Item.getEquipByPos(sysarg, itJunGuPos)
	if equipItem_ptr==nil then --还没有激活，直接激活 
		--判断等级是否符合要求
		local nextItemId = JunGuCfg[1][1].award.id
		local needLevel = Item.getItemPropertyById(nextItemId, Item.ipItemActorLevel)
		local needCircle = Item.getItemPropertyById(nextItemId, Item.ipItemNeedCircle)
		local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
		local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);

		if myLevel < needLevel or myCircle < needCircle then
			Actor.sendTipmsg(sysarg,string.format("当前等级低于下阶装备所需的 %s 级",needLevel), ttFlyTip)
			return
		end
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<1 then 
			Actor.sendTipmsg(sysarg,"至少拥有一个背包空位",ttFlyTip)
			return
		end
			
		local newEquip_ptr = Item.createItem(JunGuCfg[1][1].award.id,JunGuCfg[1][1].award.count,0,0,JunGuCfg[1][1].award.bind)
		local addCount = Item.addItem(sysarg,newEquip_ptr,"激活军鼓",LogIds.ShenJiJunGu)
		Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
		Actor.sendTipmsg(sysarg,string.format("激活成功"), ttFlyTip)
		SendJunGuInfo(sysarg)
		
		Quest_ShuaXin(sysarg)
		
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if bagIdxs<2 then 
			local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			local awardIdAndCount=0
			awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,2)
			awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,5453)
			System.AddMail(myID,6,0,"激活军鼓奖励","此邮件为激活军鼓奖励，只要按一键提取就可以领取奖品",awardIdAndCount,0)
		else 
			Actor.addItem(sysarg,5453,0,0,2,1,0,"激活军鼓");
		end
	
		
	else 
		--知道当前的等级是多少
		local nowItem = Item.getItemId(equipItem_ptr)
		local nowLevel = 0
		for i=2,#JunGuCfg[1] do --前1-29级
			if nowItem == JunGuCfg[1][i].nowId then 
				nowLevel = i-1
			end
		end
		if nowLevel==0 then 
			for i=1,#JunGuCfg[2] do --30-59级
				if nowItem == JunGuCfg[2][i].nowId then 
					nowLevel = i+29
				end
			end
		end
		
		if nowLevel==0 then 
			for i=1,#JunGuCfg[3] do --60-89级
				if nowItem == JunGuCfg[3][i].nowId then 
					nowLevel = i+59
				end
			end
		end
		
		if nowLevel==0 then 
			for i=1,#JunGuCfg[4] do ---90~100级
				if nowItem == JunGuCfg[4][i].nowId then 
					nowLevel = i+89
				end
			end
		end
		
		--print("nowLevel="..nowLevel)
		if 7502 ==nowItem then
			Actor.sendTipmsg(sysarg,"当前已经是最高级了,不能再升级",ttFlyTip)
			return 
		end
		
		--计算应该要取什么配置
		local x=0
		local y=0
		if nowLevel>=30 and nowLevel<60 then 
			x= 2
			y=nowLevel -29
		elseif nowLevel>=90 then  
			x= 4
			y=nowLevel -89
		elseif nowLevel>=60 then  
			x= 3
			y=nowLevel -59
		else 
			x=1
			y=nowLevel +1
		end
		--print("x="..x,"y="..y)
		
		--判断等级是否符合要求
		local nextItemId = JunGuCfg[x][y].award.id
		local needLevel = Item.getItemPropertyById(nextItemId, Item.ipItemActorLevel)
		local needCircle = Item.getItemPropertyById(nextItemId, Item.ipItemNeedCircle)
		local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
		local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	    
		
		--if not Actor.checkActorLevel(sysarg,needLevel,needCircle) then -- 不要用这个来判断，因为是否可穿该装备也不是这样判断的
		if myLevel < needLevel or myCircle < needCircle then
			Actor.sendTipmsg(sysarg,string.format("当前等级低于下阶装备所需的 %s 级",needLevel), ttFlyTip)
			return
		end
		
		----判断需求
		local var = Actor.getStaticVar(sysarg)
		if var.JunGuZhi ==nil then  var.JunGuZhi =0 end
		if var.JunGuZhi<=0 then var.JunGuZhi=0 end 
	    
		if var.JunGuZhi<JunGuCfg[x][y].consume.count then 
			Actor.sendTipmsg(sysarg,string.format("所需的军鼓值不够,无法升级"), ttFlyTip)
			return 
		end
		
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<1 then 
			Actor.sendTipmsg(sysarg,"至少拥有一个背包空位",ttFlyTip)
			return
		end
		
		--升级(换装备)
		
		if equipItem_ptr ~= nil and Item.removeEquip(sysarg,equipItem_ptr,"军鼓升级删除",LogIds.ShenJiJunGu) < 1 then
			local emsg = string.format("error, 军鼓升级删除 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return
		end
		
		local newEquip_ptr = Item.createItem(nextItemId,1,0,0,1)
		if not newEquip_ptr then
			local emsg = string.format("error, 军鼓升级创建失败 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return
		end	
		
		local addCount = Item.addItem(sysarg,newEquip_ptr,"军鼓升级",LogIds.ShenJiJunGu)
		
		Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
		Actor.sendTipmsg(sysarg,string.format("升级成功"), ttFlyTip)

		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>将军鼓升级至%s,<我也要升级/@@showWin,213>",Actor.getName(sysarg),Item.getItemLinkMsg(nextItemId)),ttChatWindow);		
		
		var.JunGuZhi =var.JunGuZhi -JunGuCfg[x][y].consume.count
		SendJunGuInfo(sysarg)
	end
end

GetJunHunPing = function( sysarg, msgid, packet )

	local itemSec = DataPack.readInt64(packet)
    local nType = DataPack.readByte(packet)
    local itemPtr = Item.getBagItemPtrByGuid(sysarg,itemSec)
	
	if itemPtr == nil then
        --Actor.sendTipmsg(sysarg,"经验玉指针错误",ttFlyTip)
        return false
    end
	
	--判断是否是非法值
    if nType < 1 or nType > #JunHunPingCfg.rate then
        return
    end
	
	if 5453 ~=Item.getItemId(itemPtr)then --传过来的物品不能错
		return 
	end
	
	--判断这个军魂值是否是满了    
	local nValue = 0
	local nDua = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,nValue)
	
	if nDua <= 0 then
		return
	end	
	
	local itemId = Item.getItemProperty(sysarg,itemPtr,0,nValue)	
	local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
	--满了才能使用
	if nDua < maxDua then
		--Actor.sendTipmsg( sysarg,Lang.Activity.w00125,256 )
		Actor.sendTipmsg(sysarg,"军魂瓶还未满，不能使用",ttFlyTip)
		return
	end
	
	
	--判断身上的钱够不够
	if nType~=1 then 
		if Actor.getMoneyCount(sysarg,3)<JunHunPingCfg.rate[nType][2] then
			Actor.sendTipmsg(sysarg,"元宝不够", ttFlyTip) 
			return
		end
	end
	if Item.removeItem(sysarg,itemPtr,1,"使用军魂瓶",LogIds.JunGuPingUse) then
	
		Actor.changeMoney(sysarg,3,-JunHunPingCfg.rate[nType][2],2404,JunHunPingCfg.rate[nType][1].."倍军魂瓶奖励")
		
		--给军魂值
		local var = Actor.getStaticVar(sysarg)
		if var.JunGuZhi ==nil then  var.JunGuZhi =0 end
		if var.JunGuZhi<=0 then var.JunGuZhi=0 end 
		var.JunGuZhi= var.JunGuZhi+JunHunPingCfg.addJunHunZhi*JunHunPingCfg.rate[nType][1]
		--发送成功的结果
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGetJunHunPingAward)
		DataPack.flush(netPack)
		
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", JunHunPingCfg.addJunHunZhi*JunHunPingCfg.rate[nType][1], "军魂值"), 1);
		
		--刷新军魂值
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSendJunGuInfo)
		DataPack.writeUint64(netPack,var.JunGuZhi)
		DataPack.flush(netPack)
	end
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetJunGuInfo, GetJunGuInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetJunHunPingAward, GetJunHunPing)


--用于测试
--@func addjunguzhi 100000000000
function addjunguzhi(sysarg,n)
	n =tonumber(n)
	local var = Actor.getStaticVar(sysarg)
	if var.JunGuZhi ==nil then  var.JunGuZhi =0 end
	if var.JunGuZhi<=0 then var.JunGuZhi=0 end 
	var.JunGuZhi = n
	SendJunGuInfo(sysarg)
end

--用于测试
function addjunhunping(sysarg,nValue)
	if not LocalDT.GmRequire(sysarg) then return end
	nValue = LocalDT.GmReadNumber(sysarg, "addjunhunping", nValue)
	if nValue == nil then return end
	nValue = math.min(nValue, Item.getItemPropertyById(5453, Item.ipItemStaticDuaMax))
	local canUseItemPrt=nil
	local canUseItemMaxDura =-1
	local bagCount = Item.getBagItemCount(sysarg)
	for i=1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
		if itemPrt then 
			if 5453 ==Item.getItemId(itemPrt)then 
				local nDua = Item.getItemProperty(sysarg,itemPrt,Item.ipItemDua)
				if nDua>canUseItemMaxDura and  nDua<Item.getItemPropertyById(5453, Item.ipItemStaticDuaMax) then --寻找最多的，并且是没有满的那个增加
					canUseItemMaxDura = nDua
					canUseItemPrt = itemPrt
				end
			end
		end
	end
	if canUseItemPrt~=nil then 
		Item.setItemDura(sysarg,Item.getItemGuid(canUseItemPrt),nValue)
		Actor.sendTipmsg(sysarg, string.format("军魂瓶已设置为 %d", nValue), ttFlyTip)
	else
		Actor.sendTipmsg(sysarg, "背包没有未满的军魂瓶", ttFlyTip)
	end			
end