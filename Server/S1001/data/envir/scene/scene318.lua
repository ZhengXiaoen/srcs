--饕餮神殿
{
	scenceid = 318,
	scencename = Lang.SceneName.s00318,
	mapfilename = "137ZhuanShen8",
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
	sceneWidth = 88,
	sceneHeight = 80,
	sceneType=0,

	area =
	{
		{ name = Lang.SceneName.s00318, range = { 0,0,0,0,0,0,0,0}, center = { 43,25},
			attri ={
					{ type = 3,value = {}},  --战斗专门区域，打死人不用负责任
					{ type = 6,  value = {} },
					{type=41,value = {1000}},--自动加经验，每秒3538点
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 83,value = {}},     --禁止使用火墙
					--{ type = 18,  value = {} },
                    {type=18,value = {}},--穿人
					{type=34,value = {515491}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },
				},
		},
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh318.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 093, posx = 36 , posy = 39,script = "data/script/Activity/Mohuanxinggong/Xgsz.lua",modelid = 1,icon = 1,funcId = 0},
		--{id = 61, posx = 129, posy = 197},--高级BOSS之家
		--{id = 40, posx = 41, posy = 33},-- 神秘之殿--改
	},

  teleport =
  {
		--{ posx =  128, posy = 128,toSceneid = 99,toPosx = 42, toPosy = 42,modelid = 62700,name = Lang.SceneName.s00099 },  --7层一6层
		-- { posx =  37, posy = 37,toSceneid = 101,toPosx = 124, toPosy = 124,modelid = 62700,name = Lang.SceneName.s00101 },  --7层一→8层


  },

},