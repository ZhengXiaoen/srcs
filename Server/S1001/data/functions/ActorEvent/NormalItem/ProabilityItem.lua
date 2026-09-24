--按总概率的方式配置物品

--添加配置
--#include "data/config/item/scriptItemConfig/ProabilityItem.lua" once
--#include "data\functions\Activity\Common\Consumes.lua" once



--[[
--按照总概率Roll物品 
--sysarg:实体的指针
--itemidx: 物品的ID
--itemPtr: 物品的指针
--ItemTable: 配置的参数列表，如果单独调用的话，这里是需要背包格子的数量 
--]]
function ProbablityItemFunc(sysarg,itemidx,itemPtr,ItemTable) 

	if(itemidx == nil) then 
	System.trace ("ProbablityItemFunc itemidx ==nil")
	return 
	end
	--print ("ProbablityItemFunc"..itemidx)

	
	--获取玩家目前有多少个空格子，如果格子不够，就返回 
	local config =ItemTable
	if(config == nil) then 
	System.trace("ProbablityItemFunc config is nill")
	return 
	end
	
	--查看玩家是否已领取过这个唯一道具，如果领取过，就返回
	local var = Actor.getStaticVar(sysarg);
	if var.l == nil then
		var.l = {}
	end
	local l = var.l
	if config.usevar then
		if l[config.usevar] == 1 then
		Actor.sendTipmsg( sysarg, "您已使用过该道具,不能重复使用哦!", 4 );
		return
		end
	end
	--玩家身上的背包格子 
	local count = Item.getBagEmptyGridCount(sysarg)
	local needGridCount=1   --需要背包格子的数量 
	if( config.needMinBagGrid ~= nil) then
	 needGridCount =   config.needMinBagGrid 
	end

	if needGridCount and count < needGridCount then
	local tipMsg = string.format(Lang.ScriptTips.x00074,needGridCount)
	Actor.sendTipmsg( sysarg,tipMsg,ttFlyTip )
	return false
	end

	-- 获取玩家元宝数量
	local nYb =  Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
	local needYb = 0
	if config.needYuanBao ~= nil then
		needYb = config.needYuanBao
		if nYb < needYb then
			Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00205,ttFlyTip )
			return false
		end
		local itemName = Item.getItemName(config.item_id);
		if not Actor.changeMoney(sysarg, 3, -needYb, GameLog.clUseProabilityItem, itemName) then
			local msg = string.format(sysarg,Lang.ScriptTips.x00207, needYb, itemName);
			Actor.sendTipmsg( sysarg, msg, ttFlyTip );
			return false;
		end
	end


	--判断物品需要消耗的数目
	local nNeedItemCount = ItemTable.itemCount
	
	if(nNeedItemCount == nil) then 
		nNeedItemCount =1 
	end
	if( Actor.getItemCount(sysarg,itemidx,-1,-1) < nNeedItemCount) then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00209,ttFlyTip )
		return false
	end

	local consumes = {}
	
	if config.consumes and table.getn(config.consumes) > 0 then
		for k, v in ipairs(config.consumes) do
			table.insert(consumes, v)
		end
	end
	
	local consume = {type = 0, id = itemidx, count = nNeedItemCount}
	table.insert(consumes, consume)
	
	if Consumes.SuccessCheck(sysarg, consumes) ~= successCheckResult.ok then
		return false
	end

	--需要roll一个物品
	local dropName = "proability"..tostring(itemidx) --按名字索引的
	local drop = System.getObjectVar(dropName)
	if (not drop) then
		System.trace("getObjectVar is nil"..itemidx)
		return
	end

	local items = drop:proabilityDrop(sysarg)
	if ( items.itemCount > 0) then
		for i = items.itemCount - 1, 0, -1 do
			local result = Actor.canGiveAward(sysarg, 
				items.itemList[i].btAwardType,
				items.itemList[i].wItemId, 
				items.itemList[i].btCount,
				items.itemList[i].btQuality,
				items.itemList[i].btStrong,
				items.itemList[i].btBind,
				true)
			if not result then
				return false
			end
		end
	end

	--如果需要删除物品的话就删除
	--if (config.needDelete and (Actor.removeItem(sysarg,itemidx,nNeedItemCount,-1,-1,-1,"Roll",2) ~=nNeedItemCount) ) then --删除物品失败 
	local bBind = 1
	local result = successCheckResult.otherLack
	if (config.needDelete) then
		result, bBind = Consumes.OnConsumes(sysarg, consumes, 0, 0, 2, "ProabilityItem Roll")
		if result ~= successCheckResult.ok then
			return false
		end
	end
	
	--[[
	这段代码是用来发公告的tips的，但是测试有问题，暂时留着 
	Item.addItem(sysarg,itemPtr,"roll",1,items.itemList[i].btCount)
		  if(items.itemList[i].btAuxParam ==1)  then
			 local itemDes = Item.getItemLinkMsg(items.itemList[i].wItemId,itemPtr)
			   local tipMsg = string.format(Lang.ScriptTips.x00085,Actor.getName(sysarg),Item.getItemName(itemidx),   itemDes )   --要全服广播
			  System.broadcastTipmsg(tipMsg,ttScreenCenter )
			end
	--]]
		  
	--遍历掉落列表，并添加玩家的物品

	if ( items.itemCount > 0) then
	  local tipMsg = string.format(Lang.ScriptTips.x00208,Actor.getName(sysarg),Item.getItemName(itemidx) ) 
	  
	  local needBoardTable = {6165 , 6166 , 6167 , 6168}
	  local needBoards =false
	  for i=1,#needBoardTable do 
		if itemidx==needBoardTable[i] then 
			needBoards=true
		end
	  end
	  local tip1=""
	  for i=0, items.itemCount -1 do
		if config.infectBind == nil or config.infectBind ~= true then
			bBind = items.itemList[i].btBind
		end
		
		Actor.giveAward(sysarg,
		items.itemList[i].btAwardType,
		items.itemList[i].wItemId, 
		items.itemList[i].btCount,
		items.itemList[i].btQuality,
		items.itemList[i].btStrong,
		bBind,
		items.itemList[i].nTime,
		1,"roll")  
		--print("=====================:"..items.itemList[i].wItemId)
		--if(items.itemList[i].btAuxParam ==0)  then
		local count = items.itemList[i].btCount
		local name = Item.getAwardDesc(items.itemList[i].btAwardType,items.itemList[i].wItemId)
		if(name ~= nil and name ~= "") then
			
			if needBoards==true then 
				if (i==0) then 
					tip1 = tip1..Item.getItemLinkMsg(items.itemList[i].wItemId).."*"..items.itemList[i].btCount.." "
				else 
					tip1 = tip1..","..Item.getItemLinkMsg(items.itemList[i].wItemId).."*"..items.itemList[i].btCount.." "
				end
			end
			if(items.itemList[i].btAwardType == 20) then --按经验表里配置经验的
				count = Actor.getActivityExp(sysarg,items.itemList[i].wItemId,items.itemList[i].btCount,items.itemList[i].btQuality)
			end
			--local tipMsg = string.format(Lang.ScriptTips.x00085,Actor.getName(sysarg),Item.getItemName(itemidx),  name,count )   --要全服广播
			tipMsg = tipMsg ..string.format("<(c0xFF00FF00)%s>*%d!",name,count)
		end
		--end
		
	  end
	  
	  	if needBoards==true then 
			--print(tip1)
			local tip2 = string.format("玩家<(n%s)>,开启了%s,获得"..tip1,Actor.getName(sysarg),Item.getItemLinkMsg(itemidx)) 
			System.broadcastTipmsg(tip2,ttChatWindow)
		end
	  
		if config.needBroadcast == 1 then
			System.broadcastTipmsg(tipMsg,ttScreenCenter )
		end
	end
	if config.usevar then
		if l[config.usevar] == nil or l[config.usevar] ~= 1 then
			l[config.usevar] = 1;
		end
	end
	if itemidx == 929 then
		var.HasGetWeixinGiftFlag = 1
		SendHideWeixin(sysarg)
	end
	


	return true
end

--929 使用一次微信礼包后
--如果领取微信礼包就不下发
function SendHideWeixin(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.HasGetWeixinGiftFlag then
		local pack = DataPack.allocPacket(sysarg,139,131)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
	end
end


--初始化按概率综合爆物品 
function InitProabilityDropItem(sysarg)
	-- 读取"data/config/item/scriptItemConfig/ProabilityItem.lua"的表ProabolityItemConfig
  for i = 1,table.getn(ProabolityItemConfig) do
    local x = ProabolityItemConfig[i]
   
    GlobalItemFn[x.item_id] = { func = ProbablityItemFunc,params =x }
    
    --在初始化的时候全部装载进来 ,避免后期临时去加载
    local dropName = "proability"..tostring(x.item_id)
    local boxdrop = System.getObjectVar(dropName)
	if (not boxdrop) then
		boxdrop = CBoxDropMgr:getSingleton():createBoxDrop(dropName)  -- 这里会返回一个宝箱掉落对象(CBoxDrop)
	end
	if(boxdrop) then
		boxdrop:load(x.dropName) -- 加载文件里面的物品
	end
  end

end

table.insert(InitFnTable,InitProabilityDropItem)