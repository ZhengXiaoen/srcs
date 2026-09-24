--活跃奖励脚本功能
--注：需要在每个功能字符串前面加上"500,500||"标示窗口宽高的信息，以"||"分割下面的字符串！
ActiveRewardFunc = {}
ActiveRewardFunc.r = {
	x = 685,
	y = 550,
	RewardLv = 60;
	RewardLv1 = 50;	--7天奖励
	RewardItemprice = 35000, 
	RewardItemsList = {
		{60,73},
		{70,100},
		{80,127},
	},
	Reward2List = {
		{
			{1,661,10},
			{1,318,1},
		},
		{
			{1,630,20},
			{1,511,10},
			{1,307,1},
			{1,311,1},
		},
		{
			{1,631,10},
			{1,511,20},
			{1,307,3},
			{1,311,3},
		},
		{
			{1,632,5},
			{1,319,5},
			{1,307,5},
			{1,311,5},
		},
		{
			{1,591,1},
			{1,633,1},
			{1,332,1},
		},
		{
			{1,591,1},
			{1,633,1},
			{1,332,1},
		},
		{
			{1,591,1},
			{1,633,1},
			{1,332,1},
		},

	},
--	Reward2List = {
--		{
--			{1,661,10},
--		},
--		{
--			{1,591,5},
--			{1,511,10},
--		},
--		{
--			{1,591,10},
--			{1,511,20},
--		},
--		{
--			{1,319,5},
--			{1,632,5},
--		},
--		{
--			{1,591,1},
--			{1,633,1},
--			{1,332,1},
--		},
--		{
--			{1,591,1},
--			{1,633,1},
--			{1,332,1},
--		},
--		{
--			{1,591,1},
--			{1,633,1},
--			{1,332,1},
--		},
--
--	},
	Reward3List = {
		{325,5},
		{415,10},
		{398,5},
		{403,5},
		{402,2},
		{566,5},
	},
	Reward4List = {
		{5000,50000000,200},
		{10000,100000000,400},
		{20000,200000000,800},
	},
};

function il() return string.format("<(idecoLine#%s)>",(ActiveRewardFunc.r.x-50)); end

