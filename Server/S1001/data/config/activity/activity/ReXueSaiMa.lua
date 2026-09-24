--15:30-16:00 热血赛马
{
	--活动的名字
	name =Lang.ActivityName.name00042,
	--活动的描述
	desc=Lang.ActivityName.desc00043,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = "15:30-16:00",
	level = 40, --活动的等级
	icon = 30,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	seckillId = 4,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID
	mainAwardDesc = Lang.ActivityName.mainAward010,    --主要奖励
	--活动的开启时间
	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={0},
			minutes= 
			{
				"15:30-16:00",
			}
		},
	},
	awards=
	{
		{type=0,id=824,count=-1,bind=1,strong=0,quality=0}, -- 赛马冠军大礼包
		{type=0,id=825,count=-1,bind=1,strong=0,quality=0}, -- 赛马亚军大礼包
		{type=0,id=826,count=-1,bind=1,strong=0,quality=0}, -- 赛马季军大礼包
		{type=0,id=827,count=-1,bind=1,strong=0,quality=0}, -- 赛马英雄大礼包
		{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励经验 
		{type=6,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币

	},
	npc=
	{
		{
			sceneId=2,name=Lang.EntityName.n00152,
			conds = { },
		},
	},
},