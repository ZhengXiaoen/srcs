--20:00-22:00 沙巴克城战
{
	--活动的名字
	name = Lang.ActivityName.name00010,
	--活动的描述
	desc = "",--Lang.ActivityName.desc00010,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	level = 1, --活动的等级
	icon = 36,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward016,    --主要奖励
	--活动的开启时间
	nonopensererday = {1,2},			--开服第一、第二天不开启
	opensererday={},
	activityId = 6,
	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={0,1,2,3,5,6},
			minutes= 
			{
				"20:00-22:00",
			}
		},
	},
	awards=
	{
		--{type=0,id=884,count=1,bind=0,strong=0,quality=0}, -- 奖励 天宫礼包
		--{type=6,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币  
		--{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 获得经验   

	},
	npc=
	{
		{
			sceneId=5,name=Lang.EntityName.n00232,
			conds = { },			
		},
	},
},