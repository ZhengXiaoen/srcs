--vip回收回调全局脚本,切勿重名!!!
--#include "data\functions\SpecialTitle.lua" once
--#include "data\config\ActorEvent\MineralCfg.lua" once
--#include "data\config\item\RecycledItems.lua" once	--装备回收配置
--#include "data\functions\ShieldAndTalismanRecory.lua" once
local HuiShouData = {};
LocalDT.VipRecoveryAutoUseMaterialIds = {
	[488] = true, [489] = true, [490] = true, -- 成就令牌
	[531] = true, [532] = true, [533] = true, [534] = true, [535] = true, [536] = true, -- 护符碎片
	[537] = true, [538] = true, [539] = true, -- 宝石结晶
	[527] = true, [528] = true, [529] = true, [530] = true, -- 特戒结晶
	[542] = true, [543] = true, [544] = true, -- 转生修为丹
	[565] = true, [566] = true, [567] = true, [568] = true, [569] = true, [570] = true, -- 护盾碎片
	[572] = true, [573] = true, [574] = true, -- 圣珠结晶
	[6297] = true, [6374] = true, [6298] = true, -- 元神丹
	[5165] = true, [5166] = true, [5167] = true, [5168] = true, [5171] = true, -- 神魂
	[5645] = true, [5646] = true, [5647] = true, -- 斗笠精华
	[7194] = true, [7195] = true, [7196] = true, -- 火龙结晶
	[551] = true, [552] = true, [553] = true, -- 战将灵力丹
	[6912] = true, [6913] = true, [6914] = true, [6915] = true, [6916] = true, [6917] = true,
	[7151] = true, [7152] = true, [7153] = true, [7154] = true, [7155] = true,
	[7780] = true, [7781] = true, [7782] = true, [7783] = true, [7784] = true, [7785] = true, -- 仙钻
	[508] = true,
}
LocalDT.IsVipMaterialAutoUseEnabled = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.autoUseMaterials == nil then
		if var.autoUseGemFragments == 1 or var.autoUseHolyPearlFragments == 1 or var.autorecoyhufu ~= nil then
			var.autoUseMaterials = 1
		else
			var.autoUseMaterials = 0
		end
	end
	var.autoUseGemFragments = nil
	var.autoUseHolyPearlFragments = nil
	var.autorecoyhufu = nil
	return var.autoUseMaterials == 1
end
function VipRecoveryInit(sysarg)
	local e = "<title/VIP随身回收特权>\\  <(c0xFFeabc78)点击对应的套装名按钮即可回收包裹内对应的套装.>\\\\";
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
			if not( i==17 or i==18 or i == 16 or i==19 )then 
				n = Actor.getItemCount(sysarg, list[k].itemid);
			else 
				local bagCount = Item.getBagItemCount(sysarg)
				for i=1,bagCount do 
					local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
					if itemPrt then 
						if list[k].itemid ==Item.getItemId(itemPrt) 
                            and  Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0   --只算不是王，帝的
                            and  Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel)==0 then --不能回收龙装
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
			formatStrs[i] = "  <%s(%s)/@onVipItemHuiShouFunc,%s|%s>  ";
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
			formatStrs[i] = "  <<showEff%s(%s)>/@onVipItemHuiShouFunc,%s|%s>  ";
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
    e = e.."  "..showShieldAndTalismanRecoryTips(sysarg,1).."\\"

	e = e .. "  <#c0xFFFFFF00#自动回收设置/@onVipAutomaticHs|购买黄金特权可享受此功能#开启后每10秒自动进行回收>\\";
	
	--这个是体验卡体验回收，不是真正的vip2
	local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
	if myVipLevel<2 then 
		--Actor.openarrowsguide(sysarg, 1005, 20, 110, 2);
		e= e.."  体验卡到82级就失效了,vip2可无限制开启, <[成为VIP2]/@@showWin,14>"
	end
	
	
	
	--任务
	local nowVar = get_taskflags_val(sysarg);
	local ta = task_all[nowVar];
	local sVar = Actor.getDyanmicVar(sysarg);
	local taskfor = {
		{nowVar = 83, type = 4, x = 2, y = 114},
		{nowVar = 86, type = 4, x = 2, y = 114},
		--{nowVar = 90, type = 4, x = 2, y = 114},
	};

	for i = 1,#taskfor do
		if ta~=nil and nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type then
			sVar.nowNumberOfStep = 1;
			Actor.openarrowsguide(sysarg, 1005, taskfor[i].x, taskfor[i].y, 2);
			Actor.addTimer(sysarg,20,7*1000);
		end
	end
	

	return e;
