local t = {
	need_itemid = 318,
	sjsdh = {
		{"羽毛",464,20,6000,1},
		{"羽毛",465,7,1,1},
		{"强化石",459,20,6000,1},
		{"强化石",460,7,1,1},
		{"宝石结晶",0,200,6000,0},
		{"圣珠结晶",0,200,6000,0},
	},
	--材料合成数据
	clhcdata = {
		{465,464,3,500},
		{466,465,3,700},
		{467,466,3,900},
		{468,467,3,1200},

		{460,459,3,700},
		{461,460,3,800},
		{462,461,2,900},
	},
	--高级装备兑换升阶石
	gjdh = {
		{439,1},--通天青云剑
		{440,1},--通天之甲(男)
		{441,1},--通天之甲(女)
		{442,1},--通天之盔
		{443,1},--通天之链
		{444,1},--通天之镯
		{445,1},--通天之戒
		{446,1},--通天之带
		{447,1},--通天之靴
		{448,2},--毁灭星王斩
		{449,2},--毁灭灵甲(男)
		{450,2},--毁灭灵甲(女)
		{451,2},--毁灭灵盔
		{452,2},--毁灭灵链
		{453,2},--毁灭灵镯
		{454,2},--毁灭灵戒
		{455,2},--毁灭灵带
		{456,2},--毁灭灵靴
		{577,4},--奔雷主宰刀
		{578,4},--奔雷域甲(男)
		{579,4},--奔雷域甲(女)
		{580,4},--奔雷域盔
		{581,4},--奔雷域链
		{582,4},--奔雷域镯
		{583,4},--奔雷域戒
		{584,4},--奔雷域带
		{585,4},--奔雷域靴
		{586,8},--雷神赤焰斩
		{587,8},--雷神焰甲(男)
		{588,8},--雷神焰甲(女)
		{589,8},--雷神焰盔
		{590,8},--雷神焰链
		{591,8},--雷神焰镯
		{592,8},--雷神焰戒
		{593,8},--雷神焰带
		{594,8},--雷神焰靴
		{595,16},--至尊血灵斩
		{596,16},--至尊血甲(男)
		{597,16},--至尊血甲(女)
		{598,16},--至尊血盔
		{599,16},--至尊血链
		{600,16},--至尊血镯
		{601,16},--至尊血戒
		{602,16},--至尊血带
		{603,16},--至尊血靴
	},

};

	--318 装备升阶石

