--军魂之地操作
--#include "data\config\MkzConfig.lua" once
--#include "data\functions\SpecialTitle.lua" once
--初始化军魂之地BOSS刷新信息
function MkzInitServer()
 --计算BOSS刷新时间
    MkzInitBossVar()
    System.addTimer("MkzRefreshBossTime",1000,-1)
    local nSec =  MkzCalcBossRefreshBossTime()
    --print("刷新时间，多少分钟:"..math.ceil(nSec / 60))
    for i =1,table.getn(MkzConfig.Refresh) do
        MkzSetBossRefreshTime(MkzConfig.Refresh[i].nMonsterId,nSec)
    end

end

--击杀BOSS - 重置刷新时间
function MkzKillMonster(sysarg,nMonsterId)
  
    --if Actor.getSceneId(sysarg) ~= MkzConfig.nSceneId then 
    --    return
    --end
    local dVar = System.getDyanmicVar()
    for i =1,table.getn(MkzConfig.Refresh) do
        if MkzConfig.Refresh[i].nMonsterId == nMonsterId then
			System.trace("MkzKill Monster")
            local nSec = MkzCalcBossRefreshBossTime()
           -- print("剩余刷新时间:"..nSec)
            MkzSetBossRefreshTime(nMonsterId,nSec)


            --增加三分钟泡点定时器
            local szCallBack = "MkzPaoDianTimer"
            --不重叠，重新开始计算
            if System.hasTimer(szCallBack) then
                System.deleteTimer(szCallBack)
            end
			
			--空的时候重置
			if dVar.MkzBoss.time ==nil then 
				dVar.MkzBoss.time = 0
			end
           
			if dVar.MkzBoss.AllTime ==nil or dVar.MkzBoss.AllTime==0 then 
				dVar.MkzBoss.time = 0 --第一次重置
				dVar.MkzBoss.AllTime = MkzConfig.nPaoDianTime
			else 
				dVar.MkzBoss.AllTime = dVar.MkzBoss.AllTime+MkzConfig.nPaoDianTime
			end
			System.trace("MkzKill Monster2   "..dVar.MkzBoss.time..","..dVar.MkzBoss.AllTime)
            System.addTimer(szCallBack,MkzConfig.nPaoDianGiveTime,-1)
            local str = "<(c0xFF00FF00)军魂之地>泡点已出现，只存在<(c0xFFff0000)5分钟>！<(x威龙城:133:132:传送员)>"
            System.broadcastTipmsg(str,ttChatWindow)

            --创建旗帜怪物
            
            local cfg = MkzConfig.Flag
            local hScene = Fuben.getSceneHandleById(MkzConfig.nSceneId,0)
            --先删除，保证场景里只有一个怪物
            Fuben.clearMonster(hScene,MkzConfig.Flag.nMonsterId)
            local pFlagPtr = Fuben.createMonster(hScene,cfg.nMonsterId,cfg.nX,cfg.nY)
            if pFlagPtr ~= nil then
                --Actor.setDir(pFlagPtr,0)
            end

             --广播给场景所有实体,刷新时间
            local playerList = LuaHelp.getSceneActorListById(MkzConfig.nSceneId)
            if playerList ~= nil then
		         for i = 1, #playerList do
                    local player = playerList[i]
                    MkzSendBossRefreshTime(player)
                 end
            end
            break
        end
    end
end

