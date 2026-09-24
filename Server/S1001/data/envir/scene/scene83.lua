--土城
{
	scenceid = 83,
	scencename = Lang.SceneName.s00083,
	mapfilename = "125SanRenTuCheng",
	minlevel = 11,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "3.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 256,
	sceneHeight = 272,
	posx = 35,
	posy = 130,
	area =
	{
		{ name = Lang.SceneName.a00003, range = { 10,10,20,20,30,25}, center = { 161,132},
		attri = {{type=18,value = {}},          --穿人
		         {type=19,value = {}},}},	--穿怪


                { name = Lang.SceneName.a00000, range = {147,130,163,114,178,129,162,145,}, center = { 161,132 }, --土城安全区
		attri = {
			 {type=1,value = {}},     --世界安全区
		     {type=39,value = {}},    --城镇
			 --{type=46,value = {202,162,208,163}},    --安全区复活点
			 {type=46,value = {}},    --安全复活区
			 {type=83,value = {}},    --禁止使用火墙
			 {type=60,value = {}},    --禁止自动战斗
			 {type=78,value = {}},    --摆摊区域
			 {type=90,value = {}},}}, --大篝火区域

	       -- { name = Lang.SceneName.a00006, range = { 186,163,209,139,229,156,206,182 }, center = { 203,154 }, --红名村
		--attri = {{type=1,value = {}},     --世界安全区
		 --         {type=39,value = {}},    --城镇
			--  {type=46,value = {202,162,208,163}},    --安全区复活点

			-- }},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh3.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置


----		---------------------------------------------以下为功能NPC
		{id = 325, posx = 163, posy = 114},--传送员
 		{id = 34, posx = 131, posy = 178},--仓库管理员
 		{id = 330, posx = 149, posy = 128},--装备回收
		--{id = 340,posx = 129, posy = 89},--密境使者
		{id = 342,posx = 164, posy = 130},--城主雕像
		{id = 352,posx = 178, posy = 129},--神威活动入口npc
		{id = 358, posx = 184, posy = 135},--江湖神医
	    {id = 355,posx = 102, posy = 133},--世界bossnpc
		{id = 360,posx = 135, posy = 93},--押镖
		{id = 367,posx = 174, posy = 120},--三味真火炉
		--{id = 371,posx = 157, posy = 120},--暗黑沙漠传送员
		{id = 372,posx = 153, posy = 124},--秦始皇陵NPC
		--{id = 370,posx = 167, posy = 118},--王城专属
		--{id = 376,posx = 184, posy = 115},--灵石合成
		{id = 377, posx = 151, posy = 134},-- 转生地宫
		-- {id = 204, posx = 136, posy = 123},--兽人商队

		--{id = 382, posx = 149, posy = 120},-- 激情行会
		{id = 312, posx = 157, posy = 120},-- 天关npc
		{id = 389, posx = 167, posy = 118},-- 混沌世界
		{id = 395, posx = 172, posy = 135},-- 四圣宫
		{id = 398, posx = 162, posy = 145},--生肖宫殿
		{id = 399, posx = 175, posy = 132},--混乱地界
		{id = 400, posx = 158, posy = 141},--元神使者
		{id = 401, posx = 188, posy = 117},--符文地宫

		{id = 403, posx = 176, posy = 107},--熊猫林
		{id = 404, posx = 160, posy = 117},--通天塔
		


-- 		{id = 65,posx = 137, posy = 105},--挂机休闲

		--{id = 379, posx = 167, posy = 118},--饕餮神殿
-- 		{id = 238, posx = 110, posy = 104},--镇魔将军活动NPC
--		{id = 206, posx = 148, posy = 115},--地下夺宝活动NPC
-- 		{id = 271, posx = 118, posy = 112},--阵营战活动NPC
-- 		{id = 208, posx = 124, posy = 118},--勇者试练活动NPC
-- 		{id = 210, posx = 128, posy = 86},--双倍经验活动NPC
		{id = 239, posx = 155, posy = 138},--奔跑吧兄弟活动NPC
-- 		{id = 240, posx = 136, posy = 94},--武林争霸活动NPC	
-- 		{id = 209, posx = 142, posy = 100},--闭关修炼活动NPC
-- 		{id = 203, posx = 116, posy = 90},--王城危机活动NPC
--		{id = 207, posx = 155, posy = 110},--夺宝使者活动NPC
	--	{id = 202, posx = 170, posy = 137},--行会闯关活动NPC
	--	{id = 201, posx = 174, posy = 133},--行会守护活动NPC
		{id = 368, posx = 166, posy = 141},--夺宝奇兵
-- --		{id = 205, posx = 90, posy = 21},--烛光剑影活动NPC

-- 		{id = 232, posx = 133, posy = 109},--行会管理员(行会活动NPC)
-- 		{id = 223, posx = 201, posy = 162},--总镖头(完成押镖任务
	

		--{id = 204, posx = 161, posy = 144},--天天打豆豆活动NPC

		--{id = 365, posx = 166, posy = 141},--秘境之旅
-- --------------------------------------------------------------以下为主线NPC
-- 		{id = 50, posx = 172, posy = 176},--沙漠将军
-- 		{id = 51, posx = 207, posy = 148},--典狱长
-- 		{id = 52, posx = 167, posy = 109},--土城药师
-- 		{id = 53, posx = 150, posy = 106},--土城杂货
-- 		{id = 54, posx = 138, posy = 88},--土城铁匠
-- 		{id = 55, posx = 126, posy = 77},--土城服饰
-- 		{id = 56, posx = 113, posy = 74},--土城首饰

-- 		{id = 64, posx = 92, posy = 131},--智老头
-- 		{id = 67, posx = 101, posy = 112},--井神
-- 		{id = 68, posx = 99, posy = 95},--石墓守护

-- 		{id = 73, posx = 185, posy = 102},--大刀护卫长
-- 		{id = 74, posx = 191, posy = 63},--祖玛守护

-- 		{id = 81, posx = 51, posy = 137},--猎人
-- 		{id = 82, posx = 52, posy = 170},--程夫人
-- 		{id = 83, posx = 32, posy = 188},--牛魔守护


	},

  teleport =
  {
		--传送点设置
			{ posx =  233, posy = 229,toSceneid =  9,toPosx = 240, toPosy =  40,modelid = 62700,name = Lang.SceneName.s00009 },  --土城→炎龙城
		    { posx =  123, posy = 111,toSceneid = 21,toPosx = 45, toPosy =  117,modelid = 62700,name = Lang.SceneName.s00021, randompos =1,level =76, },  --土城→虚空古墓1层
			{ posx =  237, posy = 172,toSceneid = 31,toPosx = 159, toPosy =  149,modelid = 62700,name = Lang.SceneName.s00031, randompos =1,cricle =1,},  --土城→迷失宫殿1层
			{ posx =  179, posy = 236,toSceneid = 34,toPosx = 36, toPosy =  45,modelid = 62700,name = Lang.SceneName.s00034, randompos =1,cricle =2,},  --土城→赤月洞窟1层
			{ posx =  70, posy = 245,toSceneid = 38,toPosx = 41, toPosy =  207,modelid = 62700,name = Lang.SceneName.s00038, randompos =1,cricle =3,},  --土城→妖族幻境1层
			{ posx =  24, posy = 224,toSceneid = 41,toPosx = 113, toPosy =  98,modelid = 62700,name = Lang.SceneName.s00041, randompos =1,cricle =4,},  --土城→修罗地宫1层
			{ posx =  18, posy = 191,toSceneid = 45,toPosx = 103, toPosy =  51,modelid = 62700,name = Lang.SceneName.s00045, randompos =1,cricle =5,},  --土城→吕祖峰1层
			{ posx =  23, posy = 145,toSceneid = 49,toPosx = 203, toPosy =  145,modelid = 62700,name = Lang.SceneName.s00049, randompos =1,cricle =6,},  --土城→龙王湾1层
			{ posx =  22, posy = 106,toSceneid = 53,toPosx = 81, toPosy =  93,modelid = 62700,name = Lang.SceneName.s00053, randompos =1,cricle =7,},  --王城→炽焰山1层
		    { posx =  36, posy = 33,toSceneid = 56,toPosx = 27, toPosy =  95,modelid = 62700,name = Lang.SceneName.s00056, randompos =1,cricle =8,},  --王城→雷炎魔窟1层
			{ posx =  89, posy = 31,toSceneid = 58,toPosx = 142, toPosy =  136,modelid = 62700,name = Lang.SceneName.s00058, randompos =1,cricle =9,},  --王城→极北之地1层
			



  },

 landscape=
 {
--红名区域
-- 	{posx1=197,posy1=152,posx2=197,posy2=152,modelid=76,xinterval=0,yinterval=0},  --安全区边线
-- 	{posx1=199,posy1=150,posx2=199,posy2=150,modelid=76,xinterval=0,yinterval=0},  --安全区边线
-- 	{posx1=201,posy1=148,posx2=201,posy2=148,modelid=76,xinterval=0,yinterval=0},  --安全区边线
-- --土城安全区
	{posx1=147,posy1=130,posx2=147,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=149,posy1=132,posx2=149,posy2=132,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=151,posy1=134,posx2=151,posy2=134,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=153,posy1=136,posx2=153,posy2=136,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=155,posy1=138,posx2=155,posy2=138,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=157,posy1=140,posx2=157,posy2=140,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=159,posy1=142,posx2=159,posy2=142,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=161,posy1=144,posx2=161,posy2=144,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=162,posy1=145,posx2=162,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	--{posx1=142,posy1=101,posx2=142,posy2=101,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=147,posy1=131,posx2=147,posy2=131,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=149,posy1=133,posx2=149,posy2=133,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=151,posy1=135,posx2=151,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=153,posy1=137,posx2=153,posy2=137,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=155,posy1=139,posx2=155,posy2=139,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=157,posy1=141,posx2=157,posy2=141,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=159,posy1=143,posx2=159,posy2=143,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=161,posy1=145,posx2=161,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=163,posy1=147,posx2=163,posy2=147,modelid=76,xinterval=0,yinterval=0},  --安全区边线

--     {posx1=138,posy1=102,posx2=138,posy2=102,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=149,posy1=128,posx2=147,posy2=128,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=151,posy1=126,posx2=151,posy2=126,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=153,posy1=124,posx2=153,posy2=124,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=155,posy1=122,posx2=155,posy2=122,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=157,posy1=120,posx2=157,posy2=120,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=159,posy1=118,posx2=159,posy2=118,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=161,posy1=116,posx2=161,posy2=116,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=163,posy1=114,posx2=163,posy2=114,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=165,posy1=116,posx2=165,posy2=116,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=167,posy1=118,posx2=167,posy2=118,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=169,posy1=120,posx2=169,posy2=120,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=171,posy1=122,posx2=171,posy2=122,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=173,posy1=124,posx2=173,posy2=124,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=175,posy1=126,posx2=175,posy2=126,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=177,posy1=128,posx2=177,posy2=128,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	--{posx1=108,posy1=99,posx2=108,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=178,posy1=129,posx2=178,posy2=129,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=176,posy1=131,posx2=176,posy2=131,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=174,posy1=133,posx2=174,posy2=133,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=172,posy1=135,posx2=172,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=170,posy1=137,posx2=170,posy2=137,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=168,posy1=139,posx2=168,posy2=139,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=166,posy1=141,posx2=166,posy2=141,modelid=76,xinterval=0,yinterval=0},  --安全区边线
    {posx1=164,posy1=143,posx2=164,posy2=143,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	--{posx1=171,posy1=128,posx2=171,posy2=128,modelid=92,xinterval=0,yinterval=0},  --富贵兽出生点
	--{posx1=188,posy1=117,posx2=188,posy2=117,modelid=92,xinterval=0,yinterval=0},  --富贵兽出生点
		

  },

},