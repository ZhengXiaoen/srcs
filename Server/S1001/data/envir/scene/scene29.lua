--荒蛮禁地三层
{
	scenceid = 29,
	scencename = Lang.SceneName.s00029,
	mapfilename = "29ManHuangJinDi3Ceng",
	minlevel = 1,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
        --music = "2.mp3",
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 208,
	sceneHeight = 216,


	area =
	{
		{ name = Lang.SceneName.s00029, range = { 10,10,20,20,60,50}, center = { 170,29 },
		attri = {{type=18,value = {}},
                         {type=87,value = {}},
		         {type=19,value = {}},}},	--默认配置场景


	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh29.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		-- {id = 113, posx = 63 , posy = 163},
		-- {id = 114, posx = 69 , posy = 109},
		-- {id = 115, posx = 44 , posy = 54},
	},

  teleport =
  {
  		{ posx = 170, posy = 27,toSceneid = 30,toPosx = 118, toPosy = 94,modelid = 62700,name = Lang.SceneName.s00030, randompos =1,},  --3层→4层
		{ posx = 27, posy = 183,toSceneid = 28,toPosx = 176, toPosy = 26,modelid = 62700,name = Lang.SceneName.s00028, randompos =1,},  --3层→2层
		--传送点设置
		--{ posx =  28, posy = 184,toSceneid = 22,toPosx = 175, toPosy = 19,modelid = 62700,name = Lang.SceneName.s00022 },  --3层一→2层
		--{ posx =  170, posy = 26,toSceneid = 24,toPosx = 123, toPosy = 96,modelid = 62700,name = Lang.SceneName.s00024 },  --3层一→4层

  },

},
