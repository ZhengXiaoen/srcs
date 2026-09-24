--材料副本 个人副本 每日副本

--#include "..\..\language\LangCode.txt" once
FubenAwardCfg =
{
	--护符副本
	{
		fubenId = 19,
		fbTime = 1800,
		fbname = "护符副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 46, id = 0, count = 10000, name = "护符碎片", icon="iaward#18#1"}, 	-- 玉佩碎片
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},
	
	--护盾副本
	{
		fubenId = 20,
		fbTime = 1800,
		fbname = "护盾副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 45, id = 0, count = 10000, name = "护盾碎片", icon="iaward#16#1"}, 	-- 护盾碎片
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},
	
	--宝石副本
	{
		fubenId = 21,
		fbTime = 1800,
		fbname = "宝石副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 47, id = 0, count = 800, name = "宝石结晶", icon="iaward#15#1"}, 	-- 羽毛
		},
		DropBossItem = 
		{

		},
		Desc = Lang.ScriptTips.fb00006,
	},
	
	--s圣珠副本
	{
		fubenId = 22,
		fbTime = 1800,
		fbname = "圣珠副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 42, id = 0, count = 800, name = "圣珠结晶", icon="iaward#20#1"}, 	-- 宝石结晶
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},
	
	--强化副本
	{
		fubenId = 23,
		fbTime = 1800,
		fbname = "强化副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 0, id = 459, count = 80, name = "星纹强化石", icon="iaward#10#1"}, 	-- 圣珠结晶
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},


	--羽毛副本
	{
		fubenId = 24,
		fbTime = 1800,
		fbname = "羽毛副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 0, id = 464, count = 80, name = "羽毛", icon="iaward#11#1"}, 	-- 圣珠结晶
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},


	--功勋副本
	{
		fubenId = 25,
		fbTime = 1800,
		fbname = "功勋副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 41, id = 0, count = 2500, name = "功勋令牌", icon="iaward#9#1"}, 	-- 圣珠结晶
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},




 ---铁链僵尸王
	{
		fubenId = 7,
		fbTime = 600,
		fbname = "铁链僵尸王",
		doubleConsume = {type = 15,id = 0, count = 100},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 1000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

---黑色钳虫王
	{
		fubenId = 8,
		fbTime = 600,
		fbname = "黑色钳虫王",
		doubleConsume = {type = 15,id = 0, count = 220},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

---血色教主
	{
		fubenId = 9,
		fbTime = 600,
		fbname = "血色教主",
		doubleConsume = {type = 15,id = 0, count = 220},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

---白色猪王
	{
		fubenId = 10,
		fbTime = 600,
		fbname = "白色猪王",
		doubleConsume = {type = 15,id = 0, count = 220},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

---羊族族长
	{
		fubenId = 11,
		fbTime = 600,
		fbname = "羊族族长",
		doubleConsume = {type = 15,id = 0, count = 220},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},


---蛮荒教主
	{
		fubenId = 12,
		fbTime = 600,
		fbname = "蛮荒教主",
		doubleConsume = {type = 15,id = 0, count = 220},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	--变异骷髅王
	{
		fubenId = 13,
		fbTime = 600,
		fbname = "变异骷髅王",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},


--铁链僵尸皇
	{
		fubenId = 14,
		fbTime = 600,
		fbname = "铁链僵尸皇",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	--暗之钳虫皇
	{
		fubenId = 15,
		fbTime = 600,
		fbname = "暗之钳虫皇",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

--异教教皇
	{
		fubenId = 16,
		fbTime = 600,
		fbname = "异教教皇",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

--虚空大帝
	{
		fubenId = 17,
		fbTime = 600,
		fbname = "虚空大帝",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

--破碎教皇
	{
		fubenId = 18,
		fbTime = 600,
		fbname = "破碎教皇",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

--蛮荒大教皇
	{
		fubenId = 26,
		fbTime = 600,
		fbname = "蛮荒大教皇",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

---------------------勇闯天关-------------------

	{
		fubenId = 122,
		fbTime = 60,
		fbname = "勇闯天关1层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 123,
		fbTime = 60,
		fbname = "勇闯天关2层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 124,
		fbTime = 60,
		fbname = "勇闯天关3层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 125,
		fbTime = 60,
		fbname = "勇闯天关4层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 126,
		fbTime = 60,
		fbname = "勇闯天关5层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 127,
		fbTime = 60,
		fbname = "勇闯天关6层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 128,
		fbTime = 60,
		fbname = "勇闯天关7层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 129,
		fbTime = 60,
		fbname = "勇闯天关8层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 130,
		fbTime = 60,
		fbname = "勇闯天关9层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 131,
		fbTime = 60,
		fbname = "勇闯天关10层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 132,
		fbTime = 60,
		fbname = "勇闯天关11层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 133,
		fbTime = 60,
		fbname = "勇闯天关12层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 134,
		fbTime = 60,
		fbname = "勇闯天关13层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 135,
		fbTime = 60,
		fbname = "勇闯天关14层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 136,
		fbTime = 60,
		fbname = "勇闯天关15层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 137,
		fbTime = 60,
		fbname = "勇闯天关16层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 138,
		fbTime = 60,
		fbname = "勇闯天关17层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 139,
		fbTime = 60,
		fbname = "勇闯天关18层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 140,
		fbTime = 60,
		fbname = "勇闯天关19层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 141,
		fbTime = 60,
		fbname = "勇闯天关20层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 142,
		fbTime = 60,
		fbname = "勇闯天关21层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 143,
		fbTime = 60,
		fbname = "勇闯天关22层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 144,
		fbTime = 60,
		fbname = "勇闯天关23层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 145,
		fbTime = 60,
		fbname = "勇闯天关24层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 146,
		fbTime = 60,
		fbname = "勇闯天关25层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 147,
		fbTime = 60,
		fbname = "勇闯天关26层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 148,
		fbTime = 60,
		fbname = "勇闯天关27层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 149,
		fbTime = 60,
		fbname = "勇闯天关28层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 150,
		fbTime = 60,
		fbname = "勇闯天关29层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 151,
		fbTime = 60,
		fbname = "勇闯天关30层",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 5322, count = 1, name = "", icon="iaward#2#1"}, 	-- 天关宝箱
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 6, id = 0, count = 600000, name = "经验", icon="iaward#5#1"}, 	-- 绑金
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	
	--斗笠副本
	{
		fubenId = 26,
		fbTime = 1800,
		fbname = "斗笠副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 67, id = 0, count = 80000, name = "斗笠精华", icon="iaward#133#1"}, 	-- 斗笠值
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 152,
		fbTime = 60,
		fbname = "尸王试练",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验
		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 153,
		fbTime = 60,
		fbname = "钳虫试练",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	

			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验

		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 154,
		fbTime = 60,
		fbname = "沃玛试练",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	

			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验

		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 155,
		fbTime = 60,
		fbname = "白猪试练",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	

			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验

		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	{
		fubenId = 156,
		fbTime = 60,
		fbname = "祖玛试练",
		doubleConsume = {type = 15,id = 0, count = 280},-- 领取三倍奖励消耗
		award = 
		{	

			{type = 2, id = 0, count = 600000, name = "经验", icon="iaward#2#1"}, 	-- 经验

		
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	--修真副本
	{
		fubenId = 188,
		fbTime = 1800,
		fbname = "修真副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 0, id = 6731, count = 40, name = "培元丹", icon="iaward#136#1"}, 	-- 培元丹
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	--坐骑副本(index= 58)
	{
		fubenId = 189,
		fbTime = 1800,
		fbname = "坐骑副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 0, id = 6862, count = 5, name = "坐骑丹", icon="iaward#142#1"}, 	-- 坐骑丹
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	--血炼副本
	{
		fubenId = 205,
		fbTime = 1800,
		fbname = "血炼副本",
		doubleConsume = {type = 15,id = 0, count = 238},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 72, id = 0, count = 50, name = "血炼精华", icon="iaward#143#1"}, 	--  血炼精华
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	
	--戒灵副本
	{
		fubenId = 207,
		fbTime = 1800,
		fbname = "戒灵副本",
		doubleConsume = {type = 15,id = 0, count = 288},-- 领取三倍奖励消耗
		award = 
		{	
			{type = 0, id = 0, count = 1200000, name = "经验", icon="iaward#2#1"}, 	-- 经验
			{type = 0, id = 0, count = 500, name = "戒灵粉尘", icon="iaward#144#1"}, 	--  戒灵粉尘
		},
		DropBossItem = 
		{
		},
		Desc = Lang.ScriptTips.fb00006,
	},

	




}