-- 活动大厅面板
--#include "..\..\language\LangCode.txt" once

StdActivityCfg = {
----------------------------------------
--闭关修炼		09:50-10:00	14:50-15:00	23:50-00:00
----------------------------------------
	BiGuanXiuLian = {
		id = 1,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0001,				-- 活动名称
		timeDesc = Lang.dayactivity.time0001,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0001,           -- 参与条件
		entrance = Lang.dayactivity.talk0001,			-- 活动入口
		desc = Lang.dayactivity.desc0001,        		-- 活动描述
		rewardicon = {"iaward#4#1", "iaward#16#1",},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)收益统计:>\\    <(iaward#2#1)><(c0xFF00ff00)经验 x $value1$>\\    <(iaward#16#1)><(c0xFF00ff00)护盾结晶 x $value2$>",
		-- 活动规则
		activityCfg = "\\    1.场景内每8秒可获得一次奖励,人数越少每次获得的奖励更丰厚\\    2.光圈内可享受多倍奖励:红圈(4倍)、橙圈(3倍)、紫圈(2.5倍)、蓝圈(2倍)、绿圈(1.5倍)\\    3.活动地图内PK不增加PK值、死亡不掉落",
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value3$>",
		
		-- 开放时间
		--{{开始时间(9:50)，结束时间(10:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{9,  50, 10, 0,},
				{14, 50, 15, 0,},
				{23, 50, 0,  0,},
			},
		},
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"闭关修炼", "沙漠土城", 140,101, "我也要参加"},
		
		sceneid = 67,		-- 活动场景id
		level = 80,			-- 进入等级
		second = 8,			-- 每8秒获取一次奖励
		
		-- 位置倍数
		tPosMultiple = {
			-- {x, y, 奖励倍数, 光圈颜色,}
			{45, 45, 4, "<(c0xFFff0000)红色>",},
			{49, 49, 3, "<(c0xFFff8a00)橙色>",},
			{41, 41, 2.5, "<(c0xFFde00ff)紫色>",},
			{40, 50, 2, "<(c0xFF00c0ff)蓝色>",},
			{50, 40, 1.5, "<(c0xFF00ff00)绿色>",},
		},
		
		-- 人数奖励分配
		tReward = {
			-- {最小人数, 最大人数(-1不限制), 经验, 护盾碎片数量}
			{51, -1, 100000, 28,},
			{29, 50, 200000, 38,},
			{9, 28, 350000, 48,},
			{3, 8, 450000, 68,},
			{1, 2, 600000, 118,},
		},
	},
----------------------------------------
--[[巨魔之巢		10:30-12:30	21:30-23:30
----------------------------------------
	JuMoZhiChao = {
		id = 2,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0002,				-- 活动名称
		timeDesc = Lang.dayactivity.time0002,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0002,           -- 参与条件
		entrance = Lang.dayactivity.talk0002,			-- 活动入口
		desc = Lang.dayactivity.desc0002,        		-- 活动描述
		rewardicon = {"iaward#2#1", "iaward#24#1", "iaward#6#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)剩余怪物: ><(c0xFFff0000)$value1$/$value2$>\\\\<(c0xFF00c0ff)活动奖励:>\\    <(iaward#2#1)><(iaward#24#1)><(iaward#6#1)>",
		
		-- 活动规则
		activityCfg = "活动规则：\\    1.活动共9层,每层都有大量精英怪和BOSS怪\\    2.第4层开始需击杀完该地图内所有怪物方可进入下层\\    3.层数越高BOSS掉落越丰厚",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value3$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{10, 30, 12, 30,},
				{21, 30, 23, 30,},
			},
		},
		
		level = 70,			-- 进入等级
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"巨魔之巢", "沙漠土城", 110, 105, "我也要参加"},
		
		-- 场景列表
		scenes = {107, 108, 109, 110, 111, 112, 113, 114, 115},
		-- 从第4个场景开始需要杀完所有怪后才能进入下一个场景
		killAllSceneIdx = 4,
	},  ]]
----------------------------------------
--怒杀白猪		10:00-11:00	
----------------------------------------
	QuanFuShuangBei = {
		id = 3,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0003,				-- 活动名称
		timeDesc = Lang.dayactivity.time0003,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0003,           -- 参与条件
		entrance = Lang.dayactivity.talk0003,			-- 活动入口
		desc = Lang.dayactivity.desc0003,        		-- 活动描述
		rewardicon = {"iaward#2#1"},	-- 奖励图标
		level = 80,
		-- 活动跟踪小窗口
		tracktxt = "",
    
		-- 活动规则
		activityCfg = "",
		
		-- 剩余时间
		residuetime = "",

		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{18, 00, 18, 45,},
				
			},

			lefttime = 3600,
        
          
          
		},
		refresh =
          {
            monid=344,
            sceneid = 83, --刷新的场景id
            --怪物刷新坐标点-每个坐标点会刷新一个怪物
            point = 
            {
                --{x=171,y=108,},
                {x=164,y=105,},
				--{x=162,y=96,},

            },
            exprate = 0.2, --十分之一经验
          },	
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"怒刷白猪", "沙漠土城", 166,107, "我也要参加"},

		--buffid = 107, -- 双倍经验buff, 下线不保存
		-- 
		tTelport = {"危险区域", "沙漠土城", 166, 107,},
	},