--泡点获得奖励
function MkzPaoDianTimer()
    local dVar = System.getDyanmicVar()
	if dVar.MkzBoss.time==nil then 
		dVar.MkzBoss.time=0
	end
    dVar.MkzBoss.time = dVar.MkzBoss.time + MkzConfig.nPaoDianGiveTime
	
	if dVar.MkzBoss.AllTime ==nil then 
		dVar.MkzBoss.AllTime = MkzConfig.nPaoDianTime
	end
    --泡点时间到了
    if dVar.MkzBoss.time >= dVar.MkzBoss.AllTime then
        --删除旗帜怪物
		dVar.MkzBoss.AllTime = nil 
        local hScene = Fuben.getSceneHandleById(MkzConfig.nSceneId,0)
        Fuben.clearMonster(hScene,MkzConfig.Flag.nMonsterId)
        System.deleteTimer(MkzPaoDianTimer)

        --泡点结束，重新计算军魂值
        local playerList = LuaHelp.getSceneActorListById(MkzConfig.nSceneId)
        if playerList ~= nil then
              for i = 1, #playerList do
                 local player = playerList[i]
                 local dzVar = Actor.getStaticVar(player)
                 dzVar.mkzvalue = 0 
              end
        end
        return
    end
    local playerList = LuaHelp.getSceneActorListById(MkzConfig.nSceneId)
    if playerList ~= nil then
          for i = 1, #playerList do
             local player = playerList[i]
             --判断是否在军团之地泡点区域
             if Actor.hasMapAreaAttri(player,aaMkzPaoDian) and Actor.isDeath(player) ~= true then
                local var = Actor.getStaticVar(player)
                if var.JunGuZhi == nil then var.JunGuZhi = 0 end
                local Double  = 1
                if IsSpeciaTitleVip(player,2) then --白银特权1.5倍奖励
                    Double = 1.5
                end
                if IsSpeciaTitleVip(player,3) then --黄金特权双倍奖励
                    Double = 2
                end

				
                local nValue = MkzConfig.nAddJunGuZhi * Double
                --var.JunGuZhi = var.JunGuZhi  + nValue
				
				local canUseItemPrt=nil
				local canUseItemMaxDura =-1
				local bagCount = Item.getBagItemCount(player)
				for i=1,bagCount do 
					local itemPrt = Item.getItemPtrByIndex(player,i-1)
					if itemPrt then 
						if 5453 ==Item.getItemId(itemPrt)then 
							local nDua = Item.getItemProperty(player,itemPrt,Item.ipItemDua)
							if nDua>canUseItemMaxDura and  nDua<Item.getItemPropertyById(5453, Item.ipItemStaticDuaMax) then --寻找最多的，并且是没有满的那个增加
								canUseItemMaxDura = nDua
								canUseItemPrt = itemPrt
							end
							--Item.setItemProperty(player,itemPrt,Item.ipItemDua,1)
							--Item.setItemDura(player,Item.getItemGuid(itemPrt),nValue)
							--local nDua = Item.getItemProperty(player,itemPrt,Item.ipItemDua,nValue)
						end
					end
				end
				if canUseItemPrt~=nil then 
					Item.setItemDura(player,Item.getItemGuid(canUseItemPrt),nValue)
					
					Actor.sendTipmsg(player,string.format("%s军魂值注入军魂瓶",nValue), ttFlyTip)
					
					local nDua = Item.getItemProperty(player,canUseItemPrt,Item.ipItemDua)
					if nDua>=Item.getItemPropertyById(5453, Item.ipItemStaticDuaMax) then 
						local pack = DataPack.allocPacket(player,151,18)
						DataPack.writeInt64(pack,Item.getItemGuid(canUseItemPrt))
						DataPack.flush(pack)
					end
					
					--最后一个参数是协议号83，飘字用的
					Actor.BroadcastLifeFuck(player,nValue,83)
					
					local dzVar = Actor.getStaticVar(player)
					if dzVar.mkzvalue == nil then dzVar.mkzvalue = 0 end
					dzVar.mkzvalue = dzVar.mkzvalue + nValue
	
					local pack = DataPack.allocPacket(player,151,9)
					DataPack.writeInt(pack,dzVar.mkzvalue)
					DataPack.flush(pack)
				end
             end
            
          end

    end

end
--计算当前时间到BOSS刷新时间还有多少秒
function MkzCalcBossRefreshBossTime()
    local nHour,nMin,nSec = System.getTime(0,0,0)
    local nRetSec = 3600
    if nHour % 2 == 0 then nRetSec = nRetSec * 2 end
    nRetSec = nRetSec - nMin * 60 - nSec
    return nRetSec
end

--boss刷新定时器
function MkzRefreshBossTime()       
    --军魂之地BOSS刷新时间
