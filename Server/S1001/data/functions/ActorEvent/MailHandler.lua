--#include "data\config\ActorEvent\MailInfoCfg.lua" once

-- 邮件类型

mailType = {
	mailRecvFlower = 1,				-- 接收鲜花
	mailRebackRedPacket = 2,	-- 返还红包(个人,队伍行会)
	mailServiceActivity = 5,	-- 全服活动或公告
	mailGetAwardItem =6,         --邮件发送奖品
    mailGetMoney = 7,           --邮件发送元宝
}

local mailOptFuncList = {}


function lua_string_split(str, split_char)
    local sub_str_tab = {};
    local nIndex = 1
    while (true) do
        local pos = string.find(str, split_char);
      
        if (not pos) then
            sub_str_tab[#sub_str_tab + 1] = str;
            break;
        end
        local sub_str = string.sub(str, 1, pos - 1);
        sub_str_tab[#sub_str_tab + 1] = sub_str;
        str = string.sub(str, pos + 1, #str);
        nIndex = nIndex + 1
        if nIndex > 1000000 then
            System.trace("LoopIndex lua_string_split err,str:"..str)
            break
        end
    end
 

    return sub_str_tab;
end

--邮件接收金钱
mailOptFuncList[mailType.mailGetMoney] = function(sysarg, args)
	local mailid = tonumber(args[2]);
	local btRewardType = tonumber(args[3]);
	local nRewards = tonumber(args[4]);
   
	local strData = args[5];
	local strMsg = args[6];
	
    
    if strData ~= nil then 
        local arr_award = {}
        local arr_item = lua_string_split(strData,"/")
        
        if table.getn(arr_item) > 0 then
            for i = 1,table.getn(arr_item) do
                    local ret = lua_string_split(arr_item[i],",")
                    if table.getn(ret) == 2 then
                        local struct_item = {}

                        struct_item.type = tonumber(ret[1])
                        struct_item.count = tonumber(ret[2])
                        table.insert(arr_award,struct_item)
                    end
             end
             for i =1,table.getn(arr_award) do
                   local logid = 138
                    if nRewards ~= 0 then
                        logid = 111
                    end
                    Actor.changeMoney(sysarg,arr_award[i].type,arr_award[i].count,logid,strMsg,false)
                
                    
             end 
        end
    end


    Actor.sendTipmsg(sysarg, strMsg, ttFlyTip)
	
    
	local netPack = DataPack.allocPacket(sysarg, 64, 4)
	DataPack.writeUInt(netPack, mailid)
	DataPack.flush(netPack)
    return true;
end
-- 邮件接收物品
--参数说明 道具id|数量|是否绑定|召唤强度|符文属性类型|符文属性值|符文属性类型|符文属性值|符文属性类型|符文属性值|符文属性类型|符文属性值|符文属性类型|符文属性值|极品等级[王,帝]




mailOptFuncList[mailType.mailGetAwardItem] = function(sysarg, args)

	local mailid = args[2];
	local btRewardType = args[3];
	local nRewards = args[4];
	local strData = args[5];
	local strMsg = args[6];
	local strItem =strData
   
	if btRewardType ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00040, ttFlyTip);
		return false;
	end
    local bagIdxs = Item.getBagEmptyGridCount(sysarg)
    local nCount = 0
    local count = 0
     local itemID
    if nRewards > 0 then
        itemID = System.getInt2Byte(nRewards, false);
	    nCount = System.getInt2Byte(nRewards, true);
       count =Item.getAddItemNeedGridCount( sysarg,itemID,nCount)
	    
	    if bagIdxs < count then 
		    Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
		    return false
	    end
    end
 
    local arr_award = {}
    if strItem ~= nil then 
       
       local arr_item = lua_string_split(strItem,"/")
       if table.getn(arr_item) > 0 then
       
            for i = 1,table.getn(arr_item) do
                 local ret = lua_string_split(arr_item[i],",")

                 if table.getn(ret) >= 3 then
                   
                    local struct_item ={}   
                    struct_item.runedebris = {}                
                    struct_item.id = tonumber(ret[1])                 
                    struct_item.count = tonumber(ret[2])
                    struct_item.bind = tonumber(ret[3])   
                    struct_item.taostrong = 0
                    if table.getn(ret) >= 4 then   
                        struct_item.taostrong = tonumber(ret[4])
                    end

                    --五条符文碎片属性
                    local nIndex = 6
                    local nStartIndex = 1
                    local nLoopIndex = 1
                    while true do
                       if table.getn(ret) >= nIndex then
                            local runeItem ={}
                            runeItem.type = tonumber(ret[nIndex-1])
                            runeItem.value = tonumber(ret[nIndex])
                            table.insert(struct_item.runedebris,runeItem)

                            nStartIndex = nStartIndex + 1
                            nIndex = nIndex + 2
                            if nStartIndex >= 6 then break end
                        else 
                            break
                        end    
                        nLoopIndex = nLoopIndex + 1
                        if nLoopIndex > 1000 then
                            System.trace("LoopIndex 五条符文碎片属性err")
                            break
                        end
                    end
                    struct_item.superlevel = 0
                    if table.getn(ret) >= 15 then
                        struct_item.superlevel = tonumber(ret[15])
                    end  
                    
                    table.insert(arr_award,struct_item)
                    count = count + Item.getAddItemNeedGridCount( sysarg,struct_item.id,struct_item.count)                   
                 end
            end
            
       end
     end

	
    --给予数组奖励
    if table.getn(arr_award) > 0 then
        if bagIdxs < count then 
		    Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
		    return false
	    end
       
        for i =1,table.getn(arr_award) do
            local pItem = Item.createItem(arr_award[i].id,arr_award[i].count,0,0,arr_award[i].bind,0,arr_award[i].superlevel ) 
            if pItem == nil then
                Actor.sendTipmsg(sysarg, "领取邮件奖励失败了啊(/ □ \)", ttFlyTip)
		        return false
            end

            Item.addItem(sysarg,pItem,strMsg,GameLog.cMailAwardItem)
            if LocalDT.IsFixedTaoStrongEquipment(arr_award[i].id) or arr_award[i].taostrong > 0 then
                Item.setItemProperty(sysarg,pItem,Item.ipTaoStrong,LocalDT.IsFixedTaoStrongEquipment(arr_award[i].id) and 6 or arr_award[i].taostrong)
            end
			--Actor.addItem(sysarg,arr_award[i].id,0,0,arr_award[i].count,arr_award[i].bind,0,strMsg,GameLog.cMailAwardItem,-1,0,-1,1,arr_award[i].taostrong)
             
            local nLen = table.getn(arr_award[i].runedebris)
            if  nLen> 0 then
                for j = 1,nLen do
                    Item.SetItemRuneAttr(sysarg,pItem,j-1,arr_award[i].runedebris[j].type,arr_award[i].runedebris[j].value) 

                end
            end
            --Actor.addItem(sysarg,,0,0,,,0,strMsg,GameLog.cMailAwardItem,-1,0,-1,1,arr_award[i].taostrong)
        end
    end

    local bBind =0
    local sTitle = strMsg
    if sTitle == "开服活动充值排行奖励" then
        bBind = 1
    end
	Actor.addItem(sysarg,itemID,0,0,nCount,1,0,strMsg,GameLog.cMailAwardItem)

	Actor.sendTipmsg(sysarg, strMsg, ttFlyTip)
	--System.broadcastTipmsg(strMsg, ttScreenCenter + ttChatWindow);
    
	local netPack = DataPack.allocPacket(sysarg, 64, 4)
	DataPack.writeUInt(netPack, mailid)
	DataPack.flush(netPack)

    if sTitle == "世界boss" then
        System.broadcastTipmsg(string.format("<(n%s)>玩家领取了世界BOSS伤害排名奖励.",Actor.getName(sysarg)),ttChatWindow)
    end
	return true;
end



-- 接收鲜花
mailOptFuncList[mailType.mailRecvFlower] = function(sysarg, args)
	local mailid = args[2];
	local btRewardType = args[3];
	local nRewards = args[4];
	local strData = args[5];
	local strMsg = args[6];
	
	if btRewardType ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00040, ttFlyTip);
		return false;
	end
	
	local itemID = System.getInt2Byte(nRewards, true);
	local nCount = System.getInt2Byte(nRewards, false);
	
	local itemdatas = {{id = 470, count = 1,},{id = 471, count = 9,},{id = 472, count = 99,},{id = 473, count = 999,}};
	if not itemdatas then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip);
		return false;
	end
	
	-- 物品是否存在
	local nIndex = 0;
	for i=1, #itemdatas do
		if itemdatas[i].id == itemID then
			nIndex = i;
			break;
		end
	end
	
	if nIndex == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00040, ttFlyTip);
		return false;
	end
	
	-- 修改魅力值
	local nCharmNum = Actor.changeCharm(sysarg, itemdatas[nIndex].count)
		
	Actor.sendTipmsg(sysarg, strMsg, ttFlyTip);
	System.broadcastTipmsg(strMsg, ttScreenCenter + ttChatWindow);
	System.broadCastRecvFlower(itemID);
	
	local netPack = DataPack.allocPacket(sysarg, 64, 4)
	DataPack.writeUInt(netPack, mailid)
	DataPack.flush(netPack)
	return true;