----------------------------------------
--多倍押送		13：30--14:00、18:00--18：30  
----------------------------------------
	DuoBeiYaSong = {
		id = 4,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0004,				-- 活动名称
		timeDesc = Lang.dayactivity.time0004,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0004,           -- 参与条件
		entrance = Lang.dayactivity.talk0004,			-- 活动入口
		desc = Lang.dayactivity.desc0004,        		-- 活动描述
		rewardicon = {"iaward#5#1", "iaward#9#1"},	-- 奖励图标
		
		--预告时间标识
		trailStr = "onBroadcast_DuoBeiYaSong_StartBefore5",
		
		-- 活动跟踪小窗口
		tracktxt = "$value1$<(c0xFFff0000)>\\<(c0xFF00c0ff)运镖时间：><(c0xFFff0000)$value3$>\\<(c0xFF00c0ff)镖车奖励：><(c0xFFff0000)$value4$>",

		activityCfg = "\\1.护送镖车需要缴纳押金，镖车品质不同，所需押金也不同.\\2.押送成功后返还全额押金，并获得押镖奖励.\\<(c0xffff0000)3.未按时交镖（10分钟内）、被劫镖，算押镖失败，不返还押金.>\\4.白金、钻石、王者镖车被劫镖（镖车血量为0、人物死亡），劫镖者\\  可以获得押镖者缴纳的75%押金，另20%返还押镖车，5%系统扣除.\\<(c0xffff0000)5.白金、钻石、王者镖车被劫镖后，会返还一次押镖机会.>\\6.每日押镖浓缩为1次，奖励提高5倍并按原次数合并；黄金特权按4次计算.",
		
		-- 剩余时间
		residuetime = "",



		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{11, 00, 11, 30,},
				{17, 00, 17, 30,},
				{21, 25, 21, 55,},
			},
		
		    lefttime = 1800,
		},
		
		tStrArray = {
			"<(c0xFF00ff00)"..Lang.EntityName.m371..">",
			"<(c0xFF00c0ff)"..Lang.EntityName.m372..">",
			"<(c0xFFffff00)"..Lang.EntityName.m373..">",
			"<(c0xFFFF6600)"..Lang.EntityName.m374..">",
			"<(c0xFFFF6600)"..Lang.EntityName.m423..">",
		},
		
		level = 80, -- 需求等级0
		tYBL = {itemId = 500, yb = 50},	-- 运镖令
		time = 600,--		-- 镖车存活的时间
		maxRefresh = 3,	-- 最大刷新次数
		maxEscort = 1,	-- 每日护送次数
		mergedEscortTimes = 3,	-- 普通玩家原每日护送次数
		vipExtraEscortTimes = 1,	-- 黄金特权原额外护送次数
		escortAwardRate = 5,	-- 押镖奖励基础倍率
		insurance = 0,	-- 保险费(元宝)
		distance = {2,6,6},	-- 最小距离,暂停护送距离,最大距离
		tAwardPercent = {1, 1, 1, 1,},	-- 奖励(百分比) 保险功能已经去除，所以都改为1
		relivetime = 5,		-- 镖车5后秒复活
  
		-- 镖车
		tBiaoche =
		{
			-- 白银镖车
			{
				id = 371,				--镖车的id
				monName = Lang.EntityName.m371,	--镖车名字
				color = "c0xFF00ff00",			--镖车的颜色

				freshRate =  10000,	--机率(万分比)
                --押镖需求
				need = { type = 0,  count = 200000,},		--1=绑定金币
				--奖励
				Awards =
				{
					{type = 20, id = 0, count = 950000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					{type = 5, id = 0, count = 100000, quality = 0, strong = 0, bind = 0, param = 0},	-- 绑金
					{type = 41, id = 0, count = 1000, quality = 0, strong = 0, bind = 0, param = 0},	--功勋值
				},
                --掉落组 每组1万绑金，共15组。
                DropMoney = 
                {
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                },
                notReturn = 1,  --失败不返还押镖次数
                addMailId = 5473, --邮件返还押金id
			},

			--  黄金镖车
			{
				id = 372,				--镖车的id
				monName = Lang.EntityName.m372,	--镖车名字
				color = "c0xFF00c0ff",			--镖车的颜色

				freshRate = 5000, --机率(万分比)
				 --押镖需求
				need = { type = 0,  count =600000,},--1=绑定金币
				--奖励
				Awards =
				{
					{type = 20, id = 0, count = 1500000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					{type = 5, id = 0, count = 150000, quality = 0, strong = 0, bind = 0, param = 0},-- 绑金
					{type = 41, id = 0, count = 1500, quality = 0, strong = 0, bind = 0, param = 0},--功勋值
				},
                --掉落组 每组4万非绑定金币，共10组，每组1万绑金，共5组。
                DropMoney = 
                {
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 10000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                    -- {type = 0,count = 40000,},
                },
                 notReturn = 1,  --失败不返还押镖次数
                 addMailId = 5474, --邮件返还押金id
			},

			-- 白金镖车
			{
				id = 373,				--镖车的id
				monName = Lang.EntityName.m373,	--镖车名字
				color = "c0xFFffff00",			--镖车的颜色

				freshRate = 5000, --机率(万分比)
				--押镖需求
				need = { type = 3,  count =100,},
				--奖励
				Awards =
				{
					{type = 20, id = 0, count = 2400000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					{type = 5, id = 0, count = 200000, quality = 0, strong = 0, bind = 0, param = 0},-- 绑金
					{type = 41, id = 0, count = 2000, quality = 0, strong = 0, bind = 0, param = 0},--功勋值
				},
                --每组1元宝，共5组；每组5元宝，共4组；每组10元宝，共5组
                DropMoney = 
                {
                    {type = 3,count = 1,},
                    {type = 3,count = 1,},
                    {type = 3,count = 1,},
                    {type = 3,count = 1,},
                    {type = 3,count = 1,},
                    {type = 3,count = 5,},
                    {type = 3,count = 5,},
                    {type = 3,count = 5,},
                    {type = 3,count = 5,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                },
                 notReturn = 0,  --失败返还押镖次数
                addMailId = 5470,

			},

			-- 钻石镖车
			{
				id = 374,				--镖车的id
				monName = Lang.EntityName.m374,	--镖车名字
				color = "c0xFFFF6600",			--镖车的颜色

				freshRate = 3000, --机率(万分比)
				--押镖需求
				need = { type = 3,  count =150,},
				--奖励
				Awards =
				{
					{type = 20, id = 0, count = 4000000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					{type = 5, id = 0, count = 250000, quality = 0, strong = 0, bind = 0, param = 0},	--绑金
					{type = 41, id = 0, count = 2500, quality = 0, strong = 0, bind = 0, param = 0},	--功勋值
				},
                --每组5元宝，共4组；每组10元宝，共3组；每组50元宝，共2组
                DropMoney = 
                {
                    {type = 3,count = 5,},
                    {type = 3,count = 5,},
                    {type = 3,count = 5,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
					{type = 3,count = 10,},
					{type = 3,count = 10,},
                    {type = 3,count = 50,},
                },
                notReturn = 0,  --失败返还押镖次数
                addMailId = 5471,
			},
			
			-- 王者镖车
			{
				id = 423,				--镖车的id
				monName = Lang.EntityName.m423,	--镖车名字
				color = "c0xFFFF6666",			--镖车的颜色

				freshRate = 3000, --机率(万分比)
								--押镖需求
				need = { type = 3,  count =200,},
				--奖励
				Awards =
				{
					{type = 20, id = 0, count = 5500000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
					{type = 5, id = 0, count = 300000, quality = 0, strong = 0, bind = 0, param = 0},	--绑金
					{type = 41, id = 0, count = 3000, quality = 0, strong = 0, bind = 0, param = 0},	--功勋值
				},
                --每组5元宝，共1组，每组10元宝，共7组；每组50元宝，共2组；每组100元宝，共2组
                DropMoney = 
                {
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 10,},
                    {type = 3,count = 50,},
                    {type = 3,count = 50,},
                },
                notReturn = 0,  --失败返还押镖次数
                addMailId = 5472,
			},

		},
		
		DartSetup =
		{
			succFollowDist = 8,						-- 交镖成功距离
			actionTime = 10,						-- 护镖活动时间，秒为单位
			-- guargStatus 护镖状态定义
			CampDartStatusIdle = 0,			-- 没有护镖
			CampDartStatusAccept = 1,		-- 已经接镖
			CampDartStatusFinished = 2,		-- 完成镖，但还没有领取奖励
			CampDartStatusGotAward = 3, 		-- 已经领取奖励。实际上此状态不存在。在领取奖励之后，就会重置

			-- guardFailedReason 护镖失败原因
			CampDartFailUnknown = 0,			-- 未知原因
			CampDartFailExpired = 1,  		-- 护镖超时
--			CampDartFailOverMaxDist = 2,		-- 玩家和镖车距离过远
			CampDartFailObjDie=3,				-- 镖车死亡
			CampDartFailActorGiveUp=4,		-- 玩家放弃
			CampDartFailActorLogout=5,		-- 玩家退出游戏
			CampDartFailBeLoot = 6,			--玩家死亡 镖车被劫
		},
		
		-- 掉落元宝
		tDrop = {
			{ type = 3, id = 816, value = 1, str = "元宝", count = 5,},		--元宝
			{ type = 3, id = 817, value = 5, str = "元宝", count = 3,},		--元宝
			{ type = 3, id = 818, value = 10, str = "元宝", count = 13,},		--元宝
		},
		
		buff = {
		--	{type = 49, groupid = 10, value = -10, interval = 1800, name = Lang.Activity.t00093, times = 1, timeOverlay = true, needDelete = true,},
			{id = 108, type = 60, groupid = 109, value = 5, interval = 60, name = "无敌镖车", times = 1, timeOverlay = true,cd = 60,}, -- 无敌镖车
		},
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"多倍押镖", "威龙城", 154, 143, "我也要参加"},
		
		Src = {sid = 9, x = 154, y = 144, snpcname = Lang.EntityName.n00359},
		
		--x、y为目标npc 所在坐标，destsceneid为目标场景，destnpcname为目标NPC名称
		Dest = {sceneid = 83, x = 135, y = 93, name = Lang.EntityName.n00360},
	},


--跨服押镖		13：30--14:00、18:00--18：30  
----------------------------------------
	KuafuYaSong = {
		id = 26,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0026,				-- 活动名称
		timeDesc = Lang.dayactivity.time0026,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0026,           -- 参与条件
		entrance = Lang.dayactivity.talk0026,			-- 活动入口
		desc = Lang.dayactivity.desc0026,        		-- 活动描述
		rewardicon = {"iaward#4#1"},	-- 奖励图标		
				
		-- 活动跟踪小窗口
		tracktxt = "$value1$<(c0xFFff0000)>\\<(c0xFF00c0ff)运镖时间：><(c0xFFff0000)$value3$>\\<(c0xFF00c0ff)镖车奖励：><(c0xFFff0000)$value4$>",

		activityCfg = "\\1.护送镖车需要缴纳押金，镖车品质不同，所需押金也不同.\\2.押送成功后返还全额押金，并获得押镖奖励.\\<(c0xffff0000)3.未按时交镖（10分钟内）、被劫镖，算押镖失败，不返还押金.>\\4.白金、钻石、王者镖车被劫镖（镖车血量为0、人物死亡），劫镖者\\  可以获得押镖者缴纳的75%押金，另20%返还押镖车，5%系统扣除.\\<(c0xffff0000)5.白金、钻石、王者镖车被劫镖后，会返还一次押镖机会.>",
				
		-- 开放时间
		tOpenTime = {
			openSvr = 5, --开服第五天显示
			weeks={0},	
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				 {11, 00, 11, 30,},
				 {17, 00, 17, 30,},
				 {21, 25, 21, 55,},
			},
		},
		
		tStrArray = {
			"<(c0xFFFF6600)"..Lang.EntityName.m1069..">",
		},		
		
		biaoCheId = 1069, -- 镖车ID
		maxYabiaoCount = 3, -- 每天最多押镖次数
		biaoCheLiveTime = 600, -- 镖车存活时间：10 分钟	
		doubleAwardYb = 588, -- 双倍奖励消耗的元宝数
		destNPCName = "豹头镖局", -- 目标NPC名，用于自动寻路
	
		--前端代码需要添加对应的地图id
		--远古积分奖励(要跟 config\CrossServerConfig.lua 的数组 BiaoCheEnterScene 的顺序对应)
		yuanguPointAwards = {1000,1050,1100,1150,1200,1250,1300,1350,1400,1450,1500,1550,1600,1650,1700,1750,1800},

		--50000-199999,200000-299999,300000-399999,400000-499999,500000-599999,600000-699999,700000-799999,800000-899999,900000-999999,1000000-1099999,1100000-1199999,1200000-1299999,1300000.
		
		yuanguYBAwards = {1000,1000,2000,2000,3000,3000,4000,4000,5000,5000,5000,5000,5000,5000,5000,5000,5000},
		--奖励
		Awards = 
		{					
		},	
				
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"跨服押镖", "威龙城", 150, 140, "我也要参加"},
		
		Src = {sid = 9 , x = 101, y = 105, snpcname = Lang.EntityName.n00370},
		
		--x、y为目标npc 所在坐标，destsceneid为目标场景，destnpcname为目标NPC名称
		Dest = {sceneid = 83, x = 206, y = 157, name = Lang.EntityName.n00396},
	},

----------------------------------------
--膜拜城主		12:40-13:40	17:40-18:40
----------------------------------------
	MoBeiChongZhu = {
		id = 5,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0005,				-- 活动名称
		timeDesc = Lang.dayactivity.time0005,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0005,           -- 参与条件
		entrance = Lang.dayactivity.talk0005,			-- 活动入口
		desc = Lang.dayactivity.desc0005,        		-- 活动描述
		rewardicon = {"iaward#2#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "膜拜期间内每10秒可获得3888经验",
 
 		-- 活动规则
		activityCfg = "\\    站在盟主雕像10*10范围内每10秒可获得38888经验",
 
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value6$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{12, 00, 12, 30,},
				{18, 00, 18, 30,},
			},
		},
		level = 75,				-- 参与限制等级70级以上
		-- sceneId = 9, -- 比奇城
		-- maxTimes = 10,			-- 最大鄙视膜拜次数
		-- interval = 8,				-- 每8秒一次经验奖励
		-- ybRefresh = 10,		-- 一键十倍的费用10元宝
		-- bindcoinRefresh = 20000, -- 绑金2万
		
		-- -- 泡点奖励
		-- pdAward = {
		-- 	-- {最小等级, 最大等级, 经验,},
		-- 	{minlv = 60, maxlv = 74, exp = 18000,},
		-- 	{minlv = 75, maxlv = 89, exp = 32000,},
		-- 	{minlv = 90, maxlv = 99, exp = 58000,},
		-- 	{minlv = 100, maxlv = -1, exp = 105000,},
		-- },
		
		-- -- 膜拜/鄙视奖励
		-- psmbAward = {
		-- 	{multiple = 1, exp = 450000, rate = 10000,},
		-- 	{multiple = 3, exp = 1350000, rate = 5000,},
		-- 	{multiple = 6, exp = 2700000, rate = 5000,},
		-- 	{multiple = 10, exp = 4500000, rate = 5000,},
		-- },
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		--RwData = {"霸主雕像", "比奇城", 137, 134, "我也要鄙视", "我也要膜拜", "鄙视", "膜拜"},
	},
----------------------------------------
--武林争霸		13:00-13:15(每周2、5)
----------------------------------------
	WuLinZhengBa = {
		id = 6,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0006,				-- 活动名称
		timeDesc = Lang.dayactivity.time0006,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0006,           -- 参与条件
		entrance = Lang.dayactivity.talk0006,			-- 活动入口
		desc = Lang.dayactivity.desc0006,        		-- 活动描述
--		rewardicon = {"iaward#26#1", "iaward#3#1", "iaward#31#1", "iaward#30#1",},	-- 奖励图标
		rewardicon = {"iaward#26#1", "iaward#3#1" },	-- 奖励图标
		--预告时间标识
		trailStr = "on_activity_wlzb_before10",
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)胜利奖励: >\\    <(iaward#26#1)><(c0xFF00ff00)武林争霸称号 x 1>\\    <(iaward#3#10)><(c0xFF00ff00)元宝 x 1000>\\   <(c0xFF00ff00)场景内仅存一名玩家,则对话武林争霸裁判可获胜>",

		-- 活动规则
		activityCfg = "\\    1.活动开启10分钟后活动场景内仅存一名玩家,则对话武林争霸裁判可获胜\\    2.不要管活动时间,击败你眼前的敌人,直到你获胜为止\\    3.活动地图内PK不增加PK值",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={1,3,5},	--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{13, 20, 13, 50},
			},
			lefttime = 1800,
		},
		protectedTime = 120, --有无敌buff保护的时间
		
		------------------------------------旧的配置 begin-------------------------------------------------
		minLevel = 80,				-- 参与限制等级70级以上
		awardsYb = 0,		-- 奖励元宝数
		limitTimes = 5,		-- 限制时间5分钟内可以参与，5分钟后开始检测是否只有一个人在活动场景(单位分钟)
		clearTimes = 10,		-- 10分钟前清除盟主称号和上次的奖励
		lastTime = 1800,			--单位秒 活动持续时间
		
		RankName = "WuLinZhengBa",		--保存的武林争霸信息
		RankTxt = "WuLinZhengBaConfig.txt",	--保存到的文件名

		lowSceenId = 80,			--争霸赛的场景id
		wMapX = {33,60},				--进入的x坐标
		wMapY = {23,51},				--进入的y坐标
		
		outSceenId = 9,				--退出的争霸赛的场景id
		outMapX = {138,134},			--退出的x坐标
		outMapY = {142,138},			--退出的y坐标
		
		-- BossId = 236,
		-- SuperBossId = 237,
		-- BossTimeInterval = 18000, --5分钟
		-- BossPos = {49,50},

		RankColumn = 	--排行榜列标题表
		{
			{columnName = "name", ShowFlag = 0}, 	--姓名
			{columnName = "state", ShowFlag = 0},	--状态
		},

		--每过5分钟发放一次奖励
		LoopTime = 8,		--单位为秒

		Awards = 
		{
		},

		--奖励武林盟主
		awardsMaster =
		{
			--金条*3
			{ type = 3, id = 0, count = 10000, strong = 0, quality = 0, bind = 0 },	


		},

		--奖励本次报名(武林盟主除外)
		awardsSignUp =
		{
			--小金条*0
			-- { type = 3, id = 0, count = 0, strong = 0, quality = 0, bind = 0 },	
		},

		fRate = 0.1,
		---------------------------------------旧的配置 end------------------------------------------------
		
		sceenId = 80,  	--争霸赛的场景id, 为了效率, OnPlayerDie() 中有写死这个场景ID
		level = 80,		-- 进入等级
		enterTimeLimit = 600, -- 活动开始几秒后不能进入
		
		-- 泡点奖励
		pdAward = {
			-- {最小等级, 最大等级, 经验,},
			--{minlv = 60, maxlv = 74, exp = 18000,},
			--{minlv = 75, maxlv = 89, exp = 32000,},
			--{minlv = 90, maxlv = 99, exp = 58000,},
			--{minlv = 100, maxlv = -1, exp = 105000,},
			-- 改为不分等级
			-- exp = 30000,
		},
		
		-- 活动奖励
		Awards = {
			 {type = 0, id = 0, count = 0,},			-- 金条*0
		},
		
		masterAwardsYb = 0,		-- 盟主奖励元宝数
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"武林争霸", "威龙城", 209, 139, "我也要参加"},
	},
