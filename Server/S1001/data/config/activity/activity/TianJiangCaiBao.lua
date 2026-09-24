--天降财宝
{
	--活动的名字
	name =Lang.ActivityName.name00015,
	--活动的描述
	desc="",--Lang.ActivityName.desc00062,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	level = 40, --活动的等级
	icon = 22,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward002,    --主要奖励
	activityId = 8,
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
				"19:35-19:50",
			}
		},
	},
	awards=
	{
		--{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励经验 


	},
	npc=
	{
		{
			sceneId=5,name="",--Lang.EntityName.n00180,
			conds = { },
		},
	},
},