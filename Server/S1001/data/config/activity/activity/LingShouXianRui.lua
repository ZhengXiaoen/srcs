--19:10-19:30 灵兽献瑞
{
	--活动的名字
	name =Lang.ActivityName.name00009,
	--活动的描述
	desc="",
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = "19:10-19:30",
	level = 50, --活动的等级
	icon = 34,
	type = 1,  --1是今日活动 2 是每日必做
	index =0,  --第1场
	seckillId = 1,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID 默认为0 不能秒
	mainAwardDesc = Lang.ActivityName.mainAward002,    --主要奖励
	--活动的开启时间
	openTimes=
	{
		{
			months={}, 
			days ={},
			weeks={},
			minutes= 
			{
				"19:10-19:30",
			}
		},
	},
	awards=
	{
		--{type=2,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励经验  

	},
},