--九天冰宫（全天）
{
	--活动的名字
	name =Lang.ActivityName.name00057,
	--活动的描述
	desc=Lang.ActivityName.desc00061,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = Lang.ActivityName.timeDesc00001,
	level = 40, --活动的等级
	icon = 22,
	type = 2,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward029,    --主要奖励
	--活动的开启时间
	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={0},
			minutes= 
			{
				"00:00-23:59",
			}
		},
	},
	awards=
	{
		{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励经验 
		{type=0,id=1402,count=1,bind=1,strong=0,quality=0},--五级灵珠
			{type=0,id=830,count=1,bind=1,strong=0,quality=0},--英雄经验丹(大)
			{type=0,id=1172,count=1,bind=1,strong=0,quality=0},--灵魂水晶
			{type=0,id=281,count=1,bind=1,strong=0,quality=0},--二级灵珠
			{type=0,id=282,count=1,bind=1,strong=0,quality=0},--三级灵珠
			{type=0,id=283,count=1,bind=1,strong=0,quality=0},--四级灵珠
			{type=0,id=549,count=1,bind=1,strong=0,quality=0},--麻痹戒指
			{type=0,id=550,count=1,bind=1,strong=0,quality=0},--护体戒指
			{type=0,id=551,count=1,bind=1,strong=0,quality=0},--复活戒指
			{type=0,id=163,count=1,bind=1,strong=0,quality=0},--圣灵头盔


			{type=0,id=174,count=1,bind=1,strong=0,quality=1},--雪域头盔
			{type=0,id=175,count=1,bind=1,strong=0,quality=1},--雪域项链

			{type=0,id=185,count=1,bind=1,strong=0,quality=1},--天罡头盔
			{type=0,id=186,count=1,bind=1,strong=0,quality=1},--天罡项链

			{type=0,id=196,count=1,bind=1,strong=0,quality=1},--金阳头盔
			{type=0,id=197,count=1,bind=1,strong=0,quality=1},--金阳项链

			{type=0,id=207,count=1,bind=1,strong=0,quality=1},--审判头盔
			{type=0,id=208,count=1,bind=1,strong=0,quality=1},--审判项链

			{type=0,id=218,count=1,bind=1,strong=0,quality=1},--玄冥头盔
			{type=0,id=219,count=1,bind=1,strong=0,quality=1},--玄冥项链

			{type=0,id=229,count=1,bind=1,strong=0,quality=0},--千钧头盔
			{type=0,id=230,count=1,bind=1,strong=0,quality=0},--千钧项链

			{type=0,id=240,count=1,bind=1,strong=0,quality=0},--烈焰头盔
			{type=0,id=241,count=1,bind=1,strong=0,quality=0},--烈焰项链

			{type=0,id=251,count=1,bind=1,strong=0,quality=0},--冥魅头盔
			{type=0,id=252,count=1,bind=1,strong=0,quality=0},--冥魅项链

			 {type=0,id=234,count=1,bind=1,strong=0,quality=0},--千钧宝石
			{type=0,id=233,count=1,bind=1,strong=0,quality=0},--千钧战靴
			{type=0,id=235,count=1,bind=1,strong=0,quality=0},--千钧戒指
			{type=0,id=245,count=1,bind=1,strong=0,quality=0},--烈焰宝石
			{type=0,id=244,count=1,bind=1,strong=0,quality=0},--烈焰法履
			{type=0,id=246,count=1,bind=1,strong=0,quality=0},--烈焰戒指
			{type=0,id=256,count=1,bind=1,strong=0,quality=0},--冥魅宝石
			{type=0,id=255,count=1,bind=1,strong=0,quality=0},--冥魅道鞋
			{type=0,id=257,count=1,bind=1,strong=0,quality=0},--冥魅戒指
     

	},
	npc=
	{
		{
			sceneId=8,name=Lang.EntityName.n00179,
			conds = { },
		},
	},
},