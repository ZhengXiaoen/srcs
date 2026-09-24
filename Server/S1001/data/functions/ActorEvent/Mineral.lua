--采矿系统
--#include "data\config\ActorEvent\MineralCfg.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ZhanWuShuang.lua" once

function MineralSystem(sysarg, sysid,packet)
	local TypeID = DataPack.readByte(packet)
	if TypeID == 1 then 
		ClickTheMineral(sysarg)
	elseif TypeID == 2 then 
		GetMineralFunc(sysarg)
	elseif TypeID == 3 then 
		SellMineralFunc(sysarg,1)
	elseif TypeID == 4 then 
		MakeStoneByMineralFunc(sysarg)
	elseif TypeID == 5 then 
		AutoSell(sysarg,packet)
	elseif TypeID == 6 then --停止挖矿的状态
		Actor.removeState(sysarg,15)
		Actor.collectOperate(sysarg,1)
	elseif TypeID == 7 then --自动合成
		AutoChange(sysarg,packet)
	elseif TypeID == 8 then --双倍收益
		ActityDoubleIncome(sysarg)
	end
end
--双倍收益
function ActityDoubleIncome(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.doubleWK ==nil then 
		var.doubleWK = 0
	elseif var.doubleWK <0 then 
		var.doubleWK = 0
	end
	if var.doubleWK>=43200 then 
		Actor.sendTipmsg(sysarg,"购买超过限制",ttFlyTip)
		return 
	end
	
	if Actor.changeMoney( sysarg, 3, -198, 2660, "wakuangDouble") then
		var.doubleWK = var.doubleWK + 3600
		Actor.deleteTimer(sysarg,34)
		Actor.addTimer(sysarg,34,1000)
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
		DataPack.writeByte(netPack, 6)--双倍的时间
		DataPack.writeInt(netPack,var.doubleWK) 
		DataPack.flush(netPack)
	else
		Actor.sendTipmsg(sysarg,"元宝不足,购买失败",ttFlyTip)
	end
end


--第一次点击矿石
function ClickTheMineral(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.firstMineralTime = System.getCurrMiniTime()
	if Actor.hasState(sysarg,15)==false then 
		Actor.addState(sysarg,15)
		Actor.collectOperate(sysarg,1)
	end
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
	DataPack.writeByte(netPack, 1)--第一次挖
    DataPack.writeInt(netPack,MineralCfg.MineralTime) --挖矿间隔时间
	DataPack.flush(netPack)
--    dVar.Mineral={}
--    for i = 1,table.getn(MineralCfg.Stone) do
--        dVar.Mineral[i] = 0 
--    end
--    dVar.StrongItemTick = System.getTick()
 --   dVar.StartMineralTime =  System.getCurrMiniTime()
 
 
	--下发双倍收益数据
 	local var = Actor.getStaticVar(sysarg)
 	if var.doubleWK ==nil then 
		var.doubleWK = 0
	elseif var.doubleWK <0 then 
		var.doubleWK = 0
	end
	Actor.deleteTimer(sysarg,34)
	Actor.addTimer(sysarg,34,1000)
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
	DataPack.writeByte(netPack, 6)--双倍的时间
	DataPack.writeInt(netPack,var.doubleWK) --挖矿间隔时间
	DataPack.flush(netPack)
	
end

--时间满了得到矿石
function GetMineralFunc(sysarg)

	--控制时间，防止外挂。
	local dVar = Actor.getDyanmicVar(sysarg)
	if 	dVar.firstMineralTime ==nil then 
		return 
	end
	--判断是否是外挂
   
    if Actor.getSceneId(sysarg) ~= 343 then
        System.trace("外挂挖矿."..Actor.getName(sysarg))
        return
    end
	local var = Actor.getStaticVar(sysarg)
 	if var.doubleWK ==nil then 
		var.doubleWK = 0
	elseif var.doubleWK <0 then 
		var.doubleWK = 0
	end
    
    --到时间清除
   
--    if System.getCurrMiniTime() - dVar.StartMineralTime >= MineralCfg.ClearTime then 
--        for i = 1,table.getn(MineralCfg.Stone) do
--            dVar.Mineral[i] = 0 
--        end
--         dVar.StartMineralTime =  System.getCurrMiniTime()
--    end
	--print("System.getCurrMiniTime() - dVar.firstMineralTime="..System.getCurrMiniTime() - dVar.firstMineralTime)
    --挖矿间隔时间
	if System.getCurrMiniTime() - dVar.firstMineralTime<MineralCfg.MineralTime - 1 then 
		return 
	end
	dVar.firstMineralTime =nil 
	
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs == 0 then 
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
		DataPack.writeByte(netPack, 3)--挖失败了
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg, "背包已经满了,挖矿失败", ttFlyTip)
		return 
	end
 --   local bIndex = 0
--    while true do
--        local nCount = System.getRandomNumber(table.getn(MineralCfg.Stone))+1

--        if dVar.Mineral[nCount] < MineralCfg.Stone[nCount].maxcount then
--            dVar.Mineral[nCount] = dVar.Mineral[nCount] + 1
--            Actor.addItem(sysarg,MineralCfg.Stone[nCount].id,0,0,1,1,0,"wakuang");
--			Actor.sendTipmsg(sysarg, "获得"..MineralCfg.Stone[nCount].name, ttFlyTip)
--            break
--        end
--        bIndex =bIndex+1
--        if bIndex == 100 then
--            for i =1,table.getn(MineralCfg.Stone) do
--                if dVar.Mineral[i] < MineralCfg[i].Stone.maxcount then
--                      dVar.Mineral[i] = dVar.Mineral[i] + 1
--                      Actor.addItem(sysarg,MineralCfg.Stone[i].id,0,0,1,1,0,"wakuang");
--			          Actor.sendTipmsg(sysarg, "获得"..MineralCfg.Stone[i].name, ttFlyTip)
--                      bIndex = 101
--                      break
--                end
--            end
--            break
--        end
--    end
   --     if bIndex == 100 then
   --     return
        --Actor.addItem(sysarg,MineralCfg.Stone[1].id,0,0,1,1,0,"wakuang");
        --Actor.sendTipmsg(sysarg, "获得"..MineralCfg.Stone[1].name, ttFlyTip)
   -- end
   
   	if var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 1 then --日常除魔收集矿石
		if var.RiChangRenWuFlag~=nil and var.RiChangRenWuFlag == 1 then 
			local t=GetNpcRiChangChuMo()

			if var.kuangshi_RCCM ==nil then 
				var.kuangshi_RCCM =0
			end
			var.kuangshi_RCCM =var.kuangshi_RCCM +1
			
			if var.kuangshi_RCCM>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
				var.RiChangRenWuFinish = 1
				local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
				if pLv<=73 then
					WhenFinishRichangchumo(sysarg)
				end
			else 
				var.RiChangRenWuFinish = 0
			end
			Quest_ShuaXin(sysarg)
			
		end
	end
	
	

	
	
	
	
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
	DataPack.writeByte(netPack, 2)--挖成功了
	DataPack.flush(netPack)
    local sVar = System.getDyanmicVar()
   
    if sVar.Mineral == nil then
        sVar.Mineral = {}
        for i =1,table.getn(MineralCfg.server) do
            sVar.Mineral[i] = 0
        end
    end
      --全服控制黑铁矿、青金石、绿宝石矿、钻石矿
    
	--双倍挖矿
	local count = 1
	--if var.doubleWK >0 then 
	--	count = 2
	--end
						
    for i = table.getn(MineralCfg.server),1,-1 do
        --if System.getRandomNumber(MineralCfg.server[i].rate) == 0 then
           if sVar.Mineral[i] < MineralCfg.server[i].maxcount then
				local rate = MineralCfg.server[i].rate
				if var.doubleWK >0 then 
					rate = math.ceil(rate/2)
				end
                if System.getRandomNumber(rate) == 0 then
                        sVar.Mineral[i] = sVar.Mineral[i] + 1
                        Actor.addItem(sysarg,MineralCfg.server[i].id,0,0,count,MineralCfg.server[i].bind,0,"wakuang");
                        Actor.sendTipmsg(sysarg, "获得"..MineralCfg.server[i].name, ttFlyTip)
                        bagIdxs = bagIdxs - count
                        local str = "<(n%s)>挖到了%s."
                        str =  string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(MineralCfg.server[i].id))
                        System.broadcastTipmsg(str,ttChatWindow)
                        break
                end 
            end
       --end

    end



    
    if bagIdxs > 0 then
         --随机获得星纹强化石
		local rate = MineralCfg.GiveStrongItemTick
		if var.doubleWK >0 then 
			rate = math.ceil(rate/2)
		end
				
        if System.getRandomNumber(rate) == 0 then
            --dVar.StrongItemTick = System.getTick()
            Actor.addItem(sysarg,MineralCfg.StrongItemId,0,0,count,1,0,"wakuang");
            bagIdxs = bagIdxs - count
        end
    end
  
   
    if bagIdxs > 0 then 
       local counter = 0
	    for i=#MineralCfg.Stone,1,-1 do 
           	local rate = MineralCfg.Stone[i].rate
			if var.doubleWK >0 then 
				rate = math.ceil(rate/2)
			end
		    if System.getRandomNumber(rate) == 0 then --x产生0~x-1的数字
			    Actor.addItem(sysarg,MineralCfg.Stone[i].id,0,0,count,MineralCfg.Stone[i].bind,0,"wakuang");
			    Actor.sendTipmsg(sysarg, "获得"..MineralCfg.Stone[i].name, ttFlyTip)
			    break
		    end
		    counter = counter+1
	    end
	    if counter == #MineralCfg.Stone then 
		    Actor.addItem(sysarg,MineralCfg.Stone[1].id,0,0,count,MineralCfg.Stone[1].bind,0,"wakuang");
            Actor.sendTipmsg(sysarg, "获得"..MineralCfg.Stone[1].name, ttFlyTip)
	    end
    end

    
    
