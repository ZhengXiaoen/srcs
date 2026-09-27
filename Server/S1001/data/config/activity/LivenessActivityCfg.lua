--每日活跃度活动
LivenessActivityCfg =
{	
	--活跃度等级
	livenessLevels = {
		--1级
		{
			liveness = 30,
			awardbefore4 = {
				{type = 0, id = 511, count = 3, bind = 1}, --100万经验丹*3
				{type = 0, id = 537, count = 3, bind = 1}, --宝石结晶(100)*3
				{type = 0, id = 572, count = 3, bind = 1}, --圣珠结晶(100)*3
			},
			award = {
				{type = 0, id = 511, count = 3, bind = 1}, --100万经验丹*3
				{type = 0, id = 537, count = 3, bind = 1}, --宝石结晶(100)*3
				{type = 0, id = 572, count = 3, bind = 1}, --圣珠结晶(100)*3
			},
		},
		--2级
		{
			liveness = 80,
			awardbefore4 = {
				{type = 0, id = 511, count = 5, bind = 1}, --100万经验丹*5
				{type = 0, id = 537, count = 5, bind = 1}, --宝石结晶(100)*5
				{type = 0, id = 572, count = 5, bind = 1}, --圣珠结晶(100)*5
			},
			award = {
				{type = 0, id = 511, count = 5, bind = 1}, --100万经验丹*5
				{type = 0, id = 537, count = 5, bind = 1}, --宝石结晶(100)*5
				{type = 0, id = 572, count = 5, bind = 1}, --圣珠结晶(100)*5
			},
		},
		--3级
		{
			liveness = 150,
			awardbefore4 = {
				{type = 0, id = 511, count = 10, bind = 1}, --100万经验丹*10
				{type = 0, id = 537, count = 10, bind = 1}, --宝石结晶(100)*10
				{type = 0, id = 572, count = 10, bind = 1}, --圣珠结晶(100)*10
			},
			award = {
				{type = 0, id = 511, count = 10, bind = 1}, --100万经验丹*10
				{type = 0, id = 537, count = 10, bind = 1}, --宝石结晶(100)*10
				{type = 0, id = 572, count = 10, bind = 1}, --圣珠结晶(100)*10
			},
		},
		--4级
		{
			liveness = 240,
			awardbefore4 = {
				{type = 0, id = 6731, count = 500, bind = 1}, --培元丹*500
				{type = 0, id = 6914, count = 50, bind = 1}, --血炼精华(10颗)*50
				{type = 0, id = 6862, count = 50, bind = 1}, --坐骑丹*50
			},
			award = {
				{type = 0, id = 6731, count = 500, bind = 1}, --培元丹*500
				{type = 0, id = 6914, count = 50, bind = 1}, --血炼精华(10颗)*50
				{type = 0, id = 6862, count = 50, bind = 1}, --坐骑丹*50
			},
		},
		--5级
		{
			liveness = 350,
			awardbefore4 = {
				{type = 0, id = 6731, count = 1000, bind = 1}, --培元丹*1000
				{type = 0, id = 6914, count = 100, bind = 1}, --血炼精华(10颗)*100
				{type = 0, id = 6862, count = 100, bind = 1}, --坐骑丹*100
			},
			award = {
				{type = 0, id = 6731, count = 1000, bind = 1}, --培元丹*1000
				{type = 0, id = 6914, count = 100, bind = 1}, --血炼精华(10颗)*100
				{type = 0, id = 6862, count = 100, bind = 1}, --坐骑丹*100
			},
		},
	},

	--活跃度任务
	livenessTask = {
		--每日签到
		{--1 
			limitTimes = 1,----总10点
			score = 10,
			tips = "每次完成[每日签到]任务都可获得<10点>活跃奖励!",
			target = "@@showWin,92",
			name = "每日签到", 
			txt = "打开", 
		},
		--每日首充
		{--2
			limitTimes = 1, ---总25点
			score = 25,
			tips = "每次完成[每日首充]任务都可获得<25点>活跃奖励!（Boss元宝直充同样计入）",
			target = "@@showWin,34",
			name = "每日首充",
			txt = "打开", 
		},
		--微端登录
		{--3
			limitTimes = 1,----总10点
			score = 10,
			tips = "每次完成[微端登录]任务都可获得<10点>活跃奖励!", 
			target = "@@RightAreaClientLogonWin",
			name = "微端登录",
			txt = "打开", 
		},
		--奔跑
		{--4 
			limitTimes = 1, ----总15点
			score = 15,
			tips = "每次完成[跑吧老哥]活动都可获得<15点>活跃奖励!",
			target = "f沙漠土城:155:138:跑吧老哥",
			name = "跑吧老哥",
			txt = "传送", 
		},
		--除妖降魔
		{--5 
			limitTimes = 3, ---总共30点
			score = 10,
			tips = "完成1次[除妖降魔]任务可获得<10点>活跃奖励!",
			target = "f威龙城:97:107:战无双",
			name = "除妖降魔", 
			txt = "传送", 
		},
		--火烧炼狱
		{--6
			limitTimes = 1, ---总共20点
			score = 20,
			tips = "每次完成[火烧炼狱]任务可获得<20点>活跃奖励!",
			target = "f威龙城:149:151:炼狱",
			name = "火烧炼狱", 
			txt = "传送", 
		},
		--每日充值1000元宝
		{--7
			limitTimes = 1, ---总共30点
			score = 30,
			tips = "每日充值1000元宝可获得<30点>活跃奖励!",
			target = "@@recharge",
			name = "充值1000元宝", 
			txt = "打开", 
		},
		--神威狱
		{--8
			limitTimes = 1, ---总共15点
			score = 15,
			tips = "参加[神威狱]可获得<15点>活跃奖励!",
			target = "f沙漠土城:119:129:神威活动",
			name = "神威狱", 
			txt = "传送", 
		},
		
		{--9
			limitTimes = 1, ---总共15点
			score = 15,
			tips = "参加[皇宫大乱斗]可获得<15点>活跃奖励!",
			target = "f热血王城:138:134:军火商人",
			name = "皇宫大乱斗", 
			txt = "传送", 
		},
		--探索副本
		{--10
			limitTimes = 6, ---总共60点
			score = 10,
			tips = "每次完成1个[材料副本]可获得<10点>活跃奖励!",
			target = "f威龙城:131:171:副本管理员",
			name = "材料副本", 
			txt = "传送", 
		},
		--散人殿堂
		{--11
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "进入[散人殿堂]可获得<10点>活跃奖励!",
			target = "f威龙城:126:119:散人殿堂",
			name = "散人殿堂", 
			txt = "传送", 
		},
		--激情闭关
		{--12
			limitTimes = 1, ---总共15点
			score = 15,
			tips = "参加[激情闭关]可获得<15点>活跃奖励!",
			target = "f威龙城:131:124:激情闭关",
			name = "激情闭关", 
			txt = "传送", 
		},
		--个人boss
		{--13
			limitTimes = 2, ---总共20点
			score = 10,
			tips = "参加1次[个人boss]可获得<10点>活跃奖励!",
			target = "@@showWin,96",
			name = "个人boss", 
			txt = "打开", 
		},
		--押镖
		{--14
			limitTimes = 1, ---总共15点
			score = 15,
			tips = "参加[押镖]可获得<15点>活跃奖励!",
			target = "f威龙城:154:143:龙门镖局",
			name = "押镖", 
			txt = "传送", 
		},
		--寻宝
		{--15
			limitTimes = 1, ---总共25点
			score = 25,
			tips = "参加[寻宝]可获得<25点>活跃奖励!",
			target = "@@showWin,31",
			name = "寻宝", 
			txt = "打开", 
		},
		--膜拜城主
		{--16
			limitTimes = 1, ---总共15点
			score = 15,
			tips = "完成[膜拜盟主]可获得<15点>活跃奖励!",
			target = "f威龙城:132:152:武林盟主雕像",
			name = "膜拜盟主", 
			txt = "传送", 
		},
		--每日捐献
		{--17
			limitTimes = 1, ---总共20点
			score = 20,
			tips = "完成[每日捐献]可获得<10点>活跃奖励!",
			target = "@@showWin,164",
			name = "每日捐献", 
			txt = "打开", 
		},
		--强化装备
		{--18
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "完成[强化装备]可获得<10点>活跃奖励!",
			target = "@@showWin,5",
			name = "强化装备", 
			txt = "打开", 
		},
		--每日回收
		{--19
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "完成[每日回收]可获得<10点>活跃奖励!",
			target = "f威龙城:112:152:装备回收",
			name = "每日回收", 
			txt = "传送", 
		},
		----每日合成
		--{--20
		--	limitTimes = 1, ---总共10点
		--	score = 10,
		--	tips = "完成[每日合成]可获得<10点>活跃奖励!",
		--	target = "f威龙城:125:139:初级锻造师",
		--	name = "每日合成", 
		--},
				--战将合体
		{--20
			limitTimes = 1, ---总共20点
			score = 20,
			tips = "完成[战将合体]可获得<20点>活跃奖励!",
			target = "@@showWin,118",
			name = "战将合体", 
			txt = "打开", 
		},
		--神炉提升
		{--21
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "完成[神炉提升]可获得<10点>活跃奖励!",
			target = "@@showWin,129",
			name = "神炉提升", 
			txt = "打开", 
		},
		--内功升级
		{--22
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "完成[内功升级]可获得<10点>活跃奖励!",
			target = "@@showWin,1,2",
			name = "内功升级", 
			txt = "打开", 
		},
		--组队操作
		{--23
			limitTimes = 1, ---总共10点
			score = 10,
			tips = "完成[组队操作]可获得<10点>活跃奖励!",
			target = "@@showWin,25",
			name = "组队操作", 
			txt = "打开", 
		},
		----战将合体
		--{--24
		--	limitTimes = 1, ---总共10点
		--	score = 20,
		--	tips = "完成[战将合体]可获得<10点>活跃奖励!",
		--	target = "@@showWin,118",
		--	name = "战将合体", 
		--},
		----世界BOSS
		--{--25
		--	limitTimes = 1, ---总共15点
		--	score = 15,
		--	tips = "参加[世界BOSS]可获得<15点>活跃奖励!",
		--	target = "f沙漠土城:131:124:激情闭关",
		--	name = "世界BOSS", 
		--},
	},
} 
