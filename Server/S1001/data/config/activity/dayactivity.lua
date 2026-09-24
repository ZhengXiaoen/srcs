
--#include "..\..\language\LangCode.txt" once
--每日活动

DayActivity =
{
	{	--武林称霸
		type = "";
		title = Lang.dayactivity.title0001,		--”武林称霸“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"14:00-14:15",
				}
				},
			levelLimit ={
				minLevel = 49,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0001,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0001,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0001,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "武林争霸",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 2,				--对应的页
				activeName = "武林争霸",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 0,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0001,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 166, y = 170, entityName = Lang.EntityName.n00240},
		},
		desc = Lang.dayactivity.desc0001,        -- 活动额外描述
		award =
		{
			
			
		},
	},


	{	--仙女散花
		type = "";
		title = Lang.dayactivity.title0002,		--”仙女散花“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"15:00-15:15",
				}
				},
			levelLimit ={
				minLevel = 50,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0002,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0002,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0002,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "仙女散花",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 3,				--对应的页
				activeName = "仙女散花",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0002,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 151, y = 176, entityName = Lang.EntityName.n00268},
		},
		desc = Lang.dayactivity.desc0002,        -- 活动额外描述
		award =
		{
			
			
		},
	},

	{	--泉水涌现
		type = "";
		title = Lang.dayactivity.title0003,		--”泉水涌现“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"15:16-15:30",
				}
				},
			levelLimit ={
				minLevel = 50,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0003,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0003,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0003,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "泉水涌现",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 4,				--对应的页
				activeName = "泉水涌现",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0003,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 148, y = 179, entityName = Lang.EntityName.n00269},
		},
		desc = Lang.dayactivity.desc0003,        -- 活动额外描述
		award =
		{
			
			
		},
	},

	{	--部落大战
		type = "";
		title = Lang.dayactivity.title0005,		--”部落大战“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={3,6},
				weeks={0},
				minutes= 
				{
					"18:00-19:30",
				}
				},
			levelLimit ={
				minLevel = 50,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0005,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0005,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0005,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "部落大战",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 6,				--对应的页
				activeName = "部落大战",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0005,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 142, y = 185, entityName = Lang.EntityName.n00271},
		},
		desc = Lang.dayactivity.desc0005,        -- 活动额外描述
		award =
		{
			
			
		},
	},

	{	--沙城大战
		type = "";
		title = Lang.dayactivity.title0006,		--”沙城大战“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"20:00-22:00",
				}
				},
			levelLimit ={
				minLevel = 40,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0006,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0006,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0006,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "沙城大战",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 7,				--对应的页
				activeName = "沙城大战",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0006,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 157, y = 170, entityName = Lang.EntityName.n00232},
		},
		desc = Lang.dayactivity.desc0006,        -- 活动额外描述
		award =
		{
			
			
		},
	},

	{	--王城危机
		type = "";
		title = Lang.dayactivity.title0007,		--”王城危机“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"21:25-21:50",
				}
				},
			levelLimit ={
				minLevel = 50,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0007,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0007,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0007,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "王城危机",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 8,				--对应的页
				activeName = "王城危机",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0007,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 157, y = 170, entityName = Lang.EntityName.n00232},
		},
		desc = Lang.dayactivity.desc0007,        -- 活动额外描述
		award =
		{
			
			
		},
	},
	{	--夺宝奇兵
		type = "";
		title = Lang.dayactivity.title0008,		--”夺宝奇兵“的文字配置
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"22:30-23:30",
				}
				},
			levelLimit ={
				minLevel = 50,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
		conditionDesc = Lang.dayactivity.level0008,      -- 参加条件描述 
		timeDesc = Lang.dayactivity.time0008,           --参加时间描述
		ruleDesc = Lang.dayactivity.rule0008,           --活动规则描述
		content = 
		{

				type = 4,              --1表示任务，2表示活动，3表示打开界面，4根据阵营去指定npc
				typeTitle = "夺宝奇兵",		--对应类型的活动或者副本名字
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				pageId = 9,				--对应的页
				activeName = "夺宝奇兵",  --对应活动或者副本名字
				awardDesc = "推荐指数",	--奖励描述名字
				times = 1,			   --每日次数
				id = 31,            --任务的话就是任务的id,活动表示活动的ID，界面表示界面的Id
				star = 4,                          --奖励的星级
				desc = Lang.dayactivity.talk0008,	   --超链接标题
				pos = {sceneid = 5, sceneName = Lang.SceneName.s00005, x = 138, y = 185, entityName = Lang.EntityName.n00272},
		},
		desc = Lang.dayactivity.desc0008,        -- 活动额外描述
		award =
		{
			
			
		},
	}
}