end

function onVipAutomaticHs(sysarg)
    if IsSpeciaTitleVip(sysarg,3)==false then
        Actor.sendTipmsg(sysarg,"黄金特权才可享受此功能",256);
        return;
    end
	local e = [[
<title/VIP自动回收设置>
  <(c0xFFeabc78)请选择要自动回收或自动使用的项目:>\
]];
	local str = "  <#c0xFFFFFF00#自动回收%s/@onVipAutomaticHsEx,%s>%s ";--%s
    local n = 0
	for i = 2,12 do
		local d = RecycledItems[i];
		if d.notAuto == nil then 
	
			local v = 117 + i;
			local kg = "<未开启>";
			local kge = "开启";
			if get_d_val(sysarg,v) == 1 then
				kg = "<(c0xFF00FF00)已开启>"
				kge = "关闭";
			end
			if i ~= 3 then
				e = e .. string.format(str, d.title, i,kg );  --kge,
			end
			if n > 0 and n % 2 == 0 then
				e = e.."\\\\"
			end
			n = n + 1
		end
	end
	
	--get_d_val写得超级乱，建议不要再用。。。。
	--有可能13~19和其他哪里的重了，使得默认为自动开启，现在特殊处理一下
	for i=13,20 do 
		local d = RecycledItems[i];
		if d.notAuto == nil and i ~= 19 then 
	
			local v = i;
			local kg = "<未开启>";
			local kge = "开启";
			local var = Actor.getStaticVar(sysarg)
			if var.dealAutoSell ==nil then 
				var.dealAutoSell={}
			end
			if var.dealAutoSell[v]~=nil and var.dealAutoSell[v]==1 then 
			--if get_d_val(sysarg,v) == 1 then
				kg = "<(c0xFF00FF00)已开启>"
				kge = "关闭";
			end
			
			e = e .. string.format(str, d.title, i,kg );  --kge,
			
			if n > 0 and n % 2 == 0 then
				e = e.."\\\\"
			end
			n = n + 1
		end
	end
	e = e .. "\\\\"
	local status = "<未开启>"
	if LocalDT.IsVipMaterialAutoUseEnabled(sysarg) then
		status = "<(c0xFF00FF00)已开启>"
	end
	e = e .. string.format("  <#c0xFFFFFF00#材料自动使用/@onVipAutomaticHsEx,21|自动使用宝石、圣珠、护盾、护符、转生丹、元神丹、特戒结晶、神魂、斗笠精华、火龙结晶、战将灵力丹、成就令牌、血炼精华、仙力、仙钻、金砖(绑金)>%s ", status)
	return e;
end

function onVipAutomaticHsEx(sysarg,i)
	if not i then return; end
	if IsSpeciaTitleVip(sysarg,3) == false then return end
	i = tonumber(i);
	if not i then return end
	if i>=2 and i<=12 then 
		local v = 117 + i;
		if get_d_val(sysarg,v) == 1 then
			set_d_val(sysarg,v,0);
		else
			set_d_val(sysarg,v,1);
		end
	elseif i >= 13 and i <= 20 then
		local v = i;
		
		local var = Actor.getStaticVar(sysarg)
		if var.dealAutoSell ==nil then 
			var.dealAutoSell={}
		end
			
		if var.dealAutoSell[v]~=nil and var.dealAutoSell[v]==1 then 
			var.dealAutoSell[v]=0
		else
			var.dealAutoSell[v]=1
		end
	elseif i == 21 then
		local var = Actor.getStaticVar(sysarg)
		if LocalDT.IsVipMaterialAutoUseEnabled(sysarg) then
			var.autoUseMaterials = 0
		else
			var.autoUseMaterials = 1
		end
	end
	return onVipAutomaticHs(sysarg);