----------------------------------------
--元宝嘉年华	11:50-12:00
----------------------------------------
	-- YuanBaoJiaNianHua = {
	-- 	id = 7,
	-- 	isDelete = false, -- 活动是否已经删除
	-- 	name = Lang.dayactivity.name0007,				-- 活动名称
	-- 	timeDesc = Lang.dayactivity.time0007,          	-- 活动时间
	-- 	ruleDesc = Lang.dayactivity.rule0007,           -- 参与条件
	-- 	entrance = Lang.dayactivity.talk0007,			-- 活动入口
	-- 	desc = Lang.dayactivity.desc0007,        		-- 活动描述
	-- 	rewardicon = {"iaward#1#1", "iaward#3#1", "iaward#5#1", "iaward#24#1"},	-- 奖励图标
	-- 	level = 80,			-- 进入等级
	-- 	-- 活动跟踪小窗口
	-- 	tracktxt = "<(c0xffffc730)活动进度: >\\    <(c0xffd3be7d)当前波数: ><(c0xff00ff1e)$value1$/5波>\\<(c0xffd3be7d)兽人商队携带货物出现在沙漠土城，大伙抓紧机会劫杀抢宝吧!>\\<(c0xffffc730)收益统计: >\\    <(c0xffd3be7d)已拾取收益: ><(c0xff00ff1e)$value4$ 金币>",
 
	-- 	-- 活动规则
	-- 	activityCfg ="\\    1.活动期间共有5波兽人商队出现\\    2.击败他们可获得丰厚奖励\\    3.它们遇到攻击后就会乱跑,抓住它们!\\    4.活动结束后可前往NPC领取三倍收益",
 
	-- 	-- 剩余时间
	-- 	residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",

	-- 	--预告时间标识
	-- 	trailStr = "StartActivity_YBJNHBefore5",	
		
	-- 	-- 开放时间
	-- 	tOpenTime = {
	-- 		weeks={0},					--每周几号开放
	-- 		times = {
	-- 			--{{开始时间(9:50)，结束时间(10:00)}, ...}
	-- 			{16, 00, 16, 30,},
	-- 			--{21, 40, 22, 0,},
	-- 		},

	-- 		lefttime = 1800,
	-- 	},
		
	-- 	sceneId = 10,
	-- 	bossIds = {867,868,869},
	-- 	bossPos = {93,86}, -- x位置, y位置
	-- 	broadcastPos = {1,14,26,39,51}, -- 每波的第1只怪的索引
	-- 	RwData = {"元宝嘉年华", "热血王城", 93, 86, "我也要参加"},
	-- 	refresh = {
	-- 		-- 刷新时间(秒), BOSS ID
	-- 		--第一波
             
 --             {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
 --       		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 869},--猪boss

			
	-- 		--第二波
	-- 		 {300, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
 --       		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 868},--元宝猪
		
	
	-- 		--第三波
	-- 		{300, 867},--金币猪--26
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
 --       		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 869},--猪boss
			

	-- 		--第四波
	-- 		 {300, 867},--金币猪--39
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
 --       		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 868},--元宝猪
			


	-- 		--第五波
	-- 		{300, 867},--金币猪--51
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
 --       		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 867},--金币猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 868},--元宝猪
	-- 		 {1, 869},--猪boss


	-- 	},
	-- },
