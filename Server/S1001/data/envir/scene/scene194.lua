--霸者王陵

{
	scenceid = 194,
	scencename = Lang.SceneName.s00194,
	mapfilename = "114BaZheWangLin",
	minlevel = 70,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "9.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 200,
	sceneHeight = 192,
	sceneType=1,

	area =
	{
		{ name = Lang.SceneName.s00194, range = { 0,0,200,0,200,192,0,192 }, center = { 53,128},
			attri = {--{type=18,value = {}},
                         {type=20,value = {}},--禁止穿人
		         {type=19,value = {}},	--默认配置场景
                        -- {type=23,value = {1,2,3,4} }, --禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=34,value = {515}},--限制使用物品:行会召集令
                         {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                         {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=41,value = {20000}},--自动加经验，每秒20000点
			 {type=24,value = {} }, --禁止使用夫妻传送
			 {type=25,value = {}},}}, --禁止使用师徒传送

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 093, posx = 36 , posy = 39,script = "data/script/Activity/Mohuanxinggong/Xgsz.lua",modelid = 1,icon = 1,funcId = 0},
	--{id = 231, posx = 118, posy = 110},
	},

  teleport =
  {

  },

},