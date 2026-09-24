--召唤神兽1级
{

	actions=
	{
		{act=1,effect=36,},
	},
	
	desc=Lang.Skill.s27L1Desc,--技能的描述
	
	iconID=27,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
				--	targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=52,value=50},
						{cond=61,value=0},
						{cond=56,value=2},		--表示需要宠物数目少于2个				
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=533,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
		
		
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
			--		targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=61,value=0},
						{cond=53,value=50},
						{cond=56,value=2},		--表示需要宠物数目少于2个								
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=535,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
			--		targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=3,value=1},
						{cond=60,value=0},
						{cond=61,value=4},
						{cond=56,value=2},		--表示需要宠物数目少于2个								
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=641,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
			--		targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=3,value=1},
						{cond=60,value=4},
						{cond=61,value=9},
						{cond=56,value=2},	--表示需要宠物数目少于2个								
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=642,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
			--		targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=3,value=1},
						{cond=60,value=9},
						{cond=61,value=19},
						{cond=56,value=2},	--表示需要宠物数目少于2个								
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=643,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{
			--		targetType=1,--不进行目标筛选也可以施放
					conds=
					{
						{cond=3,value=1},
						{cond=60,value=19},
						--{cond=61,value=9},
						{cond=56,value=2},	--表示需要宠物数目少于2个								
					},
					results=
					{
						{mj=0,timeParam=1,delay=0,type=36,id=644,value=1,aiId=14},
					},

					specialEffects=
					{
					{type=4,mj=0,id=42,keepTime=400,delay=200,always=false},		
					},
				},
			},
		},
	},

	trainConds=
	{
		{cond=1,value=35,consume=false},--表示等级要1级
		--{cond=3,value=450,consume=true,exceptVip=true },--表示书本
	},
	
	spellConds=
	{
		{cond=10,value=2,consume=false},--表示需要宠物数目少于2个
		{cond=8,value=17,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=10000,

},