----------------------------------------
--老哥快跑		16:30-17:00(开服第2天起)
----------------------------------------
	BenPaoBaXiongDi = {
		id = 8,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0008,				-- 活动名称
		timeDesc = Lang.dayactivity.time0008,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0008,           -- 参与条件
		entrance = Lang.dayactivity.talk0008,			-- 活动入口
		desc = Lang.dayactivity.desc0008,        		-- 活动描述
		rewardicon = {"iaward#3#1","iaward#5#1"},	-- 奖励图标		
		
		--预告时间标识
		trailStr = "StartActivity_bpbxdBefore5",
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\        <(c0xffd3be7d)当前层数 > <(c0xff00ff1e) $value1$/3层>\\          <(c0xff888888)加油奔跑吧,排名靠前拿大奖!><(idecoLine9#230)>\\<(c0xffffc730)通关奖励: >\\",

		-- 活动规则
		activityCfg = "\\  1.搭配不同的buff勇往直前吧~\\  2.迷宫挺大,抱住大腿方可走出去 \\  3.奖励npc在第二层终点处等着大家哦~ \\  4.活动地图一、二层不可PK，第三层可PK且不红名\\  5.活动第三层刷新世界BOSS，掉落无归属",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value7$>",
		
		-- 开放时间
		tOpenTime = {
			openSvr = 1,			-- 开服第2天开启
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{14, 00, 14, 30,},
			},

			lefttime = 1800,
		},
		
		-- 字符串数组
		tStrArray = {"第一名", "第二名", "第三名",},
		
		--scenes = {216, 217, 218},
		scenes = {216, 218, 342},
		level = 80,			-- 等级限制
		looptm = 8,			-- 每8秒获得经验奖
		
		-- 泡点奖励
		pdAward = {
			-- {最小等级, 最大等级, 经验,},
			{minlv = 60, maxlv = 74, exp = 18000,},
			{minlv = 75, maxlv = 89, exp = 32000,},
			{minlv = 90, maxlv = 99, exp = 58000,},
			{minlv = 100, maxlv = -1, exp = 105000,},
		},
		
		-- 击杀获得卡牌数量
		--tCard = {boss = 5, actor = 3, monster = 1,},
		rewards ={
			--第1名
			{
				{type = 15, id = 0, count = 5880, quality = 0, strong = 0, bind = 1},
				{type = 5, id = 0, count = 2880000, quality = 0, strong = 0, bind = 1},
			},
			--第2名
			{
				{type = 15, id = 0, count = 2880, quality = 0, strong = 0, bind = 1},
				{type = 5, id = 0, count = 2200000, quality = 0, strong = 0, bind = 1},
			},
			--第3名
			{
				{type = 15, id = 0, count = 1880, quality = 0, strong = 0, bind = 1},
				{type = 5, id = 0, count = 1880000, quality = 0, strong = 0, bind = 1},
			},
			--第4~10名
			{
				{type = 15, id = 0, count = 880, quality = 0, strong = 0, bind = 1},
				{type = 5, id = 0, count = 1580000, quality = 0, strong = 0, bind = 1},
			},
			--参与奖
			{
				{type = 5, id = 0, count = 1280000, quality = 0, strong = 0, bind = 1},
			},
		},
		
		
		
		--前三名 取三个奖励中间的随机一个。
		---rewards={
		---{			
		---	--{type = 5, id = 0, count = 400000, quality = 0, strong = 0, bind = 1,job = 0, name = "绑定金币"},
		---	--{type = 46, id = 0, count = 6000, quality = 0, strong = 0, bind = 1,job = 0,name = "护符碎片"},
		---	--{type = 45, id = 0, count = 6000, quality = 0, strong = 0, bind = 1,job = 0,name = "护盾碎片"},
		---	{10000,10000,800000},
        ---
		---},
		-----前20名		取三个奖励中间的随机一个。
		---{			
		---	--{type = 5, id = 0, count = 200000, quality = 0, strong = 0, bind = 1,job = 0, name = "绑定金币"},
		---	--{type = 46, id = 0, count = 2000, quality = 0, strong = 0, bind = 1,job = 0,name = "护符碎片"},
		---	--{type = 45, id = 0, count = 2000, quality = 0, strong = 0, bind = 1,job = 0,name = "护盾碎片"},
		---	{7500,7500,500000},
		---}, 
		-----参与奖        取2个奖励中间的随机一个。
		---{			
		---	--{type = 5, id = 0, count = 100000, quality = 0, strong = 0, bind = 1,job = 0, name = "绑定金币"},
		---	--{type = 46, id = 0, count = 1000, quality = 0, strong = 0, bind = 1,job = 0,name = "护符碎片"},
		---	--{type = 45, id = 0, count = 1000, quality = 0, strong = 0, bind = 1,job = 0,name = "护盾碎片"},
		---	{5000,5000,300000},
        ---
		---}, 
        ---
        ---
		---},
		-- {第一名，第二名, 第三名}
		--tYBAwards = {888, 488, 288},
		--tBindYBAward = 888,				-- 参与奖绑定元宝
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"跑吧老哥", "沙漠土城", 155, 138, "我也要参加"},
	},
----------------------------------------
--勇者试练	17:05-17:35
----------------------------------------
	YongZheShiLian = {
		id = 9,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0009,				-- 活动名称
		timeDesc = Lang.dayactivity.time0009,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0009,           -- 参与条件
		entrance = Lang.dayactivity.talk0009,			-- 活动入口
		desc = Lang.dayactivity.desc0009,        		-- 活动描述
		rewardicon = {"iaward#2#1", "iaward#0#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)试练关数: ><(c0xFFff0000)第$value1$关>\\<(c0xFF00c0ff)剩余怪物: ><(c0xFFff0000)$value2$>\\<(c0xFF00c0ff)本关奖励: >\\\\    <(iaward#2#1)><(c0xFF00ff00)经验 x $value3$>\\    <(iaward#0#1)><(c0xFF00ff00)经验 x $value4$>",

		-- 活动规则
		activityCfg = "    1.试炼塔共30层,每层最多可停留60秒,(最后一层没有时间限制,可直至活动结束)时间到还剩25只以上的怪物,则算闯关失败\\    2.不足25只则将所有存活的玩家和怪物一起传送到下一层试练中\\    3.试炼塔可单独进入,也可组队进入.开放期间,进入次数无限制\\    4.活动内如玩家死亡、退出活动、退出游戏等情况,视为闯关失败,队伍内其他成员可继续闯关",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{17, 5, 17, 35,},
			}
		},
		

	},
