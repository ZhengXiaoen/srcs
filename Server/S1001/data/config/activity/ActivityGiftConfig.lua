--#include "..\..\language\LangCode.txt"

--每日充值 每日首充
ActivityGiftConfig = 
{
	--领取登录器奖励配置表
	--type ：奖励类型
	--id : 物品ID
	--count: 数量
	LoginGiftConfig = 
	{
		{type = 0, id = 675, count = 1, quality = 0, strong = 0, bind = 1},--直升丹*1
		{type = 0, id = 508, count = 1, quality = 0, strong = 0, bind = 1},--绑定金条*1
		{type = 0, id = 463, count = 3, quality = 0, strong = 0, bind = 1},--战将附体令
		{type = 0, id = 560, count = 1, quality = 0, strong = 0, bind = 1},--天山雪莲（60W）
	},

	--------每日特惠，总价88元，物品价值168元
	
	EveryDayPreference =
	{
		award = 
		{
			-- {type = 0, id = 544, count = 2, quality = 0, strong = 0, bind = 1},--高级转生修为丹*2---120元
			-- {type = 0, id = 542, count = 1, quality = 0, strong = 0, bind = 1},--初级转生修为丹*1---10元
			-- {type = 0, id = 458, count = 1, quality = 0, strong = 0, bind = 1},--狂暴之巅通行证*1---8元
			-- {type = 0, id = 530, count = 2, quality = 0, strong = 0, bind = 1},--盾灵卷轴*2---------20元
			-- {type = 0, id = 520, count = 2, quality = 0, strong = 0, bind = 1},--1000绑定元宝*2-----10元
		},
		consume = {{type=15,count=8888,id=0}},
	},

	-- --购买配置表
	-- EquipShieldCfg = 
	-- {
	-- 	needYuanBao = 1888,
	-- 	award = 
	-- 	{
	-- 		{type = 0,id = 530, count = 2, bind = 1},
	-- 		{type = 0,id = 543, count = 1, bind = 1},
	-- 		{type = 0,id = 943, count = 1, bind = 1},
	-- 		{type = 0,id = 816, count = 1, bind = 1},
	-- 		{type = 0,id = 676, count = 1, bind = 1},
	-- 	}
	-- },
	
	--充值赠送礼包
	RechargeGift = 
	{	
		--首冲
		{	
			id = 1,
			name = Lang.ScriptTips.chargegift001,
			Isrepeat = 1, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
		openSeverDay = 1,
			reward = 
			{
				{type = 0, id = 5172, count = 1, quality = 0, strong = 0, bind = 1},---散人神器
				{type = 0, id = 64, count = 1, quality = 0, strong = 0, bind = 1,job = 1},---彻地钉1级
				{type = 0, id = 65, count = 1, quality = 0, strong = 0, bind = 1,job = 2},---群体雷电术1级
				{type = 0, id = 66, count = 1, quality = 0, strong = 0, bind = 1,job = 3},---飓风破1级
				{type = 0, id = 5167, count = 50, quality = 0, strong = 0, bind = 1},---神魂(1000)
				{type = 0, id = 542, count = 10, quality = 0, strong = 0, bind = 1},---转生修为丹(小)
				{type = 0, id = 513, count = 80, quality = 0, strong = 0, bind = 1},---500万经验丹
				{type = 0, id = 553, count = 20, quality = 0, strong = 0, bind = 1},---战将灵力丹(大)
                {type = 0, id = 509, count = 100, quality = 0, strong = 0, bind = 1},---大金砖(绑金)
			}	
		}, 
		--每日充值
		--单笔10元 1000元宝
		{
			id = 2,
			name = Lang.ScriptTips.chargegift002,
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 1000,
			openSeverDay = 1,
			reward = 
			{	
			    -- {type = 0, id = 484, count = 1, quality = 0, strong = 0, bind = 1},	---功勋令牌*1
				-- {type = 0, id = 507, count = 1, quality = 0, strong = 0, bind = 1},	---金条(绑定金币)*1
				-- {type = 0, id = 535, count = 10, quality = 0, strong = 0, bind = 1},---护符碎片(1000颗)*10
				-- {type = 0, id = 569, count = 10, quality = 0, strong = 0, bind = 1},---护盾碎片(1000颗)*10
				-- {type = 0, id = 493, count = 1, quality = 0, strong = 0, bind = 1},	---翅膀魂石 白虎*1
				-- {type = 0, id = 860, count = 1, quality = 0, strong = 0, bind = 1},---宝藏钥匙
			}
		},
		--单笔50元 5000元宝
		{
			id = 3,
			name = Lang.ScriptTips.chargegift003,
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 5000, --充值积分
			openSeverDay = 1,
			reward = 
			{
				-- {type = 0, id = 484, count = 5, quality = 0, strong = 0, bind = 1},	---功勋令牌*5
				-- {type = 0, id = 507, count = 5, quality = 0, strong = 0, bind = 1},	---金条(绑定金币)*5
				-- {type = 0, id = 535, count = 50, quality = 0, strong = 0, bind = 1},---护符碎片(1000颗)*50
				-- {type = 0, id = 569, count = 50, quality = 0, strong = 0, bind = 1},---护盾碎片(1000颗)*50
				-- {type = 0, id = 493, count = 2, quality = 0, strong = 0, bind = 1},	---翅膀魂石 白虎*2
			}
		},
		--单笔100元 1W元宝
 		{
			id = 4,
			name = Lang.ScriptTips.chargegift004,
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 10000,
			openSeverDay = 1,
			reward = 
			{
				-- {type = 0, id = 484, count = 10, quality = 0, strong = 0, bind = 1},	---功勋令牌*10
				-- {type = 0, id = 507, count = 10, quality = 0, strong = 0, bind = 1},	---金条(绑定金币)*10
				-- {type = 0, id = 535, count = 100, quality = 0, strong = 0, bind = 1},---护符碎片(1000颗)*100
				-- {type = 0, id = 569, count = 100, quality = 0, strong = 0, bind = 1},---护盾碎片(1000颗)*100
				-- {type = 0, id = 493, count = 3, quality = 0, strong = 0, bind = 1},	---翅膀魂石 白虎*3
				-- {type = 0, id = 494, count = 1, quality = 0, strong = 0, bind = 1},	---翅膀魂石 青龙*1
				-- {type = 0, id = 495, count = 1, quality = 0, strong = 0, bind = 1},	---翅膀魂石 朱雀*1

			}
		},
		--单笔200元 2W元宝
		{
			id = 5,
			name = Lang.ScriptTips.chargegift005,
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 20000,
			openSeverDay = 1,
			reward = 
			{
				-- {type = 0, id = 484, count = 20, quality = 0, strong = 0, bind = 1},	---功勋令牌*20
				-- {type = 0, id = 507, count = 20, quality = 0, strong = 0, bind = 1},	---金条(绑定金币)*20
				-- {type = 0, id = 535, count = 200, quality = 0, strong = 0, bind = 1},---护符碎片(1000颗)*200
				-- {type = 0, id = 569, count = 200, quality = 0, strong = 0, bind = 1},---护盾碎片(1000颗)*200
				-- {type = 0, id = 494, count = 2, quality = 0, strong = 0, bind = 1},	---翅膀魂石 青龙*2
				-- {type = 0, id = 495, count = 2, quality = 0, strong = 0, bind = 1},	---翅膀魂石 朱雀*2
			}
		},
		--累积500元 5W元宝
		{
			id = 6,
			name = Lang.ScriptTips.chargegift006,
			Isrepeat = 1, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 50000,
			openSeverDay = 1,
			reward = 
			{
				-- {type = 0, id = 484, count = 50, quality = 0, strong = 0, bind = 1},	---功勋令牌*50
				-- {type = 0, id = 507, count = 50, quality = 0, strong = 0, bind = 1},	---金条(绑定金币)*50
				-- {type = 0, id = 536, count = 50, quality = 0, strong = 0, bind = 1},---护符碎片(10000颗)*50
				-- {type = 0, id = 570, count = 50, quality = 0, strong = 0, bind = 1},---护盾碎片(10000颗)*50
				-- {type = 0, id = 494, count = 3, quality = 0, strong = 0, bind = 1},	---翅膀魂石 青龙*3
				-- {type = 0, id = 495, count = 3, quality = 0, strong = 0, bind = 1},	---翅膀魂石 朱雀*3
			}
		},
		-------------------------------------------------------------------------------

		
		--每日充值（1）--官职礼包
		{
			id = 7,
			--name = Lang.ScriptTips.chargegift002,
			name = "绑金礼包",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 1000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{	
				-- {type = 0, id = 677, count = 1, quality = 0, strong = 0, bind = 1},	---超级金币箱
				-- {type = 0, id = 843, count = 1, quality = 0, strong = 0, bind = 1},	---3倍经验卷2小时
				-- {type = 0, id = 943, count = 1, quality = 0, strong = 0, bind = 1},	---特级宠物提升卷 X 1
				-- {type = 0, id = 540, count = 1, quality = 0, strong = 0, bind = 1},	---历练卷轴 X 1
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},	---副本传送卷 X 2
			}
		},
		--每日充值（2）--转生礼包
		{
			id = 8,
			--name = Lang.ScriptTips.chargegift002,
			name = "官职礼包",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 5000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{	
			    --     {type = 0, id = 816, count = 1, quality = 0, strong = 0, bind = 1},	---声望卷 X 1
			    --     {type = 0, id = 454, count = 2, quality = 0, strong = 0, bind = 1},	---生肖灵韵 X 2
				-- {type = 0, id = 536, count = 1, quality = 0, strong = 0, bind = 1},	---符魄盒大 X 1
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},	---副本传送卷 X 4
				-- {type = 0, id = 860, count = 1, quality = 0, strong = 0, bind = 1},	---金钥匙 X 1
			}
		},
		--每日充值（3）--转生礼包
		{
			id = 9,
			--name = Lang.ScriptTips.chargegift002,
			name = "转生礼包",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 10000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{
			    -- {type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 1},	---转生修为丹1颗
				-- {type = 0, id = 955, count = 1, quality = 0, strong = 0, bind = 1},	---特级BOSS召唤卷
				-- {type = 0, id = 454, count = 10, quality = 0, strong = 0, bind = 1},	---生肖灵韵 X 5
				-- {type = 0, id = 639, count = 20, quality = 0, strong = 0, bind = 1},	---血炼碎片 X 20
				-- {type = 0, id = 860, count = 2, quality = 0, strong = 0, bind = 1},	---金钥匙 X 2
			}
		},
		-------------------------------------------------------------------------------------------------------
		--每日充值（4）--特戒礼包
		{
			id = 10,
			--name = Lang.ScriptTips.chargegift002,
			name = "特戒礼包(小)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 20000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{	
			    --     {type = 0, id = 527, count = 5, quality = 0, strong = 0, bind = 1},	---特戒结晶 X 5
				-- {type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 1
				-- {type = 0, id = 562, count = 1, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 1
				-- {type = 0, id = 971, count = 4, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 4
				-- {type = 0, id = 860, count = 3, quality = 0, strong = 0, bind = 1},	---金钥匙 X 3
			}
		},
		--每日充值（4-1）--金刚石礼包
		{
			id = 11,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(小)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 20000, --充到多少就可以领
			openSeverDay = 2,
			group = {11,12,13},  --每一组的ID放在这里
			reward = 
			{
			    --     {type = 0, id = 936, count = 8, quality = 0, strong = 0, bind = 1},	---金刚石8颗			   
				-- {type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 1
				-- {type = 0, id = 562, count = 1, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 1
				-- {type = 0, id = 971, count = 4, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 4
				-- {type = 0, id = 860, count = 3, quality = 0, strong = 0, bind = 1},	---金钥匙 X 3
			}
		},
		--每日充值（4-2）--特戒礼包
		{
			id = 12,
			--name = Lang.ScriptTips.chargegift002,
			name = "特戒礼包(小)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 20000, --充到多少就可以领
			openSeverDay = 2,
			group = {11,12,13},
			reward = 
			{	
			    --     {type = 0, id = 527, count = 5, quality = 0, strong = 0, bind = 1},	---特戒结晶 X 5
				-- {type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 1
				-- {type = 0, id = 562, count = 1, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 1
				-- {type = 0, id = 971, count = 4, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 4
				-- {type = 0, id = 860, count = 3, quality = 0, strong = 0, bind = 1},	---金钥匙 X 3
			}
		},
		--每日充值（4-3）--升级石礼包
		{
			id = 13,
			--name = Lang.ScriptTips.chargegift002,
			name = "升级石礼包(小)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 20000, --充到多少就可以领
			openSeverDay = 2,
			group = {11,12,13},
			reward = 
			{	
			    --     {type = 0, id = 687, count = 5, quality = 0, strong = 0, bind = 1},	---升级石碎片5颗
				-- {type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 1
				-- {type = 0, id = 562, count = 1, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 1
				-- {type = 0, id = 971, count = 4, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 4
				-- {type = 0, id = 860, count = 3, quality = 0, strong = 0, bind = 1},	---金钥匙 X 3
			}
		},
		---------------------------------------------------------------------------------------------------------------
		--每日充值（5）--金刚石礼包
		{
			id = 14,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(中)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 50000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{	
			    --     {type = 0, id = 936, count = 15, quality = 0, strong = 0, bind = 1},	---金刚石15颗
				-- {type = 0, id = 676, count = 3, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 3
				-- {type = 0, id = 562, count = 2, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 2
				-- {type = 0, id = 971, count = 8, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 8
				-- {type = 0, id = 860, count = 5, quality = 0, strong = 0, bind = 1},	---金钥匙 X 5
			}
		},
		--每日充值（5-1）--金刚石礼包
		{
			id = 15,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(中)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 50000, --充到多少就可以领
			openSeverDay = 2,
			group = {15,16,17},
			reward = 
			{	
			    --     {type = 0, id = 936, count = 15, quality = 0, strong = 0, bind = 1},	---金刚石15颗
				-- {type = 0, id = 676, count = 3, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 3
				-- {type = 0, id = 562, count = 2, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 2
				-- {type = 0, id = 971, count = 8, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 8
				-- {type = 0, id = 860, count = 5, quality = 0, strong = 0, bind = 1},	---金钥匙 X 5
			}
		},			
		--每日充值（5-2）--特戒礼包
		{
			id = 16,
			--name = Lang.ScriptTips.chargegift002,
			name = "特戒礼包(中)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 50000, --充到多少就可以领
			openSeverDay = 2,
			group = {15,16,17},
			reward = 
			{	
			    --     {type = 0, id = 527, count = 10, quality = 0, strong = 0, bind = 1},	---特戒结晶 X 10
				-- {type = 0, id = 676, count = 3, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 3
				-- {type = 0, id = 562, count = 2, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 2
				-- {type = 0, id = 971, count = 8, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 8
				-- {type = 0, id = 860, count = 5, quality = 0, strong = 0, bind = 1},	---金钥匙 X 5
			}
		},
		--每日充值（5-3）--升级石礼包
		{
			id = 17,
			--name = Lang.ScriptTips.chargegift002,
			name = "升级石礼包(中)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 50000, --充到多少就可以领
			openSeverDay = 2,
			group = {15,16,17},
			reward = 
			{	
			    --     {type = 0, id = 687, count = 10, quality = 0, strong = 0, bind = 1},	---升级石碎片10颗
				-- {type = 0, id = 676, count = 3, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 3
				-- {type = 0, id = 562, count = 2, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 2
				-- {type = 0, id = 971, count = 8, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 8
				-- {type = 0, id = 860, count = 5, quality = 0, strong = 0, bind = 1},	---金钥匙 X 5
			}
		},
		-------------------------------------------------------------------------------------------------
		--每日充值（6）--金刚石礼包
		{
			id = 18,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 100000, --充到多少就可以领
			openSeverDay = 1,
			reward = 
			{	
			    --     {type = 0, id = 936, count = 30, quality = 0, strong = 0, bind = 1},	---金刚石30颗
				-- {type = 0, id = 676, count = 6, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 6
				-- {type = 0, id = 562, count = 4, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 4
				-- {type = 0, id = 971, count = 16, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 16
				-- {type = 0, id = 860, count = 10, quality = 0, strong = 0, bind = 1},	---金钥匙 X 10
			}
		},
		--每日充值（6-1）--金刚石礼包
		{
			id = 19,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 100000, --充到多少就可以领
			openSeverDay = 2,
			group = {19,20,21},
			reward = 
			{	
			    --     {type = 0, id = 936, count = 30, quality = 0, strong = 0, bind = 1},	---金刚石30颗
				-- {type = 0, id = 676, count = 6, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 6
				-- {type = 0, id = 562, count = 4, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 4
				-- {type = 0, id = 971, count = 16, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 16
				-- {type = 0, id = 860, count = 10, quality = 0, strong = 0, bind = 1},	---金钥匙 X 10
			}
		},
		--每日充值（6-2）--特戒礼包
		{
			id = 20,
			--name = Lang.ScriptTips.chargegift002,
			name = "特戒礼包(大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 100000, --充到多少就可以领
			openSeverDay = 2,
			group = {19,20,21},
			reward = 
			{	
			    --     {type = 0, id = 527, count = 20, quality = 0, strong = 0, bind = 1},	---特戒结晶 X 20
				-- {type = 0, id = 676, count = 6, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 6
				-- {type = 0, id = 562, count = 4, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 4
				-- {type = 0, id = 971, count = 16, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 16
				-- {type = 0, id = 860, count = 10, quality = 0, strong = 0, bind = 1},	---金钥匙 X 10
			}
		},
		--每日充值（6-3）--升级石礼包
		{
			id = 21,
			--name = Lang.ScriptTips.chargegift002,
			name = "升级石礼包(大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 100000, --充到多少就可以领
			openSeverDay = 2,
			group = {19,20,21},
			reward = 
			{	
			    --     {type = 0, id = 687, count = 20, quality = 0, strong = 0, bind = 1},	---升级石碎片20颗
				-- {type = 0, id = 676, count = 6, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 6
				-- {type = 0, id = 562, count = 4, quality = 0, strong = 0, bind = 1},	---高级圣魂丹 X 4
				-- {type = 0, id = 971, count = 16, quality = 0, strong = 0, bind = 1},	---真元丹(包) X 16
				-- {type = 0, id = 860, count = 10, quality = 0, strong = 0, bind = 1},	---金钥匙 X 10
			}
		},
		---------------------------------------------------------------------------------------------------------------
		--每日充值（7-1）--升级石礼包
		{
			id = 22,
			--name = Lang.ScriptTips.chargegift002,
			name = "金刚石礼包(特大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 200000, --充到多少就可以领
			openSeverDay = 5,
			group = {22,23,24},
			reward = 
			{	
			    --     {type = 0, id = 936, count = 60, quality = 0, strong = 0, bind = 1},	---金刚石60颗
				-- {type = 0, id = 676, count = 12, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 12
				-- {type = 0, id = 836, count = 1, quality = 0, strong = 0, bind = 1},	---超级声望卷 X 1==10000元宝
				-- {type = 0, id = 530, count = 20, quality = 0, strong = 0, bind = 1},	---盾灵卷轴 X 20==20000元宝
				-- {type = 0, id = 860, count = 20, quality = 0, strong = 0, bind = 1},	---金钥匙 X 20
			}
		},									
		--每日充值（7-2）--升级石礼包
		{
			id = 23,
			--name = Lang.ScriptTips.chargegift002,
			name = "特戒礼包(特大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 200000, --充到多少就可以领
			openSeverDay = 5,
			group = {22,23,24},
			reward = 
			{	
			    --     {type = 0, id = 527, count = 45, quality = 0, strong = 0, bind = 1},	---特戒结晶 X 40
				-- {type = 0, id = 676, count = 12, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 12
				-- {type = 0, id = 836, count = 1, quality = 0, strong = 0, bind = 1},	---超级声望卷 X 1==10000元宝
				-- {type = 0, id = 530, count = 20, quality = 0, strong = 0, bind = 1},	---盾灵卷轴 X 20==20000元宝
				-- {type = 0, id = 860, count = 20, quality = 0, strong = 0, bind = 1},	---金钥匙 X 20
			}
		},		
		--每日充值（7-3）--升级石礼包
		{
			id = 24,
			--name = Lang.ScriptTips.chargegift002,
			name = "钻晶礼包(特大)",
			Isrepeat = 2, --1：只能领取1次 2：可以重复领取
			RechargeIntegral = 0,
			money = 200000, --充到多少就可以领
			openSeverDay = 5,
			group = {22,23,24},
			reward = 
			{	
			    --     {type = 0, id = 538, count = 9, quality = 0, strong = 0, bind = 1},	---钻晶包 X 9
				-- {type = 0, id = 676, count = 12, quality = 0, strong = 0, bind = 1},	---超级经验丹 X 12
				-- {type = 0, id = 836, count = 1, quality = 0, strong = 0, bind = 1},	---超级声望卷 X 1==10000元宝
				-- {type = 0, id = 530, count = 20, quality = 0, strong = 0, bind = 1},	---盾灵卷轴 X 20==20000元宝
				-- {type = 0, id = 860, count = 20, quality = 0, strong = 0, bind = 1},	---金钥匙 X 20
			}
		},						
	},
	
	--收藏礼包
	CollectGameGiftConfig = 
	{
		{type = 0, id = 508, count = 1, quality = 0, strong = 0, bind = 1},	--1个金砖
		{type = 0, id = 561, count = 1, quality = 0, strong = 0, bind = 1},	--120W天山雪莲
		{type = 0, id = 678, count = 30, quality = 0, strong = 0, bind = 1},	--副本传送卷*30


	},
	
	--首冲扩展
	ShouChongEx = 
	{
		--首冲二挡
		{	
			name = "首冲二挡",
			money = 9900, --充到多少就可以领
			reward = 
			{
				{type = 0, id = 6021, count = 1, quality = 0, strong = 0, bind = 1},---百元大户称号
				{type = 0, id = 5170, count = 5, quality = 0, strong = 0, bind = 1},---神甲碎片*5
				{type = 0, id = 5167, count = 10, quality = 0, strong = 0, bind = 1},--神魂*1000
                {type = 0, id = 539, count = 5, quality = 0, strong = 0, bind = 1},--宝石结晶(10000)
                {type = 0, id = 574, count = 5, quality = 0, strong = 0, bind = 1},--圣珠结晶(10000)
				{type = 0, id = 509, count = 100, quality = 0, strong = 0, bind = 1},---大金砖(绑金)
			}	
		}, 
	}
}

