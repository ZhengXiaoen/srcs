--VIP一练级场
{
	scenceid = 105,
	scencename = Lang.SceneName.s00105,
	mapfilename = "150ShaCheng",
	minlevel = 1,
	forbiddenitem = {},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 60,
	sceneHeight = 56,
	sceneType=0,
	isAddUpExp = 2, --杀怪后是否累加经验，0：杀怪后直接加经验(默认值)；1：杀怪后不加经验，累积起来，结束时再一起加（或多倍购买）；2：杀怪后直接加经验并累积（前端展示或多倍购买）

	area =
	{
		{ name = Lang.SceneName.s00105, range = { 0,0,75,0,75,71,0,71}, center = { 32,34},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
					{type=1, value = {}},--世界安全区
                     {type=18,value = {}},  --穿人
					{type=34,value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },
				},
		},
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh105.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 093, posx = 36 , posy = 39,script = "data/script/Activity/Mohuanxinggong/Xgsz.lua",modelid = 1,icon = 1,funcId = 0},
		--{id = 61, posx = 129, posy = 197},--高级BOSS之家
	},

  teleport =
  {
		--{ posx =  36, posy = 35,toSceneid = 73,toPosx = 108, toPosy = 104,modelid = 62700,name = Lang.SceneName.s00073 },  --1层一→2层

  },

},