ActiveRewardFunc.main = function(sysarg)
	local WindowSize = string.format("%s,%s||",ActiveRewardFunc.r.x,ActiveRewardFunc.r.y);
	local vara = Actor.getStaticVar(sysarg);
	local d = vara.d;
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	----------------------------------------------------------------------------------------
	--每日活跃抽奖
	local RewardItemsList = ActiveRewardFunc.r.RewardItemsList;
	local RewardItemprice = ActiveRewardFunc.r.RewardItemprice;
	local ItemList = {};
	local Reward1 = "";
	if d[101] == 0 then
		d[101] = 1;
		for i = 1,#RewardItemsList do
			if pLv >= RewardItemsList[#RewardItemsList][1] then
				ItemList = GetReward2(RewardItemsList[#RewardItemsList][2]);
				break;
			end
			if pLv <= RewardItemsList[1][1] then
				ItemList = GetReward2(RewardItemsList[1][2]);
				break;
			end
			if pLv <= RewardItemsList[i][1] then
				ItemList = GetReward2(RewardItemsList[i][2]);
				break;
			end
		end
		for i = 1,9 do
			d[110+i] = ItemList[i].id;
			d[120+i] = ItemList[i].q;
		end
	end
	if d[101] == 1 then Reward1 = GetReward3(sysarg); end
	----------------------------------------------------------------------------------------
	local Reward3List = ActiveRewardFunc.r.Reward3List;
	local echo3l = "";
	for i = 1,#Reward3List do
		echo3l = echo3l .. "<(iitem#"..Reward3List[i][1].."#0#"..Reward3List[i][2].."#)> ";
	end
	----------------------------------------------------------------------------------------
	local day7 = {};
	for i = 1,7 do
		day7[i] = "　　<(c0xFF888888)已领取>";
		if d[104] <= i then
			day7[i] = "   <领取奖励/@award2,%s>";
		end
	end
	----------------------------------------------------------------------------------------
	
	local echoReward1 = "";
	if Reward1 ~= "" then
		echoReward1 = Reward1.." <确认随机领取1件/@award1><(c0xFF888888)(等级大于"..ActiveRewardFunc.r.RewardLv.."级每天上线即可领取)>"
	end
	
	local echo = WindowSize .. [[
<(c0xFFFF00FF)每日活跃抽奖:> <刷新奖品列表/@Refresh1><(c0xFF888888)(]]..RewardItemprice..[[绑金或金币/次,每天第1次登录会默认刷新1次)> 

]]..echoReward1..il()..[[ 

<(c0xFFFF00FF)每日登录领奖:><(c0xFF888888)(每天都有,上线就送,一来就领)> 

]]..echo3l..[[ <确认领取/@award3><(c0xFF888888)(等级大于]]..ActiveRewardFunc.r.RewardLv..[[级每天上线即可领取)>

]]..il()..[[ 

<(c0xFFFF00FF)登录活跃领奖:>
]];
	local Reward2List = ActiveRewardFunc.r.Reward2List;
	for i = 1,7 do
		local rewards2 = "";
		local rewards2e = "";
		for k = 1,#Reward2List[i] do
			if Reward2List[i][k][1] == 1 then
				rewards2 = rewards2 .. "<(iitem#"..Reward2List[i][k][2].."#0#"..Reward2List[i][k][3].."#)> ";
			end
		end
		rewards2 = rewards2 .. string.format(day7[i],i);
		echo = echo .. string.format("　　第<(c0xFF00FF00)%s>天登录奖励: %s\\",i,rewards2);
		rewards2 = "";
	end
	return echo;
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--每日登录领奖
ActiveRewardFunc.award3 = function(sysarg)
	local Reward3List = ActiveRewardFunc.r.Reward3List;
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local vara = Actor.getStaticVar(sysarg);
	local d = vara.d;
	if pLv < ActiveRewardFunc.r.RewardLv then Actor.sendTipmsg(sysarg,string.format("您的等级小于%s,领取失败.",ActiveRewardFunc.r.RewardLv),256); return; end
	if d[103] ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经领取过[每日登录领奖],请明天再来吧.",256); return; end
	if Item.getBagEmptyGridCount(sysarg) < #Reward3List then Actor.sendTipmsg(sysarg,string.format("您的包裹没有%s个空格,请清理一下再来吧!",#Reward3List),4); return; end
	d[103] = 1;
	local list = "";
	for i = 1,#Reward3List do
		list = list .. Item.getItemLinkMsg(Reward3List[i][1]) .."*"..Reward3List[i][2].." ";
		Actor.addItem(sysarg,Reward3List[i][1],0,0,Reward3List[i][2],1,0,"MeiRiLogin");
	end
	Actor.sendTipmsg(sysarg,string.format("恭喜您成功领取到%s.",list),256);
	System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)恭喜玩家><(n%s)><(c0xFFd4ab6f)在><活跃奖励面板/@@showWin,105><(c0xFFd4ab6f)这里领取了每日奖励>%s<(c0xFFd4ab6f),威武霸气!>",Actor.getName(sysarg),list),128);
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7天奖励
ActiveRewardFunc.award2 = function(sysarg,i)
	if i then
		
		local i = tonumber(i);
		local Reward2List = ActiveRewardFunc.r.Reward2List;
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
		local vara = Actor.getStaticVar(sysarg);
		local d = vara.d;
		if pLv < ActiveRewardFunc.r.RewardLv1 then Actor.sendTipmsg(sysarg,string.format("您的等级小于%s,领取失败.",ActiveRewardFunc.r.RewardLv1),256); return; end
		if d[105] == 1 then Actor.sendTipmsg(sysarg,string.format("您今天已经领取过本奖励了,请明天再来吧!",i),256); return; end
		if d[104] ~= i then Actor.sendTipmsg(sysarg,string.format("领取失败,您当前应该领取第%s天奖励.",d[104]),256); return; end

		if not Reward2List[i] then return; end
		local r = Reward2List[i];
		if Item.getBagEmptyGridCount(sysarg) < #r then Actor.sendTipmsg(sysarg,string.format("您的包裹没有%s个空格,请清理一下再来吧!",#r),4); return; end
		if d[104] == 1 then if Item.getBagEmptyGridCount(sysarg) < 10 then Actor.sendTipmsg(sysarg,string.format("您的包裹没有%s个空格,请清理一下再来吧!",10),4); return; end end
		d[105] = 1;
		d[104] = i + 1;
		
		local list = "";
		
		for u = 1,#r do
			
			list = list .. Item.getItemLinkMsg(r[u][2]) .."*"..r[u][3].." ";
			Actor.addItem(sysarg,r[u][2],0,0,r[u][3],1,0,"MeiRiLogin1");
		end


		Actor.sendTipmsg(sysarg,string.format("恭喜您成功领取到%s.",list),256);
		System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)恭喜玩家><(n%s)><(c0xFFd4ab6f)在><活跃奖励面板/@@showWin,105><(c0xFFd4ab6f)这里领取了7天登录奖励>%s<(c0xFFd4ab6f),威武霸气!>",Actor.getName(sysarg),list),128);
		return ActiveRewardFunc.main(sysarg);
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--每日活跃抽奖
ActiveRewardFunc.award1 = function(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local vara = Actor.getStaticVar(sysarg);
	local d = vara.d;
	if pLv < ActiveRewardFunc.r.RewardLv then Actor.sendTipmsg(sysarg,string.format("您的等级小于%s,领取失败.",ActiveRewardFunc.r.RewardLv),256); return; end
	if d[102] ~= 0 then Actor.sendTipmsg(sysarg,"您今天已经领取过[每日活跃抽奖],请明天再来吧.",256); return; end
	if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg,"您的包裹没有1个空格,请清理一下再来吧!",4); return; end
	d[102] = 1;
	local i = math.random(1,9);
	local ItemId = d[110+i];
	if ItemId == 0 then return end
	
	local q = d[120+i];
	local str = "+"..q;
	if q == 0 then str = ""; end
	Actor.addItem(sysarg,ItemId,0,q,1,0,0,"MeiRiHuoYue");
	Actor.sendTipmsg(sysarg,string.format("恭喜您成功领取到%s%s.",Item.getItemLinkMsg(ItemId),str),256);
	System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)恭喜玩家><(n%s)><(c0xFFd4ab6f)在><活跃奖励面板/@@showWin,105><(c0xFFd4ab6f)这里领取了每日奖励>%s%s<(c0xFFd4ab6f),威武霸气!>",Actor.getName(sysarg),Item.getItemLinkMsg(ItemId),str),128);