----------------------------------------
--夺宝奇兵		18:20-18:50
----------------------------------------
	DiXiaDuoBao = {
		id = 10,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0010,				-- 活动名称
		timeDesc = Lang.dayactivity.time0010,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0010,           -- 参与条件
		entrance = Lang.dayactivity.talk0010,			-- 活动入口
		desc = Lang.dayactivity.desc0010,        		-- 活动描述
		rewardicon = {"iaward#33#1", "iaward#3#1"},	-- 奖励图标
		sceneId=234,
		level = 80,	
		--预告时间标识
		trailStr = "StartActivity_duobaoqibingBefore5",
		-- 活动跟踪小窗口
		tracktxt = "加油击杀boss吧，掉落无归属手快者得",
 
		-- 活动规则
		activityCfg = " 1.地图中有一只窃宝贼,死亡后掉落[散人宝藏箱]\\ 2.拾取宝箱的玩家将获得[持宝人]称号,每5秒获得100元宝.\\ 3.持宝人离开地图/下线/死亡时,宝箱会掉在地上.\\ 4.活动结束前5分钟,持宝人可开启宝藏箱获得奖励.\\ 5.活动活动地图PK不红名",
 
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value13$>",
				-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"夺宝奇兵", "沙漠土城", 166,141, "我也要参加"},
		
		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{21, 05, 21, 20,},
			},

			lefttime = 900,
		},
		monster = {id = 777, --窃宝贼怪物id
                    x = 30, --窃宝贼x坐标
                    y =32,}, --窃宝贼y坐标
        title= 25, --持宝人称号

	},
----------------------------------------
--阵营战	18:55-19:25(周1、3、5)
----------------------------------------
	ZhenYingZhan = {
		id = 11,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0011,				-- 活动名称
		timeDesc = Lang.dayactivity.time0011,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0011,           -- 参与条件
		entrance = Lang.dayactivity.talk0011,			-- 活动入口
		desc = Lang.dayactivity.desc0011,        		-- 活动描述
		rewardicon = {"iaward#2#1", "iaward#9#1", "iaward#3#1", "iaward#15#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)积分排行: >\\\\    第一名:<(c0xFF00c0ff)$value1$>  第二名:<(c0xFF00c0ff)$value2$>\\    第三名:<(c0xFF00c0ff)$value3$>  第四名:<(c0xFF00c0ff)$value4$>\\    第五名:<(c0xFF00c0ff)$value5$>  第六名:<(c0xFF00c0ff)$value6$>\\    第七名:<(c0xFF00c0ff)$value7$>  第八名:<(c0xFF00c0ff)$value8$>\\    第九名:<(c0xFF00c0ff)$value9$>  第十名:<(c0xFF00c0ff)$value10$>\\  我的积分:<(c0xFF00c0ff)$value11$>  我的排名:<(c0xFF00c0ff)$value12$>\\收益统计:\\    累计获得经验 x <(c0xFF00c0ff)$value13$>",

		-- 活动规则
		activityCfg = "    1.进入活动后玩家随机分配至“天人”或“嗜魂”阵营\\    2.击杀敌对阵营玩家、BOSS怪都可获得积分,在地图内满3分钟也可获得积分,积分排行前10名的奖励更丰富\\    3.离开活动则清除积分\\    4.活动场景内每8秒可获得一次奖励",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value14$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={1,3,5},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{18, 55, 19, 25},
			}
		},
		
		sceneId = 66,
		level = 80,
		ACampPos = {60,68,39,91},
		BCampPos = {120,135,135,140},
		
		-- 击杀获得积分数
		points = {actor = 5, boss935 = 20, boss936 = 100,},
		
		-- 泡点奖励
		pdAward = {
			-- {最小等级, 最大等级, 经验,},
			{minlv = 60, maxlv = 74, exp = 18000,},
			{minlv = 75, maxlv = 89, exp = 32000,},
			{minlv = 90, maxlv = 99, exp = 58000,},
			{minlv = 100, maxlv = -1, exp = 105000,},
		},
	},
----------------------------------------
--王城危机		19:30-19:50
----------------------------------------
	WangChengWeiJi = {
		id = 12,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0012,				-- 活动名称
		timeDesc = Lang.dayactivity.time0012,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0012,           -- 参与条件
		entrance = Lang.dayactivity.talk0012,			-- 活动入口
		desc = Lang.dayactivity.desc0012,        		-- 活动描述
		rewardicon = {"iaward#24#1", "iaward#6#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)剩余怪物: ><(c0xFFff0000)$value1$/$value2$>\\\\<(c0xFF00c0ff)活动奖励:>\\    <(iaward#4#1)><(iaward#5#1)><(iaward#6#1)>",

		-- 活动规则
		activityCfg = "活动规则：\\    ",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value3$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{19, 30, 19, 50,},
			}
		},
		

	},
----------------------------------------
--秘境之旅	20:00-21:00(周1、5)
----------------------------------------
	HangHuiChuangGuan = {
		id = 13,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0013,				-- 活动名称
		timeDesc = Lang.dayactivity.time0013,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0013,           -- 参与条件
		entrance = Lang.dayactivity.talk0013,			-- 活动入口
		desc = Lang.dayactivity.desc0013,        		-- 活动描述
		rewardicon = {"iaward#10#1", "iaward#24#1","iaward#6#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)剩余怪物: ><(c0xFFff0000)$value1$/$value2$>\\\\<(c0xFF00c0ff)活动奖励:>\\    <(iaward#4#1)><(iaward#5#1)><(iaward#6#1)>",

		-- 活动规则
		activityCfg = "活动规则：1.击败当前层内的所有怪物才可进入下一层，共10层\\  2.活动地图中，pk不增加pk值  ",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value3$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={1,5},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{16, 05, 16, 35,},
			}
		},
		

	},
----------------------------------------
--抵御入侵	20:00-21:00(周3、7)
----------------------------------------
	HangHuiShouHu = {
		id = 14,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0014,				-- 活动名称
		timeDesc = Lang.dayactivity.time0014,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0014,           -- 参与条件
		entrance = Lang.dayactivity.talk0014,			-- 活动入口
		desc = Lang.dayactivity.desc0014,        		-- 活动描述
		rewardicon = {"iaward#11#1", "iaward#2#1", "iaward#5#1"},	-- 奖励图标
		--预告时间标识
		trailStr = "onstartguildfight_Before5",
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\      <(c0xffd3be7d)当前波数 > <(c0xff00ff1e) $value1$/$value2$>\\      <(c0xffd3be7d)剩余怪物 > <(c0xff00ff1e) $value3$>\\      <(c0xffd3be7d)下波倒计时:$value4$>\\      <活动结束后可前往NPC处领取奖励>\\<(c0xffffc730)截取资源: >\\\\      <(c0xFFfff000)绑金:$value5$>\\      <(c0xFF00cb52)经验: $value6$>\\    1级羽毛: $value7$\\<(idecoLine9#230)>";

		-- 活动规则
		activityCfg = "\\ 1.全力保护圣碑,圣碑死亡活动失败.\\ 2.可以让高手前往怪物刷新点击杀.\\ 3.使用各种增益道具,减少抵抗压力.   ",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value9$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={3,0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{20, 0, 21, 0,},
			},

		    lefttime = 3600,
		},
		RwData = {"抵御入侵", "沙漠土城", 174, 133, "我也要参加"},
		
	},

----------------------------------------
--王城大战		20:00-21:00(周2、4、6)
----------------------------------------
	WangChengDaZhan = {
		id = 15,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0015,				-- 活动名称
		timeDesc = Lang.dayactivity.time0015,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0015,           -- 参与条件
		entrance = Lang.dayactivity.talk0015,			-- 活动入口
		desc = Lang.dayactivity.desc0015,        		-- 活动描述
		rewardicon = {"iaward#27#1", "iaward#3#1", "iaward#4#1", "iaward#5#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)剩余怪物: ><(c0xFFff0000)$value1$/$value2$>\\\\<(c0xFF00c0ff)活动奖励:>\\    <(iaward#4#1)><(iaward#5#1)><(iaward#6#1)>",
 
		-- 活动规则
		activityCfg = "活动规则：\\    ",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value3$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={2,4,6},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{20, 0, 21, 0,},
			}
		},

	},
----------------

