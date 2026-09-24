--12:10-12:30 
{
	--活动的名字
	name =Lang.ActivityName.name00059,
	--活动的描述
	desc=Lang.ActivityName.desc00063,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = "12:10-12:30",
	level = 40, --活动的等级
	icon = 61,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	--seckillId = 4,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID
	mainAwardDesc = Lang.ActivityName.mainAward002,    --主要奖励
	--活动的开启时间
	nonopensererday = {1,2,3},			--开服第一、第二、第三天不开启

	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={0},
			minutes= 
			{
				"12:10-12:30",
			}
		},
	},
	awards=
	{

		{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励经验 
	

	},
	npc=
	{
		{
			sceneId=2,name=Lang.EntityName.n00084,
			conds = { },
		},
	},
},