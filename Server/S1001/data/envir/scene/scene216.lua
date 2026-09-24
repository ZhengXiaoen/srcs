--奔跑吧老哥。
{
	scenceid = 216,
	scencename = Lang.SceneName.s00216,
	mapfilename = "147BenPao1",
	minlevel = 60,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "9.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 240,
	sceneHeight = 200,
--	sceneType=2,
--	posx = 48,
--	posy = 110,
    isAddUpExp = 0, --杀怪后是否累加经验，0：杀怪后直接加经验(默认值)；1：杀怪后不加经验，累积起来，结束时再一起加（或多倍购买）；2：杀怪后直接加经验并累积（前端展示或多倍购买）
	area =
	{
		{ name = Lang.SceneName.s00216, range = { 10,10,20,20,60,50}, center = { 40,124},
		attri = {
                        {type=1, value = {}},--世界安全区
                        {type=20,value = {}}, --禁止穿人
                        {type=21,value = {}}, --禁止穿怪
						--{type=41,value = {}},--自动加经验，每秒3538点
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                      
                        {type=34,value = {515,682502,498,491}},--限制物品使用（随机传送卷，续命丹，随机传送石，行会召集令）
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
                        {type=83,value = {}},     --禁止使用火墙
						{ type = 45,  value = {} },--禁止骑马
						{type=33,value = {5}},     --禁止使用野蛮
                        {type=80,value = {}},  --所在场景不爆装备
                        --{type=45,value = {}},}}, --限制坐骑

			 }},	

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh216.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

       -- {id = 239, posx = 215, posy = 98}, --烈焰大使
        -- {id = 380, posx = 184, posy = 64}, --奔跑迷惑
        -- {id = 380, posx = 140, posy = 25}, --奔跑迷惑
        -- {id = 380, posx = 132, posy = 178}, --奔跑迷惑




	},

  teleport =
  {
		--传送点设置
		{ posx = 215, posy = 98,toSceneid = 218,toPosx = 115, toPosy = 195,modelid = 62700,name = Lang.SceneName.s00218 },  --奔跑1层-奔跑2层。

  },
   landscape=
 {
				{posx1=52,posy1=122,posx2=53,posy2=121,modelid=102,xinterval=0,yinterval=0},  --箭头
				{posx1=62,posy1=117,posx2=63,posy2=116,modelid=102,xinterval=0,yinterval=0},  --箭头			
			 
   },

},