----------------------------------------
--军团战
----------------------------------------
	JuntuanZhan = {
		id = 16,
		isDelete = true, -- 活动是否已经删除
			name = Lang.dayactivity.name0016,				-- 活动名称
		timeDesc = Lang.dayactivity.time0016,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0016,           -- 参与条件
		entrance = Lang.dayactivity.talk0016,			-- 活动入口
		desc = Lang.dayactivity.desc0016,        		-- 活动描述
		rewardicon = {"iaward#31#1","iaward#8#1","iaward#15#1"},	-- 奖励图标
		
		--预告时间标识
		trailStr = "FiveMinsBeforeStart",
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)胜利奖励: >\\    <(iaward#26#1)><(c0xFF00ff00)军团战 x $value1$>\\   ",

		-- 活动规则
		activityCfg = "\\ 1.个人积分：击败其他军团玩家可获得\\ 2.军团积分：本军团成员获得的积分总和\\ 3.三军团个人积分排名越高奖励越好领取个人奖励\\ 4.所在军团获胜并参与活动者可获得军团奖励领取军团奖励\\ 5.活动地图内PK不增加PK值",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},	--每周几号开放
			times = {
				--{{开始时间(19:30)，结束时间(20:00)}, ...}
				{19, 00, 19, 20},
			},

			lefttime = 1200,
		},		
				
		sceenId = 107, -- 场景 ID
		level = 80,		-- 进入等级
		enterTimeLimit = 600, -- 活动开始几秒后不能进入
		
		-- 进入场景初始位置
		initPosList = {
			{40, 183}, -- 雷霆
			{121, 38}, -- 光芒
			{191, 182}, -- 烈焰
		},
				
		pdTimerSec = 8, -- 第几秒获得一次泡点经验
		pdExp = 10000, -- 泡点奖励		
		killActorPoint = 10, -- 击杀一名玩家获得积分
		
		-- 玩家奖励
		ActorAwards = {
			-- 第1名  20绑金条
			{ {type = 0, id = 507, count = 5,name = "金条(绑金)"}, {type = 11, id = 0, count = 10000,},},--第2个是成就点
			-- 第2名  15绑金条
			{ {type = 0, id = 507,count = 3,name = "金条(绑金)"}, {type = 11, id = 0, count = 8000,}, },
			-- 第3名  10
			{ {type = 0, id = 507, count = 2,name = "金条(绑金)"}, {type = 11, id = 0, count = 6000,}, },
			-- 第4名  8
			{ {type = 0, id = 507, count = 1,name = "金条(绑金)"}, {type = 11, id = 0, count = 4000,},},
			-- 第5名  5
			{ {type = 0, id = 507, count = 1,name = "金条(绑金)"}, {type = 11, id = 0, count = 2000,},},
		},
		
		-- 军团奖励
		LegionAwards = {
			-- 第1名   -3=150能量点
			--{ {type = 0, id = -3, count = 150,name = "战无双能量点"}, },
			---- 第2名   -3=120能量点
			--{ {type = 0, id = -3, count = 120,name = "战无双能量点"}, },
			---- 第3名   -3=100能量点
			--{ {type = 0, id = -3, count = 100,name = "战无双能量点"}, },
			--宝石结晶
			{1000,800,500},
			
		},
				
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"军团战", "威龙城", 137, 165, "我也要参加"},
	},
	--------------------------------------------------------
	
----------------------------------------
--神威狱		
----------------------------------------
	ShenWeiYu = {
		id = 17,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0017,				-- 活动名称
		timeDesc = Lang.dayactivity.time0017,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0017,           -- 参与条件
		entrance = Lang.dayactivity.talk0017,			-- 活动入口
		desc = Lang.dayactivity.desc0017,        		-- 活动描述

		rewardicon = {"iaward#135#1","iaward#8#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFFc8a56e)通关提示:>  \\<(c0xFF00c0ff)$value1$>  $value2$  $value3$ \\<(c0xFFc8a56e)进入下一层奖励:>\\",
 
		-- 活动规则
		activityCfg = "  <(c0xFFc8a56e)1.神威狱共10层，每层至少有1个BOSS，击败后会掉落大量装备 \\   2.小怪有几率掉落通行证,精英怪必掉通行证\\   3.神威顶层刷新世界boss，掉落装备>",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		--预告时间标识
		trailStr = "StartActivity_JMZCBefore5",

		-- 开放时间
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}    
				{10, 00, 11, 30,},
				{22, 00, 23, 30,},
			},

			lefttime = 5400,
		},
		
		RwData = {"神威活动", "沙漠土城", 178, 129, "我也要参加"},
		scenes = {
		[1]=111,
		[2]=112,
		[3]=113,
		[4]=114,
		[5]=120,
		[6]=115,
		[7]=116,
		[8]=121,
		[9]=117,
		[10]=118,
		}, -- 场景 ID
		level = 80,		-- 进入等级
		enterTimeLimit = 900, -- 活动开始几秒后不能进入
		needItems ={
		[1]={id= 1782, count= 1,},
		[2]={id= 1782, count= 2,},
		[3]={id= 1782, count= 4,},
		[4]={id= 1782, count= 8,},
		[5]={id= 1782, count= 12,},
		[6]={id= 1782, count= 20,},
		[7]={id= 1782, count= 32,},
		[8]={id= 1782, count= 52,},
		[9]={id= 1782, count= 84,},
		[10]={id= 1782, count= 136,},
		},
		Awards = {
			--[1]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[2]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[3]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[4]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[5]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[6]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[7]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[8]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[9]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--[10]={type = 0, id = 0, mincount = 100000, maxcount = 1000000,name = "绑定金币",},-- 取中间的随机值
			--第一个奖励是灵力值，第二个是成就积分
			[1]= {20,500},
			[2]= {40,1000},
			[3]= {60,1500},
			[4]= {80,2000},
			[5]= {100,2500},
			[6]= {120,3000},
			[7]= {140,3500},
			[8]= {160,4000},
			[9]= {180,4500},
			[10]={200,5000},
			
		},
		ref_monster = {
		  {sceenId=111,mapx=62,mapy=57,range=3,entityid=290},
		  {sceenId=112,mapx=61,mapy=57,range=3,entityid=293},
		  {sceenId=113,mapx=61,mapy=74,range=3,entityid=296},
		  {sceenId=114,mapx=53,mapy=56,range=3,entityid=299},
		  {sceenId=120,mapx=38,mapy=46,range=3,entityid=302},
		  {sceenId=115,mapx=62,mapy=57,range=3,entityid=306},
		  {sceenId=116,mapx=50,mapy=53,range=3,entityid=309},
		  {sceenId=121,mapx=66,mapy=53,range=3,entityid=312},
		  {sceenId=117,mapx=66,mapy=53,range=3,entityid=315},
		  {sceenId=118,mapx=57,mapy=75,range=3,entityid=575},

		},
		
		ref_monster2 = {
		 {sceenId=114,mapx=23,mapy=50,range=3,entityid=38},--转生boss
		 {sceenId=115,mapx=44,mapy=97,range=5,entityid=51},
		 {sceenId=116,mapx=60,mapy=31,range=6,entityid=56},
		 {sceenId=117,mapx=46,mapy=90,range=8,entityid=70},
		 {sceenId=118,mapx=83,mapy=54,range=9,entityid=84},
		 {sceenId=120,mapx=68,mapy=54,range=4,entityid=44},
		 {sceenId=121,mapx=74,mapy=25,range=7,entityid=63},


		},
		operator_point = {--传送员的位置
			{x=37, y=34},	--1
			{x=62, y=41},	--2
			{x=67, y=87},	--3
			{x=73, y=53},	--4
			{x=45, y=81},	--5
			{x=46, y=27},	--6
			{x=21, y=59},	--7
			{x=74, y=70},	--8
			{x=68, y=42},	--9
		},
		oprator_name = "神威通关传送员";
		RwData = {"神威狱", "沙漠土城", 178, 129, "我也要参加"},

	},-----------------------	
	
