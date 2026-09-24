--#include "..\..\..\language\LangCode.txt"
--活动开启提示公告配置  配这个配置时候一定注意id对应索引
----活动弹窗配置

activityTips = 
{
	--富贵兽献瑞,id=1
	{
		id = 1,
		level = 70,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
		iconid=1,
		isDelete = true,
        link = "",--活动传送位置，如："m沙漠土城:86:124:月老"
		name = Lang.ActivityName.name00072, --活动的名字
		award = {{type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=4,count=1,id=0},
			 {type=6,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)10:30-10:50>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,土城><(c0xFFFF0000)(173:129)><(c0xFFF888888)处刷出BOSS><(c0xFFFF0000)(麒麟富贵兽)><(c0xFFF888888),每次击杀富贵兽可获得大量经验和绑金,根据玩家自身攻击,获得不同数量的经验和绑金,富贵兽死亡有几率爆出高级装备和材料.>",
		ensure = "", --弹窗点击进入地图地点
		awardDesc = "绑金、经验",  --奖励描述
		time = "10:30-10:50",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 1,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"10:30-10:50",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
    },
	--膜拜城主雕像,id=2
	{
		id = 2,
		level = 60,		--弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
		isDelete = false,
        link = "",--活动传送位置
		name =Lang.ActivityName.name00073, --活动的名字
		award = {{type=3,count=1,id=0}},--经验图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFFF0000)卧龙城-城主雕像>\\\\<(c0xFF888888)活动时间:><(c0xFFFF0000)11:30-12:30>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,去卧龙城找城主雕像点击膜拜城主,在卧龙城安全区内可获得><(c0xFFFF0000)大量经验><(c0xFFF888888),城主可获得双倍奖励.>",
		ensure = "城主雕像,2,城主雕像",
		awardDesc = "绑金、经验",  --奖励描述
		time = "11:30-12:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 6,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"11:30-12:30",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--武林争霸大赛,id=3
	{
		id = 3,
		level = 60,		--弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
	    moveLimit = 60,--免费速传持续时间（秒） 从弹出框开始算起
		isDelete = false,
        link = "",--活动传送位置
		name =Lang.ActivityName.name00074, --活动的名字
		award = {{type=1,count=1,id=0},--元宝图标
		         {type=2,count=1,id=0}},--绑金图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFFF0000)土城-武林争霸>\\\\<(c0xFF888888)活动时间:><(c0xFFFF0000)12:40-13:20>\\\\<(c0xFF888888)活动介绍:><(c0xFFFF0000)12:40-12:49><(c0xFFF888888)为报名时间(找土城NPC-武林争霸报名即可,)><(c0xFFFF0000)12:50-13:20><(c0xFFF888888)为争霸时间(已报名玩家可进入场地自由PK,地图内不增加PK值,活动时间结束时,争霸场地内)><(c0xFFFF0000)只剩下一名玩家><(c0xFFF888888)则,该玩家为胜利者,可获得丰厚的元宝和绑金奖励,有报名参赛未获胜的玩家也可在NPC-武林争霸处领取绑金的安慰奖.>",
		ensure = "武林争霸,3,武林争霸",
		awardDesc = "元宝、绑金",  --奖励描述
		time = "12:50-13:20",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 9,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"12:50-13:20",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--全服双倍经验,id=4
	{
		id = 4,
		level = 0,		--弹窗的玩家最低等级 38表示等级>=38的玩家才弹出此窗
		delay = 0,	--此活动不弹窗
		moveLimit = 0,	--此活动不弹窗
        link = "",--活动传送位置
		isDelete = true,
		name =Lang.ActivityName.name00075, --活动的名字
		award = {{type=3,count=1,id=0}},--经验图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)13:30-16:30>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,杀任意怪均可享受><(c0xFFFF0000)双倍经验><(c0xFFF888888)奖励,使用><(c0xFFFF0000)多倍经验材料><(c0xFFF888888)可叠加经验奖励.>",
		ensure = "",
		awardDesc = "经验",  --奖励描述
		time = "13:30-16:30",  --开启时间
		isShowCdIcon = false,   --是否显示倒计时的图标
		iconid = 7,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"13:30-16:30",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--富贵兽献瑞,id=5
	{
		id = 5,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
		isDelete = true,
        link = "",--活动传送位置
		name = Lang.ActivityName.name00072, --活动的名字
        award = {{type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=4,count=1,id=0},
			 {type=6,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)14:00-14:20>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,土城><(c0xFFFF0000)(173:129)><(c0xFFF888888)处刷出BOSS><(c0xFFFF0000)(麒麟富贵兽)><(c0xFFF888888),每次击杀富贵兽可获得大量经验和绑金,根据玩家自身攻击,获得不同数量的经验和绑金,富贵兽死亡有几率爆出高级装备和材料.>",
		ensure = "",
		awardDesc = "绑金、经验",  --奖励描述
		time = "14:00-14:20",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 1,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"14:00-14:20",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--黄金满屋,id=6
	{
		id = 6,	
		level = 60,		--弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
        link = "",--活动传送位置
		isDelete = true,
		name =Lang.ActivityName.name00076, --活动的名字
		award = {{type=2,count=1,id=0}},--绑金图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)15:30-16:00>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,黄金满屋地图内刷新150只><(c0xFFFF0000)真假黄金战神><(c0xFFF888888),其中有一部分为真黄金战神,可直接爆出><(c0xFFFF0000)金条><(c0xFFF888888),一部分为假黄金战神,只爆小堆绑定绑金.>",
		ensure = "黄金满屋,3,黄金满屋",
		awardDesc = "绑定绑金",  --奖励描述
		time = "15:30-16:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 4,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"15:30-16:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--黑龙军团,id=7
	{
		id = 7,	
		level = 60,		--弹窗的玩家最低等级 38表示等级>=38的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
        link = "",--活动传送位置
		isDelete = true,
		name =Lang.ActivityName.name00077, --活动的名字
		award = {{type=4,count=1,id=0},--装备图标
		         {type=6,count=1,id=0},--材料图标
		         {type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)16:30-17:00>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,土城黑龙神殿><(c0xFFFF0000)(150:127)><(c0xFFF888888)处涌现出黑龙大军,疯狂侵袭土城安全区附近的><(c0xFFFF0000)(109:91)><(c0xFFF888888)处,消灭黑龙大军,有机会获得高级装备和材料.>",
		ensure = "",
	    awardDesc = "装备、材料",  --奖励描述
		time = "16:30-17:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 2,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"16:30-17:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--膜拜城主雕像,id=8
	{
		id = 8,	
		level = 60,		--弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
        link = "",--活动传送位置
		isDelete = false,
		name =Lang.ActivityName.name00073, --活动的名字
		award = {{type=3,count=1,id=0}},
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFFF0000)卧龙城-城主雕像>\\\\<(c0xFF888888)活动时间:><(c0xFFFF0000)11:30-12:30>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,去卧龙城找城主雕像点击膜拜城主,在卧龙城安全区内可获得><(c0xFFFF0000)大量经验><(c0xFFF888888),城主可获得双倍奖励.>",
		ensure = "城主雕像,2,城主雕像",
	    awardDesc = "经验",  --奖励描述
		time = "17:30-18:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 6,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"17:30-18:30",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--全服双倍经验,id=9
	{
		id = 9,	
		level = 0,		--弹窗的玩家最低等级 38表示等级>=38的玩家才弹出此窗
		delay = 0,	--此活动不弹窗
		moveLimit = 0,	--此活动不弹窗
        link = "",--活动传送位置
		isDelete = true,
		name =Lang.ActivityName.name00075, --活动的名字
		award = {{type=3,count=1,id=0}},--经验图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)19:00-21:00>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,杀任意怪均可享受><(c0xFFFF0000)双倍经验><(c0xFFF888888)奖励,使用><(c0xFFFF0000)多倍经验材料><(c0xFFF888888)可叠加经验奖励.>",
		ensure = "",
		awardDesc = "经验",  --奖励描述
		time = "19:00-21:00",  --开启时间
		isShowCdIcon = false,   --是否显示倒计时的图标
		iconid = 7,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"19:00-21:00",
				}
				},
			levelLimit ={
				minLevel = 0,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--黑龙魔君散宝,id=10
	{
		id = 10,	
		level = 60,		--弹窗的玩家最低等级 38表示等级>=38的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
        link = "",--活动传送位置
		isDelete = false,
		name =Lang.ActivityName.name00078, --活动的名字
		award = {{type=1,count=1,id=0},--元宝图标
		         {type=4,count=1,id=0},--装备图标
		         {type=6,count=1,id=0},--材料图标
		         {type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)19:10-19:40>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,黑龙神殿内刷新一BOSS><(c0xFFFF0000)黑龙魔君><(c0xFFF888888),BOSS的存活时间为25分钟,玩家必须在25分钟内击败黑龙,否则黑龙消失,当黑龙被击败后,地图内自动降落><(c0xFFFF0000)满地财宝><(c0xFFF888888)各种高级装备和材料应有尽有,拾取模式为:><(c0xFFFF0000)自由拾取模式><(c0xFFF888888)地图内PK不增加PK值,但死亡会掉落装备.>",
		ensure = "黑龙神殿,3,黑龙神殿",
		awardDesc = "元宝、装备、材料",  --奖励描述
		time = "19:10-19:40",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 3,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"19:10-19:40",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--王城危机,id=11
	{
		id = 11,	
		level = 60,		--弹窗的玩家最低等级 38表示等级>=38的玩家才弹出此窗
		delay = 60,	--弹窗持续时间（秒）
		moveLimit = 60,	--免费速传持续时间（秒） 从弹出框开始算起
        link = "",--活动传送位置
		isDelete = true,
		name =Lang.ActivityName.name00079, --活动的名字
		award = {{type=4,count=1,id=0},--装备图标
		         {type=6,count=1,id=0},--材料图标
		         {type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)21:00-21:30>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动期间,王城将受到><(c0xFFFF0000)神威魔王><(c0xFFF888888)侵袭,消灭神威魔王,有机会获得高级装备和各种材料.>",
		ensure = "",
		awardDesc = "装备、材料",  --奖励描述
		time = "21:00-21:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 8,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"21:00-21:30",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--富贵兽献瑞,id=12
	{
		id = 12,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = true,
		name = Lang.ActivityName.name00072, --活动的名字
		award = {{type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=4,count=1,id=0},
			 {type=6,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)22:10-22:30>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,土城><(c0xFFFF0000)(173:129)><(c0xFFF888888)处刷出BOSS><(c0xFFFF0000)(麒麟富贵兽)><(c0xFFF888888),每次击杀富贵兽可获得大量经验和绑金,根据玩家自身攻击,获得不同数量的经验和绑金,富贵兽死亡有几率爆出高级装备和材料.>",
		ensure = "",
		awardDesc = "绑金、经验",  --奖励描述
		time = "22:10-22:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 1,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"22:10-22:30",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	  --武林争霸报名,id=13
	{
		id = 13,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
		isDelete = false,
        link = "",--活动传送位置
		name = Lang.ActivityName.name00080, --活动的名字
		award = {{type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "<(c0xFF888888)报名时间:><(c0xFFFF0000)12:40-12:49>\\<(c0xFF888888)报名详解:><(c0xFFF888888)参与武林争霸活动需要事先报名,报名时间系统会自动弹出窗口供给报名,也可直接到土城NPC><(c0xFFFF0000)(武林争霸)><(c0xFFF888888)处点击报名.>",
		ensure = "",
		awardDesc = "元宝、绑金",  --奖励描述
		time = "12:40-12:49",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 9,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"12:40-12:49",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	-- --行会争霸赛,id=14
	 {
	 	id = 14,	
	 	level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
	 	delay = 60,  --弹窗持续时间（秒）
	 	moveLimit = 60,
         link = "",--活动传送位置
	 	isDelete = true,
	 	name = Lang.ActivityName.name00081, --活动的名字
	 	award = {{type=4,count=1,id=0},--装备图标
	 	         {type=6,count=1,id=0},--材料图标
	 	         {type=3,count=1,id=0},--经验图标
	          {type=2,count=1,id=0}},--绑金图标，根据type显示图标
	 	tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-行会争霸>\\\\<(c0xFF888888)活动时间:><(c0xFFF888888)14:40-15:10>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开始时,有加入行会并且等级大于60级玩家均可参加,活动开始的10分钟内,玩家可从卧龙城NPC处反复进入赛场,10分钟后即14点50分止,赛场大门关闭,赛场内开始角逐胜负,赛场内将不是本行会玩家清理出去,只剩下本行会玩家,则该行会获胜,系统会在场景内依次刷出10只BOSS,杀死BOSS有机会爆出全服一切物品和装备!(地图内不增加PK值,死亡不掉落装备)>",
	 	ensure = "",
	 	awardDesc = "绑金、经验",  --奖励描述
	 	time = "14:40-15:10",  --开启时间
	 	isShowCdIcon = true,   --是否显示倒计时的图标
	 	condition =             -- 参加条件
	 	{
	 		timeLimit = {
	 			months={0}, 
	 			days ={0},
	 			weeks={0},
	 			minutes= 
	 			{
	 				"14:40-15:10",
	 		}
	 			},
	 		levelLimit ={
	 			minLevel = 60,
	 			maxLevel = -1,
	 			},
	 		openSererday ={maxDay =-1,minDay=-1,},
	 	},
	 },
	-- --泉水阵地,id=15
	 {
	 	id = 15,	
	 	level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
	 	delay = 60,  --弹窗持续时间（秒）
	 	moveLimit = 60,
         link = "",--活动传送位置
	 	isDelete = true,
	 	name = Lang.ActivityName.name00068, --活动的名字
	 	award = {{type=1,count=1,id=0},--元宝图标
	 	         {type=4,count=1,id=0},--装备图标
	 		 {type=6,count=1,id=0}},--材料图标，根据type显示图标
	 	tips = "\\<(c0xFF888888)活动时间:><(c0xFFF888888)18:40-18:55>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)进入场景→领取泉水罐→将泉水罐装备符处→抢占泉水位→开始装水→装满泉水→兑换珍宝,兑换珍宝在土城安全区周围NPC(泉水结阵)处.>",
	 	ensure = "",
	 	awardDesc = "各种珍宝",  --奖励描述
	 	time = "18:40-18:55",  --开启时间
	 	isShowCdIcon = true,   --是否显示倒计时的图标
	 	condition =             -- 参加条件
	 	{
	 		timeLimit = {
	 			months={0}, 
	 			days ={0},
	 			weeks={0},
	 			minutes= 
	 		{
	 				"18:40-18:55",
	 			}
	 			},
	 		levelLimit ={
	 			minLevel = 60,
	 			maxLevel = -1,
	 			},
	 		openSererday ={maxDay =-1,minDay=-1,},
	 	},
	 },
	--佛光普照,id=16
	{
		id = 16,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = true,
		name = Lang.ActivityName.name00082, --活动的名字
		award = {{type=3,count=1,id=0},--经验图标
		         {type=2,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)13:30-13:45>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,系统自动弹窗进入场地,地图内有两座><(c0xFFFF0000)(金佛)><(c0xFFF888888)玩家需要抢占金佛四周的标志圈位置,每秒可获得超高经验和绑金奖励,场景内还会刷BOSS哦.>",
		ensure = "",
		awardDesc = "绑金、经验",  --奖励描述
		time = "13:30-13:45",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 5,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"13:30-13:45",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--金佛献福,id=17
	{
		id = 17,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = true,
		name = Lang.ActivityName.name00082, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动时间:><(c0xFFFF0000)13:30-13:45>\\\\<(c0xFF888888)活动介绍:><(c0xFFF888888)活动开启后,系统自动弹窗进入场地,地图内有两座><(c0xFFFF0000)(金佛)><(c0xFFF888888)玩家需要抢占金佛四周的标志圈位置,每秒可获得超高经验和绑金奖励,场景内还会刷BOSS哦.>",
		ensure = "",
		awardDesc = "绑金、经验",  --奖励描述
		time = "22:45-23:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 5,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"22:45-23:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--魔族入侵,id=18
	{
		id = 18,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00083, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-魔族入侵>\\<(c0xFF888888)活动地点:><(c0xFFF888888)王城>\\<(c0xFF888888)活动时间:><(c0xFFFF0000)16:00-17:00>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)共有><(c0xFFFF0000)5波><(c0xFF888888)怪物入侵王城,每间隔><(c0xFFFF0000)10分钟><(c0xFF888888)刷新一波,每波怪物都由><(c0xFFFF0000)1只><(c0xFF888888)大BOSS携带><(c0xFFFF0000)6只><(c0xFF888888)小BOSS侵袭王城,击杀BOSS有机会获得><(c0xFFFF0000)稀有道具><(c0xFF888888)和><(c0xFFFF0000)高级装备>",
		ensure = "",
		awardDesc = "羽毛、绑金、装备",  --奖励描述
		time = "16:00-17:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 8,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"16:00-17:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =-1,minDay=-1,},
		},
	},
	--魔族入侵,id=19
	{
		id = 19,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00083, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-魔族入侵>\\<(c0xFF888888)活动地点:><(c0xFFF888888)王城>\\<(c0xFF888888)活动时间:><(c0xFFFF0000)20:00-21:00><(c0xFF00FF00)开区前4天>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)共有><(c0xFFFF0000)5波><(c0xFF888888)怪物入侵王城,每间隔><(c0xFFFF0000)10分钟><(c0xFF888888)刷新一波,每波怪物都由><(c0xFFFF0000)1只><(c0xFF888888)大BOSS携带><(c0xFFFF0000)6只><(c0xFF888888)小BOSS侵袭王城,击杀BOSS有机会获得><(c0xFFFF0000)稀有道具><(c0xFF888888)和><(c0xFFFF0000)高级装备>",
		ensure = "",
		awardDesc = "羽毛、绑金、装备",  --奖励描述
		time = "20:00-21:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 8,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"20:00-21:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay =4,minDay=1,},
		},
	},
	--神威幻境,id=20
	{
		id = 20,	
		level = 65,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00084, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=6,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-神威幻境>\\<(c0xFF888888)活动地点:><(c0xFFF888888)神威幻境1-7层>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)10:30-11:00>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)神威幻境共有><(c0xFFFF0000)7层><(c0xFF888888),击杀每层BOSS有几率掉落><(c0xFFFF0000)高级装备><(c0xFF888888)和><(c0xFFFF0000)稀有道具><(c0xFF888888),进入每一层都可获得><(c0xFFFF0000)羽毛><(c0xFF888888)和><(c0xFFFF0000)绑金><(c0xFF888888)奖励,进入后需要击杀><(c0xFFFF0000)神威幻境统领><(c0xFF888888)收集足够的><(c0xFFFF0000)幻境通行证><(c0xFF888888)才可继续进入下一层.每次活动限时><(c0xFFFF0000)1小时><(c0xFF888888),超时自动传出.>",
		ensure = "",
		awardDesc = "羽毛、绑金、装备",  --奖励描述
		time = "10:30-11:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 2,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"10:30-11:30",
				}
				},
			levelLimit ={
				minLevel = 65,
				maxLevel = -1,
				},
			openSererday ={maxDay = -1,minDay = -1,},
		},
	},
	--神威幻境,id=21
	{
		id = 21,	
		level = 65,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00084, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=6,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-神威幻境>\\<(c0xFF888888)活动地点:><(c0xFFF888888)神威幻境1-7层>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)14:30-15:00>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)神威幻境共有><(c0xFFFF0000)7层><(c0xFF888888),击杀每层BOSS有几率掉落><(c0xFFFF0000)高级装备><(c0xFF888888)和><(c0xFFFF0000)稀有道具><(c0xFF888888),进入每一层都可获得><(c0xFFFF0000)羽毛><(c0xFF888888)和><(c0xFFFF0000)绑金><(c0xFF888888)奖励,进入后需要击杀><(c0xFFFF0000)神威幻境统领><(c0xFF888888)收集足够的><(c0xFFFF0000)幻境通行证><(c0xFF888888)才可继续进入下一层.每次活动限时><(c0xFFFF0000)1小时><(c0xFF888888),超时自动传出.>",
		ensure = "",
		awardDesc = "羽毛、绑金、装备",  --奖励描述
		time = "14:30-15:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 2,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"14:30-15:30",
				}
				},
			levelLimit ={
				minLevel = 65,
				maxLevel = -1,
				},
			openSererday ={maxDay = -1,minDay = -1,},
		},
	},
	--神威幻境,id=22
	{
		id = 22,	
		level = 65,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00084, --活动的名字
		award = {{type=4,count=1,id=0},--经验图标
		         {type=2,count=1,id=0},
			 {type=6,count=1,id=0},
			 {type=7,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动NPC:><(c0xFFF888888)卧龙城-神威幻境>\\<(c0xFF888888)活动地点:><(c0xFFF888888)神威幻境1-7层>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)22:30-23:00>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)神威幻境共有><(c0xFFFF0000)7层><(c0xFF888888),击杀每层BOSS有几率掉落><(c0xFFFF0000)高级装备><(c0xFF888888)和><(c0xFFFF0000)稀有道具><(c0xFF888888),进入每一层都可获得><(c0xFFFF0000)羽毛><(c0xFF888888)和><(c0xFFFF0000)绑金><(c0xFF888888)奖励,进入后需要击杀><(c0xFFFF0000)神威幻境统领><(c0xFF888888)收集足够的><(c0xFFFF0000)幻境通行证><(c0xFF888888)才可继续进入下一层.每次活动限时><(c0xFFFF0000)1小时><(c0xFF888888),超时自动传出.>",
		ensure = "",
		awardDesc = "羽毛、绑金、装备",  --奖励描述
		time = "22:30-23:30",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 2,---图标
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
				minLevel = 65,
				maxLevel = -1,
				},
			openSererday ={maxDay = -1,minDay = -1,},
		},
	},
	--元宝嘉年华,id=23
	{
		id = 23,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00085, --活动的名字
		award = {{type=1,count=1,id=0},--元宝图标
		         {type=8,count=1,id=0},--元宝图标
			 {type=9,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动地点:><(c0xFFF888888)土城药店>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)13:30-14:00>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)活动开始时,土城药店旁刷出><(c0xFFFF0000)“送财金凤凰”><(c0xFF888888),击杀送财金凤凰可爆出大量><(c0xFFFF0000)元宝、绑定元宝、绑金、金条><(c0xFF888888)等大批宝藏,为><(c0xFFFF0000)无主模式><(c0xFF888888),任何人都可以随意捡取.>",
		ensure = "",
		awardDesc = "元宝、绑定元宝、金条",  --奖励描述
		time = "13:30-14:00",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 4,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"13:30-14:00",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay = -1,minDay = -1,},
		},
	},
		--元宝嘉年华,id=24
	{
		id = 24,	
		level = 60,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
        link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00085, --活动的名字
		award = {{type=1,count=1,id=0},--元宝图标
		         {type=8,count=1,id=0},--元宝图标
			 {type=9,count=1,id=0}},--绑金图标，根据type显示图标
		tips = "\\<(c0xFF888888)活动地点:><(c0xFFF888888)土城药店>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)21:20-21:50>\\\\<(c0xFF888888)活动介绍:><(c0xFF888888)活动开始时,土城药店旁刷出><(c0xFFFF0000)“送财金凤凰”><(c0xFF888888),击杀送财金凤凰可爆出大量><(c0xFFFF0000)元宝、绑定元宝、绑金、金条><(c0xFF888888)等大批宝藏,为><(c0xFFFF0000)无主模式><(c0xFF888888),任何人都可以随意捡取.>",
		ensure = "",
		awardDesc = "元宝、绑定元宝、金条",  --奖励描述
		time = "21:20-21:50",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 4,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= 
				{
					"21:20-21:50",
				}
				},
			levelLimit ={
				minLevel = 60,
				maxLevel = -1,
				},
			openSererday ={maxDay = -1,minDay = -1,},
		},
	},

	-- 闭关修炼
	{
		id = 25,	
		level = 70,   --弹窗的玩家最低等级 60表示等级>=60的玩家才弹出此窗
		delay = 60,  --弹窗持续时间（秒）
		moveLimit = 60,
    link = "",--活动传送位置
		isDelete = false,
		name = Lang.ActivityName.name00086, --活动的名字
		award = {
			{type=4,count=1,id=0},--经验
		},--绑金图标，根据type显示图标
		
		tips = "\\<(c0xFF888888)活动地点:><(c0xFFF888888)闭关修炼>\\<(c0xFF888888)入口开放时间:><(c0xFFFF0000)11:00-11:50>",
		ensure = "闭关修炼,3,闭关修炼",
		awardDesc = "经验、护盾碎片",  --奖励描述
		time = "11:00-11:50",  --开启时间
		isShowCdIcon = true,   --是否显示倒计时的图标
		iconid = 4,---图标
		condition =             -- 参加条件
		{
			timeLimit = {
				months={0}, 
				days ={0},
				weeks={0},
				minutes= {"11:00-11:50",},
			},
			
			levelLimit ={minLevel = 70,	maxLevel = -1,},
			openSererday ={maxDay = -1, minDay = -1,},
		},
	},
}
