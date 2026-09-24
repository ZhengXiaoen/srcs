--破碎寺庙一层
{
	scenceid = 24,
	scencename = Lang.SceneName.s00024,
	mapfilename = "07YuanGuSiMiao",
	minlevel = 78,	--等级限制
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
	sceneWidth = 192,
	sceneHeight = 192,

	area =
	{
		{ name = Lang.SceneName.s00024, range = { 0,0,200,0,200,200}, center = { 135,48},
		attri = {{type=18,value = {}}, --穿人
			 {type=19,value = {}},  --穿怪
			 {type=97,value = {}}, --黑暗区域
			  }},	--禁止行会的召集，传送，行会回程卷

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh24.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 127, posx = 9 , posy = 43,script = "data/script/FuBenScriptNpc/JinQianGui.lua",modelid = 49,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000},
		-- {id =75, posx = 79, posy = 104},--祖玛接引人
		-- {id =76, posx = 119, posy = 70},--袁天罡
		-- {id =77, posx = 85, posy = 41},--陈老财
		-- {id =78, posx = 48, posy = 79},--炎之凤
		-- {id =79, posx = 33, posy = 115},--小香玉
		-- {id =80, posx = 75, posy = 156},--祖玛王守护
	},

  teleport =
  {
     { posx = 143, posy = 19,toSceneid = 25,toPosx = 147, toPosy =  23,modelid = 62700,name = Lang.SceneName.s00025, randompos =1,},  --破碎寺庙一层→破碎寺庙2层
	 { posx = 72, posy = 103,toSceneid = 9,toPosx = 141, toPosy =  151,modelid = 62700,name = Lang.SceneName.s00009 },  --古墓1层→土城
     --{ posx =  143, posy = 19,toSceneid =  186,toPosx = 74, toPosy =  105,modelid = 62700,name = Lang.SceneName.s00186 },  --祖玛神殿一层→祖玛神殿二层
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