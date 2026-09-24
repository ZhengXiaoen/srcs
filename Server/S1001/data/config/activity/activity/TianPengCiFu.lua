--天蓬赐福
{
	--活动的名字
	name =Lang.ActivityName.name00014,
	--活动的描述
	desc="",--Lang.ActivityName.desc00036,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	level = 30, --活动的等级
	icon = 22,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward001,    --主要奖励
	activityId = 7,
	nonopensererday={},
	opensererday={},
	--活动的开启时间
	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={},
			minutes= 
			{
				"12:20-12:40",
				"16:05-16:25",
				"23:40-0:00",
			}
		},
	},
	awards=
	{
		--{type=21,id=0,count=-1,bind=0,strong=0,quality=1}, -- 荣誉（根据等级计算） 

	},
	npc=
	{
		{
			sceneId=5,name="",
			conds = { },
		},
	},
},