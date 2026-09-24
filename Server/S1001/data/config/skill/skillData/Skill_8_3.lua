--���ܻ�3��
{

	actions=
		{
			{act=1,effect=10,},
		},
	desc=Lang.Skill.s8L3Desc,
	iconID=10,

	actRange=
	{

		-- {
		-- 	xStart=0,--相对于中心点x左边的相对坐标
		-- 	xEnd=0,--相对于中心点x右边的相对坐标
		-- 	yStart=0,--相对于中心点y上边的相对坐标
		-- 	yEnd=0,--相对于中心点y下边的相对坐标
		-- 	rangeType=0,				
		-- 	rangeCenter=0,			
		-- 	acts=
		-- 		{
		-- 			{
		-- 				conds=
		-- 				{
		-- 					{cond = 3,value = true},
		-- 				},
		-- 				results=
		-- 				{
		-- 					{mj=0,timeParam=1,type=7,delay=0,id= 27,value= 2000,vt=0},--type=7=修改属性，id=属性类型，value=数值
		-- 				},
		-- 				specialEffects=
		-- 				{
		-- 				},
		-- 			},
		-- 		},
		-- 	},

		{	--//������Ч�ͷ�,ID=8
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
						{type=5,mj=0,id=11,keepTime=0,delay=0,always=false},
					},
				},
			},
		},

		{
			xStart=-1,
			xEnd=1,
			yStart=-1,
			yEnd=1,
			rangeType=3,
			rangeCenter=1,	
			
			acts=
			{
				{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=2000,value=0},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{

					},
				},
						
			{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
						{cond=22,value=8},
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=2000,value=0},
						{mj=0,timeParam=1,type=21,delay=0,value=8},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{
					
					},
				},

			{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
						{cond=22,value=8},
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=2000,value=0},
						{mj=0,timeParam=1,type=21,delay=0,value=8},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{
					
					},
				},

			{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
						{cond=22,value=8},
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=2000,value=0},
						{mj=0,timeParam=1,type=21,delay=0,value=8},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{
					
					},
				},
			},
		},
        {
			xStart=-2,
			xEnd=2,
			yStart=-2,
			yEnd=2,
			rangeType=3,
			rangeCenter=1,

			acts=
			{

				{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
                        {cond=20,value=8},  --自己身上不存在技能标记
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{

					},
				},

			{
				conds=
					{
						{cond=15,value=-1},
						{cond=13,value=1},
						{cond=3,value=0},
						{cond=20,value=8},
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},
						{mj=0,timeParam=1,type=21,delay=0,value=8},
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},
					},
				specialEffects=
					{

					},
				},
			},
		},
	},
        --��������
	trainConds=
		{
			--{cond=1,value=30,consume=false},--�����ȼ�30
			{cond=21,value=4500,consume=false},--����������
			{cond=6,value=2},
		},
        --�ͷ�����
	spellConds=
		{
			{cond=8,value=25,consume=true},--������300
		},

	singTime=0,	
	cooldownTime=5000,

},