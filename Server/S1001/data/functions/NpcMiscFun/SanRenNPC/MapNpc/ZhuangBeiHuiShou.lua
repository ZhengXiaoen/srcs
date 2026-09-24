--#include "data\config\ActorEvent\MineralCfg.lua" once
--#include "data\functions\ShieldAndTalismanRecory.lua" once
local t = {};

t.main = function(sysarg)
	
	Actor.openDialogs(sysarg,3)
	---------------------------------------------------------------以下是主线任务引导相关
	local nowVar = get_taskflags_val(sysarg);
	local ta = task_all[nowVar];
	local sVar = Actor.getDyanmicVar(sysarg);
	local taskfor = {
		{nowVar = 29, type = 4, x = 2, y = 114},
		{nowVar = 42, type = 4, x = 2, y = 114},
		{nowVar = 61, type = 4, x = 2, y = 114},
		{nowVar = 83, type = 4, x = 2, y = 114},
		{nowVar = 86, type = 4, x = 2, y = 114},
		{nowVar = 90, type = 4, x = 2, y = 114},
		--{nowVar = 95, type = 4, x = 2, y = 114},
		{nowVar = 98, type = 4, x = 2, y = 114},
	};
	for i = 1,#taskfor do
		if ta~=nil and nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type then
			sVar.nowNumberOfStep = 1;
			Actor.openarrowsguide(sysarg, 1005, taskfor[i].x, taskfor[i].y, 2);
			Actor.addTimer(sysarg,20,7*1000);
		end
	end
	---------------------------------------------------------------以上是主线任务引导相关

	local e = "\\  <(c0xFFeabc78)点击对应的套装名按钮即可回收包裹内对应的套装.>\\\\";

	local d = RecycledItems;
	local w = {
		"&55BBFF&点击回收可获得:#",
		"#&FF7755&%s&55BBFF& 经验",
		"#&FF7755&%s&55BBFF& 绑定金币",
		"#&FF7755&%s&55BBFF& 金币",
		"#&FF7755&%s&55BBFF& 护符碎片",
        "#&FF7755&%s&55BBFF& 生肖经验",
	};
	local ItemCount_bag = {}; --装备在包裹里的数量
	local ItemStr = {}; --按钮上提示文字
	local rStr = {};
	local formatStrs = {};
	local addExp = {};	--显示总经验
	local addBindgold = {};	--显示总绑金
	local addGold = {};	--显示总金币
	local addHufu = {};	--显示总护符碎片
    local addZoliacexp = {}; --显示总生肖经验
	--取出总的数量和回收资源
	for i = 1,#d do
		local list = d[i].list;
		if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
		if not addExp[i] then addExp[i] = 0; end
		if not addBindgold[i] then addBindgold[i] = 0; end
		if not addGold[i] then addGold[i] = 0; end
		if not addHufu[i] then addHufu[i] = 0; end
         if not addZoliacexp[i] then addZoliacexp[i] = 0 end
		for k = 1,#list do
			local n = 0
			if not( i==16 or i==17 or i==18 or i==19 )then 
				n = Actor.getItemCount(sysarg, list[k].itemid);
			else 
				local bagCount = Item.getBagItemCount(sysarg)
				for i=1,bagCount do 
					local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
					if itemPrt then 
						if list[k].itemid ==Item.getItemId(itemPrt) 
                            and  Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0  --只算不是王，帝的
                            and  Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel)==0 then --不能是龙装
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
            if  list[k].zoliacexp ~= nil and list[k].zoliacindex ~= nil then
                addZoliacexp[i] = addZoliacexp[i] + n * list[k].zoliacexp
            end
		end
	end
			
	--做显示总的
	for i = 1,#d do
		local xStr = "";
		
		if ItemCount_bag[i] == 0 then
			rStr[i] = "#c0xFF888888#" .. d[i].title;
			xStr = "&55BBFF&当前包裹内没有此类道具回收";
			formatStrs[i] = "  <%s(%s)/@onItemHuiShouFunc,%s|%s>  ";
			ItemStr[i] = xStr;
		else
			rStr[i] = d[i].title;
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
            if addZoliacexp[i] > 0 then
                xStr = xStr .. string.format(w[6], addZoliacexp[i]);
            end
			formatStrs[i] = "  <<showEff%s(%s)>/@onItemHuiShouFunc,%s|%s>  ";
			ItemStr[i] = xStr;
		end
	end

	for i = 1,#d do
		local _,b = math.modf(i / 3);
		local hfh = "";
		if b == 0 then
			hfh = "\\\\";
			if i == 19 then
				hfh = "\\\\<(idecoLine#330)>\\\\";
			end
		end
		e = e .. string.format(formatStrs[i],rStr[i],ItemCount_bag[i],i,ItemStr[i]) .. hfh;

	end
    e = e.."  "..showShieldAndTalismanRecoryTips(sysarg,3)
	e = e .. "\\  <(c0xFF888888)*VIP2级可享受随身装备回收,黄金特权可享受自动回收功能.>"
	return e;
