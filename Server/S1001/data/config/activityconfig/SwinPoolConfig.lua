--神圣庄园的游泳区域
SwinPoolConfig = {
	SceneId = 0,		--所在的场景ID
	SceneName = Lang.SceneName.s00008,		--所在场景名称
	GetExpInterval = 1,		--获取经验间隔，秒
	Exp = 526800,			--获取经验的数量
	VipAddRate = 5000,		--vip的加成，万分之几
	IniTime = 1800,			--初始化时间
	returnArea = {sid = 2, x = 157, y = 185},	--返回区域
	timeAward = 
	{
		interval = 5,	--加经验间隔(秒)
		kissAdd = 0.5,	--亲吻加成倍率		
	},
	pointsCenter = {
		{156,87},
	},
	MinLevel = 55,		--提示该等级以上的
}