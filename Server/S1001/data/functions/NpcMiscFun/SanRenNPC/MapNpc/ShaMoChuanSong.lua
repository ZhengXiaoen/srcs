--沙漠传送

local t = {

	mapdata = {
		[1]={name="暗黑猪洞",needLevel=80,id=256, btime = 60, sx = "人级", xh = {
					{type = 0, str = "绑定金币", num = 200000},
					{type = 1, str = "金币", num = 200000},
					{type = 3, str = "元宝", num = 100},
			},},
		[2]={name="暗黑寺庙",needLevel=80,id=257, btime = 60, sx = "人级", xh = {
					{type = 0, str = "绑定金币", num = 200000},
					{type = 1, str = "金币", num = 200000},
					{type = 3, str = "元宝", num = 100},
			},},
		[3]={name="暗黑洞窟",needLevel=85,id=258, btime = 120, sx = "地级", xh = {
					{type = 0, str = "绑定金币", num = 300000},
					{type = 1, str = "金币", num = 300000},
					{type = 3, str = "元宝", num = 150},
			},},
		[4]={name="暗黑矿区",needLevel=85,id=259, btime = 120, sx = "地级", xh = {
					{type = 0, str = "绑定金币", num = 300000},
					{type = 1, str = "金币", num = 300000},
					{type = 3, str = "元宝", num = 150},
			},},
		[5]={name="暗黑棺材",needLevel=90,id=260, btime = 240, sx = "天级", xh = {
					{type = 0, str = "绑定金币", num = 2000000},
					{type = 1, str = "金币", num = 2000000},
					{type = 3, str = "元宝", num = 500},
			},},
		[6]={name="暗黑宫殿",needLevel=90,id=261, btime = 240, sx = "天级", xh = {
					{type = 0, str = "绑定金币", num = 2000000},
					{type = 1, str = "金币", num = 2000000},
					{type = 3, str = "元宝", num = 500},
			},},
-- [7]={name="暗黑古墓",needLevel=80,id=262},
-- [8]={name="暗黑祭坛",needLevel=80,id=263},
-- [9]={name="暗黑禁地",needLevel=80,id=264},
	},

	data = {
		zssh = 1000, --真实伤害上限
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

};

t.main = function(sysarg)
	local str = "小怪刷新时间为30分钟,10%机率掉落书页#BOSS刷新时间60分钟,杀死必掉书页若干#所有地图怪物强度都相同"
	local echo = [[

  <(c0xFFb6946c)请选择您要去的地图:>
  <(c0xFFb6946c)鼠标移动到您想传送去的地图则会详细需求和说明.>
  <(c0xFFb6946c)小怪刷新时间5分钟,越贵的地图小怪爆率越高.>

<(idecoLine#315)>

]];

	local d = t.data.xh;
	local sxstr = string.format([[
  <#c0xFFFFFF00#兑换人级生肖/@onDuiHuanSXa,1|%s个生肖之魂即可兑换1个人级生肖装备> <#c0xFFFFFF00#兑换地级生肖/@onDuiHuanSXb,1|佩戴人级生肖在生肖盒内再加%s个生肖之魂即可升级为地级生肖装备> <#c0xFFFFFF00#兑换天级生肖/@onDuiHuanSXb,2|佩戴地级生肖在生肖盒内再加%s个生肖之魂即可升级为天级生肖装备>
  
  <#c0xFFFFFF00#提升天级十二生肖/@onDuiHuanSXc,1|使用%s个生肖之魂即可提升天级生肖装备真实伤害属性> <增加真实伤害,无视防御的超强伤害!>
  
  <#c0xFFFFFF00#元宝提升天级十二生肖/@onDuiHuanSXc,2|无需消耗生肖之魂和金币#只需消耗%s元宝即可快人一步的提升> <#c0xFFFFFF00#回收十二生肖装备/@onHuiShouSX|获得一定的生肖之魂>
]], d[1].delsxh, d[2].delsxh, d[3].delsxh, d[4].delsxh, d[5].del_ngold);

	local data = t.mapdata;
	local str = "  <<showEff%s(%s级)>/@chuansong,%s|&FFFFFF&扣费说明:##优先扣除&FFFF00& %s &FFFFFF&绑定金币#没有就扣&FFFF00& %s &FFFFFF&金币#都没有就扣&FFFF00& %s &FFFFFF&元宝##里面BOSS刷新时间为 %s 分钟(1/5机率掉落 &FFFF00&%s&FFFFFF& 生肖装备)##使用回城石会直接回到暗黑沙漠安全区##30分钟后自动传送回暗黑沙漠#30分钟后自动传送回暗黑沙漠#30分钟后自动传送回暗黑沙漠> ";
	for i = 1,#data do
		echo = echo .. string.format(str, data[i].name, data[i].needLevel, i, data[i].xh[1].num, data[i].xh[2].num, data[i].xh[3].num, data[i].btime, data[i].sx );
		if i % 2 == 0 then echo = echo .. "\\\\"; end
	end
	echo = echo .. [[
<(idecoLine#315)>

]]
..sxstr..
[[

<(idecoLine#315)>

  <返回土城/@huishamo> <(c0xFF888888)(使用回城石会直接回到暗黑沙漠安全区)>
]];
	return echo;
end

t.huishamo = function(sysarg)
	Actor.enterScene(sysarg,83,-1,-1);
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

t.chuansong=function(sysarg,i)
	if not i then return; end
	i = tonumber(i);
    
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if pLv < t.mapdata[i].needLevel then
		Actor.sendTipmsg(sysarg, string.format("您的等级不足%s级,传送失败..", t.mapdata[i].needLevel) ,4);
		return t.main(sysarg);
	end
	local idx = t.mapdata[i].xh;
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
	Actor.changeMoney(sysarg, idx[bj].type, -idx[bj].num, 2613,"暗黑沙漠传送消耗");
	Actor.enterScene(sysarg, t.mapdata[i].id, -1, -1);

	Actor.deleteTimer(sysarg, 28);
	set_d_val(sysarg,12,1800); --定时器记时用
	Actor.addTimer(sysarg, 28, 5000 ); --每5秒1判断，顺带给玩家提示倒计时
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

function GetNpcShaMoChuanSong() return t end