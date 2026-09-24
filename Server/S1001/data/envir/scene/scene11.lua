--沙皇宫
{
	scenceid = 11,
	scencename = Lang.SceneName.s00011,
	mapfilename = "92WangChengHuangGong",
	minlevel = 1,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	music = "4.mp3",
	----musicInterval=30,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 76,
	sceneHeight = 72,
	posx = 15,
	posy = 19,
	area =
	{
		{ name = Lang.SceneName.s00011, range = { 10,10,20,20,60,50}, center = { 40,37},
		attri = {{type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
		         {type=44,value = {}},--禁止原地复活
                 {type=100,value = {}}, --禁止商城购买道具
			 --{type=41,value = {538}},--自动加经验，每秒538点
			 {type=34,value = {515,682498}},--限制物品使用（随机传送卷，续命丹，随机传送石，行会召集令）
			 {type=30,value = {1,2,3,4} },--"禁止被行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=23,value = {1,2,3,4} },--"禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=33,value = {68,72,73}},--"限制技能使用"，[技能1，技能2，技能3...],技能id
			 {type=20,value = {}},--禁止穿人
			 {type=19,value = {}},--可穿怪
			 {type=79,value = { 1 }},--区域玩家属性 参数： 1 进入沙巴克区域 
			 {type=45,value = {}},--禁止骑马
			 --{type=46,value = { 347,152,361,153,5}},--"安全复活区"，即复活点，无参数,如果是表示沙巴克战是复活，第五个参数表示复活的地图id
			 {type=40,value = {} },--关闭新手保护
			 {type=91,value = {} },}},	--禁止使用物品类速传

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 53, posx = 16 , posy = 12},

	},

  teleport =
  {
		--传送点设置
		{ posx = 47, posy = 45,toSceneid = 10,toPosx = 73, toPosy = 65,modelid = 62700,name = Lang.SceneName.s00010 },  --沙皇宫→热血王城 以后要改成不显示，并且传送点模型更换
		--{ posx =  51, posy = 51,toSceneid = 4,toPosx = 92, toPosy =  70,modelid = 62700,name = Lang.SceneName.s00004 },  --皇宫→王城

  },

},