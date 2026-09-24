--石墓洞穴1层
{
	scenceid = 188,
	scencename = Lang.SceneName.s00188,
	mapfilename = "15ZhuYaoShiZhenYiCeng",
	minlevel = 45,
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
	sceneWidth = 160,
	sceneHeight = 160,

	area =
	{
		{ name = Lang.SceneName.s00188, range = { 0,0,200,0,200,200}, center = { 61,99},
		attri = {{type=18,value = {}}, --穿人
			 {type=19,value = {}},  --穿怪
			  }},	--禁止行会的召集，传送，行会回程卷

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 127, posx = 9 , posy = 43,script = "data/script/FuBenScriptNpc/JinQianGui.lua",modelid = 49,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		{id = 69, posx = 62, posy = 93},--石墓接引人
		{id = 70, posx = 95, posy = 76},--苦行者
		{id = 71, posx = 106, posy = 45},--王秀才
		{id = 72, posx = 120, posy = 23},--猪王守护
	},

  teleport =
  {
     { posx =  56, posy = 105,toSceneid =  3,toPosx = 94, toPosy =  89,modelid = 62700,name = Lang.SceneName.s00003 },  --石墓1层→土城
     { posx =  134, posy = 22,toSceneid =  189,toPosx = 42, toPosy =  142,modelid = 62700,name = Lang.SceneName.s00189 },  --石墓1层→石墓2层
  },
  
	--[[场景消耗
	玩家在场景中每隔一分钟时间就要消耗一定的东西（可配置，有多项和顺序），不够时则退出
	进入时就要进行一次检查，条件满足则扣除一次，不满足则不能进入场景]]
	sceneconsum =
	{
		--扣除物品类型, 扣除数量
		--{type=5, id=0, count=130000},--每分钟消耗13万绑金或者金币
	},

},