end

t.onShieldAndTalismanRecory = function(sysarg,nTag,nType)
    onShieldAndTalismanRecory(sysarg,nTag,nType)
    return t.main(sysarg)
end
t.onItemHuiShouFunc = function(sysarg,i) --装备回收 2017/1/5 zer

	---------------------------------------------------------------以下是主线任务引导相关
	local nowVar = get_taskflags_val(sysarg);
	local ta = task_all[nowVar];
	local sVar = Actor.getDyanmicVar(sysarg);
	local taskfor = {
		{nowVar = 29, type = 4},
		{nowVar = 42, type = 4},
		{nowVar = 61, type = 4},
		{nowVar = 83, type = 4},
		{nowVar = 86, type = 4},
		{nowVar = 90, type = 4},
		{nowVar = 95, type = 4},
		{nowVar = 98, type = 4},

	};
	local renwuzhong = 0
	for i = 1,#taskfor do
		if ta~=nil and  nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type and sVar.nowNumberOfStep == 1 then
			sVar.nowNumberOfStep = sVar.nowNumberOfStep + 1;
			MasterStokeAcceptTask(sysarg,ta.npcid);
			Actor.closeDialogs(sysarg,3)
			renwuzhong = 1
		end
	end
	---------------------------------------------------------------以上是主线任务引导相关
	if not i then return; end
	i = tonumber(i);

	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	if i == 14 and zLv < 2 then
		Actor.sendTipmsg(sysarg,"2转以上才可回收此类装备.",256);
		return;
	end

	local d = RecycledItems;
	local ItemCount_bag = {}; --装备在包裹里的数量
	local addExp = {};	--显示总经验
	local addBindgold = {};	--显示总绑金
	local addGold = {};	--显示总金币
	local addHufu = {};	--显示总护符碎片
    local addZoliacexp = {}; --显示总生肖经验
	--取出总的数量和回收资源

	local list = d[i].list;
	if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
	if not addExp[i] then addExp[i] = 0; end
	if not addBindgold[i] then addBindgold[i] = 0; end
	if not addGold[i] then addGold[i] = 0; end
	if not addHufu[i] then addHufu[i] = 0; end
    if not addZoliacexp[i] then addZoliacexp[i] = 0 end
     local zoliact={}
	for k = 1,#list do
		local n = 0
		if not( i==16 or  i==17 or i==18 or i==19) then 
			n = Actor.getItemCount(sysarg, list[k].itemid);
			Actor.removeItem(sysarg, list[k].itemid, n,-1,-1,-1);
		else 
			local needdelItem ={}
			local bagCount = Item.getBagItemCount(sysarg)
			for i=1,bagCount do 
				local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
				if itemPrt then 
					if list[k].itemid ==Item.getItemId(itemPrt)     
                        and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0   --只算不是王，帝的
                        and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel)==0 then  --不能是龙装
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
         if n > 0 and list[k].zoliacexp ~= nil and list[k].zoliacindex ~= nil then
            addZoliacexp[i] = addZoliacexp[i] + n * list[k].zoliacexp
            local t = {}
            t.exp = list[k].zoliacexp * n
            t.index = list[k].zoliacindex
            table.insert(zoliact,t)
        end
	end

	--做显示总的
	local w = {
		"回收<%s>件<%s装备>获得:",
		"<%s>经验",
		"<%s>绑定金币",
		"<%s>金币",
		"<%s>护符碎片",
        "<%s>生肖经验",
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
        if addZoliacexp[i] > 0 then
            xStr = xStr .. string.format(w[6], addZoliacexp[i]);
        end
	end

	if ItemCount_bag[i] > 0 then
		Actor.changeMoney(sysarg,0,addBindgold[i],105,"回收收购物品");
		Actor.changeMoney(sysarg,1,addGold[i],105,"回收收购物品");
		Actor.addExp(sysarg, addExp[i], "回收给经验");
  
		if addHufu[i] > 0 then
			local jadeNum = Actor.getUIntProperty(sysarg, 124)
			jadeNum = jadeNum + addHufu[i];
			Actor.setUIntProperty(sysarg, 124, jadeNum);
			Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", addHufu[i]), 1);
		end
         if #zoliact > 0 then
            InitNewZodiacInfo(sysarg)
            local svar = Actor.getStaticVar(sysarg)
            for j =1,#zoliact do
                local nIndex = zoliact[j].index
                local nAllExp = zoliact[j].exp
                if svar.newzodiac[nIndex] == nil or svar.newzodiac[nIndex].level == nil then 
                    svar.newzodiac[nIndex] = {} 
                    svar.newzodiac[nIndex].level = -1
                    svar.newzodiac[nIndex].exp = 0
                end
            
                svar.newzodiac[nIndex].exp = svar.newzodiac[nIndex].exp + nAllExp
           end
           Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s生肖经验>", addZoliacexp[i]), 1);
        end
		Actor.sendTipmsg(sysarg, xStr, 256);
		OnFinish_Liveness(sysarg,19);
		Actor.playEnergyEffect(sysarg,1,0)
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sHuiShouZhuangbei)  --申请一个数据包
		if netPack then
			DataPack.flush(netPack)
		end
		if Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) >= Actor.getActorMaxLevel() then
            Actor.sendTipmsg(sysarg,"大神你已经满级了，无法通过日常获得经验。",ttFlyTip)
        end
	else
		Actor.sendTipmsg(sysarg, xStr, 256);
	end
	
	if renwuzhong == 0 then 
		return t.main(sysarg);
	else 
		Actor.closeNPCDialog(sysarg)
	end
