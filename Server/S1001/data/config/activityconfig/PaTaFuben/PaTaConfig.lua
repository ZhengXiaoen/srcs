--#include "..\..\..\language\LangCode.txt"

BuyFBTimesFee = 5
MaxBuyTimes = 15
MasterDays = 3		--楼主奖励过期天数
PaTaRankDays = 7    --排名奖励过期天数
ChallengeCd = 60*30		--挑战的cd秒数
PaTaMinAwardLv = 15000   --领取爬塔周排名奖励最低等级

PaTaReward = {
	--第一名
	{type = 0, id = 871, count = 1,quality=0,strong=0,bind=0},
	--第二名
	{type = 0, id = 872, count = 1,quality=0,strong=0,bind=0},
	--第三名
	{type = 0, id = 873, count = 1,quality=0,strong=0,bind=0},
	--第四名
	{type = 0, id = 874, count = 1,quality=0,strong=0,bind=0},
	--第五名
	{type = 0, id = 875, count = 1,quality=0,strong=0,bind=0},
}

PaTaFBConfig = {
--第一章：屠龙传说 
	{
		name = Lang.FubenName.Pataname01,
		minLv = 45,
		maxLv = 49,
		fubens = {
			{				--副本1         --第一层：雪域魔宫
				fubenId = 14,
				points = 30,
				achieveId = 155,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata001,
				parentAchieveId = 155, -- 关联的父id
				iconId = 3,				--副本图标id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 1,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 400,quality=0,strong=0,bind=0},

					
				},
				drops = {				--怪物掉落
{type=2,id=0,count=60614},--经验				
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂

				},
				boss = {				--扫荡对象
				  { type = 0, id = 444, count = 10},
					{ type = 1, id = 390, count = 1},
					{ type = 2, id = 408, count = 1},
					{ type = 3, id = 426, count = 1},
							},
				finishAwards = 13,
			},
			{				--副本2：炽焰神殿 
				fubenId = 15,
				points = 40,
				achieveId = 156,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata002,
				parentAchieveId = 155, -- 关联的父id
				iconId = 1,				--副本图标id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 1,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 700,quality=0,strong=0,bind=0},
	
				},
				drops = {				--怪物掉落
{type=2,id=0,count=60614},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂



				},
				boss = {				--扫荡对象
				  { type = 0, id = 445, count = 10},
					{ type = 1, id = 391, count = 1},
					{ type = 2, id = 409, count = 1},
					{ type = 3, id = 427, count = 1},
				},				
				finishAwards = 14,
			},
			{				--副本3幻月迷宫
				fubenId = 16,
				points = 50,
				achieveId = 157,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 2,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata003,
				parentAchieveId = 156, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 1,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 1000,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=62832},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂

				},
				boss = {				--扫荡对象
				  { type = 0, id = 446, count = 10},
					{ type = 1, id = 392, count = 1},
					{ type = 2, id = 410, count = 1},
					{ type = 3, id = 428, count = 1},
				},
				finishAwards = 15,
			},
			{				--副本4祖码之神
				fubenId = 17,
				points = 60,
				achieveId = 158,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 4,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata004,
				parentAchieveId = 157, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 1,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 1400,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=65050},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 447, count = 10},
					{ type = 1, id = 393, count = 1},
					{ type = 2, id = 411, count = 1},
					{ type = 3, id = 429, count = 1},
				},
				finishAwards = 16,
			},
			{				--副本5暗影虫洞
				fubenId = 18,
				points = 70,
				achieveId = 159,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 6,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata005,
				parentAchieveId = 158, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 2,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 1700,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=67267},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂

				},
				boss = {				--扫荡对象
				  { type = 0, id = 448, count = 10},
					{ type = 1, id = 394, count = 1},
					{ type = 2, id = 412, count = 1},
					{ type = 3, id = 430, count = 1},
				},
				finishAwards = 17,
			},
			{				--副本6战鼓擂台
				fubenId = 19,
				points = 80,
				achieveId = 160,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 10,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata006,
				parentAchieveId = 159, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 2,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 2100,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=70224},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂

				},
				boss = {				--扫荡对象
				  { type = 0, id = 449, count = 10},
					{ type = 1, id = 395, count = 1},
					{ type = 2, id = 413, count = 1},
					{ type = 3, id = 431, count = 1},
				},
				finishAwards = 18,
			},
		},
	},
	{
		name = Lang.FubenName.Pataname02,			--第二章：沙城狼烟
		minLv = 50,
		maxLv = 60,
		fubens = {
			{				--副本1土城秘室
				fubenId = 20,
				points = 90,
				achieveId = 161,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 5,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata007,
				parentAchieveId = 160, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 2,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 2400,quality=0,strong=0,bind=0},		
				},
				drops = {				--怪物掉落
{type=2,id=0,count=72442},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片
{type=0,id=900,count=1},--物防魂石碎片
{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 450, count = 10},
					{ type = 1, id = 396, count = 1},
					{ type = 2, id = 414, count = 1},
					{ type = 3, id = 432, count = 1},
				},
				finishAwards = 19,
			},
			{				--副本2骷髅逆袭
				fubenId = 21,
				points = 100,
				achieveId = 162,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 7,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata008,
				parentAchieveId = 161, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 2,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 2700,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=77616},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片
{type=0,id=900,count=1},--物防魂石碎片
{type=0,id=901,count=1},--魔防魂石碎片

				},
				boss = {				--扫荡对象
				  { type = 0, id = 451, count = 10},
					{ type = 1, id = 397, count = 1},
					{ type = 2, id = 415, count = 1},
					{ type = 3, id = 433, count = 1},
				},

				finishAwards = 20,
			},
			{				--副本3新月龙岛
				fubenId = 22,
				points = 110,
				achieveId = 163,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 9,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata009,
				parentAchieveId = 162, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 3100,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=82790},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片


				},
				boss = {				--扫荡对象
				  { type = 0, id = 452, count = 10},
					{ type = 1, id = 398, count = 1},
					{ type = 2, id = 416, count = 1},
					{ type = 3, id = 434, count = 1},
				},

				finishAwards = 21,
			},
			{				--副本4熔岩绝地
				fubenId = 23,
				points = 120,
				achieveId = 164,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 8,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata010,
				parentAchieveId = 163, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 3500,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=87965},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片

				},
				boss = {				--扫荡对象
				  { type = 0, id = 453, count = 10},
					{ type = 1, id = 399, count = 1},
					{ type = 2, id = 417, count = 1},
					{ type = 3, id = 435, count = 1},
				},

				finishAwards = 22,
			},
			{				--副本5天山之巅
				fubenId = 24,
				points = 130,
				achieveId = 165,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 3,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata011,
				parentAchieveId = 164, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 3800,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=93878},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片

				},
				boss = {				--扫荡对象
				  { type = 0, id = 454, count = 10},
					{ type = 1, id = 400, count = 1},
					{ type = 2, id = 418, count = 1},
					{ type = 3, id = 436, count = 1},
				},

				finishAwards = 23,
			},
			{				--副本6妖影禁地
				fubenId = 25,
				points = 140,
				achieveId = 166,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 6,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata012,
				parentAchieveId = 165, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 4200,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=99792},--经验		
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=897,count=1},--物攻魂石碎片
{type=0,id=898,count=1},--魔攻魂石碎片
{type=0,id=899,count=1},--道攻魂石碎片
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片

				},
				boss = {				--扫荡对象
				  { type = 0, id = 455, count = 10},
					{ type = 1, id = 401, count = 1},
					{ type = 2, id = 419, count = 1},
					{ type = 3, id = 437, count = 1},
				},

				finishAwards = 24,
			},
		},
	},
	{
		name = Lang.FubenName.Pataname03,			--第三章：战神之约 
		minLv = 61,
		maxLv = 70,
		fubens = {
			{				--副本1火龙魔宫
				fubenId = 26,
				points = 150,
				achieveId = 167,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 1,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata013,
				parentAchieveId = 166, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 4500,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=105706},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 456, count = 10},
					{ type = 1, id = 402, count = 1},
					{ type = 2, id = 420, count = 1},
					{ type = 3, id = 438, count = 1},
				},
				
				finishAwards = 25,
			},
			{				--副本2亘古神庙
				fubenId = 27,
				points = 160,
				achieveId = 168,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 4,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata014,
				parentAchieveId = 167, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 4800,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=112358},--经验
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
		
				},
				boss = {				--扫荡对象
				  { type = 0, id = 457, count = 10},
					{ type = 1, id = 403, count = 1},
					{ type = 2, id = 421, count = 1},
					{ type = 3, id = 439, count = 1},
				},
				
				finishAwards = 26,
			},
			{				--副本3幽灵鬼境
				fubenId = 28,
				points = 170,
				achieveId = 169,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 6,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata015,
				parentAchieveId = 168, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 5100,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=119011},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 458, count = 10},
					{ type = 1, id = 404, count = 1},
					{ type = 2, id = 422, count = 1},
					{ type = 3, id = 440, count = 1},
				},

				finishAwards = 27,
			}, 
			{				--副本4蛮荒古堡
				fubenId = 29,
				points = 180,
				achieveId = 170,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 7,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata016,
				parentAchieveId = 169, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 5400,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=125664},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 459, count = 10},
					{ type = 1, id = 405, count = 1},
					{ type = 2, id = 423, count = 1},
					{ type = 3, id = 441, count = 1},
				},

				finishAwards = 28,
			},
			{				--副本5烛龙神殿
				fubenId = 30,
				points = 190,
				achieveId = 171,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 8,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata017,
				parentAchieveId = 170, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 3,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 5700,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=133056},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 460, count = 10},
					{ type = 1, id = 406, count = 1},
					{ type = 2, id = 424, count = 1},
					{ type = 3, id = 442, count = 1},
				},
				finishAwards = 29,
			},
			{				--副本6战神决地
				fubenId = 31,
				points = 200,
				achieveId = 172,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 10,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata018,
				parentAchieveId = 171, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 5800,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=133056},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 461, count = 10},
					{ type = 1, id = 407, count = 1},
					{ type = 2, id = 425, count = 1},
					{ type = 3, id = 443, count = 1},
				},

				finishAwards = 30,
			},
		},
	},
	{
		name = Lang.FubenName.Pataname04,			--第四章：西游之旅 
		minLv = 50,
		maxLv = 70,
		fubens = {
			{				--副本1降魔之门
				fubenId = 40,
					
				circle = 1,			--最低转数条件
				points = 210,
				achieveId = 250,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 5,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata019,
				parentAchieveId = 172, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 1,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 6300,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=827968},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 743, count = 10},
					{ type = 1, id = 725, count = 1},
					{ type = 2, id = 731, count = 1},
					{ type = 3, id = 737, count = 1},
				},
				
				finishAwards = 39,
			},
			{				--副本2降魔圣殿
				fubenId = 41,
				circle = 2,			--最低转数条件
				points = 220,
				achieveId = 251,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 1,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata020,
				parentAchieveId = 250, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 6600,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=827968},--经验
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
		
				},
				boss = {				--扫荡对象
				  { type = 0, id = 744, count = 10},
					{ type = 1, id = 726, count = 1},
					{ type = 2, id = 732, count = 1},
					{ type = 3, id = 738, count = 1},
				},
				
				finishAwards = 40,
			},
			{				--副本3降魔峡谷	
				fubenId = 42,
				circle = 3,			--最低转数条件
				points = 230,
				achieveId = 252,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 2,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata021,
				parentAchieveId = 251, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 7000,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=919040},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 745, count = 10},
					{ type = 1, id = 727, count = 1},
					{ type = 2, id = 733, count = 1},
					{ type = 3, id = 739, count = 1},
				},

				finishAwards = 41,
			}, 
			{				--副本4降魔幽境
				fubenId = 43,
				circle = 4,			--最低转数条件
				points = 240,
				achieveId = 253,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 6,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata022,
				parentAchieveId = 252, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 7300,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=919040},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 746, count = 10},
					{ type = 1, id = 728, count = 1},
					{ type = 2, id = 734, count = 1},
					{ type = 3, id = 740, count = 1},
				},

				finishAwards = 42,
			},
			{				--副本5降魔禁地
				fubenId = 44,
				circle = 5,			--最低转数条件
				points = 250,
				achieveId = 254,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 7,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata023,
				parentAchieveId = 253, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 7600,quality=0,strong=0,bind=0},
				},
				drops = {				--怪物掉落
{type=2,id=0,count=1020128},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 747, count = 10},
					{ type = 1, id = 729, count = 1},
					{ type = 2, id = 735, count = 1},
					{ type = 3, id = 741, count = 1},
				},
				finishAwards = 43,
			},
			{				--副本6降魔之巅
				fubenId = 45,
				circle = 6,			--最低转数条件
				points = 260,
				achieveId = 255,
				OneFbSecs = 300,		--扫荡1个副本需要的秒数
				iconId = 3,				--副本图标id
				needCoin = {type = 1, count = 5},
				speedFin = {type = 3, count = 2},
				descTips = Lang.ScriptTips.pata024,
				parentAchieveId = 254, -- 关联的父id
				topAwards = {			--楼主奖励
					{type = 0, id = 665, count = 2,quality=0,strong=0,bind=1},
					{type = 0, id = 280, count = 3,quality=0,strong=0,bind=1},
					{type = 0, id = 278, count = 4,quality=0,strong=0,bind=1},
					{type = 21, id = 0, count = 8000,quality=0,strong=0,bind=0},

				},
				drops = {				--怪物掉落
{type=2,id=0,count=1132352},--经验	
{type=0,id=680,count=1},--光灵碎片
{type=0,id=681,count=1},--暗灵碎片
{type=0,id=276,count=1},--强化保护符
{type=0,id=277,count=1},--鉴定图鉴
{type=0,id=278,count=1},--清洗砂
{type=0,id=745,count=1},--一级物攻魂石
{type=0,id=755,count=1},--一级魔攻魂石
{type=0,id=765,count=1},--一级道攻魂石
--{type=0,id=900,count=1},--物防魂石碎片
--{type=0,id=901,count=1},--魔防魂石碎片
	
				},
				boss = {				--扫荡对象
				  { type = 0, id = 748, count = 10},
					{ type = 1, id = 730, count = 1},
					{ type = 2, id = 736, count = 1},
					{ type = 3, id = 742, count = 1},
				},

				finishAwards = 44,
			},
		},
	},
}
