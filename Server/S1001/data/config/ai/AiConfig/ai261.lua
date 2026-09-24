{
	-- = 战将 远程法师类型
	-- = ai类型,1表示被动ai,2表示主动ai,3表示固定路线寻路怪(有固定路径移动),4表示乱跑怪,5表示中立怪，6表示NPC，7表示宠物AI,
	aiType = 8,
	-- = 运动半径,将在这个半径里动来动去。对于逃跑怪,用这个设置每次逃跑的运动半径,
	patrolRadius = 3,
	-- = 追击范围，与目标的距离超过这个距离就回归,
	pursuitDistance = 13,
	-- = 可视范围，主动怪进入这个返回就将攻击,被动怪可以不配置,
	watchDistance = 7,
	-- = 离开巢位的最大的距离，一旦离开出生点超过这个距离就回归,
	leftHomeMaxDistance = 20,
	-- = 怪物回归的时候，将按什么比例恢复自己的HP,MP,这里填百分数，100就是100%,0就是0%,
	returnHomeRenewRate = 1,
	-- = 怪物停留的最小时间，单位是秒，怪物计算停留时间的时候是在 stopMinTime和stopMaxTime随机选一个,
	stopMinTime = 200,--30
	-- = 怪物停留的最大时间，单位是秒,
	stopMaxTime = 400, --80
	-- = 移动之间的停留，单位ms,
	moveStopInterval = 400,
	-- = 宠物离开主人的距离，超过这个将自动传送到主人的身边,
	petTransferDis = 15,
	-- = 宠物离开战斗后多少时间以后将往主人方向走，单位ms,
	petFollowMasterTime = 0,
	-- = 宠物离开主人超过这个距离，将向玩家移动
	battleFollowDis = 12,
	--宠物搜寻怪物范围
	searchRange = 10,
	--攻击速度
	attackspeed = 700,
	--战斗中检测敌人间隔时间
	checkenemyInterval = 500,
	skills = { 
--id表示技能id,level表示技能等级,autoCD 表示是否自动进入技能CD。如果配置为true，该技能会在进入战斗之后马上进入CD。主要用于避免高级技能在一开始就使用出来。
--event 表示在什么事件下释放，默认是0可以不配置,1表示死亡的时候触发,2表示刷出来的时候触发
	{id=204,level=1,event=0},
	{id=198,level=1,event=0},
	{id=205,level=1,event=0},


	},
	movePath = {
 		0,0,0,0, 
	},
},