end

t.OnSellKuangShi = function (sysarg)

	---------------------------------------------------------------以下是主线任务引导相关
	local nowVar = get_taskflags_val(sysarg);
	local ta = task_all[nowVar];
	local sVar = Actor.getDyanmicVar(sysarg);
	local taskfor = {
		{nowVar = 29, type = 4},
		{nowVar = 42, type = 4},
		{nowVar = 61, type = 4},
		{nowVar = 83, type = 4},
		{nowVar = 86, type = 4},
		{nowVar = 90, type = 4},
		{nowVar = 95, type = 4},
		{nowVar = 98, type = 4},

	};
	for i = 1,#taskfor do
		if ta~=nil and  nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type and sVar.nowNumberOfStep == 1 then
			sVar.nowNumberOfStep = sVar.nowNumberOfStep + 1;
			MasterStokeAcceptTask(sysarg,ta.npcid);
		end
	end


	local getMoney =0
	local total =0
	for i=1,#MineralCfg.Stone do 
		local itemCount = Actor.getItemCount(sysarg,MineralCfg.Stone[i].id) 
		if itemCount>0 then
			total = total + itemCount
			Actor.removeItem(sysarg,MineralCfg.Stone[i].id,itemCount)
			getMoney = getMoney + MineralCfg.Stone[i].sellPrice * itemCount
		end
	end
	if getMoney == 0 then 
		Actor.sendTipmsg(sysarg, "您的背包没有矿石", ttFlyTip)
		return t.main(sysarg)
	else
        Actor.changeMoney(sysarg,mtBindCoin,getMoney,LogIds.huishoukuangshi,"回收矿石")
		Actor.sendTipmsg(sysarg, string.format("出售成功,获得%s绑定金币",getMoney), ttFlyTip)
		return t.main(sysarg)
	end
	
