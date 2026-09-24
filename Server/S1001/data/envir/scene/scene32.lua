--迷失宫殿二层
{
	scenceid = 32,
	scencename = Lang.SceneName.s00032,
	mapfilename = "32MiShiGongDian2Ceng",
	minlevel = 1,
	zlevel=1,
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
	sceneWidth = 168,
	sceneHeight = 168,
	posx = 80,
	posy = 213,

	area =
	{
		{ name = Lang.SceneName.s00032, range = { 10,10,20,20,60,50}, center = { 72,67},
		attri = {--{type=18,value = {}},
                         {type=20,value = {}},--禁止穿人
                         {type=87,value = {}},
			 --{type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=97,value = {}}, --黑暗区域
		         {type=19,value = {}},}},	--默认配置场景
		         

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh32.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
--		{id = 91,  posx = 64, posy = 65},--
--		{id = 92,  posx = 61, posy = 84},--
--		{id = 93,  posx = 52, posy = 122},--
--		{id = 94,  posx = 84, posy = 114},--
--		{id = 94,  posx = 124, posy = 120},--
	},

  teleport =
  {
		--传送点设置
		{ posx =  140, posy = 140,toSceneid =  31,toPosx = 40, toPosy = 32,modelid = 62700,name = Lang.SceneName.s00031, randompos =1,},  --迷失宫殿2层→迷失宫殿1层
		{ posx =  65, posy = 60,toSceneid =  33,toPosx = 28, toPosy = 25,modelid = 62700,name = Lang.SceneName.s00033, randompos =1,},  --迷失宫殿2层→迷失宫殿3层
		--{ posx =  141, posy = 142,toSceneid =  16,toPosx = 26, toPosy = 23,modelid = 62700,name = Lang.SceneName.s00016 },  --牛魔寺庙2层→牛魔寺庙3层

  },

},