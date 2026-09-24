    --功能提示
OpenFunctionConfig = 
{
	--------------左边的
	-- --神炉
	-- {
	-- 	type=1,					--类型
	-- 	showLevel=20,			--出现等级
	-- 	openLevel=30,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=0,	--累积登陆天数
	-- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "神炉装备,霸者象征",   --文字描述
	-- 	icon=10,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "高攻、高防、高生命、高暴击,尽在其中." ,     --动画结束的提示  
	-- },
	-- --翅膀
	-- {
	-- 	type=2,					--类型
	-- 	showLevel=31,			--出现等级
	-- 	openLevel=40,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=0,	--累积登陆天数
	-- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "绚丽外观,尽显个性",   --文字描述
	-- 	icon=11,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "材料副本、BOSS掉落、活动礼包,都可获得升级翅膀的材料!" ,     --动画结束的提示  
	-- },
	-- -- --战将
	-- -- {
	-- -- 	type=3,					--类型
	-- -- 	showLevel=42,			--出现等级
	-- -- 	openLevel=52,			--开发等级
	-- -- 	circle=0,				--转生条件 0等于没有
	-- -- 	accumulateLoginDay=0,	--累积登陆天数
	-- -- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- -- 	showDesc = "抗BOSS、抢BOSS,缺它不可",   --文字描述
	-- -- 	icon=12,
	-- -- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- -- 	enAnimationTips = "采用绑金即可升级战将等级,战将灵力又可大力提升战将战力!" ,     --动画结束的提示  
	-- -- },
	-- --成就
	-- {
	-- 	type=4,					--类型
	-- 	showLevel=61,			--出现等级
	-- 	openLevel=65,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=0,	--累积登陆天数
	-- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "荣誉的象征,一分耕耘一分收获",   --文字描述
	-- 	icon=13,
	-- 	isShowAnimation = true,   --p是否开启飞向功能图标的动画
	-- 	enAnimationTips = "完成各种成就任务获得成就值,可升级荣誉勋章!" ,     --动画结束的提示  
	-- },
	-- --锻造
	-- -- {
	-- -- 	type=5,					--类型
	-- -- 	showLevel=59,			--出现等级
	-- -- 	openLevel=64,			--开发等级
	-- -- 	circle=0,				--转生条件 0等于没有
	-- -- 	accumulateLoginDay=0,	--累积登陆天数
	-- -- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- -- 	showDesc = "强化和宝石镶嵌,大大提升装备战力",   --文字描述
	-- -- 	icon=14,
	-- -- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- -- 	enAnimationTips = "勇闯天关可获得强化材料,BOSS必爆宝石镶嵌材料." ,     --动画结束的提示  
	-- -- },
	-- --勇闯天关
	-- -- {
	-- -- 	type=6,					--类型
	-- -- 	showLevel=65,			--出现等级
	-- -- 	openLevel=70,			--开发等级
	-- -- 	circle=0,				--转生条件 0等于没有
	-- -- 	accumulateLoginDay=0,	--累积登陆天数
	-- -- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- -- 	showDesc = "检验战力的同时,获得强化材料和绑金.",   --文字描述
	-- -- 	icon=15,
	-- -- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- -- 	enAnimationTips = "闯关数越高,次日可进行扫荡的收获越大." ,     --动画结束的提示  
	-- -- -- },
	-- --转生
	-- {
	-- 	type=7,					--类型
	-- 	showLevel=71,			--出现等级
	-- 	openLevel=80,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=0,	--累积登陆天数
	-- 	showPos=1,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "历经转生,超凡脱俗.",   --文字描述
	-- 	icon=16,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "转生可提高战斗力并穿戴转生装备." ,     --动画结束的提示  
	-- },
	--------------------------------上面的

		--神将
	{
		type=18,					--类型
		showLevel=11,			--出现等级
		openLevel=15,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "协助你攻击怪物,打怪更效率.",   --文字描述
		icon=12,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,    --动画结束的提示 
		openWinId=118,			  --需要开启面板ID
		openWinIdParam=0,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 210,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击召唤",
				dir = 0,
				uiHelpId = 212,
				offsetX = 75, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 211,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},				  --引导
	},
	--护符
	{
		type=8,					--类型
		showLevel=20,			--出现等级
		openLevel=30,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "护符可增加超强的人物生命值.",   --文字描述
		icon=66,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,    --动画结束的提示 
		openWinId=129,			  --需要开启面板ID
		openWinIdParam=0,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 182,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},				  --引导
	},
	--翅膀
	{
		type=9,					--类型
		showLevel=31,			--出现等级
		openLevel=40,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "您无法抵挡这霸气外观的诱惑.",   --文字描述
		icon=60,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=110,			  --需要开启面板ID
		openWinIdParam=0,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 172,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc="点击关闭",
				dir = 0,
				uiHelpId = 173,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},
		},				  --引导 
	},
	--护盾
	{
		type=10,					--类型
		showLevel=41,			--出现等级
		openLevel=45,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "高级防御非它莫属.",   --文字描述
		icon=62,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=129,			  --需要开启面板ID
		openWinIdParam=1,		  --需要打开面板的索引		 
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 201,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},
		},				  --引导
	},
	--宝石
	{
		type=11,					--类型
		showLevel=51,			--出现等级
		openLevel=55,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "高级攻击,PK不可缺少的装备.",   --文字描述
		icon=59,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示  
		openWinId=129,			  --需要开启面板ID
		openWinIdParam=3,		  --需要打开面板的索引	
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 203,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},			
		},				  --引导
	},
		--军印
	{
		type=16,					--类型
		showLevel=56,			--出现等级
		openLevel=60,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "增加生命与魔法值",   --文字描述
		icon=61,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=129,			  --需要开启面板ID
		openWinIdParam=2,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 207,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标  3977 
				offsetY = -20, --偏移纵坐标				
			},			
		},				  --引导
	},
	--勋章
	{
		type=17,					--类型
		showLevel=61,			--出现等级
		openLevel=65,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "增加生命与魔法值",   --文字描述
		icon=65,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=19,			  --需要开启面板ID
		openWinIdParam=1,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 208,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 209,
				offsetX = 4, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},			
		},				  --引导
	},
	--圣珠
	{
		type=12,					--类型
		showLevel=70,			--出现等级
		openLevel=73,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "高级暴击,可给敌人致命一击的效果.",   --文字描述
		icon=64,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=129,			  --需要开启面板ID
		openWinIdParam=4,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击激活",
				dir = 0,
				uiHelpId = 205,
				offsetX = 48, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},			
		},				  --引导
	},
	--转生
	{
		type=15,					--类型
		showLevel=75,			--出现等级
		openLevel=80,			--开发等级
		circle=0,				--转生条件 0等于没有
		accumulateLoginDay=0,	--累积登陆天数
		showPos=1,				--展示的位置  1表示左边 2 表示上面
		showDesc = "历经转生,超凡脱俗.",   --文字描述
		icon=16,
		isShowAnimation = true,   --是否开启飞向功能图标的动画
		enAnimationTips = "" ,     --动画结束的提示 
		openWinId=1,			  --需要开启面板ID
		openWinIdParam=4,		  --需要打开面板的索引
		guide = {
			{
				desc = "点击查看",
				dir = 0,
				uiHelpId = 226,
				offsetX = 323, --偏移横坐标
				offsetY = 0, --偏移纵坐标				
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 163,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},			
		},				  --引导
	},
	
	

		
	-- --1转武器
	-- {
	-- 	type=13,					--类型
	-- 	showLevel=71,			--出现等级
	-- 	openLevel=255,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=2,	--累积登陆天数
	-- 	showPos=2,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "飞升武器,助您轻松玩转游戏.",   --文字描述
	-- 	icon=51,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "" ,     --动画结束的提示  
	-- },
	-- --1转衣服
	-- {
	-- 	type=14,					--类型
	-- 	showLevel=71,			--出现等级
	-- 	openLevel=255,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=2,	--累积登陆天数
	-- 	showPos=2,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "飞升衣服,生命从此不会轻易被威胁.",   --文字描述
	-- 	icon=58,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "" ,     --动画结束的提示  
	-- },
	-- --热血青年称号
	-- {
	-- 	type=15,					--类型
	-- 	showLevel=71,			--出现等级
	-- 	openLevel=255,			--开发等级
	-- 	circle=0,				--转生条件 0等于没有
	-- 	accumulateLoginDay=2,	--累积登陆天数
	-- 	showPos=2,				--展示的位置  1表示左边 2 表示上面
	-- 	showDesc = "个性称号,眼前一亮的感觉.",   --文字描述
	-- 	icon=63,
	-- 	isShowAnimation = true,   --是否开启飞向功能图标的动画
	-- 	enAnimationTips = "" ,     --动画结束的提示  
	-- 	-- guide = {
	-- 	-- 	{
	-- 	-- 		desc="点击角色",
	-- 	-- 		dir = 0,
	-- 	-- 		uiHelpId = 180,
	-- 	-- 		offsetX = 0, --偏移横坐标
	-- 	-- 		offsetY = 0, --偏移纵坐标				
	-- 	-- 	},
	-- 	-- 	{
	-- 	-- 		desc = "点击圣珠",
	-- 	-- 		dir = 2,
	-- 	-- 		uiHelpId = 202,
	-- 	-- 		offsetX = 0, --偏移横坐标
	-- 	-- 		offsetY = 0, --偏移纵坐标
	-- 	-- 	},
	-- 	-- 	{
	-- 	-- 		desc = "点击激活",
	-- 	-- 		dir = 0,
	-- 	-- 		uiHelpId = 203,
	-- 	-- 		offsetX = 0, --偏移横坐标
	-- 	-- 		offsetY = 0, --偏移纵坐标
	-- 	-- 	},
	-- 	-- },				  --引导
	-- },


}