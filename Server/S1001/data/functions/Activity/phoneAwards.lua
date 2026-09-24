--#include "data\config\item\scriptItemConfig\ProabilityDrops\probDrops2.lua" once
--#include "data\config\platforms\PlatSuperVip.lua" once
function handlegetAwards(sysarg, sysid, packet)
    local nIndx = 0
--    if tonumber(sysid) == 3 then
--        nIndx = 3
--    else
        if sysid ~= LogicCmd.miscSys.sub.cGetPhoneAwards then
		    return false;
	    end

	    nIndx = DataPack.readByte(packet);--奖励索引
	    if not nIndx then
		    return false;
	    end
    --end

	
	local var = Actor.getStaticVar(sysarg)
	if var.phoneAw == nil then 
		var.phoneAw = 0
	end
	
	nIndx = tonumber(nIndx)
	
	if nIndx == 1 then --请求信息
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, 196);
		DataPack.writeByte(netPack,var.phoneAw)
		DataPack.flush(netPack);
	
	elseif  nIndx == 2 then --请求奖励
		if var.phoneAw ~= 0 then
			Actor.sendTipmsg(sysarg,"已经领取过奖励，不能再领取了。",ttFlyTip)
			return false  
		end	
	    local spid = System.getSpid()
        local cfg = nil
        for i =1,#PlatSuperVip.phoneList do
            if PlatSuperVip.phoneList[i].spguid == spid then
                cfg = PlatSuperVip.phoneList[i].awardList
                break
            end
        end

		local GiftConfig = drops
        if cfg ~= nil then
            GiftConfig = cfg
        end
		if Awards.Give(sysarg, GiftConfig, 2622, "手机礼包")==false then 
			return false
		end
		Actor.sendTipmsg(sysarg,"成功领取了手机礼包。",ttFlyTip)
		var.phoneAw = 1
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, 196);
		DataPack.writeByte(netPack,var.phoneAw)
		DataPack.flush(netPack);
    elseif nIndx == 3 and System.getSpid() == 3 then -- 51工资进度礼包
       
        local dVar = Actor.getDyanmicVar(sysarg)
        local var = Actor.getStaticVar(sysarg)
        if var.mainprogress==nil then var.mainprogress = {} end
        if dVar.mainprograss ~= nil then
            local prograss = {20,50,100}
            local bY = true
            for i = 1,#prograss do
                if var.mainprogress[i] == nil or var.mainprogress[i] == 0 then
                    bY = false
                end
            end
            if bY == true then
                Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取。",ttFlyTip)
                return
            end

            local i = 1

            for i=1,#prograss do
                if dVar.mainprograss < prograss[i] then break end
            end
            local nItemCount = 0
             for j=i,#prograss do
                if  var.mainprogress[j] ~= 1 and  dVar.mainprograss >= prograss[j] then
                    nItemCount = nItemCount + 1
                end
            end
            if Item.getBagEmptyGridCount(sysarg) < nItemCount then
                Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!。",ttFlyTip)
                return
            end
             local nAdd = 0
            for j=i,#prograss do
                if  var.mainprogress[j] ~= 1 and  dVar.mainprograss >= prograss[j] then
                    local cfg = PlatSuperVip.wagesList[1].awardList[j]
                    Actor.addItem(sysarg,cfg.id,0,0,cfg.count,cfg.bind)
                    var.mainprogress[j] = 1
                    nAdd = 1
                end
            end
            if nAdd == 1 then
                Actor.sendTipmsg(sysarg,"领取成功。",ttFlyTip)
                 SendPlatformAwardState(sysarg)
            else    
                 Actor.sendTipmsg(sysarg,"未达到要求,领取失败。",ttFlyTip)
            end
            
           
        end
        
	end	
end

--function testSetAAA(sysarg,progress)
--    local dVar = Actor.getDyanmicVar(sysarg)
--    dVar.mainprograss = tonumber(progress)

--    local var = Actor.getStaticVar(sysarg)
--    var.mainprogress = {}
--    handlegetAwards(sysarg,3)
--end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetPhoneAwards, handlegetAwards);
