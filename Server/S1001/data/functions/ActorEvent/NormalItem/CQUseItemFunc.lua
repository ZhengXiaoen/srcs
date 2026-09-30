--lua script

--#include "data\functions\Activity\PKChallenge\PKChallengeCommon.lua" once  --´¦ÀípkÌôÕ½ÍË³ö
--#include "data\functions\ExpandFunc\RedActorRelive.lua" once

--×£¸£ÓÍ
function useBlessOilFunc(sysarg,itemidx,itemPtr,ItemTable)

	local weaponPtr = Item.getEquipByType(sysarg, Item.itWeapon);	
	if not weaponPtr then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf047,ttDialog)		
		return;
	end

	local luckVal = Item.getItemProperty(sysarg, weaponPtr, Item.ipItemLuck, 0)		
    
--    local cfg =
--    {
--       {
--            min = 2,
--            max =2,
--            rate = 100,
--       },
--       {
--            min = 6,
--            max = 6,
--            rate =100,
--       },
--       {
--           min = 26,
--           max =26,
--           rate =100,
--       },
--       {
--          min = 86,
--          max = 86,
--          rate =30,
--       },
--       {
--          min = 196,
--          max = 196,
--          rate =20,
--       },
--       {
--          min = 356,
--          max = 356,
--          rate =10,
--       },
--    }
--    if luckVal >= table.getn(cfg) then
--        Actor.sendTipmsg(sysarg, "使用失败,幸运值达到最高级!",ttFlyTip );
--        return
--    end
--    local var = Actor.getStaticVar(sysarg)
--    if var.luckvalue == nil then var.luckvalue = 0 end
--    if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, itemName, itemidx) > 0 then

--        var.luckvalue =  var.luckvalue + 1

--        for i = luckVal + 1 ,table.getn(cfg) do


--            if var.luckvalue >= cfg[i].max then
--                luckVal = luckVal + 1
--                var.luckvalue = cfg[i].max
--                break
--            end
--        end

--    end
--    if  Item.getItemProperty(sysarg, weaponPtr, Item.ipItemLuck, 0) == luckVal then
--        Actor.sendTipmsg(sysarg, "很抱歉,您的武器祝福失败..",ttFlyTip );
--        return
--    end
--    Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, luckVal);
--    Actor.sendTipmsg(sysarg, "祝福成功,当前幸运值:"..luckVal,ttFlyTip );
-- 武器最高幸运7


	if ItemTable.type == 1 then
		if luckVal >= 7 then
			local itemName = Item.getItemName(ItemTable.item_id)			
			if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, itemName, itemidx) > 0 then
				local zNum = math.random(1,100);
				if zNum <= 20 then
					Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, luckVal - 1);
					Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf043, 128);
				end
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf042, 128);
			end
		else
			local itemName = Item.getItemName(ItemTable.item_id)	
			if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, itemName, itemidx) > 0 then
				local zNum = math.random(1,100);
				local rNum = math.random(1,100);
				local jilv = {{0,50},{1,70},{2,90},{3,95},{4,96},{5,100},{6,100}};
				for i = 1,#jilv do
					if luckVal <= jilv[i][1] then
						if zNum >= jilv[i][2] then
                            Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, luckVal + 1);
                            Actor.sendTipmsg(sysarg,"恭喜您的武器幸运值+1",ttFlyTip)
							Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf041, 128)
						else
							if rNum <= 40 then
                                if luckVal - 1 >= 3 then
                                    Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, luckVal - 1);
                                    Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf043, 128);
                                    Actor.sendTipmsg(sysarg,"很遗憾，您的武器被诅咒了!",ttFlyTip)
                                else
                                    Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf042, 128);
                                     Actor.sendTipmsg(sysarg,"您的武器没有变化!",ttFlyTip)
                                end
								
								
							else
								Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf042, 128);
                                Actor.sendTipmsg(sysarg,"您的武器没有变化!",ttFlyTip)
							end
						end
						break;
					end
				end
			end
		end
		return true;
	end
	if ItemTable.type == 2 then
		if luckVal >= 7 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf055, 128);
			return;
		else
			local itemName = Item.getItemName(ItemTable.item_id)	
			if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, itemName, itemidx) > 0 then
				Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, 7);
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf041, 128);
			end
		end
		return true;
	end
	if ItemTable.type == 3 then
		if luckVal >= 7 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf068, 128);
			return;
		else
			local itemName = Item.getItemName(ItemTable.item_id)	
			if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, itemName, itemidx) > 0 then
				Item.setItemProperty(sysarg, weaponPtr, Item.ipItemLuck, luckVal+1);
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf041, 128);
			end
		end
		return true;
	end
