--#include "data\config\treasureTrove\treasureTrove.lua" once
--#include "data\functions\GlobalDefine.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--初始化宝藏宝箱
function InitTreasureTrove(sysarg,debug,tableIndex)
    local sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
    local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)

    local dVar = Actor.getDyanmicVar(sysarg)
    dVar.treasure = {}
    dVar.treasure.up_item = {}
    local item = nil
    local cfg = TreasureTroveCfg[tableIndex]  

	for i=1,3 do 
		local randomNumber = System.getRandomNumber(9)--产生0~8
		randomNumber = randomNumber + 1
		dVar.treasure.up_item[i] = cfg.up_itemEx[i][job][randomNumber].ItemId
	end
	
	
	
	
    --随机八格子装备
    dVar.treasure.grid_item = {}

	
	--随机8个
	for i = 1,4 do
        dVar.treasure.grid_item[i] = cfg.grid_itemEx[System.getRandomNumber(14)+1].ItemId
    end

    for i = 5,cfg.grid_count do
        dVar.treasure.grid_item[i] = cfg.grid_itemEx[System.getRandomNumber(#cfg.grid_itemEx)+1].ItemId
    end
	
	--随机打乱算法，概率为1的总是排在前面
	for i=1,7 do 
		local  randoms = i+System.getRandomNumber(9-i)
		dVar.treasure.grid_item[i],dVar.treasure.grid_item[randoms] = dVar.treasure.grid_item[randoms],dVar.treasure.grid_item[i]
	end
	
	
    dVar.treasure.count = 1 --点击次数
    dVar.treasure.tableindex = tonumber(tableIndex)
   
        --免费领取的一个
    local index  = System.getRandomNumber(100+1)
    if index <= 0 then
		index = 1
	end
    if index <= 80 then
         dVar.treasure.free = cfg.free[1].count
         dVar.treasure.freetype = 1 
    else
        
        dVar.treasure.free = cfg.free[math.random(2,table.getn(cfg.free))].id
        dVar.treasure.freetype = 2
    end
    if debug == nil then
        SendTreasureTroveInfo(sysarg,0,tableIndex)

    end
    

    
 
end



--
--index 掉落道具索引
function SendTreasureTroveInfo(sysarg,index,tableIndex)
    if index == nil then index = 0 end
     local dVar =  Actor.getDyanmicVar(sysarg)
    if tableIndex == nil then
        tableIndex = dVar.treasure.tableindex
    end
    local cfg = TreasureTroveCfg[tableIndex]
   
    local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sTreasureTroveInfo)
    --上方三个
    DataPack.writeByte(netPack,cfg.up_count)
    for i = 1,cfg.up_count do
       
        if  dVar.treasure.up_item[i] ~= nil then
             DataPack.writeUInt(netPack,  dVar.treasure.up_item[i])
        else
            DataPack.writeUInt(netPack,0)
        end
      
    end
    --下方八个
    DataPack.writeByte(netPack,cfg.grid_count)
    for i = 1,cfg.grid_count do
       DataPack.writeUInt(netPack,  dVar.treasure.grid_item[i])
    end

   
    --可领取次数
    DataPack.writeByte(netPack,dVar.treasure.count)
    DataPack.writeByte(netPack,index)
    DataPack.writeByte(netPack,dVar.treasure.freetype )
    DataPack.writeUInt(netPack, dVar.treasure.free)
    --DataPack.writeByte(netPack,tableIndex)
	DataPack.flush(netPack)    
end

--摇取宝藏
function OnGetTreasureTrove(sysarg,msgid,packet,debug)
    local dVar =  Actor.getDyanmicVar(sysarg) 
    if dVar.treasure == nil then dVar.treasure = {} end
    dVar.treasure.give = nil
   
    local tableindex =  dVar.treasure.tableindex
    if tableindex == nil or tableindex > table.getn(TreasureTroveCfg) then
        return
    end
    local cfg = TreasureTroveCfg[tableindex]
    if dVar.treasure.count > table.getn(cfg.extract) then
         Actor.sendTipmsg(sysarg, "领取次数已满!!", ttFlyTip)
        return
    end
   
    if dVar.treasure.count > 1 then --第一次免费

        if cfg.extract[dVar.treasure.count] == nil then 
            return
        end
        local needMoney = cfg.extract[dVar.treasure.count].money
        if Actor.getMoneyCount(sysarg,mtYuanbao) < needMoney then
             Actor.sendTipmsg(sysarg, "元宝不足,无法领取!", ttFlyTip)
            return
        end

         --扣除金钱
         Actor.changeMoney(sysarg,mtYuanbao,-needMoney,1143,"摇取宝藏箱"..dVar.treasure.count)
         dVar.treasure.give = true
    else 
        --第一次
        if dVar.treasure.count == 1 then
            dVar.treasure.give = true
        end
    end
    


	--判断第几个的

	--建个中间表
	local tempTable = {}
	for i=1,cfg.grid_count do 	
		tempTable[i]={}
		tempTable[i].id=dVar.treasure.grid_item[i]

		tempTable[i].probability=GetProbabilityFromId(sysarg,tempTable[i].id,tableindex)
	end
	--排序的算法,概率最小的排前面，先算最少基率的
	function comps(a,b)
		return a.probability > b.probability
	end
	table.sort(tempTable,comps);
  
	--算取得中间表的哪个
	local index = 0 
	for i=1,cfg.grid_count do 
		if System.getRandomNumber(tempTable[i].probability)==0 then 
			index = i

			break
		end
	end
	
	--由中间表的itemid取得显示表的索引
	for i=1,cfg.grid_count do 
		if dVar.treasure.grid_item[i] == tempTable[index].id then 
			dVar.treasure.nIndex = i
		end
	end
	
	
	if dVar.treasure.nIndex <= 0 then
		dVar.treasure.nIndex = 1
	end
    if debug == nil then 
         local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetTreasureTrove)
        DataPack.writeByte(netPack,dVar.treasure.nIndex)
        DataPack.flush(netPack)   
    end

