--锟阶碉拷锟斤拷2锟斤拷
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s9L2Desc,--锟斤拷锟杰碉拷锟斤拷锟斤拷
	
	iconID=11,--图锟斤拷锟斤拷ID
			
	--锟斤拷锟矫凤拷围锟斤拷
	actRange=
	{

		{	--//锟斤拷锟斤拷锟斤拷效锟酵凤拷
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

			xStart=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷x锟斤拷锟竭碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			xEnd=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷x锟揭边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			yStart=-0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷y锟较边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			yEnd=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷y锟铰边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			rangeType=0,				
			rangeCenter=2,			

			acts=
				{
					{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=0,rate=11500},
					},

					specialEffects=
					{				
					},
				},
			},
		},
		
		{

			xStart=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷x锟斤拷锟竭碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			xEnd=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷x锟揭边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			yStart=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷y锟较边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
			yEnd=0,--锟斤拷锟斤拷锟斤拷锟斤拷锟侥碉拷y锟铰边碉拷锟斤拷锟斤拷锟斤拷锟斤拷
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
						{type=4,mj=0,id=13,keepTime=400,delay=0,always=true},					
					},
				},
			},
		},
		
	},

	trainConds=
	--锟斤拷锟斤拷锟斤拷锟斤拷
	{
		--{cond=1,value=25,consume=false},--锟斤拷示锟饺硷拷
		{cond=21,value=1500,consume=false},--锟斤拷示锟斤拷要锟斤拷锟斤拷锟斤拷
		{cond=6,value=2},
	},
	
	spellConds=
	--锟酵凤拷锟斤拷锟斤拷
	{
		{cond=8,value=100,consume=true},--锟斤拷锟斤拷锟斤拷
	},
	--锟斤拷锟斤拷时锟斤拷,锟斤拷位锟角猴拷锟斤拷
	singTime=0,	
	cooldownTime=800,

},

