--荒蛮禁地四层
{
	scenceid = 30,
	scencename = Lang.SceneName.s00030,
	mapfilename = "30ManHuangJinDi4Ceng",
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
	sceneWidth = 148,
	sceneHeight = 144,


	area =
	{
		{ name = Lang.SceneName.s00030, range = { 10,10,20,20,60,50}, center = { 123,95 },
		attri = {{type=18,value = {}},
                         {type=87,value = {}},
		         {type=19,value = {}},	--默认配置场景
				}
		},


	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh30.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{

	},

  teleport =
  {
		--传送点设置
		{ posx =  125, posy = 95,toSceneid = 29,toPosx = 170, toPosy = 35,modelid = 62700,name = Lang.SceneName.s00029, randompos =1,},  --4层一→3层
		--{ posx =  150, posy = 44,toSceneid = 25,toPosx = 29, toPosy = 201,modelid = 62700,name = Lang.SceneName.s00025 },  --2层一→3层

  },

},