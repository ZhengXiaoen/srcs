--幽冥矿区1层
{
	scenceid = 14,
	scencename = Lang.SceneName.s00014,
	mapfilename = "03YuanGuKuangDong",
	minlevel = 1,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "2.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 180,
	sceneHeight = 144,
	posx = 33,
	posy = 126,
	area =
	{
		{ name = Lang.SceneName.s00014, range = { 10,10,20,20,60,50}, center = { 121,52},
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
--#include "refresh14.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
   --       {id = 41, posx = 50, posy = 100},--幽冥矿区1	
		 -- {id = 42, posx = 76, posy = 106},--幽冥矿区2
		 -- {id = 43, posx = 104, posy = 100},--幽冥矿区3
		 -- {id = 44, posx = 124, posy = 79},--幽冥矿区4
		 -- {id = 45, posx = 126, posy = 56},--幽冥矿区5
		 -- {id = 46, posx = 138, posy = 30},--幽冥矿区6
		 -- {id = 47, posx = 109, posy = 38},--幽冥矿区1
		 -- {id = 48, posx = 138, posy = 30},--幽冥矿区1

	},

  teleport =
  {
		--传送点设置 
		{ posx =  163, posy = 46,toSceneid = 15,toPosx = 29, toPosy = 139,modelid = 62700,name = Lang.SceneName.s00015, randompos =1,},  --幽冥矿区1层→幽冥矿区2层
		{ posx = 31, posy = 122, toSceneid =  9,toPosx = 37, toPosy = 247,modelid = 62700,name = Lang.SceneName.s00009 }, ---幽冥矿区-炎龙城


  },

},