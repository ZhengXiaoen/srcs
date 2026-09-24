--极北之地二层
{
	scenceid = 59,
	scencename = Lang.SceneName.s00059,
	mapfilename = "59JiBeiZhiDi2Ceng",
	minlevel = 1,
	zlevel = 9,	--转生等级限制
	needCircle = 9,--转生等级，限制玩家非法传送
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
	sceneWidth = 192,
	sceneHeight = 184,
	sceneType=0,

	area =
	{
		{ name = Lang.SceneName.s00059, range = { 0,0,75,0,75,71,0,71}, center = { 33,59},
			attri ={
					-- { type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					--{ type = 18,  value = {} },
                    { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
				},
		},
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh59.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 093, posx = 36 , posy = 39,script = "data/script/Activity/Mohuanxinggong/Xgsz.lua",modelid = 1,icon = 1,funcId = 0},
	},

  teleport =
	 {
 		
  		 { posx = 150, posy = 64,toSceneid = 58,toPosx = 41, toPosy = 31,modelid = 62700,name = Lang.SceneName.s00058, randompos =1,},  --2层→1层
  		 { posx = 30, posy = 54,toSceneid = 65,toPosx = 78, toPosy = 78,modelid = 62700,name = Lang.SceneName.s00065, randompos =1,},  --2层→3层
  	},

},