end

-----------------------------------------------------------------------------------------以下为以前老脚本,在2017年2月份之后谁看到顺手清理掉.
-- t.main2 = function(sysarg)
-- 	local echo = "";

-- 	local hsdata = t.hsdata;
-- 	local nBagItemCount = {};
-- 	local nGold1 = {};
-- 	local nGold2 = {};
-- 	local sGoldstr = {};

-- 	local wuqinum = 0;
-- 	local wuqigold1 = 0;
-- 	local wuqigold2 = 0;


-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 30 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 79, 111, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)

-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 41 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 79, 111, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 58 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 79, 111, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end


-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 81 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 52, 199, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 116 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 164, 199, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	for i = 1,#hsdata do
-- 		if not nBagItemCount[i] then nBagItemCount[i] = 0; end
-- 		if not nGold1[i] then nGold1[i] = 0; end
-- 		if not nGold2[i] then nGold2[i] = 0; end
-- 		local a,b = hsdata[i][1],hsdata[i][2]
-- 		for k = a,b do
-- 			local n = Actor.getItemCount(sysarg,k);
-- 			--if n > 0 then
-- 				nBagItemCount[i] = nBagItemCount[i] + n;
-- 				nGold1[i] = nGold1[i] + n * hsdata[i][3]
-- 				nGold2[i] = nGold2[i] + n * hsdata[i][4]

-- 			if k == a and i >= 7 then
-- 				wuqinum = wuqinum + n;
-- 				wuqigold1 = wuqigold1 + n * (hsdata[i][3] * 1.5)
-- 				wuqigold2 = wuqigold2 + n * (hsdata[i][4] * 1.5)
-- 			end
-- 			--end
-- 		end
-- 		sGoldstr[i] = string.format("&ff0000&%s&ffffff& 每件可回收获得 &ff0000&%s&ffffff& 绑定金币 ＋ &ff0000&%s&ffffff& 金币#", hsdata[i][5], hsdata[i][3], hsdata[i][4]);
-- 	end
	
-- 	local nAllCount = 0;
-- 	local nAllGold1 = 0;
-- 	local nAllGold2 = 0;
-- 	for i = 7,16 do
-- 		nAllCount = nAllCount + nBagItemCount[i];
-- 		nAllGold1 = nAllGold1 + nGold1[i];
-- 		nAllGold2 = nAllGold2 + nGold2[i];
-- 	end
	
		
-- 	for i = 1,16 do
-- 		local c,d = hsdata[i][1],hsdata[i][2]
-- 		local s=0
-- 		for k = c,d do
-- 			local n = Actor.getItemCount(sysarg,k);
-- 			s=s+n
-- 		end
-- 		hsdata[i]['count']=s
-- 	end

