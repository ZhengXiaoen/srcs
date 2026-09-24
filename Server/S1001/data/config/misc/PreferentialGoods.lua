--#include "..\..\language\LangCode.txt"



PreferentialGift = 
{
	--特惠礼包
	SpecialOffer = 
	{
		--王者大礼包
		{
			is_delete = true,
			id =1,
			str = "只需<font color='#00ff00'>888</font>元宝,即可购买<font color='#00ff00'>60级</font>职业套装,助您踏上王者之路<font color='#ff0000'>(限购一次)</font>",
			RechargeYB = 0,
			tips = "玩家<(n%s)>在特惠礼包面板内花费888元宝购买王者大礼包,获得60级职业套装!<我也要领取/@@showWin,99>",
			open_money = {type = 15,count = 888,logs = {208,Lang.LogTips.l00194}}, --打开该礼包需要多少元宝
			award = 
			{
				{type = 0,id = 238,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战盔
				{type = 0,id = 239,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战链
				{type = 0,id = 240,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战镯
				{type = 0,id = 240,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战镯
				{type = 0,id = 241,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战戒
				{type = 0,id = 241,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战戒
				{type = 0,id = 242,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战带
				{type = 0,id = 243,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 1},--弑杀战靴
												
				{type = 0,id = 244,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔盔
				{type = 0,id = 245,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔链
				{type = 0,id = 246,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔镯
				{type = 0,id = 246,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔镯
				{type = 0,id = 247,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔戒
				{type = 0,id = 247,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔戒
				{type = 0,id = 248,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔带
				{type = 0,id = 249,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 2},--弑神魔靴
												
				{type = 0,id = 250,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道盔
				{type = 0,id = 251,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道链
				{type = 0,id = 252,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道镯
				{type = 0,id = 252,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道镯
				{type = 0,id = 253,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道戒
				{type = 0,id = 253,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道戒
				{type = 0,id = 254,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道带
				{type = 0,id = 255,count = 1,quality = 0,strong = 0,bind = 0,sex = -1,job = 3},--弑魂道靴
				
			},
		},
		--佣兵大礼包
		{
			is_delete = true,
			id = 2,
			str = "只需<font color='#00ff00'>1888</font>元宝,即可购买<font color='#00ff00'>大量经验</font>,助您等级飞速提升<font color='#ff0000'>(限购一次)</font>",
			RechargeYB = 0,
			open_money = {type = 15,count = 1888}, --打开该礼包需要多少元宝
			tips = "玩家<(n%s)>在特惠礼包面板内花费1888元宝购买佣兵装备大礼包,获得佣兵经验超绚装备!<我也要领取/@@showWin,99>",
			--物品奖励
			award = 
			{
				{type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1},	---超级经验丹
				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 1},	---转生修为丹
				{type = 0, id = 844, count = 1, quality = 0, strong = 0, bind = 1},     ---3倍经验(3小时)
				{type = 0, id = 816, count = 2, quality = 0, strong = 0, bind = 1},	---声望卷 X 2
			}
		},
			--财神大礼包
		{
			is_delete = true,
			id = 3,
			str = "只需<font color='#00ff00'>8888</font>元宝,即可购买<font color='#00ff00'>财神大礼</font>,助您称霸游戏<font color='#ff0000'>(限购一次)</font>",
			RechargeYB = 0,
			open_money = {type = 15,count = 8888}, --打开该礼包需要多少元宝
			tips = "玩家<(n%s)>在特惠礼包面板内花费8888元宝购买财神大礼包,身价顿时提升!<我也要领取/@@showWin,99>",
			award = 
			{
				{type = 0,id = 677,count = 5,quality = 0,strong = 0,bind = 1},--超级金币箱 X 5（3000元宝）
				{type = 0,id = 543,count = 2,quality = 0,strong = 0,bind = 1},--转生修为丹 X2（2000元宝）
				{type = 0,id = 541,count = 10,quality = 0,strong = 0,bind = 1},--精羽毛 X 10（1000元宝）
				{type = 0,id = 562,count = 1,quality = 0,strong = 0,bind = 1},--高级圣魂丹 X 1（2000元宝）
				{type = 0,id = 816,count = 2,quality = 0,strong = 0,bind = 1},--声望卷 X2 （2000元宝）
				{type = 0,id = 527,count = 5,quality = 0,strong = 0,bind = 1},--特戒结晶 X 5（5000元宝）
		
			}
		},
		---开区前七天充值累积达到10000元宝，即可免费领取以下奖励
		{
			is_delete = true,
			id =4,
			str = "开服7天内,累积充值达<font color='#00ff00'>10000</font>元宝,即可<font color='#00ff00'>免费领取</font>本职业<font color='#ff0000'>70级神甲</font>一件",
			RechargeYB = 10000,
			open_money = {type = 15,count = 0}, --打开该礼包需要多少元宝
			award = 
			{
				{type = 0,id = 64,count = 1,quality = 0,strong = 0,bind = 0,sex = 0,job = 1},--70级逐日战甲(男)
				{type = 0,id = 65,count = 1,quality = 0,strong = 0,bind = 0,sex = 1,job = 1},--70级逐日战甲(女)
				{type = 0,id = 66,count = 1,quality = 0,strong = 0,bind = 0,sex = 0,job = 2},--70级奔月魔袍(男)
				{type = 0,id = 67,count = 1,quality = 0,strong = 0,bind = 0,sex = 1,job = 2},--70级奔月魔袍(女)
				{type = 0,id = 68,count = 1,quality = 0,strong = 0,bind = 0,sex = 0,job = 3},--70级追风道衣(男)
				{type = 0,id = 69,count = 1,quality = 0,strong = 0,bind = 0,sex = 1,job = 3},--70级追风道衣(女)
			},
		},
		--开区前七天充值累积达到20000元宝，即可免费领取以下奖励
		{
			is_delete = true,
			id = 5,
			str = "开服7天内,累积充值达<font color='#00ff00'>20000</font>元宝,即可<font color='#00ff00'>免费领取</font>本职业<font color='#ff0000'>70级武器</font>一把",
			RechargeYB = 20000,
			open_money = {type = 15,count = 0}, --打开该礼包需要多少元宝
			--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
			--物品奖励
			award = 
			{
				{type = 0,id = 14,count = 1,quality = 0,strong = 0,bind = 1,job = 1},--70级战士武器
				{type = 0,id = 15,count = 1,quality = 0,strong = 0,bind = 1,job = 2},--70级法师武器
				{type = 0,id = 16,count = 1,quality = 0,strong = 0,bind = 1,job = 3},--70级道士武器
				
			}
		},









		--散人传说礼包-- 高阶宝箱  
		{
			is_delete = false,
			id = 6,
			str = "",
			name = "高阶装备箱礼包",
			RechargeYB = 0,
			open_money = {type = 15,count = 728}, --购买该礼包需要多少元宝
			tips = "玩家<(n%s)>在开服特惠内购买了<高阶装备箱礼包>,获得高阶装备箱x5,幸运转转箱x5,星纹强化石x200!",
			award = 
			{
				{type = 0,id = 373,count = 5,quality = 0,strong = 0,bind = 1},--高阶装备箱
				{type = 0,id = 634,count = 5,quality = 0,strong = 0,bind = 1},--幸运转转向
				{type = 0,id = 459,count = 200,quality = 0,strong = 0,bind = 1},--强化石


			},
			expandTime = 0,
		},	

		
		--散人传说特惠礼包 -- 羽毛大礼包
		{
			is_delete = false,
			id = 7,
			str = "",
			name = "羽毛礼包(小)",
			RechargeYB = 0,
			open_money = {type = 15,count = 1088}, --购买该礼包需要多少元宝
			tips = "玩家<(n%s)>在开服特惠内购买了<羽毛礼包(小)>,获得大量1级羽毛!",
			--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
			--物品奖励
			award = 
			{
				{type = 0,id = 464,count = 268,quality = 0,strong = 0,bind = 1},--1级羽毛
				--{type = 0,id = 605,count = 1,quality = 0,strong = 0,bind = 1},--羽毛宝箱+3								
			},
			expandTime = 3,
			expandAwards = 
			{
				{   --额外的第一次
					name = "羽毛礼包(中)",
					open_money = {type = 15,count = 3188}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<羽毛礼包(中)>,获得大量1级羽毛!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 464,count = 888,quality = 0,strong = 0,bind = 1},--1级羽毛
						--{type = 0,id = 605,count = 1,quality = 0,strong = 0,bind = 1},--羽毛宝箱+3								
					},
				},
				{  	--额外的第2次
					name = "羽毛礼包(大)",
					open_money = {type = 15,count = 7088}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<羽毛礼包(大)>,获得大量1级羽毛!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 464,count = 1800,quality = 0,strong = 0,bind = 1},--1级羽毛
						--{type = 0,id = 605,count = 1,quality = 0,strong = 0,bind = 1},--羽毛宝箱+3								
					},
				},
				{	--额外的第3次
					name = "羽毛礼包(特)",
					open_money = {type = 15,count = 15288}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<羽毛礼包(特)>,获得大量1级羽毛!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 464,count = 3888,quality = 0,strong = 0,bind = 1},--2级羽毛
						--{type = 0,id = 605,count = 1,quality = 0,strong = 0,bind = 1},--羽毛宝箱+3								
					},
				},
			
			}
			
			
		},
		--散人传说特惠礼包 -- 战将大礼包
		{
			is_delete = false,
			id = 8,
			str = "",
			name = "战将大礼包",
			RechargeYB = 0,
			open_money = {type = 15,count = 728}, --购买该礼包需要多少元宝
			tips = "玩家<(n%s)>在开服特惠内购买了<战将大礼包>,获得大量灵力!",
			--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
			--物品奖励
			award = 
			{
				{type = 0,id = 552,count = 2,quality = 0,strong = 0,bind = 1},--战将灵力丹(中)		
				{type = 0,id = 507,count = 1,quality = 0,strong = 0,bind = 1},--金条(绑定)	
				{type = 0,id = 508,count = 1,quality = 0,strong = 0,bind = 1},--金砖(绑定)
				{type = 0,id = 4713,count = 1,quality = 0,strong = 0,bind = 1},--战将宝箱(小)

				
			},
			expandTime = 0,

		},		



		--散人传说金币大礼包
		{
			is_delete = false,
			id = 9,
			str = "",
			name = "乾坤金袋(小)",
			RechargeYB = 0,
			open_money = {type = 15,count = 728}, --购买该礼包需要多少元宝
			tips = "玩家<(n%s)>在开服特惠内购买了<乾坤金袋(小)>,获得大量绑金!",
			--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
			--物品奖励
			award = 
			{
				{type = 5,id= 0 ,count = 4388888}, --奖励的金钱
				
			},
			expandTime = 4,
			expandAwards = 
			{
				{   --额外的第一次
					name = "乾坤金袋(中)",
					open_money = {type = 15,count = 3188}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<乾坤金袋(中)>,获得大量绑金!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 5,id= 0 ,count = 18888888}, --奖励的金钱
						
					},
				},
				{  	--额外的第2次
					name = "乾坤金袋(大)",
					open_money = {type = 15,count = 5888}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<乾坤金袋(大)>,获得大量绑金!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 5,id= 0 ,count = 32288888}, --奖励的金钱
						
					},
				},
				{	--额外的第3次
					name = "乾坤金袋(特)",
					open_money = {type = 15,count = 7188}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<乾坤金袋(特)>,获得大量绑金!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 5,id= 0 ,count = 42988888}, --奖励的金钱

						
					},
				},
				{	--额外的第4次
					name = "乾坤金袋(超)",
					open_money = {type = 15,count = 8888}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<乾坤金袋(超)>,获得大量绑金!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 5,id= 0 ,count = 48388888}, --奖励的金钱
						
					},
				},
			
			}
		},

	
		
			--散人传说特惠礼包 -- 特戒大礼包
		{
			is_delete = false,
			id = 10,
			str = "",
			name = "特戒礼包(小)",
			RechargeYB = 0,
			open_money = {type = 15,count = 2280}, --购买该礼包需要多少元宝
			tips = "玩家<(n%s)>在开服特惠内购买了<特戒礼包(小)>,获得大量特戒结晶!",
			--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
			--物品奖励
			award = 
			{
				{type = 0,id = 527,count = 6,quality = 0,strong = 0,bind = 1},--特戒结晶(1) *6
				--{type = 0,id = 617,count = 1,quality = 0,strong = 0,bind = 1},--特戒结晶宝箱+3
				
			},
			expandTime = 3,
			expandAwards =
			{
				{
					name = "特戒礼包(中)",
					open_money = {type = 15,count = 5780}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<特戒礼包(中)>,获得大量特戒结晶!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 527,count = 15,quality = 0,strong = 0,bind = 1},--特戒结晶(1) *15
						--{type = 0,id = 617,count = 1,quality = 0,strong = 0,bind = 1},--特戒结晶宝箱+3
						
					},
				},
				{
					name = "特戒礼包(大)",
					open_money = {type = 15,count = 10280}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<特戒礼包(大)>,获得大量特戒结晶!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 527,count = 27,quality = 0,strong = 0,bind = 1},--特戒结晶(1) *27
						--{type = 0,id = 617,count = 1,quality = 0,strong = 0,bind = 1},--特戒结晶宝箱+3
						
					},
				},
				{
					name = "特戒礼包(特)",
					open_money = {type = 15,count = 19680}, --购买该礼包需要多少元宝
					tips = "玩家<(n%s)>在开服特惠内购买了<特戒礼包(特)>,获得大量特戒结晶!",
					--bind_coin = {type = 5,count = 20000000}, --奖励的金钱
					--物品奖励
					award = 
					{
						{type = 0,id = 527,count = 50,quality = 0,strong = 0,bind = 1},--特戒结晶(1) *50
						--{type = 0,id = 617,count = 1,quality = 0,strong = 0,bind = 1},--特戒结晶宝箱+3
						
					},
				},
			}
		},		


	},





 	
	WholePeople = 
	{
		{
			needPeople = {0,0,0,0,0,0,0},---价值44元
			needMoney = 1888,
			needLevel = 0,
			worth = 4400,
			award = 
			{
			        --青铜礼包第一天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 848,count = 1, bind = 1},--4倍经验卷3小时--10元
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
					-- {type = 0,id = 11,count = 1,job = 1, bind = 1},--60级战士武器
					-- {type = 0,id = 12,count = 1,job = 2, bind = 1},--60级法师武器
					-- {type = 0,id = 13,count = 1,job = 3, bind = 1},--60级道士武器
					-- {type = 0,id = 58,count = 1,job = 1,sex = 0, bind = 1},--60男战士衣服
					-- {type = 0,id = 59,count = 1,job = 1,sex = 1, bind = 1},--60女战士衣服
					-- {type = 0,id = 60,count = 1,job = 2,sex = 0, bind = 1},--60男法士衣服
					-- {type = 0,id = 61,count = 1,job = 2,sex = 1, bind = 1},--60女法士衣服
					-- {type = 0,id = 62,count = 1,job = 3,sex = 0, bind = 1},--60男道士衣服
					-- {type = 0,id = 63,count = 1,job = 3,sex = 1, bind = 1},--60女道士衣服
				},
				---青铜礼包第二天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 454,count = 20, bind = 1},--生肖灵韵*20
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},
				---青铜礼包第三天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 530,count = 2, bind = 1},--盾灵卷轴*2
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},
				---青铜礼包第四天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},
				--青铜礼包第五天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},
				--青铜礼包第六天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},
				--青铜礼包第七天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 849,count = 1, bind = 1},--5倍经验卷2小时
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 543,count = 1, bind = 1},--转生修为丹--10元
					-- {type = 0,id = 687,count = 2, bind = 1},--升级石碎片*2
				},																								
			}
		},
		{
			needPeople = {15,15,15,15,15,15,15},--价值34元
			needMoney = 2000,
			needLevel = 0,
			worth = 3400,
			award = 
			{
			        ---白银礼包第一天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 542,count = 30, bind = 1},--坐骑丹*30
					-- {type = 0,id = 541,count = 30, bind = 1},--精羽毛*30
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--白银礼包第二天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 454,count = 20, bind = 1},--生肖灵韵*20
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},
				--白银礼包第三天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 530,count = 2, bind = 1},--盾灵卷轴*2
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},
				--白银礼包第四天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},
				--白银礼包第五天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},
				--白银礼包第六天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},
				--白银礼包第七天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 5, bind = 1},--符魄盒*5--10元
					-- {type = 0,id = 537,count = 30, bind = 1},--钻晶*30
					-- {type = 0,id = 527,count = 1, bind = 1},--特戒结晶*1
					-- {type = 0,id = 816,count = 1, bind = 1},--声望卷*1
				},																								
			}
		},
		{
			needPeople = {30,30,30,30,30,30,30},--价值47元
			needMoney = 1500,
			needLevel = 0,
			worth = 4700,
			award = 
			{      
			        --黄金礼包第一天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 542,count = 40, bind = 1},--坐骑丹*40
					-- {type = 0,id = 541,count = 40, bind = 1},--精羽毛*40
					-- {type = 0,id = 816,count = 3, bind = 1},--声望卷*3
                                },
				--黄金礼包第二天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 454,count = 30, bind = 1},--生肖灵韵*30
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--黄金礼包第三天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 530,count = 3, bind = 1},--盾灵卷轴*3
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--黄金礼包第四天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 537,count = 40, bind = 1},--钻晶*40
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--黄金礼包第五天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 537,count = 40, bind = 1},--钻晶*40
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--黄金礼包第六天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 537,count = 40, bind = 1},--钻晶*40
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},
				--黄金礼包第七天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 8, bind = 1},--符魄盒*8--10元
					-- {type = 0,id = 537,count = 40, bind = 1},--钻晶*40
					-- {type = 0,id = 527,count = 2, bind = 1},--特戒结晶*2
					-- {type = 0,id = 816,count = 2, bind = 1},--声望卷*2
				},																								
			}
		},
		{
			needPeople = {60,60,60,60,60,60,60},--价值59元
			needMoney = 800,
			needLevel = 0,
			worth = 6000,
			award = 
			{
			       --钻石礼包第一天
				{
					-- {type = 0,id = 675,count = 1, bind = 1},--等级提升丹  10元
					-- {type = 0,id = 536,count = 12, bind = 1},--符魄盒*12--10元
					-- {type = 0,id = 542,count = 50, bind = 1},--坐骑丹*50
					-- {type = 0,id = 541,count = 50, bind = 1},--精羽毛*50
					-- {type = 0,id = 816,count = 4, bind = 1},--声望卷*4
				},
				--钻石礼包第二天
				{

				},
				--钻石礼包第三天
				{

				},
				--钻石礼包第四天
				{

				},
				--钻石礼包第五天
				{
	
				},
				--钻石礼包第六天
				{

				},
				--钻石礼包第七天
				{

				},																								
			}
		},
		{
			needPeople = {100,100,100,100,100,100,100},--价值60元
			needMoney = 0,
			needLevel = 65,
			worth = 6000,
			award = 
			{
			        --全民礼包第一天
				{

                                },
				--全民礼包第二天
				{

				},
				--全民礼包第三天
				{

				},
				--全民礼包第四天
				{

				},
				--全民礼包第五天
				{

				},
				--全民礼包第六天
				{
	
				},
				--全民礼包第七天
				{

				},																								
			}
		},				
	},
	
	--小抽奖
	SmallLottery = 
	{
		needScore = 2000,  --充值比例 1:100
		items = 
		{
			{

			},
			{

			},
			{

			},
			{

			},
			{

				
			},
			{

			},
			{

			},
			{

			},
			{

			},
		},
	},	
	
	--大抽奖
	BigLottery = 
	{
		needScore = 10000,  --充值比例 1:100
		items = 
		{
			{

			},
			{

			},
			{

			},
			{

			},
			
			{
				

			},
			
			{

			},
			
			{
	
			},
			
			{

			},

			{

			},
		},
	},		
	
	--累积限时大礼包
	TimelimitGift = 
	{
		openServerDay = 7,  --开服7天内
		needPayMoney = 20000,	--累积20000
		award = 
		{
			{	

			},						
		}
	},
	
	TimelimitBoss = 
	{
		{
			BossId = {{146},{147},{149},{150}},
			bossTips = "暗之领域教主位于:神之领域副本内<br/>请从卧龙城的副本总管处进入|暗之祭坛教主位于:修罗祭坛副本内<br/>请从卧龙城的副本总管处进入|暗之镇魔教主位于:镇魔宝塔副本内<br/>请从卧龙城的副本总管处进入|暗之蜀山教主位于:蜀山神殿副本内<br/>请从卧龙城的副本总管处进入",
			award = 
			{

			}
		},
		{
			BossId = {{135,286},{139,289},{333},{473}},--山谷教主，堕落教主，圣境教主，南疆教主
			bossTips = "山谷教主位置:查看挑战BOSS面板|堕落教主位置:查看挑战BOSS面板|圣境教主位置:查看挑战BOSS面板|南疆教主位置:查看挑战BOSS面板",
			award = 
			{

			}
		},
		{
			BossId = {{144,292},{266,298},{270,301},{468}},--天境魔王，迷失魔王，冰翼魔王，灭神魔王
			bossTips = "天境魔王位置:查看挑战BOSS面板|迷失魔王位置:查看挑战BOSS面板|冰翼魔王位置:查看挑战BOSS面板|灭神魔王位置:查看挑战BOSS面板|",
			award = 
			{

			}
		},
		{
			BossId = {{275,305},{331},{470},{471}},--毒龙魔王，圣境魔王，阿修罗魔王，帝释天魔王
			bossTips = "毒龙魔王位置:查看挑战BOSS面板|圣境魔王位置:查看挑战BOSS面板|阿修罗魔王位置:查看挑战BOSS面板|帝释天魔王位置:查看挑战BOSS面板|",
			award = 
			{

			}
		},
	},
		AthleticsGift = 
	{
		--翅膀竞技
		{	
			needYuanBao = 4888,
			award = 
			{

			}
		},
		--宝石竞技
		{	
			needYuanBao = 8888,
			award = 
			{

			}
		},
		--灵珠竞技
		{	
			needYuanBao = 8888,
			award = 
			{

			}
		},
	},
	
	--宝藏神装
	DreamRareEquip = 
	{
		--超稀有神装
		RareEquip = 
		{
				
		},
		
		--免伤装备
		SuitEquip = 
		{
				
		},
	},
}