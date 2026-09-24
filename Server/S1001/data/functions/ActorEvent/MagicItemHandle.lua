--lua script
--处理法宝系统相关的操作

--#include "data\config\item\MagicItem.lua" once --


MagicItemOpId = 
{
	enUpgrade = 1,		--注入经验
	enBreakDown = 2,		--法宝分解
	enGetHuntData = 3,	--获取猎魔数据
	enHunting = 4,		--进行猎魔
	
}

MagicItemOpFuncList = {}

EventCallDispatcher.HandlerMagicItemOp = function (sysarg, args)
	--print("HandlerMagicItemOp================"..args[1])
	if args[1] == nil then return end   --
	local func = MagicItemOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args)
	end
end


--刷新物品
MagicItemOpFuncList[MagicItemOpId.enUpgrade] = function (sysarg,args)
--[[屏蔽
	local type = args[2]	--注入类型
	
	local config = MagicItems
	if not config then return end
	
	local item = MagicItem.getMagicItem(sysarg)
	if item == nil then return end
	
	local needExp = MagicItem.canAddMagicExp(sysarg, item, true);
	if needExp == 0 then return end
	
	local addValue = 0
	local hasValue = 0--Actor.getIntProperty(sysarg, PROP_ACTOR_MAGICPOWER)
	if type == 1 then
		addValue = config.magicUpgrade
	else
		addValue = hasValue
	end
	
	if needExp < addValue then
		addValue = needExp
	end
	
	if addValue <= 0 or addValue > hasValue then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.magic001, ttFlyTip)
		return
	end
	
	local result = Actor.changeMagicPower(sysarg, -addValue) -- 该接口删除了
	
	if result then
		MagicItem.changeMagicExp(sysarg, item, addValue)
		
		local npack = DataPack.allocPacket(sysarg,48,5)
		if npack == nil then return end
		DataPack.writeByte(npack,1)
		DataPack.flush(npack)
	end
	--]]
end

MagicItemOpFuncList[MagicItemOpId.enBreakDown] = function (sysarg,args)
	local item = MagicItem.getMagicItem(sysarg)
	if item == nil then return end

	local nAddExp = CalcMagicItemBreadDownExp(sysarg)
	if nAddExp <= 0 then return end
	
	local sAskMsg = string.format(Lang.ScriptTips.magic006, Item.getItemLinkMsg(Item.getItemId(item),item), nAddExp)
	Actor.messageBox(sysarg,0,0,sAskMsg,Lang.ScriptTips.mt00004.."/OnMagicItemBreadDown",Lang.ScriptTips.mt00005.."/Cancel",nil)
end

function OnMagicItemBreadDown(sysarg)
	local nAddExp = CalcMagicItemBreadDownExp(sysarg)
	if nAddExp <= 0 then return end
	
	if MagicItem.removeMagicItem(sysarg, 867, Lang.LogTips.l00162) ~= true then 
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.magic007, ttFlyTip)
		return
	end
	
	Actor.giveAward(sysarg, 34, 0, nAddExp, 0, 0, 0, 0, 867, Lang.LogTips.l00162)
	
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.magic008, nAddExp), ttFlyTip)
end


function Cancel()

end

function CalcMagicItemBreadDownExp(sysarg)
	local config = MagicItems
	if not config then return 0 end
	
	local item = MagicItem.getMagicItem(sysarg)
	if item == nil then return 0 end
	
	local nQuality = Item.getItemProperty(sysarg, item, Item.ipItemQuality, 0)
	
	local nParam = config.breakDownExp[nQuality] or 0
	
	local nExp = MagicItem.getMagicAllExp(sysarg, item)
	
	local nAddExp = math.floor(nExp * config.breakRate/10000 + nParam)
	
	return nAddExp
end

MagicItemOpFuncList[MagicItemOpId.enGetHuntData] = function (sysarg,args)
	--当前的点亮状态
	local svar = Actor.getStaticVar(sysarg)
	local magicBeadHunt = svar.magicBeadHunt
	if magicBeadHunt == nil or magicBeadHunt < 1 then
		magicBeadHunt = 1	--默认第一个点亮
	end
	local npack = DataPack.allocPacket(sysarg,48,12)
	if npack == nil then return end
	DataPack.writeByte(npack, magicBeadHunt)
	DataPack.flush(npack)
end

