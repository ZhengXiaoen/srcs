--白猪王洞
{
	scenceid = 206,
	scencename = Lang.SceneName.s00206,
	mapfilename = "101ShiJieBoss3",
	minlevel = 20,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 88,
	sceneHeight = 80,
	--posx = 48,
	--posy = 110,

	area =
	{
		{ name = Lang.SceneName.s00167, range = { 10,10,20,20,60,50}, center = { 50,35},
		attri = {{type=18,value = {}},  --穿人
		         {type=19,value = {}},  --穿怪
			 {type=44,value = {}},  --禁止原地复活
			 {type=6,value = {}}, --"重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=34,value = {680}},--限制使用物品:传送令
			 {type = 23,  value = {1,2,3,4} },     --禁止使用行会拉传
			 {type = 30,  value = {1,2,3,4} },
			 			 {type=97,value = {}}, --黑暗区域}},	--默认配置场景，禁止被行会拉传，传送，不爆装备
			 			 }},

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh206.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

        --{id = 46, posx = 38, posy = 56,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 36,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000}, --尸王接引人
	
	},

  teleport =
  {
		--传送点设置
		--{ posx = 50, posy = 53,toSceneid = 9,toPosx = 87, toPosy = 106,modelid = 62700,name = Lang.SceneName.s00009 },  --→比奇城

  },

},