end

-- 沿用各材料手动使用的消耗、属性增长、排行和日志逻辑。
function VipAutoUseMaterials(sysarg)
	if IsSpeciaTitleVip(sysarg,3) == false then return end
	if not LocalDT.IsVipMaterialAutoUseEnabled(sysarg) then return end

	local itemConfigs = {}
	for _, config in ipairs(zJuanZhouAdd) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] then
			itemConfigs[config.item_id] = {func = onJuanZhouAdd, params = config}
		end
	end
	for _, config in ipairs(FuSoulAdd) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] then
			itemConfigs[config.item_id] = {func = onFuSoulAdd, params = config}
		end
	end
	for _, config in ipairs(zAchievement) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] then
			itemConfigs[config.item_id] = {func = onAchievementFunc, params = config}
		end
	end
	for _, config in ipairs(CircleExp) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] then
			itemConfigs[config.item_id] = {func = onCircleExp, params = config}
		end
	end
	for _, config in ipairs(zGnItem100) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] and not itemConfigs[config.item_id] then
			itemConfigs[config.item_id] = {func = onZhaoCaiFu, params = config}
		end
	end
	for _, config in ipairs(JSLingLiDanUseTable) do
		if LocalDT.VipRecoveryAutoUseMaterialIds[config.item_id] then
			local count = Actor.getItemCount(sysarg, config.item_id)
			if count > 0 then
				onUseJSLingLiDan(sysarg, config.item_id, nil, config, 0, count)
			end
		end
	end

	for index = Item.getBagItemCount(sysarg) - 1, 0, -1 do
		local itemPtr = Item.getItemPtrByIndex(sysarg, index)
		if itemPtr then
			local itemId = Item.getItemId(itemPtr)
			local handler = itemConfigs[itemId]
			if handler then
				local count = Item.getItemProperty(sysarg, itemPtr, Item.ipItemCount, 0)
				if count and count > 0 then
					handler.func(sysarg, itemId, itemPtr, handler.params, 0, count)
				end
			end
		end
	end
end

function onVipItemHuiShouFunc(sysarg,i) --装备回收 2017/1/5 zer

	---------------------------------------------------------------以下是主线任务引导相关
	local nowVar = get_taskflags_val(sysarg);
	local ta = task_all[nowVar];
	local sVar = Actor.getDyanmicVar(sysarg);
	local taskfor = {
		{nowVar = 83, type = 4},
		{nowVar = 86, type = 4},
		--{nowVar = 90, type = 4},
	};
	for i = 1,#taskfor do
		if ta~=nil and  nowVar == taskfor[i].nowVar and ta.type == taskfor[i].type and sVar.nowNumberOfStep == 1 then
			sVar.nowNumberOfStep = sVar.nowNumberOfStep + 1;
			MasterStokeAcceptTask(sysarg,ta.npcid);
			Actor.closeDialogs(sysarg,3)
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
    if not addZoliacexp[i] then addZoliacexp[i] = 0 end
	if not addHufu[i] then addHufu[i] = 0; end
    local zoliact={}
	for k = 1,#list do
		local n = 0
		if not(  i==17 or i==18 or i == 16 or i==19) then 
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
                        and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel)==0 then --不能回收龙装
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
		"<VIP>回收<%s>件<%s装备>获得:",
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
		Actor.changeMoney(sysarg,0,addBindgold[i],105,"vip随身回收收购物品");
		Actor.changeMoney(sysarg,1,addGold[i],105,"vip随身回收收购物品");
		Actor.addExp(sysarg, addExp[i], "vip随身回收给经验");

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
	return VipRecoveryInit(sysarg);
end

