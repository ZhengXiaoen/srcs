--魔罗神殿
{
	scenceid = 75,
	scencename = Lang.SceneName.s00075,
	mapfilename = "75MoLuoShenDian4Ceng",
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
	sceneWidth = 136,
	sceneHeight = 136,
	sceneType=0,

	area =
	{
		{ name = Lang.SceneName.s00075, range = { 0,0,75,0,75,71,0,71}, center = { 61,60},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					--{ type = 18,  value = {} },
                                        {type=20,value = {}},--禁止穿人
					{type=34,value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },
				},
		},
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh56.lua"
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
		{ posx =  110, posy = 109,toSceneid = 74,toPosx = 47, toPosy = 40,modelid = 62700,name = Lang.SceneName.s00074 },  --4层一→3层
		{ posx =  38, posy = 38,toSceneid = 76,toPosx = 95, toPosy = 93,modelid = 62700,name = Lang.SceneName.s00076 },  --4层一→5层
  },

},