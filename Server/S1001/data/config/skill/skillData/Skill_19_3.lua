--Ê©¶¾Êõ3¼¶
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s19L3Desc,--¼¼ÄÜµÄÃèÊö
	
	iconID=21,--Í¼±êµÄID
			
	--×÷ÓÃ·¶Î§±í
	actRange=
	{
		
		{

			xStart=0,--Ïà¶ÔÓÚÖÐÐÄµãx×ó±ßµÄÏà¶Ô×ø±ê
			xEnd=0,--Ïà¶ÔÓÚÖÐÐÄµãxÓÒ±ßµÄÏà¶Ô×ø±ê
			yStart=0,--Ïà¶ÔÓÚÖÐÐÄµãyÉÏ±ßµÄÏà¶Ô×ø±ê
			yEnd=0,--Ïà¶ÔÓÚÖÐÐÄµãyÏÂ±ßµÄÏà¶Ô×ø±ê
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{},
					results=
					{},
					specialEffects=
					{
						{type=4,mj=0,id=28,keepTime=400,delay=0,always=true},					
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
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=true},					
					},
				},
			},
		},

		
		{

			xStart=0,--Ïà¶ÔÓÚÖÐÐÄµãx×ó±ßµÄÏà¶Ô×ø±ê
			xEnd=0,--Ïà¶ÔÓÚÖÐÐÄµãxÓÒ±ßµÄÏà¶Ô×ø±ê
			yStart=0,--Ïà¶ÔÓÚÖÐÐÄµãyÉÏ±ßµÄÏà¶Ô×ø±ê
			yEnd=0,--Ïà¶ÔÓÚÖÐÐÄµãyÏÂ±ßµÄÏà¶Ô×ø±ê
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
						{mj=0,timeParam=180,type=1,id=34, rate=-200, rateType=2, delay=0,value=-1000,maxAttack =1},--,maxDamage=1000,
						{mj=0,timeParam=1,type=1,id=35, rate=-2000, rateType=10, delay=0},
						{mj=0,timeParam=1,type=1,id=36, rate=-2000, rateType=11, delay=0},
						
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		
	
	},


	trainConds=
	{
		--{cond=1,value=40,consume=false},--±íÊ¾µÈ¼¶
		{cond=21,value=4500,consume=false},--±íÊ¾ÐèÒªÊìÁ·¶È
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=35,consume=true},--ÏûºÄÀ¶10
	},
	--Ò÷³ªÊ±¼ä,µ¥Î»ÊÇºÁÃë
	singTime=0,	
	cooldownTime=800,

},