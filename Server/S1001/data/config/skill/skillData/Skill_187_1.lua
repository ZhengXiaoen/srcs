--群体雷电术1级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s156L1Desc,--技能的描述
	
	iconID=156,--图标的ID
			
	--作用范围表
	actRange=
	{
		{	--//身上特效释放
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
			{
				{
					conds=
					{
						{cond=3,value=1},
					},
					results=
					{
			
					},
					specialEffects=
					{
						{type=5,mj=0,id=12,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		
        {

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=2,			

			acts=
			{
				{
					targetType=1,
					conds=
					{	
					},
					results=
					{
					},

					specialEffects=
					{
						{type=4,mj=0,id=13,keepTime=400,delay=100,always=true},					
					},
				},
			},
		},
		
		
--		{

--			xStart=-3,--相对于中心点x左边的相对坐标
--			xEnd=3,--相对于中心点x右边的相对坐标
--			yStart=-3,--相对于中心点y上边的相对坐标
--			yEnd=3,--相对于中心点y下边的相对坐标
--			rangeType=3,				
--			rangeCenter=2,			

--		acts=
--			{
--				{
--					targetType=0,
--					conds=
--					{

--						{cond = 13,value =1},
--					},
--					results=
--					{
--						{mj=0,timeParam=1,type=4,delay=100, rate=8000,value=200},	

--					},

--					specialEffects=
--					{

--					},
--				},
--			},
--		},		
		{

			xStart=-6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=2,			

		acts=
			{
				{
					targetType=0,
					conds=
					{

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=100, rate=10000},	

					},

					specialEffects=
					{
						{type=5,mj=0,id=13,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{


	},
	
	spellConds=
	{
		{cond=13,value=12,consume=true},--攻击距离
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=400,

},