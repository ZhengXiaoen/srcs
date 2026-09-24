--全局的配置，一些零散的配置放在这里读取      w   w w .  c n 1   2 1. c    o m

GlobalConfig=
{
    serverName = "散人传说",    --服务器名称
	maxLevel = 150,				--玩家的最大等级
  	monsterItemRefreshTime =120000, --怪物掉落物品的刷新时间，单位毫秒
	transferDistanceSquare = 1,      --实体和传送门的距离，如果是0格填0，1格就填1,2就填2,3就填3 王城皇宫的传送点需为0
	teamLootMaxDistanceSquare = 400,--队伍杀怪拾取的共享的最大的距离的平分
	sceneRefreshMonsterTime = 4,	--场景中刷怪的时间限制，单位：毫秒
	entityRunTime = 4,				--每次逻辑循环非玩家实体执行runone的限制总时间，单位：毫秒

	initSceneId = 9,		--初始化场景ID，当地图销毁或者改变，这默认登陆到炎龙城
	initScenePosX = 135,		--场景坐标x
	initScenePosY = 134,		--场景坐标y
	
	nOnlineCountBase = 1000,		--在线人数超过nOnlineCountBase人 怪物翻倍

	--副本系统相关
	daySingleCount = 4, 	--玩家每天可进入单人副本的次数
	dayTeamCount = 4,		--玩家每天可进入队伍副本的次数
	dayTeamHeroCount = 4,	--玩家每天可进入英雄队伍副本的次数        
	dayGroupCount = 4,		--玩家每天可进入团队副本的次数
	dayGroupHeroCount = 4,	--玩家每天可进入英雄团队副本的次数  
	fubenDestoryTime = 5,	--当副本没有人，则过一段时间会删除这个副本（释放内存），单位：分钟
	maxEnergy  =600,        --玩家每天最大的活力的值
	energyRfreshRate = 120, --每分钟恢复多少点活力
	energyConsumeRate =10,  --挂机的时候每分钟消耗的活力点数   
    
	baseMaxJumpPower = 300,   --玩家的基础轻功
	maxJumpLength =7,         --玩家的最大跳跃距离
	baseJumpPowerRenew = 20, --每5秒恢复多少点轻功
	
	fCriticalStrikesDamage =1.5, --默认的暴击的伤害比例
  
	baseMaxXiuwei  = 60000,            --玩家不学习经脉需要的修为
	baseXiuweiRenew  =0,          --基础的修为的回复速度，24秒回复多少点
	openFcm  = false,               --是否开启防沉迷true，开启防沉迷后， SessionServer 配置中autoaccount要改为0，否则玩家登录时帐号表中的identity字段会自动改为成年人的身份证号码
	fcmHalfExpMoneyTime = 180,  --防沉迷开始经验、金钱减半的时间(单位分)
	fcmZeroExpMoneyTime = 300, --防沉迷开始经验、金钱没有的时间(单位分)

	challengeLevelLimit = 3,		--擂台系统中可挑战的等级差距，等级差距过大不允许做对手，默认是3
	worldChatYuanBao =500,		 --世界喊话大喇叭的扣除元宝
	worldChatItemId =516,			 --世界喊话大喇叭的物品ID
	gatherbasevalue	= 100,			-- 采集体力基础值
	durKillCdTime =5000,           --连斩的CD冷却的时间,这个读取，暂时写死
	durKillAwardTimes = 100,       --每满多少个连击给玩家奖励(加buff) 
	maxPlayerLevel = {80,1,5},		-- 玩家最大等级 {基数, 间隔, 加成数} 公式=基数+(转数/间隔*加成数)
	hpSourceDelayTime = 10000,		-- pk中加血源泉生效延迟时间（单位秒）
	mpSourceDelayTime = 10000,		-- pk中加蓝源泉生效延迟时间（单位秒）
	maxZhanhunvalGetEveryDay = 19000,		-- 玩家每天可获得的战魂值上限
	maxZhanHunVal = 250000,					-- 玩家可获得的最大战魂值上限
	nearChannelChatCD = 5,				-- 附近频道聊天CD（秒为单位）
	hornChannelChatCD = 0,				-- 传音频道聊天CD（秒为单位）
	guideChannelChatCD = 0,				-- 公会(帮派)频道聊天CD（秒为单位）
	localMapChannelChatCD = 5,		-- 本地图聊天CD	（秒为单位）
	occupationChannelChatCD = 5,	-- 门派频道聊天CD（秒为单位）
	worldChannelChatCD = 10,         -- 世界频道聊天CD （秒为单位）
	sellChannelChatCD = 10,				--出售频道聊天（秒为单位）
	worldChanChatCDOfKungFuMaster = 5, -- 武林盟主世界聊天频道CD（秒为单位）
	secretChannelChatCD = 3,				-- 私聊频道聊天CD（秒为单位）
	teamChannelChatCD = 3,				-- 队伍频道聊天CD（秒为单位）
	friendChannelChatCD = 3,				-- 好友频道聊天CD（秒为单位）
	

	--耐久减少 计算 
	--武器为攻击一次时触发，衣服与其他防具为角色每受到一次攻击时触发
	--如武器耐久计算为：每攻击weaponEndureConsTotalCnt次，绝对命中weaponEndureConsRandCnt次，具体在哪次命中，这个具有一定的随机性
	--耐久减少值为weaponEndureConsLowerLimit到weaponEndureConsUpperLimit随机一个值
	weaponEndureConsTotalCnt = 1,    --武器耐久消耗：一个周期总次数
	weaponEndureConsRandCnt  =1,     --武器耐久消耗：一个周期命中次数	
	weaponEndureConsLowerLimit =1,   --武器耐久每次消耗下限
	weaponEndureConsUpperLimit =3,   --武器耐久每次消耗上限

	dressEndureConsTotalCnt =2,      --衣服耐久消耗：一个周期总次数
	dressEndureConsRandCnt =1,      --衣服耐久消耗：一个周期命中次数

	dressEndureConsLowerLimit =1,   --衣服耐久每次消耗下限
	dressEndureConsUpperLimit =4,   --衣服耐久每次消耗上限	

	
	armorEndureConsTotalCnt =3,      --衣服外的其它防具耐久消耗：一个周期总次数
	armorEndureConsRandCnt =1,        -- 服外的其它防具耐久消耗：一个周期命中次数
	armorEndureConsLowerLimit =1,   --衣服外的其它防具耐久每次消耗下限
	armorEndureConsUpperLimit =5,   -- 衣服外的其它防具耐久每次消耗上限
	
	endureConsRateOnDeath =5,       --死亡时扣除耐久的比例(百分比）

	equipInsureGold = 1000,		--装备投保一次需要的手续费金币数

	maxConsecutiveKillLvlDiff =100,    --连斩玩家和怪物最大等级差

	-- 各个聊天频道发言最低等级限制 (转数*1000 + 等级)
	--分别对应于：私聊、附近频道、传音、帮派、队伍、团队、地图、系统提示、阵营频道、系统频道、世界频道、呼救频道、出售频道
	chatLevelLmt = {72, 72, 72, 72, 1, 7, 72, 1, 1, 0,72,1,1}, --这个已经废弃了- 频道都用一样的等级
 
	friendChatLmt = 30, -- 好友聊天最低等级 (转数*1000 + 等级)
	leaveBattleTime = 4,					-- 玩家空闲状态后到脱离战斗所需要的时间（秒为单位）
	
	minStoreBuyYuanbaoCount =1000,         --一次消费多少元宝将全服播报


	maxSmithCount = 65535,            --最大的精锻度，策划配置这个数值控制精锻度	
	stopServerNoticeTime = 15,		--停服前每隔多少时间发布一次公告，单位是秒
	guiderTitleId =35,                  --新手管理员的称号的ID
	bindYuanbaoLimit = 80000000,		--绑定元宝上限
	maxPetAptitude= 1200,                 --最大的宠物资质的上限

	freeWorldChannel = 0,                --世界频道聊天所需费用
	fcmCloseHourSinceOpen =72,             --服务器开服的多少小时关闭防沉迷

	minPetSlotCount =3,                   --最少的宠物槽的个数
	maxPetSlotCount =6,                   --自大的宠物的槽的个数
	petMergePropertyRate= 1.0,            --宠物合体的时候百分比的装备和精锻的属性合并到玩家身上
	petLevelAboveOwner =5,                --宠物最多等级高出玩家的等级

	maxPetLoyalty=6000,                    --最大的宠物忠诚度
	petBattleMinLoyalty = 570,            --宠物出战要求的最小忠诚度
	petMergeMinLoyalty = 570,              --宠物合体要求的最小的忠诚度
	petDeathDropLoyalty =300,              --宠物每次死亡掉的忠诚度
	petMergeLoyaltyDropPerMinite =-6,      --宠物合体状态每分钟的忠诚度改变的值
	petNormalLoyaltyDropPerMinite =-6,     --宠物放出状态每分钟的忠诚度改变的值  
	petMaxSmithCount =1900,                 --宠物的最大的精锻度
	petDeathHpRate = 0.2,                  --宠物复活的时候恢复多少血
	teacherGiftMinGridCount =1,            --领取师徒的奖励需要至少留出多少个空格 
  	petMaxSkillSlotCount =8 ,              --宠物最大的技能槽位数目
  	commonServerEntrSceneId=147,			-- 跨服服务器入口场景ID  
	logoutReserverTime=300,					-- 玩家在跨服下线后保持时间（秒为单位），超过这个时间下次再上线就回到原始服务器 
  	commonServerMsgFilter={			-- 跨服角色消息过滤	屏蔽上行消息
		--格式：sys子系统号和msg消息号表。消息号表为{}表明是屏蔽子系统的所有消息
  		{ sys=10, msg={}, },	
  		{ sys=13, msg={}, },
		{ sys=20, msg={}, },
  		{ sys=21, msg={}, },
  		{ sys=25, msg={}, },
  		{ sys=27, msg={}, },
		{ sys=29, msg={}, },
  		{ sys=31, msg={}, },
  		{ sys=32, msg={}, },
  		{ sys=37, msg={}, },
  		{ sys=38, msg={}, },
		{ sys=41, msg={}, },
		{ sys=131, msg={}, },
		{ sys=138, msg={}, },
  		{ sys=139, msg={1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,
		29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,60,61,62,63,64,65,66}, },
		{ sys=142, msg={}, },
  	},	
	mainQuestPetExpMaxLevel = 70,				--主线任务中，等级内宠物可以得到经验
	fQuestDoubleAwardRate = 0.6,				--双倍奖励计算系数
	fQuestAcceptAgainRate = 0.4,				--再次接任务的系数
	fQuestSpeedFinishRate = 0,				--快速完成任务系数  w  w w .   c n 1 2 1 . c o m

    nMaxCalLuckValue =20,    --计算中最大的幸运的值，超过这个就取最大攻击  2018/5/10 王锦
    nMaxCalCurseValue =20,    --计算中最大的诅咒的值，超过这个就取最小攻击 2018/5/10 王锦

	
    fHpRenewRate =0.013,     --HP恢复的时候，基础的点数= maxhp * fHpRenewRate + nHpRenewAdd
	
	nHpRenewAdd =1,         --HP恢复的时候，基础的点数= maxhp * fHpRenewRate + nHpRenewAdd
	
	fMpRenewRate =0.0555,     --MP恢复的时候，基础的点数= maxMp * fMpRenewRate + nMpRenewAdd
	 
    nMpRenewAdd =1,   	    --MP恢复的时候，基础的点数= maxMp * fMpRenewRate + nMpRenewAdd

   nDropItemExpireTime =90,  --掉落在地上的物品的存活时间,单位秒
   
   nDropItemMasterProtectTime =30,  --掉落在地上的物品属于他的主人的时间,单位秒
 
   dropCoinCounts={1,50,200,1000,2000}, --掉落在地上的金币，在各范围里图标不同，这里标记不同范围的金币的范围,分别表示1，30，60,100,300,1000以上的图标
   dropCoinIcons ={20004,20004,20004,20004,20004},          --掉落在地上的道具，在dropCoinCount范围里的图标的id
   dropYuanBaoCounts={1,50,100,500,1000}, --掉落在地上的元宝，在各范围里图标不同，这里标记不同范围的元宝的范围,分别表示1，30，60,100,300,1000以上的图标
   dropYuanBaoIcons ={20104,20104,20104,20104,20104},          --掉落在地上的元宝，在dropYuanBaoCounts范围里的图标的id

   monsterMaxCoinOneDrop  =2000, --怪物掉落的金币，每堆的最大值
   monsterMaxYuanBaoOneDrop  =2000, --怪物掉落的元宝，每堆的最大值

   monsterMaxBindYuanBaoOnDrop = 2000,--怪物掉落绑定元宝，每堆的最大值


   monsterVectResetInterval = 60000,	--怪物归属重置间隔(单位ms)(5s没有打怪，清除怪物原来归属)

   nPetMaxLevel = 7, --宠物最大的等级
   nFireMaxTime = 60000, --火墙的最大时间，单位ms

   nPkWeaponDownLuckRate = 5000,	--武器幸运值下降
   nRedNamePkValue = 200,			--红名pk值
   fWriteNameBagDropRate = 0.02,	--白名背包掉落系数
   fWriteNameEquipDropRate = 8,	--白名装备掉落系数
   fRedNameBagDropRate = 1,			--红名背包掉落系数
   fRedNameEquipDropRate = 3,		--红名装备掉落系数
   nWriteNameBagDropNum = 3,		--白名背包掉落最大数量
   nRedNameBagDropNum = -1,			--红名背包掉落最大数量，-1表示全部掉出
   nWriteNameEquipDropNum = 1,		--白名装备掉落最大数量
   nRedNameEquipDropNum = 2,		--红包装备掉落最大数量
   --分别表示武器,衣服,头盔,项链,勋章,左边手镯,右边手镯,左边戒指,右边戒指,腰带,鞋子,宝石,材料,时装,翅膀,神器,足迹,盾牌,官印,左边特殊戒指,右边特殊戒指,法宝,护心境(吊坠)，护肩()，护肘(面甲)，护膝，护踝(勋章)  的掉落的概率
   equipDropPartRates = {100,100,100,100,0,100,100,100,100,100,100,0,0,40,0,40,0,0,0,100,100,0,60,60,60,60,60,0,0,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100},
   
   fHeroWriteNameEquipDropRate = 150,	--英雄白名装备掉落系数
   fHeroRedNameEquipDropRate = 2,		--英雄红名装备掉落系数
   nHeroWriteNameEquipDropNum = 1,		--英雄白名装备掉落最大数量
   nHeroRedNameEquipDropNum = 2,		--英雄红包装备掉落最大数量
   --分别表示武器,衣服,头盔,项链,勋章,左边手镯,右边手镯,左边戒指,右边戒指,腰带,鞋子,宝石,材料,时装,翅膀,神器,足迹,盾牌,官印,左边特殊戒指,右边特殊戒指 的掉落的概率
   heroEquipDropRates = {2,10,15,50,30,100,100,75,75,35,35,35,0,1,0,1,0,10,0,75,75},
   

   nStallModelId = 110,				--摊位模型id
   nStallSendAdCoin = 5000,			--发送摊位广告需要的金币

   
   
   showAppearSuit = 0,				--显示套装光效的套装ID
   suitAppears = {5001,5001,5002,5002,5002,5003,5003,5003,5004,5004},	--套装件数对应显示的套装光效ID {1件套装, 2件套装, .......} 

   nDamageDropShieldBuffTime =1,  --每次伤害降低法师的魔法盾buff的时间,单位秒
   nDamageDropShieldBuffTimeRate = 20, --每次伤害降低法师的魔法盾buff的时间的概率

   nAppendPhysicalDamageEffectId =1,  --战士的攻杀剑术触发附加伤害时候播放的特效id
   nAppendPhysicalDamageEffectKeepTime = 1000, --战士的攻杀剑术触发附加伤害时候播放的特效的播放时间

   nDamage2SelfHpEffectType =4,   --翅膀效果，给对方伤害，自己加血播放的特效类型
   nMinDealLevel =65,           --最低的交易等级，低于这个无法交易


   nDamage2SelfHpEffectId =37,  --翅膀效果，给对方伤害，自己加血播放的特效id
   nDamage2SelfHpEffectKeepTime = 400, --翅膀效果，给对方伤害，自己加血播放的特效持续时间
   nMaxDamage2SelfHp = 200000, --翅膀效果，给对方伤害，自己加血的最大值




   nDamageReduceEffectId =127,             --法宝的伤害减免播放的特效id
   nDamageReduceEffectKeepTime = 700,     --法宝的伤害减免特效持续时间

   nDamageAddEffectId =128,                --法宝的伤害追加播放的特效id
   nDamageAddEffectKeepTime = 700,        --法宝的伤害追加特效持续时间

   nIgnorDefenceEffectId =129,             --法宝的无视防御播放的特效id
   nIgnorDefenceEffectKeepTime = 700,     --法宝的无视防御特效持续时间

   nReliveRingId =551,    --复活戒指的id
   nReliveRingCd =60000,  --复活戒指的cd
   nReliveRingDura=1000,    --每次使用复活戒指降低的耐久
   nReliveEffectId =37,  --复活戒指复活的效果id
   nReliveEffectKeepTime =800,  --复活戒指复活特效的持续时间
   nReliveEffectType =4,   --复活戒指加的特效的类型
	
   
   nStallMinGrids = 30,			--摆摊中最少格子数量
   nStallMaxGrids = 30,			--摆摊中格子最高数量

   nDizzyBuffGroupId =81,     --麻痹添加的buff的组id

   nDizzyBuffTime =5,  --麻痹buff的时间，单位秒

   nDizzyBuffColorPriority =10,  --麻痹buff的颜色优先级

   nDizzyBuffColor =11645361,  --麻痹buff的颜色
   
   nTransmitProtectBuffId = 91,	--传送保护buff持续Id


   nMaxAngerValue = 2000,	--最大怒气值

   nBuyItemGetPointRate = 10, --购买商城物品得到的积分	

   nHeroExpItemYbCount=88,    --英雄增加熟练度的道具卖的元宝的数目
   nHeroExpItemId = 832,      --英雄增加熟练度的道具的id
   nMaxHeroCount =4,          --只能最多拥有英雄的个数
   nHeroOpenDay = 1,			--开服第X天 开启英雄系统
   --nHeroMaxLevel = 70,			--英雄最高等级(取消 使用玩家等级)
   nHeroNameColor = 13408614,			--英雄名字颜色

   nDiamondpointRate = 3,			--魂石评分的基数
   
   nMonsterAttackMusicRate =10,     --普通怪物攻击发出声音的概率,1表示百分之1
   nMonsterDieMusicRate =10,        --普通怪物死亡发出声音的概率,1表示百分之1
   nMonsterTargetMusicRate =10,     --普通怪物发现目标发出声音的概率,1表示百分之1
   nMonsterDamageMusicRate =10,     --普通伤害声音的概率,1表示百分之1\

   nUpdateMonsterDeadMins = 45,		--每小时中，第几分钟去统计怪死亡次数

   PetColors = {
		--{0,255,255,255},    --一级宠物颜色
		--{0,0,255,255},		--二级宠物颜色
		--{0,138,215,245},    --三级宠物颜色
		--{0,60,180,240},		--四级宠物颜色
		--{0,120,140,250},	--五级宠物颜色
		--{0,0,120,215},		--六级宠物颜色
		--{0,20,70,220},		--七级宠物颜色
		{0, 204, 153, 102},	--一级宠物颜色
		{0, 204, 153, 102},	--二级宠物颜色
		{0, 204, 153, 102}, --三级宠物颜色
		{0, 204, 153, 102}, --四级宠物颜色
		{0, 204, 153, 102}, --五级宠物颜色
		{0, 204, 153, 102}, --六级宠物颜色
		{0, 204, 153, 102}, --七级宠物颜色
   },
   quickTimeKick=3,                 --加速了几次就麻痹（小于0则半闭）
   quickRate=0.12,                   --判断加速的阈值
   quickSoftNoticeLv = 40,			 --外挂在使用时，该等级以上的玩家才提示

   nSpeedFinItemId = 0,			--加速完成任务扣的物品id
	
   nChatSaveLogFlag		= 0,		--聊天内容是否存盘，默认是不存，大于0表示存

   nGoldEggItemId = 0,			--金蛋物品ID

   nMaxAgainQuest = 10,				--最大重复任务次数

   n2StepSkillHitRate =10000,                    --技能攻击的时候，距离2格命中的概率，1表示万分之1 9000
   n3StepSkillHitRate =10000,                    --技能攻击的时候，距离3格命中的概率，1表示万分之1	 7000
   n4StepSkillHitRate =10000,                    --技能攻击的时候，距离4格命中的概率，1表示万分之1 3000

   nYbLuckAwardCount = 20,			--幸运大抽奖需要元宝
   nYestodayMinPoint = 1000,		--昨天消费排行最小消费值
   nAllConsumeMinPoint = 10000,		--累积消费排行最小消费值

   nGmTitleId = 15,					--gm的头衔id

   nHuntWeaponId = 14,				--周末活动统一玩家武器id
   nGmFlagLevel = 10,					--Gm在这个等级及以下就显示高级客服系统按钮
   nTeamCallerItemId = 0,			--队伍中召唤令物品ID
   nTeamCallerBindItemId = 0,		--队伍中召唤令限时物品ID


   n8RedPacketItemId = 0,		--8元宝红包
   n88RedPacketItemId = 0,		--8元宝红包
   n888RedPacketItemId = 0,		--8元宝红包
	nAutoSilencing = 2,			-- 自动禁言，玩家连续发多少次相同内容就禁言
	nAutoSilencingSecond = 30, -- -- 自动禁言时长，单位是秒 43200=12 * 60 * 60
    nChatIntervalSecond =3, --每次聊天间隔
	nBookQuestId = 8063,			--天书任务ID
	nHotSpringSceneId = 84,			--温泉池中的场景
	nHotSpringPoolX = 61,				--池中的坐标x
	nHotSpringPoolY = 57,				-- 池中的坐标y
	nHotSpringPoolMax = 5,				--温泉池中最多多少人	
	nEnterJailPkValue = 200,			--进监狱pk值(-1则不启用)
	nExitJailPkValue = 50,				--出监狱pk值
	nJailSceneId = 108,					--监狱场景ID
	nDoubleExpOpenServerDay = -1,		--开服多少天双倍经验(-1则不启用)    填3 则开服前3天双倍经验
	nOfflineExitTime = 0, 		--玩家离线退出游戏时间（秒），0则不启用，86400=3600*24
	nOfflineMinLevel = 90,              --玩家离线的等级限制
	nOfflineMaxNum = 100,			--单场景的离线玩家数量限制
	nOfflineHourNum = {202,191,175,166,149,141,132,122,145,152,167,181,190,211,222,235,240,219,208,199,222,230,235,210}, --离线玩家的数量(0到23点)
	fOnlineCountRate = 0, --在线人数倍率（<=1为实际人数），实际人数大于10时才有效
	nMaxBottlesExp = 100000000,	--人物经验瓶存储值
	nOpenBottlesLevel = 60,		--开启经验瓶收集经验等级
	nMonsterExpRate = 10,		--杀死怪物自身配置表死亡掉落经验(身上buff或者活动双倍的多倍经验不计算)*这个倍数=每次杀死怪获得存储在经验瓶数值
	nSpeedCheckFlag = 1,		--启用所有的加速检查(版署服暂时关闭)
	nOpenSpeedVerify = 0,		--打开加速检查，默认关闭吧
	nLoginIpLimit = 200,		--登陆IP数量限制，0和负数则不限制
	shieldYbCount = 2000,		--护体神盾背包元宝数限制（>=可开启，<则关闭），0则不启用该功能
	printLoginLog = 0,			--是否打印登录日志（0:不打印；1:打印）
	hookMapList = {104, 105, 106}, -- 挂机地图
	tuchengSceneId = 83,		--土城场景ID
	huanggongSceneId = 11,		--皇宫场景ID
	juntuanZhanSceneId = 107,	--军团战场景ID (StdActivityCfg.JuntuanZhan.sceenId)
	SpellStopTick = 0,		--施法停留时间
    guildNotSignUp = 1,         --行会攻城战取消报名
    diecountdropequip = 3,      --死亡多少次掉落装备
    diedropequiprate = 5000,    --掉落装备的几率 万分比
    notcountdropequip = 3,      --有几件装备不掉落装备
	notdropequippos ={13,15,40,41,42,43,44,45,46,47}, --神装位置不掉落
    PetAttributeCfg =  --道士宝宝召唤出来属性加成
    {
        hp_rate = 1,    --hp倍率
        attack_rate = 0.3,  --攻击倍率
        crit_rate = 0,  --暴击力倍率
        resistance_crite_rate = 0,--抗暴率
        taostrong_attackmin = 100,  --1点道士强化属性点等于多少最小攻击
        taostrong_attackmax = 200,  --1点道士强化属性点等于多少最大攻击
        taostrong_hp = 2000,        --1点道士强化属性点等于多少血量
    },
    GuildDepotContriRate = 0, --行会仓库取出扣除贡献度增加 百分之10
    BossAddHPSec = 10000,  --boss回血定时器
    BossAddHPRate = 0.005,   --回血百分比
    DayMonsterDropCount = 
	{
        20, --7转套,限制每周最多产出20件
        10, --9转套,限制每周最多产出10件
        2,--11转套,限制每周最多产出2件
	},
    GuildCapitalMax = 200,  --行会资金池最高上限
    
    Robot = {	--机器人自动开启设置
		openday=1, --开服天数
		count = 2000, --机器人总数  w  w w .  c  n 1 2 1.   c   o m
		sec = 5, --每5秒创建一个
	}, 
    NewPK = 
    {
    	---------    	
        DropJewRate = {0, 100}, --饰品掉落几率 [万分比]  几率一定要比DropAllRate的低，不然就总是会掉饰品       
        DropAllRate = {101, 601}, --百分之一几率 [万分比] --  角色死亡后掉落穿戴中的装备几率  20170613 王锦 
        DragonSlayingRate = {602, 603}, --死亡掉落至尊屠龙和至尊衣服几率 [万分比]   20171229 王锦
        ZhizunRate = {604, 614}, --死亡掉落至尊屠装备几率(除了至尊屠龙和至尊衣服之外) [万分比]  2018/5/10 王锦
		
		LongTengEquipmentRate = {615, 645}, --死亡掉落龙腾武器衣服 [万分比]   2018821 王锦  30
        LongTengOtherRate = {646, 726}, --死亡掉落龙腾首饰几率 [万分比]  2018/2/21 王锦 80 
        ---------       
        
        WhileNameDropCount = 1, --白名掉落装备最大数量 --未用 20170613王锦
        RedNameDropCount = 2,   --红名掉落装备最大数量--未用 20170613王锦
        DieRate = 1000, --百分之十几率进入掉装备处理 [万分比]--未用 20170613王锦
        WeaponRate = 800,--进入DropAllRate 后随机的几率会把武器算进去 [万分比]   20170830 王锦
        DressRate = 800,   --进入DropAllRate 后随机的几率会把衣服算进去 [万分比]  20170830 王锦
        
    },


    MaxDodgeRate = 1.35, --最大闪避值倍数
    AttackSuperManBuffId = 402,--被攻击无敌buffid
    AttackSuperManCD = 600,  --被攻击无敌冷却  单位/秒
    AttackResistCD = 600,    --被攻击抵挡冷却 单位/秒
    biantaiVersion = true, --是否变态版
}