function onVipItemHuiShouFuncEx(sysarg,i) --每在线10秒自动回收装备设置 2017/5/8 zer
	-- if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < 5 then return; end
    if IsSpeciaTitleVip(sysarg,3) == false then	--判断是否有黄金特权
        return;
    end
	if not i then return; end
	i = tonumber(i);

	local d = RecycledItems;
    if d[i].notAuto ~= nil then return end
	local ItemCount_bag = {}; --装备在包裹里的数量
	local addExp = {};	--显示总经验
	local addBindgold = {};	--显示总绑金
	local addGold = {};	--显示总金币
	local addHufu = {};	--显示总护符碎片
    local addZoliacexp = {}
    if not addHufu[i] then addHufu[i] = 0; end
    local zoliact={}
	--取出总的数量和回收资源
	local list = d[i].list;
	if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
	if not addExp[i] then addExp[i] = 0; end
	if not addBindgold[i] then addBindgold[i] = 0; end
	if not addGold[i] then addGold[i] = 0; end
	if not addHufu[i] then addHufu[i] = 0; end
    if not addZoliacexp[i] then addZoliacexp[i] = 0 end
	for k = 1,#list do
		local n = Actor.getItemCount(sysarg, list[k].itemid);
		Actor.removeItem(sysarg, list[k].itemid, n,-1,-1,-1);
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
		"<VIP自动回收%s>件<%s装备>获得:",
		"<%s>经验",
		"<%s>绑定金币",
		"<%s>金币",
		"<%s>护符碎片",
         "<%s>生肖经验",
	};
	local xStr = "";
	if ItemCount_bag[i] > 0 then
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
		Actor.changeMoney(sysarg,0,addBindgold[i],105,"vip随身回收收购物品");
		Actor.changeMoney(sysarg,1,addGold[i],105,"vip随身回收收购物品");
		Actor.addExp(sysarg, addExp[i], "vip随身回收给经验");

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
	end

end













-- --提取
-- function VipRecoveryInit_tiqu(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);

-- 	local e = string.format("\\    <(c0xFF705e45)您当前的> <(c0xFFeabc78)%s> <(c0xFF705e45)库存为> <(c0xFFeabc78)%s> <(c0xFF705e45)件>\\\\", HuiShouData[i][5], get_d_val(sysarg, i-6+99));
-- 	for k = HuiShouData[i][1],HuiShouData[i][2] do
-- 		e = e .. string.format("    %s <点击提取/@VipRecoveryInit_tiqu_on,%s,%s>\\\\", Item.getItemLinkMsg(k), i, k );
-- 	end
-- 	e = e .. "    <返回上页/@VipRecoveryInit>";
-- 	return e;
-- end
-- --提取on
-- function VipRecoveryInit_tiqu_on(sysarg,i,k)
-- 	if not i then return; end
-- 	if not k then return; end
-- 	i = tonumber(i);
-- 	k = tonumber(k);
-- 	local val = i - 6 + 99;
-- 	if Item.getBagEmptyGridCount(sysarg)>0 then 
-- 		if get_d_val(sysarg, val) >= 1 then
-- 			del_d_val(sysarg, val, 1);
-- 			Actor.addItem(sysarg, k, 0, 0, 1);
-- 		else
-- 			Actor.sendTipmsg(sysarg,"您没有可提取的此类装备.",256);
-- 		end
-- 	else 
-- 		Actor.sendTipmsg(sysarg,"您的背包空间不足.",256);
-- 	end
-- 	return VipRecoveryInit_tiqu(sysarg,i);
-- end

-- --回收
-- function VipRecoveryInit_huishou(sysarg,k,u)
-- 	if not k then return; end
-- 	if not u then return; end
-- 	k = tonumber(k);
-- 	u = tonumber(u);
-- 	local a,b = HuiShouData[k][3],HuiShouData[k][4];
-- 	local nGold1 = 0;
-- 	local nGold2 = 0;
-- 	local n = get_d_val(sysarg, 99 + u);
-- 	nGold1 = n * a;
-- 	nGold2 = n * b;
-- 	if n > 0 then
-- 		del_d_val(sysarg, 99 + u, n);
-- 		Actor.changeMoney(sysarg, 0, nGold1);
-- 		Actor.changeMoney(sysarg, 1, nGold2);
-- 		Actor.sendTipmsg(sysarg,string.format("回收%s件装备,绑金＋%s,金币＋%s",n,nGold1,nGold2),1);
-- 	else
-- 		Actor.sendTipmsg(sysarg,"此类没有可回收的装备.",256);
-- 	end
-- 	if n > 10 then
-- 		local StrNpcE = "<VIP随身回收(VIP2级特权)>";
-- 		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s回收装备获得了绑金＋<(c0xFF00ff00)%s>,金币＋<(c0xFF00ff00)%s>.", Actor.getName(sysarg), StrNpcE, nGold1,nGold2),128);
-- 	end
-- 	return VipRecoveryInit(sysarg);
-- end