end

-- 返还红包
mailOptFuncList[mailType.mailRebackRedPacket] = function(sysarg, args)
	local mailid = args[2];
	local btRewardType = args[3];
	local nRewards = args[4];
	
	if btRewardType ~= 15 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00040, ttFlyTip);
		return false;
	end
	
	if nRewards <= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip);
		return false;
	end
	
	Actor.changeMoney(sysarg, mtYuanbao, nRewards, LogIds.MailTakenYB, "邮件提取元宝");
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.m00041, nRewards), ttFlyTip);
	
	local netPack = DataPack.allocPacket(sysarg, 64, 4)
	DataPack.writeUInt(netPack, mailid)
	DataPack.flush(netPack)
	return true;
end

-- 提取全服活动或公告里的奖励
mailOptFuncList[mailType.mailServiceActivity] = function(sysarg, args)
	local mailid = args[2];
	local btRewardType = args[3];
	local nRewards = args[4];
	local strData = args[5];
	if not strData or strData == "" then
		print("mail data error, mailid: "..mailid);
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00042, ttFlyTip);
		return false;
	end
	
	local cfgid = tonumber(strData);
	local rewards = mailInfoCfg[cfgid].rewards
	if not rewards then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.m00042, ttFlyTip);
		return false;
	end
	
	-- 背包是否有足够的格子
	if IsEnoughBagGrids(sysarg, rewards) == false then
		return false;
	end
	
	if Awards.Give(sysarg, rewards, LogIds.MailTakenReward, "mail id "..tostring(mailid)) == false then
		return false;
	end
	
	local netPack = DataPack.allocPacket(sysarg, 64, 4)
	DataPack.writeUInt(netPack, mailid)
	DataPack.flush(netPack)
	return true;