----------------------------------------
--激情闭关		
----------------------------------------
	JiQingBiGuang = {
		id = 18,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name00018,				-- 活动名称
		timeDesc = Lang.dayactivity.time00018,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule00018,           -- 参与条件
		entrance = Lang.dayactivity.talk00018,			-- 活动入口
		desc = Lang.dayactivity.desc00018,        		-- 活动描述
		rewardicon = {"iaward#20#1" ,"iaward#8#1","iaward#2#1"},	-- 奖励图标
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)收益统计:>\\    <(c0xFF00ff00)当前泡点倍数： ><(c0xFFff0000)$value1$>\\    <(c0xFF00ff00)当前获得圣珠结晶： ><(c0xFFff0000)$value3$>\\    <(c0xFF00ff00)当前获得经验值： ><(c0xFFff0000)$value3$>\\    <(c0xFF00ff00)当前获得成就值： ><(c0xFFff0000)$value3$>",
		-- 活动规则
		activityCfg = "  <(c0xFFc9bda9)1.每10秒可获得圣珠结晶、成就、经验值>\\  <(c0xFFc9bda9)2.活动场景内安全区和PK区奖励不同，PK区最高可获得6倍奖励> \\  <(c0xFFc9bda9)3.活动地图PK不红名>",
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value4$>",
		
		trailStr = "StartActivity_BGXLBefore5",

		-- 开放时间
		--{{开始时间(9:50)，结束时间(10:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{15, 00, 15, 20,},

			},

			lefttime = 1200,
		},
		
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"激情闭关", "威龙城", 131,124, "我也要参加"},
		
		sceneid = 110,		-- 活动场景id
		level = 80,			-- 进入等级
		second = 10,			-- 
		
		
		-- 位置倍数
		tPosMultiple = {
			-- {x, y, 奖励倍数, 光圈颜色,}
			{54, 36, 4, "<(c0xFFff0000)红色>",},
			{58, 32, 4, "<(c0xFFff0000)红色>",},
			{54, 32, 4, "<(c0xFFff0000)红色>",},
			{58, 36, 4, "<(c0xFFff0000)红色>",},
			{56, 38, 4, "<(c0xFFff0000)红色>",},
			{56, 30, 4, "<(c0xFFff0000)红色>",},
			-- {65, 56, 2, "<(c0xFFff0000)红色>",},
			-- {51, 36, 2, "<(c0xFFff0000)红色>",},
			-- {54, 40, 2, "<(c0xFFff0000)红色>",},
			-- {57, 42, 2, "<(c0xFFff0000)红色>",},
			-- {47, 32, 2, "<(c0xFFff0000)红色>",},
			-- {60, 46, 2, "<(c0xFFff0000)红色>",},
			-- {55, 34, 3, "<(c0xFFff8a00)橙色>",},
			-- {59, 37, 3, "<(c0xFFff8a00)橙色>",},
			{52, 34, 4, "<(c0xFFff0000)红色>",},
			{60, 34, 4, "<(c0xFFff0000)红色>",},
			{56, 34, 6, "<(c0xFFde00ff)紫色>",},
			-- {63, 36, 5, "<(c0xFFde00ff)紫色>",},
		},
		
		-- 人数奖励分配
		tReward = {
			-- {等级, 等级, 圣珠, 经验值，成就值}
			{60, 70, 5,100000,100},
			{71, 80, 5,100000,100},
			{81, 85, 5,100000,100},
			{86, 90, 5,100000,100},
			{91, 95, 5,100000,100},
			{96, 99, 5,100000,100},
			{100, 110, 5,100000,100},
			{111, 120, 5,100000,100},
			{121, 1000, 5,100000,100},--不限等级
		},
	},

----------------------------------------
--双倍炼狱		12:00--13:00  
----------------------------------------
	ShuangBeiLianYu = {
		id = 19,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name00019,				-- 活动名称
		timeDesc = Lang.dayactivity.time00019,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule00019,           -- 参与条件
		entrance = Lang.dayactivity.talk00019,			-- 活动入口
		desc = Lang.dayactivity.desc00019,        		-- 活动描述
		rewardicon = {"iaward#2#1"},	-- 奖励图标
		--预告时间标识
		trailStr = "onBroadcast_ShuangBeiLianYu_StartBefore5",
		-- 活动跟踪小窗口
		tracktxt = "活动期间，参与炼狱即可获得双倍经验！",
 
		-- 活动规则
		activityCfg = "活动期间，参与炼狱即可获得双倍经验！",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",

		-- 开放时间
		--{{开始时间(12:00)，结束时间(13:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{15,  05, 16, 05,},

			},

			lefttime = 3600,
		},
			
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"双倍炼狱", "威龙城", 149,151, "我也要参加"},

		--buffid = 107, -- 双倍经验buff, 下线不保存
		-- 
		tTelport = {"炼狱", "威龙城", 149, 151,},
	},
----------------------------------------	
--秘境之旅	
----------------------------------------
	MiJingZhiLv = {
		id = 20,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0020,				-- 活动名称
		timeDesc = Lang.dayactivity.time0020,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0020,           -- 参与条件
		entrance = Lang.dayactivity.talk0020,			-- 活动入口
		desc = Lang.dayactivity.desc0020,        		-- 活动描述
		rewardicon = {"iaward#10#1"},	-- 奖励图标
		
		--预告时间标识
		trailStr = "StartActivity_MiJingZhiLvBefore5",
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\        <(c0xffd3be7d)当前层数 > <(c0xff00ff1e) $value1$/$value2$层>\\        <(c0xffd3be7d)阻挡BOSS > <(c0xff00ff1e) $value3$> \\    $value4$<(idecoLine9#230)>\\<(c0xffffc730)通关奖励: >\\",
 
		-- 活动规则
		activityCfg = "\\ 1.清理完当前地图BOSS才可进入下一层,共10层 ；\\ 2.活动地图内PK不增加PK值",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={1, 5},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{20, 0, 21, 0,},
			},

			lefttime = 3600,
		},
		
		RwData = {"秘境之旅", "沙漠土城", 170, 137, "我也要参加"},
		scenes = {
		[1]=220,
		[2]=221,
		[3]=222,
		[4]=223,
		[5]=224,
		[6]=225,
		[7]=226,
		[8]=227,
		[9]=228,
		[10]=229,
		}, -- 场景 ID
		level = 80,		-- 进入等级
		enterTimeLimit = 1800, -- 活动开始几秒后不能进入
		Awards = {
			[1]={type = 0, id = 459, mincount = 10, maxcount = 20,name = "星纹强化石",},			-- 随机1-10个
			[2]={type = 0, id = 459, mincount = 20, maxcount = 30,name = "星纹强化石",},			-- 随机1-20个
			[3]={type = 0, id = 459, mincount = 30, maxcount = 40,name = "星纹强化石",},			-- 随机1-30个
			[4]={type = 0, id = 459, mincount = 40, maxcount = 50,name = "星纹强化石",},			-- 随机1-40个
			[5]={type = 0, id = 459, mincount = 50, maxcount = 60,name = "星纹强化石",},			-- 随机1-50个
			[6]={type = 0, id = 459, mincount = 60, maxcount = 70,name = "星纹强化石",},			-- 随机1-60个
			[7]={type = 0, id = 459, mincount = 70, maxcount = 80,name = "星纹强化石",},			-- 随机1-70个
			[8]={type = 0, id = 459, mincount = 80, maxcount = 90,name = "星纹强化石",},			-- 随机1-80个
			[9]={type = 0, id = 459, mincount = 90, maxcount = 100,name = "星纹强化石",},			-- 随机1-90个
			[10]={type = 0, id = 459, mincount = 100, maxcount = 110,name = "星纹强化石",},			-- 随机1-100个
		},
		operator_point = {--传送员的位置
			{x=37, y=34},	--1
			{x=62, y=41},	--2
			{x=91, y=37},	--3
			{x=73, y=53},	--4
			{x=45, y=81},	--5
			{x=60, y=106},	--6
			{x=21, y=59},	--7
			{x=94, y=39},	--8
			{x=73, y=69},	--9
			{x=65, y=44},	--10
		},
		oprator_name = "秘境之旅传送";

	},-----------------------	

----------------------------------------
--世界BOSS		12:00--13:00  
----------------------------------------
	ShiJieBoss = {
		id = 21,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0021,				-- 活动名称
		timeDesc = Lang.dayactivity.time0021,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0021,           -- 参与条件
		entrance = Lang.dayactivity.talk0021,			-- 活动入口
		desc = Lang.dayactivity.desc0021,        		-- 活动描述
		rewardicon = {"iaward#1000#1#1#114","iaward#1000#1#1#123","iaward#1000#1#1#132","iaward#1000#1#1#5171"},	-- 奖励图标
		rewardicon1 = {"iaward#24#1","iaward#6#1"},	-- 奖励图标
		--预告时间标识
		-- trailStr = "onBroadcast_ShuangBeiLianYu_StartBefore5",
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\      ",
		level = 80,			-- 进入等级
		-- 活动规则
		activityCfg = "击杀世界boss，拿顶级装备，得酷炫称号！",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",

		-- 开放时间
		--{{开始时间(12:00)，结束时间(13:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{19, 25, 19, 35,},

			},

			lefttime = 600,
		},
			
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"世界BOSS", "沙漠土城", 100,132, "我也要参加"},
		sceneid = 119,		-- 活动场景id

		--buffid = 107, -- 双倍经验buff, 下线不保存
		-- 
		tTelport = {"世界BOSS", "沙漠土城", 100, 132,},
	},
	
----------------------------------------
--饕餮神殿		12:00--13:00  
----------------------------------------
	TaoTieShenDian = {
		id = 22,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0022,				-- 活动名称
		timeDesc = Lang.dayactivity.time0022,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0022,           -- 参与条件
		entrance = Lang.dayactivity.talk0022,			-- 活动入口
		desc = Lang.dayactivity.desc0022,        		-- 活动描述
		rewardicon = {"iaward#24#1","iaward#6#1"},	-- 奖励图标
		sceenId=318,
		--预告时间标识
		-- trailStr = "onBroadcast_ShuangBeiLianYu_StartBefore5",
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\      ",
 
		-- 活动规则
		activityCfg = "每一波刷新的怪物实力由低到高,并且带有丰富宝藏,看各位可以坚守多久",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		level = 80,			-- 进入等级
		-- 开放时间
		--{{开始时间(12:00)，结束时间(13:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{10,  00, 10, 30,},
				{15,  30, 16, 00,},

			},

			lefttime = 1800,
		},
			
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"饕餮神殿", "沙漠土城", 166,117, "我也要参加"},
		sceneid = 318,		-- 活动场景id

		--buffid = 107, -- 双倍经验buff, 下线不保存
		-- 
		tTelport = {"饕餮神殿", "沙漠土城", 166, 117,},
	},




