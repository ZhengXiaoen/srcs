--vip回收回调全局脚本,切勿重名!!!

--#include "data\config\item\RecycledWarItems.lua" once

function WarRecoveryInit(sysarg)
	local e = "<title/战装回收>\\  <(c0xFFeabc78)点击对应的套装名按钮即可回收包裹内对应的套装.>\\\\";
	local d = RecycledWarItems;
	local w = {
		"&55BBFF&点击回收可获得:#",
		"#&FF7755&%s&55BBFF& 经验",
		"#&FF7755&%s&55BBFF& 绑定金币",
		"#&FF7755&%s&55BBFF& 金币",
		"#&FF7755&%s&55BBFF& 护符碎片",
	};
	local ItemCount_bag = {}; --装备在包裹里的数量
	local ItemStr = {}; --按钮上提示文字
	local rStr = {};
	local formatStrs = {};
	local addExp = {};	--显示总经验
	local addBindgold = {};	--显示总绑金
	local addGold = {};	--显示总金币
	local addHufu = {};	--显示总护符碎片
    local addItem = {}
	--取出总的数量和回收资源
	for i = 1,#d do
		local list = d[i].list;
		if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
		if not addExp[i] then addExp[i] = 0; end
		if not addBindgold[i] then addBindgold[i] = 0; end
		if not addGold[i] then addGold[i] = 0; end
		if not addHufu[i] then addHufu[i] = 0; end
         --道具叠加
        addItem[i] = {}
		for k = 1,#list do
			local n = 0
			if not(i==16 or i==17 or i==18 )then 
				n = Actor.getItemCount(sysarg, list[k].itemid);
			else 
				local bagCount = Item.getBagItemCount(sysarg)
				for i=1,bagCount do 
					local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
					if itemPrt then 
						if list[k].itemid ==Item.getItemId(itemPrt) and  Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0 then --只算不是王，帝的
							n = n + 1
						end
					end
				end
			end
			ItemCount_bag[i] = ItemCount_bag[i] + n;
			addExp[i] = addExp[i] + n * list[k].exp;
			addBindgold[i] = addBindgold[i] + n * list[k].bindgold;
			addGold[i] = addGold[i] + n * list[k].gold;
			addHufu[i] = addHufu[i] + n * list[k].hufu;
            
            addItem[i][k] = {}
            local function AddItemEx(addItem,item,n)
                 local temp = {}
                 temp.itemid = item.itemid
                 temp.bind = item.bind
                 temp.count = n * item.count
                 table.insert(addItem,temp)
            end
            
            for j = 1,#list[k].item do
                for q =1,#list[k].item do
                     if n > 0 then 
                        AddItemEx(addItem[i][k],list[k].item[q],n)
                     end
                    
                end
            end
		end
	end

	--做显示总的
	for i = 1,#d do
		local xStr = "";
		
		if ItemCount_bag[i] == 0 then
			rStr[i] = "#c0xFF888888#" .. d[i].title;
			xStr = "&55BBFF&当前包裹内没有此类道具回收";
			formatStrs[i] = "  <%s(%s)/@onWarItemHuiShouFunc,%s|%s>  ";
			ItemStr[i] = xStr;
			if d[i].title == "" then rStr[i] = "" end
		else
			rStr[i] = d[i].title;
			if d[i].title == "" then rStr[i] = "" end
			xStr = xStr .. w[1];
			if addExp[i] > 0 then
				xStr = xStr .. string.format(w[2], addExp[i]);
			end
			if addBindgold[i] > 0 then
				xStr = xStr .. string.format(w[3], addBindgold[i]);
			end
			if addGold[i] > 0 then
				xStr = xStr .. string.format(w[4], addGold[i]);
			end
			if addHufu[i] > 0 then
				xStr = xStr .. string.format(w[5], addHufu[i]);
			end
           
            if #addItem[i] > 0 then
                for j = 1,#addItem[i] do 
                   for k= 1,#addItem[i][j] do
                     xStr = xStr .. "#&FF7755&"..Item.getItemName(addItem[i][j][k].itemid).."&55BBFF& "..addItem[i][j][k].count
                   end
                   
                end
            end
			formatStrs[i] = "  <<showEff%s(%s)>/@onWarItemHuiShouFunc,%s|%s>  ";
			ItemStr[i] = xStr;
		end
	end

	for i = 1,#d do
		local _,b = math.modf(i / 3);
		local hfh = "";
		if b == 0 then
			hfh = "\\";
			-- if i == 18 then
			-- 	hfh = "\\\\<(idecoLine#330)>\\\\";
			-- end
		end
		
		-- local openServerDay = System.getDaysSinceOpenServer()
		-- if i==16 and openServerDay<7 then 
		-- 	e = e..hfh
		-- elseif i==17 and openServerDay<15 then 
		-- 	e = e..hfh
		-- elseif i==18 and openServerDay<30 then 
		-- 	e = e..hfh
		-- else
		if rStr[i] == "" then
			e = e .."\\"
		else
			e = e .. string.format(formatStrs[i],rStr[i],ItemCount_bag[i],i,ItemStr[i]) .. hfh;
		end
			
		--end

	end