end

-- 使用传送物品
function BackToCityFunc(sysarg,itemidx,itemPtr,ItemTable,delType)

	if not Actor.canUseItem(sysarg,itemidx) then
		Actor.sendTipmsg( sysarg, Lang.ScriptTips.x00043,ttTipmsgWindow )
		return
	end
    --困住状态
	--[[if Actor.hasState(sysarg,esStateDongFang) then 
        Actor.sendTipmsg( sysarg, Lang.ScriptTips.x00043,ttTipmsgWindow )
		return
    end]]--
	if Actor.IsInFB(sysarg) then
		Actor.sendTipmsg( sysarg, Lang.ScriptTips.fb00007, ttFlyTip)
		return
	end
	
	-- 是否在押镖
	if Actor.getIsDartFlag(sysarg) ~= 0 then
		Actor.sendTipmsg( sysarg, Lang.Activity.g00031,ttFlyTip )
		return
	end
	
	-- 如果在采集状态则中断它
	Actor.breakGatherState(sysarg)

	--delType = 0直接删除，1扣除数量
	local delCount = 0
	--if ItemTable.type ~= 4 then --传送石另外处理
		if delType == 0 then
			delCount = Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00112, 2)
		elseif delType == 1 then
			delCount = Item.removeItemDura(sysarg, itemPtr, 1, Lang.LogTips.l00112, 2, true)
			--print("it is ok!!!!!!!!!" ,delCount)
		end
		
		if delCount < 1 then
			--Actor.sendTipmsg( sysarg, "Can use the number is 0, the use of failure..",256 )
			delCount = Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00112, 2)
			return false
		end
	--end

	local nCurDua = Item.getItemProperty(sysarg,itemPtr,19)	
	local oldSceneId = Actor.getSceneId(sysarg)
	local sendType = ItemTable.type or 2
	if sendType == 1 then
		if GlobalConfig.nEnterJailPkValue >= 0 then

			--if TranRedActorToRedSceen(sysarg,true) == true then
			
			if Actor.getUIntProperty(sysarg,PROP_ACTOR_PK_VALUE) >= GlobalConfig.nEnterJailPkValue then
				local RedNameC = {id = 5, x = 328, y = 362};	
				System.telportScene(sysarg, RedNameC.id, RedNameC.x, RedNameC.y);
			else
				System.telportScene(sysarg, ItemTable.SceneId, ItemTable.x, ItemTable.y)
			end
		--else	
		--	System.telportScene(sysarg, ItemTable.SceneId, ItemTable.x, ItemTable.y)  --最好不要这样写，这是当红名会传到别的地方的
		end
	elseif sendType == 2 then				-- 随机传送
		System.telportRandPos(sysarg)
		--Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf253,nCurDua/1000),ttTipmsgWindow)
	elseif sendType == 3 then				-- 回城
	
		-- if GlobalConfig.nEnterJailPkValue >= 0 then
		-- 	--if TranRedActorToRedSceen(sysarg,true) == true then
		-- 	if Actor.getUIntProperty(sysarg,PROP_ACTOR_PK_VALUE) >= GlobalConfig.nEnterJailPkValue then
		-- 		local RedNameC = {id = 5, x = 328, y = 362};
		-- 		System.telportScene(sysarg, RedNameC.id, RedNameC.x, RedNameC.y);			
		-- 	else
		-- 		Actor.returnCity(sysarg);
		-- 	end
		-- 	--end
		-- else
		-- 	Actor.returnCity(sysarg);
		-- end
		---现在没有配置红名村 全部回主城
		Actor.returnCity(sysarg);
		
		-- if oldSceneId == 142 then
		-- 	Actor.updateActorName(sysarg)
		-- elseif oldSceneId ==  StdActivity[6].lowSceenId or oldSceneId == 171 then
		-- 	OnAddPet(sysarg)
		-- end
		
		--Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf150,nCurDua/1000),ttTipmsgWindow)
	elseif sendType == 4 then				-- 传送石
		-- 打开传送NPC界面
		--print("打开传送NPC界面");
		--local strText = NpcDialog[261].main(sysarg)
		--Actor.openDialogs(sysarg, diMemoDia, strText);
		
		--打开传送员的NPC面板
		local svar = System.getDyanmicVar()
		svar.useChuanSongStone=1
		
		local netPack = DataPack.allocPacket(sysarg, 0, 11)
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt64(netPack, 0)-- 更新数据的类型
		DataPack.writeString(netPack,GetNpcChuanSongYuan().main(sysarg))
		DataPack.flush(netPack)
	elseif sendType == 5 then
		local HGdata = {
			{mapid = 286, jl = 10, mon = {
				{id = 635, num = 1},
			},},
			{mapid = 285, jl = 9, mon = {
				{id = 634, num = 50},
				{id = 664, num = 1},
			},},
			{mapid = 284, jl = 9, mon = {
				{id = 633, num = 50},
				{id = 663, num = 1},
			},},
			{mapid = 283, jl = 8, mon = {
				{id = 632, num = 50},
				{id = 662, num = 1},
			},},
			{mapid = 282, jl = 6, mon = {
				{id = 631, num = 50},
				{id = 661, num = 1},
			},},
			{mapid = 281, jl = 4, mon = {
				{id = 630, num = 50},
				{id = 660, num = 1},
			},},
			{mapid = 280, jl = 3, mon = {
				{id = 629, num = 50},
				{id = 659, num = 1},
			},},
			{mapid = 279, jl = 1, mon = {
				{id = 628, num = 50},
				{id = 658, num = 1},
			},},
		};
		local rannum = 0;
		for i = 1,#HGdata do
			rannum = math.random(1, HGdata[i].jl);
			if rannum == HGdata[i].jl then
				System.telportScene(sysarg, HGdata[i].mapid, -1, -1);
				Actor.deleteTimer(sysarg, 28);
				set_d_val(sysarg,12,1800); --定时器记时用
				Actor.addTimer(sysarg, 28, 5000 ); --每5秒1判断，顺带给玩家提示倒计时
				if HGdata[i].mapid == 286 then
					Actor.sendTipmsg(sysarg,"恭喜您进入到了真荒古之地!\\荒古战将之神必掉战将灵力丹(中)3-5个，30%概率掉战将灵力丹(大)1-2个；另有高概率掉落战将装备.",4);
				end
				local SceneName = Fuben.getSceneNameById(HGdata[i].mapid);
				local ScenePtr = Actor.getScenePtr(sysarg);  --用这个的话，有可能人没有传过去，然后说怪物突然被清了
				local Sceneptr2 = Fuben.getSceneById(HGdata[i].mapid)
				--if ScenePtr~=Sceneptr2 then 	
				--	print("111111")
				--else 
				--	print("2222222")
				--end
				
				local SceneHandle = Fuben.getSceneHandleById(HGdata[i].mapid);
				if HGdata[i].mapid == 286 then
					if Fuben.getLiveMonsterCount(SceneHandle, 635) > 1 then
						Fuben.clearSceneAllMonsters(Sceneptr2, -1); --清理当前地图所有类型怪物
						--真荒古保持最多可2只BOSS
					end
				else
					Fuben.clearSceneAllMonsters(Sceneptr2, -1); --清理当前地图所有类型怪物
				end
				for k = 1,#HGdata[i].mon do
					local mondata = HGdata[i].mon;
					Fuben.createMonsters(SceneHandle, mondata[k].id, 72, 80, 59, mondata[k].num, 0);
				end
				if HGdata[i].mapid == 286 then
					System.broadcastTipmsg(string.format("[<(n%s)>]进入了<(c0xFFdb1313)真荒古之地>,可喜可贺..", Actor.getName(sysarg)), 128);
				else
					System.broadcastTipmsg(string.format("[<(n%s)>]进入了<(c0xFFdb1313)荒古之地>.", Actor.getName(sysarg)), 128);
				end
				break;
			end
		end


	end
	return true;