----------------------------------------
--行会大乱斗		周日晚20:00-21:00  
----------------------------------------
	-- JiQingHangHui = {
	-- 	id = 23,
	-- 	isDelete = false, -- 活动是否已经删除
	-- 	name = Lang.dayactivity.name0023,				-- 活动名称
	-- 	timeDesc = Lang.dayactivity.time0023,          	-- 活动时间
	-- 	ruleDesc = Lang.dayactivity.rule0023,           -- 参与条件
	-- 	entrance = Lang.dayactivity.talk0023,			-- 活动入口
	-- 	desc = Lang.dayactivity.desc0023,        		-- 活动描述
	-- 	rewardicon = {"iaward#4#1"},	-- 奖励图标
	-- 	sceenId=339,
	-- 	--预告时间标识
	-- 	-- trailStr = "onBroadcast_ShuangBeiLianYu_StartBefore5",
	-- 	-- 活动跟踪小窗口
	-- 	tracktxt = "<(c0xffffc730)活动进度: >\\      ",
 
	-- 	-- 活动规则
	-- 	activityCfg = "击杀敌人越多，行会积分越高，则奖励越好！PK不红名~",
		
	-- 	-- 剩余时间
	-- 	residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
	-- 	level = 80,			-- 进入等级
	-- 	-- 开放时间
	-- 	--{{开始时间(12:00)，结束时间(13:00)}, ...}
	-- 	tOpenTime = {
	-- 		weeks={7},					--每周几号开放
	-- 		times = {
	-- 			--{{开始时间(9:50)，结束时间(10:00)}, ...}
	-- 			{20,  00, 21, 00,},

	-- 		},

	-- 		lefttime = 3600,
	-- 	},
			
	-- 	-- {活动名, 场景名, x坐标, y坐标, 按钮,}
	-- 	RwData = {"行会大乱斗", "沙漠土城", 149,120, "我也要参加"},
	-- 	sceneid = 339,		-- 活动场景id

	-- 	--buffid = 107, -- 双倍经验buff, 下线不保存
	-- 	-- 
	-- 	tTelport = {"行会大乱斗", "沙漠土城", 149,120,},
	-- },

	----------------------------------------

----------------------------------------
--王城boss	 
----------------------------------------
	TaoTieShenDian = {
		id = 24,
		isDelete = true, -- 活动是否已经删除
		name = Lang.dayactivity.name0024,				-- 活动名称
		timeDesc = Lang.dayactivity.time0024,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0024,           -- 参与条件
		entrance = Lang.dayactivity.talk0024,			-- 活动入口
		desc = Lang.dayactivity.desc0024,        		-- 活动描述
		rewardicon = {"iaward#24#1","iaward#6#1"},	-- 奖励图标
		sceenId=10,
		--预告时间标识
		-- trailStr = "onBroadcast_ShuangBeiLianYu_StartBefore5",
		-- 活动跟踪小窗口
		-- tracktxt = "<(c0xffffc730)活动进度: >\\      ",
 
		-- -- 活动规则
		-- activityCfg = "1.合服前5天，每天18:50刷新一只BOSS在王城地图;\\2.BOSS掉落无归属，BOSS被击杀后必掉一件9转装备",
		
		-- -- 剩余时间
		-- residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		-- level = 80,			-- 进入等级
		-- 开放时间
		--{{开始时间(12:00)，结束时间(13:00)}, ...}
		tOpenTime = {
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{19,  50, 20, 10,},

			},

			lefttime = 1200,
		},
			
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"王城BOSS", "热血王城", 134,140, "我也要参加"},
		sceneid = 10,		-- 活动场景id

	},

	-----------------------------------------------
--激情大本营
----------------------------------------
	JiQingDaBenYing = {
		id = 10000,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name10000,				-- 活动名称
		timeDesc = Lang.dayactivity.time10000,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule10000,           -- 参与条件
		entrance = Lang.dayactivity.talk10000,			-- 活动入口
		desc = Lang.dayactivity.desc10000,        		-- 活动描述
		rewardicon = {"iaward#1000#1#1#87", "iaward#1000#1#1#96", "iaward#1000#1#1#105"},	-- 奖励图标
		rewardicon1 = {"iaward#24#1" },	-- 奖励图标		
		--预告时间标识
		trailStr = "ArdourCampBeforeStart",
		
		-- 活动跟踪小窗口
		tracktxt = "<(c0xFF00c0ff)胜利奖励: >\\    <(iaward#26#1)><(c0xFF00ff00)皇宫大乱斗 x $value1$>\\   ",

		-- 活动规则
		activityCfg = "\\1.活动期间击杀热血王城中怪获得积分 \\2.15分时，积分前3名和随机7名角色被传送到皇宫地图\\皇宫中宝箱有几率获得7转武器衣服",
		
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			weeks={0},	--每周几号开放
			times = {
				--{{开始时间(19:00)，结束时间(19:15)}, ...}
				{19, 00, 19, 15},
			},

			lefttime = 1200,
		},		
				
		sceenId = 10, -- 场景 ID
		level = 80,		-- 进入等级
		-- enterTimeLimit = 600, -- 活动开始几秒后不能进入
		
	
		-- pdTimerSec = 8, -- 第几秒获得一次泡点经验
		-- pdExp = 10000, -- 泡点奖励		
		-- killActorPoint = 10, -- 击杀一名玩家获得积分
		
	
		-- {活动名, 场景名, x坐标, y坐标, 按钮,}
		RwData = {"皇宫大乱斗", "热血王城", 138, 144, "我也要参加"},
	},
	--------------------------------------------------------

	
	----------------------------------------
--新的元宝嘉年华	11:50-12:00
----------------------------------------
	YuanBaoJiaNianHuaNew = {
		id = 25,
		isDelete = false, -- 活动是否已经删除
		name = Lang.dayactivity.name0025,				-- 活动名称
		timeDesc = Lang.dayactivity.time0025,          	-- 活动时间
		ruleDesc = Lang.dayactivity.rule0025,           -- 参与条件
		entrance = Lang.dayactivity.talk0025,			-- 活动入口
		desc = Lang.dayactivity.desc0025,        		-- 活动描述
		rewardicon = {"iaward#3#1", "iaward#1000#1#1#87", "iaward#1000#1#1#96", "iaward#1000#1#1#105"},	-- 奖励图标
		rewardicon1 = {"iaward#3#1","iaward#24#1" },	-- 奖励图标
		level = 80,			-- 进入等级
		-- 活动跟踪小窗口
		tracktxt = "<(c0xffffc730)活动进度: >\\    <(c0xffd3be7d)当前波数: ><(c0xff00ff1e)$value1$/5波>\\<(c0xffd3be7d)小猪商队携带货物出现在沙漠土城，大伙抓紧机会劫杀抢宝吧!>\\<(c0xffffc730)收益统计: >\\    <(c0xffd3be7d)已拾取收益: ><(c0xff00ff1e)$value4$ 金币>",
 
		-- 活动规则
		activityCfg ="\\    1.活动期间共有5波小猪商队出现\\    2.击败他们可获得丰厚奖励\\    3.它们遇到攻击后就会乱跑,抓住它们!\\    4.活动结束后可前往NPC领取三倍收益",
 
		-- 剩余时间
		residuetime = "<(c0xff00ff1e)剩余时间: ><(c0xFFff0000)$value5$>",
		
		-- 开放时间
		tOpenTime = {
			openSvr = 3,                  -----开服第三天开启
			weeks={0},					--每周几号开放
			times = {
				--{{开始时间(9:50)，结束时间(10:00)}, ...}
				{16, 00, 16, 30,},
			},
			lefttime = 1800,
		},
		hasMonster={867,868,869}, --活动中有的怪物，都要在这里记录
		refreshTime = 300,--多少秒刷一次
		sceneId = 10,
		bossPos = {93,86}, -- x位置, y位置
		RwData = {"元宝嘉年华", "热血王城", 93, 86, "我也要参加"},
		refresh = {
			--第一波
			{
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			868,--元宝猪
			868,--元宝猪
			869,--猪boss
			},
			--第二波
			{
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			868,--元宝猪
			868,--元宝猪
			
			},
			--第三波
			{
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			868,--元宝猪
			868,--元宝猪
			869,--猪boss
			
			
			},
			
			
			
			--第四波
			{
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			868,--元宝猪
			868,--元宝猪
		
			},
			--第五波
			{
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			-- 867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			867,--金币猪
			868,--元宝猪
			868,--元宝猪
			869,--猪boss
			},
             
		},
	},



}