--	e = e .. "  <#c0xFFFFFF00#自动回收设置/@onVipAutomaticHs|购买黄金特权可享受此功能#开启后每10秒自动进行回收>\\";

--	--这个是体验卡体验回收，不是真正的vip2
--	local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
--	if myVipLevel<2 then 
--		--Actor.openarrowsguide(sysarg, 1005, 20, 110, 2);
--		e= e.."  体验卡到82级就失效了,vip2可无限制开启, <[成为VIP2]/@@showWin,14>"
--	end

	
	
	--任务
--	local nowVar = get_taskflags_val(sysarg);
--	local ta = task_all[nowVar];
--	local sVar = Actor.getDyanmicVar(sysarg);
--	local taskfor = {
--		{nowVar = 83, type = 4, x = 2, y = 114},
--		{nowVar = 86, type = 4, x = 2, y = 114},
--		--{nowVar = 90, type = 4, x = 2, y = 114},
--	};

--	for i = 1,#taskfor do
--		if ta~=nil and nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type then
--			sVar.nowNumberOfStep = 1;
--			Actor.openarrowsguide(sysarg, 1005, taskfor[i].x, taskfor[i].y, 2);
--			Actor.addTimer(sysarg,20,7*1000);
--		end
--	end
	

	return e;
end


function onWarItemHuiShouFunc(sysarg,i) --装备回收 2017/1/5 zer



	if not i then return; end
	i = tonumber(i);