end

EventCallDispatcher.handleMail = function(sysarg, args)
	if args[1] == nil then return end   --
	local func = mailOptFuncList[args[1]]
	if func ~= nil then
		return func(sysarg, args)
	end
	return false;
end

--[[ 不需要了，屏蔽，改为在 OnPlayerDie() 中暂存
-- 暂存一下被击杀数据
EventCallDispatcher.handleMailSaveKilledData = function(sysarg, args)
	local var = Actor.getDyanmicVar(sysarg);
	var.maildata = {};
	var.maildata.killerType = args[1];
	var.maildata.sceneName = args[2];
	var.maildata.killerName = args[3];
end
--]]

-- 发送被击杀邮件,发送完后要清理私有变量
EventCallDispatcher.handleSendActorByKilledMail = function(sysarg, args)
	local var = Actor.getDyanmicVar(sysarg);
		
	-- 读取掉落物品名
	local ncount = args[1];
	local strItemName = "";
	local i = 2;
	local tItemData = {};
	local typeIndex = 1;
    local nLoopIndex = 0
	if ncount > 0 then
		while true do
			if not args[i] then
				break;
			end
			
			local tName = {name = "", count = 0;};
			if #tItemData == 0 then
				tName.name = args[i];
				tName.count = 1;
				table.insert(tItemData, tName);
			else
				local isSameName = false;
				for k=1, #tItemData do
					-- 如果名字相同，数量+1
					if args[i] == tItemData[k].name then
						tItemData[k].count = tItemData[k].count + 1;
						isSameName = true;
						break;
					end
				end
				
				-- 没有同名，添加到列表
				if isSameName == false then
					tName.name = args[i];
					tName.count = 1;
					table.insert(tItemData, tName);
				end
			end
			i = i + 1;
            nLoopIndex =  nLoopIndex + 1
            if nLoopIndex > 1000 then
                System.trace("LoopIndex handleSendActorByKilledMail Error!")
                break
            end
		end

		if #tItemData > 0 then
			i = 1;
            nLoopIndex = 0
			while true do
				if not tItemData[i] then
					break;
				end
				local strName = tItemData[i].name;
				local count = tItemData[i].count;
				if count > 1 then
					if i==1 then 
						strItemName = strItemName..strName.."*"..count
					else 
						strItemName = strItemName.."、"..strName.."*"..count;
					end
					--print("strName="..strName)
				else
					if i==1 then 
						strItemName = strItemName..strName
					else
						strItemName = strItemName.."、"..strName
					end
				end
				i = i + 1;
                 nLoopIndex =  nLoopIndex + 1
                if nLoopIndex > 10000 then
                    System.trace("LoopIndex handleSendActorByKilledMail Error!")
                    break
                end
			end
		end
	end
	
	local killerType = -1 -- 被毒死或者没有被杀者时
	local sceneName = Actor.getSceneName(sysarg)
	local killerName = ""
	if var.maildata ~= nil then -- 有被杀者时
		killerType = var.maildata.killerType;
		sceneName = var.maildata.sceneName;
		killerName = var.maildata.killerName;
	end
	
	local strTitle, strDesc;
	strTitle = Lang.MailDesc[13];
	-- 0为玩家,4为宠物都属于玩家击杀
	if killerType == 0 or killerType == 4 then
		-- 没有掉落物品
		if strItemName == "" then
			strDesc = string.format(Lang.MailDesc[7], sceneName, killerName);
		else
			strDesc = string.format(Lang.MailDesc[8], sceneName, killerName, strItemName);
		end
	else
		strTitle = "被BOSS击杀来信"
		-- 没有掉落物品
		if strItemName == "" then
			strDesc = string.format(Lang.MailDesc[5], sceneName, killerName);
		else
			strDesc = string.format(Lang.MailDesc[6], sceneName, killerName, strItemName);
			--print("strDesc"..strDesc)
		end
	end
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
	-- 发邮件
		
	-- print("strTitle "..strTitle, "killerType "..killerType, "sceneName "..sceneName, "killerName "..killerName, "strItemName "..strItemName, "strDesc "..strDesc);
	System.AddMail(actorID, 3, 0, strTitle, strDesc);
	var.maildata = nil;
end

-- 发送系统公告邮件
EventCallDispatcher.handleSendSysNoticeMail = function(sysarg, args)
	local eventtype = args[1];
	local cfgid = args[2];
	
	local config = mailInfoCfg[cfgid];
	if not config then
		return false;
	end
	
	
	local strcfgid = tostring(cfgid);
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
	System.AddMail(actorID, eventtype, 0, config.title, "", 0, 0, strcfgid);
	return true;
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMailOpt, EventCallDispatcher.handleMail)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMailNotesKillerData, EventCallDispatcher.handleMailSaveKilledData)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMailActorByKilled, EventCallDispatcher.handleSendActorByKilledMail)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMailSendSysNotice, EventCallDispatcher.handleSendSysNoticeMail)