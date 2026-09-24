-- 系统预告配置
--#include "..\..\language\langCode.txt"

 --因Int只能保存32位整形变量 因此现在ID为32个 ID不能重复使用，只能向后添加 删除系统 直接注释掉

SystemNotifyConfig =
{
	--[[
	--此配置为例子 ID从1开始
	{
		id = 0,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
		notifyLevel = 5,  --预告开始等级
		notifyOpenDay = 4,	--预告开始开服天数

		openLevel = 11,  --系统开放的等级
		openDay = 4,	--系统开放的开服天数

		systemName = Lang.SystemNotify.system9Title, --开放系统的名字，比如坐骑系统
		desc = Lang.SystemNotify.system9Desc, --系统功能描述

		icon = 29,  --开放系统对应图标
		openWindow = 67,	--系统开启窗口id

		guideDesc1 = "",
		guideDesc2 = "",

	},
	--]]

--	--攻击模式开启
--	{
--		id = 1,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 27,  --飞出预告按钮的图标类型
--		notifyLevel = 20,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 30,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system1Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system1Desc, --系统功能描述
--
--		openWindow = "",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 11,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc1,
--		guideDesc2 = Lang.SystemNotify.guideDesc2,
--	},
--
--	--师徒系统
--	{
--		id = 2,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 28,  --飞出预告按钮的图标类型
--		notifyLevel = 33,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 34,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system2Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system2Desc, --系统功能描述
--
--		openWindow = "24,2",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 10,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc3,
--		guideDesc2 = Lang.SystemNotify.guideDesc4,
--	},
--
--	--伴侣系统
--	{
--		id = 3,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 29,  --飞出预告按钮的图标类型
--		notifyLevel = 35,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 36,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system3Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system3Desc, --系统功能描述
--
--		openWindow = "24,4",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 10,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc5,
--		guideDesc2 = Lang.SystemNotify.guideDesc6,
--	},
--
--	--战队系统
--	{
--		id = 4,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 30,  --飞出预告按钮的图标类型
--		notifyLevel = 44,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 45,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system4Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system4Desc, --系统功能描述
--
--		openWindow = "24,3",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 10,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc7,
--		guideDesc2 = Lang.SystemNotify.guideDesc8,
--	},
--
--	--必杀技系统
--	{
--		id = 5,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 31,  --飞出预告按钮的图标类型
--		notifyLevel = 42,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 43,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system5Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system5Desc, --系统功能描述
--
--		openWindow = "",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 6,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc9,
--		guideDesc2 = Lang.SystemNotify.guideDesc10,
--	},
--
--	--坐骑系统
--	{
--		id = 6,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 32,  --飞出预告按钮的图标类型
--		notifyLevel = 31,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 32,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system6Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system6Desc, --系统功能描述
--
--		openWindow = "1,2",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 1,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc11,
--		guideDesc2 = Lang.SystemNotify.guideDesc12,
--	},
--
--	--魂石系统
--	{
--		id = 7,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 33,  --飞出预告按钮的图标类型
--		notifyLevel = 37,  --预告开始等级
--		notifyOpenDay = 0,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 42,  --系统开放的等级
--		openDay = 0,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system7Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system7Desc, --系统功能描述
--
--		openWindow = "1,3",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 1,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc13,
--		guideDesc2 = Lang.SystemNotify.guideDesc14,
--	},
--
--	--英雄系统
--	{
--		id = 8,		--因Int只能保存32位整形变量 因此现在ID为32个 (也用于系统对应图片ID)
--		buttonId = 34,  --飞出预告按钮的图标类型
--		notifyLevel = 46,  --预告开始等级
--		notifyOpenDay = 1,	--预告开始开服天数 (0代表不限制开服天数)
--
--		openLevel = 30,  --系统开放的等级
--		openDay = 5,	--系统开放的开服天数	(0代表不限制开服天数)
--
--		systemName = Lang.SystemNotify.system8Title, --开放系统的名字，比如坐骑系统
--		desc = Lang.SystemNotify.system8Desc, --系统功能描述
--
--		openWindow = "1,4",	--系统开启窗口格式（"窗口ID, 标签ID" ， ID从1开始）
--		systemButton = 1,	--指引按钮的系统tabID
--
--		guideDesc1 = Lang.SystemNotify.guideDesc15,
--		guideDesc2 = Lang.SystemNotify.guideDesc16,
--	},
--


}