-- --合成
-- function VipRecoveryInit_hc(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);
-- 	local val = 99 + i;
-- 	if get_d_val(sysarg, val-1) >= 2 then
-- 		local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
-- 		local del_ngold = a * 200;
-- 		local MC = 2;
-- 		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
-- 		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
-- 		if MC == 2 then
-- 			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
-- 			return ;
-- 		end
-- 		Actor.changeMoney(sysarg, MC, -del_ngold);
-- 		del_d_val(sysarg, val-1, a*2);
-- 		add_d_val(sysarg, val, a);
-- 		Actor.sendTipmsg(sysarg,"恭喜您合成了"..a.."件装备.",256);
-- 		OnFinish_Liveness(sysarg,20)
-- 	else
-- 		Actor.sendTipmsg(sysarg,"没有可合成的装备.(合成所需要的装备数量大于2)",256);
-- 	end
-- 	return VipRecoveryInit(sysarg);
-- end
-- function VipRecoveryInit_hc2(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);
-- 	local val = 99 + i;
-- 	if get_d_val(sysarg, val-1) >= 2 then
-- 		local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
-- 		local del_ngold = a * 2000;
-- 		local MC = 2;
-- 		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
-- 		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
-- 		if MC == 2 then
-- 			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
-- 			return ;
-- 		end
-- 		local needi = 2 ^ (i-10) / 2 * a;
-- 		if Actor.getItemCount(sysarg, 318) < needi then
-- 			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败..", Item.getItemName(318), needi), 256);
-- 			return;
-- 		end
-- 		Actor.removeItem(sysarg, 318, needi, -1,-1,-1);
-- 		Actor.changeMoney(sysarg, MC, -del_ngold);
-- 		del_d_val(sysarg, val-1, a*2);
-- 		add_d_val(sysarg, val, a);
-- 		Actor.sendTipmsg(sysarg,"恭喜您合成了"..a.."件装备.",256);
-- 		OnFinish_Liveness(sysarg,20)
-- 	else
-- 		Actor.sendTipmsg(sysarg,"没有可合成的装备.(合成所需要的装备数量大于2)",256);
-- 	end
-- 	return VipRecoveryInit(sysarg);
-- end

function VipRecoveryInit_Auto(sysarg,itemId)
 --    if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < 5 then return false end --vip5以上
 --    if System.isInTimeRange(0,0,0,7,0,0) == false then return false end  --不在0:00-7:00时间段 
 --    for i = 7,22 do
	-- 	k = i - 6;
	-- 	local a,b = HuiShouData[i][1],HuiShouData[i][2];
 --        if itemId >= a and itemId <= b then
 --            add_d_val(sysarg, 99 + k, 1);
 --            Actor.sendTipmsg(sysarg,Item.getItemName(itemId).."已自动存储到vip仓库",ttFlyTip)
 --            return true
 --        end
		
	-- end
 --    return false;
end

-- function VipRecoveryInit_Equip(sysarg,isNpc)
   
--     if isNpc == nil then 
--         if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < 5 then return false end --vip5以上
--         if System.isInTimeRange(0,0,0,7,0,0) == false then return false end  --不在0:00-7:00时间段  
--     end

    
-- 	for i = 7,22 do
-- 		k = i - 6;
-- 		local a,b = HuiShouData[i][1],HuiShouData[i][2];
      
