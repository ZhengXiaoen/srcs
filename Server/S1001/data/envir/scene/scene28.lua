--荒蛮禁地二层
{
	scenceid = 28,
	scencename = Lang.SceneName.s00028,
	mapfilename = "28ManHuangJinDi2Ceng",
	minlevel = 1,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "2.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 208,
	sceneHeight = 192,
	posx = 40,
	posy = 106,

	area =
	{
		{ name = Lang.SceneName.s00028, range = { 10,10,20,20,60,50}, center = { 35,160},
		attri = {{type=18,value = {}},
                         {type=87,value = {}},
		         {type=19,value = {}},}},	--默认配置场景

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh28.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

		-- {id = 110, posx = 44 , posy = 148},
		-- {id = 111, posx = 45 , posy = 98},
		-- {id = 112, posx = 40 , posy = 47},
		-- {id = 110, posx = 61 , posy = 24},
		-- {id = 111, posx = 87 , posy = 71},
		-- {id = 112, posx = 48 , posy = 50},
	 
	},

  teleport =
  {
		--传送点设置
		{ posx = 32, posy = 161,toSceneid = 27,toPosx = 176, toPosy = 28,modelid = 62700,name = Lang.SceneName.s00027, randompos =1,},  --2层→1层
		{ posx = 173, posy = 21,toSceneid = 29,toPosx = 30, toPosy = 184,modelid = 62700,name = Lang.SceneName.s00029, randompos =1,},  --2层→3层
		--{ posx = 173, posy = 17,toSceneid = 23,toPosx = 30, toPosy = 183,modelid = 62700,name = Lang.SceneName.s00023 },  --2层→3层

  },

},