end
ActiveRewardFunc.Refresh1 = function(sysarg)
	local vara = Actor.getStaticVar(sysarg);
	local d = vara.d;
	local RewardItemprice = ActiveRewardFunc.r.RewardItemprice;
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= RewardItemprice then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= RewardItemprice then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s,刷新失败...",RewardItemprice),256);
		return;
	end
	Actor.changeMoney(sysarg,MC,-RewardItemprice,GameLog.cDailyLottery,"每日抽奖");
	if not d[101] then d[101] = 0; end
	d[101] = 0;
	local str = "绑定";
	if MC == 1 then str = ""; end
	Actor.sendTipmsg(sysarg,string.format("刷新成功,%s金币减少%s.",str,RewardItemprice),256);
	return ActiveRewardFunc.main(sysarg);
end
function GetReward2(id)
	local id = tonumber(id);
	local ItemList = {};
	for i = 1,9 do
		local nId = math.random(id,id+26);
		local q = math.random(1,3);
		table.insert(ItemList,{id=nId,q=(q-1)});
	end
	return ItemList;
end
function GetReward3(sysarg)
	local vara = Actor.getStaticVar(sysarg);
	local d = vara.d;
	local a = "";
	for i = 1,9 do
		if d[110+i] ~= 0 then
			a = a .. "<(iitem#"..d[110+i].."#0#0#"..d[120+i]..")> ";
		end
	end
	return a;
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------