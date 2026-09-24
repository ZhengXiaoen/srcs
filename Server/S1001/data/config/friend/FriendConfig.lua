--好友配置
FriendConfig =
{
	MaxFriendNum = 150,		--好友人数上限
	MaxStrangerNum = 20,		--陌生人数上限
	MaxEnemyNum = 10,		--仇人人数上限
	MaxBlacklist = 50,		--黑名单上限

	PromptLevel = { 35,40,45,50,55,60 },	--推荐好友的玩家等级设置
	LevelInterval = 4,		--推荐的等级浮动区间（0，4）
	MaxNum = 20,			--推荐的人数上限

	trackItemId = 380,		--追踪令物品id 
	trackNeedYb = 200,		--追踪需要的元宝

	alarmItemId = 313,		--报警灯的物品id
	sendNeedCoin = 1000,		--发送坐标需要金币

	MaxMoodString = 12,		--最大心情数

	changeNamCoin = 100000,		--修改战队名称需要的金币

	minAttendMaster = 25,		--可以拜师的最低等级
	maxAttendMaster = 50,		--可以拜师的最高等级
	canBeMaster = 30,		--可以成为师父的等级

	maxMaster = 1,			--可以拜师的最大人数
	maxDisciple = 4,		--可收徒弟的最大人数

	graduateLevel = 70,		--出师的等级
	needIntimacy = 10000,		--出师需要的亲密度

	publishAttendMaster = 1000,	--发布出师或收徒需要的金币

	maxCanMasterNum = 20,		--列表中徒弟、师父的最大数

	desertMasterNeedCoin = 200000,		--叛离师门 需要的金币
	driveOutMaster = 200000,			--逐出师门 需要的金币

	expRate = 5,				--组队经验值奖励 倍率

	giveAwardByUplevel = {35,45,55,65},	--徒弟升级时给奖励

	--出师 师父的奖励
	MasterAwards =
	{
		{type = 22, id = 0, count = 1000, quality = 0, strong = 0, bind = 0, param = 0},	--转生灵魄
		{type = 15, id = 0, count = 300, quality = 0, strong = 0, bind = 0, param = 0},		--元宝
		{type = 21, id = 0, count = 50000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
		{type = 29, id = 0, count = 200, quality = 0, strong = 0, bind = 0, param = 0},		--帅气/魅力值

	},

	--出师 徒弟的奖励
	StudentAwards =
	{
		{type = 22, id = 0, count = 100, quality = 0, strong = 0, bind = 0, param = 0},		--转生灵魄
		{type =  7, id = 0, count = 300, quality = 0, strong = 0, bind = 0, param = 0},		--绑定元宝
		{type = 21, id = 0, count = 10000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
	},

	--徒弟升级 师父的奖励
	AwardByUpLevelMaster =
	{
		--对应35的奖励
		{
			{type = 21, id = 0, count = 1000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type = 29, id = 0, count = 30, quality = 0, strong = 0, bind = 0, param = 0},		--帅气/魅力值
		},

		--对应45的奖励
		{
			{type = 21, id = 0, count = 2000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type = 29, id = 0, count = 60, quality = 0, strong = 0, bind = 0, param = 0},		--帅气/魅力值
		},

		--对应55的奖励
		{
			{type = 21, id = 0, count = 3000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type = 29, id = 0, count = 90, quality = 0, strong = 0, bind = 0, param = 0},		--帅气/魅力值
		},

		--对应65的奖励
		{
			{type = 21, id = 0, count = 4000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type = 29, id = 0, count = 120, quality = 0, strong = 0, bind = 0, param = 0},		--帅气/魅力值
		},
	},

	--徒弟升级 徒弟的奖励
	AwardByUpLevelSelf =
	{
		--对应35的奖励
		{
			{type = 21, id = 0, count = 4000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type =  7, id = 0, count = 50, quality = 0, strong = 0, bind = 0, param = 0},		--绑定元宝
			--{type =  0, id = 331, count = 1, quality = 0, strong = 0, bind = 1, param = 0},		--2倍经验神符（8小时）
		},

		--对应45的奖励
		{
			{type = 21, id = 0, count = 8000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type =  7, id = 0, count = 100, quality = 0, strong = 0, bind = 0, param = 0},		--绑定元宝
			--{type =  0, id = 627, count = 1, quality = 0, strong = 0, bind = 1, param = 0},		--3倍经验神符（8小时）
		},

		--对应55的奖励
		{
			{type = 21, id = 0, count = 12000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type =  7, id = 0, count = 150, quality = 0, strong = 0, bind = 0, param = 0},		--绑定元宝
			--{type =  0, id = 683, count = 1, quality = 0, strong = 0, bind = 1, param = 0},		--4倍经验神符（8小时）
		},

		--对应65的奖励
		{
			{type = 21, id = 0, count = 16000, quality = 0, strong = 0, bind = 0, param = 0},	--荣誉
			{type =  7, id = 0, count = 200, quality = 0, strong = 0, bind = 0, param = 0},		--绑定元宝
			--{type =  0, id = 629, count = 1, quality = 0, strong = 0, bind = 1, param = 0},		--5倍经验神符（8小时）
		},
	},
}

