--威龙城
{
	scenceid = 9,
	scencename = Lang.SceneName.s00009,
	mapfilename = "122BiQiCheng",
	minlevel = 11,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "2.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 268,
	sceneHeight = 304,
	posx = 135,
	posy = 134,
	area =
	{
		{ name = Lang.SceneName.a00003, range = { 112,152, 131,133, 150,152, 131,171 }, center = { 141,151 },
		attri = {
				 {type =18,value = {}},  --穿人
		         {type =87,value = {}},  --新手保护有效
		         {type =19,value = {}},	--穿怪
				 }},

		{ name = Lang.SceneName.a00000, range = { 112,152, 131,133, 150,152, 131,171 }, center = { 141,151 }, 
		attri = {
			 { type =1,value = {}},      --世界安全区
		     { type =39,value = {}},     --城镇
			 --{type=41,value = {5000}},--自动加经验，每秒5000点
			 --{type=78,value = {}},     --摆摊区域
			 { type =46,value = {131,130,139,140}},     --安全区复活点
			 { type =83,value = {}},     --禁止使用火墙
			 { type =60,value = {}},     --禁止自动战斗
			 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
			 }}, 

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh9.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货  10 书店，默认是0可以不配置

---------------------------------------------------------------------
		{id = 325, posx = 131, posy = 133},--传送员
		{id = 330, posx = 112, posy = 152},--装备回收
		--{id = 59, posx = 125, posy = 139},--初级锻造师--改		
		{id = 34, posx = 92, posy = 154},---仓库管理
		{id = 324, posx = 144, posy = 158},--军团使者
		{id = 251, posx = 138, posy = 130},--战无双
		{id = 66, posx = 125, posy = 165},--BOSS之家
 		{id = 240, posx = 209, posy = 139},--武林争霸
 		{id = 262, posx = 125, posy = 139},--万事通
 		{id = 248, posx = 131, posy = 171},--副本管理员
 		{id = 315,posx = 117, posy = 157},--游戏推广员
 		--{id = 383,posx = 137, posy = 165},--激情大本营   
 		{id = 343,posx = 131, posy = 152},--霸主雕像
 		{id = 339, posx = 149, posy = 151},--炼狱NPC---改
 		{id = 354, posx = 131, posy = 124},--激情闭关npc
 		{id = 40, posx = 126, posy = 119},-- 散人殿堂--改
 		{id = 357, posx = 139, posy = 141},-- 天神护体
 		{id = 359, posx = 150, posy = 140},-- 押镖测试1
 		--{id = 362, posx = 118, posy = 146},-- 合成大师
 		{id = 390, posx = 117, posy = 147},-- 宝石大师
 		--{id = 375, posx = 121, posy = 114},-- 散人乐园
 		--{id = 371,posx = 121, posy = 143},--暗黑沙漠传送员
		--{id = 405,posx = 121, posy = 143},--装备换金
		{id = 393,posx = 145, posy = 147},--玛雅神殿
 		{id = 358, posx = 154, posy = 157},--江湖神医
 		{id = 394, posx = 135, posy = 137},--江湖神医
		 {id = 401, posx = 138, posy = 164},--符文地宫
		{id = 227, posx = 128, posy = 136},--福利官员
		{id = 403, posx = 135, posy = 167},--熊猫林

		 

		-- {id = 396, posx = 136, posy = 138},--江湖神医


--------------------------------------------------------------------主线任务串联
		{id = 13, posx = 224, posy = 226},--任务12	任务12NPC
		{id = 14, posx = 197, posy = 211},--任务13	守城将军
		{id = 15, posx = 197, posy = 204},--任务14  城门护卫
		{id = 16, posx = 188, posy = 213},--任务15  城门护卫
		{id = 17, posx = 148, posy = 189},--任务16
		{id = 18, posx = 115, posy = 190},--任务17
		{id = 19, posx = 91, posy = 177},--任务18 ---下一个对接传送员，进虫洞或者其他洞打怪

		{id = 20, posx = 83, posy = 120},--任务19
		{id = 21, posx = 65, posy = 134},--任务20
		{id = 22, posx = 80, posy = 150},--任务21 --- 

		{id = 23, posx = 167, posy = 123},--练武场
		{id = 24, posx = 198, posy = 77},--去寺庙
		{id = 25, posx = 150, posy = 79},-- 首相
		{id = 26, posx = 133, posy = 95},-- 管家
		{id = 37, posx = 105, posy = 107},-- 书店哪里
		{id = 38, posx = 162, posy = 163},-- 客栈哪里隐世老人
		{id = 39, posx = 65, posy = 78},-- 洞窟守卫
		--{id = 376, posx = 95, posy = 144},-- 灵石合成
		{id = 377, posx = 121, posy = 161},-- 转生地宫
		{id = 385, posx = 157, posy = 146},-- 天心道人

		{id = 395, posx = 142, posy = 134},-- 四圣宫









-- ---------------------------------------------------------------------以下为功能NPC
		
-- 		{id = 251, posx = 128, posy = 102},--炎龙使者（功勋任务）
--                 
--                 
-- 		{id = 315,posx = 123, posy = 131},----妙手回春

-- 		{id = 289, posx = 144, posy = 124},--转生神殿
-- 		{id = 288, posx = 150, posy = 130},--玛雅神殿
-- 		{id = 66, posx = 152, posy = 138},---BOSS之家
--         {id = 290, posx = 145, posy = 145},--未知暗殿
-- 		{id = 295, posx = 137, posy = 134},--城主雕像


-- 		{id = 312, posx = 138, posy = 152},--勇闯天关
-- 		
--                 {id = 237,posx = 122, posy = 140},--封魔大师

-- 		{id = 222, posx = 191, posy = 118},--军需官(领取押镖任务)
-- 		--{id = 222, posx = 191, posy = 118},--军需官(领取押镖任务)
		
-- ---------------------------------------------------------------------以下为主线NPC

--                 {id = 13, posx = 210, posy = 220},--翠花
-- 		{id = 14, posx = 194, posy = 188},--右城门守卫
-- 		{id = 15, posx = 176, posy = 157},--流浪汉
-- 		{id = 16, posx = 140, posy = 192},--冯铁匠	
-- 		{id = 17, posx = 130, posy = 178},--首饰店老板
--                 {id = 18, posx = 119, posy = 182},--服装店老板
-- 		{id = 19, posx = 94, posy = 159},--药店老板

-- 		{id = 20, posx = 135, posy = 71},--比奇官员
-- 		{id = 21, posx = 181, posy = 83},--上城门守卫
-- 		{id = 22, posx = 95, posy = 84},--左城门守卫
--                 {id = 23, posx = 74, posy = 189},--下城门守卫
-- 		{id = 24, posx = 37, posy = 204},--公孙谷
-- 		{id = 25, posx = 33, posy = 182},--沃玛守护
-- 		{id = 26, posx = 64, posy = 56},--田老六
-- 		{id = 27, posx = 35, posy = 31},--矿区守护
-- 		{id = 28, posx = 211, posy = 33},--李大壮
-- 		{id = 29, posx = 211, posy = 20},--山谷守护

		


		
  },
  teleport =
  {
		--传送点设置
			{ posx = 232, posy = 249,toSceneid =  1,toPosx = 88, toPosy = 31,modelid = 62700,name = Lang.SceneName.s00001 },  --炎龙城→炎龙桃源
			{ posx = 217, posy = 42, toSceneid =  10,toPosx = 136, toPosy = 141,modelid = 62700,name = Lang.SceneName.s00010 },  --炎龙城→热血王城
			{ posx = 243, posy = 37, toSceneid =  83,toPosx = 222, toPosy = 219,modelid = 62700,name = Lang.SceneName.s00083 }, ----炎龙城-沙漠土城
			{ posx = 28, posy = 38, toSceneid =  12,toPosx = 88, toPosy = 137,modelid = 62700,name = Lang.SceneName.s00012 , randompos =1,level =65,}, ----炎龙城-变异洞窟1层
			{ posx = 24, posy = 247, toSceneid =  14,toPosx = 34, toPosy = 119,modelid = 62700,name = Lang.SceneName.s00014 , randompos =1,level =70,}, ----炎龙城-幽冥矿区
			{ posx = 15, posy = 267, toSceneid =  19,toPosx = 43, toPosy = 29,modelid = 62700,name = Lang.SceneName.s00019, randompos =1, level =74,}, ----炎龙城-异教宫殿1层
			{ posx = 43, posy = 265, toSceneid =  16,toPosx = 25, toPosy = 68,modelid = 62700,name = Lang.SceneName.s00016 , randompos =1,level =72,}, ----炎龙城-死亡棺材1层
			{ posx = 119, posy = 22, toSceneid = 27,toPosx = 70, toPosy =  88,modelid = 62700,name = Lang.SceneName.s00027, randompos =1,level =80,}, ----炎龙城-蛮荒禁地1层
			{ posx =  21, posy = 117,toSceneid = 24,toPosx = 76, toPosy =  107,modelid = 62700,name = Lang.SceneName.s00024 , randompos =1,level =78,},  --土城→破碎寺庙1层

  },

 landscape=
 {
	-- {posx1=112,posy1=152,posx2=112,posy2=152,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=114,posy1=154,posx2=114,posy2=154,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=116,posy1=156,posx2=116,posy2=156,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=118,posy1=158,posx2=118,posy2=158,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=120,posy1=160,posx2=120,posy2=160,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=122,posy1=162,posx2=122,posy2=162,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=124,posy1=164,posx2=124,posy2=164,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=126,posy1=166,posx2=126,posy2=166,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=128,posy1=168,posx2=128,posy2=168,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=130,posy1=170,posx2=130,posy2=170,modelid=76,xinterval=0,yinterval=0},  --安全区边线



	{posx1=113,posy1=151,posx2=113,posy2=151,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=115,posy1=149,posx2=115,posy2=149,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=117,posy1=147,posx2=117,posy2=147,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=119,posy1=145,posx2=119,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=121,posy1=143,posx2=121,posy2=143,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=123,posy1=141,posx2=123,posy2=141,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=125,posy1=139,posx2=125,posy2=139,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=127,posy1=137,posx2=127,posy2=137,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=129,posy1=135,posx2=129,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=131,posy1=133,posx2=131,posy2=133,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	

	-- --{posx1=155,posy1=135,posx2=155,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	
	{posx1=133,posy1=135,posx2=133,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=135,posy1=137,posx2=135,posy2=137,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=137,posy1=139,posx2=137,posy2=139,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=139,posy1=141,posx2=139,posy2=141,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=141,posy1=143,posx2=141,posy2=143,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=143,posy1=145,posx2=143,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=145,posy1=147,posx2=145,posy2=147,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=147,posy1=149,posx2=147,posy2=149,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=149,posy1=151,posx2=149,posy2=151,modelid=76,xinterval=0,yinterval=0},  --安全区边线


	{posx1=150,posy1=152,posx2=150,posy2=152,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=148,posy1=154,posx2=148,posy2=154,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=146,posy1=156,posx2=146,posy2=156,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=144,posy1=158,posx2=144,posy2=158,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=142,posy1=160,posx2=142,posy2=160,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=140,posy1=162,posx2=140,posy2=162,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=138,posy1=164,posx2=138,posy2=164,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=136,posy1=166,posx2=136,posy2=166,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=134,posy1=168,posx2=134,posy2=168,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=132,posy1=170,posx2=132,posy2=170,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=133,posy1=175,posx2=133,posy2=175,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=135,posy1=177,posx2=135,posy2=177,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=137,posy1=179,posx2=137,posy2=179,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=139,posy1=181,posx2=139,posy2=181,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=141,posy1=183,posx2=141,posy2=183,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=143,posy1=185,posx2=143,posy2=185,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=145,posy1=187,posx2=145,posy2=187,modelid=76,xinterval=0,yinterval=0},  --安全区边线


  },

},