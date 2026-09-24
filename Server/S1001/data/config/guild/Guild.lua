--这里定义帮派相关的配置信息，主要是各个帮派等级的限制条件，比如人数上限等，还包括一些全局的帮派设定，比如创建帮派需要的达到的角色等级、
--绑定银两（银两）等
GuildConfig = {
	global = {
		--全局的配置
		levelLimit = 70,	--创建帮派时，角色需要达到的最小等级
		hornItemId = 492,		--行会号角的物品id
		awardGuildMoney = 100,	--创建行会时赠送的行会资金

		zjItemId = 0,		--召集令的物品id号	对单个行会在线成员进行召唤,可令其直接传送到身边
		zjItemId2 = 0,		--非绑定的召集令	对单个行会在线成员进行召唤,可令其直接传送到身边
		zjYb = 20,		--召集需要的元宝数	对单个行会在线成员进行召唤,可令其直接传送到身边
		buItemId = 515,		--行会召集令的id号
		guildZJLingTime = 20, --行会召集令使用后回应的有效时间（秒）
		createNeedGold = 888,    --创建行会消耗200元宝
		leftTimeLimit = 1,		--恢复玩家主动脱离帮派的限制创建帮派加入其他帮派，这个是配置这个时间，以小时为单位（1小时）

		coinLimit = 100000,		--捐献行会金票获得的行会资金
		addCoinItemId = 0,		--行会银票的物品id

		minGuildCoin = 0,		--行会资金降为0删除行会
		minGuildCoinNotice = 20,	--行会资金低于多少时提示
		decGuildCoinPerDay = 20,	--每天定日扣除行会资金
		noticeGuildCoin = 20,		--行会资金低于20的时候提示删除行会

		warLastTime = 10800,		--宣战持续的时间 单位秒
		DeclareWarNeedCoin = 500,	--宣战需要的扣除宣战者元宝

		bidCoin	= 10,			--行会排名竞技消耗的元宝
		tipsLevel = 55,			--给玩家推荐行会的等级

		SiegeItemId = 546,		--攻城头像
		SignUpneedCoin = 100,	--报名需要的行会资金

		CrossItemId = 420,			--跨服攻城头像
		canSignDays = 10,			--开服10天后才可以报名

		AwardYb = 50000,			--开服第一个占领的行会头领奖励的元宝

		HelpNeedCoin = 1000,		--求救需要的个人银两
		KingCitySceenId = 10,		--王城场景id
        StatueID = 714,         --雕像怪物id
        StatueX = 87,       --雕像怪物X坐标
        StatueY = 81,       --雕像怪物Y坐标
		SceenId = 11,			--王城皇宫的场景id

		sendexp = 88,		--送经验
		sendBindCoin = 88,	--送金币
		sendGuildGx = 6,	--送荣誉
		MaxLangNum = 12,		--祝福语的总数量

		sbkOwnerTitleId = 30,				--沙城霸主的头衔id
		sbkMemberTitleId = 29,				--沙城英雄的头衔id

		nSbkOwnDays = 1,					--连续占领沙巴克的天数

		sendCmdNeedCoin = 500,				--发送沙巴克指令需要的行会资金

		crossSbkSceneId = 11,				--跨服的沙皇宫场景id

		GuildCoinGxRate = 1000,				--捐献10万金币获得1000贡献

		expandPeoCount = 0,				--每次扩充的人数
		expandYb = 0,						--每次扩充需要的元宝数
		maxExpandCount = 200,				--最大行会人数
		defaultContext = "行会资金每天减少20，如果行会资金等于0则此行会自动解散，赶紧加入建设行会的队伍中吧！",				--默认游戏公告
		RedPacketTime = 300,					--每一轮的行会红包抢购时间- (秒为单位)
		MinRedPacketMoney = 1,			--行会发放红包最小元宝数量
		MinRedPacketCount = 1,				--行会发放红包最小红包数量
		MaxRedPacketCount = 100000,			--行会发放红包最大红包数量
		RecordEventEquipLevel = 75,			--获得装备记录到行会事件的最小装备等级(拾取、寻宝)
		DoubleActiveTime = 1800, 		--双倍活动持续时间半个小时
		GuildFlagModelIdBegin = 306, --会旗外观开始ID, 共5个

	},

	--以下是可以领取的召集令的数量
	zj={
		--不同权限的人每日可领取召集令的数量
		--leader:表示帮主每天可领取的召集令的数量
		--secLeader：副帮主可领取的召集令的数量
		--member:普通帮众可领取的召集令的数量
		leader = 2, secLeader = 2, member=1,
	},

	--领取的行会集结令数量
	BuildUpItem = {
		--不同权限的人每日可领取行会集结令的数量
		--leader:表示帮主每天可领取的福利工资的数量
		--secLeader：副帮主可领取的福利工资的数量
		--member:普通帮众可领取的福利工资的数量
		leader = 1, secLeader = 0, member = 0,
	},
	--升级镇帮之宝物品配置
	itemToSealExp =
	{
		{id = 683,count=1,exp=2}, --小令牌
		{id = 684,count=1,exp=5}, --中令牌
		{id = 685,count=1,exp=10}, --大令牌
	},
	--镇帮之宝升级经验配置 一般类型有杀怪BUFF 双倍采集  双倍降妖除魔 双倍押镖  行会BOSS
	guildSealLevel =
	{
		{
			sealLevel = 1,  --等级
			needExp = 0,  --需要的宝物经验
			needGuildLevel = 2, --需要行会等级
			buff =
			{
				{type=0,value=30,count=0},  --杀怪经验
			},
		},
		{
			sealLevel = 2,  --等级
			needExp = 8000,  --需要的宝物经验
			needGuildLevel = 3, --需要行会的等级
			buff =
			{
				{type=0,value=40,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
			},
		},
		{
			sealLevel = 3,  --等级
			needExp = 20000,  --需要的宝物经验
			needGuildLevel = 4, --需要行会的等级
			buff =
			{
				{type=0,value=50,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
			},
		},
		{
			sealLevel = 4,  --等级
			needExp = 50000,  --需要的宝物经验
			needGuildLevel = 5, --需要行会的等级
			buff =
			{
				{type=0,value=60,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
				{type=3,value=2,count=3},	--押镖倍数
			},
		},
		{
			sealLevel = 5,  --等级
			needExp = 100000,  --需要的宝物经验
			needGuildLevel = 6, --需要行会的等级
			buff =
			{
				{type=0,value=70,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
				{type=3,value=2,count=3},	--押镖倍数
				{type=4,value=0,count=0},  	--击杀行会boss
			},
		},
	},

	--升级经验物品配置
	itemToExp = {
		{id = 683,count=1,score=2,exp=2,money=2}, --小纯金牛
		{id = 684,count=1,score=5,exp=5,money=5}, --中纯金牛
		{id = 685,count=1,score=10,exp=10,money=10}, --大纯金牛
		--{id = 379,count=1,score=100,exp=1},	--初级行会令
		--{id = 2,count=1,score=200,exp=1},	--中级行会令
		--{id = 3,count=1,score=300,exp=1},	--高级行会令
		--{id = 4,count=1,score=400,exp=1},	--超级行会令
	},
	--贡献值兑换金币
	scoreToGold = {
		{score=100,money=3000000,everyDayTimes=100}, --10点贡献兑换9万绑金
	},
	--行会商城商品配置
	itemList = {
--		{needLev = 1, nItemId = 307, price = 120, count = 1, strong = 0, quality = 0, bind = 1,score=400, },--中级气血丹
	},

	--金币兑换升级经验
	goldToExp={
		exp=100,count=100000,score=100,guildMoney=100,
	},
	--捐赠行会基金送积分
	goldToFund={
		count=1000,score=10,
	},
	--以下是各个等级的配置
	--注意：如果达到一定的等级后，以后所有的配置都一样的话，可以只配置到这个等级，以后的等级配置按照这个配置
	--比如，如果帮派达到20级后，大于或等于20级的帮派都是按照20级的配置，那么这里配置文件就只需配置到20级，以后的级数不用再配置
	guildLevel =
	{
	--行会等级，共30级
	--行会资金，最大值:2147483647
	--行会经验，最大值:2147483647 
	--贡献，最大值:4294967295 
-----------------------------------------
--		{
--			level = 1,		--帮派等级,这个值起始是1，每次递增1级
--			maxFBZ = 1,		--副帮主数量的上限
--			maxMember = 80,		--该等级帮派所有成员的人数上限
--			maxDepotBagCount = 70,	--该等级的帮派仓库最大数量
--			needYb = 0,           --这个是升级到下一级需要的元宝
--			needExp= 100000,       --该等级需要的经验
--			maxQLTZ = 1,			--青龙堂主上限
--			maxZQTZ = 1,			--朱雀堂主上限
--			maxBHTZ = 1,			--白虎堂主上限
--			maxXWTZ = 1,			--玄武堂主上限
--			guildLevelWelfare={		--行会等级福利
--				{type= 11, value= 30,},--最大物理攻击
--				{type= 15, value= 30,},--最大魔法攻击
--				{type= 19, value= 30,},--最大道术攻击
--			},
--		}, --行会升级
{level=1,maxFBZ=1,maxMember=200,maxDepotBagCount=350,needYb=0,needExp=50000,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=21,},{type=15,value=21,},{type=19,value=21,},},},--1级行会
{level=2,maxFBZ=1,maxMember=180,maxDepotBagCount=350,needYb=0,needExp=102720,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=49,},{type=15,value=49,},{type=19,value=49,},},},--2级行会
{level=3,maxFBZ=1,maxMember=160,maxDepotBagCount=350,needYb=0,needExp=211028,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=80,},{type=15,value=80,},{type=19,value=80,},},},--3级行会
{level=4,maxFBZ=1,maxMember=140,maxDepotBagCount=350,needYb=0,needExp=401882,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=114,},{type=15,value=114,},{type=19,value=114,},},},--4级行会
{level=5,maxFBZ=1,maxMember=130,maxDepotBagCount=350,needYb=0,needExp=765344,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=151,},{type=15,value=151,},{type=19,value=151,},},},--5级行会
{level=6,maxFBZ=1,maxMember=120,maxDepotBagCount=350,needYb=0,needExp=1342720,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=192,},{type=15,value=192,},{type=19,value=192,},},},--6级行会
{level=7,maxFBZ=1,maxMember=110,maxDepotBagCount=350,needYb=0,needExp=2355668,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=237,},{type=15,value=237,},{type=19,value=237,},},},--7级行会
{level=8,maxFBZ=1,maxMember=100,maxDepotBagCount=350,needYb=0,needExp=3779434,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=287,},{type=15,value=287,},{type=19,value=287,},},},--8级行会
{level=9,maxFBZ=1,maxMember=95,maxDepotBagCount=350,needYb=0,needExp=6063724,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=342,},{type=15,value=342,},{type=19,value=342,},},},--9级行会
{level=10,maxFBZ=1,maxMember=90,maxDepotBagCount=350,needYb=0,needExp=8819080,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=403,},{type=15,value=403,},{type=19,value=403,},},},--10级行会
-- {level=11,maxFBZ=1,maxMember=200,maxDepotBagCount=420,needYb=0,needExp=12826470,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=470,},{type=15,value=470,},{type=19,value=470,},},},--11级行会
-- {level=12,maxFBZ=1,maxMember=210,maxDepotBagCount=455,needYb=0,needExp=16730847,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=544,},{type=15,value=544,},{type=19,value=544,},},},--12级行会
-- {level=13,maxFBZ=1,maxMember=220,maxDepotBagCount=490,needYb=0,needExp=21823717,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=625,},{type=15,value=625,},{type=19,value=625,},},},--13级行会
-- {level=14,maxFBZ=1,maxMember=230,maxDepotBagCount=525,needYb=0,needExp=25193299,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=714,},{type=15,value=714,},{type=19,value=714,},},},--14级行会
-- {level=15,maxFBZ=1,maxMember=240,maxDepotBagCount=560,needYb=0,needExp=29083144,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=812,},{type=15,value=812,},{type=19,value=812,},},},--15级行会
-- {level=16,maxFBZ=1,maxMember=250,maxDepotBagCount=595,needYb=0,needExp=33573581,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=920,},{type=15,value=920,},{type=19,value=920,},},},--16级行会
-- {level=17,maxFBZ=1,maxMember=260,maxDepotBagCount=630,needYb=0,needExp=38757342,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1039,},{type=15,value=1039,},{type=19,value=1039,},},},--17级行会
-- {level=18,maxFBZ=1,maxMember=270,maxDepotBagCount=665,needYb=0,needExp=44741476,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1170,},{type=15,value=1170,},{type=19,value=1170,},},},--18级行会
-- {level=19,maxFBZ=1,maxMember=280,maxDepotBagCount=700,needYb=0,needExp=51649560,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1314,},{type=15,value=1314,},{type=19,value=1314,},},},--19级行会
-- {level=20,maxFBZ=1,maxMember=300,maxDepotBagCount=735,needYb=0,needExp=59624252,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1472,},{type=15,value=1472,},{type=19,value=1472,},},},--20级行会
-- {level=21,maxFBZ=1,maxMember=320,maxDepotBagCount=770,needYb=0,needExp=68830237,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1646,},{type=15,value=1646,},{type=19,value=1646,},},},--21级行会
-- {level=22,maxFBZ=1,maxMember=340,maxDepotBagCount=805,needYb=0,needExp=79457626,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=1837,},{type=15,value=1837,},{type=19,value=1837,},},},--22级行会
-- {level=23,maxFBZ=1,maxMember=360,maxDepotBagCount=840,needYb=0,needExp=91725883,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=2047,},{type=15,value=2047,},{type=19,value=2047,},},},--23级行会
-- {level=24,maxFBZ=1,maxMember=380,maxDepotBagCount=875,needYb=0,needExp=105888359,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=2278,},{type=15,value=2278,},{type=19,value=2278,},},},--24级行会
-- {level=25,maxFBZ=1,maxMember=400,maxDepotBagCount=910,needYb=0,needExp=122237522,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=2532,},{type=15,value=2532,},{type=19,value=2532,},},},--25级行会
-- {level=26,maxFBZ=1,maxMember=420,maxDepotBagCount=945,needYb=0,needExp=141110995,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=2811,},{type=15,value=2811,},{type=19,value=2811,},},},--26级行会
-- {level=27,maxFBZ=1,maxMember=440,maxDepotBagCount=980,needYb=0,needExp=162898533,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=3118,},{type=15,value=3118,},{type=19,value=3118,},},},--27级行会
-- {level=28,maxFBZ=1,maxMember=460,maxDepotBagCount=1015,needYb=0,needExp=188050066,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=3456,},{type=15,value=3456,},{type=19,value=3456,},},},--28级行会
-- {level=29,maxFBZ=1,maxMember=480,maxDepotBagCount=1050,needYb=0,needExp=217084996,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=3828,},{type=15,value=3828,},{type=19,value=3828,},},},--29级行会
-- {level=30,maxFBZ=1,maxMember=500,maxDepotBagCount=1085,needYb=0,needExp=250602919,maxQLTZ=1,maxZQTZ=1,maxBHTZ=1,maxXWTZ=1,guildLevelWelfare={{type=11,value=4237,},{type=15,value=4237,},{type=19,value=4237,},},},--30级行会

