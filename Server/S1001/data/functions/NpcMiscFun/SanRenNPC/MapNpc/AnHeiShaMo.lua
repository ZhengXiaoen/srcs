--暗黑沙漠

local t = {

	data = {
		zssh = 1000; --最高单件真实伤害
		xh = {
			{del_ngold = 5000, delsxh = 15},	--del_ngold 兑换人级消耗的金币，delsxh 消耗的生肖魂数量
			{del_ngold = 10000, delsxh = 30},	--del_ngold 兑换地级消耗的金币，delsxh 消耗的生肖魂数量
			{del_ngold = 20000, delsxh = 50},	--del_ngold 兑换天级消耗的金币，delsxh 消耗的生肖魂数量
			{del_ngold = 50000, delsxh = 20},	--del_ngold 升级天级消耗的金币，delsxh 消耗的生肖魂数量
			{del_ngold = 500,},	--del_ngold 升级天级消耗的元宝
		},
		pos = {28,29,30,31,32,33,34,35,36,37,38,39},
		dh = {1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825},
		up1 = {
			[1814] = 1826,--地级★子鼠
			[1815] = 1827,--地级★丑牛
			[1816] = 1828,--地级★寅虎
			[1817] = 1829,--地级★卯兔
			[1818] = 1830,--地级★辰龙
			[1819] = 1831,--地级★巳蛇
			[1820] = 1832,--地级★午马
			[1821] = 1833,--地级★未羊
			[1822] = 1834,--地级★申猴
			[1823] = 1835,--地级★酉鸡
			[1824] = 1836,--地级★戌狗
			[1825] = 1837,--地级★亥猪
		},
		up2 = {
			[1826] = 1838,--天级★子鼠
			[1827] = 1839,--天级★丑牛
			[1828] = 1840,--天级★寅虎
			[1829] = 1841,--天级★卯兔
			[1830] = 1842,--天级★辰龙
			[1831] = 1843,--天级★巳蛇
			[1832] = 1844,--天级★午马
			[1833] = 1845,--天级★未羊
			[1834] = 1846,--天级★申猴
			[1835] = 1847,--天级★酉鸡
			[1836] = 1848,--天级★戌狗
			[1837] = 1849,--天级★亥猪
		},
		dh3 = {1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849},
		sxhs = {
			{1814,3},--人级★子鼠
			{1815,3},--人级★丑牛
			{1816,3},--人级★寅虎
			{1817,3},--人级★卯兔
			{1818,3},--人级★辰龙
			{1819,3},--人级★巳蛇
			{1820,3},--人级★午马
			{1821,3},--人级★未羊
			{1822,3},--人级★申猴
			{1823,3},--人级★酉鸡
			{1824,3},--人级★戌狗
			{1825,3},--人级★亥猪
			{1826,7},--地级★子鼠
			{1827,7},--地级★丑牛
			{1828,7},--地级★寅虎
			{1829,7},--地级★卯兔
			{1830,7},--地级★辰龙
			{1831,7},--地级★巳蛇
			{1832,7},--地级★午马
			{1833,7},--地级★未羊
			{1834,7},--地级★申猴
			{1835,7},--地级★酉鸡
			{1836,7},--地级★戌狗
			{1837,7},--地级★亥猪
			{1838,10},--天级★子鼠
			{1839,10},--天级★丑牛
			{1840,10},--天级★寅虎
			{1841,10},--天级★卯兔
			{1842,10},--天级★辰龙
			{1843,10},--天级★巳蛇
			{1844,10},--天级★午马
			{1845,10},--天级★未羊
			{1846,10},--天级★申猴
			{1847,10},--天级★酉鸡
			{1848,10},--天级★戌狗
			{1849,10},--天级★亥猪

		},
	},
}