end

--用作知道id取得概率
function GetProbabilityFromId(sysarg,id,tableindex)
    id = tonumber(id)
    local cfg = TreasureTroveCfg[tableindex]
	for i=1,#cfg.grid_itemEx do 
		if id == cfg.grid_itemEx[i].ItemId then 
			return cfg.grid_itemEx[i].probability
		end
	end
   
    local njob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
   -- print("id:"..id..",njob:"..njob)
	for j=1,3 do 
		for i=1,#cfg.up_itemEx[j][njob] do 
			if id == cfg.up_itemEx[j][njob][i].ItemId then
                
				return cfg.up_itemEx[j][njob][i].probability
			end
		end
	end
end

--抽取奖励
function OnTreasureTrove(sysarg,msgid,packet,debug)
    local dVar =  Actor.getDyanmicVar(sysarg) 
    local tableindex = dVar.treasure.tableindex
    if tableindex == nil or tableindex > table.getn(TreasureTroveCfg) then
        return
    end
   
    local cfg = TreasureTroveCfg[tableindex]
 
    --print("摇取奖励次数:"..dVar.treasure.count)
    if dVar.treasure.count == nil   then
         Actor.sendTipmsg(sysarg, "领取幸运转转箱数量为0,无法领取!", ttFlyTip)
         return 
    end
    local actorID = Actor.getUIntProperty(sysarg,PROP_ENTITY_ID)
    local str = ""
    local sItemName = ""