-- 		for i = a,b do
-- 			local n = Actor.getItemCount(sysarg,i);
--             if n > 0 then
--                 Actor.removeItem(sysarg,i,n,-1,-1,-1);
-- 			    add_d_val(sysarg, 99 + k, n);
--                 if isNpc == nil then
--                     Actor.sendTipmsg(sysarg,Item.getItemName(i).."已自动存储到vip仓库",ttFlyTip)
--                 end
--             end
			
-- 		end
-- 	end
-- end
-- --一键储存包裹内7阶到22阶装备
-- function VipRecoveryInit_chucun(sysarg)
--     VipRecoveryInit_Equip(sysarg,true)
-- 	return VipRecoveryInit(sysarg);
-- end

-- function VipRecoveryInit1(sysarg)
-- 	local echo = "<title/VIP随身回收>";

-- 	local hsdata = HuiShouData;
-- 	local nBagItemCount = {};
-- 	local nGold1 = {};
-- 	local nGold2 = {};
-- 	local sGoldstr = {};

-- 	local wuqinum = 0;
-- 	local wuqigold1 = 0;
-- 	local wuqigold2 = 0;

-- 	for i = 1,#hsdata do
-- 			if not nBagItemCount[i] then nBagItemCount[i] = 0; end
-- 			if not nGold1[i] then nGold1[i] = 0; end
-- 			if not nGold2[i] then nGold2[i] = 0; end
-- 			local a,b = hsdata[i][1],hsdata[i][2]
-- 			for k = a,b do
-- 				local n = Actor.getItemCount(sysarg,k);

-- 					nBagItemCount[i] = nBagItemCount[i] + n;
-- 					nGold1[i] = nGold1[i] + n * hsdata[i][3]
-- 					nGold2[i] = nGold2[i] + n * hsdata[i][4]

-- 				if k == a and i >= 7 then
-- 					wuqinum = wuqinum + n;
-- 					wuqigold1 = wuqigold1 + n * (hsdata[i][3] * 1.5)
-- 					wuqigold2 = wuqigold2 + n * (hsdata[i][4] * 1.5)
-- 				end

-- 			end
-- 			sGoldstr[i] = string.format("&ff0000&%s&ffffff& 每件可回收获得 &ff0000&%s&ffffff& 绑定金币 ＋ &ff0000&%s&ffffff& 金币#", hsdata[i][5], hsdata[i][3], hsdata[i][4]);
-- 	end

-- 	local nAllCount = 0;
-- 	local nAllGold1 = 0;
-- 	local nAllGold2 = 0;
-- 	for i = 7,22 do
-- 		nAllCount = nAllCount + nBagItemCount[i];
-- 		nAllGold1 = nAllGold1 + nGold1[i];
-- 		nAllGold2 = nAllGold2 + nGold2[i];
-- 	end
-- 	echo = echo ..[[

--     我就是炎龙城的回收员. <(回收新手装备)/@VipRecoveryInitshsall|新手村6套新手装备点击回收>
--     我的宗旨是: 方便,快捷,手抖怪我咯
--     <一键回收以下套装武器 (可回收数量:]]..wuqinum..[[)/@VipRecoveryInitshsallsss|武器回收价值是其他装备的1.5倍# #(首充的成长武器屠龙刀属性比至尊武器还要高)# #点一下可获得: &ff0000&]]..wuqigold1..[[&ffffff& 绑金, &ff0000&]]..wuqigold2..[[&ffffff& 金币.>

-- ]];

-- 	for i = 7,22 do
-- 		local hhf = "\\"
-- 		if i == 12 or i == 16 then hhf = "\\\\"; end
-- 		echo = echo .. string.format("    <一键回收 %s (可回收数量:%s)/@VipRecoveryInitshsall,%s,%s|"..sGoldstr[i].."#点一下可获得: &ff0000&%s&ffffff& 绑金, &ff0000&%s&ffffff& 金币.>%s", hsdata[i][5], nBagItemCount[i], i, i, nGold1[i], nGold2[i], hhf);
-- 	end
-- 	return echo;
-- end
----------------------------------------------------------------------------------------------------------------------------------------------