t.main = function(sysarg)
	local openday = System.getDaysSinceOpenServer();
	if openday < 5 then
		Actor.sendTipmsg(sysarg, string.format("只有新区第<5>天开始才开放暗黑沙漠,到第<5>天再来找我吧,先赶紧去提升你的实力吧!\\今天是新区第<%s>天.",openday), 4);
		return;
	end

	local d = t.data.xh;
	local sxstr = string.format([[
  <#c0xFFFFFF00#兑换人级生肖/@onDuiHuanSXa,1|%s个生肖之魂即可兑换1个人级生肖装备> <#c0xFFFFFF00#兑换地级生肖/@onDuiHuanSXb,1|佩戴人级生肖在生肖盒内再加%s个生肖之魂即可升级为地级生肖装备> <#c0xFFFFFF00#兑换天级生肖/@onDuiHuanSXb,2|佩戴地级生肖在生肖盒内再加%s个生肖之魂即可升级为天级生肖装备>
  
  <#c0xFFFFFF00#提升天级十二生肖/@onDuiHuanSXc,1|使用%s个生肖之魂即可提升天级生肖装备真实伤害属性> <增加真实伤害,无视防御的超强伤害!>
  
  <#c0xFFFFFF00#元宝提升天级十二生肖/@onDuiHuanSXc,2|无需消耗生肖之魂和金币#只需消耗%s元宝即可快人一步的提升> <#c0xFFFFFF00#回收十二生肖装备/@onHuiShouSX|获得一定的生肖之魂>
]], d[1].delsxh, d[2].delsxh, d[3].delsxh, d[4].delsxh, d[5].del_ngold);

	local sVar = System.getDyanmicVar();
	local echo =""
	if sVar.anheishamoOpenTime ==nil then 
		echo = [[
	
  <(c0xFFb6946c)暗黑沙漠传送员(本地图专出产生肖装备)>

<(idecoLine#315)>

  <(c0xFFb6946c)消耗货币来开启暗黑沙漠入口,入口开启时间为5分钟.>
  <(c0xFFb6946c)历时全服玩家都可进入,5分钟后入口关闭.>
  <(c0xFFb6946c)未进入的玩家请等待下一次开启.>
  <3转以上玩家才可进入.>

<(idecoLine#315)>

  <1000元宝开启/@openAnHeiShaMo,3|你打开了入口,所有人在5分钟内都可以进去了#他们会记得你的好的>  <200万金币开启/@openAnHeiShaMo,1|好人一生平安>  <200万绑定金币开启/@openAnHeiShaMo,0|好人一生平安>

<(idecoLine#315)>

]] .. sxstr;
	else 
		echo = [[
		
  <(c0xFFb6946c)暗黑沙漠传送员(本地图专出产生肖装备)>

<(idecoLine#315)>

  <(c0xFFb6946c)暗黑沙漠已经打开,可以欢迎进入.>
  <(c0xFFb6946c)此次入口开启时间仅为5分钟,请抓紧时间进入.>
  <(c0xFFb6946c)里面怪物掉落生肖之魂和生肖装备.>
  <3转以上玩家才可进入.>

<(idecoLine#315)>

]] .. sxstr .. "<#BN进入暗黑沙漠/@enterAnHeiShaMo>";

	end
	
	return echo;
end

t.onHuiShouSX = function(sysarg)
	local data = t.data.sxhs;
	local e = "\\  <(c0xFFb6946c)请选择您要回收的技能书:> <(c0xFFb6946c)(鼠标移动上去显示回收数量)>\\\\<(idecoLine#315)>\\\\";
	local ItemCount_bag = {}; --装备在包裹里的数量
	local formatStrs = {};
	local rStr = {};
	for i = 1,#data do
		local n = Actor.getItemCount(sysarg,data[i][1]);
		if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
		ItemCount_bag[i] = ItemCount_bag[i] + n;
		if ItemCount_bag[i] > 0 then
			rStr[i] = Item.getItemName(data[i][1]);
			formatStrs[i] = "  <<showEff%s(%s)>/@onSXforHS,%s|每次点击为回收1个获得%s个生肖之魂>"
		else
			rStr[i] = "#c0xFF888888#" .. Item.getItemName(data[i][1]);
			formatStrs[i] = "  <%s(%s)/@onHuiShouSXEx,%s>"
		end
	end
	for i = 1,#data do
		local a,b = math.modf(i / 3);
		local hhf = " ";
		if b == 0 then hhf = "\\"; end
		e = e .. string.format(formatStrs[i]..hhf,rStr[i],ItemCount_bag[i],data[i][1],data[i][2]);
	end
	return e .. "\\<(idecoLine#315)>\\\\  <返回主页/@main>";
end
t.onSXforHS = function(sysarg,itemid)
	if not itemid then return; end
	itemid = tonumber(itemid);
	local data = t.data.sxhs;
	local num = 0;
	for i = 1,#data do
		if data[i][1] == itemid then
			num = data[i][2];
		end
	end
	if num == 0 then return; end
	if Actor.getItemCount(sysarg, itemid) < 1 then
		Actor.sendTipmsg(sysarg, string.format("您包裹内的 <%s> 不足 <%s> 个,回收失败..", Item.getItemName(itemid), 1), 256);
		return ;
	end
	Actor.removeItem(sysarg, itemid, 1, -1,-1,-1);
	Actor.addItem(sysarg, 1774, 0, 0, num);
	Actor.sendTipmsg(sysarg,"回收成功.", ttFlyTip);
	return t.onHuiShouSX(sysarg);
end

t.onDuiHuanSXa = function(sysarg,idx,dhid)
	if not idx then return; end
	idx = tonumber(idx);

	if idx == 1 then
		local d = t.data.dh;
		local e = [[

  <(c0xFFb6946c)请选择您要兑换的生肖装备:>

<(idecoLine#315)>

]];
		for i = 1,#d do
			e = e .. string.format("    <#c0xFFFFFF00#兑换%s/@onDuiHuanSXa,11,%s|每次消耗5000绑金或金币费用> <(c0xFFb6946c)需要><5><(c0xFFb6946c)个生肖之魂>\\", Item.getItemName(d[i]), i);
		end
		return e .. "\\<(idecoLine#315)>\\\\  <返回上页/@main>";

	elseif idx == 11 and dhid then
		dhid = tonumber(dhid);
		local itemid = t.data.dh[dhid];

		local MC = 2;
		local del_ngold = 5000;
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,兑换失败..",del_ngold), 256);
			return ;
		end
		if Actor.getItemCount(sysarg, 1774) < 5 then
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,兑换失败..", Item.getItemName(1774), 5), 256);
			return ;
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,127,"兑换1级生肖消耗");
		Actor.removeItem(sysarg, 1774, 5, -1,-1,-1);
		Actor.addItem(sysarg, itemid, 0, 0, 1);

		local RwData = {"xxx", "沙漠土城", 157,120, "我也要生肖"};
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
		System.broadcastTipmsg(string.format("<(n%s)>玩家在%s%s处兑换了%s,大家恭喜他吧.",Actor.getName(sysarg), NpcName, NpctFly, Item.getItemLinkMsg(itemid)),ttChatWindow);
	end
end

t.onDuiHuanSXb = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	local data = {};
	local sxpos = t.data.pos;
	local fy = {};
	if idx == 1 then data = t.data.up1; fy[1] = t.data.xh[2].del_ngold; fy[2] = t.data.xh[2].delsxh; end
	if idx == 2 then data = t.data.up2; fy[1] = t.data.xh[3].del_ngold; fy[2] = t.data.xh[3].delsxh; end
	
	if idx == 1 or idx == 2 then
		local e = [[

  <(c0xFFb6946c)请选择您要提升的生肖装备:>

<(idecoLine#315)>

]];
		local n = 0;
		local ItemID = 0;

		for i = 1,12 do
			local itemPtr = Item.getEquipByPos(sysarg, sxpos[i]);
			if itemPtr then
				ItemID = Item.getItemId(itemPtr);
			end
			if itemPtr and data[ItemID] then
				n = n + 1;
				e = e .. string.format("  <将身上的【%s】提升为【%s】/@onDuiHuanSXbEx,%s,%s|需要消耗%s绑金或金币费用＋%s个生肖之魂>\\", Item.getItemName(ItemID), Item.getItemName(data[ItemID]), idx, i, fy[1], fy[2]);
			end
		end

		if n == 0 then 
			e = e .. "  <您身上没有可提升的生肖装备.>\\\\  <需要将生肖佩戴在生肖盒内才可提升!>\\"
		end

		return e .. "\\<(idecoLine#315)>\\\\  <返回上页/@main>";
	end
end

t.onDuiHuanSXbEx = function(sysarg,idx,dhid)
	if not idx then return; end
	if not dhid then return; end
	idx = tonumber(idx);
	dhid = tonumber(dhid);
	local data = {};
	local sxpos = t.data.pos;
	local fy = {};
	if idx == 1 then data = t.data.up1; fy[1] = t.data.xh[2].del_ngold; fy[2] = t.data.xh[2].delsxh; end
	if idx == 2 then data = t.data.up2; fy[1] = t.data.xh[3].del_ngold; fy[2] = t.data.xh[3].delsxh; end

	if not sxpos[dhid] then return; end
	local ItemID = 0;
	local itemPtr = Item.getEquipByPos(sysarg, sxpos[dhid]);
	if itemPtr then ItemID = Item.getItemId(itemPtr); end
	if itemPtr and data[ItemID] then
		local MC = 2;
		local del_ngold = fy[1];
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,升级失败..",del_ngold), 256);
			return ;
		end
		if Actor.getItemCount(sysarg, 1774) < fy[2] then
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,升级失败..", Item.getItemName(1774), fy[2]), 256);
			return ;
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,127,"升级2，3级生肖消耗");
		Actor.removeItem(sysarg, 1774, fy[2], -1,-1,-1);
		Item.removeEquip(sysarg, itemPtr);
		local pNewItem = Item.createItem(data[ItemID],1,0,0,0);
		Item.addItem(sysarg,pNewItem,"升级2，3级生肖",2617);
		Actor.useItem(sysarg,pNewItem);
		local itemid = Item.getItemId(pNewItem);
		local RwData = {"xxx", "沙漠土城", 157,120, "我也要生肖"};
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
		System.broadcastTipmsg(string.format("<(n%s)>玩家在%s%s处升级获得了%s,大家恭喜他吧.",Actor.getName(sysarg), NpcName, NpctFly, Item.getItemLinkMsg(itemid)),ttChatWindow);
		return t.onDuiHuanSXb(sysarg,idx);
	end
end

t.onDuiHuanSXc = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	local sxpos = t.data.pos;
	local fy = "";
	if idx == 1 then fy = string.format("需要消耗%s绑金或金币费用＋%s个生肖之魂#", t.data.xh[4].del_ngold, t.data.xh[4].delsxh); end
	if idx == 2 then fy = string.format("需要消耗%s元宝#", t.data.xh[5].del_ngold); end
	local zssh = t.data.zssh;
	local e = [[

  <(c0xFFb6946c)请选择您要升级><真实伤害><(c0xFFb6946c)的生肖装备:>

<(idecoLine#315)>

]];
	local n = 0;
	for i = 1,12 do
		local sh = 0;
		local ItemID = 0;
		local itemPtr = Item.getEquipByPos(sysarg, sxpos[i]);
		if itemPtr then
			sh = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
			ItemID = Item.getItemId(itemPtr);
		end
		if t.data.dh3[i] == ItemID then
			n = n + 1;
			e = e .. string.format("  <#c0xFFFFFF00#升级【%s】的真实伤害/@onDuiHuanSXcEx,%s,%s|#%s#每次升级随机提升1到5点真实伤害> <(c0xFFb6946c)当前:> <%s><(c0xFFb6946c)/%s点>\\", Item.getItemName(ItemID), i, idx, fy, sh, zssh);
		end
	end
	if n == 0 then 
		e = e .. "  <您身上没有可升级的生肖装备.>\\\\  <需要将生肖佩戴在生肖盒内才可提升!>\\"
	end
	e = e .. "\\<(idecoLine#315)>\\\\  <返回上页/@main>  ";
	if idx == 1 then e = e .. "<#c0xFFFFFF00#元宝提升天级十二生肖/@onDuiHuanSXc,2|无需消耗生肖之魂和金币#只需消耗一定元宝即可快人一步的提升>"; end
	return e;
end

t.onDuiHuanSXcEx = function(sysarg,i,idx)
	if not i then return; end
	if not idx then return; end
	i = tonumber(i);
	idx = tonumber(idx);
	local zssh = t.data.zssh;
	local sxpos = t.data.pos;
	local fy = {};
	
	if idx == 1 then fy[1] = t.data.xh[4].del_ngold; fy[2] = t.data.xh[4].delsxh; end
	if idx == 2 then fy[1] = t.data.xh[5].del_ngold; fy[2] = 0; end
	
	local sh = 0;
	local ItemID = 0;
	local itemPtr = Item.getEquipByPos(sysarg, sxpos[i]);
	if itemPtr then
		sh = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
		ItemID = Item.getItemId(itemPtr);
		if t.data.dh3[i] ~= ItemID then
			Actor.sendTipmsg(sysarg, "出错了联系管理员吧.", 256);
			return ;
		end
		if sh >= zssh then
			Actor.sendTipmsg(sysarg, string.format("您佩戴的<%s>的<真实伤害>属性已经达到最高值了!",Item.getItemName(ItemID)), 256);
			return ;
		end
		local MC = 0;
		local del_ngold = 0;
		if idx == 1 then
			MC = 2;
			del_ngold = fy[1];
			if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
			if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
			if MC == 2 then
				Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,升级失败..",del_ngold), 256);
				return ;
			end
			if Actor.getItemCount(sysarg, 1774) < fy[2] then
				Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,升级失败..", Item.getItemName(1774), fy[2]), 256);
				return ;
			end
		elseif idx == 2 then
			MC = 3;
			del_ngold = fy[1];
			if Actor.getMoneyCount(sysarg,MC) <= del_ngold then
				Actor.sendTipmsg(sysarg, string.format("您的元宝不足 <%s> ,升级失败..",del_ngold), 256);
				return ;
			end
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,127,"生肖提升真实伤害消耗");
		if idx == 1 then
			Actor.removeItem(sysarg, 1774, fy[2], -1,-1,-1);
		end
		local a = math.random(1,5);
		if idx == 2 then a = math.random(2,5); end
		Item.setItemProperty(sysarg,itemPtr,Item.ipRealInjury,(sh + a));
		sh = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
		if sh >= zssh then
			Item.setItemProperty(sysarg,itemPtr,Item.ipRealInjury,zssh);
		end
		return t.onDuiHuanSXc(sysarg,idx);
	else
		Actor.sendTipmsg(sysarg, "你身上没带着生肖呢,想忽悠我呀?", 4);
	end
end


t.openAnHeiShaMo=function(sysarg,index) 
	index =tonumber(index)
	if index == 0 then 
		if Actor.getMoneyCount(sysarg,index)<2000000 then
			Actor.sendTipmsg(sysarg,"您不够绑定金币,入口无法开启", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,0,-2000000,2611,"暗黑沙漠绑金进入");
	elseif index==1 then 
		if Actor.getMoneyCount(sysarg,index)<2000000 then	
			Actor.sendTipmsg(sysarg,"您不够金币,入口无法开启", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,1,-2000000,2611,"暗黑沙漠金币进入");
	elseif index==3 then
		if Actor.getMoneyCount(sysarg,index)<1000 then
			Actor.sendTipmsg(sysarg,"您不够元宝,入口无法开启", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,3,-1000,2611,"暗黑沙漠元宝进入");
	else
		return 
	end
	


	local RwData = {"xxx", "沙漠土城", 157,120, "我也要参加"}
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])

	local sVar = System.getDyanmicVar()
	System.broadcastTipmsg(string.format("<(n%s)>玩家,玩家财大气粗,打开了<暗黑沙漠(3转才可进入)>的传送口,大家快进!%s %s",Actor.getName(sysarg), NpcName, NpctFly),ttChatWindow)
	sVar.anheishamoOpenTime=System.getCurrMiniTime()
	System.addTimer("CloseAnHeiShaMo", 300* 1000, 1)
	System.addTimer("CloseAnHeiShaMoTipEverymins", 60* 1000, 4)
	
	local dVar = System.getDyanmicVar()
	dVar.AHSMcount=4
	
	System.addTimer("CloseAnHeiShaMoTipBefore10", 290* 1000, 1)
	return t.main(sysarg)
end

t.enterAnHeiShaMo=function(sysarg)
	local sVar = System.getDyanmicVar()
	if  sVar.anheishamoOpenTime ==nil then 
		Actor.sendTipmsg(sysarg,"暗黑沙漠入口已关闭,请等待下次开启吧.", ttFlyTip) 
		return t.main(sysarg)
	end
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	if zLv < 3 then 
		Actor.sendTipmsg(sysarg,"3转以上玩家才可进入,你再去练练在来吧!", ttFlyTip) 
		return t.main(sysarg)
	end
	Actor.enterScene(sysarg,265,-1,-1)
end

function CloseAnHeiShaMo()
	local sVar = System.getDyanmicVar()
	sVar.anheishamoOpenTime=nil
	System.broadcastTipmsg(string.format("暗黑沙漠入口已关闭,未进的玩家请等待下次开启吧."),ttChatWindow)
end

function CloseAnHeiShaMoTipEverymins()

	local RwData = {"xxx", "沙漠土城", 157,120, "我也要参加"}
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	local dVar = System.getDyanmicVar()
	if dVar.AHSMcount == nil then 
		dVar.AHSMcount=4 
	end 

	System.broadcastTipmsg(string.format("<暗黑沙漠(3转才可进入)>入口关闭时间还剩%s分钟,请抓紧时间进入!%s %s",dVar.AHSMcount, NpcName, NpctFly),ttChatWindow)
	dVar.AHSMcount=dVar.AHSMcount-1
end

function CloseAnHeiShaMoTipBefore10()

	local RwData = {"xxx", "沙漠土城", 157,120, "我也要参加"}
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("<暗黑沙漠(3转才可进入)>入口关闭时间还剩10秒,请抓紧时间进入!%s %s", NpcName, NpctFly),ttChatWindow)
end


function GetNpcAnHeiShaMo() return t end