--#include "..\..\language\LangCode.txt"

--新区八天活动配置 不包含奖励配置
NewZoneActivityCfg = 
{
	--第一天活动
	{
		day = 1, --开服天数
		name = Lang.NewZoneActivity.name00001, --活动名称
		endTime = Lang.NewZoneActivity.endTime00001, --活动结束时间
		awardStart = Lang.NewZoneActivity.awardStart00001, --奖励发放时 
		iconId = 10, --显示64像素的图标ID
		rule={
			{ruleDesc=Lang.NewZoneActivity.rule100001},
			{ruleDesc=Lang.NewZoneActivity.rule100002},
		},
		btn = {
			{btnName=Lang.NewZoneActivity.btn100001, url="@@showWin,46"},
			{btnName=Lang.NewZoneActivity.btn100002, url="@@showWin,92,1"},
		},
		items = {
			{type = 0, id = 181, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
			{type = 0, id = 190, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
			{type = 0, id = 199, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
		},
	},
	--第二天活动
	{
		day = 2, --开服天数
		name = Lang.NewZoneActivity.name00002, --活动名称
		endTime = Lang.NewZoneActivity.endTime00002, --活动结束时间
		awardStart = Lang.NewZoneActivity.awardStart00002, --奖励发放时 
		iconId = 10, --显示64像素的图标ID
		rule = {
			{ruleDesc=Lang.NewZoneActivity.rule200001},
			{ruleDesc=Lang.NewZoneActivity.rule200002},
		},
		btn = {
			{btnName=Lang.NewZoneActivity.btn200001,url="M卧龙城:146:123:装备合成"},
		},
		items = {
			{type = 0, id = 182, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
			{type = 0, id = 191, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
			{type = 0, id = 200, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
		},
	},
	--第三天活动
	{
		day = 3, --开服天数
		name = Lang.NewZoneActivity.name00003, --活动名称
		endTime = Lang.NewZoneActivity.endTime00003, --活动结束时间
		awardStart = Lang.NewZoneActivity.awardStart00003, --奖励发放时 
		iconId = 10, --显示64像素的图标ID
		rule={
			{ruleDesc=Lang.NewZoneActivity.rule300001},
			{ruleDesc=Lang.NewZoneActivity.rule300002},
		},
		btn = {
			{btnName=Lang.NewZoneActivity.btn300001,url="@@showWin,4"},
		},
		items = {
			{type = 0, id = 188, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
			{type = 0, id = 197, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
			{type = 0, id = 206, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},   
		},
	},
	--第四天活动
	{
		day = 4, --开服天数
		name = Lang.NewZoneActivity.name00004, --活动名称
		endTime = Lang.NewZoneActivity.endTime00004, --活动结束时间
		awardStart = Lang.NewZoneActivity.awardStart00004, --奖励发放时 
		iconId = 10, --显示64像素的图标ID
		rule={
			{ruleDesc=Lang.NewZoneActivity.rule400001},
			{ruleDesc=Lang.NewZoneActivity.rule400002},
		},
		btn = {
			{btnName=Lang.NewZoneActivity.btn400001,url="@@showWin,1,1"},
		},
		items = {
			{type = 0, id = 189, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},    
			{type = 0, id = 198, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},    
			{type = 0, id = 207, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},    
		},
	},
	--第五天活动
	{
		day = 5, --开服天数
		name = Lang.NewZoneActivity.name00005, --活动名称
		endTime = Lang.NewZoneActivity.endTime00005, --活动结束时间
		awardStart = Lang.NewZoneActivity.awardStart00005, --奖励发放时 
		iconId = 10, --显示64像素的图标ID
		rule={
			{ruleDesc=Lang.NewZoneActivity.rule500001},
			{ruleDesc=Lang.NewZoneActivity.rule500002},
		},
		btn = {
			{btnName=Lang.NewZoneActivity.btn500001,url="@@showWin,7,2"},
		},
		items = {
			{type = 0, id = 184, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
			{type = 0, id = 193, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
			{type = 0, id = 202, count = 1, quality = 0, strong = 8, bind = 0, circle = 3},
		},
	},
--	--第六天活动
--	{
--		day = 6, --开服天数
--		name = Lang.NewZoneActivity.name00006, --活动名称
--		endTime = Lang.NewZoneActivity.endTime00006, --活动结束时间
--		awardStart = Lang.NewZoneActivity.awardStart00006, --奖励发放时 
--		iconId = 10, --显示64像素的图标ID
--		rule={
--			{ruleDesc=Lang.NewZoneActivity.rule600001},
--			{ruleDesc=Lang.NewZoneActivity.rule600002},
--		},
--		btn = {
--			{btnName=Lang.NewZoneActivity.btn600001,url="@@showWin,1,2"},
--		},
--		items = {
--			{type = 0, id = 212, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--			{type = 0, id = 221, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--			{type = 0, id = 230, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--		},
--	},
--	--第七天活动
--	{
--		day = 7, --开服天数
--		name = Lang.NewZoneActivity.name00007, --活动名称
--		endTime = Lang.NewZoneActivity.endTime00007, --活动结束时间
--		awardStart = Lang.NewZoneActivity.awardStart00007, --奖励发放时 
--		iconId = 10, --显示64像素的图标ID
--		rule={
--			{ruleDesc=Lang.NewZoneActivity.rule700001},
--			{ruleDesc=Lang.NewZoneActivity.rule700002},
--		},
--		btn = {
--			{btnName=Lang.NewZoneActivity.btn700001,url="M卧龙城:131:107:佣兵管理员"},
--		},
--		items = {
--			{type = 0, id = 213, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--			{type = 0, id = 222, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--			{type = 0, id = 231, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},   
--		},
--	},
--	--第八天活动
--	{
--		day = 8, --开服天数
--		name = Lang.NewZoneActivity.name00008, --活动名称
--		endTime = Lang.NewZoneActivity.endTime00008, --活动结束时间
--		awardStart = Lang.NewZoneActivity.awardStart00008, --奖励发放时 
--		iconId = 10, --显示64像素的图标ID
--		rule={
--			{ruleDesc=Lang.NewZoneActivity.rule800001},
--			{ruleDesc=Lang.NewZoneActivity.rule800002},
--		},
--		btn = {
--			{btnName=Lang.NewZoneActivity.btn800001,url="@@showWin,14"},
--		},
--		items = {
--			{type = 0, id = 208, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},
--			{type = 0, id = 217, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},
--			{type = 0, id = 226, count = 1, quality = 0, strong = 8, bind = 0, circle = 1},
--		},
--	},
}