--    local dVar = System.getDyanmicVar()
--     for i =1,dVar.MkzBoss.count do
--        if dVar.MkzBoss.boss[i].sec > 0 then
--            dVar.MkzBoss.boss[i].sec = dVar.MkzBoss.boss[i].sec - 1
--        end
--    end

    local nHour,nMin,nSec = System.getTime(0,0,0)
    local hScene = Fuben.getSceneHandleById(MkzConfig.nSceneId,0)
    --偶数才刷新 -
    if nHour % 2 == 0 and nMin == 45 and nSec <= 5 then --45分五秒前刷新，一分钟之内可以杀死BOSS
        local bRefresh = false
        for i =1,table.getn(MkzConfig.Refresh) do
            local cfg = MkzConfig.Refresh[i]
            local pMonsterPtr =  Fuben.getMonsterPtrById(hScene,cfg.nMonsterId)
            if pMonsterPtr == nil then
                Fuben.createMonster(hScene,cfg.nMonsterId,cfg.nX,cfg.nY)
                bRefresh = true
                MkzSetBossRefreshTime(cfg.nMonsterId,nSec)
            end
        end
        if bRefresh == true then
            local str = "<(c0xFF00FF00)军魂之地>BOSS已刷新,击杀后出现军魂泡点!\\每日2点45分首次刷新,随后每隔2小时固定刷新boss.<(x威龙城:133:132:传送员)>"
			
			--跨服不广播这个东西
			if System.isCrossServer() ==true then
				return 
			end
            System.broadcastTipmsg(str,ttChatWindow)
        end
    end
    
end
--初始化军魂之地BOSS刷新时间变量
function MkzInitBossVar()
    local dVar = System.getDyanmicVar()
    if dVar.MkzBoss == nil then 
        dVar.MkzBoss = {} 
        dVar.MkzBoss.count = 0
        dVar.MkzBoss.boss = {}
        --dVar.MkzBoss.time = 0--buff时间  (不能为0，为0就是说明还有泡点时间是3分钟)
    end
end
--获取军魂之地BOSS刷新时间
function MkzGetBossRefreshTime(nMonsterId)
    local dVar = System.getDyanmicVar()
    for i =1,dVar.MkzBoss.count do
        if dVar.MkzBoss.boss[i].id == nMonsterId then
            return dVar.MkzBoss.boss[i].sec
        end
    end
    return 0
end
--设置军魂之地BOSS刷新时间
function MkzSetBossRefreshTime(nMonsterId,nSec)
    local bFind = false
    local dVar = System.getDyanmicVar()
    for i =1,dVar.MkzBoss.count do
        if dVar.MkzBoss.boss[i].id == nMonsterId then
            dVar.MkzBoss.boss[i].sec = nSec
            bFind = true
            break
        end
    end
    if bFind == false then
        
        dVar.MkzBoss.count =  dVar.MkzBoss.count + 1
        local i = dVar.MkzBoss.count

        dVar.MkzBoss.boss[i] = {}
        dVar.MkzBoss.boss[i].id = nMonsterId
        dVar.MkzBoss.boss[i].sec = nSec
    end
end

--获取军魂之地boss刷新时间
function MkzSendBossRefreshTime(sysarg)
   
    local bHasBuff = 0
    if System.hasTimer("MkzPaoDianTimer") then bHasBuff = 1 end
    local pack = DataPack.allocPacket(sysarg,151,8)
    DataPack.writeByte(pack,bHasBuff)
    DataPack.writeByte(pack,table.getn(MkzConfig.Refresh))
    for i = 1,table.getn(MkzConfig.Refresh) do
        DataPack.writeInt(pack,MkzConfig.Refresh[i].nMonsterId)
        local nSec = MkzGetBossRefreshTime(MkzConfig.Refresh[i].nMonsterId)
       
        DataPack.writeWord(pack,nSec)
    end
	
	local dVar = System.getDyanmicVar()
	if dVar.MkzBoss.AllTime==nil then 
		dVar.MkzBoss.AllTime = 0
	end
	
	local var = Actor.getStaticVar(sysarg)
	if dVar.MkzBoss.time==nil then 
		DataPack.writeUInt(pack,0)					
		var.mkzvalue = 0 
		
	elseif  dVar.MkzBoss.time >= dVar.MkzBoss.AllTime then 
		DataPack.writeUInt(pack,0)
		var.mkzvalue = 0 
	else
		DataPack.writeUInt(pack,dVar.MkzBoss.AllTime-dVar.MkzBoss.time)
	end

    DataPack.flush(pack)
end