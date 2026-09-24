--11转战场
{
	scenceid = 564,
	scencename = Lang.SceneName.s00564,
	mapfilename = "161ShengXiaoGongDian",
	minlevel = 1,
	forbiddenitem = {},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	nOpenSeverDay=6, --开服天数限制进入
	--isNotUse=true,--地图是否删除
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 212,
	sceneHeight = 216,
	sceneType=0,
    --大厅
	area =
	{
		{ name = Lang.SceneName.s00564, range = { 106,91,125,110,105,130,87,111}, center = { 106,109},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					
				},
		},
    --子鼠
		{ name = Lang.SceneName.a00000, range = { 68,51,89,72,68,93,47,73 }, center = { 68,69 },   
		attri = {

				 {type=18,value = {}},--穿人
				 { type = 6,  value = {} },
				 {type=19,value = {}},--穿怪
				 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
				 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
             	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
				 {type=80,value = {}},  --所在场景不爆装备

		}}, 
    --丑牛
		 { name = Lang.SceneName.a00000, range = { 106,13,127,34,105,56,85,35 }, center = { 106,33 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --寅虎
		 { name = Lang.SceneName.a00000, range = { 144,50,166,72,144,95,123,73 }, center = { 144,71 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
				 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --卯兔
		 { name = Lang.SceneName.a00000, range = { 183,89,204,111,183,132,162,111 }, center = { 183,109 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --辰龙
		 { name = Lang.SceneName.a00000, range = { 145,127,166,149,144,171,123,150 }, center = { 144,147 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
				 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --巳蛇
		 { name = Lang.SceneName.a00000, range = { 106,166,127,188,105,210,84,189 }, center = { 105,187 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --午马
		 { name = Lang.SceneName.a00000, range = { 67,127,88,149,66,171,44,151 }, center = { 66,149 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --未羊
		 	{ name = Lang.SceneName.a00000, range = { 28,89,50,111,28,134,6,112 }, center = { 28,110 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --申猴
		 	{ name = Lang.SceneName.a00000, range = { 32,15,53,37,31,59,9,37 }, center = { 31,35 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
		 		 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --酉鸡
		 	{ name = Lang.SceneName.a00000, range = { 182,12,204,34,182,57,160,35 }, center = { 182,33 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
				 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --戌狗
		 	{ name = Lang.SceneName.a00000, range = { 183,165,204,187,183,210,161,188 }, center = { 183,185 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
		 		 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
				 {type=80,value = {}},  --所在场景不爆装备

		 }}, 
    --亥猪
		 	{ name = Lang.SceneName.a00000, range = { 27,166,49,189,27,211,5,189 }, center = { 27,187 },   
		 attri = {

		 		 {type=18,value = {}},--穿人
				  { type = 6,  value = {} },
		 		 {type=19,value = {}},--穿怪
				 {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
		 		 {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              	 {type=30,value = {1,2,3,4} },--禁止被行会拉传
		 	 	 {type=3,value = {}},  --战斗专门区域，打死人不用负责任
				 {type=80,value = {}},  --所在场景不爆装备

		 }}, 


		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh564.lua"
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
	--   { posx =  40, posy = 224,toSceneid =  563, toPosx = 72, toPosy =  181,modelid = 62700,name = Lang.SceneName.s00563,isRank = 1, },  
	--   { posx =  211, posy = 38,toSceneid =  563, toPosx = 175, toPosy =  79,modelid = 62700,name = Lang.SceneName.s00563,isRank = 1, },  

  },

   landscape=
 {
 },

},