end

function repairAllEquipItemFunc(sysarg,itemidx,itemPtr,ItemTable)
	local repairTabEquip = {}
	local repairTabMaxDua = {}
	local equipCount = Item.getEquipCount( sysarg )  --Íæ¼Ò´©×Å×°±¸Êý
	for i = 1, equipCount do
		local equipPtr = Item.getEquipBySortID( sysarg, i )
		if equipPtr then
			local itemId = Item.getItemId(equipPtr)
			local isDenyRepair = Item.isDenyRepair(itemId)
			if isDenyRepair == false then
				local curDua = Item.getItemProperty( sysarg, equipPtr, Item.ipItemDua, 0 )
				local maxDua = Item.getItemProperty( sysarg, equipPtr, Item.ipItemDuaMax, 0 )
				if curDua < maxDua then
					table.insert(repairTabEquip, equipPtr)
					table.insert(repairTabMaxDua, maxDua)
				end
			end
		end
	end
	local msgId = Lang.ScriptTips.zf045
	if #repairTabEquip > 0 then
		if ItemTable.needDelete then
			if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00111, 9) <= 0 then
				return
			end
		end
		for idx, equipPtr in ipairs(repairTabEquip) do
			Item.setItemProperty( sysarg, equipPtr, Item.ipItemDua, repairTabMaxDua[idx] )
		end
		msgId = Lang.ScriptTips.zf044
	end
	Actor.sendTipmsg(sysarg, msgId, ttFlyTip)
