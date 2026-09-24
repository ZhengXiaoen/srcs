--副本
{
	scenceid = 201,
	scencename = Lang.SceneName.s00201,
	mapfilename = "02XiaGu",
	minlevel = 11,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "2.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 100,
	sceneHeight = 176,
	posx = 63,
	posy = 180,
	area =
	{
		{ name = Lang.SceneName.s00006, range = { 10,10,20,20,60,50}, center = { 49,82},
		attri = {{type=18,value = {}},    --穿人
		         {type=19,value = {}},    --穿怪
			 --{type=87,value = {}},
			 }},

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
                --{id = 19, posx = 66, posy = 84},--山谷守护人	
		--{id = 20, posx = 57, posy = 24},--兽人矿工	
		--{id = 105, posx = 32, posy = 58},--剑侍
	},

  teleport =
  {
		--传送点设置
		--{ posx =  38, posy = 21,toSceneid = 3,toPosx = 203, toPosy = 207,modelid = 62700,name = Lang.SceneName.s00003 },  --毒蛇山谷→土城
		--{ posx =  40, posy = 11,toSceneid = 8,toPosx = 33, toPosy = 99,modelid = 62700,name = Lang.SceneName.s00008 },  --半兽山谷→矿区一层
	
  },

},