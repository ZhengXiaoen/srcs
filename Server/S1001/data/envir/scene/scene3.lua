--远古矿洞
{
	scenceid = 3,
	scencename = Lang.SceneName.s00003,
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
	posx = 159,
	posy = 43,
	area =
	{
		{ name = Lang.SceneName.s00003, range = { 10,10,20,20,60,50}, center = { 35,118},
		attri = {
			{type=18,value = {}}, --穿人
			{type=19,value = {}},  --穿怪
			{type=97,value = {}}, --黑暗区域
		}
		},

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh3.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
        -- {id = 30, posx = 43, posy = 102},--矿区接引人	
		--{id = 31, posx = 78, posy = 103},--鬼魁
		--{id = 32, posx = 124, posy = 80},--矿石工匠
	-- 	 {id = 346, posx = 46, posy = 100},--傻森1
	-- 	 {id = 347, posx = 82, posy = 98},--傻森2
	-- 	 {id = 348, posx = 126, posy = 83},--傻森3
	-- 	 {id = 349, posx = 128, posy = 54},--傻森4
	-- 	 {id = 350, posx = 104, posy = 36},--傻森5	
	-- 	 {id = 351, posx = 142, posy = 27},--傻森6			 	 		 

	},

  teleport =
  {
		--传送点设置 
		{ posx =  161, posy = 45,toSceneid = 164,toPosx = 45, toPosy = 38,modelid = 62700,name = Lang.SceneName.s00164 },  --矿区一层→新手村
		--{ posx =  163, posy = 46,toSceneid = 9,toPosx = 26, toPosy = 141,modelid = 62700,name = Lang.SceneName.s00009 },  --矿区一层→矿区2层

  },

},