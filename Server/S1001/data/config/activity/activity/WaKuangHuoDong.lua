--挖矿活动（全天）
{
	--活动的名字
	name =Lang.ActivityName.name00046,
	--活动的描述
	desc=Lang.ActivityName.desc00047,
	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = Lang.ActivityName.timeDesc00001,
	level = 20, --活动的等级
	icon = 22,
	type = 2,  --1是今日活动 2 是每日必做
	index = 0,  --第1场
	mainAwardDesc = Lang.ActivityName.mainAward025,    --主要奖励
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
		
		{type=6,id=0,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币   
        {type=0,id=273,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
		{type=0,id=274,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
		{type=0,id=275,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
		{type=0,id=326,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
		{type=0,id=327,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
		{type=0,id=562,count=-1,bind=1,strong=0,quality=0}, -- 奖励金币
	},
	npc=
	{
		{
			
		},
	},
},