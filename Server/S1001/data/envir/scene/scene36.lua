--赤月洞窟三层
{
	scenceid = 36,
	scencename = Lang.SceneName.s00036,
	mapfilename = "36ChiYueDongKu3Ceng",
	minlevel = 1,
	zlevel=2,
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
	sceneWidth = 184,
	sceneHeight = 176,
	posx = 55,
	posy = 227,

	area =
	{
		{ name = Lang.SceneName.s00036, range = { 10,10,20,20,60,50}, center = { 78,142},
		attri = {{type=18,value = {}},
                 {type=87,value = {}},
                 {type=97,value = {}}, --黑暗区域
		         {type=19,value = {}},}},	--默认配置场景
		        

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh36.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

		-- {id = 103, posx = 79 , posy = 137},
		-- {id = 104, posx = 109 , posy = 98},
		-- {id = 105, posx = 127 , posy = 77},
		-- {id = 106, posx = 126 , posy = 36},

	},

  teleport =
  {
		--传送点设置
		{ posx = 82, posy = 147,toSceneid = 35,toPosx = 160, toPosy = 48,modelid = 62700,name = Lang.SceneName.s00035, randompos =1,},  --3层→2层
		-- { posx = 110, posy = 18,toSceneid = 37,toPosx = 42, toPosy = 70,modelid = 62700,name = Lang.SceneName.s00037 },  --3层→4层

  },

},