--幽冥矿区二层
{
	scenceid = 15,
	scencename = Lang.SceneName.s00015,
	mapfilename = "15YouMingKuangQu2Ceng",
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
	sceneWidth = 164,
	sceneHeight = 200,
--	posx = 33,
--	posy = 126,
	area =
	{
		{ name = Lang.SceneName.s00015, range = { 10,10,20,20,60,50}, center = { 24,140},
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
--#include "refresh15.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		-- {id = 47, posx = 31, posy = 134},--幽冥矿区2-1
		-- {id = 48, posx = 52, posy = 135},--幽冥矿区2-2
		-- {id = 49, posx = 83, posy = 164},--幽冥矿区2-3
		-- {id = 50, posx = 130, posy = 149},--幽冥矿区2-4
		-- {id = 51, posx = 139, posy = 127},--幽冥矿区2-5
		-- {id = 52, posx = 121, posy = 96},--幽冥矿区2-6
		-- {id = 53, posx = 101, posy = 68},--幽冥矿区2-7
		-- {id = 54, posx = 70, posy = 90},--幽冥矿区2-8
		-- {id = 55, posx = 47, posy = 104},--幽冥矿区2-9

	},

  teleport =
  {
		--传送点设置 
		{ posx =  25, posy = 143,toSceneid = 14,toPosx = 158, toPosy = 44,modelid = 62700,name = Lang.SceneName.s00014, randompos =1,},  --矿区2层→矿区1层
		--{ posx =  40, posy = 32,toSceneid = 3,toPosx = 175, toPosy = 216,modelid = 62700,name = Lang.SceneName.s00003 },  --乱石林→土城

  },

},