end
--卖出矿石
function SellMineralFunc(sysarg,way)
	way = tonumber(way)
	local getMoney =0
	for i=1,#MineralCfg.Stone do 
		local itemCount = Actor.getItemCount(sysarg,MineralCfg.Stone[i].id) 
		if itemCount>0 then
			Actor.removeItem(sysarg,MineralCfg.Stone[i].id,itemCount)
			getMoney = getMoney + MineralCfg.Stone[i].sellPrice * itemCount
		end
	end
	if getMoney == 0 then 
		Actor.sendTipmsg(sysarg, "您的背包没有矿石", ttFlyTip)
		return 
	else
		Actor.sendTipmsg(sysarg, string.format("出售成功,获得%s绑定金币",getMoney), ttFlyTip)
	end
	Actor.changeMoney( sysarg, 0, getMoney, 2 ,"sellkuangshi")
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
	DataPack.writeByte(netPack, 4)--出售成功
	DataPack.flush(netPack)
	
end
--矿石合成
function MakeStoneByMineralFunc(sysarg)
	local totalCount =0
	for i=5,#MineralCfg.Stone do 
		local itemCount = Actor.getItemCount(sysarg,MineralCfg.Stone[i].id) 
		if itemCount>=MineralCfg.Stone[i].change then
			Actor.removeItem(sysarg,MineralCfg.Stone[i].id,math.floor(itemCount/MineralCfg.Stone[i].change)*MineralCfg.Stone[i].change)
			totalCount = totalCount + math.floor(itemCount/MineralCfg.Stone[i].change)
		end
	end
	if totalCount == 0 then 
		if way ==1 then  --手动合成的时候才提醒，自动合成不提醒这个东西
			Actor.sendTipmsg(sysarg, "您的背包没有足够的矿石材料进行炼制", ttFlyTip)
		end
		return 
	end
	Actor.addItem(sysarg,459,0,0,totalCount,1,0,"lianzhikuangshi");
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sMineralSystem)  --申请一个数据包
	DataPack.writeByte(netPack, 5)--矿石合成
	DataPack.flush(netPack)
end

--点击自动出售
function AutoSell(sysarg,packet)
	local TypeID = DataPack.readByte(packet)
	if TypeID == 1 then --自动出售
		Actor.addTimer(sysarg,32,2*1000)
	elseif TypeID == 0 then --不自动出售
		Actor.deleteTimer(sysarg,32)
	end
end

--点击自动合成
function AutoChange(sysarg,packet)
	local TypeID = DataPack.readByte(packet)
	if TypeID == 1 then --自动合成
		Actor.addTimer(sysarg,33,2*1000)
	elseif TypeID == 0 then --不自动合成
		Actor.deleteTimer(sysarg,33)
	end
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cMineralSystem, MineralSystem)

--测试
--function ZZZ(sysarg ,TypeID)
--TypeID = tonumber(TypeID)
--	if TypeID == 1 then --自动出售
--		Actor.addTimer(sysarg,33,2*1000)
--	elseif TypeID == 0 then --不自动出售
--		Actor.deleteTimer(sysarg,33)
--	end
--end