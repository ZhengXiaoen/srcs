--#include "data\config\Legion\LegionId.lua" once


local LEGIONCFG =
{
	MinLevel = 60, --加入军团最低等级
	MapOffer = 50000, --军团地图消耗贡献值
	MapId = 90,			--军团地图传送id
	MapRange = {127,67,15,15},			--进入的场景坐标}
	Exp = 5000000,		--消耗总贡献度加一小时双倍经验

	upgradelist = {
		[1] = {nGold = 20000, nProps = { {item = 319, num = 1}, {item = 320, num = 1}, {item = 321, num = 1}, }},
		[2] = {nGold = 50000, nProps = { {item = 328, num = 1}, {item = 329, num = 1}, {item = 330, num = 1}, }},
		[3] = {nGold = 100000, nProps = { {item = 337, num = 1}, {item = 338, num = 1}, {item = 339, num = 1}, }},
		[4] = {nGold = 150000, nProps = { {item = 355, num = 1}, {item = 356, num = 1}, {item = 357, num = 1}, }},
		[5] = {nGold = 200000, nProps = { {item = 364, num = 1}, {item = 365, num = 1}, {item = 366, num = 1}, }},
		[6] = {nGold = 300000, nProps = { {item = 403, num = 1}, {item = 404, num = 1}, {item = 405, num = 1}, }},
		[7] = {nGold = 500000, nProps = { {item = 412, num = 1}, {item = 413, num = 1}, {item = 414, num = 1}, }},
		[8] = {nGold = 1000000, nProps = { {item = 421, num = 2}, {item = 422, num = 2}, {item = 423, num = 2}, }},
		[9] = {nGold = 2000000, nProps = { {item = 469, num = 30}, }},
		[10] = {nGold = 5000000, nProps = { {item = 430, num = 1}, {item = 439, num = 1}, {item = 448, num = 1}, }},
	},

	mapdata = {
		{type = 2, mapid = 13, lv = 65, mapname =	"变异洞窟", },
		{type = 2, mapid = 15, lv = 70, mapname =	"幽冥矿区", },
		{type = 2, mapid = 18, lv = 72, mapname =	"死亡棺材", },
		{type = 2, mapid = 20, lv = 74, mapname =	"异教宫殿", },
		{type = 2, mapid = 23, lv = 76, mapname =	"虚空古墓", },
		{type = 2, mapid = 26, lv = 78, mapname =	"破碎寺庙", },
		{type = 2, mapid = 29, lv = 80, mapname =	"蛮荒禁地", },

		{type = 3, mapid = 33, lv = 0, zlv = 1, mapname =	"迷失宫殿",	szcc = "一转", },
		{type = 3, mapid = 36, lv = 0, zlv = 2, mapname =	"赤月洞窟",	szcc = "二转", },
		{type = 3, mapid = 40, lv = 0, zlv = 3, mapname =	"妖族幻境",	szcc = "三转", },
		{type = 3, mapid = 43, lv = 0, zlv = 4, mapname =	"修罗地宫",	szcc = "四转", },
		{type = 3, mapid = 47, lv = 0, zlv = 5, mapname =	"吕 祖 峰",	szcc = "五转", },
		{type = 3, mapid = 51, lv = 0, zlv = 6, mapname =	"龙 王 湾",	szcc = "六转", },
		{type = 3, mapid = 55, lv = 0, zlv = 7, mapname =	"炽 焰 山",	szcc = "七转", },
		{type = 3, mapid = 57, lv = 0, zlv = 8, mapname =	"雷炎魔窟",	szcc = "八转", },
		{type = 3, mapid = 65, lv = 0, zlv = 9, mapname =	"极北之地",	szcc = "九转", },

	},

	LegionTitle = {
			Lt = {"雷霆","光芒","烈焰"},
			Title = {
				[1] = {c = "c8fe86", str = {"战士","法士","道士"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂1层掉落相关装备", come = "<进入散人殿堂1层/@@GetbranchAward,shenmizhidain,1|点击免费之飞到殿堂1层#军团提升材料在此地图掉落获得>" },
				[2] = {c = "c8fd1f", str = {"战将","法魂","道玄"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂1层掉落相关装备", come = "<进入散人殿堂1层/@@GetbranchAward,shenmizhidain,1|点击免费之飞到殿堂1层#军团提升材料在此地图掉落获得>" },
				[3] = {c = "f2fe50", str = {"战狂","法灵","道魂"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂2层掉落相关装备", come = "<进入散人殿堂2层/@@GetbranchAward,shenmizhidain,2|点击免费之飞到殿堂2层#军团提升材料在此地图掉落获得>" },
				[4] = {c = "f8fd1b", str = {"战王","法王","道灵"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂3层掉落相关装备", come = "<进入散人殿堂3层/@@GetbranchAward,shenmizhidain,3|点击免费之飞到殿堂3层#军团提升材料在此地图掉落获得>" },
				[5] = {c = "fed05e", str = {"战圣","法尊","道尊"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂3层掉落相关装备", come = "<进入散人殿堂3层/@@GetbranchAward,shenmizhidain,3|点击免费之飞到殿堂3层#军团提升材料在此地图掉落获得>" },
				[6] = {c = "fdbe0b", str = {"武将","魔魂","天将"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂4层掉落相关装备", come = "<飞殿堂4层/@@GetbranchAward,shenmizhidain,4|点击免费之飞到殿堂4层>" },
				[7] = {c = "fe8134", str = {"武狂","魔灵","天玄"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂5层掉落相关装备", come = "<飞殿堂5层/@@GetbranchAward,shenmizhidain,5|点击免费之飞到殿堂5层>" },
				[8] = {c = "fd530f", str = {"武王","魔王","天魂"}, upgrade = "提升到%s需要达到以下需求:##%s#散人殿堂5层掉落相关装备", come = "<飞殿堂5层/@@GetbranchAward,shenmizhidain,5|点击免费之飞到殿堂5层>" },
				[9] = {c = "fd3a2b", str = {"武尊","魔尊","天灵"}, upgrade = "提升到%s需要达到以下需求:##%s#秦始皇陵掉落书页", come = "<秦始皇陵/@@GetbranchAward,HelpToStrong,9>" },
				[10] = {c = "ff0000", str = {"武圣","魔神","天尊"}, upgrade = "提升到%s需要达到以下需求:##%s#转生BOSS掉落相关装备", come = "<飞BOSS之家/@@GetbranchAward,HelpToStrong,5|首领之家拥有海量高级Boss,其中不乏出现高转生级别老怪.#每日产出大量超级极品装备,里面竞争激烈啊!>" },
			},
		},

}


local t = {}
t.main = function(sysarg)
	--Quest_ShuaXin(sysarg);
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	if  ta~=nil and nowVar == 67 and ta.type == 4 then   --需要改的now
		if Actor.getLegionId(sysarg) > 0 then--已经加入军团
			MasterStokeAcceptTask(sysarg,ta.npcid)	
			return 
		else 
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			if t.getLegionLowCount(sysarg)==1 then Actor.openarrowsguide(sysarg, 1005, 37, 183, 2)
			elseif t.getLegionLowCount(sysarg)==2 then Actor.openarrowsguide(sysarg, 1005, 37, 211, 2)
			elseif t.getLegionLowCount(sysarg)==3 then Actor.openarrowsguide(sysarg, 1005, 37, 259, 2)
			end
			Actor.addTimer(sysarg,20,7*1000)
		end
	end
	
	--local taskTable = {93,98,104,108,112}
	--for i=1,5 do 
	--	if get_taskflags_val(sysarg)== taskTable[i] then --已经提前完成了提升军阶的任务了
	--		Actor.openarrowsguide(sysarg, 1005, 320, 133, 1)
	--	end
	--end
	
	

	local dlgStr = "\\    <(c0xFFb6946c)我是军团管理员,加入军团可进入军团专用地图打装备.>\\    <(c0xFFfddc00)军团长> <(c0xFFb6946c)享受攻击> <(c0xFFdb1313)伤害+5%> <(c0xFFb6946c)的永久BUFF.>\\    <(c0xFFb6946c)赶紧加入军团抢夺军团长吧.>\\\\<(idecoLine#315)>\\\\"

	local legionId = Actor.getLegionId(sysarg)
		
	if legionId > 0 then
		--t.zhuxiant(sysarg);
		return t.getLegionInfo(sysarg)
	end
	--dlgStr = dlgStr .. "\\    <(c0xFFeabc78)三个军团没区别,跟着感觉走吧.>\\\\"
    local nLowCount = t.getLegionLowCount(sysarg)
    --print("最少军团人数索引:"..nLowCount)
    local hot = ""
	for i = 1,table.getn(LEGIONID) do
        if i == nLowCount then
            hot = " <(c0xFFeabc78)(推荐加入此军团)>"
        else hot = ""
        end
		dlgStr = dlgStr.."    <加入"..LEGIONID[i].Name.."/@addLegion,"..LEGIONID[i].ID..">"..hot.." \\\\"
	end

	return dlgStr


end


-- t.zhuxiant = function(sysarg)
-- 	---------------主线任务相关
-- 	if get_taskflags_val(sysarg) == 25 then
-- 		set_taskflags_val(sysarg, 26);
-- 		Quest_ShuaXin(sysarg);
-- 		Actor.sendTipmsg(sysarg, "任务完成,可以去找传送员进入威龙城闯荡了!", ttFlyTip);
-- 	end
-- 	--------------------------------------
-- end


--加入军团
--legion 军团 1.雷霆 2.光芒 3.烈焰
t.addLegion = function(sysarg,legionId)
	legionId = tonumber(legionId)
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)


	if Actor.getLegionId(sysarg) > 0 then
		Actor.sendTipmsg(sysarg,"阁下已经加入了军团，无法再次加入",ttFlyTip)
		if  ta~=nil and nowVar == 67 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			MasterStokeAcceptTask(sysarg,ta.npcid)	
			return 
		end
		return t.main
	end
	
	if legionId < 1 or legionId > table.getn(LEGIONID) then --非法军团
		return t.main
	end
	
	if Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) < LEGIONCFG.MinLevel then
		Actor.sendTipmsg(sysarg,LEGIONCFG.MinLevel.."级才可以加入军团。",ttFlyTip)
		return t.main
	end
			
	Actor.setLegionId(sysarg, legionId)
	
	local var = Actor.getStaticVar(sysarg)
	var.legionOffer = 0;

	--t.zhuxiant(sysarg);

	Actor.sendTipmsg(sysarg,"加入"..LEGIONID[legionId].Name.."成功",ttFlyTip)
	local sVar = System.getStaticVar()

	
	--判断是否开启了双倍经验
	if sVar.legion[legionId].Exp > 0 then
		Actor.addBuff(sysarg,64,199,1,1,sVar.legion[legionId].Exp * 60,"军团双倍经验",false,0,0,57)
	end
   
	sVar.legion[legionId].Count = sVar.legion[legionId].Count + 1 --军团成员数量加上1
	ShuaXinFengHao(sysarg);	--设置文字头衔 显示XX军团
	
	if  ta~=nil and nowVar == 67 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		MasterStokeAcceptTask(sysarg,ta.npcid)	
		return 
	end
	
	return t.main(sysarg)
end

t.juanxian = function(sysarg)
	if Actor.getLegionId(sysarg) == 0 then
		return "还未加入军团!"
	end
	 

end

--获取军团信息
t.getLegionInfo = function(sysarg)
	ShuaXinFengHao(sysarg);
	--Quest_ShuaXin(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local sysVar = System.getStaticVar()
	local legionInfo = sysVar.legion[legionId]
	local e = "";
	local legionName = "无"
	
	if legionInfo.Master ~= "" then
		legionName = legionInfo.Master
	end

	local sVar = System.getStaticVar();
	local Str_Double = "#c0xFF888888#开启军团双倍经验";
	if Actor.getName(sysarg) == sVar.legion[legionId].Master then
		Str_Double = "开启军团双倍经验";
	end


	

	local upgradelist = LEGIONCFG.upgradelist;
	local updl = {};
	for i = 1,#upgradelist do
		updl[i] = "";
		local upnP = upgradelist[i].nProps;
		for k = 1,#upnP do
			updl[i] = updl[i] .. string.format("%s.收集 %s %s个#", k, Item.getItemName(upnP[k].item), upnP[k].num);
			if k == #upnP then
				updl[i] = updl[i] .. string.format("%s.绑金或金币%s万#", k+1, (upgradelist[i].nGold/10000) );
			end
		end
	end

	local LegionTitle = LEGIONCFG.LegionTitle;

	local jttx = get_jtname(sysarg);
	local jtlevel = get_d_val(sysarg,110);
	local privilege = {
		
		{id = 1, str = "进入军团镇狱", ltn = 0, demand = "进入需要扣除个人贡献度50000点#里面刷新大量BOSS##享受此特权需要军团军衔:%s"},
		{id = 2, str = "领取军团贡献", ltn = 1, demand = "每天可免费领取获得50000贡献度##享受此特权需要军团军衔:%s"},
		{id = 3, str = "深层危险传送", ltn = 2, demand = "直接传送到危险地图的最后一层 #每次传送消耗10000个人贡献度##享受此特权需要军团军衔:%s"},
		{id = 4, str = "领取初级药品", ltn = 3, demand = "每天可免费领取军衔(角色等级x2)瓶高级太阳水##享受此特权需要军团军衔:%s"},
		{id = 5, str = "深层转生传送", ltn = 4, demand = "直接传送到转生地图的最后一层#每次传送消耗100000个人贡献度##享受此特权需要军团军衔:%s"},
		{id = 6, str = "领取军团药品", ltn = 5, demand = "每天可免费领取军衔(角色等级x1)瓶疗伤药##享受此特权需要军团军衔:%s"},
		{id = 7, str = "领取军团福利", ltn = 6, demand = "每日免费领取50W绑定金币##享受此特权需要军团军衔:%s"},
		{id = 8, str = "领取地宫证明", ltn = 7, demand = "每日免费领取5张转生地宫证明##享受此特权需要军团军衔:%s"},
		{id = 9, str = "领取祝福油", ltn = 8, demand = "每日免费领取3瓶祝福油##享受此特权需要军团军衔:%s"},
		{id = 10, str = "清洗红名PK值", ltn = 9, demand = "每天可免费清洗一次红名##享受此特权需要军团军衔:%s"},
		{id = 11, str = "领取荒古卷轴", ltn = 10, demand = "每日免费领取3张荒古卷轴##享受此特权需要军团军衔:%s"},
		
	};
	
	local upgrade = "";
	local upgradeEx = "";
	if jtlevel < 10 then
		local ltnd = LegionTitle.Lt[legionId] .. LegionTitle.Title[jtlevel+1].str[job];
		local lttx = string.format("&%s&%s&888888&(%s级)", LegionTitle.Title[jtlevel+1].c, ltnd, jtlevel+1);
		upgrade = string.format(LegionTitle.Title[jtlevel+1].upgrade, lttx, updl[jtlevel+1]);


		local nexlv = jtlevel + 1;
		local d = upgradelist[nexlv];
		local upnP = upgradelist[nexlv].nProps;
		local ck = 0;
		local MC = 2;
		for k = 1,#upnP do
			if Actor.getItemCount(sysarg, upnP[k].item) < upnP[k].num then
				ck = 1;
			end
			if k == #upnP then
				local del_ngold = upgradelist[nexlv].nGold;
				if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
				if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
				if MC == 2 then
					ck = 1;
				end
			end
		end
		local wanclm = "";
		if ck == 0 then
			wanclm = "(已完成,可提升)";
		end


		upgradeEx = string.format("<#c0xFFFFFF00#提升军衔%s/@onUpLtt|%s>", wanclm, upgrade);
	else
		if jtlevel >= 10 then
			upgrade = "您已经升到满级军衔了";
		end
	end
	
	e = e .. [[

  <(c0xFFb6946c)所属军团:><(c0xFFffe25a)]]..LEGIONID[legionId].Name..[[> <(c0xFFb6946c)军团长:><(n]] ..legionName .. [[)> 

<(idecoLine#330)>

  <(c0xFFb6946c)当前军衔:>]]..jttx..[[<(c0xFF888888)(]]..jtlevel..[[级)> ]]..upgradeEx..[[ 

]]
	for i = 1,#privilege do
		local conditions = {};
		local ltlv = get_d_val(sysarg,110);
		local ltndlv = privilege[i].ltn;
		local ltnd = "";
		if ltlv >= ltndlv then
			conditions[1] = "#c0xFFFFFF00#";
			conditions[2] = "";
		else
			conditions[1] = "#c0xFF888888#";
			-- if ltndlv > 0 and ltndlv <= #LegionTitle.Title then
			-- 	ltnd = LegionTitle.Title[ltndlv].str[job];
			-- 	conditions[2] = string.format("<(c0xFF888888)%s特权>", ltnd );
			-- else
			-- 	conditions[2] = "";
			-- end
		end
		local lttx = "";
		if ltndlv > 0 and ltndlv <= #LegionTitle.Title then
			ltnd = LegionTitle.Lt[legionId] .. LegionTitle.Title[ltndlv].str[job];
			lttx = string.format("&%s&%s&888888&(%s级)", LegionTitle.Title[ltndlv].c, ltnd, ltndlv);
		else
			lttx = "无";
		end
		local a,b = math.modf(i / 3);
		local mfgf = "  ";
		if b == 0 then
			mfgf = "\\\\";
		end
		e = e .. string.format("  <%s%s/@onLtEx,%s|%s>%s", conditions[1], privilege[i].str, privilege[i].id, string.format(privilege[i].demand, lttx ), mfgf);
	end
	if var.legionOffer==nil then 
		var.legionOffer =0
	end
	
	e = e .. [[\
<(idecoLine#330)>

  <(c0xFFb6946c)我的贡献度:><(c0xFF00cbff)]]..var.legionOffer..[[> <捐献金币/@donateGold,1|每1金币=1点贡献度#贡献度超过军团长时则自动成为新的军团长#军团长享受伤害增加5%的永久BUFF> <捐献绑定金币/@donateGold,0|每1绑金=1点贡献度#贡献度超过军团长时则自动成为新的军团长#军团长享受伤害增加5%的永久BUFF>

  <(c0xFFb6946c)军团长的贡献度:><(c0xFF00cbff)]]..legionInfo.Offer..[[> <退出]]..LegionTitle.Lt[legionId]..[[军团/@exitLegion|退出后个人贡献度清零#军衔会保留##如果您是想抢夺其他军团的军团长职位的话#建议您先查看下其他军团长的贡献度>

  <(c0xFFb6946c)当前军团总贡献度:><(c0xFF00cbff)]]..legionInfo.AllOffer..[[> <查看所有军团信息/@kanquanbuxinxi|查看所有军团的公示信息# #军团长享5%攻击倍率加成>

  <]]..Str_Double..[[/@doubleExp|开启需要军团总贡献度 ]]..LEGIONCFG.Exp..[[#军团内所有在线玩家均可享受此BUFF# #只有军团长才可使用此功能> <(c0xFFb6946c)(当前军团双倍经验剩余><(c0xFFffe25a)]]..legionInfo.Exp..[[><(c0xFFb6946c)分钟)>



]];
	return e
end

t.characters = function(sysarg,type,i)
	type = tonumber(type);
	i = tonumber(i);
	local var = Actor.getStaticVar(sysarg);
	local mid = Actor.getSceneId(sysarg);
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
	local td = LEGIONCFG.mapdata;
	if td[i].type ~= type then return ""; end
	local mapname = td[i].mapname;
	local maplevel = td[i].lv;

	local zmaplevel = 0;
	if td[i].zlv then
		zmaplevel = td[i].zlv;
	end
	local vmaplevel = 0;
	if td[i].vlv then
		vmaplevel = td[i].vlv;
	end
	local soff = "24bb50";
	if pLv < maplevel then soff = "705e45"; end
	if zLv < zmaplevel then soff = "705e45"; end
	if vLv < vmaplevel then soff = "705e45"; end
	local soffEX = string.format("<(c0xFF%s)(%s级)>",soff,maplevel);

	if type == 2 then soffEX = string.format("<(c0xFF%s)(%s级)>",soff,maplevel); end
	if type == 3 then soffEX = string.format("<(c0xFF%s)(%s)>",soff,td[i].szcc); end
	if type == 4 then
		if vmaplevel > 0 then
			soffEX = string.format("<(c0xFF%s)(vip%s)>",soff,vmaplevel);
		end
	end

	local mfg = i;
	if type == 3 then mfg = i - 7; end

	local a,b = math.modf(mfg / 3);
	local mfgf = "";
	if b == 0 then mfgf = "\\\\  "; end
	if type == 1 then mfgf = " "; end

	return string.format("<%s/@maptoEX,%s,%s>%s %s", mapname, type, i, soffEX, mfgf);
end

t.onLtEx = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	local jtlevel = get_d_val(sysarg,110);
	local var = Actor.getStaticVar(sysarg);
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if jtlevel < (idx-1) then return; end --临时用这个来判断军团等级是否足够,偷个懒..
	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M威龙城:144:158:%s><(x威龙城:144:158:%s)>",NpcName,NpcName,NpcName);

	if idx == 1 then
		if var.legionOffer < LEGIONCFG.MapOffer then
			Actor.sendTipmsg(sysarg,"贡献值不足,无法传送到军团地图!",ttFlyTip);
			return;
		end
		var.legionOffer = var.legionOffer - LEGIONCFG.MapOffer;
		--传送到军团地图
		Actor.enterScene(sysarg,LEGIONCFG.MapId,unpack(LEGIONCFG.MapRange));
		System.broadcastTipmsg(string.format("<(n%s)>通过%s进入了<%s>.", Actor.getName(sysarg), StrNpcE, Fuben.getSceneNameById(LEGIONCFG.MapId)),128);
	elseif idx == 2 then
		--local nMh = math.modf(pLv / 10);
		--if Item.getBagEmptyGridCount(sysarg) < 10 then Actor.sendTipmsg(sysarg,"您的包裹不足10个空位,清理包裹后再来吧.",4); return; end
		if get_d_val(sysarg,150) ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); return; end
		set_d_val(sysarg,150,1);
		--for i = 1,nMh do
		--	local additemid = math.random(651,659);
		--	Actor.addItem(sysarg,additemid,0,0,1,1,0,"军团福利");
		--end
		--改为赠送5W点个人军团贡献度 
		var.legionOffer = var.legionOffer + 50000
		System.broadcastTipmsg(string.format("<(n%s)>通过%s领取了军衔福利:<50000军团贡献度>.贡献度可用于进入军团镇狱,里面刷新大量BOSS", Actor.getName(sysarg), StrNpcE),128);
		
		--判断是否超过军团长---------------------------------------------------------
		local sVar = System.getStaticVar()
		local legionId = Actor.getLegionId(sysarg)
		
		sVar.legion[legionId].AllOffer = sVar.legion[legionId].AllOffer + 50000 --加军团总贡献度
		
		local actor = nil
		
		if var.legionOffer > sVar.legion[legionId].Offer and Actor.getName(sysarg) ~= sVar.legion[legionId].Master then
			--将之前的军团长的称号撤下
			if sVar.legion[legionId].Master ~=  "" then
				actor = Actor.getActorPtrByName(sVar.legion[legionId].Master)
				if actor ~= nil then
					
					Actor.setTopTitle(actor,LEGIONID[legionId].HeadTitle,false)
				end
				
			end
			
			--给予新的军团长称号称号
			sVar.legion[legionId].Offer = var.legionOffer
			sVar.legion[legionId].Master = Actor.getName(sysarg)
			sVar.legion[legionId].ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			Actor.setTopTitle(sysarg,LEGIONID[legionId].HeadTitle,true)
	
			Actor.sendTipmsg(sysarg,"恭喜你成为军团长，享受5%攻击倍率",ttFlyTip)
			
			local sTips = "恭喜【"..Actor.getName(sysarg).."】成为"..LEGIONID[legionId].Name.."军团长,享受5%攻击倍率.[军团使者]处可以提升为军团长!"
			System.broadcastTipmsg(sTips,ttScreenCenter)
			System.broadcastTipmsg(sTips,ttChatWindow)
		end
		--同步军团战贡献度
		if Actor.getName(sysarg) == sVar.legion[legionId].Master then
			sVar.legion[legionId].Offer = var.legionOffer
		end
		
	elseif idx == 3 then
		local e = "\\  <(c0xFFb6946c)请选择您要传送的危险地图:>\\  <(c0xFFb6946c)这里是直接传送到以下地图的最后一层.>\\  <(c0xFFb6946c)每次传送消耗10000><(c0xFF00cbff)("..var.legionOffer..")><(c0xFFb6946c)个人贡献度.>\\\\<(idecoLine#330)>\\\\  ";
		local td = LEGIONCFG.mapdata;
		for i = 1,#td do
			e = e .. t.characters(sysarg,2,i);
		end
		e = e .. "\\\\<(idecoLine#330)>\\\\  <返回/@main>"
		return e;
	elseif idx == 4 then
		local nMh = math.modf(pLv * 2);
		if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg,"您的包裹不足1个空位,清理包裹后再来吧.",4); return; end
		if get_d_val(sysarg,151) ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); return; end
		set_d_val(sysarg,151,1);
		local additemid = 79;
		Actor.addItem(sysarg,additemid,0,0,nMh,1,0,"军团福利");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s领取了军衔福利:%sx%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(additemid), nMh),128);
	elseif idx == 5 then
		local e = "\\  <(c0xFFb6946c)请选择您要传送的转生地图:>\\  <(c0xFFb6946c)这里是直接传送到以下地图的最后一层.>\\  <(c0xFFb6946c)每次传送消耗100000><(c0xFF00cbff)("..var.legionOffer..")><(c0xFFb6946c)个人贡献度.>\\\\<(idecoLine#330)>\\\\  ";
		local td = LEGIONCFG.mapdata;
		for i = 1,#td do
			e = e .. t.characters(sysarg,3,i);
		end
		e = e .. "\\\\<(idecoLine#330)>\\\\  <返回/@main>"
		return e;
	elseif idx == 6 then
		local nMh = math.modf(pLv * 1);
		if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg,"您的包裹不足1个空位,清理包裹后再来吧.",4); return; end
		if get_d_val(sysarg,152) ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); return; end
		set_d_val(sysarg,152,1);
		local additemid = 80;
		Actor.addItem(sysarg,additemid,0,0,nMh,1,0,"军团福利");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s领取了军衔福利:%sx%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(additemid), nMh),128);
	elseif idx == 7 then
		--if Actor.hasBuff(sysarg, 66, 212) then 
		--	Actor.sendTipmsg(sysarg,"您身上已有此buff.",4); return; 
		--end
		--
		--local nMh = math.modf(pLv * 100);
		--if get_d_val(sysarg,153) ~= 0 then
		--	--Actor.sendTipmsg(sysarg,"您今天已经激活过了,明天再来吧.",4); return; 
		--	local okBtn = string.format("%s/juntuan_sureFunc,%s", "确定",7)
		--	local cancelBtn = string.format("%s/juntuan_cancelBtn", "取消")
		--	local str = "今天的次数免费次数已经用完,再开启需要100元宝,是否继续开启"
		--	Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
		--	return 
		--end
		--set_d_val(sysarg,153,1);
		--Actor.delBuff(sysarg, 66, 212);
		--Actor.addBuff(sysarg, 66, 212, nMh, 1, 3600, "火龙血脉", false,0,0,0,0, 20, "在军团使者处开启");
		--System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<火龙血脉>,<(c0xFF00cbff)杀怪伤害+%s(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
		if get_d_val(sysarg,153) ~= 0 then
			Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); 
			return 
		end
		set_d_val(sysarg,153,1)
		Actor.changeMoney(sysarg,0,500000,LogIds.juntuanfuli,"军团福利7")
	elseif idx == 8 then
		--if Actor.hasBuff(sysarg, 6, 211) then 
		--	Actor.sendTipmsg(sysarg,"您身上已有此buff.",4); return; 
		--end
		--
		--local nMh = 0.1;
		--if get_d_val(sysarg,154) ~= 0 then 
		----Actor.sendTipmsg(sysarg,"您今天已经激活过了,明天再来吧.",4); return; 
		--	local okBtn = string.format("%s/juntuan_sureFunc,%s", "确定",8)
		--	local cancelBtn = string.format("%s/juntuan_cancelBtn", "取消")
		--	local str = "今天的次数免费次数已经用完,再开启需要100元宝,是否继续开启"
		--	Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
		--	return 
		--end
		--set_d_val(sysarg,154,1);
		--Actor.delBuff(sysarg, 6, 211);
		--Actor.addBuff(sysarg, 6, 211, nMh, 1, 3600, "魔龙血脉", false,0,0,0,0, 21, "在军团使者处开启");
		--System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<魔龙血脉>,<(c0xFF00cbff)生命上限+10％(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
		
		if get_d_val(sysarg,154) ~= 0 then
			Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); 
			return 
		end
	
		local award = {{type = 0, id = 548, count = 5, quality = 0, strong = 0, bind = 1},}
		if Awards.CheckBagGridCount(sysarg, award) == false then 
			return
		else 
			Awards.Give(sysarg, award, LogIds.juntuanfuli, "军团福利8")
			set_d_val(sysarg,154,1)
		end
	elseif idx == 9 then
		--if Actor.hasBuff(sysarg, 158, 210) then 
		--	Actor.sendTipmsg(sysarg,"您身上已有此buff.",4); return; 
		--end
		--
		--local nMh = math.modf(pLv * 20);
		--if get_d_val(sysarg,155) ~= 0 then
		--	--Actor.sendTipmsg(sysarg,"您今天已经激活过了,明天再来吧.",4); return;
		--	local okBtn = string.format("%s/juntuan_sureFunc,%s", "确定",9)
		--	local cancelBtn = string.format("%s/juntuan_cancelBtn", "取消")
		--	local str = "今天的次数免费次数已经用完,再开启需要100元宝,是否继续开启"
		--	Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
		--	return 
		--end
		--set_d_val(sysarg,155,1);
		--Actor.delBuff(sysarg, 158, 210);
		--Actor.addBuff(sysarg, 158, 210, nMh, 1, 3600, "卧龙血脉", false,0,0,0,0, 22, "在军团使者处开启");
		--System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<卧龙血脉>,<(c0xFF00cbff)真实伤害(无视防御)+%s(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
		if get_d_val(sysarg,155) ~= 0 then
			Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4); 
			return 
		end
		
		local award = {{type = 0, id = 85, count = 3, quality = 0, strong = 0, bind = 1},}
		if Awards.CheckBagGridCount(sysarg, award) == false then 
			return
		else 
			set_d_val(sysarg,155,1)
			Awards.Give(sysarg, award, LogIds.juntuanfuli, "军团福利9")
		end
		
	elseif idx == 10 then
		if get_d_val(sysarg,156) ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经使用过清洗红名了,明天再来吧.",4); return; end
		set_d_val(sysarg,156,1);
		local nPkValue = Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE);	
		if nPkValue <= 0 then
			Actor.sendTipmsg(sysarg, "你还没有PK值呢..", ttFlyTip)
			return;
		end
		Actor.setUIntProperty(sysarg, PROP_ACTOR_PK_VALUE, 0);
	elseif idx == 11 then
		--if Actor.hasBuff(sysarg, 80, 213) then 
		--	Actor.sendTipmsg(sysarg,"您身上已有此buff.",4); return; 
		--end
		--
		--Actor.delBuff(sysarg, 80, 213);
		--local nMh = 1;
		--if get_d_val(sysarg,157) ~= 0 then
		--	--Actor.sendTipmsg(sysarg,"您今天已经激活过了,明天再来吧.",4); return; 
		--	local okBtn = string.format("%s/juntuan_sureFunc,%s", "确定",11)
		--	local cancelBtn = string.format("%s/juntuan_cancelBtn", "取消")
		--	local str = "今天的次数免费次数已经用完,再开启需要9800元宝,是否继续开启"
		--	Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
		--	return 
		--end
		--set_d_val(sysarg,157,1);
		--Actor.addBuff(sysarg, 80, 213, nMh, 1, 600, "神力护身", false,0,0,0,0, 23, "在军团使者处开启");
		--System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<神力护身>,<(c0xFF00cbff)伤害翻倍(持续10分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128+256);
		
		if get_d_val(sysarg,157) ~= 0 then
			Actor.sendTipmsg(sysarg,"您今天已经领取过了,明天再来吧.",4);
			return 
		end
		
		local award = {{type = 0, id = 491, count = 3, quality = 0, strong = 0, bind = 1},}
		if Awards.CheckBagGridCount(sysarg, award) == false then 
			return
		else 
			Awards.Give(sysarg, award, LogIds.juntuanfuli, "军团福利11")
			set_d_val(sysarg,157,1)
		end
		
	end
	return t.getLegionInfo(sysarg);
end

function juntuan_sureFunc(sysarg,index)
	if not index then return; end
	--print("index="..index)
	index = tonumber(index)
	if index < 7 or index > 11 then return; end
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local needCoin = 100
	local strlog = ""
	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M威龙城:144:158:%s><(x威龙城:144:158:%s)>",NpcName,NpcName,NpcName);
	
	
	if index == 7 then 
		strlog = "火龙血脉"
	elseif  index==8 then 
		strlog = "魔龙血脉"
	elseif  index==9 then 
		strlog = "卧龙血脉"
	elseif  index==11 then 
		strlog = "神力护身"
		needCoin = 9800
	end
	
	if not Actor.changeMoney(sysarg, 3, -needCoin, 2638, strlog) then
		Actor.sendTipmsg(sysarg,string.format("您的元宝不足"), ttFlyTip);
		return
	end
	
	if index == 7 then 
		local nMh = math.modf(pLv * 100);
		Actor.delBuff(sysarg, 66, 212);
		Actor.addBuff(sysarg, 66, 212, nMh, 1, 3600, "火龙血脉", false,0,0,0,0, 20, "在军团使者处开启");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<火龙血脉>,<(c0xFF00cbff)杀怪伤害+%s(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
	elseif  index==8 then 
		local nMh = 0.1;
		Actor.delBuff(sysarg, 6, 211);
		Actor.addBuff(sysarg, 6, 211, nMh, 1, 3600, "魔龙血脉", false,0,0,0,0, 21, "在军团使者处开启");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<魔龙血脉>,<(c0xFF00cbff)生命上限+10％(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
	elseif  index==9 then 
		local nMh = math.modf(pLv * 20);
		Actor.delBuff(sysarg, 158, 210);
		Actor.addBuff(sysarg, 158, 210, nMh, 1, 3600, "卧龙血脉", false,0,0,0,0, 22, "在军团使者处开启");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<卧龙血脉>,<(c0xFF00cbff)真实伤害(无视防御)+%s(持续60分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128);
	elseif  index==11 then 
		local nMh = 1;
		Actor.delBuff(sysarg, 80, 213);
		Actor.addBuff(sysarg, 80, 213, nMh, 1, 600, "神力护身", false,0,0,0,0, 23, "在军团使者处开启");
		System.broadcastTipmsg(string.format("<(n%s)>通过%s激活了<神力护身>,<(c0xFF00cbff)伤害翻倍(持续10分钟)>.", Actor.getName(sysarg), StrNpcE, nMh),128+256);
	end
	
end

--取消按钮，不可删除
function juntuan_cancelBtn(sysarg)
end



t.maptoEX = function(sysarg,type,i)

	if not type then return; end
	if not i then return; end
	type = tonumber(type);
	i = tonumber(i);
	local td = LEGIONCFG.mapdata;
	if not td[i] then return; end
	local var = Actor.getStaticVar(sysarg);
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
	local mapid = td[i].mapid;

	local maplevel = td[i].lv;

	local zmaplevel = 0;
	if td[i].zlv then
		zmaplevel = td[i].zlv;
	end
	local vmaplevel = 0;
	if td[i].vlv then
		vmaplevel = td[i].vlv;
	end

	local nMapOffer = 10000;
	if type == 3 then
		nMapOffer = 100000;
	end
		if var.legionOffer < nMapOffer then
			Actor.sendTipmsg(sysarg,string.format("您的个人贡献度不足%s,传送失败..", nMapOffer),4);
			return;
		end

	if pLv < maplevel then
		Actor.sendTipmsg(sysarg, string.format("您的等级不足%s级,传送失败..", maplevel) ,4);
		return t.main(sysarg);
	end
	if zLv < zmaplevel then
		Actor.sendTipmsg(sysarg, string.format("您的转生等级不足%s级,传送失败..", zmaplevel) ,4);
		return t.main(sysarg);
	end
	if vLv < vmaplevel then
		Actor.sendTipmsg(sysarg, string.format("您的VIP等级不足%s级,传送失败..", vmaplevel) ,4);
		return t.main(sysarg);
	end
	if Actor.canTelport(sysarg,mapid) then
		
		var.legionOffer = var.legionOffer - nMapOffer;
		local mname = Fuben.getSceneNameById(mapid); 
		System.telportSceneDefaultPoint(sysarg,mname);
		local NpcName = Actor.getTalkNpcName(sysarg);
		local StrNpcE = string.format("<%s/M威龙城:144:158:%s><(x威龙城:144:158:%s)>",NpcName,NpcName,NpcName);
		System.broadcastTipmsg(string.format("<(n%s)>通过%s进入了<%s>.", Actor.getName(sysarg), StrNpcE, mname),128);
	end 
	
end

t.onUpLtt = function(sysarg)
	local jttx = get_jtname(sysarg);
	local jtlevel = get_d_val(sysarg,110);
	local upgradelist = LEGIONCFG.upgradelist;
	if jtlevel >= #upgradelist then
		Actor.sendTipmsg(sysarg, string.format("您的军衔已经达到了%s,无法继续提升.", jttx), 256);
		return;
	end
	local nexlv = jtlevel + 1;
	local d = upgradelist[nexlv];


	local upnP = upgradelist[nexlv].nProps;
	local ck = 0;
	local MC = 2;
	for k = 1,#upnP do
		if Actor.getItemCount(sysarg, upnP[k].item) < upnP[k].num then
			Actor.sendTipmsg(sysarg, string.format("您的包裹内没有<%s>个 <%s> ,提升失败.", upnP[k].num, Item.getItemName(upnP[k].item)), 256);
			ck = 1;
			return;
		end
		if k == #upnP then
			local del_ngold = upgradelist[nexlv].nGold;
			if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
			if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
			if MC == 2 then
				Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> .",del_ngold), 256);
				ck = 1;
				return;
			end
		end
	end
	if ck == 0 then
		for k = 1,#upnP do
			--if nexlv == 2 or nexlv == 7 or nexlv == 9 or nexlv == 10 then --魔核类和最后一个任务的还是要收走的,170425 zer 改为都收走
			Actor.removeItem(sysarg, upnP[k].item, upnP[k].num,-1,-1,-1);
			--end
			if k == #upnP then
				Actor.changeMoney(sysarg, MC, -upgradelist[nexlv].nGold,2610,"提升军阶扣除金钱");
			end
		end
	end
	
	
	--提升军阶完成任务
	--local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	--local taskTable = {93,98,104,108,112}
	--local ta = task_all[get_taskflags_val(sysarg)]
	--
	--for i=1,5 do 
	--	if get_taskflags_val(sysarg)== taskTable[i] then --已经提前完成了提升军阶的任务了
	--		local taNext = task_all[get_taskflags_val(sysarg)+1]
	--		set_taskflags_val(sysarg,taskTable[i]+1)
	--		--自动进行下一个任务
	--		if taNext ~= nil then
	--			if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
	--				Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
	--			elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
	--				Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
	--			end
	--		end
	--		Quest_ShuaXin(sysarg)
	--		break
	--	end
	--end
					
					
	
	
	add_d_val(sysarg,110,1);
	
	--刷新支线任务
	Quest_ShuaXin(sysarg) 
	
	ShuaXinFengHao(sysarg);
	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M威龙城:144:158:%s><(x威龙城:144:158:%s)>",NpcName,NpcName,NpcName);
	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s将军衔提升到了%s.", Actor.getName(sysarg), StrNpcE, get_jtname(sysarg)),128);
	return t.getLegionInfo(sysarg);

end

t.junxianup = function(sysarg)
	-- set_d_val(sysarg,110,10) --测试
	-- set_d_val(sysarg,111,2000)
	-- set_d_val(sysarg,112,10)
	-- set_d_val(sysarg,113,5000)
	-- set_d_val(sysarg,114,5000)
	-- set_d_val(sysarg,115,10)




	local d = LEGIONCFG.updata;
	ShuaXinFengHao(sysarg);

	local e = [[

  <(c0xFFb6946c)拥有军衔后自动开启5大印记,每天0点清零印记属性.>
  <(c0xFFb6946c)军衔是绑定个人身上永久存在的,并不会因为离开军团而消失.>

<(idecoLine#330)>

]];
	local guide = {
		"&FFFFFF&时光印记-介绍##获得方式:#在线时每&00FFFF&10&FFFFFF&秒增加&00FFFF&1&FFFFFF&点攻击魔法道术属性#最多可获得&00FFFF&2000&FFFFFF&点上限(军衔等级越高则上限越高)#每天0点清理此属性后重新计算",
		"&FFFFFF&财神印记-介绍##获得方式:#在捐献排行榜上每捐献&00FFFF&1000&FFFFFF&金币则增加&00FFFF&1&FFFFFF&点杀怪伤害#最多可获得&00FFFF&5000&FFFFFF&点上限(军衔等级越高则上限越高)#每天0点清理此属性后重新计算",
		"&FFFFFF&屠魔印记-介绍##获得方式:#每击杀&00FFFF&1&FFFFFF&只BOSS增加&00FFFF&1％&FFFFFF&点生命上限#最多可获得&00FFFF&10％&FFFFFF&点上限(军衔等级越高则上限越高)#每天0点清理此属性后重新计算",
		"&FFFFFF&土豪印记-介绍##获得方式:#每充值&00FFFF&5000&FFFFFF&元宝则增加&00FFFF&1％&FFFFFF&的伤害倍数(按当日累计充值计算)#最多可获得&00FFFF&20％&FFFFFF&点上限(军衔等级越高则上限越高)#每天0点清理此属性后重新计算",
		"&FFFFFF&掠夺印记-介绍##获得方式:#如果击杀的玩家身上拥有&00FFFF&财神印记(并且财神印记属性大于200点)&FFFFFF&则掠夺被杀玩家&00FFFF&200&FFFFFF&点属性到自己的掠夺印记上#最多可获得&00FFFF&5000&FFFFFF&点杀怪伤害上限(军衔等级越高则上限越高)#每天0点清理此属性后重新计算",
	};

	local tjpdstr = {};


	for i = 1,#d do
		local xsstr = string.format("#c0xFF888888#提升为%s",d[i].name);

		if Actor.getMoneyCount(sysarg,0) >= d[i].needgold or Actor.getMoneyCount(sysarg,1) >= d[i].needgold then
			tjpdstr[1] = "<(c0xFF00c0ff)√>";
		else
			tjpdstr[1] = "<(c0xFFff0000)×>";
		end
		for k = 1,3 do
			if Actor.getItemCount(sysarg,d[i].needitems[k]) >= 1 then
				tjpdstr[k+1] = "<(c0xFF00c0ff)√>";
			else
				tjpdstr[k+1] = "<(c0xFFff0000)×>";
			end
		end

		if i == get_d_val(sysarg,110)+1 then
			xsstr = string.format("提升军衔为【%s%s】",get_jtname(sysarg),d[i].name);
			e = e .. string.format([[
  <%s/@onUpJunXian,%s>  <(c0xFFb6946c)以下所需材料散人殿堂获得:>

    <(c0xFFb6946c)%s绑金或金币> ]]..tjpdstr[1]..[[ 
    <(c0xFFb6946c)1把%s> ]]..tjpdstr[2]..[[ <(c0xFF888888)(]]..i..[[阶BOSS掉落)>
    <(c0xFFb6946c)1件%s> ]]..tjpdstr[3]..[[ <(c0xFF888888)(]]..i..[[阶BOSS掉落)>
    <(c0xFFb6946c)1件%s> ]]..tjpdstr[4]..[[ <(c0xFF888888)(]]..i..[[阶BOSS掉落)>

<(idecoLine#330)>

  <时光印记]]..i..[[级/@ljyj,1|]]..guide[1]..[[> <(c0xFFb6946c)当前伤害属性><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx1..[[点>.
  <财神印记]]..i..[[级/@ljyj,2|]]..guide[2]..[[> <(c0xFFb6946c)当前杀怪伤害属性><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx4..[[点>.
  <屠魔印记]]..i..[[级/@ljyj,3|]]..guide[3]..[[> <(c0xFFb6946c)当前生命><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx3..[[％>.
  <土豪印记]]..i..[[级/@ljyj,4|]]..guide[4]..[[> <(c0xFFb6946c)当前伤害倍数><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx2..[[％>.
  <掠夺印记]]..i..[[级/@ljyj,5|]]..guide[5]..[[> <(c0xFFb6946c)当前击败玩家><(c0xFF00c0ff)每次><(c0xFFb6946c)掠夺><(c0xFF00c0ff)]]..d[i].delsxs..[[点杀怪伤害>.

<(idecoLine#330)>

]], xsstr, i, d[i].needgold, Item.getItemName(d[i].needitems[1]), Item.getItemName(d[i].needitems[2]), Item.getItemName(d[i].needitems[3]));
		
		end
	end
			if get_d_val(sysarg,110) == #d then
				local i = 10;
				e = e .. [[
  您已经将军衔提升到目前的最高级别了!

  <时光印记]]..i..[[级/@ljyj,1|]]..guide[1]..[[> <(c0xFFb6946c)当前伤害属性><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx1..[[点>.
  <财神印记]]..i..[[级/@ljyj,2|]]..guide[2]..[[> <(c0xFFb6946c)当前杀怪伤害属性><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx4..[[点>.
  <屠魔印记]]..i..[[级/@ljyj,3|]]..guide[3]..[[> <(c0xFFb6946c)当前生命><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx3..[[％>.
  <土豪印记]]..i..[[级/@ljyj,4|]]..guide[4]..[[> <(c0xFFb6946c)当前伤害倍数><(c0xFF00c0ff)上限><(c0xFFb6946c)为><(c0xFF00c0ff)]]..d[i].addsx2..[[％>.
  <掠夺印记]]..i..[[级/@ljyj,5|]]..guide[5]..[[> <(c0xFFb6946c)当前击败玩家><(c0xFF00c0ff)每次><(c0xFFb6946c)掠夺><(c0xFF00c0ff)]]..d[i].delsxs..[[点杀怪伤害>.

<(idecoLine#330)>

]];
			end

	return e .. "  <返回主页/@main> <点击以上5大印记即可了解详细印记属性>";
end

t.junxianupS = function(sysarg)
	--set_d_val(sysarg,110,1) --测试
	local d = LEGIONCFG.updata;
	ShuaXinFengHao(sysarg);

	local e = [[

  <(c0xFFeabc78)拥有军衔后自动开启5大印记,每天0点清零印记属性.>

  <(c0xFFb6946c)军衔是绑定个人身上永久存在的,并不会因为离开军团而消失.>

<(idecoLine#330)>

]];
	for i = 1,#d do
		local str = string.format("<(c0xFFb6946c)时光、财神%s,屠魔%s,土豪%s％,掠夺%s>", d[i].addsx1, d[i].addsx3, d[i].addsx2, d[i].delsxs);
		local xsstr = string.format("#c0xFF888888#提升为%s",d[i].name);
		if i == get_d_val(sysarg,110)+1 then
			xsstr = string.format("提升为%s",d[i].name);
		end
		e = e .. string.format("  <%s/@onUpJunXian,%s|需求:##%s 金币(绑定金币优先扣除)#1把 %s#1件 %s#1件 %s> %s\\", xsstr, i, d[i].needgold, Item.getItemName(d[i].needitems[1]), Item.getItemName(d[i].needitems[2]), Item.getItemName(d[i].needitems[3]), str);
	end
	e = e .. [[

<(idecoLine#330)>

  <时光印记/@ljyj,1>  <财神印记/@ljyj,2>  <屠魔印记/@ljyj,3>  <土豪印记/@ljyj,4>  <掠夺印记/@ljyj,5>

  <返回/@main> <点击以上5大印记即可了解详细印记属性>
	]];
	return e;
end

t.onUpJunXian = function(sysarg,idx)
	idx = tonumber(idx);
	if idx <= get_d_val(sysarg,110) then
		Actor.sendTipmsg(sysarg, "您已经提升过此军衔了..", 256);
		return;
	end
	if idx > get_d_val(sysarg,110)+1 then
		Actor.sendTipmsg(sysarg, "不要跳嘛,一个一个顺着来提升才行.", 256);
		return;
	end
	local d = LEGIONCFG.updata;
	if d[idx] then
		local delgold = d[idx].needgold;
		local itemids = d[idx].needitems;
		for i = 1,#itemids do
			if Actor.getItemCount(sysarg,itemids[i]) < 1 then
				Actor.sendTipmsg(sysarg, string.format("您的包裹内没有 <%s> ,提升失败.",Item.getItemName(itemids[i])), 256);
				return;
			end
		end
		if del_money(sysarg,delgold,2610,"提升军阶扣除金钱") == true then
			for i = 1,#itemids do
				if Actor.removeItem(sysarg,itemids[i],1,-1,-1,-1) ~=1 then
					return 
				end
			end
			
			add_d_val(sysarg,110,1);
			ShuaXinFengHao(sysarg);
			local NpcName = Actor.getTalkNpcName(sysarg);
			local StrNpcE = string.format("<%s/M威龙城:144:158:%s><(x威龙城:144:158:%s)>",NpcName,NpcName,NpcName);
			System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s将军衔提升到了<%s>,获得%s奖励.", Actor.getName(sysarg), StrNpcE, get_jtname(sysarg)..d[idx].name, Item.getItemLinkMsg(374) ),128);
			
			--提升军阶成功，得到高级装备箱
			local bagIdxs = Item.getBagEmptyGridCount(sysarg)
			if bagIdxs>=1 then 
				Actor.addItem(sysarg,374,0,0,1,1,0,"提升军团",1)
				Actor.sendTipmsg(sysarg, string.format("恭喜您完成了提升军衔支线任务,获得%s.", Item.getItemLinkMsg(374) ), 256);
			else 
				local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
				local awardIdAndCount=0
				awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,1)
				awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,373)
				System.AddMail(myID,6,0,"提升军衔支线任务奖励","此邮件为提升军衔支线任务奖励，只要按一键提取就可以领取奖品",awardIdAndCount,0)
			
				Actor.sendTipmsg(sysarg, string.format("恭喜您完成了提升军衔支线任务,奖品以邮件形式下发."), 256);
			end
			Quest_ShuaXin(sysarg)

			return t.junxianup(sysarg)
			
		end
	end
end

t.ljyj = function(sysarg,idx)
	idx = tonumber(idx);
	local guide = {
		"\\时光印记-介绍\\\\获得方式:\\在线时每<10>秒增加<1>点攻击魔法道术属性\\最多可获得<2000>点上限(军衔等级越高则上限越高)\\每天0点清理此属性后重新计算",
		"\\财神印记-介绍\\\\获得方式:\\在捐献排行榜上每捐献<1000>金币则增加<1>点攻击魔法道术属性\\最多可获得<2000>点上限(军衔等级越高则上限越高)\\每天0点清理此属性后重新计算",
		"\\屠魔印记-介绍\\\\获得方式:\\每击杀<1>只怪物增加<5>点生命上限\\最多可获得<50000>点上限(军衔等级越高则上限越高)\\每天0点清理此属性后重新计算",
		"\\土豪印记-介绍\\\\获得方式:\\每充值<2500>元宝则增加<1%>的伤害倍数(按当日累计充值计算)\\最多可获得<20%>点上限(军衔等级越高则上限越高)\\每天0点清理此属性后重新计算",
		"\\掠夺印记-介绍\\\\获得方式:\\如果击杀的玩家身上拥有<财神印记(并且财神印记属性大于20点)>则掠夺被杀玩家<20>点属性到自己的掠夺印记上\\最多可获得<2000>点上限(军衔等级越高则上限越高)\\每天0点清理此属性后重新计算",
	};
	if guide[idx] then
		Actor.sendTipmsg(sysarg, guide[idx], 4);
	end
end


--功勋值兑换金币
t.juntuanGG = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	if idx < 1 or idx > 2 then return; end
	local gx,gold = 0,0;
	if idx == 1 then gx = 10; gold = 5000; end
	if idx == 2 then gx = 1000; gold = 500000; end

	local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE);	--获取当前功勋值
	if val < gx then Actor.sendTipmsg(sysarg,string.format("功勋值不足 <%s> ,兑换失败...", gx),256); return; end
	val = val - gx;
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, val);	--设置功勋值
	Actor.changeMoney(sysarg,1,gold,2602,"功勋兑换金币");
	Actor.sendTipmsg(sysarg,string.format("兑换成功,金币增加 <(c0xFF00FF00)%s>\\您当前剩余功勋值: <%s>", gold, val),256);
end

--查看所有军团信息
t.kanquanbuxinxi = function(sysarg)
	local str = ""
	local sVar = System.getStaticVar()
	for i = 1,table.getn(LEGIONID) do
		local info = sVar.legion[i]
		local master = "无"
		if info.Master ~= "" then
			master = info.Master
		end
		str = str.."\\    "..LEGIONID[info.id].Name.."军团长: <"..master..">   ta当前的个人贡献度: <"..info.Offer..">    \\"
		
	end	
	str = str .. "\\<(c0xFF888888)看准了就去抢夺军团长吧,抢到了享受永久5%伤害倍数提升>";
	Actor.sendTipmsg(sysarg,str,ttDialog)
end

--捐献金币
--type 捐献类型
t.donateGold = function(sysarg,type)
	type = tonumber(type)
	local netPack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sLegionDonate)
	DataPack.writeByte(netPack,type)
	DataPack.flush(netPack)

	ShuaXinFengHao(sysarg);	--设置文字头衔 显示XX军团
	return t.main(sysarg);
	
end



--军团地图
t.changeLegionMap = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.legionOffer < LEGIONCFG.MapOffer then
		Actor.sendTipmsg(sysarg,"贡献值不足,无法传送到军团地图！",ttFlyTip)
		return
	end
	var.legionOffer = var.legionOffer - LEGIONCFG.MapOffer
	
	--传送到军团地图
	Actor.enterScene(sysarg,LEGIONCFG.MapId,unpack(LEGIONCFG.MapRange))
end

--双倍经验
t.doubleExp = function(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	if legionId == 0 then
		Actor.sendTipmsg(sysarg,"你不在军团中,无法操作.",ttFlyTip)
		return
	end
	
	local sVar = System.getStaticVar(sysarg)
	
	if Actor.getName(sysarg) ~= sVar.legion[legionId].Master then
		Actor.sendTipmsg(sysarg,"你不是军团长,无法操作.",ttFlyTip)
		return
	end
	if sVar.legion[legionId].AllOffer < LEGIONCFG.Exp then
		Actor.sendTipmsg(sysarg,"贡献度不足,无法开启",ttFlyTip)
		return
	end
	sVar.legion[legionId].AllOffer = sVar.legion[legionId].AllOffer - LEGIONCFG.Exp
	sVar.legion[legionId].Exp = sVar.legion[legionId].Exp + 60
	--开启全军团双倍经验
	local _Val = sVar.legion[legionId].Exp * 60
	local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	for k, plyPtr in ipairs(playerList or {}) do
		local othId = Actor.getLegionId(plyPtr)
		if othId == legionId then
			Actor.addBuff(plyPtr,64,199,1,1,_Val,"军团双倍经验",false,0,0,57)
		end
	end
	
	return t.main(sysarg)
end

--退出军团
t.exitLegion = function(sysarg)
	--SendRecommendTips(sysarg,"wwww")
	local NPChandle = Actor.getTargetHandle(sysarg)
	local noticeStr = "是否退出军团,个人贡献度将清0"
	local surestr = "确定/legionExitLegionSure"
	
	Actor.messageBox(sysarg, NPChandle,0, noticeStr, surestr, "取消/Cancel", nil)
end
function legionExitLegionSure(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	if legionId == 0 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	--如果退出的是军团长
	local sVar = System.getStaticVar()
	if sVar.legion[legionId].Master == Actor.getName(sysarg) then
		sVar.legion[legionId].Master = ""
		sVar.legion[legionId].Offer = 0
		--撤出称号
		--Actor.GiveupTitle(sysarg,LEGIONID[legionId].HeadTitle)
		Actor.setTopTitle(sysarg,LEGIONID[legionId].HeadTitle,false)
	end
	

	--判断是否开启了双倍经验,要删除该BUFF
	if sVar.legion[legionId].Exp > 0 then
		Actor.delBuff(sysarg,64,199)
	end
    
  sVar.legion[legionId].Count = sVar.legion[legionId].Count - 1 --军团成员数量减去1
  if sVar.legion[legionId].Count < 0 then
  	sVar.legion[legionId].Count = 0
  end
  
  Actor.setLegionId(sysarg, 0)
	var.legionOffer = 0
	
	Actor.sendTipmsg(sysarg,"退出军团成功",ttFlyTip)
	
	ShuaXinFengHao(sysarg);	--设置文字头衔 显示XX军团

	Actor.closeNPCDialog(sysarg) --关闭任务窗口
	
end

--翅膀魂石兑换羽毛
t.juntuanT = function(sysarg)
	local hs_id = {493--[[翅膀魂石白虎]],494,--[[翅膀魂石·青龙]]495--[[翅膀魂石·朱雀]],496--[[翅膀魂石·玲珑]],497--[[翅膀魂石·炽凰]]}
	local ym_id = {id=464,count=10}--兑换道具id与数量
	for i = 1,table.getn(hs_id) do
		if Actor.getItemCount(sysarg,hs_id[i]) > 0 then
			if Actor.removeItem(sysarg,hs_id[i],1) == 1 then
				Actor.addItem(sysarg,ym_id.id,0,0,ym_id.count,0,0,"huanyumao",1)
				Actor.sendTipmsg(sysarg,"兑换成功,获得1级羽毛*10",ttFlyTip)
			end
			return
		end
	end
	Actor.sendTipmsg(sysarg,"兑换失败,没有找到所需魂石!",ttFlyTip)
end


--取成员数量最少的军团- 返回索引
t.getLegionLowCount = function(sysarg)
    
    local var = System.getStaticVar()
    if var.legion[1] == nil then
        var.legion[1] = {}
        var.legion[1].Count = 0
    end
    if var.legion[1].Count == nil then var.legion[1].Count = 0 end
    local count = var.legion[1].Count
    local ret = 1
    for i = 2,table.getn(LEGIONID) do
        if var.legion[i] == nil then 
            var.legion[i] = {} 
            var.legion[i].Count = 0
         end
         if var.legion[i].Count == nil then var.legion[i].Count = 0 end
		if var.legion[i].Count < count then
            count = var.legion[i].Count
            ret = i
        end
	end
    return ret
end
function GetNpcJunTuanGuanLiYuan() return t end