--秦始皇陵

local t = {

	idx = {
			{type = 0, str = "绑定金币", num = 200000},
			{type = 1, str = "金币", num = 200000},
			{type = 3, str = "元宝", num = 100},
	},
	skillid = {312,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,313,314,315,379,380,381,382,383,384,385,386,387,388,389,390,6133,6134,6135,6136,6137,4707,4708,6139,6138,6140,6141,6142,4709,4710,4712,6143,6144,4711},

};

t.main = function(sysarg)
	local d = t.idx;
	local echo = [[

  <(c0xFFb6946c)尸王殿主要产出书页,可在NPC用书页兑换成品技能书.>
  <(c0xFFb6946c)产出秦皇陵墓中有关于><神级技能><(c0xFFb6946c)的传说.> 

  <<showEff进入尸王殿>/@chuansong,2><(c0xFF888888)尸王10分钟刷新,技能神王60分钟刷新><限时30分钟>

<(idecoLine#315)>

  <<showEff进入秦始皇陵>/@chuansong,1|&FFFFFF&扣费说明:#优先扣除&FFFF00&]]..d[1].num..[[绑定金币&FFFFFF&#没有就扣&FFFF00&]]..d[2].num..[[金币&FFFFFF&#都没有就扣&FFFF00&]]..d[3].num..[[元宝##&FFFFFF&1层和2层刷新时间为10分钟(清理完当前层怪才可进入下层)#3层BOSS为20小时刷新(世界BOSS爆率)> <(c0xFF888888)小怪掉书页,BOSS为世界BOSS,><限时60分钟>

<(idecoLine#315)>

  <#c0xFFFFFF00#随机兑换1本高级技能书/@onSkillforSY,1|需要 10张书页 和 5000绑金或金币 手续费#随机获得一本技能书>

  <#c0xFFFFFF00#将高级技能书回收成书页/@onSkillforSY,2|每本技能书可回收 5 张书页>

  <#c0xFFFFFF00#点击查看可兑换和回收的技能书列表/@onSkillforSY,3>

  
]];
	return echo;
end

t.chuansong=function(sysarg,index)

	index=tonumber(index)
	if index==1 then 
		local openServerDay = System.getDaysSinceOpenServer()
		if openServerDay < 5 then
			Actor.sendTipmsg(sysarg, "入口开服第5天开启", ttFlyTip); 
			return
		end
		
		local idx = t.idx;
		local bj = 0;
		for i = 1,#idx do
			if Actor.getMoneyCount(sysarg,idx[i].type) >= idx[i].num then
				bj = i;
				break;
			end
		end
		if bj == 0 then
			Actor.sendTipmsg(sysarg, "要求不足,进入失败.", ttFlyTip); 
			return t.main(sysarg);
		end
		if not idx[bj] then return; end
		Actor.changeMoney(sysarg, idx[bj].type, -idx[bj].num, 2613,"秦始皇陵进入消耗");
		Actor.enterScene(sysarg,266,-1,-1);
	
		Actor.deleteTimer(sysarg, 28);
		set_d_val(sysarg,12,3600); --定时器记时用
		Actor.addTimer(sysarg, 28, 5000 ); --每5秒1判断，顺带给玩家提示倒计时
	
		local pack = DataPack.allocPacket(sysarg,139,237)
		DataPack.writeInt(pack,3600)
		DataPack.flush(pack)
	else 
        Actor.deleteTimer(sysarg, 28);
		set_d_val(sysarg,12,1800); --定时器记时用
		Actor.addTimer(sysarg, 28, 5000 ); --每5秒1判断，顺带给玩家提示倒计时
		Actor.enterScene(sysarg,567,39,40);
	end
end

t.onSkillforSY = function(sysarg,type,itemid)
	if not type then return; end
   
    if Item.getBagEmptyGridCount(sysarg) <= 0 then
        Actor.sendTipmsg(sysarg,"包裹空间不足1格，请清理包裹再兑换！",ttFlyTip)
        return
    end
    --传进来的参数合法性校验
    
	type = tonumber(type);
   
	local skill = t.skillid;
	local SYid = 469;
	if type == 3 then
		local str = "\\<每10张书页可从以下书籍中随机抽取1本,而以下书籍每本则可回收为5张书页.>\\<当然您也可以去威龙城推广员那里直接获取对应书籍.>\\\\";
		for i = 1,#skill do
			str = str .. Item.getItemName(skill[i]) .. ",";
			if i == 10 or i == 20 or i == 30 or i == 40 then
				str = str .. "\\";
			end
		end
		Actor.sendTipmsg(sysarg,str,4);
	end
	if type == 1 then
	    if Actor.getItemCount(sysarg, SYid) < 10 then
	        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,兑换失败..", Item.getItemName(SYid), 10), 256);
	        return ;
	    end
		local del_ngold = 5000;
		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,兑换失败.",del_ngold), 256);
			return ;
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,2611, "秦始皇陵npc兑换技能书");
		Actor.removeItem(sysarg, SYid, 10, -1,-1,-1);
		local GiveSkillItemID = skill[math.random(1,#skill)];
		Actor.addItem(sysarg, GiveSkillItemID, 0, 0, 1);
		System.broadcastTipmsg(string.format("<(n%s)>玩家在<沙漠土城>的<秦始皇陵NPC>处成功兑换获得了1本%s,可喜可贺!",Actor.getName(sysarg), Item.getItemLinkMsg(GiveSkillItemID)),ttChatWindow)
	end
	if type == 2 then
		local e = "\\    <(c0xFFb6946c)请选择您要回收的技能书:> <(c0xFFb6946c)(每本技能书回收获得5张书页)>\\";
		local ItemCount_bag = {}; --装备在包裹里的数量
		local formatStrs = {};
		local rStr = {};
		for i = 1,#skill do
			local n = Actor.getItemCount(sysarg,skill[i]);
			if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
			ItemCount_bag[i] = ItemCount_bag[i] + n;
			if ItemCount_bag[i] > 0 then
				rStr[i] = Item.getItemName(skill[i]);
				formatStrs[i] = " <<showEff%s(%s)>/@onSkillforSY,4,%s|每次点击为回收1本>  "
			else
				rStr[i] = "#c0xFF888888#" .. Item.getItemName(skill[i]);
				formatStrs[i] = " <%s(%s)/@onSkillforSY,4,%s>"
			end
		end
		for i = 1,#skill do
			local a,b = math.modf(i / 3);
			local hhf = "   ";
			if b == 0 then hhf = "  	\\"; end
			e = e .. string.format(formatStrs[i]..hhf,rStr[i],ItemCount_bag[i],skill[i]);
		end
		return e .. "                                             			<返回主页/@main>";
	end
	if type == 4 and itemid then
		if not itemid then return; end
		itemid = tonumber(itemid);
   
        local bFind = false
        for i= 1,table.getn(t.skillid) do
            if t.skillid[i] == itemid then 
                bFind = true
                break
            end
        end
        if bFind == false then 
            System.trace("waigua..shuashuye"..Actor.getName(sysarg))
            return 
        end
	    if Actor.getItemCount(sysarg, itemid) < 1 then
	        Actor.sendTipmsg(sysarg, string.format("您包裹内的 <%s> 不足 <%s> 本,回收失败..", Item.getItemName(itemid), 1), 256);
	        return ;
	    end
		Actor.removeItem(sysarg, itemid, 1, -1,-1,-1);
		Actor.addItem(sysarg, SYid, 0, 0, 5);
		Actor.sendTipmsg(sysarg,"回收成功.", ttFlyTip);
		return t.onSkillforSY(sysarg,2);
	end
end

function GetNpcQinShiHuangLing() return t end