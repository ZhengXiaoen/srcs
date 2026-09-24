--11转战场
{
	scenceid = 563,
	scencename = Lang.SceneName.s00563,
	mapfilename = "1593v3JingJi",
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
	sceneWidth = 248,
	sceneHeight = 264,
	sceneType=7,

	area =
	{
		{ name = Lang.SceneName.s00563, range = { 0,0,0,0,0,0,0,0}, center = { 40,224},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
					{ type=44,value = {}},  --禁止原地复活
                    -- { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					{ type = 50,  value = {1}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
					
				},
		},

		-- { name = Lang.SceneName.a00000, range = { 192,153,202,143,211,152,201,162 }, center = { 202,150 }, 
		-- attri = {
		-- 	 { type =1,value = {}},      --世界安全区
		--      { type =39,value = {}},     --城镇
		-- 	 --{type=41,value = {5000}},--自动加经验，每秒5000点
		-- 	 --{type=78,value = {}},     --摆摊区域
		-- 	 { type =46,value = {198,147,205,158}},     --安全区复活点
		-- 	 { type =83,value = {}},     --禁止使用火墙
		-- 	 { type =60,value = {}},     --禁止自动战斗
		-- 	 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
		-- 	 { type = 50,  value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
		-- }}, 

		-- { name = Lang.SceneName.a00000, range = { 97,99,107,99,107,110,97,110 }, center = { 202,150 }, 
		-- attri = {
		-- 	 { type =1,value = {}},      --世界安全区
		--      { type =39,value = {}},     --城镇
		-- 	 --{type=41,value = {5000}},--自动加经验，每秒5000点
		-- 	 --{type=78,value = {}},     --摆摊区域
		-- 	 { type =46,value = {198,147,205,158}},     --安全区复活点
		-- 	 { type =83,value = {}},     --禁止使用火墙
		-- 	 { type =60,value = {}},     --禁止自动战斗
		-- 	 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
		-- 	 { type = 50,  value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
		-- }}, 
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh563.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		-- {id = 396, posx = 208, posy = 159},--龙头镖局
		-- {id = 397, posx = 101, posy = 103},--豹头镖局
		
	},

  teleport =
  {
	  { posx =  40, posy = 224,toSceneid =  563, toPosx = 72, toPosy =  181,modelid = 62700,name = Lang.SceneName.s00563,isRank = 1, },  
	  { posx =  211, posy = 38,toSceneid =  563, toPosx = 175, toPosy =  79,modelid = 62700,name = Lang.SceneName.s00563,isRank = 1, },  

  },

   landscape=
 {
 },

},