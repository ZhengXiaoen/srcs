--气波功3级
{

	actions={{act=1,effect=40,},},
	desc=Lang.Skill.s78L3Desc,
	iconID=25,

	actRange=
	{
		{	--//身上特效释放,ID=8
			xStart=0,xEnd=0,yStart=0,yEnd=0,
			rangeType=3,rangeCenter=1,
			acts={{conds={{cond=3,value=1},},results={},specialEffects={{type=5,mj=0,id=40,keepTime=0,delay=0,always=false},},},},
		},



		{
			xStart=-1,xEnd=1,yStart=-1,yEnd=1,
			rangeType=3,rangeCenter=1,			
			acts=
			{
			
			{
				conds={{cond=15,value=-1},{cond=13,value=1},{cond=3,value=0},},
				results={{mj=0,timeParam=1,type=33,delay=0,rate=3000,value=0},{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},},
				specialEffects={},
			},
						
			{
				conds={{cond=15,value=-1},{cond=13,value=1},{cond=3,value=0},{cond=22,value=8},},
				results={{mj=0,timeParam=1,type=33,delay=0,rate=3000,value=0},{mj=0,timeParam=1,type=21,delay=0,value=8},{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},},
				specialEffects={},
			},
			
			},
		},
	},
        --升级条件
	trainConds={
			{cond=1,value=57,consume=false},--表示等级需求
			{cond=21,value=1000,consume=false},--技能熟练度value为熟练度的数值
			},
	--释放条件
	spellConds={
			{cond=8,value=540,consume=true},--消耗蓝
			
		},

	singTime=0,	
	cooldownTime=1000,

},