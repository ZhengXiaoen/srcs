--异教宫殿二层
{
	scenceid = 20,
	scencename = Lang.SceneName.s00020,
	mapfilename = "20YiJiaoGongDian2Ceng",
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
	sceneWidth = 156,
	sceneHeight = 136,
	posx = 38,
	posy = 115,

	area =
	{
		{ name = Lang.SceneName.s00020, range = { 10,10,20,20,60,50}, center = { 110,73},
		attri = {
			{type=20,value = {}},--禁止穿人
			{type=19,value = {}},    --穿怪
			{type=97,value = {}}, --黑暗区域
			
			},
		},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh20.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
--		{id = 46, posx = 106, posy = 66},--
--		{id = 47, posx = 111, posy = 44},--
--		{id = 49, posx = 65, posy = 33},--
--		{id = 50, posx = 28, posy = 37},--
--		{id = 50, posx = 42, posy = 61},--

	},

  teleport =
  {
		--传送点设置
		{ posx = 85, posy = 86,toSceneid = 19,toPosx = 50, toPosy =  107,modelid = 62700,name = Lang.SceneName.s00019, randompos =1,},  --异教宫殿2层-异教宫殿1层
		--{ posx = 104, posy = 107,toSceneid = 12,toPosx = 31, toPosy =  23,modelid = 62700,name = Lang.SceneName.s00012 },  --困兽禁域二层→困兽禁域三层



  },

},