end

function PackSmallRose( sysarg, itemidx,itemPtr,ItemTable)
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	local needGrid = Item.getAddItemNeedGridCount(sysarg, ItemTable.destId, ItemTable.destCount)
	if bagIdxs < needGrid then
		local noticeStr = string.format(Lang.ScriptTips.zf060, needGrid)
		Actor.sendTipmsg(sysarg, noticeStr, ttScreenCenter)
		return
	end
	local bindFlag = Item.getItemProperty(sysarg, itemPtr, Item.ipItemBind, 0)        --°ó¶¨
	if Actor.removeItemByPtr( sysarg, itemPtr, 1, true, "pack rose", 5 ) > 0 then
		Actor.addItem(sysarg, ItemTable.destId, 0, 0, ItemTable.destCount, bindFlag)
		local destItName = Item.getItemName(ItemTable.destId)
		local noticeStr = string.format(Lang.ScriptTips.c000057, destItName)
		Actor.sendTipmsg(sysarg, noticeStr, ttScreenCenter)
	end
end

function UseItemGetBuff(sysarg,itemidx,itemPtr,ItemTable)
	if Actor.removeItemByPtr( sysarg, itemPtr, 1, true, Lang.LogTips.l00141, 860 ) > 0 then
		for k, v in ipairs(ItemTable.buffs or {}) do
			Actor.addBuff(sysarg,v.buffType,v.buffGroup,v.value, v.times, v.interval,v.buffName,v.timeOverlay) --Ìí¼Óbuff
		end
		return true
	end
	return false