--	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
--	if i == 14 and zLv < 2 then
--		Actor.sendTipmsg(sysarg,"2转以上才可回收此类装备.",256);
--		return;
--	end

	local d = RecycledWarItems;
	local ItemCount_bag = {}; --装备在包裹里的数量
	local addExp = {};	--显示总经验
	local addBindgold = {};	--显示总绑金
	local addGold = {};	--显示总金币
	local addHufu = {};	--显示总护符碎片
    local addItem = {} --显示回收道具
	--取出总的数量和回收资源

	local list = d[i].list;
	if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
	if not addExp[i] then addExp[i] = 0; end
	if not addBindgold[i] then addBindgold[i] = 0; end
	if not addGold[i] then addGold[i] = 0; end
	if not addHufu[i] then addHufu[i] = 0; end
    addItem[i] = {}
    --道具叠加

  
    if Item.getBagEmptyGridCount(sysarg) < #addItem then
        Actor.sendTipmsg(sysarg, string.format("包裹空间不足%d个,无法回收！", #addItem), 1);
        return
    end

	for k = 1,#list do
		local n = 0
		if not( i==16 or i==17 or i==18) then 
			n = Actor.getItemCount(sysarg, list[k].itemid);
			Actor.removeItem(sysarg, list[k].itemid, n,-1,-1,-1);
		else 
			local needdelItem ={}
			local bagCount = Item.getBagItemCount(sysarg)
			for i=1,bagCount do 
				local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
				if itemPrt then 
					if list[k].itemid ==Item.getItemId(itemPrt) and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0 then --只算不是王，帝的
						n = n + 1
						table.insert(needdelItem,itemPrt)
					end
				end
			end
			if n~=0 then 
				for i=1,n do 
					Item.removeItem(sysarg,needdelItem[i],1,"Script",GameLog.clScriptDeleteItem);
				end
			end
		end
		ItemCount_bag[i] = ItemCount_bag[i] + n;
		addExp[i] = addExp[i] + n * list[k].exp;
		addBindgold[i] = addBindgold[i] + n * list[k].bindgold;
		addGold[i] = addGold[i] + n * list[k].gold;
		addHufu[i] = addHufu[i] + n * list[k].hufu;
        addItem[i][k] = {}
        local function AddItemEx(addItem,item,n)
                local temp = {}
                temp.itemid = item.itemid
                temp.bind = item.bind
                temp.count = n * item.count
                table.insert(addItem,temp)
        end
            
        for j = 1,#list[k].item do
            for q =1,#list[k].item do
                    if n > 0 then 
                    AddItemEx(addItem[i][k],list[k].item[q],n)
                    end
                    
            end
        end
	end
   
	--做显示总的
	local w = {
		"<VIP>回收<%s>件<%s装备>获得:",
		"<%s>经验",
		"<%s>绑定金币",
		"<%s>金币",
		"<%s>护符碎片",
	};
	local xStr = "";
	if ItemCount_bag[i] == 0 then
		xStr = string.format("当前包裹内没有[<%s>]类物品可回收", d[i].title);
	else
		xStr = xStr .. string.format(w[1], ItemCount_bag[i], d[i].title);
		if addExp[i] > 0 then
			xStr = xStr .. string.format(w[2], addExp[i]);
		end
		if addBindgold[i] > 0 then
			xStr = xStr .. string.format(w[3], addBindgold[i]);
		end
		if addGold[i] > 0 then
			xStr = xStr .. string.format(w[4], addGold[i]);
		end
		if addHufu[i] > 0 then
			xStr = xStr .. string.format(w[5], addHufu[i]);
		end

         if #addItem[i] > 0 then
                for j = 1,#addItem[i] do 
                   for k= 1,#addItem[i][j] do
                      xStr = xStr .." <"..Item.getItemName(addItem[i][j][k].itemid)..">".."*"..addItem[i][j][k].count
                   end
                   
                end
          end
	end

	if ItemCount_bag[i] > 0 then
		Actor.changeMoney(sysarg,0,addBindgold[i],105,"战装回收收购物品");
		Actor.changeMoney(sysarg,1,addGold[i],105,"战装回收收购物品");
		Actor.addExp(sysarg, addExp[i], "战装回收给经验");

		if addHufu[i] > 0 then
			local jadeNum = Actor.getUIntProperty(sysarg, 124)
			jadeNum = jadeNum + addHufu[i];
			Actor.setUIntProperty(sysarg, 124, jadeNum);
			Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", addHufu[i]), 1);
		end
        if #addItem[i] > 0 then
            for j = 1,#addItem[i] do 
                for k= 1,#addItem[i][j] do
                  
                     Actor.addItem(sysarg,addItem[i][j][k].itemid,0,0,addItem[i][j][k].count,addItem[i][j][k].bind,0,"战装回收",LogIds.warReciveryAward)
              
                end
                   
            end
          end
  
		Actor.sendTipmsg(sysarg, xStr, 256);
		OnFinish_Liveness(sysarg,19);
		Actor.playEnergyEffect(sysarg,1,0)
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sHuiShouZhuangbei)  --申请一个数据包
		if netPack then
			DataPack.flush(netPack)
		end
		
	else
		Actor.sendTipmsg(sysarg, xStr, 256);
	end
	return WarRecoveryInit(sysarg);
end







