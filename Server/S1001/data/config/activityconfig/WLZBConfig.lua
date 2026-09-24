

--武林争霸

WLZBConfig = 
{
	minLevel = 70,				--高级武林争霸赛参加的最低等级
	
	lastTime = 1800,			--单位秒 活动持续时间

	lowSceenId = 58,			--争霸赛的场景id

	wMapX = {33,60},				--进入的x坐标
	wMapY = {23,51},				--进入的y坐标

	outSceenId = 3,				--退出的争霸赛的场景id
	outMapX = {110,140},			--退出的x坐标
	outMapY = {95,120},			--退出的y坐标
	
	RankName = "WuLinZhengBa",		--保存的武林争霸信息
	RankTxt = "WuLinZhengBaConfig.txt",	--保存到的文件名

	titleId = 26,				--武林盟主的称号id

	BossId = 236,
	SuperBossId = 237,
	BossTimeInterval = 18000, --5分钟
	BossPos = {49,50},

	RankColumn = 	--排行榜列标题表
	{
		{columnName = "name", ShowFlag = 0}, 	--姓名
		{columnName = "state", ShowFlag = 0},	--状态
	},

	--每过5分钟发放一次奖励
	LoopTime = 8000,		--单位为毫秒
	
	Awards = 
	{
	},
	
	--奖励武林盟主
	awardsMaster =
	{
		--小金条*4
		{ type = 0, id = 507, count = 4, strong = 0, quality = 0, bind = 0 },	
		--元宝1000
		{ type = 0, id = 858, count = 1, strong = 0, quality = 0, bind = 0 },	

	},

	--奖励本次报名(武林盟主除外)
	awardsSignUp =
	{
		--小金条*4
		{ type = 0, id = 507, count = 4, strong = 0, quality = 0, bind = 0 },	
	},
	
	fRate = 0.1,
}

