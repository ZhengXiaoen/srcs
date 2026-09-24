	--佛光普照
{
	--活动的名字
	name = Lang.ActivityName.name00002,
	--活动的描述
	desc = "",
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	level = 40, --活动的等级
	icon = 33,
	type = 1,  --1是今日活动 2 是每日必做
	index =1,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward010,    --主要奖励
	activityId = 2,
	nonopensererday={},
	opensererday={},
	--活动的开启时间
	openTimes=
	{
		{
			opensererday = {},		--开服第1天出现，可修改
			months={},
			days ={},
			weeks={},
			minutes=
			{
				"15:00-15:15",
			}
		},
	},
	awards=
	{
	--	{type=0,id=680,count=-1,bind=0,strong=0,quality=0}, --光灵碎片
	--	{type=0,id=681,count=-1,bind=0,strong=0,quality=0}, --暗灵碎片
	},
	npc=
	{
		{
			sceneId=5,name=Lang.EntityName.n00268,
			conds = { },
		},
	},
},