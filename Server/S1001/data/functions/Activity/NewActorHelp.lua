NewActorHelpFunc = {}

NewActorHelpFunc.main = function()
	local dlgStr = "No Activity Function Name";
	return dlgStr;
end

--新手帮助内容

--我要升级
NewActorHelpFunc.level = function(sysarg)
	local RwData = {

			{"1.休闲挂机","威龙城",131,133, "传送员",      "65级",	    "经验      "},
			{"2.特色副本","威龙城",131,171, "副本管理员",  "65级",	    "材料      "},	
			{"3.膜拜霸主","威龙城",132,152, "武林盟主雕像","30级",      "经验      "},
			{"4.降妖除魔","威龙城",97,107,  "战无双",      "60级",	    "经验、内功   "},
			{"5.装备回收","威龙城",114,152, "装备回收",    "35级",	    "经验、绑金   "},
			{"6.炼狱寺庙","威龙城",149,151, "炼狱",        "30级",      "超大额经验   "},
			

 
		};

	local echo = [[


]];
	for i = 1,#RwData do
		local r = RwData[i];
		local MapName = string.format("<%s/M%s:%s:%s:%s>",r[2],r[2],r[3],r[4],r[5]);
		local NpcName = string.format("<%s/M%s:%s:%s:%s>",r[5],r[2],r[3],r[4],r[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>",r[2],r[3],r[4],r[5]);
		local Lits = string.format("   <(c0xFF888888)%s><(c0xFF888888)(%s)>  <(c0xFFFF0000)%s> <(c0xFF888888)到>%s<(c0xFF888888)找>%s %s\\",r[1],r[6],r[7],MapName,NpcName,NpctFly);
		echo = echo .. Lits;
	end
	-- echo = echo .. "\\<(idecoLine#450)>\\\\     <(c0xFF888888)*经验炼制><(c0xFFFF0000)(推荐)>          <(c0xFFFF0000)大批量经验>             <开区前三天开放>\\";
	-- echo = echo .. "\\     <(c0xFF888888)*探索宝藏><(c0xFFFF0000)(推荐)>          <(c0xFFFF0000)大批量经验>             <打开探索宝藏面板/@@showWin,31>\\";
	-- echo = echo .. "\\     <(c0xFF888888)*灵兽献瑞><(c0xFFFF0000)(推荐)>          <(c0xFFFF0000)经验、绑金>             <打开每日活动面板/@@showWin,15>";
	-- echo = echo .. "\\\\<(idecoLine#450)>";
	return echo;
end

NewActorHelpFunc.serverVersion = function(sysarg)
	return LogicServerVersion
end

--我要装备
NewActorHelpFunc.equip = function(sysarg)

	local RwData = {

			{"1.野外刷怪","威龙城",131,133,    "传送员",    "65级",   "  掉落高级装备    "},
            {"2.BOSS之家","威龙城",126,165,    "首领之家",  " VIP ",  " 掉落装备和材料  "},
            {"3.军团地图","威龙城",144,158,    "军团使者",  "贡献度", "掉落装备和材料  "},
            {"4.混沌地界","沙漠土城",166,118,  "混沌地界",  "无限制", "掉落装备和材料  "},
            {"5.散人殿堂","威龙城",125,120,    "散人殿堂",  "无限制", "掉落装备        "},
            {"6.转生地宫","沙漠土城",151,135,  "转生地宫",  "需转生", "掉落装备        "},
          

			
		};

	local echo = [[


]];
	for i = 1,#RwData do
		local r = RwData[i];
		local MapName = string.format("<%s/M%s:%s:%s:%s>",r[2],r[2],r[3],r[4],r[5]);
		local NpcName = string.format("<%s/M%s:%s:%s:%s>",r[5],r[2],r[3],r[4],r[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>",r[2],r[3],r[4],r[5]);
		local Lits = string.format(" <(c0xFF888888)%s><(c0xFF888888)(%s)>  <(c0xFFFF0000)%s> <(c0xFF888888)到>%s<(c0xFF888888)找>%s %s\\",r[1],r[6],r[7],MapName,NpcName,NpctFly);
		echo = echo .. Lits;
	end

	--echo = echo .. " <(c0xFF00aaff)探索宝藏><(c0xFFFF0000)(推荐)>        <(c0xFFFF0000)高级装备>       <(c0xFFff8a00)点开右上角探索宝藏图标>\\";
	-- echo = echo .. "<(idecoLine#450)> \\\\ <(c0xFF888888)*探索宝藏><(c0xFFFF0000)(推荐)>      <(c0xFFFF0000)所有高级装备和特殊装备>      <打开探索宝藏面板/@@showWin,31>";
	-- echo = echo .. "\\\\ <(c0xFF888888)*BOSS信息><(c0xFFFF0000)(推荐)>      <(c0xFFFF0000)所有高级装备和特殊装备>      <打开BOSS信息面板/@@showWin,96>";
	-- echo = echo .. "\\\\<(idecoLine#450)>";
	return echo;
end

--我要赚钱
NewActorHelpFunc.money = function(sysarg)
	local RwData = {
			
			{"1.回收装备","威龙城",112,152,    "装备回收",   "35级"," 可获得大量绑金  "},
			{"2.野外刷怪","威龙城",133,133,    "传送员",     "65级"," 可获得装备      "},
			{"3.武林争霸","威龙城",209,139,    "武林争霸",   "80级"," 胜者获得金条    "},
			{"4.废弃矿洞","威龙城",133,133,    "传送员",     "65级"," 可获得金币      "},
			{"5.跑吧老哥","沙漠土城",155,139,  "跑吧老哥",   "80级"," 可获得元宝、绑金"},
			-- {"6.元宝嘉年华","热血王城",96,86,  " ",   "80级"," 可获得金币、元宝 "},
			


		};

	local echo = [[


]];

	for i = 1,#RwData do
		local r = RwData[i];
		local MapName = string.format("<%s/M%s:%s:%s:%s>",r[2],r[2],r[3],r[4],r[5]);
		local NpcName = string.format("<%s/M%s:%s:%s:%s>",r[5],r[2],r[3],r[4],r[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>",r[2],r[3],r[4],r[5]);
		local Lits = string.format(" <(c0xFF888888)%s><(c0xFF888888)(%s)> <(c0xFFFF0000)%s> <(c0xFF888888)到>%s<(c0xFF888888)找>%s %s\\",r[1],r[6],r[7],MapName,NpcName,NpctFly);
		echo = echo .. Lits;
	end
	echo = echo .. "\\<(idecoLine#450)>";
	echo = echo .. " \\ <(c0xFF888888)6.元宝嘉年华(80级)> <(c0xFFFF0000)可获得金币、元宝>  <前往热血王城/M热血王城:93:86:>\\\\";
	-- echo = echo .. " <(c0xFF888888)*商城购买><(c0xFFFF0000)(推荐)>     <(c0xFFFF0000)购买金条获得绑金>       <(c0xFF888888)点开右下角商城图标>\\\\";
	-- echo = echo .. " <(c0xFF888888)*探索宝藏><(c0xFFFF0000)(推荐)>     <(c0xFFFF0000)有几率获得大额绑金>     <(c0xFF888888)点开右上角探索宝藏图标>";
	-- echo = echo .. "\\\\<(idecoLine#450)>";
	return echo;
end

--我要变强
NewActorHelpFunc.strong = function(sysarg)
	local echo = [[

 <(c0xFF888888)01.装备强化><(c0xFF00aaff)(攻击、防御)>    <(c0xFFFF0000)消耗金币加强装备属性>    <打开锻造面板/@@showWin,5>
 <(c0xFF888888)02.历练称号><(c0xFF00aaff)(攻击、防御)>   <(c0xFFFF0000)完成各种历练获得历练值>   <打开历练面板/@@showWin,19>
 <(c0xFF888888)03.翅膀系统><(c0xFF00aaff)(攻击、防御)>    <(c0xFFFF0000)采用精羽毛和元宝进阶>    <打开翅膀面板/@@showWin,110>
 <(idecoLine#350)>
 <(c0xFF888888)04.转生系统><(c0xFF00aaff)( 综合属性 )>   <(c0xFFFF0000)采用转生修为值进行转生>   <打开转生面板/@@showWin,1,4>
 <(c0xFF888888)05.特殊装备><(c0xFF00aaff)(特殊  属性)>   <(c0xFFFF0000)采用各种材料升级特殊装备> <打开神炉面板/@@showWin,129>
 <(idecoLine#350)>
 <(c0xFF888888)06.野外BOSS分布><(c0xFF00aaff)(装备)>   <(c0xFFFF0000)各个等级BOSS分布情况>   <打开BOSS分布面板/@@showWin,96,1>
 <(c0xFF888888)07.野外BOSS掉落><(c0xFF00aaff)(装备)>   <(c0xFFFF0000)各个等级BOSS的掉落情况> <打开掉落公告面板/@@showWin,96,6>
 <(idecoLine#350)>
 <(c0xFF888888)08.战将合体><(c0xFF00aaff)(攻击)>   <(c0xFFFF0000)战将合体可以增加角色伤害>      <打开战将面板/@@showWin,118>
 <(c0xFF888888)09.BOSS符文><(c0xFF00aaff)(攻击)>   <(c0xFFFF0000)集齐BOSS符文增加角色攻击>      <打开BOSS符文/@@showWin,96,4>
 <(c0xFF888888)10.军团军衔><(c0xFF00aaff)(综合功能)>   <(c0xFFFF0000)军衔等级不同，功能不同>     <前往军团使者/M威龙城:143:158:军团使者>
 <(c0xFF888888)11.探索宝藏><(c0xFF00aaff)(等级、装备)> <(c0xFFFF0000)获得各种装备、经验丹>       <打开探索宝藏/@@showWin,31>
 <(c0xFF888888)12.捐献排行><(c0xFF00aaff)(伤害加成)>   <(c0xFFFF0000)捐献排名越高，伤害加成越高> <打开捐献排行/@@showWin,164>



	]];


	return echo;
end

----我要增益
--NewActorHelpFunc.buff = function(sysarg)
--	local echo = [[
-- <(c0xFF00aaff)神力护身> 加入佣兵之后可以开启神力护身增加攻击倍数,佣兵等级越高,神力属性越高
-- <(c0xFF00aaff)金币捐献> 每天金币捐献榜第1可享受30%攻击倍数加成
-- <(c0xFF00aaff)属性药水> 可在BOSS身上和商铺中获得,吃了增加伤害属性
-- <(c0xFF00aaff)天下第一> 土城天下第一雕像处登记自身属性后获得10%伤害加成
-- <(c0xFF00aaff)武林盟主> 每天13点土城盟主雕像进入,盟主享受100%经验加成,可提取膜拜元宝金币
-- <(c0xFF00aaff)王城城主> 抢夺王城城主,享受至尊封号,提取膜拜元宝金币,拿王城元宝
--
-- <(c0xFF00aaff)充值排行> 每天充值前10名可以在次日领取元宝返利,最高20% 
--	]];
--
--
--	return echo;
--end
--
----我要挑战
--NewActorHelpFunc.challenge = function(sysarg)
--	local echo = [[
-- <(c0xFF00aaff)部落战争> 每周三周日的18点到19点,随机分配部落,双方均有海量奖励
-- <(c0xFF00aaff)武林盟主> 每天13点土城盟主雕像进入,盟主享受100%经验加成,可提取膜拜元宝金币
-- <(c0xFF00aaff)泉水涌现> 每天活动开启后进入购买水罐子接泉水,然后到土城泉水涌现处换装备
-- <(c0xFF00aaff)天女散花> 每天活动开启后进入后站立在圆圈上,自动增长经验和金币
-- <(c0xFF00aaff)天篷赐福> 攻击越高,每次攻击获得到的经验越多,杀仇人的好机会
-- <(c0xFF00aaff)转生BOSS> 传送员处可进入到高级转生地图击杀高级BOSS,掉落高级装备材料经验券
-- <(c0xFF00aaff)万劫魔宅> 120级进入直接掉落顶级装备,爆率非常高
--
-- <(c0xFF00aaff)灵符宫殿> 狂爆转生装备,在土城灵符使者处进入
--	]];
--
--
--	return echo;
--end
