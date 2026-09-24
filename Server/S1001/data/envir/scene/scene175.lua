--封魔岭
{
	scenceid = 175,
	scencename = Lang.SceneName.s00175,
	mapfilename = "68LieShaEMoZuiXin", 
	minlevel = 50,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "9.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 104,
	sceneHeight = 56,
	sceneType=2,
	seckillId = 27,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID 默认为0 不能秒	
	isAddUpExp = 1, --杀怪后是否累加经验，0：杀怪后直接加经验(默认值)；1：杀怪后不加经验，累积起来，结束时再一起加（或多倍购买）；2：杀怪后直接加经验并累积（前端展示或多倍购买）
	area =
	{
		{ name = Lang.SceneName.s00175, range = { 0,1000,1000,0,1000,1000}, center = {73,25},
		attri = {
				{type=46,value = {}},   --安全复活区
		        {type=80,value = {}},   --所在场景不爆装备
				{type=18,value = {}},   --穿人
				{type=19,value = {}},   --穿怪
				{type=3,value = {}},    --战斗专门区域，打死人不负责
				{type=50,value = {1}},  --强制攻击模式，团队模式
				{type = 23,  value = {1,2,3,4}},
				{type = 33,  value = {10} },
				{type = 30,  value = {1,2,3,4}},	--默认配置场景，禁止行会的召集，传送，行会回程卷
				
				}},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 260, posx = 37 , posy = 27,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 155,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 235, posx = 45 , posy = 36,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 53,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},

		--{id = 296, posx = 46 , posy = 29,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 297, posx = 50 , posy = 33,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 298, posx = 54 , posy = 37,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 299, posx = 58 , posy = 41,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 300, posx = 62 , posy = 45,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 301, posx = 66 , posy = 49,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 302, posx = 70 , posy = 53,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},

               -- {id = 303, posx = 38 , posy = 37,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 304, posx = 42 , posy = 41,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 305, posx = 46 , posy = 45,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 306, posx = 50 , posy = 49,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 307, posx = 54 , posy = 53,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 308, posx = 58 , posy = 57,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		--{id = 309, posx = 62 , posy = 61,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 302,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
	},

  teleport =
  {
     --{ posx =  63, posy = 62,toSceneid =  2,toPosx = 236, toPosy =  240,modelid = 50000,name = Lang.SceneName.s00002 },  --地狱结界→王城

  },
 landscape=
 {
--posx1,posy1 表示左上角坐标,posx1,posy2 表示右下角坐标,xInterval表示横向间隔多远一个点，yInterval表示纵向多远打一个点
		
	 
 },

},