end

function UseItemReleaseSkill(sysarg,itemidx,itemPtr,ItemTable)
	if Actor.removeItemByPtr( sysarg, itemPtr, 1, true, Lang.LogTips.l00142, 860 ) > 0 then
		local x,y =	Actor.getEntityPosition(sysarg, 0, 0);
		Actor.useSkill(sysarg, ItemTable.skillId, x, y, false, ItemTable.skillLevel)
		return true
	end
	return false
end

function UseMagicShapeItem(sysarg,itemidx,itemPtr,ItemTable)
    local nMagicShapeId = Actor.getMagicShapeId(sysarg)
    
    local dVar = Actor.getDyanmicVar(sysarg)
    if nMagicShapeId > 0 then
        if dVar.magicshapeser ~= nil then
             local pItemPtr = Item.getBagItemPtrByGuid(sysarg,dVar.magicshapeser)
             if pItemPtr ~= nil  then
                local nItemId = Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID)
               
                if nItemId == ItemTable.item_id and dVar.magicshapeser ~= Item.getItemGuid(itemPtr) then 
                     Actor.sendTipmsg(sysarg,"您已使用了同样的幻形水晶，使用失败。",ttFlyTip)
                    return
                end

             end
        end
       
        for i = 1,#MagicShapeItem do
            if MagicShapeItem[i].shapeid == nMagicShapeId then
                for j= 1,#MagicShapeItem[i].addbuffid do
                    Actor.delBuffById(sysarg,MagicShapeItem[i].addbuffid[j])
                end
                break
            end
        end
    end
    if nMagicShapeId == ItemTable.shapeid then
        Actor.setMagicShapeId(sysarg,0)
        Actor.collectOperate(sysarg,1)
         dVar.magicshapeser = 0
        return true
    end
    if Item.getItemLeftTime(itemPtr) == 0 then
        Item.setItemLeftTime(sysarg,itemPtr,ItemTable.lefttime)
    end
     
    local nSec =  (Item.getItemLeftTime(itemPtr) - System.getCurrMiniTime()) 
    if nSec >= 0 then 
       for j = 1,#ItemTable.addbuffid do
            Actor.addBuffById(sysarg,ItemTable.addbuffid[j],nSec)
       end
        
    end
  
 
    
    Actor.setMagicShapeId(sysarg,ItemTable.shapeid)
    Actor.collectOperate(sysarg,1)
    Actor.sendTipmsg(sysarg,"已使用"..ItemTable.name.."!",ttFlyTip)
   
    dVar.magicshapeser = Item.getItemGuid(itemPtr)
 
    return true
end
--³õÊ¼»¯ÎïÆ·Ê¹ÓÃÊ±»Øµ÷
function CQUseItemFunc_Init(sysarg)
	for idx, x in ipairs(BlessOil) do
		GlobalItemFn[x.item_id] = {func = useBlessOilFunc,params = x}
	end
	for idx, v in ipairs(BackToCity) do
		GlobalItemFn[v.item_id] = {func = BackToCityFunc,params = v}
	end
	for i = 1,table.getn(RepairItems) do
		local x = RepairItems[i]
		GlobalItemFn[x.item_id] = { func = repairAllEquipItemFunc, params = x }
	end
	for idx, v in ipairs(RosePack) do
		GlobalItemFn[v.item_id] = {func = PackSmallRose, params = v}
	end
	for idx, v in ipairs(UseGetBuff) do
		GlobalItemFn[v.item_id] = {func = UseItemGetBuff,params = v}
	end
	for idx, v in ipairs(UsedUseSkill) do
		GlobalItemFn[v.item_id] = {func = UseItemReleaseSkill, params = v}
	end

    for idx, v in ipairs(MagicShapeItem) do
		GlobalItemFn[v.item_id] = {func = UseMagicShapeItem, params = v}
	end
end

table.insert(InitFnTable, CQUseItemFunc_Init)