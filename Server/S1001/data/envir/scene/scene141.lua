--黄金满屋
{
	scenceid = 141,
	scencename = Lang.SceneName.s00141,
	mapfilename = "83CaiFuGuangChang",
	minlevel = 60,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 120,
	sceneHeight = 120,
	--posx = 17,
	--posy = 85,
	
	--sceneType=1, --场景类型,0表示普通场景，1表示活动场景，2表示副本场景,3挂机地图, 4温泉地图, 5九天冰宫, 6深渊烈域

	area =
	{
		{ name = Lang.SceneName.s00141, range = { 0,0,200,0,200,200,0,200}, center = { 61,59},
			attri = {{type=18,value = {}},
		         {type=19,value = {}},	--默认配置场景
                         {type=23,value = {1,2,3,4} }, --禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=6,value = {}}, --"重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=24,value = {} }, --禁止使用夫妻传送
			 {type=34,value = {515}},--限制使用物品:行会召集令
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
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
		--{id = 206, posx = 87, posy = 48,script = "data/script/Activity/ShouLieDaHui/ErCengRuKouShiZhe.lua",modelid=70,icon = 13,funcId=0,classId=3}, --二层入口使者
   
	},

  teleport =
  {
		--传送点设置
		--{ posx = 40, posy = 162,toSceneid = 8,toPosx = 310, toPosy = 53,modelid = 50000,name = Lang.SceneName.s00008 },  --海底世界一层→土城
		--{ posx = 179, posy = 85,toSceneid = 122,toPosx = 112, toPosy = 238,modelid = 50000,name = Lang.SceneName.s00122 },  --海底世界一层→海底世界二层

  },

},