--14:00-15:00 武林争霸
{
	--活动的名字
	name =Lang.ActivityName.name00008,
	--活动的描述
	desc="",
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	level = 80, --活动的等级
	icon = 31,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	seckillId = 5,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID 默认为0 不能秒
	mainAwardDesc = Lang.ActivityName.mainAward018,    --主要奖励
	activityId = 1,
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
				"13:00-14:00",
			}
		},
	},
	awards=
	{
		--{type=7,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励绑定元宝  
		--{type=0,id=561,count=-1,bind=1,strong=0,quality=0}, -- 盟主戒指
		--{type=21,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励荣誉值 

	},
	npc=
	{
		{
			sceneId=5,name=Lang.EntityName.n00240,
			conds = { },
		},
	},
},