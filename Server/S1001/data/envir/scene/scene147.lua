--VIP7练级场
{
	scenceid = 147,
	scencename = Lang.SceneName.s00147,
	mapfilename = "68ZuQiuChangDiSuoXiaoBan",
	minlevel = 40,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
        music = "5.mp3",--1新手村、2黑龙城、3土城、4荒漠、5险恶地图、6副本、7活动、8庄园
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 144,
	sceneHeight = 128,
	sceneType=3,
	area =
	{
		{ name = Lang.SceneName.s00147, range = { 10,10,20,20,60,50}, center = { 72,60},
		attri = {

			{type=1,value = {}},    --世界安全区
			{type=18,value = {}},    --穿人
		        {type=19,value = {}},    --穿怪
			{type=24,value = {}}, --禁止使用夫妻传送
			{type=25,value = {}}, --禁止使用师徒传送
                        {type=23,value = {}}, --"禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3,队伍集结4】
			{type=34,value = {}},--限制物品使用（随机传送卷，续命丹，随机传送石，行会召集令）
                        {type=30,value = {}},--"禁止被行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3,队伍集结4】

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

	},

  teleport =
  {

  },

},