-- 	--<一键回收以下套装武器 (可回收数量:]]..wuqinum..[[)/@shsallsss|武器回收价值是其他装备的1.5倍# #(首充的成长武器屠龙刀属性比至尊武器还要高)# #点一下可获得: &ff0000&]]..wuqigold1..[[&ffffff& 绑金, &ff0000&]]..wuqigold2..[[&ffffff& 金币.>

-- 	echo = [[

--  <(c0xFFeabc78)点击绿色回收按钮时,系统会立刻回收包裹内所有该系列装备>
 
-- ]];

-- 	local nGold1_xinshou = 0 
-- 	local nGold2_xinshou = 0 
-- 	local ncount_xinshou=0
-- 	for i=1,6 do 
-- 		nGold1_xinshou = nGold1_xinshou + nGold1[i]
-- 		nGold2_xinshou = nGold2_xinshou + nGold2[i]
-- 		ncount_xinshou = ncount_xinshou + hsdata[i]['count']
-- 	end
	
-- 	local nGold1_All=0
-- 	local nGold2_All=0
-- 	for i=1,16 do
-- 		nGold1_All = nGold1_All + nGold1[i]
-- 		nGold2_All = nGold2_All + nGold2[i]
-- 	end
		
	
-- 	--if ncount_xinshou==nil or ncount_xinshou==0 then 
-- 		--echo = echo .. string.format("           <(c0xFF888888)%s(%s)>", "新手装备",ncount_xinshou).."     "
-- 	--else 
-- 		echo = echo .. string.format("           <%s(%s)/@shsall,2|可获得:%s绑金,%s金币>", "新手装备",ncount_xinshou, nGold1_xinshou, nGold2_xinshou).."     "
-- 	--end
	
-- 	--if hsdata[7]['count']==nil or hsdata[7]['count']==0 then 
-- 		--echo = echo .. string.format("     <(c0xFF888888)%s(%s)>", hsdata[7][5],hsdata[7]['count']).."\\\\"
-- 	--else 
-- 		echo = echo .. string.format("     <%s(%s)/@shsall,2,%s|可获得:%s绑金,%s金币>", hsdata[7][5],hsdata[7]['count'],7, nGold1[7], nGold2[7]).."\\\\"
-- 	--end
--     echo=echo.."<(idecoLine#315)>".."\\\\\\"
	
-- 	for i = 8,16 do
-- 		local hhf = " "
-- 		if hsdata[i]['count']>9 then hhf = "" end --不同数量也能对齐  
-- 		if i == 10 or i==13 or i==19 or i==16 then hhf = "\\\\" end
-- 		--if hsdata[i]['count']==nil or hsdata[i]['count']==0 then 
-- 			--echo = echo .. string.format("     <(c0xFF888888)%s(%s)>", hsdata[i][5],hsdata[i]['count'])..hhf;
-- 		--else 
-- 			echo = echo .. string.format("     <%s(%s)/@shsall,2,%s|可获得:%s绑金,%s金币>", hsdata[i][5],hsdata[i]['count'],i, nGold1[i], nGold2[i])..hhf;
-- 		--end
-- 		if i==16 then echo=echo.."<(idecoLine#315)>" ..hhf end
-- 	end
	
-- 	--if nGold1_All==0 and  nGold2_All==0 then
-- 		--echo = echo .."\\\\".. string.format("                       <(c0xFF888888)%s>", "全部回收");
-- 	--else 
-- 		echo = echo .."\\\\".. string.format("                       <%s/@shsall,2,1,16|可获得:%s绑金,%s金币>", "全部回收", nGold1_All, nGold2_All);
-- 	--end
	
-- 	return echo;
-- end





-- t.main1 = function(sysarg)
-- 	local echo = "";

-- 	local hsdata = t.hsdata;
-- 	local nBagItemCount = {};
-- 	local nGold1 = {};
-- 	local nGold2 = {};
-- 	local sGoldstr = {};

-- 	local wuqinum = 0;
-- 	local wuqigold1 = 0;
-- 	local wuqigold2 = 0;

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 30 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 84, 109, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 41 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 84, 109, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 58 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 84, 109, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end


-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 81 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 51, 192, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	local nowVar =get_taskflags_val(sysarg)
-- 	local ta = task_all[nowVar]
-- 	if nowVar == 116 and ta.type == 4 then   --需要改的now
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 		sVar.nowNumberOfStep=1
-- 		Actor.openarrowsguide(sysarg, 1005, 51, 192, 2);
-- 		Actor.addTimer(sysarg,20,60*1000)
-- 	end

-- 	for i = 1,#hsdata do
-- 		if not nBagItemCount[i] then nBagItemCount[i] = 0; end
-- 		if not nGold1[i] then nGold1[i] = 0; end
-- 		if not nGold2[i] then nGold2[i] = 0; end
-- 		local a,b = hsdata[i][1],hsdata[i][2]
-- 		for k = a,b do
-- 			local n = Actor.getItemCount(sysarg,k);
-- 			--if n > 0 then
-- 				nBagItemCount[i] = nBagItemCount[i] + n;
-- 				nGold1[i] = nGold1[i] + n * hsdata[i][3]
-- 				nGold2[i] = nGold2[i] + n * hsdata[i][4]

-- 			if k == a and i >= 7 then
-- 				wuqinum = wuqinum + n;
-- 				wuqigold1 = wuqigold1 + n * (hsdata[i][3] * 1.5)
-- 				wuqigold2 = wuqigold2 + n * (hsdata[i][4] * 1.5)
-- 			end
-- 			--end
-- 		end
-- 		sGoldstr[i] = string.format("&ff0000&%s&ffffff& 每件可回收获得 &ff0000&%s&ffffff& 绑定金币 ＋ &ff0000&%s&ffffff& 金币#", hsdata[i][5], hsdata[i][3], hsdata[i][4]);
-- 	end

-- 	local nAllCount = 0;
-- 	local nAllGold1 = 0;
-- 	local nAllGold2 = 0;
-- 	for i = 1,22 do
-- 		nAllCount = nAllCount + nBagItemCount[i];
-- 		nAllGold1 = nAllGold1 + nGold1[i];
-- 		nAllGold2 = nAllGold2 + nGold2[i];
-- 	end
	
-- 	for i = 1,22 do
-- 		local c,d = hsdata[i][1],hsdata[i][2]
-- 		local s=0
-- 		for k = c,d do
-- 			local n = Actor.getItemCount(sysarg,k);
-- 			s=s+n
-- 		end
-- 		hsdata[i]['count']=s
-- 	end

-- 	--<一键回收以下套装武器 (可回收数量:]]..wuqinum..[[)/@shsallsss|武器回收价值是其他装备的1.5倍# #(首充的成长武器屠龙刀属性比至尊武器还要高)# #点一下可获得: &ff0000&]]..wuqigold1..[[&ffffff& 绑金, &ff0000&]]..wuqigold2..[[&ffffff& 金币.>

	
-- 	echo = [[

--    <(c0xFFeabc78)点击绿色回收按钮时,系统会立刻回收包裹内所有该系列装备>
   
--  ]]  
 
-- 	local nGold1_xinshou = 0 
-- 	local nGold2_xinshou = 0 
-- 	local ncount_xinshou=0
-- 	for i=1,6 do 
-- 		nGold1_xinshou = nGold1_xinshou + nGold1[i]
-- 		nGold2_xinshou = nGold2_xinshou + nGold2[i]
-- 		ncount_xinshou = ncount_xinshou + hsdata[i]['count']
-- 	end
	
-- 	local nGold1_All=0
-- 	local nGold2_All=0
-- 	for i=1,22 do
-- 		nGold1_All = nGold1_All + nGold1[i]
-- 		nGold2_All = nGold2_All + nGold2[i]
-- 	end
		
	
-- 	--if ncount_xinshou==nil or ncount_xinshou==0 then 
-- 		--echo = echo .. string.format("           <(c0xFF888888)%s(%s)>", "新手装备",ncount_xinshou).."     "
-- 	--else 
-- 		echo = echo .. string.format("           <%s(%s)/@shsall,1|可获得:%s绑金,%s金币>", "新手装备",ncount_xinshou, nGold1_xinshou, nGold2_xinshou).."     "
-- 	--end
	
-- 	--if hsdata[7]['count']==nil or hsdata[7]['count']==0 then 
-- 		--echo = echo .. string.format("     <(c0xFF888888)%s(%s)>", hsdata[7][5],hsdata[7]['count']).."\\\\"
-- 	--else 
-- 		echo = echo .. string.format("     <%s(%s)/@shsall,1,%s|可获得:%s绑金,%s金币>", hsdata[7][5],hsdata[7]['count'],7, nGold1[7], nGold2[7]).."\\\\"
-- 	--end
--     echo=echo.."<(idecoLine#315)>".."\\\\\\"
	
-- 	for i = 8,22 do
-- 		local hhf = " "
-- 		if hsdata[i]['count']>9 then hhf = "" end --不同数量也能对齐  
-- 		if i == 10 or i==13 or i==19 or i==16 then hhf = "\\\\" end
-- 		--if hsdata[i]['count']==nil or hsdata[i]['count']==0 then 
-- 			--echo = echo .. string.format("     <(c0xFF888888)%s(%s)>", hsdata[i][5],hsdata[i]['count'])..hhf;
-- 		--else 
-- 			echo = echo .. string.format("     <%s(%s)/@shsall,1,%s|可获得:%s绑金,%s金币>", hsdata[i][5],hsdata[i]['count'],i, nGold1[i], nGold2[i])..hhf;
-- 		--end
-- 		if i==16 or i==22 then echo=echo.."<(idecoLine#315)>" ..hhf end
-- 	end
	
-- 	--if nGold1_All==0 and  nGold2_All==0 then
-- 		--echo = echo .."\\\\".. string.format("                       <(c0xFF888888)%s>", "全部回收");
-- 	--else 
-- 		echo = echo .."\\\\".. string.format("                       <%s/@shsall,1,1,22|可获得:%s绑金,%s金币>", "全部回收", nGold1_All, nGold2_All);
-- 	--end
	
-- 	return echo;
-- end




-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- --回收装备
-- t.shsall = function(sysarg,mainNumber,a,b)
-- 	if not a then 
-- 		a,b = 1,6
-- 	elseif not b then  
-- 		b=a
-- 	end
-- 	a,b = tonumber(a),tonumber(b);
-- 	--print("a,b="..a..b)
-- 	local hsdata = t.hsdata;
-- 	local nBagItemCount = {};
-- 	local nGold1 = {};
-- 	local nGold2 = {};
-- 	for i = a,b do
-- 		if not nBagItemCount[i] then nBagItemCount[i] = 0; end
-- 		if not nGold1[i] then nGold1[i] = 0; end
-- 		if not nGold2[i] then nGold2[i] = 0; end
-- 		local c,d = hsdata[i][1],hsdata[i][2]
-- 		for k = c,d do
-- 			local n = Actor.getItemCount(sysarg,k);
-- 			Actor.removeItem(sysarg,k,n,-1,-1,-1);
-- 			nBagItemCount[i] = nBagItemCount[i] + n;
-- 			nGold1[i] = nGold1[i] + n * hsdata[i][3]
-- 			nGold2[i] = nGold2[i] + n * hsdata[i][4]
-- 		end
-- 		hsdata[i]['count']=0 --卖出之后数量清0
-- 	end
-- 	local nAllCount = 0;
-- 	local nAllGold1 = 0;
-- 	local nAllGold2 = 0;
-- 	for i = a,b do
-- 		nAllCount = nAllCount + nBagItemCount[i];
-- 		nAllGold1 = nAllGold1 + nGold1[i];
-- 		nAllGold2 = nAllGold2 + nGold2[i];
-- 	end

-- 		local nowVar =get_taskflags_val(sysarg)
-- 		local ta = task_all[nowVar]
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 			if nowVar == 30 and ta.type == 4 and sVar.nowNumberOfStep ==1 and a==1 and b== 6 then   --需要改的now
-- 				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
-- 				MasterStokeAcceptTask(sysarg,ta.npcid)
-- 				return 
-- 			end

-- 		local nowVar =get_taskflags_val(sysarg)
-- 		local ta = task_all[nowVar]
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 			if nowVar == 41 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
-- 				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
-- 				MasterStokeAcceptTask(sysarg,ta.npcid)
-- 				return 
-- 			end

-- 		local nowVar =get_taskflags_val(sysarg)
-- 		local ta = task_all[nowVar]
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 			if nowVar == 58 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
-- 				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
-- 				MasterStokeAcceptTask(sysarg,ta.npcid)
-- 				return 
-- 			end

-- 		local nowVar =get_taskflags_val(sysarg)
-- 		local ta = task_all[nowVar]
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 			if nowVar == 81 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
-- 				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
-- 				MasterStokeAcceptTask(sysarg,ta.npcid)
-- 				return
-- 			end

-- 		local nowVar =get_taskflags_val(sysarg)
-- 		local ta = task_all[nowVar]
-- 		local sVar = Actor.getDyanmicVar(sysarg)
-- 			if nowVar == 116 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
-- 				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
-- 				MasterStokeAcceptTask(sysarg,ta.npcid)
-- 				return
-- 			end

-- 	if nAllCount > 0 then
-- 		Actor.changeMoney(sysarg,0,nAllGold1);
-- 		Actor.changeMoney(sysarg,1,nAllGold2);
-- 		OnFinish_Liveness(sysarg,19)
-- 		--Actor.sendTipmsg(sysarg,string.format("<(c0xFFd4ab6f)回收%s件装备,绑金＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),金币＋><(c0xFF00ff00)%s>",nAllCount,nAllGold1,nAllGold2),128+256);
-- 	else
-- 		Actor.sendTipmsg(sysarg,"您包裹内没有可回收的装备.",256);
-- 	end

-- 	mainNumber=tonumber(mainNumber)
-- 	if mainNumber == 1 then return t.main1(sysarg) 
-- 	elseif mainNumber==2 then return t.main2(sysarg)
-- 	end
	
-- 	--if get_taskflags_val(sysarg) == 9 then
-- 	--	set_taskflags_val(sysarg, 10);
-- 	--	Quest_ShuaXin(sysarg);
-- 	--	Actor.sendTipmsg(sysarg,"恭喜您这么快便掌握了装备回收的秘诀!",256);
-- 	--	Actor.addEffect(sysarg,161,6,500,0);
-- 	--	Actor.addTimer(sysarg, 15, 1000);
-- 	--end
-- 	--if get_taskflags_val(sysarg) == 14 then
-- 	--	set_taskflags_val(sysarg, 15);
-- 	--	Quest_ShuaXin(sysarg);
-- 	--	Actor.sendTipmsg(sysarg,"恭喜您这么快又又又又又又掌握了装备回收的秘诀!",256);
-- 	--	Actor.addEffect(sysarg,161,6,500,0);
-- 	--	Actor.addTimer(sysarg, 15, 1000);
-- 	--	--Actor.autoFindPathToNpc( sysarg, 1, Lang.EntityName.n00335 );
-- 	--end
-- 	--if get_taskflags_val(sysarg) == 18 then
-- 	--	set_taskflags_val(sysarg, 19);
-- 	--	Quest_ShuaXin(sysarg);
-- 	--	Actor.sendTipmsg(sysarg,"切记以后多多来回收装备哟,金币的用处可多了...",256);
-- 	--	Actor.addEffect(sysarg,161,6,500,0);
-- 	--	Actor.addTimer(sysarg, 15, 1000);
-- 	--	--Actor.autoFindPathToNpc( sysarg, 1, Lang.EntityName.n00336 );
-- 	--end

-- 	--local mid = Actor.getSceneId(sysarg);
-- 	--if mid ~= 1 then
-- 	--	-- if nAllCount > 0 then
-- 	--	-- 	local NpcName = Actor.getTalkNpcName(sysarg);
-- 	--	-- 	local StrNpcE = string.format("<%s/M炎龙城:127:127:%s><(x炎龙城:127:127:%s)>",NpcName,NpcName,NpcName);
-- 	--	-- 	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s回收装备获得了绑金＋<(c0xFF00ff00)%s>,金币＋<(c0xFF00ff00)%s>.", Actor.getName(sysarg), StrNpcE, nAllGold1,nAllGold2),128);
-- 	--	-- end
-- 	--	return t.main(sysarg);
-- 	--else
-- 	--	Actor.closearrowsguide(sysarg,1005);
-- 	--end
-- end
-- ---------------------------------------------------------------------------------------------------------------------------------------------






-- t.ckall = function(sysarg,a,b)
-- 	a,b = tonumber(a),tonumber(b);
-- 	local hsdata = t.hsdata;
-- 	local str = ""
-- 	for i = a,b do
-- 		str = str .. string.format("<(c0xFF00FF00)%s> <(c0xFF888888)单件回收价值:> <(c0xFF00FF00)%s> <(c0xFF888888)绑金,> <(c0xFF00FF00)%s> <(c0xFF888888)金币.>\\", hsdata[i][5], hsdata[i][3], hsdata[i][4]);
-- 	end
-- 	Actor.sendTipmsg(sysarg, str, 4);
-- end


function GetNpcZhuangBeiHuiShou() return t end