------------------------------------------------------------
	},

	--语音聊天配置
	guildChat =
	{
		{
			gType = 1,		--语音类型 依次递增
			chatName = "IS",		--语音名称
			DownloadAddressD = "http://d.ispeak.cn/isdown.aspx",		--下载地址
			LickAddress = "http://www.ispeak.cn/isto/?",			--连接地址
		},

		{
			gType = 2,			--语音类型 一次递增
			chatName = "YY",		--语音名称
			DownloadAddressD = "http://www.yy.com/s/download.html",		--下载地址
			LickAddress = "http://yy.duowan.com/go.html#",
		},

		{
			gType = 3,			--语音类型 一次递增
			chatName = "QT",		--语音名称
			DownloadAddressD = "http://qt.qq.com/",		--下载地址
			LickAddress = "http://qt.qq.com/go.html#",
		},

	},

	FirstSbkAwards =				--首次沙巴克占领着获取奖励:元宝
	{
		{type = 15, id = 1, count = 50000, quality = 0, strong = 0, bind = 1, param = 0},
	},

	--首次守沙三次行会首领的奖励:元宝
	DefendSbkThreeAward =
	{
		{type = 15, id = 1, count = 5000, quality = 0, strong = 0, bind = 1, param = 0},
	},

	--首次守沙三次行会副首领的奖励
	DefendSenMonsterAward =
	{
		{type = 0, id = 736, count = 1, quality = 0, strong = 0, bind = 1, param = 0},
	},

	--主殿等级对应的最大行会资金
	BuildLevelMaxCoin = {20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000,20000000000},

	--达到最大行会资金可领取奖励
	MaxCoinReward = {
		{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 0},
		{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 0},
	},
	--根据行会等级进入行会秘境 guildLevel 行会等级mapId地图IDconsumeContribute消耗的贡献值 x,y传送点count一天进入次数time每次进入的时间
	SecretMap = {
		{guildLevel = 1,mapId = 47,consumeContribute = 100,x=100,y=100,count=1,time=7200},
		{guildLevel = 2,mapId = 48,consumeContribute = 200,x=100,y=100,count=1,time=7200},
		{guildLevel = 3,mapId = 49,consumeContribute = 300,x=100,y=100,count=1,time=7200},
		{guildLevel = 4,mapId = 49,consumeContribute = 400,x=100,y=100,count=1,time=7200},
		{guildLevel = 5,mapId = 49,consumeContribute = 500,x=100,y=100,count=1,time=7200},
	},

	GuildFlagBufs =
	{
		--行会战旗,行会等级每5级升1级战旗
-------------------------------
{{{type=12,value=0.04,},{type=16,value=0.04,},{type=20,value=0.04,},},--1级攻击战旗配置
{{type=24,value=0.05,},{type=28,value=0.05,},},},--1级防御战旗配置
{{{type=12,value=0.06,},{type=16,value=0.06,},{type=20,value=0.06,},},--2级攻击战旗配置
{{type=24,value=0.08,},{type=28,value=0.08,},},},--2级防御战旗配置
{{{type=12,value=0.09,},{type=16,value=0.09,},{type=20,value=0.09,},},--3级攻击战旗配置
{{type=24,value=0.12,},{type=28,value=0.12,},},},--3级防御战旗配置
{{{type=12,value=0.13,},{type=16,value=0.13,},{type=20,value=0.13,},},--4级攻击战旗配置
{{type=24,value=0.17,},{type=28,value=0.17,},},},--4级防御战旗配置
{{{type=12,value=0.18,},{type=16,value=0.18,},{type=20,value=0.18,},},--5级攻击战旗配置
{{type=24,value=0.23,},{type=28,value=0.23,},},},--5级防御战旗配置
{{{type=12,value=0.24,},{type=16,value=0.24,},{type=20,value=0.24,},},--6级攻击战旗配置
{{type=24,value=0.3,},{type=28,value=0.3,},},},--6级防御战旗配置



-------------------------------
	},
	
	-- 攻城战报名时间(ScriptTimer.lua 也要同步修改)
	SbkSignUpTime = {
		openDay = {3,4,5,6,7}, -- 新区第几天首次攻城
		combineDay = {3,4,5}, -- 合区第几天首次攻城(-1 则忽略合区状态)
		-- 攻城状态(1 为报名时间; 2 为攻城时间; 0 为可能是攻成时间,如首次攻城或合服后首次攻城)
		weekStates = {0,1,2,1,2,1,2}, -- 顺序为周日, 周一 到 周六
        
        week = {2,4,6},
	},

}
