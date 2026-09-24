--lua script
--#include "..\..\language\LangCode.txt" once

--小秘书

Secretary =
{
	{	--我要升级
		title = "我要升级",		--”我要升级“的文字配置
		desc = "经验日常,轻松升级",			-- 上提示标题  //////////// 新
		tips = "升级必做,海量经验",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "降妖除魔",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "降妖除魔",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "除魔师",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 115, y = 120, entityName = Lang.EntityName.n00251},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "膜拜城主",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "膜拜城主",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "城主雕像",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 141, y = 139, entityName = Lang.EntityName.n00239},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "膜拜盟主",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "膜拜盟主",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "武林盟主雕像",	   --超链接标题
						pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 167, y = 169, entityName = Lang.EntityName.n00240},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "击杀恶魔",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "击杀恶魔",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "恶魔岭接引人",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 127, y = 142, entityName = Lang.EntityName.n00237},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "封印结界",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "封印结界",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "封印结界使者",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 125, y = 140, entityName = Lang.EntityName.n00238},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "经验副本",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "经验副本",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "单人副本",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 135, y = 140, entityName = Lang.EntityName.n00248},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "仙女散花",		--对应类型的活动或者副本名字
						id = 94,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "仙女散花",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 135, y = 140, entityName = Lang.EntityName.n00248},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "安全挂机",		--对应类型的活动或者副本名字
						id = 94,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "安全挂机",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "传送员",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 147, y = 128, entityName = Lang.EntityName.n00261},
						        
							
					},
				},
			},
		},
	},
	{	--我要装备
		title = "我要装备",		--”我要升级“的文字配置
		desc = "极品装备,雄霸王城",			-- 上提示标题  //////////// 新
		tips = "神兵利器,我武惟扬",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
		
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "探索宝藏",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "探索宝藏",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 8, sceneName = Lang.SceneName.s00008, x = 21, y = 43, entityName = Lang.EntityName.n00155},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "财富广场",		--对应类型的活动或者副本名字
						id = 91,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "财富广场",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 8, sceneName = Lang.SceneName.s00008, x = 21, y = 43, entityName = Lang.EntityName.n00155},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "装备副本",		--对应类型的活动或者副本名字
						id = 251,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 251,				--对应的页
						activeName = "装备副本",  --对应活动或者副本名字
						awardDesc = "经验",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 20,			   --每日次数
						desc = "单人副本",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 135, y = 140, entityName = Lang.EntityName.n00248},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "功德宝石",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "功德宝石",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "功德师",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 113, y = 122, entityName = Lang.EntityName.n00252},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "乾坤护符",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "乾坤护符",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "乾坤符师",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 142, y = 119, entityName = Lang.EntityName.n00253},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "装备合成",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "装备合成",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "装备合成",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 146, y = 123, entityName = Lang.EntityName.n00262},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "特戒合成",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "特戒合成",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "特戒合成师",	   --超链接标题
						pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 123, y = 169, entityName = Lang.EntityName.n00247},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "福利领取",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "福利领取",  --对应活动或者副本名字
						awardDesc = "装备",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "福利官员",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 113, y = 128, entityName = Lang.EntityName.n00227},
						        
							
					},
				},
			},
		
		},
	},
	{	--我要装备
		title = "我要赚钱",		--”我要升级“的文字配置
		desc = "财源滚滚,用钱点烟",			-- 上提示标题  //////////// 新
		tips = "财大气粗,金币如山",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
		
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "百草采集",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "百草采集",  --对应活动或者副本名字
						awardDesc = "金钱",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "草药师",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 111, y = 124, entityName = Lang.EntityName.n00264},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "佣兵工资",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "佣兵工资",  --对应活动或者副本名字
						awardDesc = "金钱",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "佣兵管理员",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 131, y = 107, entityName = Lang.EntityName.n00254},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "金币满屋",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "金币满屋",  --对应活动或者副本名字
						awardDesc = "金钱",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "传送员",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 147, y = 128, entityName = Lang.EntityName.n00261},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "装备回收",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "装备回收",  --对应活动或者副本名字
						awardDesc = "金钱",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "装备回收",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 144, y = 121, entityName = Lang.EntityName.n00263},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "采集矿石",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "采集矿石",  --对应活动或者副本名字
						awardDesc = "金钱",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "军需官",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 129, y = 105, entityName = Lang.EntityName.n00235},
						        
							
					},
				},
			},
		},
	},
	{	--我要更强
		title = "我要变强",				--”我要升级“的文字配置
		desc = "提升属性,强化自身",			-- 上提示标题  //////////// 新
		tips = "威力大增,超乎想象",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
		
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "打造翅膀",		--对应类型的活动或者副本名字
						id = 1,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 1,				--对应的页
						activeName = "打造翅膀",  --对应活动或者副本名字
						awardDesc = "变强",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 111, y = 124, entityName = Lang.EntityName.n00264},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "合成坐骑",		--对应类型的活动或者副本名字
						id = 4,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 1,				--对应的页
						activeName = "合成坐骑",  --对应活动或者副本名字
						awardDesc = "变强",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 131, y = 107, entityName = Lang.EntityName.n00254},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "提升境界",		--对应类型的活动或者副本名字
						id = 1,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 3,				--对应的页
						activeName = "提升境界",  --对应活动或者副本名字
						awardDesc = "变强",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 144, y = 121, entityName = Lang.EntityName.n00263},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "天灵地宝",		--对应类型的活动或者副本名字
						id = 1,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "天灵地宝",  --对应活动或者副本名字
						awardDesc = "变强",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 144, y = 121, entityName = Lang.EntityName.n00263},
						        
							
					},
					{
                                                showPlace =2,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "轮回转生",		--对应类型的活动或者副本名字
						id = 1,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 4,				--对应的页
						activeName = "轮回转生",  --对应活动或者副本名字
						awardDesc = "变强",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 144, y = 121, entityName = Lang.EntityName.n00263},
						        
							
					},
				},
			},
		},
	},
	{	--我要更强
		title = "我要增益",				--”我要升级“的文字配置
		desc = "增益buff,胜人一筹",			-- 上提示标题  //////////// 新
		tips = "优化自身,快人一步",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
		
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "天下第一",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "天下第一",  --对应活动或者副本名字
						awardDesc = "增益",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "天下第一男战士",	   --超链接标题
						pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 136, y = 142, entityName = Lang.EntityName.n00241},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "充值排行",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "充值排行",  --对应活动或者副本名字
						awardDesc = "增益",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "排行榜管理",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 127, y = 107, entityName = Lang.EntityName.n00256},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "捐献排行",		--对应类型的活动或者副本名字
						id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "捐献排行",  --对应活动或者副本名字
						awardDesc = "增益",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "排行榜管理",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 127, y = 107, entityName = Lang.EntityName.n00256},
						        
							
					},
				},
			},
		},
	},
	{	--我要PK
		title = "我要挑战",				--”我要升级“的文字配置
		desc = "热血战斗,铸造传奇",			-- 上提示标题  //////////// 新
		tips = "巅峰荣耀,称霸大陆",			-- 下提示标题  //////////// 新
		content	=
		{
			{
				--1-500区间的配置	
				minLv = 1,		
				maxLv = 500,
	
				context = 
				{--具体任务
		
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "部落战争",		--对应类型的活动或者副本名字
						id = 94,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "部落战争",  --对应活动或者副本名字
						awardDesc = "PK",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 136, y = 142, entityName = Lang.EntityName.n00241},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "夺宝奇兵",		--对应类型的活动或者副本名字
						id = 94,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "夺宝奇兵",  --对应活动或者副本名字
						awardDesc = "PK",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 127, y = 107, entityName = Lang.EntityName.n00256},
						        
							
					},
					{
                                                showPlace =1,          --1 表示上  2表示下 ////////// 新增的

						type = 3,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
						typeTitle = "泉水涌现",		--对应类型的活动或者副本名字
						id = 94,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
						pageId = 2,				--对应的页
						activeName = "泉水涌现",  --对应活动或者副本名字
						awardDesc = "PK",	--奖励描述名字
						star = 5,                          --奖励的星级
						times = 0,			   --每日次数
						desc = "详细",	   --超链接标题
						pos = {sceneid = 2, sceneName = Lang.SceneName.s00002, x = 127, y = 107, entityName = Lang.EntityName.n00256},
						        
							
					},
				},
			},
		},
	},
}



