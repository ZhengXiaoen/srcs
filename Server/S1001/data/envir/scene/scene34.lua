--赤月洞窟一层
{
	scenceid = 34,
	scencename = Lang.SceneName.s00034,
	mapfilename = "34ChiYueDongKu1Ceng",
	minlevel = 85,	--等级限制
	zlevel = 2,	--转生等级限制
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "2.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 204,
	sceneHeight = 208,
	posx = 80,
	posy = 213,

	area =
	{
		{ name = Lang.SceneName.s00034, range = { 10,10,20,20,60,50}, center = { 36,47},
		attri = {	--默认配置场景
			 {type=18,value = {}},--"穿人"
		         {type=19,value = {}},--"穿怪"
                         {type=87,value = {}},
                         {type=97,value = {}}, --黑暗区域
			 }},

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh34.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		-- {id = 95,  posx = 154, posy = 143},--
		-- {id = 96,  posx = 128, posy = 97},--
		-- {id = 97,  posx = 89, posy = 73},--
		-- {id = 98,  posx = 71, posy = 41},--
	},

  teleport =
  {
		--传送点设置
		{ posx = 158, posy = 161,toSceneid = 35,toPosx = 51, toPosy = 143,modelid = 62700,name = Lang.SceneName.s00035, randompos =1,},  --赤月洞窟1层→赤月洞窟2层
		{ posx = 31, posy = 41,toSceneid = 83,toPosx = 175, toPosy =  233,modelid = 62700,name = Lang.SceneName.s00083 },  --古墓1层→土城
		--{ posx =  160, posy = 165,toSceneid = 18,toPosx =  45, toPosy = 149,modelid = 62700,name = Lang.SceneName.s00018 },  --轮回1层→2层

  },

},