t.main = function(sysarg)

	local echo = "\\  <(c0xFF705e45)来来来,看一看,瞧一瞧,不花钱就得找我发家致富~>\\";
	echo = echo .. [[

<(idecoLine#330)>

  <合成装备升阶石/@shengjieshi>

  <合成羽毛/@cailiaohc> 

<(idecoLine#330)>

  <装备兑换装备升阶石/@GJshengjieshi,1>

]]

	return echo;
end

t.GJshengjieshi = function(sysarg,a)
	if not a then return; end
	a = tonumber(a);
	if a > 45 then
		a = 1;
		Actor.sendTipmsg(sysarg, "已经到最后一页了,我给你跳到第一页了.", 256);
	end

	local echo = [[\  <(c0xFF705e45)请选择您使用兑换升阶石的装备:>\\<(idecoLine#330)>\\]];
	local data = t.gjdh;
	local b = 111;

	if a == 10 then
		b = b + 1;
	elseif a == 19 then
		b = b + 2;
	elseif a == 28 then
		b = b + 3;
	elseif a == 37 then
		b = b + 4;
	elseif a == 46 then
		b = b + 5;
	end

	for i = a,(a+8) do
		echo = echo .. string.format("  <%s/@GJsjsdh,%s,1,%s>  可兑换获得 <%s> 颗 <装备升阶石>\\",Item.getItemName(data[i][1]),i,a,data[i][2]);
	end
	echo = echo .. string.format("\\<(idecoLine#330)>\\\\  <(c0xFF705e45)您的装备仓库中拥有此类装备> <%s> <(c0xFF705e45)件> <兑换%s颗装备升阶石/@GJsjsdh,%s,2,%s>",get_d_val(sysarg,b),data[a][2],a,a);
	echo = echo .. string.format("\\\\<(idecoLine#330)>\\\\  <下一页/@GJshengjieshi,%s> <返回主页/@main>",(a+9));
	return echo;
end

t.GJsjsdh = function(sysarg,i,y,a)
	if not i then return; end
	if not y then return; end
	if not a then return; end
	i = tonumber(i);
	y = tonumber(y);
	a = tonumber(a);
	local data = t.gjdh;
	if y == 1 then
		local itemid = data[i][1];
		if Actor.getItemCount(sysarg,itemid) > 0 then
			Actor.removeItem(sysarg,itemid,1,-1,-1,-1);
		else
			Actor.sendTipmsg(sysarg, string.format("您的包裹内没有 <%s> ,兑换失败.",Item.getItemName(itemid)), 256);
			return;
		end
	elseif y == 2 then
		local b = 111;
		if a == 10 then
			b = b + 1;
		elseif a == 19 then
			b = b + 2;
		elseif a == 28 then
			b = b + 3;
		elseif a == 37 then
			b = b + 4;
		elseif a == 46 then
			b = b + 5;
		end
		if get_d_val(sysarg,b) > 0 then
			del_d_val(sysarg,b,1);
		else
			Actor.sendTipmsg(sysarg, "您的装备仓库内此类装备数量不足1个,兑换失败.", 256);
			return;
		end
	end
	local itemaddnum = data[i][2];
	Actor.addItem(sysarg, t.need_itemid, 0, 0, itemaddnum,1,0,"hecheng 0",1);
	Actor.sendTipmsg(sysarg, "兑换成功!", 256);
	return t.GJshengjieshi(sysarg,a);
end

t.cailiaohc = function(sysarg)
	local echo = "\\  <(c0xFF705e45)我可是万能合成师哟.>\\  <(c0xFF705e45)请选择您要合成的物品:> \\\\<(idecoLine#330)>\\\\";
	local d = t.clhcdata;
	for i = 1,#d do
		echo = echo .. string.format("  <合成1个%s/@clhc,%s|需求: %s x%s ＋ 金币 x%s>	<一次合成20个%s/@clhc,%s,20|需求: %s x%s ＋ 金币 x%s> \\\\", Item.getItemName(d[i][1]), i, Item.getItemName(d[i][2]), d[i][3], d[i][4], Item.getItemName(d[i][1]), i, Item.getItemName(d[i][2]), d[i][3]*20, d[i][4]*20);
	end

	echo = echo .. "<(idecoLine#330)>\\\\  <返回/@main>";
	return echo;
end

t.clhc = function(sysarg,a,j)
	if not a then return; end
	local i = tonumber(a);
	--print(j)
	if j then j = tonumber(j); else j = 1; end
	--print(j)
	if j < 1 then return; end
	local d = t.clhcdata;
	local add_nitem = d[i][1];
	local remove_nitem = d[i][2];
	local item_count = 1 * j;
	local del_count = d[i][3] * j;
	local del_ngold = item_count * d[i][4];

	if Actor.getItemCount(sysarg, remove_nitem) < del_count then
		Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败.", Item.getItemName(remove_nitem), del_count), 256);
		return ;
	end

	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败.",del_ngold), 256);
		return ;
	end

	Actor.changeMoney(sysarg, MC, -del_ngold,127,"装备合成消耗金钱");
	Actor.removeItem(sysarg, remove_nitem, del_count, -1,-1,-1);
	Actor.addItem(sysarg, add_nitem, 0, 0, item_count, 1,0,"hecheng 1",1);
end

t.clhcS = function(sysarg,a,b)
	if not a then return; end
	if not b then return; end
	a = tonumber(a);
	b = tonumber(b);
	local d = t.clhcdata;
	local d = t.clhcdata;
	local add_nitem = 0;
	local remove_nitem = 0;
	local item_count = 0;
	local del_count = 0;
	local del_ngold = 0;
	local u = 0;
	for i = a,b do
		del_count = d[i][3];
		remove_nitem = d[i][2];
		item_count = math.floor(Actor.getItemCount(sysarg, remove_nitem) / del_count);
		-- if Actor.getItemCount(sysarg, remove_nitem) < del_count then
		-- 	Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败..", Item.getItemName(remove_nitem), del_count), 256);
		-- 	return ;
		-- end
		if item_count > 0 then
			del_ngold = item_count * d[i][4];
			local MC = 2;
			if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
			if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
			if MC == 2 then
				Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败.",del_ngold), 256);
				return ;
			end
			add_nitem = d[i][1];
			Actor.changeMoney(sysarg, MC, -del_ngold,127,"装备合成消耗金钱");
			Actor.removeItem(sysarg, remove_nitem, (item_count*del_count), -1,-1,-1);
			Actor.addItem(sysarg, add_nitem, 0, 0, item_count, 1,0,"hecheng 2",1);
			u = u + 1;
		end
	end
	if u == 0 then
		Actor.sendTipmsg(sysarg, "您的包裹内没有可合成的材料.", 256);
	end
end



  --<回收]]..iSJSname..[[/@DuiHuanJB,1> <(c0xFF008aff)返还:> 200,000 绑金/颗
t.shengjieshi  = function(sysarg)
	local iSJS = "";
	local iSJSname = "";
	local d = t.sjsdh;
	local echo = [[

  <(c0xFF705e45)以下合成材料均可在副本管理员处获得.>

  <(c0xFF705e45)当前宝石结晶:> <(c0xFFeabc78)]]..Actor.getUIntProperty(sysarg, 125)..[[>
  <(c0xFF705e45)当前圣珠结晶:> <(c0xFFeabc78)]]..Actor.getUIntProperty(sysarg, 127)..[[>

<(idecoLine#330)>

]];

	for i = 1,#d do
		iSJSname = Item.getItemName(t.need_itemid);
		iSJS = Item.getItemLinkMsg(d[i][2]);
		if i == 5 or i == 6 then
			iSJS = "<(c0xFFff8a00)"..d[i][1]..">";
		end
		echo = echo .. string.format("  <使用%s兑换1颗 装备升阶石/@DuiHuanSJS,%s|兑换手续费: %s 金币##兑换成功则获得 装备升阶石 1颗##羽毛和强化石兑换的为 绑定 的装备升阶石##宝石结晶和圣珠结晶兑换的为 非绑定 的装备升阶石> <(c0xFF705e45)需求:> %s <(c0xFF705e45)x%s>\\\\", d[i][1], i, d[i][4], iSJS, d[i][3]);
	end

	return echo .. "<(idecoLine#330)>\\\\  <返回/@main>";
end




t.DuiHuanSJS = function(sysarg,idx)
	if not idx then return; end
	local i = tonumber(idx);
	local d = t.sjsdh;
	if d[i] then

		local del_ngold = d[i][4];
		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,兑换失败.", del_ngold), 256);
			return ;
		end
		local nBangDing = d[i][5];
		if i >= 1 and i <= 4 then
			if Actor.getItemCount(sysarg, d[i][2]) < d[i][3] then
				Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,兑换失败.", Item.getItemName(d[i][2]), d[i][3]), 256);
				return ;
			end
			Actor.changeMoney(sysarg, MC, -del_ngold,845,"装备兑换消耗金钱");
			Actor.removeItem(sysarg, d[i][2], d[i][3], -1,-1,-1);
			Actor.addItem(sysarg, t.need_itemid, 0, 0, 1, nBangDing,0,"hecheng 3",1);
		else
			local r = 0;
			if i == 5 then r = 125; end
			if i == 6 then r = 127; end
			if r == 0 then return; end
			if Actor.getUIntProperty(sysarg, r) < d[i][3] then
				Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,兑换失败.", d[i][1], d[i][3]), 256);
				return ;
			end
			Actor.changeMoney(sysarg, MC, -del_ngold,845,"装备兑换消耗金钱");
			Actor.setUIntProperty(sysarg, r, (Actor.getUIntProperty(sysarg, r) - d[i][3]));
			Actor.addItem(sysarg, t.need_itemid, 0, 0, 1, nBangDing,0,"hecheng 4",1);
			Actor.sendTipmsg(sysarg, string.format("兑换成功,您的 <%s> 剩余数量为 <%s> .", d[i][1], Actor.getUIntProperty(sysarg, r)), 256);
		end

		--local NpcName = Actor.getTalkNpcName(sysarg);
		--local StrNpcE = string.format("<%s/M炎龙城:123:131:%s><(x炎龙城:123:131:%s)>",NpcName,NpcName,NpcName);
		--System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s兑换了1颗%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(t.need_itemid)),256);
		return t.shengjieshi(sysarg);
	end
end

---------------------------------------------------------------------------
function GetNpcHeChenDaShi() return t end