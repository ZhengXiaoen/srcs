--迷失宫殿一层
{
	scenceid = 31,
	scencename = Lang.SceneName.s00031,
	mapfilename = "31MiShiGongDian1Ceng",
	minlevel = 80,	--等级限制
	zlevel = 1,	--转生等级限制
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
	sceneWidth = 212,
	sceneHeight = 208,
	posx = 80,
	posy = 213,

	area =
	{
		{ name = Lang.SceneName.s00031, range = { 10,10,20,20,60,50}, center = { 157,151},
		attri = {{type=18,value = {}},
                 --{type=20,value = {}},--禁止穿人
                 {type=87,value = {}},
                  {type=97,value = {}}, --黑暗区域
		         {type=19,value = {}},}},	--默认配置场景

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh31.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		-- {id = 84,  posx = 47, posy = 25},--牛魔接引人
		-- {id = 85,  posx = 81, posy = 23},--大牛
		-- {id = 86,  posx = 84, posy = 73},--陈百万
		-- {id = 87,  posx = 84, posy = 139},--上官虹
		-- {id = 88,  posx = 123, posy = 179},--胡大力
		-- {id = 89,  posx = 160, posy = 152},--牛魔王守卫
	},

  teleport =
  {
		--传送点设置
		{ posx =  35, posy = 28,toSceneid = 32,toPosx = 137, toPosy = 137,modelid = 62700,name = Lang.SceneName.s00032, randompos =1,},  --，迷失宫殿1层一→迷失宫殿2层
		{ posx =  164, posy = 159,toSceneid = 83,toPosx = 231, toPosy =  173,modelid = 62700,name = Lang.SceneName.s00083 },  --古墓1层→土城
		--{ posx =  126, posy = 118,toSceneid = 15,toPosx =  67, toPosy = 61,modelid = 62700,name = Lang.SceneName.s00015 },  --牛魔寺庙1层一→牛魔寺庙2层
  },

},