--    if dVar.treasure.count > table.getn(TreasureTroveCfg.extract) then
--         Actor.sendTipmsg(sysarg, "领取次数已满!!", ttFlyTip)
--        return
--    end
 
    if dVar.treasure.count == 1 then
         dVar.treasure.give = true
    end
    if dVar.treasure.give == nil then
        Actor.sendTipmsg(sysarg, "领取幸运转转箱数量为0,无法领取!!", ttFlyTip)
        return
    end
    local retdebug = ""
   
    if dVar.treasure.count == 1 then --第一次免费领奖
       
        if dVar.treasure.freetype == 1 then
            
            Actor.changeMoney(sysarg,mtCoin,dVar.treasure.free,1143,"OnTreasureTrove free")
            Actor.sendTipmsg(sysarg, "获得金币:"..dVar.treasure.free, ttFlyTip)
			--System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家,开启幸运转转箱,获得金币+%s",Actor.getName(sysarg),dVar.treasure.free),ttChatWindow)
            if debug ~= nil then
                retdebug = "金币:"..dVar.treasure.free
            end
        else
        
            if Item.getBagEmptyGridCount(sysarg) > 0 then
                Actor.addItem(sysarg,dVar.treasure.free,0,0,1,0,0,"领取宝藏",GameLog.treasure)
                sItemName = Item.getItemName(dVar.treasure.free)
                Actor.sendTipmsg(sysarg, "领取"..sItemName.."!", ttFlyTip)
            else
            --发到邮箱
              
                local str =dVar.treasure.free..",1,0"
                System.AddMail(actorID,6,0,"幸运转转箱抽取","宝藏抽取奖励",0,0,str)
                Actor.sendTipmsg(sysarg, "【"..sItemName.."】已发送到邮件中,请注意查收", ttFlyTip)
			end
			--System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家,开启幸运转转箱,获得%s",Actor.getName(sysarg),Item.getItemLinkMsg(dVar.treasure.free)),ttChatWindow)
            if debug ~= nil then
                retdebug = "道具:"..sItemName
            end
            
        end 

       
        dVar.treasure.count = dVar.treasure.count + 1
        if debug == nil then 
            SendTreasureTroveInfo(sysarg)
        end
        
        dVar.treasure.give = nil
        if debug ~= nil then
            return retdebug
        end
        return
    end
   

    local index = dVar.treasure.nIndex
    local awardItem = dVar.treasure.grid_item[index]
     sItemName = Item.getItemName(awardItem)
    for i = 1,cfg.up_count do
        if dVar.treasure.up_item[i] ~= nil then
            dVar.treasure.grid_item[index] = dVar.treasure.up_item[i]
            dVar.treasure.up_item[i] = nil
            break
        end
    end
    
     local nLingLi = cfg.extract[dVar.treasure.count].awards[1].count
     Awards.Give(sysarg,cfg.extract[dVar.treasure.count].awards,817,"宝藏宝箱")
     --给予道具奖励
     --背包不够空间就发到邮箱
     local bind = 0
     local btTaoStrong = LocalDT.IsFixedTaoStrongEquipment(awardItem) and 6 or 0
     if Item.getBagEmptyGridCount(sysarg) > 0 then
        Actor.addItem(sysarg,awardItem,0,0,1,bind,0,"领取宝藏",GameLog.treasure,-1,0,-1,1,btTaoStrong)
        Actor.sendTipmsg(sysarg, "领取<"..sItemName..">战将灵力值+"..nLingLi.."!", ttFlyTip)
     else
       
        --发到邮箱
         actorID = Actor.getUIntProperty(sysarg,PROP_ENTITY_ID)
        str =awardItem..",1,"..bind..","..btTaoStrong
        System.AddMail(actorID,6,0,"幸运转转箱抽取","宝藏抽取奖励",0,0,str)
        Actor.sendTipmsg(sysarg, "【"..sItemName.."】已发送到邮件中,请注意查收", ttFlyTip)
     end
      
     dVar.treasure.count = dVar.treasure.count + 1
	 if not (awardItem== 421 or awardItem== 422 or awardItem== 423) then 
		System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家,开启幸运转转箱,获得%s 战将灵力值+"..nLingLi,Actor.getName(sysarg),Item.getItemLinkMsg(awardItem)),ttChatWindow)
     end
	 dVar.treasure.give = nil
     --更新
     if debug == nil then 
        SendTreasureTroveInfo(sysarg,index)
        return
     end
     
     return "道具:<"..sItemName..">"
end