--猎魔
MagicItemOpFuncList[MagicItemOpId.enHunting] = function (sysarg,args)
--[[屏蔽
	local id = args[2]	--猎魔人id
	local type = args[3]	--猎魔类型
	
	local configs = MagicItems.huntingBead
	if not configs then return end
	
	local config = nil
	for k, v in pairs(configs) do
		if v.id == id then
			config = v
		end
	end
	
	--当前的点亮状态
	local svar = Actor.getStaticVar(sysarg)
	local magicBeadHunt = svar.magicBeadHunt
	if magicBeadHunt == nil or magicBeadHunt < 1 then
		magicBeadHunt = 1	--默认第一个点亮
	end
	
	local nowHunt = magicBeadHunt
	
	if config == nil then 
		SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
		return 
	end
	
	local hasValue = 0--Actor.getIntProperty(sysarg, PROP_ACTOR_MAGICPOWER)
	if hasValue < config.consume then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.magic003, ttFlyTip)
		SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
		return
	end
	
	local bitPos = id-1
	
	--是否已点亮
	local isHunt = System.getIntBit(magicBeadHunt, bitPos)
	if isHunt ~= 1 then 
		SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
		return 
	end
	
	--是否可以抽珠子
	--需要roll一个物品
	local dropName = "magicbeaddrop_"..tostring(id) --按名字索引的
	local drop = System.getObjectVar(dropName)
	if (not drop) then
		System.trace(" getObjectVar is nil magicbeaddrop_"..id)
		SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
		return
	end
	
	
	local needBag = 0
	local items = drop:proabilityDrop(sysarg)
	if (items.itemCount > 0) then
		for i = items.itemCount - 1, 0, -1 do
			local result = Actor.canGiveAward(sysarg, 
				items.itemList[i].btAwardType,
				items.itemList[i].wItemId, 
				items.itemList[i].btCount,
				items.itemList[i].btQuality,
				items.itemList[i].btStrong,
				items.itemList[i].btBind,
				true)
			needBag = needBag + items.itemList[i].btCount
			if not result then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.magic002, ttFlyTip)
				SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
				return false
			end
		end
	end
	
	--背包
	local bagCount = MagicItem.getMagicBagEmptyGridCount(sysarg)
	if needBag > bagCount then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.magic002, ttFlyTip)
		SendMagicBeadHuntingResult(sysarg, nowHunt, 0, type)
		return
	end
	
	--扣灵力
	local result = Actor.changeMagicPower(sysarg, -config.consume) -- 该接口删除了
	
	--熄灭当前的
	if bitPos ~= 0 then
		nowHunt = System.setIntBit(magicBeadHunt, bitPos, false)
	end
	
	--抽珠子
	if (items.itemCount > 0) then
		for i = 0, items.itemCount -1 do
			Actor.giveAward(sysarg,
				items.itemList[i].btAwardType,
				items.itemList[i].wItemId, 
				items.itemList[i].btCount,
				items.itemList[i].btQuality,
				items.itemList[i].btStrong,
				items.itemList[i].btBind,
				items.itemList[i].nTime,
				863, "roll")  
			
			--公告
			if (items.itemList[i].btAwardType == 33) then
				local name = GetMagicBeadName(items.itemList[i].wItemId, items.itemList[i].btQuality)
				
				local count = items.itemList[i].btCount
				
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.magic004, count, name), ttFlyTip)
				
				if(items.itemList[i].btAuxParam ==1)  then  
					local tipMsg = string.format(Lang.ScriptTips.magic005,Actor.getName(sysarg),count,name)   --要全服广播
					System.broadcastTipmsg(tipMsg,ttScreenCenter)
				end
			end
		end
	end
	
	--点亮更高级
	local props = 0
	local randNum = math.random(10000)
	for k, v in pairs(config.probs) do
		props = props + v.prob
		if randNum <= props then
			nowHunt = System.setIntBit(nowHunt, v.id-1, true)
			break
		end
	end
	
	--
	svar.magicBeadHunt = nowHunt
	
	SendMagicBeadHuntingResult(sysarg, nowHunt, 1, type)
	--]]
end

--下发猎魔结果
function SendMagicBeadHuntingResult(sysarg, hunt, result, type)
	local npack = DataPack.allocPacket(sysarg,48,13)
	if npack == nil then return end
	
	DataPack.writeByte(npack, hunt)
	DataPack.writeByte(npack, result)
	DataPack.writeByte(npack, type)
	DataPack.flush(npack)
end

--获取魔珠名字
function GetMagicBeadName(itemId, quality)
	local beadName = MagicItems.beadName
	local name = Item.getItemName(itemId)
	if not beadName then 
		return name
	end
	
	local shape = Item.getItemPropertyById(itemId, Item.ipItemShape)
	if (shape < 1 or shape > table.getn(beadName)) then
		return name
	end
	
	if (quality < 1 or quality > table.getn(beadName[shape])) then
		return name
	end
	
	return beadName[shape][quality]
end



--初始化按概率综合爆物品 
function InitMagicBeadDrop(sysarg)
	local config = MagicItems.huntingBead
	if not config then return end
	--在初始化的时候全部装载进来 ,避免后期临时去加载
	for k, v in pairs(config) do
		local dropName = "magicbeaddrop_"..tostring(v.id)
		local boxdrop = System.getObjectVar(dropName)
		if (not boxdrop) then
			boxdrop = CBoxDropMgr:getSingleton():createBoxDrop(dropName)  -- 这里会返回一个宝箱掉落对象(CBoxDrop)
		end
		if (boxdrop) then
			boxdrop:load(v.dropName) -- 加载文件里面的物品
		end
	end

end

table.insert(InitFnTable,InitMagicBeadDrop)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMagicItem, EventCallDispatcher.HandlerMagicItemOp)