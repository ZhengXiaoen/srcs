--#include "..\..\language\LangCode.txt"
--#include "..\..\config\modules\TimeHasnotTime.lua" once

-- 中秋祝福
BroadcastItem =
{
  {
    item_id = 0,            -- 物品Id
    text =
    {
         Lang.ScriptTips.zf001,
         Lang.ScriptTips.zf002,
         Lang.ScriptTips.zf003,
         Lang.ScriptTips.zf004,
         Lang.ScriptTips.zf005,
         Lang.ScriptTips.zf006,
         Lang.ScriptTips.zf007,
         Lang.ScriptTips.zf008,
    }
  }
}
--随机宝箱--索引对应data\config\item\RandomBoxCfg.lua下标
RandomBoxItem =
{
    {item_id = 5322,param=1,},
}
--天数奖励道具
--type =0 金币类 1 经验
DayAwardItem =
{
    --金币大礼包
    {
        item_id = 671,
        award=
        {
            --第一天
            {
                {type = 0,param= 0,count=1600001,},
            },
            --第二天
            {
                {type = 0,param= 0,count=1600002,},
            },
            --第三天
            {
                {type = 0,param= 0,count=1600003,},
            },
            --第四天
            {
                {type = 0,param= 0,count=1600004,},
            },
            --第五天
            {
                {type = 0,param= 0,count=1600005,},
            },
            --第六天
            {
                {type = 0,param= 0,count=1600006,},
            },
            --第七天
            {
                {type = 0,param= 0,count=1600007,},
            },
        }
    },
    --经验大礼包
    {
        item_id = 670,
        award=
        {
            --第一天
            {
                {type = 0,count=1700001,},
            },
            --第二天
            {
                {type = 0,count=1700002,},
            },
            --第三天
            {
                {type = 0,count=1700003,},
            },
            --第四天
            {
                {type = 0,count=1700004,},
            },
            --第五天
            {
                {type = 0,count=1700005,},
            },
            --第六天
            {
                {type = 0,count=1700006,},
            },
            --第七天
            {
                {type = 0,count=1700007,},
            },
        },
    }
}
--[[   --更改实现方式 磨刀石转移到文件UseRepairItem.lua
--成就礼盒和磨刀石物品
ChengjiuAndRepairItems = {
	{item_id = 1557,},
	{item_id = 1572,},
}



--封测登录礼盒
FengCeRewardItems = {
	{item_id = 1615,},
}
]]
--使用物品可以添加给玩家任务
AddTaskItems = {
	--{item_id = 610, taskid = 755, taskname = Lang.ScriptTips.x00019, taskTalk = Lang.Talk.t02681,},
	--{item_id = 1462, taskid = 743, taskname = Lang.ScriptTips.x00018, taskTalk = Lang.Talk.t02635,},
	
}

--在指定场景使用物品完成任务
UseTaskItems = {

-- {item_id = 611, sceneid=2, posx1=32, posx2=42, posy1=0, posy2=17, taskid=779, id=30001, count=1, DelayType = 4,needdelete=true,},

}

--RapidEffectItems = {
--	{item_id = 596, propID= PROP_CREATURE_HP, value= 150,needDelete =true},
--
--}

--修复耐久物品
RepairItems = 
{
	--{item_id = 1144, needDelete = true},	--修复油
}

ChuanSongItems =
{
	--type:回城卷轴的类型，1、为按城市回城：2、按不同门派回城
	--SceneName:场景的名称，按城市回城用的
	--pos_x,pos_y :场景默认的传送点
	--needDelete : 是否需要删除物品
  --DelayType: 读进度条的类型

	--{item_id = 1552,type = 1, DelayType = 1,needDelete = true},
}

--复活石的配置
ResurrectionItems =
{
	--item_id:  物品的ID
	--{item_id = 99999,needDelete = true},
}

--减少杀戮值物品的配置
ReduceKillValueItems =
{
}

DeleteBuffItems = 
{
	--{item_id = 1002, buffType= aHpAdd, buffGroup= 0,needDelete =true},
}


DeputyLearnItems = 
{
	--{item_id = 22, deputy = 1, value = 4, needDelete = true, groupItems = {172,}, },
}

--双倍经验药品
DoubleExpItems =
{
	--{item_id = 1440, value = 2, needDelete = true },
}
--新手奖励的礼包
PresentItems = 
{
	--item_id : 新手礼包的ID，即功能物品的ID
	--rewardsID : 功能物品ID对应该的奖励礼包ID，这个在RewardConfig.lua配置。
	--needDelete : 是否需要删除。

--{item_id = 1, rewardsID = 1, needDelete =true},

}

--恢复体力药品
PhysicalItems = 
{

	--{item_id = 1004, value = 10, needDetele = true},
}

--副本挑战书
AddFubenCountItems = 
{
  --{item_id = 1567,type = 1,needDelete =true,},
	
}

--地牢钥匙碎片一、二、三、四
DungeonKeyDebrisItems = 
{
}
--硫磺，用于合成火药包的
SulfurItems =
{
}
--火药包
PowderPacketItem =
{

	--{item_id = 1598,monsterid = 415,pos = 1,x1 = 35,x2 = 39,y = 19,liveTime = 5, usesceneid = 92,DelayType = 3,needDelete = true}
}

--扩展背包的物品的配置
EnlargeBagItem =
{
  --{item_id = 1718,gridCount =1},
  --{item_id = 1719,gridCount =6},
}

--扩展背包的槽位的道具
EnlargePetSlotItem =
{
  --{item_id = 1899,gridCount =1},
}

-- 宝物灵力功能物品
GemSpriteStrenItem =
{
	-- item_id: 物品Id
	-- val: 增加的宝物灵力值
	--{item_id = 1909, val=1000,},
}

-- 宝物功能道具（使用后创建一个宝物）
GemFuncItem =
{
	-- item_id: 物品Id
	-- gemId:  宝物Id
	-- gemGrade: 宝物档次
	-- gemLevel: 宝物等级
	-- gemQuality: 宝物品质
	-- gemSprite: 宝物灵性
		--Attack: 	攻击灵性
		--Defence: 	防御灵性
		--Agility: 	敏捷灵性
		--HP: 			霸体灵性
	-- gemSmith: 宝物开光次数
	-- isLimit: 是否为限时宝物 是则true
	
	--{ item_id=1972, gemId=1, gemGrade=1,gemSprite = {Attack = 20, Defence = 20, Agility = 20, HP = 20},},
	
}

-- 宝物经验功能道具（使用后增加宝物经验）
GemExpFuncItem =
{
	-- item_id: 物品Id
	-- exp: 增加的经验值
	--{ item_id = 2093, exp = 1000, },
}

-- 宝物等级提升功能道具
GemUpLevelFunItem = 
{
	-- item_id: 物品Id
	-- dest_level: 目标等级
	-- min_grade: 使用此物品的档次需求
	--{ item_id = 2125, dest_level = 20, min_grade = 1,},
}

--添加实体特效和buff，场景特效的物品作用
--  item_id物品的ID
EffectItemFuncItem=
{

	--[[   例子，不要删除 
	{ 
	
	item_id = 2125,
	
	--实体特效，跟人走的特效
	entityEffects=
	{ 
	    -- effectId 特效的ID ,是特效的配置文件里的ID
	    -- effectType 特效的类型 无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4,脚下持续=5,持续=6
	    -- durTime 持续时间，单位ms
	    --nDelayTime 延迟多长时间生效，单位ms
	   --{effectId = 1441, effectType = 5, durTime=1, nDelayTime=0},
	}, 
	
	--场景特效，不跟人走的特效
	sceneEffects=
	{ 
	    -- effectId 特效的ID ,是特效的配置文件里的ID
	    -- effectType 特效的类型 无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4,脚下持续=5,持续=6
	    -- durTime 持续时间，单位ms
	    --nDelayTime 延迟多长时间生效，单位ms
	    --x 表示相 对于玩家的位置x
	    --y 表示相对于玩家的位置y
	   {effectId = 1441, effectType = 5, durTime=1, nDelayTime=0,x=0,y=0},
	}, 
	
	--buff列表
	buffs=
	{
	    --buffType buff的类型
	    --buffGroup buff的分组
	    --value     buff的数值
	    --times    buff的作用次数
	    --interval 作用间隔，单位秒 
	    --timeOverlay =true 时间是否叠加 
	   {buffType = 7,buffGroup=1,value=1.0, times=1, interval=1,timeOverlay =true},
	}
	},
--]]

--[[
烟花列表
普通婚宴烟花
豪华婚宴烟花
师恩海重
兄弟情谊
兄弟给力
情意绵绵
众志成城
生日快乐
节日烟花
朋友你好
欢迎挑战
不给力啊
--]]

--婚宴烟花
--        {
--		item_id = 385,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50052, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},

--豪华婚宴烟花
--        {
--		item_id = 0,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50053, effectType =5, durTime=10000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=10000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50057, effectType =4, durTime=10000, nDelayTime=100,x=3,y=-4},
--			{effectId = 50058, effectType =4, durTime=10000, nDelayTime=100,x=-1,y=-7}, 
--			{effectId = 50058, effectType =4, durTime=10000, nDelayTime=100,x=1,y=-7}, 
--		},
--	},

--师恩海重
--        {
--		item_id = 391,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50068, effectType =5, durTime=10000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50058, effectType =4, durTime=10000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=10000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--
----兄弟情谊
--        {
--		item_id = 388,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50061, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--
----兄弟给力 
--        {
--		item_id = 389,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50060, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--
----情意绵绵
--        { 
--		item_id = 387,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50062, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--
----众志成城
--        {
--		item_id = 390,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50059, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--	
----生日快乐
--        { 
--		item_id = 394,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50066, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--
----节日烟花 
--        {
--		item_id = 395,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50058, effectType =4, durTime=3000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50057, effectType =5, durTime=3000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=3000, nDelayTime=100,x=3,y=-4},
--		},
--	},
--	
----朋友你好 
--        {
--		item_id = 393,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50071, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50058, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4}, 
--		},
--	},
--	
----欢迎挑战
--        {		
--                item_id = 392,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50054, effectType =5, durTime=5000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50057, effectType =4, durTime=5000, nDelayTime=100,x=3,y=-4},
--			{effectId = 50058, effectType =4, durTime=3000, nDelayTime=100,x=-3,y=-4},
--		},
--	},
--
----不给力啊 
--	{
--		item_id = 396,
--		entityEffects={},
--		sceneEffects=
--		{
--			{effectId = 50055, effectType =5, durTime=3000, nDelayTime=100,x=-3,y=-4},
--			{effectId = 50057, effectType =4, durTime=3000, nDelayTime=100,x=0,y=-4},
--			{effectId = 50058, effectType =4, durTime=3000, nDelayTime=100,x=3,y=-4},
--		},
--	},
}

--行会召唤令牌
CampCallItem = 
{
	{item_id = 515,needDelete = true},
}

CallFlagMsgers = {
	--{item_id = 2369, map_item_id = 2370, monid = 601, fbId = 26, pos = { 41, 15,78,19}, needDelete = true},
	--{item_id = 2370, map_item_id = 2369, monid = 601, fbId = 26, pos = { 41, 15,78,19}, needDelete = true},
}

--传奇摊位牌
EnlargeStallGridItem = 
{
	--{item_id = 308, enlargeGrid = 1, needDelete = true},
}


--祝福油
BlessOil = {
	{item_id = 85, type = 1,},	--祝福油
	{item_id = 86, type = 3,},	--超级祝福油
}

--特殊类药品
SpecialDrugs = {
	{
		item_id = 79,	--高级太阳水,新区第1天恢复1000,第2天2000,第3天之后3000
		type = 1,
		day = {1000,2000,3000},
	},
}


TiyanCard = {
	{item_id = 5139,}--在线回收体验卡
}


--回城券
--type类型：
--1传送到指定场景坐标,SceneId,x,y属性有效
--2传送本场景随机坐标
--3传送到上一次的安全区
BackToCity = {
--回城石
	{item_id = 502, type = 3, SceneId = 0, x = 0, y = 0, n = 100,},
--随机传送石
	{item_id = 501, type = 2, SceneId = 0, x = 0, y = 0, n = 100,},
--传送石
	{item_id = 498, type = 4, SceneId = 0,x = 0,y = 0},
--荒古传送卷
	{item_id = 491, type = 5, SceneId = 279,x = 86,y = 80},
	

}

RosePack = {
	--{item_id = 355, destId = 354, destCount = 9},
	--{item_id = 360, destId = 359, destCount = 9},
}

NewBieGuildeBook = {
	---{item_id = 684, needDelete = false},
}

--通过物品接受任务
ItemAcceptQuest = {
	--{item_id = 684, questId = 8001, needDelete = true},
}

ItemBuildPet = {
	--{item_id = 932, count = 20, petId = {479,480,}, movieId = {6,7,8,9},petLevel = 1, aiId = {103,104,105,106}, liveTime = 600},		--481,482 是衰神、穷神，新年期间屏蔽掉，吉利些.
}

--使用物品得到一个buff
UseGetBuff = {
--	{ item_id = 1772,
--		buffs = {
--			{buffType = 70,buffGroup=83,value=0, times=1, interval=1200,timeOverlay =true,buffName=Lang.Activity.szfb0002},
--			
--		},
--	},
}

--使用物品会放一个技能
UsedUseSkill = {
	--{ item_id = 1773, skillId = 162, skillLevel = 4},
	--{ item_id = 1775, skillId = 162, skillLevel = 5},
}


--宝藏宝箱
zTeasureTrove =
{
    { item_id = 634,param=1,},
   
}

--符文精华
zRuneEssence =
{
    {item_id = 3623},
}
--//xy 2013/7/8
--//zer 2016/9/1
zGnItem100 = {
	-- item_id=物品ID, value=使用后增加的数值, str=提示xxx增加了,maxUseTimes=最大使用次数限制,type=金钱类型
	{ item_id = 530, value = 88888,	   str = "绑定金币", maxUseTimes = -1, type = 0},
	{ item_id = 507, value = 200000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--金条(绑金)
	{ item_id = 508, value = 600000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--金砖(绑金)
	{ item_id = 509, value = 1000000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--大金砖(绑金)
	{ item_id = 677, value = 10000000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--超级金币箱
	{ item_id = 5473, value = 40000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--4W
	{ item_id = 5474, value = 120000,  str = "绑定金币", maxUseTimes = -1, type = 0},	--12W

	{ item_id = 82, value = 200000,  str = "金币", maxUseTimes = -1, type = 1},	--金条
	{ item_id = 83, value = 600000,  str = "金币", maxUseTimes = -1, type = 1},	--金砖
	{ item_id = 84, value = 1000000,  str = "金币", maxUseTimes = -1, type = 1},	--大金砖

	{ item_id = 518, value = 10, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 519, value = 20, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 520, value = 50, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 521, value = 100, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 522, value = 200, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 523, value = 500, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 524, value = 1000,  str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 525, value = 5000, 	str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	{ item_id = 526, value = 10000, str = "绑定元宝", maxUseTimes = -1, type = 2},		--绑定元宝
	
	{ item_id = 813, value = 1, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 814, value = 5, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 815, value = 10, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 816, value = 50, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 817, value = 100, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 818, value = 200, 	str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 819, value = 50000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 820, value = 100000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 855, value = 10000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 856, value = 888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 857, value = 1888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 858, value = 2888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 859, value = 5888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5457, value = 5000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5467, value = 20000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5470, value = 20, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5471, value = 30, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5472, value = 40, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5936, value = 8888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5937, value = 28888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5943, value = 3888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 5944, value = 9888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝

	{ item_id = 6032, value = 30000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 6033, value = 12888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 6034, value = 18888, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 6185, value = 1000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝


	{ item_id = 7142, value = 100000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7143, value = 80000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7144, value = 50000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7145, value = 30000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7146, value = 20000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7147, value = 10000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7148, value = 5000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7149, value = 1000, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7150, value = 500, str = "元宝", maxUseTimes = -1, type = 3},		--元宝
	{ item_id = 7826, value = 1000, str = "元宝", maxUseTimes = -1, type = 3},		--金票

};


--pk物品数据表
zPKItemTable = {
	{ item_id = 510, value = 200, str = "赎罪药水", maxUseTimes = -1, type = 1},	--赎罪药水
}

--特惠礼包宝箱+3+5+7+9
TeHuiLiBaoAdd = {
	{ item_id = 605, delgold = 1288,	value = 268,	str = "1级羽毛", giveid = 464, additemid = 606},	--羽毛宝箱+3
	{ item_id = 606, delgold = 3988,	value = 888,	str = "1级羽毛", giveid = 464, additemid = 607},	--羽毛宝箱+5
	{ item_id = 607, delgold = 8866,	value = 1800,	str = "1级羽毛", giveid = 464, additemid = 608},	--羽毛宝箱+7
	{ item_id = 608, delgold = 18000,	value = 3888,	str = "1级羽毛", giveid = 464,},	--羽毛宝箱+9

	{ item_id = 609, delgold = 2888,	value = 0,	str = "宝石结晶", var = 0,count=9900 , additemid = {
		{giveid = 537, num = 9, bind = 1,},
		{giveid = 538, num = 9, bind = 1,},
		{giveid = 610, num = 1, bind = 1,},
	},},	--宝石结晶宝箱+3
	{ item_id = 610, delgold = 5888,	value = 0,	str = "宝石结晶", var = 0,count=19900 ,additemid = {
		{giveid = 538, num = 9, bind = 1,},
		{giveid = 537, num = 9, bind = 1,},
		{giveid = 539, num = 1, bind = 1,},
		{giveid = 611, num = 1, bind = 1,},
	},},	--宝石结晶宝箱+5--additemid = 611
	
	{ item_id = 611, delgold = 8888,	value = 0,	str = "宝石结晶", var = 0,count=29900 ,
        additemid = 
        {
		    {giveid = 539, num = 2, bind = 1,},
			{giveid = 538, num = 9, bind = 1,},
		    {giveid = 537, num = 9, bind = 1,},
		    {giveid = 612, num = 1, bind = 1,},
	    },
        -- addMoney =
        -- {
        --     {type = 0,count=1000,}, --1000绑定金币
        --     {type =1,count=1000,}, --1000金币
        -- }
    },	--宝石结晶宝箱+7
    --宝石结晶 str 为提示名称 count 为提示的显示数量
	{ item_id = 612, delgold = 16888,	value = 0,	str = "宝石结晶", var = 0,count=56700 ,additemid = {
		{giveid = 539, num = 5, bind = 1,},
		{giveid = 537, num = 7, bind = 1,},
		{giveid = 538, num = 6, bind = 1,},
	},},		--宝石结晶宝箱+9

	{ item_id = 613, delgold = 2888,	value = 0,	str = "圣珠结晶", var = 0,count=9900 , additemid = {
		{giveid = 572, num = 9, bind = 1,},
		{giveid = 573, num = 9, bind = 1,},
		{giveid = 614, num = 1, bind = 1,},
	},},	--圣珠结晶宝箱+3
	{ item_id = 614, delgold = 5888,	value = 0,str = "圣珠结晶", var = 0,count=19900 , additemid = {
		{giveid = 573, num = 9, bind = 1,},
		{giveid = 572, num = 9, bind = 1,},
		{giveid = 574, num = 1, bind = 1,},
		{giveid = 615, num = 1, bind = 1,},
	},},	--圣珠结晶宝箱+5--additemid = 615

	{ item_id = 615, delgold = 8888,	value = 0,	str = "圣珠结晶", var = 0,count=29900 , additemid = {
		{giveid = 573, num = 9, bind = 1,},
		{giveid = 572, num = 9, bind = 1,},
		{giveid = 574, num = 2, bind = 1,},
		{giveid = 616, num = 1, bind = 1,},
	},},	--圣珠结晶宝箱+7
	{ item_id = 616, delgold = 16888,	value = 0,	str = "圣珠结晶", var = 0,count=56700 ,additemid = {
		{giveid = 574, num = 5, bind = 1,},
		{giveid = 572, num = 7, bind = 1,},
		{giveid = 573, num = 6, bind = 1,},
	},},	--圣珠结晶宝箱+9

	{ item_id = 617, delgold = 2888,	value = 0,		str = "特戒结晶", var = 0,count=6 , additemid = {
		{giveid = 527, num = 6, bind = 1,},
		{giveid = 618, num = 1, bind = 1,},
	},},	--特戒结晶宝箱+3

	{ item_id = 618, delgold = 7188,	value = 0,		str = "特戒结晶", var = 0,count=15 , additemid = {
		{giveid = 527, num = 15, bind = 1,},
		{giveid = 619, num = 1, bind = 1,},
	},},	--特戒结晶宝箱+5

	{ item_id = 619, delgold = 12888,	value = 0,	str = "特戒结晶", var = 0,count=27 , additemid = {
		{giveid = 527, num = 27, bind = 1,},
		{giveid = 620, num = 1, bind = 1,},
	},},	--特戒结晶宝箱+7
	{ item_id = 620, delgold = 23888,	value = 0,	str = "特戒结晶", var = 0,count=50 ,additemid = {
		{giveid = 527, num = 50, bind = 1,},
	},},	--特戒结晶宝箱+9

	{ item_id = 4713, delgold = 2888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 552, num = 6, bind = 1,},
		{giveid = 507, num = 2, bind = 1,},
		{giveid = 508, num = 2, bind = 1,},
		{giveid = 4714, num = 1, bind = 1,},
	},},	--战将宝箱小
	{ item_id = 4714, delgold = 5888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 552, num = 10, bind = 1,},
		{giveid = 507, num = 3, bind = 1,},
		{giveid = 508, num = 3, bind = 1,},
	},},	--战将宝箱中

    { item_id = 7645, delgold = 6888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 6657, num = 1, bind = 1,},
		{giveid = 573, num = 1, bind = 1,},
		{giveid = 538, num = 1, bind = 1,},
		{giveid = 489, num = 1, bind = 1,},
		{giveid = 552, num = 1, bind = 1,},
	},},	--大吉大利(一)

	{ item_id = 7646, delgold = 8888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 6658, num = 1, bind = 1,},
		{giveid = 573, num = 2, bind = 1,},
		{giveid = 538, num = 2, bind = 1,},
		{giveid = 489, num = 2, bind = 1,},
		{giveid = 552, num = 2, bind = 1,},
	},},	--大吉大利(二)

	{ item_id = 7647, delgold = 12888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 6887, num = 1, bind = 1,},
		{giveid = 573, num = 3, bind = 1,},
		{giveid = 538, num = 3, bind = 1,},
		{giveid = 489, num = 3, bind = 1,},
		{giveid = 552, num = 3, bind = 1,},
	},},	--大吉大利(三)

	{ item_id = 7648, delgold = 18888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 6659, num = 1, bind = 1,},
		{giveid = 6371, num = 1, bind = 1,},
		{giveid = 573, num = 5, bind = 1,},
		{giveid = 538, num = 5, bind = 1,},
		{giveid = 490, num = 1, bind = 1,},
	},},	--大吉大利(四)

	{ item_id = 7649, delgold = 38888,	value = 0,	str = "", var = 0, additemid = {
		{giveid = 7039, num = 1, bind = 1,},
		{giveid = 7047, num = 1, bind = 1,},
		{giveid = 7650, num = 1, bind = 1,},
		{giveid = 544, num = 2, bind = 1,},
		{giveid = 6298, num = 1, bind = 1,},
	},},	--大吉大利(五)






	{ item_id = 4735,delgold = 888,value = 0,	str = "", var = 0, 
		additemid = 
		{
		
			{giveid = 4736,num = 1,bind = 1,},

        },
		addMoney =
        {
            {type = 0,count=4388888,}, --4388888绑定金币
        }
	},	--金币宝箱小

	{ item_id = 4736,delgold = 3888,value = 0,	str = "", var = 0, 
		additemid = 
		{
		
			{giveid = 4737,num = 1,bind = 1,},

        },
		addMoney =
        {
            {type = 0,count=18888888,}, --18888888绑定金币
        }
	},	--金币宝箱中


	{ item_id = 4737,delgold = 6666,value = 0,	str = "", var = 0, 
		additemid = 
		{
		
			{giveid = 4738,num = 1,bind = 1,},

        },
		addMoney =
        {
            {type = 0,count=32288888,}, --32288888绑定金币
        }
	},	--金币宝箱大

	
	{ item_id = 4738,delgold = 8888,value = 0,	str = "", var = 0, 
		additemid = 
		{
		
			{giveid = 4739,num = 1,bind = 1,},

        },
		addMoney =
        {
            {type = 0,count=42988888,}, --42988888绑定金币
        }
	},	--金币宝箱特

		{ item_id = 4739,delgold = 9999,value = 0,	str = "", var = 0, 
		additemid = 
		{
		
			--{giveid = 0,num = 1,bind = 1,},

        },
		addMoney =
        {
            {type = 0,count=48388888,}, --48388888绑定金币
        }
	},	--金币宝箱特




	{ item_id = 621, delgold = 5000,	value = 10,			str = "特戒结晶",	var = 131, additemid = 0,logid=2693},	--特戒庆典宝箱
	{ item_id = 622, delgold = 1888,	value = 400,		str = "1级羽毛",	giveid = 464, additemid = 0},	--翅膀庆典宝箱
	{ item_id = 623, delgold = 1888,	value = 6666,		str = "宝石结晶", var = 125, additemid = 0,logid=2692,},	--宝石庆典宝箱
	{ item_id = 624, delgold = 1888,	value = 6666,		str = "圣珠结晶", var = 127, additemid = 0,logid=2698,},	--圣珠庆典宝箱
	{ item_id = 625, delgold = 1888,	value = 4000,		str = "转生修为",	var = 79, additemid = 0,logid=2708,},	--转生庆典宝箱
	{ item_id = 626, delgold = 1888,	value = 4000000,	str = "战将灵力值",	var = 475691, additemid = 0,logid=2696},	--战将庆典宝箱	--475691特殊处理过 zer 2017/02/10
};
--珍宝箱
TreasureBox =
{
    {item_id = 4740,},
}
--魔核 zer 2017/04/15
MagicNuclear = {

	{ item_id = 650, type = 1, idx = 1},--一级魔核
	{ item_id = 651, type = 1, idx = 2},--二级魔核
	{ item_id = 652, type = 1, idx = 3},--三级魔核
	{ item_id = 653, type = 1, idx = 4},--四级魔核
	{ item_id = 654, type = 1, idx = 5},--五级魔核
	{ item_id = 655, type = 1, idx = 6},--六级魔核
	{ item_id = 656, type = 1, idx = 7},--七级魔核
	{ item_id = 657, type = 1, idx = 8},--八级魔核
	{ item_id = 658, type = 1, idx = 9},--九级魔核
	{ item_id = 659, type = 1, idx = 10},--十级魔核
	{ item_id = 660, type = 2, idx = 1},--一级神装魔核
	{ item_id = 661, type = 2, idx = 2},--二级神装魔核
	{ item_id = 662, type = 2, idx = 3},--三级神装魔核
	{ item_id = 663, type = 2, idx = 4},--四级神装魔核
	{ item_id = 664, type = 2, idx = 5},--五级神装魔核
	{ item_id = 665, type = 2, idx = 6},--六级神装魔核
	{ item_id = 666, type = 2, idx = 7},--七级神装魔核
	{ item_id = 667, type = 2, idx = 8},--八级神装魔核
	{ item_id = 668, type = 2, idx = 9},--九级神装魔核
	{ item_id = 669, type = 2, idx = 10},--十级神装魔核

	{ item_id = 4715, type = 1, idx = 1, max = 1},--一级魔核(稀有)
	{ item_id = 4716, type = 1, idx = 2, max = 1},--二级魔核(稀有)
	{ item_id = 4717, type = 1, idx = 3, max = 1},--三级魔核(稀有)
	{ item_id = 4718, type = 1, idx = 4, max = 1},--四级魔核(极品)
	{ item_id = 4719, type = 1, idx = 5, max = 1},--五级魔核(极品)
	{ item_id = 4720, type = 1, idx = 6, max = 1},--六级魔核(极品)
	{ item_id = 4721, type = 1, idx = 7, max = 1},--七级魔核(上古)
	{ item_id = 4722, type = 1, idx = 8, max = 1},--八级魔核(上古)
	{ item_id = 4723, type = 1, idx = 9, max = 1},--九级魔核(上古)
	{ item_id = 4724, type = 1, idx = 10, max = 1},--十级魔核(传说)
	{ item_id = 4725, type = 2, idx = 1, max = 1},--一级神装魔核(稀有)
	{ item_id = 4726, type = 2, idx = 2, max = 1},--二级神装魔核(稀有)
	{ item_id = 4727, type = 2, idx = 3, max = 1},--三级神装魔核(稀有)
	{ item_id = 4728, type = 2, idx = 4, max = 1},--四级神装魔核(极品)
	{ item_id = 4729, type = 2, idx = 5, max = 1},--五级神装魔核(极品)
	{ item_id = 4730, type = 2, idx = 6, max = 1},--六级神装魔核(极品)
	{ item_id = 4731, type = 2, idx = 7, max = 1},--七级神装魔核(上古)
	{ item_id = 4732, type = 2, idx = 8, max = 1},--八级神装魔核(上古)
	{ item_id = 4733, type = 2, idx = 9, max = 1},--九级神装魔核(上古)
	{ item_id = 4734, type = 2, idx = 10, max = 1},--十级神装魔核(传说)

	
};


FuWenBox = {
	
	{ item_id = 4607,index=1,logid=2393,logstr="一转符文袋",},
	{ item_id = 4608,index=2,logid=2393,logstr="二转符文袋",},
	{ item_id = 4609,index=3,logid=2393,logstr="三转符文袋",},
	{ item_id = 4610,index=4,logid=2393,logstr="四转符文袋",},
	{ item_id = 4611,index=5,logid=2393,logstr="五转符文袋",},
	{ item_id = 4612,index=6,logid=2393,logstr="六转符文袋",},
	{ item_id = 4613,index=7,logid=2393,logstr="七转符文袋",},
	{ item_id = 4614,index=8,logid=2393,logstr="九转符文袋",},
	{ item_id = 4615,index=9,logid=2393,logstr="十一转符文袋",},
	{ item_id = 5363,index=10,logid=2393,logstr="1级宝石袋",},
	{ item_id = 5364,index=11,logid=2393,logstr="2级宝石袋",},
	{ item_id = 5365,index=12,logid=2393,logstr="3级宝石袋",},
	{ item_id = 5366,index=13,logid=2393,logstr="银杏战将装备箱",},
	{ item_id = 5367,index=14,logid=2393,logstr="比奇战将装备箱",},
	{ item_id = 5368,index=15,logid=2393,logstr="毒蛇战将装备箱",},
	{ item_id = 5369,index=16,logid=2393,logstr="沃玛战将装备箱",},
	{ item_id = 5370,index=17,logid=2393,logstr="祖玛战将装备箱",},
	{ item_id = 5384,index=18,logid=2393,logstr="4阶宝石袋",},
	{ item_id = 5385,index=19,logid=2393,logstr="5阶宝石袋",},

}

JiZiLiBao = {
	{ item_id = 5454,index=1,logid=2393,logstr="集字初级礼包",},
	{ item_id = 5455,index=2,logid=2393,logstr="集字中级礼包",},
	{ item_id = 5456,index=3,logid=2393,logstr="集字高级礼包",},
    { item_id = 6360,index=4,logid=2393,logstr="元旦礼包",},
	{ item_id = 6371,index=5,logid=2393,logstr="幻羽礼盒",},
	{ item_id = 6368,index=6,logid=2393,logstr="饰品箱",},
	{ item_id = 6369,index=7,logid=2393,logstr="绿色生肖袋",},
	{ item_id = 6370,index=8,logid=2393,logstr="蓝色生肖袋",},

	{ item_id = 6657,index=9,logid=2393,logstr="时装礼盒",},
	{ item_id = 6658,index=10,logid=2393,logstr="灵器礼盒",},
	{ item_id = 6659,index=11,logid=2393,logstr="传世礼盒",},
	{ item_id = 6675,index=12,logid=2393,logstr="女娲宝藏",},
	{ item_id = 6690,index=13,logid=2393,logstr="时装碎片礼盒",},
	{ item_id = 6863,index=14,logid=2393,logstr="节日在线礼盒",},
	{ item_id = 6864,index=15,logid=2393,logstr="节日优惠礼盒",},

	{ item_id = 6929,index=16,logid=2393,logstr="周年庆礼盒②",},
	{ item_id = 6930,index=17,logid=2393,logstr="周年庆礼盒③",},
	{ item_id = 6931,index=18,logid=2393,logstr="周年庆礼盒④",},

}

JiZiObject = {
	{ item_id = 5446,addExp = 500000},
    { item_id = 5447,addExp = 500000},
    { item_id = 5448,addExp = 500000},
	{ item_id = 5449,addExp = 500000},
	{ item_id = 5450,addExp = 500000},
	{ item_id = 5451,addExp = 500000},
	{ item_id = 5452,addExp = 500000},
	{ item_id = 7806,addExp = 500000},
	{ item_id = 7807,addExp = 500000},
	{ item_id = 7808,addExp = 500000},
	{ item_id = 7809,addExp = 500000},

	{ item_id = 6538,addExp = 500000},
	{ item_id = 6539,addExp = 500000},
	{ item_id = 6540,addExp = 500000},
	{ item_id = 6541,addExp = 500000},
	{ item_id = 6542,addExp = 500000},
	{ item_id = 6543,addExp = 500000},

	{ item_id = 7812,addExp = 500000},
}

--装备箱 zer 2017/01/09
--type = 0 就直接随机给予列表内道具1件. type = 1就是3个小列表按职业战法道区分来给的,同样是随机一件
ItemBoxFor2017 = {
	{ item_id = 375, type = 0,	bind = 1, giveid = {430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603}},	--转生装备箱
	{ item_id = 376, type = 0,	bind = 1, giveid = {451,452,453,454,455,456}},	--3转装备箱
	{ item_id = 377, type = 0,	bind = 1, giveid = {589,590,591,592,593,594}},	--5转装备箱
	{ item_id = 378, type = 0,	bind = 1, giveid = {598,599,600,601,602,603}},	--6转装备箱
	{ item_id = 391, type = 1,	bind = 0, giveid = {{90,91,92,93,94,95},{99,100,101,102,103,104},{108,109,110,111,112,113}} },	--7转首饰箱
	{ item_id = 392, type = 1,	bind = 0, giveid = {{117,118,119,120,121,122},{126,127,128,129,130,131},{135,136,137,138,139,140}} },	--9转首饰箱
	{ item_id = 393, type = 1,	bind = 0, giveid = {{144,145,146,147,148,149},{153,154,155,156,157,158},{162,163,164,165,166,167}} },	--11转首饰箱

	{ item_id = 7181, type = 1,	bind = 0, giveid = {{171,172,173,174,175,176},{180,181,182,183,184,185},{189,190,191,192,193,194}} },	--13转首饰箱
	{ item_id = 7182, type = 1,	bind = 0, giveid = {{168,169,170,171,172,173,174,175,176},{177,178,179,180,181,182,183,184,185},{186,187,188,189,190,191,192,193,194}} },	--13转首饰箱

	{ item_id = 6679, type = 1,	bind = 0, giveid = {433,434,435,436,437,438} },
	{ item_id = 6680, type = 1,	bind = 0, giveid = {442,443,444,445,446,447} },
	{ item_id = 6681, type = 1,	bind = 0, giveid = {451,452,453,454,455,456} },
	{ item_id = 6682, type = 1,	bind = 0, giveid = {{4621,4622,4623,4624,4625,4626},{4630,4631,4632,4633,4634,4635},{4639,4640,4641,4642,4643,4644}} },
	{ item_id = 6683, type = 1,	bind = 0, giveid = {{4648,4649,4650,4651,4652,4653},{4657,4658,4659,4660,4661,4662},{4666,4667,4668,4669,4670,4671}} },
	{ item_id = 6684, type = 1,	bind = 0, giveid = {{4675,4676,4677,4678,4679,4680},{4684,4685,4686,4687,4688,4689},{4693,4694,4695,4696,4697,4698}} },
	{ item_id = 6685, type = 1,	bind = 0, giveid = {{90,91,92,93,94,95},{99,100,101,102,103,104},{108,109,110,111,112,113}} },

	{ item_id = 373, type = 0,	bind = 1, giveid = { 403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,433,434,435,436,437,438 } },	--高阶装备箱
	{ item_id = 374, type = 0,	bind = 1, giveid = { 337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372} },	--中阶装备箱

    { item_id = 6818, type = 0,	bind = 1, giveid = {6329,6330,6331,6332,6333,6334,6338,6339,6340,6341,6342,6343,6347,6348,6349,6350,6351,6352}},	--元神装备箱
    { item_id = 6887, type = 0,	bind = 0, giveid = {5963,5964,5965,5966,5967,5968}},	--龍装Ⅰ首饰箱
	{ item_id = 6819, type = 0,	bind = 1, giveid = {6050,6055,6060,6065,6070,6075,6080,6085,6090,6095,6100,6105}},	--紫色生肖袋

	{ item_id = 6936, type = 0,	bind = 0, giveid = {6947,6948,6949,6950,6951,6952}},	--至尊屠龙首饰盒
    { item_id = 7043, type = 0,	bind = 1, giveid = {6967,6971,6975,6979,7786,7790,7794,7798}},  --初级足迹礼盒
	{ item_id = 7044, type = 0,	bind = 1, giveid = {6967,6971,6975,6979,7786,7790,7794,7798}},  --中级足迹礼盒
	{ item_id = 7045, type = 0,	bind = 1, giveid = {6967,6971,6975,6979,7786,7790,7794,7798}},  --高级足迹礼盒
	{ item_id = 7047, type = 0,	bind = 1, giveid = {6941,6888,6892,6896,6900}},  --坐骑礼盒
	{ item_id = 7048, type = 0,	bind = 1, giveid = {6865,6866,6867,6868}},  --坐骑装备礼盒
	{ item_id = 7049, type = 0,	bind = 1, giveid = {6983,6988,6993,6998}},  --翅膀装备礼盒
	{ item_id = 7051, type = 0,	bind = 1, giveid = {6719,6715,6723,6727,7703}},  --三国时装礼盒
	{ item_id = 7650, type = 0,	bind = 0, giveid = {7204,7205,7206,7207,7208,7209}},  --银龙腾首饰礼盒

	{ item_id = 7707, type = 0,	bind = 0, giveid = {7213,7214,7215,7216,7217,7218}},  --绿龙腾首饰礼盒
	{ item_id = 7708, type = 0,	bind = 0, giveid = {7222,7223,7224,7225,7226,7227}},  --蓝龙腾首饰礼盒
	{ item_id = 7709, type = 0,	bind = 0, giveid = {7231,7232,7233,7234,7235,7236}},  --紫龙腾首饰礼盒
	{ item_id = 7710, type = 0,	bind = 0, giveid = {7240,7241,7242,7243,7244,7245}},  --金龙腾首饰礼盒

	{ item_id = 7651, type = 0,	bind = 1, giveid = {7080,7081,7082,7083,7084,7085}},  --雷神首饰礼盒
	{ item_id = 7690, type = 0,	bind = 1, giveid = {7658,7666,7674,7682}},  --神盾礼盒

	{ item_id = 7813, type = 0,	bind = 1, giveid = {7720,7721,7722,7723,7724,7725}},  --太初仙装
	{ item_id = 7814, type = 0,	bind = 1, giveid = {7726,7727,7728,7729,7730,7731}},  --太初仙装
	{ item_id = 7815, type = 0,	bind = 1, giveid = {7732,7733,7734,7735,7736,7737}},  --太初仙装
	{ item_id = 7816, type = 0,	bind = 1, giveid = {7738,7739,7740,7741,7742,7743}},  --太初仙装
	{ item_id = 7817, type = 0,	bind = 1, giveid = {7744,7745,7746,7747,7748,7749}},  --太初仙装
	{ item_id = 7818, type = 0,	bind = 1, giveid = {7750,7751,7752,7753,7754,7755}},  --太初仙装
	{ item_id = 7819, type = 0,	bind = 1, giveid = {7756,7757,7758,7759,7760,7761}},  --太初仙装
	{ item_id = 7820, type = 0,	bind = 1, giveid = {7762,7763,7764,7765,7766,7767}},  --太初仙装

	{ item_id = 7827, type = 0,	bind = 1, giveid = {7697,7698,7699,7700}},  --神戒宝盒

	{ item_id = 304, type = 99,	bind = 1, giveid = {
		{additemid = 860, num = {8,12}, },--宝藏钥匙
	} },	--夺宝奇兵 散人宝藏箱

};

--加buff的道具
zBuffItem =
{
    {item_id = 4741,buffid = 219},
    {item_id = 4742,buffid = 220},
    {item_id = 4743,buffid = 221},
}

zNewZodiacItem =
{
--依次排序为 子鼠、丑牛、寅虎、卯兔、辰龙、巳蛇、午马、未羊、申猴、酉鸡、戌狗、亥猪
    {item_id = 6035,index = 1,count=10,},
    {item_id = 6036,index = 2,count=10,},
    {item_id = 6037,index = 3,count=10,},
    {item_id = 6038,index = 4,count=10,},
    {item_id = 6039,index = 5,count=10,},
    {item_id = 6040,index = 6,count=10,},
    {item_id = 6041,index = 7,count=10,},
    {item_id = 6042,index = 8,count=10,},
    {item_id = 6043,index = 9,count=10,},
    {item_id = 6044,index = 10,count=10,},
    {item_id = 6045,index = 11,count=10,},
    {item_id = 6046,index = 12,count=10,},

}
--//卷轴类 2013/7/9
zJuanZhouAdd = {
	{ item_id = 565, value = 2,	pr = 126, str = "护盾碎片",logid=2697},	--1级护盾碎片   
	{ item_id = 566, value = 5,	pr = 126, str = "护盾碎片",logid=2697},	--2级护盾碎片   
	{ item_id = 567, value = 10,	pr = 126, str = "护盾碎片",logid=2697},	--3级护盾碎片   
	{ item_id = 568, value = 100,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(小)
	{ item_id = 569, value = 1000,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(中)
	{ item_id = 570, value = 10000,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(大)

	{ item_id = 537, value = 100,    pr = 125, str = "宝石结晶",logid=2692},	--宝石结晶(100)
	{ item_id = 538, value = 1000,   pr = 125, str = "宝石结晶",logid=2692},	--宝石结晶(1000)
	{ item_id = 539, value = 10000, pr = 125, str = "宝石结晶",logid=2692},	--宝石结晶(10000)

	{ item_id = 572, value = 100,	pr = 127, str = "圣珠结晶",logid=2698},	--圣珠结晶(100)
	{ item_id = 573, value = 1000,	pr = 127, str = "圣珠结晶",logid=2698},	--圣珠结晶(1000)
	{ item_id = 574, value = 10000,	pr = 127, str = "圣珠结晶",logid=2698},	--圣珠结晶(10000)

	{ item_id = 527, value = 1,    pr = 131, str = "特戒结晶",logid=2693},	--特戒结晶(1)
	{ item_id = 530, value = 10,    pr = 131, str = "特戒结晶",logid=2693},	--特戒结晶(10)
	{ item_id = 528, value = 100,   pr = 131, str = "特戒结晶",logid=2693},	--特戒结晶(100)
	{ item_id = 529, value = 10000,  pr = 131, str = "特戒结晶",logid=2693},	--特戒结晶(10000)

	{ item_id = 6297, value = 10000,  pr = 166, str = "元神丹(小)",logid=2693},	--元神丹(10000)
	{ item_id = 6374, value = 50000,  pr = 166, str = "元神丹(中)",logid=2693},	--元神丹(10000)
	{ item_id = 6298, value = 100000,  pr = 166, str = "元神丹(大)",logid=2693},	--元神丹(10000)

	--{ item_id = 6915, value = 100,    pr = 125, str = "血炼精华",logid=2692},	--血炼精华(100)
	--{ item_id = 6916, value = 1000,   pr = 125, str = "血炼精华",logid=2692},	--血炼精华(1000)
	--{ item_id = 6917, value = 10000, pr = 125, str = "血炼精华",logid=2692},	--血炼精华(10000)
	
	

	-- { item_id = 6372, value = 1000,  pr = 166, str = "注魂丹(小)",logid=2693},	--注魂丹(1000)
	-- { item_id = 6373, value = 10000,  pr = 166, str = "注魂丹(大)",logid=2693},	--注魂丹(10000)

 
	{ item_id = 511, value = 1000000, str = "经验", type = 3,staticId = 0},	--经验丹(小)
	{ item_id = 512, value = 2000000, str = "经验", type = 3,staticId = 0},	--经验丹(中)
	{ item_id = 513, value = 5000000, str = "经验", type = 3,staticId = 0},	--经验丹(大)
	{ item_id = 676, value = 90000000, str = "经验", type = 3,staticId = 0},	--超级经验丹

	{ item_id = 5379, value = 50000, str = "经验", type = 3,staticId = 0,dayuseitem =50,},	--经验丹(5W)
	{ item_id = 5380, value = 100000, str = "经验", type = 3,staticId = 0,dayuseitem =50,},	--经验丹(10W)
	{ item_id = 5381, value = 200000, str = "经验", type = 3,staticId = 0,dayuseitem =45,},	--经验丹(20W)
	{ item_id = 5382, value = 300000, str = "经验", type = 3,staticId = 0,dayuseitem =40,},	--经验丹(30W)
	{ item_id = 5383, value = 500000, str = "经验", type = 3,staticId = 0,dayuseitem =30,},	--经验丹(50W)

	{ item_id = 4744, value = 10000, str = "内功经验", type = 8},	--内功经验卷(小)
	{ item_id = 4745, value = 20000, str = "内功经验", type = 8},	--内功经验卷(中)
	{ item_id = 4746, value = 50000, str = "内功经验", type = 8},	--内功经验卷(大)

	{item_id = 5165,value=10,str="神魂值",type = 5},--神魂值 
	{item_id = 5166,value=100,str="神魂值",type = 5},--神魂值
	{item_id = 5167,value=1000,str="神魂值",type = 5},--神魂值
	{item_id = 5168,value=10000,str="神魂值",type = 5},--神魂值
	{item_id = 5171,value=1,str="神魂值",type = 5},--神魂值

	{ item_id = 5469, value = 50000, str = "经验", type = 3,staticId = 0},	--烟花
	{ item_id = 6359, value = 50000, str = "经验", type = 3,staticId = 0},	--灯笼
	{ item_id = 7657, value = 50000, str = "经验", type = 3,staticId = 0},	--月饼

	
	
	{ item_id = 5642, value = 280000, str = "斗笠精华",type =9 },	--面巾礼包(小)
	{ item_id = 5643, value = 1100000, str = "斗笠精华", type =9},	--面巾礼包(中)
	{ item_id = 5644, value = 2800000, str = "斗笠精华",type =9},	--面巾礼包(大)
	
	{ item_id = 5645, value = 10000, str = "斗笠精华", type =9},	--烟花
	{ item_id = 5646, value = 100000, str = "斗笠精华",type =9},	--烟花
	{ item_id = 5647, value = 1000000, str = "斗笠精华", type =9},	--烟花
	
	
	{ item_id = 6912, value = 2, str = "血练精华", type =10},	--血练精华
	{ item_id = 6913, value = 5, str = "血练精华", type =10},	--血练精华
	{ item_id = 6914, value = 10, str = "血练精华", type =10},	--血练精华
    { item_id = 6915, value = 100, str = "血练精华", type =10},	--血练精华
    { item_id = 6916, value = 1000, str = "血练精华", type =10},	--血练精华
    { item_id = 6917, value = 10000, str = "血练精华", type =10},	--血练精华


	{ item_id = 7151, value = 1, str = "仙力", type =11},	--仙力
    { item_id = 7152, value = 10, str = "仙力", type =11},	--仙力
	{ item_id = 7153, value = 100, str = "仙力", type =11},	--仙力
	{ item_id = 7154, value = 1000, str = "仙力", type =11},	--仙力
	{ item_id = 7155, value = 10000, str = "仙力", type =11},	--仙力

	{ item_id = 7194, value = 100, str = "火龙结晶", type =12},	--火龙结晶
    { item_id = 7195, value = 1000, str = "火龙结晶", type =12},	--火龙结晶
	{ item_id = 7196, value = 10000, str = "火龙结晶", type =12},	--火龙结晶

	{ item_id = 7618, value = 100, str = "戒灵粉尘(100)", type =13},	--戒灵粉尘
    { item_id = 7619, value = 1000, str = "戒灵粉尘(1000)", type =13},	 --戒灵粉尘
	{ item_id = 7620, value = 10000, str = "戒灵粉尘(10000)", type =13},  --戒灵粉尘

	{ item_id = 7780, value = 2, str = "仙钻(2颗)", type =14},	--仙钻(2颗)
    { item_id = 7781, value = 5, str = "仙钻(5颗)", type =14},	 --仙钻(5颗)
	{ item_id = 7782, value = 10, str = "仙钻(10颗)", type =14},  --仙钻(10颗)
	{ item_id = 7783, value = 100, str = "仙钻(100颗)", type =14},  --仙钻(100颗)
	{ item_id = 7784, value = 1000, str = "仙钻(1000颗)", type =14},  --仙钻(1000颗)
	{ item_id = 7785, value = 10000, str = "仙钻(10000颗)", type =14},  --仙钻(10000颗)



};

--成就物品系列
zAchievement = {
	{ item_id = 488, value = 2000,  str = "成就", maxUseTimes = -1, type = 4,logid=2694},	--成就令牌(小)(maxUseTimes:-1=无次数限制。10=每日只能使用10次)
	{ item_id = 489, value = 20000,  str = "成就", maxUseTimes = -1, type = 4,logid=2694},	--成就令牌(中)
	{ item_id = 490, value = 200000, str = "成就", maxUseTimes = -1, type = 4,logid=2694},	--成就令牌(大)
}

--关于符魄的物品
FuSoulAdd = {
	{ item_id = 531, value = 2, 	pr = 124, str = "护符碎片", staticId = 0},	--1级护符碎片   
	{ item_id = 532, value = 5, 	pr = 124, str = "护符碎片", staticId = 0},	--2级护符碎片   
	{ item_id = 533, value = 10,  	pr = 124, str = "护符碎片", staticId = 0},	--3级护符碎片   
	{ item_id = 534, value = 100,  	pr = 124, str = "护符碎片", staticId = 57},	--护符碎片包(小)
	{ item_id = 535, value = 1000, 	pr = 124, str = "护符碎片", staticId = 58},	--护符碎片包(中)
	{ item_id = 536, value = 10000, pr = 124, str = "护符碎片", staticId = 58},	--护符碎片包(大)
}

--功勋令牌--军印
Alchemy_Add = {
	{ item_id = 484, value = 1000,logid=2695,},	--功勋令牌(小)
	{ item_id = 485, value = 10000,logid=2695,},	--功勋令牌(中)
	{ item_id = 486, value = 100000,logid=2695,},	--功勋令牌(大)
}


--生肖道具
ZodiacItem =
{
--bit 为整数型位置
    {item_id = 1814,bit = 0,},--鼠
    {item_id = 1815,bit = 1,}, --牛
    {item_id = 1816,bit = 2,}, --虎
    {item_id = 1817,bit = 3,}, --兔
    {item_id = 1818,bit = 4,}, --龙
    {item_id = 1819,bit = 5,}, --蛇
    {item_id = 1820,bit = 6,}, --马
    {item_id = 1821,bit = 7,}, --羊
    {item_id = 1822,bit = 8,}, --猴
    {item_id = 1823,bit = 9,}, --鸡
    {item_id = 1824,bit = 10,}, --狗
    {item_id = 1825,bit = 11,}, --猪
}

--大礼包
BigGiftBag = {
--	{item_id = 593, type = 1,},	--黄金
--	{item_id = 594, type = 2,},	--经验
--	{item_id = 595, type = 3,},	--财神
};

--XX元仙丹--等级提升丹
UpgradeElixir = {
	{item_id = 675, n = 1, str = "等级提升丹", level = 80,value = 3000000},--等级提升丹

};

--新技能
zNewSkill = {
--	{item_id = 725,type = 1,value = 56,level = 35},	--彻地钉
--	{item_id = 726,type = 2,value = 57,level = 35},	--群体雷电术
--	{item_id = 727,type = 3,value = 58,level = 35},	--群体火符
};


--BOSS积分
BOSSintegral = {
	{ item_id = 308, str = "BOSS积分", value = 1, dparam = 116},--BOSS积分(小)
	{ item_id = 309, str = "BOSS积分", value = 10, dparam = 116},--BOSS积分(中)
	{ item_id = 310, str = "BOSS积分", value = 50, dparam = 116},--BOSS积分(大)
	{ item_id = 311, str = "BOSS积分", value = 100, dparam = 116},--BOSS积分(大)
};


--转生修为丹
CircleExp = {
	{item_id = 542, str = "转生修为", value = 1000,},	---转生修为丹(小)
	{item_id = 543, str = "转生修为", value = 5000,},	---转生修为丹(中)
	{item_id = 544, str = "转生修为", value = 10000,},	---转生修为丹(大)
};

--XX宝盒 双击打开增加物品道具
AddItemToPlayer = {

	{
		item_id = 825, ----黄金宝盒(首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 2000000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 4000,bind = 0},--添加元宝
		},
	},

	{
		item_id = 6885, ----名人堂奖励
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 6371,cout = 1,bind = 1},--幻羽礼盒
			{type = 0,id = 6363,cout = 1,bind = 1},--豪礼宝箱
			{type = 0,id = 6403,cout = 20,bind = 1},--五行石
			{type = 0,id = 6702,cout = 10,bind = 1},--洛阳铲
			{type = 0,id = 5365,cout = 3,bind = 1},--三阶宝石袋

		},
	},

	{
		item_id = 6372, ----注魂丹小
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 71,id = 0,cout = 1000,bind = 0},
		},
	},
	{
		item_id = 6373, ----注魂丹大
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 71,id = 0,cout = 10000,bind = 0},
		},
	},
	{
		item_id = 826, ----白银宝盒(首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 1000000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 2000,bind = 0},--添加元宝
		},
	},
	{
		item_id = 827, ----青铜宝盒(首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 1000000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 1000,bind = 0},--添加元宝
		},
	},
----------
	{
		item_id = 828, ----黄金宝盒(非首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 2000000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 2000,bind = 0},--添加元宝
		},
	},
	{
		item_id = 829, ----白银宝盒(非首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 2000000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 1000,bind = 0},--添加元宝
		},
	},
	{
		item_id = 830, ----青铜宝盒(非首次攻城奖励)
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 5,id = 0,cout = 500000,bind = 0},--添加绑金
			{type = 15,id = 0,cout = 1000,bind = 0},--添加元宝
		},
	},

	{
		item_id = 6932, ----手机礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 6363,cout = 10,bind = 1},--

		},
	},

	{
		item_id = 628, ----战将礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 551,cout = 3,bind = 1},--
			{type = 0,id = 560,cout = 1,bind = 1},--
			{type = 0,id = 80,cout = 6,bind = 1},--

		},
	},

	{
		item_id = 5138, ----战将礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 561,cout = 2,bind = 1},--
			{type = 0,id = 570,cout = 3,bind = 1},--
			{type = 0,id = 536,cout = 3,bind = 1},--
			{type = 0,id = 509,cout = 1,bind = 1},--

		},
	},

	{
		item_id = 4616, ----1-6转boss符文箱
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 4607,cout = 1,bind = 1},--
			{type = 0,id = 4608,cout = 1,bind = 1},--
			{type = 0,id = 4609,cout = 1,bind = 1},--
			{type = 0,id = 4610,cout = 1,bind = 1},--
			{type = 0,id = 4611,cout = 1,bind = 1},--
			{type = 0,id = 4612,cout = 1,bind = 1},--

		},
	},

	{
		item_id = 4617, ----1-6转boss符文箱
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 4607,cout = 2,bind = 1},--
			{type = 0,id = 4608,cout = 2,bind = 1},--
			{type = 0,id = 4609,cout = 2,bind = 1},--
			{type = 0,id = 4610,cout = 2,bind = 1},--
			{type = 0,id = 4611,cout = 2,bind = 1},--
			{type = 0,id = 4612,cout = 2,bind = 1},--

		},
	},

	{
		item_id = 648, ----战力补偿礼包-3.17号
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 508,cout = 2,bind = 1},--
			{type = 0,id = 85,cout = 5,bind = 1},--
			{type = 0,id = 498,cout = 1,bind = 1},--
			{type = 0,id = 561,cout = 1,bind = 1},--

		},
	},

	{
		item_id = 629, ----神炉礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 534,cout = 5,bind = 1},--
			{type = 0,id = 568,cout = 5,bind = 1},--
			{type = 0,id = 80,cout = 6,bind = 1},--

		},
	},

	{
		item_id = 630, ----翅膀礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 464,cout = 50,bind = 1},--
			{type = 0,id = 80,cout = 6,bind = 1},--
			{type = 0,id = 507,cout = 2,bind = 1},--

		},
	},

	{
		item_id = 631, ----强化礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 459,cout = 60,bind = 1},--
			{type = 0,id = 80,cout = 6,bind = 1},--
			{type = 0,id = 507,cout = 2,bind = 1},--

		},
	},

	{
		item_id = 632, ----BOSS礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 678,cout = 20,bind = 1},--
			{type = 0,id = 560,cout = 1,bind = 1},--
			{type = 0,id = 507,cout = 4,bind = 1},--
		},
	},

	{
		item_id = 633, ----行会礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 507,cout = 3,bind = 1},--
			{type = 0,id = 560,cout = 1,bind = 1},--
			{type = 0,id = 374,cout = 5,bind = 1},--
		},
	},

	{
		item_id = 635, ----超级VIP礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 508,cout = 5,bind = 1},--
			{type = 0,id = 561,cout = 3,bind = 1},--
			{type = 0,id = 498,cout = 3,bind = 1},--
			{type = 0,id = 536,cout = 5,bind = 1},--
			{type = 0,id = 570,cout = 5,bind = 1},--
		},
	},

	{
		item_id = 637, ----挑战礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
			{type = 0,id = 507,cout = 5,bind = 1},--
			{type = 0,id = 561,cout = 1,bind = 1},--
			{type = 0,id = 374,cout = 3,bind = 1},--
			{type = 0,id = 373,cout = 1,bind = 1},--
			{type = 0,id = 535,cout = 5,bind = 1},--
			{type = 0,id = 569,cout = 5,bind = 1},--

		},
	},

	{
		item_id = 5159, ----精品大礼包--每日充值综合
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id = 484, cout = 1, bind = 1}, ---功勋令牌(小)
                    {type = 0, id = 536, cout = 1, bind = 1}, ---护符碎片(10000颗)*1
                    {type = 0, id = 570, cout = 1, bind = 1}, ---护盾碎片(10000颗)*1
                    {type = 0, id = 538, cout = 1, bind = 1}, ---宝石结晶(1000)*1
                    {type = 0, id = 573, cout = 1, bind = 1}, ---圣珠结晶(1000)*1
                    {type = 0, id = 4744, cout = 1,  bind = 1}, ---内功经验卷(小)*1
                    {type = 0, id = 860, cout = 1,  bind = 1}, ---宝藏钥匙*1

		},
	},

		{
		item_id = 5160, ----豪华大礼包--每日充值综合
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id = 484, cout = 2, bind = 1}, ---功勋令牌(小)
                    {type = 0, id = 536, cout = 2, bind = 1}, ---护符碎片(10000颗)*2
                    {type = 0, id = 570, cout = 2, bind = 1}, ---护盾碎片(10000颗)*2
                    {type = 0, id = 538, cout = 2, bind = 1}, ---宝石结晶(1000)*2
                    {type = 0, id = 573, cout = 2, bind = 1}, ---圣珠结晶(1000)*2
                    {type = 0, id = 4744, cout = 2, bind = 1}, ---内功经验卷(小)*2

		},
	},

		{
		item_id = 5161, ----超级大礼包--每日充值综合
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id = 484, cout = 3, bind = 1}, ---功勋令牌(小)
                    {type = 0, id = 536, cout = 3, bind = 1}, ---护符碎片(10000颗)*3
                    {type = 0, id = 570, cout = 3, bind = 1}, ---护盾碎片(10000颗)*3
                    {type = 0, id = 538, cout = 3, bind = 1}, ---宝石结晶(1000)*3
                    {type = 0, id = 573, cout = 3, bind = 1}, ---圣珠结晶(1000)*3
                    {type = 0, id = 4744, cout = 3, bind = 1}, ---内功经验卷(小)*3

		},
	},

		{
		item_id = 5162, ----富贵大礼包--每日充值综合
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id = 484, cout = 4, bind = 1}, ---功勋令牌(小)
                    {type = 0, id = 536, cout = 4, bind = 1}, ---护符碎片(10000颗)*4
                    {type = 0, id = 570, cout = 4, bind = 1}, ---护盾碎片(10000颗)*4
                    {type = 0, id = 538, cout = 4, bind = 1}, ---宝石结晶(1000)*4
                    {type = 0, id = 573, cout = 4, bind = 1}, ---圣珠结晶(1000)*4
                    {type = 0, id = 4744, cout = 4, bind = 1}, ---内功经验卷(小)*4

		},
	},

	{
		item_id = 5163, ----土豪大礼包--每日充值综合
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id = 484, cout = 5, bind = 1}, ---功勋令牌(小)
                    {type = 0, id = 536, cout = 5, bind = 1}, ---护符碎片(10000颗)*5
                    {type = 0, id = 570, cout = 5, bind = 1}, ---护盾碎片(10000颗)*5
                    {type = 0, id = 538, cout = 5, bind = 1}, ---宝石结晶(1000)*5
                    {type = 0, id = 573, cout = 5, bind = 1}, ---圣珠结晶(1000)*5
                    {type = 0, id = 4744, cout = 5, bind = 1}, ---内功经验卷(小)*5

		},
	},


	{
		item_id = 5939, ----搜狗散人积分礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0,  id=509,cout=2, bind = 1}, 
                    {type = 0, id=538,cout=1, bind = 1}, 
                    {type = 0, id=573,cout=1, bind = 1},
                    {type = 0, id=459,cout=188, bind = 1}, 
		},
	},

	{
		item_id = 5940, ----搜狗散人黄金礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0,  id=509,cout=2, bind = 1}, 
                    {type = 0, id=548,cout=50, bind = 1}, 
                    {type = 0, id=463,cout=10, bind = 1},
                    {type = 0, id=464,cout=188, bind = 1}, 
		},
	},

	{
		item_id = 5941, ----搜狗散人钻石礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0,  id=509,cout=2, bind = 1}, 
                    {type = 0, id=536,cout=5,bind = 1}, 
                    {type = 0,  id=570,cout=5, bind = 1},
                    {type = 0, id=489,cout=5, bind = 1}, 
					{type = 0, id=552,cout=5, bind = 1}, 
		},
	},


	{
		item_id = 5942, ----搜狗散人至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=509,cout=7, bind = 1}, 
                    {type = 0, id=538,cout=7, bind = 1}, 
                    {type = 0, id=573,cout=7, bind = 1},
                    {type = 0, id=464,cout=288, bind = 1}, 
					{type = 0, id=459,cout=288, bind = 1},
				  	{type = 0, id=85,cout=20, bind = 1},
		},
	},



	{
		item_id = 5945, ----51积分礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=509,cout=2, bind = 1}, 
                    {type = 0, id=538,cout=1, bind = 1}, 
                    {type = 0, id=573,cout=1, bind = 1},
                    {type = 0, id=459,cout=188, bind = 1}, 
		},
	},

	{
		item_id = 5946, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=509,cout=7, bind = 1}, 
                    {type = 0, id=538,cout=7, bind = 1}, 
                    {type = 0, id=573,cout=7, bind = 1},
                    {type = 0, id=464,cout=288, bind = 1}, 
					{type = 0, id=459,cout=288, bind = 1},
				  	{type = 0, id=85,cout=20, bind = 1},
		},
	},

	{
		item_id = 7184, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6657,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7183, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6363,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7185, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6658,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7186, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=7039,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7187, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6659,cout=1, bind = 1}, 

		},
	},

		{
		item_id = 7188, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6887,cout=1, bind = 1}, 

		},
	},

			{
		item_id = 7189, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6820,cout=1, bind = 1}, 

		},
	},

			{
		item_id = 7190, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6371,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7191, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=7047,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7192, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=7051,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7193, ----51至尊礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6818,cout=1, bind = 1}, 

		},
	},

	{
		item_id = 7652, ----51节日大礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=6862,cout=50, bind = 1}, 
					{type = 0, id=6363,cout=5, bind = 1}, 
					{type = 0, id=459,cout=50, bind = 1}, 
					{type = 0, id=464,cout=50, bind = 1}, 
					{type = 0, id=573,cout=5, bind = 1}, 
					{type = 0, id=538,cout=5, bind = 1}, 

		},
	},


	{
		item_id = 6179, ----腾讯60级礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 538, cout = 1, bind = 1},--宝石结晶(1000)*1
				{type = 0, id = 536, cout = 1,  bind = 1},--护符碎片(10000颗)*1
				{type = 0, id = 508, cout = 1, bind = 1},--金砖(绑金)*1
				{type = 0, id = 678, cout = 20,  bind = 1},--副本传送卷*20
				{type = 0, id = 548, cout = 10, bind = 1},--转生地宫证明*10
		},
	},


	{
		item_id = 6180, ----腾讯70级礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 573, cout = 1, bind = 1},--圣珠结晶(1000)*1
				{type = 0, id = 570, cout = 1, bind = 1},--护盾碎片(10000颗)*1
				{type = 0, id = 509, cout = 1, bind = 1},--大金砖(绑金)*1
				{type = 0, id = 678, cout = 50,  bind = 1},--副本传送卷*50
				{type = 0, id = 5475, cout = 10, bind = 1},--玛雅神殿证明*10
		},
	},

	{
		item_id = 6181, ----腾讯75级礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 538, cout = 1,  bind = 1},--宝石结晶(1000)*1
				{type = 0, id = 573, cout = 1,  bind = 1},--圣珠结晶(1000)*1
				{type = 0, id = 536, cout = 2,  bind = 1},--护符碎片(10000)*2
				{type = 0, id = 570, cout = 2,  bind = 1},--护盾碎片(10000)*2
				{type = 0, id = 552, cout = 1,  bind = 1},--战将灵力丹(中)*1
		},
	},

	{
		item_id = 6182, ----腾讯80级礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 538, cout = 1,  bind = 1},--宝石结晶(1000)*1
				{type = 0, id = 573, cout = 1,  bind = 1},--圣珠结晶(1000)*1
				{type = 0, id = 536, cout = 3,  bind = 1},--护符碎片(10000)*3
				{type = 0, id = 570, cout = 3,  bind = 1},--护盾碎片(10000)*3
				{type = 0, id = 459, cout = 188,  bind = 1},--星纹强化石*188
		},
	},

	{
		item_id = 6183, ----腾讯85级礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 538, cout = 2,  bind = 1},--宝石结晶(1000)*2
				{type = 0, id = 573, cout = 2,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id = 5171, cout = 188, bind = 1},--神魂*188
				{type = 0, id = 542, cout = 1,  bind = 1},--转生修为丹(小)*1
				{type = 0, id = 464, cout = 288,  bind = 1},--1级羽毛*288
		},
	},

	{
		item_id = 6220, ----20%工资礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 507, cout = 3,  bind = 1},--宝石结晶(1000)*2
				{type = 0, id = 551, cout = 5,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id = 678, cout = 10, bind = 1},--神魂*188
				{type = 0, id = 561, cout = 1,  bind = 1},--转生修为丹(小)*1
				{type = 0, id = 548, cout = 3,  bind = 1},--1级羽毛*288
		},
	},

	{
		item_id = 6221, ----50%工资礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 507, cout = 5,  bind = 1},--宝石结晶(1000)*2
				{type = 0, id = 570, cout = 1,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id = 536, cout = 1, bind = 1},--神魂*188
				{type = 0, id = 552, cout = 1,  bind = 1},--转生修为丹(小)*1
				{type = 0, id = 5171, cout = 88,  bind = 1},--1级羽毛*288
		},
	},

	{
		item_id = 6222, ----100%工资礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id = 507, cout = 10,  bind = 1},--宝石结晶(1000)*2
				{type = 0, id = 538, cout = 1,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id = 573, cout = 1, bind = 1},--神魂*188
				{type = 0, id = 464, cout = 188,  bind = 1},--转生修为丹(小)*1
				{type = 0, id = 5171, cout = 188,  bind = 1},--1级羽毛*288
		},
	},


	{
		item_id = 6294, ----大神礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id=5171,cout=888,  bind = 1},--宝石结晶(1000)*2
				{type = 0, id=5365,cout=3,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id=538,cout=2, bind = 1},--神魂*188
				{type = 0, id=573,cout=2,  bind = 1},--转生修为丹(小)*1
				{type = 0, id=465,cout=88,  bind = 1},--1级羽毛*288
		},
	},

	{
		item_id = 6295, ----超神礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
				{type = 0, id=5171,cout=1888, bind = 1},--宝石结晶(1000)*2
				{type = 0, id=5365,cout=5,  bind = 1},--圣珠结晶(1000)*2
				{type = 0, id=538,cout=2, bind = 1},--神魂*188
				{type = 0, id=573,cout=2,  bind = 1},--转生修为丹(小)*1
				{type = 0, id=465,cout=188,  bind = 1},--1级羽毛*288
		},
	},

	{
		item_id = 7825, ----神戒兑换券
		IsTestItem = false, --是否测试物品
		additem = 
		{
                    {type = 0, id=7827,cout=1, bind = 1}, 

		},
	},


	-- {
	-- 	item_id = 7826, ----步步高升礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=539,cout=1, bind = 1},--宝石结晶(10000)
	-- 			{type = 0, id=574,cout=1, bind = 1},--圣珠结晶(10000)
	-- 			{type = 0, id=536,cout=1, bind = 1},--护符碎片(10000颗)
	-- 			{type = 0, id=570,cout=1, bind = 1},--护盾碎片(10000颗)
	-- 			{type = 0, id=7620,cout=1, bind = 1},--戒灵粉尘(10000)
	-- 	},
	-- },

	-- {
	-- 	item_id = 7827, ----劳动节礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7197,cout=2, bind = 1},--玛法晶块
	-- 	},
	-- },

	-- {
	-- 	item_id = 7828, ----赛龙舟礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7197,cout=2, bind = 1},--潜能（100颗）
	-- 	}
	-- },

	-- {
	-- 	item_id = 7829, ----寄相思礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=6915,cout=2, bind = 1},--血炼精华（100颗）
	-- 	},
	-- },

	-- {
	-- 	item_id = 7830, ----我爱中国礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=6862,cout=20, bind = 1},--坐骑丹
	-- 	},
	-- },

	-- {
	-- 	item_id = 7831, ----感恩节礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=6403,cout=10, bind = 1},--五行石
	-- 	},
	-- },

	-- {
	-- 	item_id = 7832, ----千丝万缕 
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=1, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=1, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=2, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=2, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=6862,cout=20, bind = 1},--坐骑丹*20
	-- 	},
	-- },

	-- {
	-- 	item_id = 7833, ----感恩有你
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=2, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=2, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=3, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=3, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7064,cout=2, bind = 1},--潜能(100颗)
	-- 	},
	-- },

	-- {
	-- 	item_id = 7834, ----肉袒负荆
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=3, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=3, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=3, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=3, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7197,cout=2, bind = 1},--玛法晶块
	-- 	},
	-- },

	-- {
	-- 	item_id = 7835, ----负荆请罪 
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=4, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=4, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=4, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=4, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7064,cout=4, bind = 1},--潜能(100颗)
	-- 	},
	-- },

	-- {
	-- 	item_id = 7836, ----热泪盈眶  
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=4, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=4, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=4, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=4, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=6915,cout=4, bind = 1},--血炼精华(100颗)
	-- 	},
	-- },

	-- {
	-- 	item_id = 7837, ----至真至纯
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 			{type = 0, id=538,cout=5, bind = 1},--宝石结晶(1000)
	-- 			{type = 0, id=573,cout=5, bind = 1},--圣珠结晶(1000)
	-- 			{type = 0, id=535,cout=5, bind = 1},--护符碎片(1000颗)
	-- 			{type = 0, id=569,cout=5, bind = 1},--护盾碎片(1000颗)
	-- 			{type = 0, id=7619,cout=5, bind = 1},--戒灵粉尘(1000)
	-- 	},
	-- },





	

	{
		item_id = 638, ----9转战士礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{
-- { type=0,id=708,cout=1,bing=1,job=0},--//9转战士
-- { type=0,id=744,cout=1,bing=1,job=0},--//
-- { type=0,id=775,cout=1,bing=1,job=0},--//
-- { type=0,id=1016,cout=1,bing=1,job=0},--//
-- { type=0,id=1226,cout=1,bing=1,job=0},--//
-- { type=0,id=3704,cout=1,bing=1,job=0},--//
-- { type=0,id=4006,cout=1,bing=1,job=0},--//
-- { type=0,id=4606,cout=1,bing=1,job=0},--//
-- { type=0,id=5221,cout=1,bing=1,job=0},--//
-- { type=0,id=5271,cout=1,bing=1,job=0},--//
-- { type=0,id=81,cout=200,bing=1,job=0},--//
-- { type=0,id=114,cout=1,bing=1,job=0},--//
-- { type=0,id=115,cout=1,bing=1,job=0},--//
-- { type=0,id=116,cout=1,bing=1,job=0},--//
-- { type=0,id=117,cout=1,bing=1,job=0},--//
-- { type=0,id=118,cout=2,bing=1,job=0},--//
-- { type=0,id=119,cout=2,bing=1,job=0},--//
-- { type=0,id=120,cout=2,bing=1,job=0},--//
-- { type=0,id=121,cout=1,bing=1,job=0},--//
-- { type=0,id=122,cout=1,bing=1,job=0},--//
-- { type=0,id=509,cout=200,bing=1,job=0},--//
-- { type=0,id=544,cout=200,bing=1,job=0},--//
-- { type=0,id=4746,cout=200,bing=1,job=0},--//
-- { type=0,id=486,cout=200,bing=1,job=0},--//
-- { type=0,id=820,cout=200,bing=1,job=0},--//
-- { type=0,id=313,cout=1,bing=1,job=0},--//
-- { type=0,id=379,cout=1,bing=1,job=0},--//
-- { type=0,id=382,cout=1,bing=1,job=0},--//
-- { type=0,id=385,cout=1,bing=1,job=0},--//
-- { type=0,id=388,cout=1,bing=1,job=0},--//







		},
	},

	{
		item_id = 639, ----9转法师礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- { type=0,id=708,cout=1,bing=1,job=0},--//
-- { type=0,id=806,cout=1,bing=1,job=0},--//
-- { type=0,id=775,cout=1,bing=1,job=0},--//
-- { type=0,id=1016,cout=1,bing=1,job=0},--//
-- { type=0,id=1226,cout=1,bing=1,job=0},--//
-- { type=0,id=3755,cout=1,bing=1,job=0},--//
-- { type=0,id=4206,cout=1,bing=1,job=0},--//
-- { type=0,id=4606,cout=1,bing=1,job=0},--//
-- { type=0,id=5221,cout=1,bing=1,job=0},--//
-- { type=0,id=5271,cout=1,bing=1,job=0},--//
-- { type=0,id=81,cout=200,bing=1,job=0},--//
-- { type=0,id=123,cout=1,bing=1,job=0},--//
-- { type=0,id=124,cout=1,bing=1,job=0},--//
-- { type=0,id=125,cout=1,bing=1,job=0},--//
-- { type=0,id=126,cout=1,bing=1,job=0},--//
-- { type=0,id=127,cout=2,bing=1,job=0},--//
-- { type=0,id=128,cout=2,bing=1,job=0},--//
-- { type=0,id=129,cout=2,bing=1,job=0},--//
-- { type=0,id=130,cout=1,bing=1,job=0},--//
-- { type=0,id=131,cout=1,bing=1,job=0},--//
-- { type=0,id=509,cout=200,bing=1,job=0},--//
-- { type=0,id=544,cout=200,bing=1,job=0},--//
-- { type=0,id=4746,cout=200,bing=1,job=0},--//
-- { type=0,id=486,cout=200,bing=1,job=0},--//
-- { type=0,id=820,cout=200,bing=1,job=0},--//
-- { type=0,id=314,cout=1,bing=1,job=0},--//
-- { type=0,id=380,cout=1,bing=1,job=0},--//
-- { type=0,id=383,cout=1,bing=1,job=0},--//
-- { type=0,id=386,cout=1,bing=1,job=0},--//
-- { type=0,id=389,cout=1,bing=1,job=0},--//


		},
	},


{
		item_id = 640, ----9转道士礼包
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- { type=0,id=708,cout=1,bing=1,job=0},--//
-- { type=0,id=806,cout=1,bing=1,job=0},--//
-- { type=0,id=775,cout=1,bing=1,job=0},--//
-- { type=0,id=1016,cout=1,bing=1,job=0},--//
-- { type=0,id=1226,cout=1,bing=1,job=0},--//
-- { type=0,id=3806,cout=1,bing=1,job=0},--//
-- { type=0,id=4406,cout=1,bing=1,job=0},--//
-- { type=0,id=4606,cout=1,bing=1,job=0},--//
-- { type=0,id=5221,cout=1,bing=1,job=0},--//
-- { type=0,id=5271,cout=1,bing=1,job=0},--//
-- { type=0,id=81,cout=200,bing=1,job=0},--//
-- { type=0,id=132,cout=1,bing=1,job=0},--//
-- { type=0,id=133,cout=1,bing=1,job=0},--//
-- { type=0,id=134,cout=1,bing=1,job=0},--//
-- { type=0,id=135,cout=1,bing=1,job=0},--//
-- { type=0,id=136,cout=2,bing=1,job=0},--//
-- { type=0,id=137,cout=2,bing=1,job=0},--//
-- { type=0,id=138,cout=2,bing=1,job=0},--//
-- { type=0,id=139,cout=1,bing=1,job=0},--//
-- { type=0,id=140,cout=1,bing=1,job=0},--//
-- { type=0,id=509,cout=200,bing=1,job=0},--//
-- { type=0,id=544,cout=200,bing=1,job=0},--//
-- { type=0,id=4746,cout=200,bing=1,job=0},--//
-- { type=0,id=486,cout=200,bing=1,job=0},--//
-- { type=0,id=820,cout=200,bing=1,job=0},--//
-- { type=0,id=315,cout=1,bing=1,job=0},--//
-- { type=0,id=381,cout=1,bing=1,job=0},--//
-- { type=0,id=384,cout=1,bing=1,job=0},--//
-- { type=0,id=387,cout=1,bing=1,job=0},--//
-- { type=0,id=390,cout=1,bing=1,job=0},--//



		},
},



{
		item_id = 5898, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- {type=0,id=5682,cout=1,bing=1,job=0},
-- {type=0,id=5683,cout=1,bing=1,job=0},
-- {type=0,id=5684,cout=1,bing=1,job=0},
-- {type=0,id=5685,cout=1,bing=1,job=0},
-- {type=0,id=5686,cout=1,bing=1,job=0},
-- {type=0,id=5687,cout=1,bing=1,job=0},
-- {type=0,id=5688,cout=1,bing=1,job=0},
-- {type=0,id=5689,cout=1,bing=1,job=0},
-- {type=0,id=5690,cout=1,bing=1,job=0},
-- {type=0,id=5691,cout=1,bing=1,job=0},
-- {type=0,id=5692,cout=1,bing=1,job=0},
-- {type=0,id=5693,cout=1,bing=1,job=0},
-- {type=0,id=5694,cout=1,bing=1,job=0},
-- {type=0,id=5695,cout=1,bing=1,job=0},
-- {type=0,id=5696,cout=1,bing=1,job=0},
-- {type=0,id=5697,cout=1,bing=1,job=0},
-- {type=0,id=5698,cout=1,bing=1,job=0},
-- {type=0,id=5699,cout=1,bing=1,job=0},
-- {type=0,id=5700,cout=1,bing=1,job=0},
-- {type=0,id=5701,cout=1,bing=1,job=0},
-- {type=0,id=5702,cout=1,bing=1,job=0},
-- {type=0,id=5703,cout=1,bing=1,job=0},
-- {type=0,id=5704,cout=1,bing=1,job=0},
-- {type=0,id=5705,cout=1,bing=1,job=0},
-- {type=0,id=5706,cout=1,bing=1,job=0},
-- {type=0,id=5707,cout=1,bing=1,job=0},
-- {type=0,id=5708,cout=1,bing=1,job=0},
-- {type=0,id=5709,cout=1,bing=1,job=0},
-- {type=0,id=5710,cout=1,bing=1,job=0},
-- {type=0,id=5711,cout=1,bing=1,job=0},
-- {type=0,id=5712,cout=1,bing=1,job=0},
-- {type=0,id=5713,cout=1,bing=1,job=0},
-- {type=0,id=5714,cout=1,bing=1,job=0},
-- {type=0,id=5715,cout=1,bing=1,job=0},
-- {type=0,id=5716,cout=1,bing=1,job=0},
-- {type=0,id=5717,cout=1,bing=1,job=0},
-- {type=0,id=5718,cout=1,bing=1,job=0},
-- {type=0,id=5719,cout=1,bing=1,job=0},
-- {type=0,id=5720,cout=1,bing=1,job=0},
-- {type=0,id=5721,cout=1,bing=1,job=0},
-- {type=0,id=5722,cout=1,bing=1,job=0},
-- {type=0,id=5723,cout=1,bing=1,job=0},
-- {type=0,id=5724,cout=1,bing=1,job=0},
-- {type=0,id=5725,cout=1,bing=1,job=0},
-- {type=0,id=5726,cout=1,bing=1,job=0},




		},
},


{
		item_id = 5899, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- {type=0,id=5754,cout=1,bing=1,job=0},
-- {type=0,id=5755,cout=1,bing=1,job=0},
-- {type=0,id=5756,cout=1,bing=1,job=0},
-- {type=0,id=5757,cout=1,bing=1,job=0},
-- {type=0,id=5758,cout=1,bing=1,job=0},
-- {type=0,id=5759,cout=1,bing=1,job=0},
-- {type=0,id=5760,cout=1,bing=1,job=0},
-- {type=0,id=5761,cout=1,bing=1,job=0},
-- {type=0,id=5762,cout=1,bing=1,job=0},
-- {type=0,id=5763,cout=1,bing=1,job=0},
-- {type=0,id=5764,cout=1,bing=1,job=0},
-- {type=0,id=5765,cout=1,bing=1,job=0},
-- {type=0,id=5766,cout=1,bing=1,job=0},
-- {type=0,id=5767,cout=1,bing=1,job=0},
-- {type=0,id=5768,cout=1,bing=1,job=0},
-- {type=0,id=5769,cout=1,bing=1,job=0},
-- {type=0,id=5770,cout=1,bing=1,job=0},
-- {type=0,id=5771,cout=1,bing=1,job=0},
-- {type=0,id=5772,cout=1,bing=1,job=0},
-- {type=0,id=5773,cout=1,bing=1,job=0},
-- {type=0,id=5774,cout=1,bing=1,job=0},
-- {type=0,id=5775,cout=1,bing=1,job=0},
-- {type=0,id=5776,cout=1,bing=1,job=0},
-- {type=0,id=5777,cout=1,bing=1,job=0},
-- {type=0,id=5778,cout=1,bing=1,job=0},
-- {type=0,id=5779,cout=1,bing=1,job=0},
-- {type=0,id=5780,cout=1,bing=1,job=0},
-- {type=0,id=5781,cout=1,bing=1,job=0},
-- {type=0,id=5782,cout=1,bing=1,job=0},
-- {type=0,id=5783,cout=1,bing=1,job=0},
-- {type=0,id=5784,cout=1,bing=1,job=0},
-- {type=0,id=5785,cout=1,bing=1,job=0},
-- {type=0,id=5786,cout=1,bing=1,job=0},
-- {type=0,id=5787,cout=1,bing=1,job=0},
-- {type=0,id=5788,cout=1,bing=1,job=0},
-- {type=0,id=5789,cout=1,bing=1,job=0},
-- {type=0,id=5790,cout=1,bing=1,job=0},
-- {type=0,id=5791,cout=1,bing=1,job=0},
-- {type=0,id=5792,cout=1,bing=1,job=0},
-- {type=0,id=5793,cout=1,bing=1,job=0},
-- {type=0,id=5794,cout=1,bing=1,job=0},
-- {type=0,id=5795,cout=1,bing=1,job=0},
-- {type=0,id=5796,cout=1,bing=1,job=0},
-- {type=0,id=5797,cout=1,bing=1,job=0},
-- {type=0,id=5798,cout=1,bing=1,job=0},






		},
},


{
		item_id = 5900, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- {type=0,id=5826,cout=1,bing=1,job=0},
-- {type=0,id=5827,cout=1,bing=1,job=0},
-- {type=0,id=5828,cout=1,bing=1,job=0},
-- {type=0,id=5829,cout=1,bing=1,job=0},
-- {type=0,id=5830,cout=1,bing=1,job=0},
-- {type=0,id=5831,cout=1,bing=1,job=0},
-- {type=0,id=5832,cout=1,bing=1,job=0},
-- {type=0,id=5833,cout=1,bing=1,job=0},
-- {type=0,id=5834,cout=1,bing=1,job=0},
-- {type=0,id=5835,cout=1,bing=1,job=0},
-- {type=0,id=5836,cout=1,bing=1,job=0},
-- {type=0,id=5837,cout=1,bing=1,job=0},
-- {type=0,id=5838,cout=1,bing=1,job=0},
-- {type=0,id=5839,cout=1,bing=1,job=0},
-- {type=0,id=5840,cout=1,bing=1,job=0},
-- {type=0,id=5841,cout=1,bing=1,job=0},
-- {type=0,id=5842,cout=1,bing=1,job=0},
-- {type=0,id=5843,cout=1,bing=1,job=0},
-- {type=0,id=5844,cout=1,bing=1,job=0},
-- {type=0,id=5845,cout=1,bing=1,job=0},
-- {type=0,id=5846,cout=1,bing=1,job=0},
-- {type=0,id=5847,cout=1,bing=1,job=0},
-- {type=0,id=5848,cout=1,bing=1,job=0},
-- {type=0,id=5849,cout=1,bing=1,job=0},
-- {type=0,id=5850,cout=1,bing=1,job=0},
-- {type=0,id=5851,cout=1,bing=1,job=0},
-- {type=0,id=5852,cout=1,bing=1,job=0},
-- {type=0,id=5853,cout=1,bing=1,job=0},
-- {type=0,id=5854,cout=1,bing=1,job=0},
-- {type=0,id=5855,cout=1,bing=1,job=0},
-- {type=0,id=5856,cout=1,bing=1,job=0},
-- {type=0,id=5857,cout=1,bing=1,job=0},
-- {type=0,id=5858,cout=1,bing=1,job=0},
-- {type=0,id=5859,cout=1,bing=1,job=0},
-- {type=0,id=5860,cout=1,bing=1,job=0},
-- {type=0,id=5861,cout=1,bing=1,job=0},
-- {type=0,id=5862,cout=1,bing=1,job=0},
-- {type=0,id=5863,cout=1,bing=1,job=0},
-- {type=0,id=5864,cout=1,bing=1,job=0},
-- {type=0,id=5865,cout=1,bing=1,job=0},
-- {type=0,id=5866,cout=1,bing=1,job=0},
-- {type=0,id=5867,cout=1,bing=1,job=0},
-- {type=0,id=5868,cout=1,bing=1,job=0},
-- {type=0,id=5869,cout=1,bing=1,job=0},
-- {type=0,id=5870,cout=1,bing=1,job=0},







		},
},


{
		item_id = 5901, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{
-- {type=0,id=5727,cout=1,bing=1,job=0},
-- {type=0,id=5728,cout=1,bing=1,job=0},
-- {type=0,id=5729,cout=1,bing=1,job=0},
-- {type=0,id=5730,cout=1,bing=1,job=0},
-- {type=0,id=5731,cout=1,bing=1,job=0},
-- {type=0,id=5732,cout=1,bing=1,job=0},
-- {type=0,id=5733,cout=1,bing=1,job=0},
-- {type=0,id=5734,cout=1,bing=1,job=0},
-- {type=0,id=5735,cout=1,bing=1,job=0},
-- {type=0,id=5736,cout=1,bing=1,job=0},
-- {type=0,id=5737,cout=1,bing=1,job=0},
-- {type=0,id=5738,cout=1,bing=1,job=0},
-- {type=0,id=5739,cout=1,bing=1,job=0},
-- {type=0,id=5740,cout=1,bing=1,job=0},
-- {type=0,id=5741,cout=1,bing=1,job=0},
-- {type=0,id=5742,cout=1,bing=1,job=0},
-- {type=0,id=5743,cout=1,bing=1,job=0},
-- {type=0,id=5744,cout=1,bing=1,job=0},
-- {type=0,id=5745,cout=1,bing=1,job=0},
-- {type=0,id=5746,cout=1,bing=1,job=0},
-- {type=0,id=5747,cout=1,bing=1,job=0},
-- {type=0,id=5748,cout=1,bing=1,job=0},
-- {type=0,id=5749,cout=1,bing=1,job=0},
-- {type=0,id=5750,cout=1,bing=1,job=0},
-- {type=0,id=5751,cout=1,bing=1,job=0},
-- {type=0,id=5752,cout=1,bing=1,job=0},
-- {type=0,id=5753,cout=1,bing=1,job=0},








		},
},


{
		item_id = 5902, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- {type=0,id=5799,cout=1,bing=1,job=0},
-- {type=0,id=5800,cout=1,bing=1,job=0},
-- {type=0,id=5801,cout=1,bing=1,job=0},
-- {type=0,id=5802,cout=1,bing=1,job=0},
-- {type=0,id=5803,cout=1,bing=1,job=0},
-- {type=0,id=5804,cout=1,bing=1,job=0},
-- {type=0,id=5805,cout=1,bing=1,job=0},
-- {type=0,id=5806,cout=1,bing=1,job=0},
-- {type=0,id=5807,cout=1,bing=1,job=0},
-- {type=0,id=5808,cout=1,bing=1,job=0},
-- {type=0,id=5809,cout=1,bing=1,job=0},
-- {type=0,id=5810,cout=1,bing=1,job=0},
-- {type=0,id=5811,cout=1,bing=1,job=0},
-- {type=0,id=5812,cout=1,bing=1,job=0},
-- {type=0,id=5813,cout=1,bing=1,job=0},
-- {type=0,id=5814,cout=1,bing=1,job=0},
-- {type=0,id=5815,cout=1,bing=1,job=0},
-- {type=0,id=5816,cout=1,bing=1,job=0},
-- {type=0,id=5817,cout=1,bing=1,job=0},
-- {type=0,id=5818,cout=1,bing=1,job=0},
-- {type=0,id=5819,cout=1,bing=1,job=0},
-- {type=0,id=5820,cout=1,bing=1,job=0},
-- {type=0,id=5821,cout=1,bing=1,job=0},
-- {type=0,id=5822,cout=1,bing=1,job=0},
-- {type=0,id=5823,cout=1,bing=1,job=0},
-- {type=0,id=5824,cout=1,bing=1,job=0},
-- {type=0,id=5825,cout=1,bing=1,job=0},









		},
},

{
		item_id = 5903, ----
		IsTestItem = false, --是否测试物品
		additem = 
		{

-- {type=0,id=5871,cout=1,bing=1,job=0},
-- {type=0,id=5872,cout=1,bing=1,job=0},
-- {type=0,id=5873,cout=1,bing=1,job=0},
-- {type=0,id=5874,cout=1,bing=1,job=0},
-- {type=0,id=5875,cout=1,bing=1,job=0},
-- {type=0,id=5876,cout=1,bing=1,job=0},
-- {type=0,id=5877,cout=1,bing=1,job=0},
-- {type=0,id=5878,cout=1,bing=1,job=0},
-- {type=0,id=5879,cout=1,bing=1,job=0},
-- {type=0,id=5880,cout=1,bing=1,job=0},
-- {type=0,id=5881,cout=1,bing=1,job=0},
-- {type=0,id=5882,cout=1,bing=1,job=0},
-- {type=0,id=5883,cout=1,bing=1,job=0},
-- {type=0,id=5884,cout=1,bing=1,job=0},
-- {type=0,id=5885,cout=1,bing=1,job=0},
-- {type=0,id=5886,cout=1,bing=1,job=0},
-- {type=0,id=5887,cout=1,bing=1,job=0},
-- {type=0,id=5888,cout=1,bing=1,job=0},
-- {type=0,id=5889,cout=1,bing=1,job=0},
-- {type=0,id=5890,cout=1,bing=1,job=0},
-- {type=0,id=5891,cout=1,bing=1,job=0},
-- {type=0,id=5892,cout=1,bing=1,job=0},
-- {type=0,id=5893,cout=1,bing=1,job=0},
-- {type=0,id=5894,cout=1,bing=1,job=0},
-- {type=0,id=5895,cout=1,bing=1,job=0},
-- {type=0,id=5896,cout=1,bing=1,job=0},
-- {type=0,id=5897,cout=1,bing=1,job=0},



		},
},








	-- {
	-- 	item_id = 636, ----新手礼包
	-- 	IsTestItem = false, --是否测试物品
	-- 	additem = 
	-- 	{
	-- 		{type = 0,id = 507,cout = 1,bind = 1},--
	-- 		{type = 0,id = 560,cout = 1,bind = 1},--
	-- 		{type = 0,id = 498,cout = 1,bind = 1},--
	-- 		{type = 0,id = 503,cout = 1,bind = 1},--
	-- 	},
	-- },
------------
--	{
--		item_id = 819, ----50元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 50,bind = 0},--添加元宝50
--		},
--	},
--	{
--		item_id = 820, ----100元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 100,bind = 0},--添加元宝100
--		},
--	},
--	{
--		item_id = 821, ----200元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 200,bind = 0},--添加元宝200
--		},
--	},
--	{
--		item_id = 822, ----50000元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 50000,bind = 0},--添加元宝50000
--		},
--	},
--	{
--		item_id = 823, ----100000元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 100000,bind = 0},--添加元宝100000
--		},
--	},
--	------以下为测试元宝
--	{
--		item_id = 851, ----10元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 10,bind = 0},--添加元宝10
--		},
--	},
--	{
--		item_id = 852, ----20元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 20,bind = 0},--添加元宝20
--		},
--	},
--	{
--		item_id = 853, ----30元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 30,bind = 0},--添加元宝30
--		},
--	},
--	{
--		item_id = 854, ----50元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 50,bind = 0},--添加元宝50
--		},
--	},
--	{
--		item_id = 855, ----100元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 100,bind = 0},--添加元宝100
--		},
--	},
--	{	
--		item_id = 856, ----200元宝
--		IsTestItem = false, --是否测试物品
--		additem =
--		{
--			{type = 15,id = 0,cout = 200,bind = 0},--添加元宝200
--		},
--	},
--	{
--		item_id = 857, ----500元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 500,bind = 0},--添加元宝500
--		},
--	},
--	{
--		item_id = 858, ----1000元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 1000,bind = 0},--添加元宝1000
--		},
--	},
--	{
--		item_id = 859, ----10000元宝
--		IsTestItem = false, --是否测试物品
--		additem = 
--		{
--			{type = 15,id = 0,cout = 10000,bind = 0},--添加元宝10000
--		},
--	},
};

--宠物属性提升卷
TempAddAttrItem = {
--	{ item_id = 930, value = 1},	--初级提升卷    value = 1 是PetEventCfg.lua 倍数的索引号
--	{ item_id = 931, value = 2},	--中级提升卷
--	{ item_id = 932, value = 3},	--高级提升卷
--	{ item_id = 943, value = 4},	--特级提升卷
};

--随机道具--几率从小到大写
RandRateItem =
{
  
}

--BOSS卷轴
AddBossItem = {
	{
		item_id = 305, --积分BOSS卷(尸王)
		boss = 
		{
			{bossId = 780,rate = 10000,name="尸王",	},--积分尸王
		}
	},
	{
		item_id = 306, --积分BOSS卷(白野猪)
		boss = 
		{
			{bossId = 781,rate = 10000,name="白野猪",	},--积分白野猪
		}
	},	
	{
		item_id = 307, --积分BOSS卷(祖玛教主)
		boss = 
		{
			{bossId = 782,rate = 10000,name="祖玛教主",	},--积分祖玛教主
		}
	},

	{
		item_id = 5125, --初级BOSS卷轴
		mapScope = {x = 90, y = 90, s = 10},	--此坐标内才可召唤
		boss = 
		{
			{bossId = 737,rate = 3333,name="祖玛教主",	},
			{bossId = 738,rate = 3334,name="牛魔王",	},
			{bossId = 739,rate = 3333,name="玛雅教主",	},
		}
	},

	{
		item_id = 5126, --中级BOSS挑战卷
		mapScope = {x = 90, y = 90, s = 10},	--此坐标内才可召唤
		boss = 
		{
			{bossId = 740,rate = 3333,name="魔龙教主",	},
			{bossId = 741,rate = 3334,name="炼狱教主",	},
			{bossId = 742,rate = 3333,name="神龙教主",	},
		}
	},

	{
		item_id = 5127, --高级BOSS挑战卷
		mapScope = {x = 90, y = 90, s = 10},	--此坐标内才可召唤
		boss = 
		{
			{bossId = 743,rate = 4000,name="九尾妖狐",	},
			{bossId = 744,rate = 4000,name="雷炎蜘蛛",	},
			{bossId = 745,rate = 2000,name="雪域魔王",	},
		}
	},

	{
		item_id = 6656, --老兵BOSS召唤卷
		mapScope = {x = 90, y = 90, s = 10},	--此坐标内才可召唤
		boss = 
		{
			{bossId = 1266,rate = 10000,name="回归散人",	},
		}
	},

	{
		item_id = 6127, --初级BOSS卷轴
		mapScope = {x = 36, y = 45, s = 5},	--此坐标内才可召唤
		boss = 
		{
			{bossId = 953,rate = 10000,name="军魂BOSS",	},
		}
	},


};


--合区王城城主礼包
CombinedSbkAward = {
--	{ item_id = 972, Range = {328,345},AwardCount = 1},
};

--各平台职业专属称号
JobHeadTitle = {
	-- { item_id = 995, HeadTitleId = 4 },
	-- { item_id = 992, HeadTitleId = 5 },
	--{ item_id = 989, HeadTitleId = 6 }, --989 已经改为技能书了
	-- { item_id = 996, HeadTitleId = 7 },
	-- { item_id = 993, HeadTitleId = 8 },
	-- { item_id = 990, HeadTitleId = 9 },
	-- { item_id = 997, HeadTitleId = 10},
	-- { item_id = 994, HeadTitleId = 11},
	-- { item_id = 991, HeadTitleId = 12},
};

--荣誉令牌
HonorTokenItem = { item_id = 0, value = 1 };--荣誉值

--行会礼包
GuildGiftUseTable = 
{
	item_id = 0, --加入行会才可使用
	award = 
		{
			{type = 0,id = 509,count = 2,bind=1}, -- 金条(大)
			{type = 0,id = 541,count = 5,bind=1}, -- 精羽毛
			{type = 0,id = 679,count = 2,bind=1}, -- 屠魔令
			{type = 0,id = 505,count = 1,bind=1}, -- 2倍经验卷(5小时)
			{type = 0,id = 678,count = 2,bind=1}, -- 副本传送卷
		},
};


--灵力丹
LingliItemUseTable = 
{
	{ item_id = 6129, lingli = 10 },
	{ item_id = 6130, lingli = 500 },
	{ item_id = 6131, lingli = 2000 },
	{ item_id = 6132, lingli = 10000 },
};

--翅膀魂石宝箱
SwingStoneBoxUseTable = 
{
	item_id = 0,
	
	needYb = 599, -- 开启宝箱需要消耗的元宝
	
	expRand = {500, 3000},  -- 额外给经验，单位：万
	
	itemList = {
		{			
			rand = {0, 20}, -- 概率范围(百分之几)
			itemId = 687, -- 翅膀魂石(攻)
		},
		{			
			rand = {21, 60}, -- 概率范围(百分之几)
			itemId = 688, -- 翅膀魂石(防)
		},
		{			
			rand = {61, 80}, -- 概率范围(百分之几)
			itemId = 689, -- 翅膀魂石(血)
		},
		{			
			rand = {81, 90}, -- 概率范围(百分之几)
			itemId = 520, -- 1000绑定元宝
		},
		{			
			rand = {91, 100}, -- 概率范围(百分之几)
			itemId = 677, -- 超级金币箱
		},
	},
};

--翅膀魂石
SwingStoneUseTable = {
	{ item_id = 493, },
	{ item_id = 494, },
	{ item_id = 495, },
	{ item_id = 496, },
};

DEggItemsUseTable = {
	{
		item_id = 893,
		award = {item_ids = {328,345}, exp = {1000,3000}, bindCoin = {100,300} }, -- exp 和 bindCoin 的单位为：万
	},	
	{
		item_id = 894,
		award = {item_ids = {346,363}, exp = {3000,5000}, bindCoin = {200,500} }, -- exp 和 bindCoin 的单位为：万
	},
	{
		item_id = 895,
		award = {item_ids = {364,381}, exp = {5000,10000}, bindCoin = {500,1000} }, -- exp 和 bindCoin 的单位为：万
	},
};

--疯狂苹果(双蛋和春节活动产出)
CrazyAppleUseTable = {	
	item_id = 0,
};

--月度活动 元宝消耗排行榜排名奖励
YbConsumeRankingUseTable = {
	-- 第 1 名奖励的礼包
	{
		item_id = 0,---第一名
			
		itemList = {
			{			
				rand = {0, 100}, -- 概率范围(万分之几)
				award = {type=0, id=736, count=1, bind=0},--霸者之刃·王者(1%)
			},
			{			
				rand = {101, 200}, -- 概率范围(万分之几)
				award = {type=0, id=762, count=1, bind=0},--王者霸者神甲(男)(1%)
			},
			{			
				rand = {201, 300}, -- 概率范围(万分之几)
				award = {type=0, id=763, count=1, bind=0},--王者霸者神甲(女)(1%)
			},
			{			
				rand = {301, 400}, -- 概率范围(万分之几)
				award = {type=0, id=440, count=1, bind=0},--青铜斗笠(1%)
			},
			{			
				rand = {401, 700}, -- 概率范围(万分之几)
				award = {type=0, id=703, count=1, bind=0},--足迹(来杀我呀)(3%)
			},
			{			
				rand = {701, 1000}, -- 概率范围(万分之几)
				award = {type=0, id=657, count=1, bind=0},--霸者吊坠(战神)(3%)
			},
			{			
				rand = {1001, 1300}, -- 概率范围(万分之几)
				award = {type=0, id=658, count=1, bind=0},--霸者护肩(战神)(3%)
			},
			{			
				rand = {1301, 1600}, -- 概率范围(万分之几)
				award = {type=0, id=659, count=1, bind=0},--霸者面甲(战神)(3%)
			},
			{			
				rand = {1601, 1900}, -- 概率范围(万分之几)
				award = {type=0, id=660, count=1, bind=0},--霸者护膝(战神)(3%)
			},
			{			
				rand = {1901, 3400}, -- 概率范围(万分之几)
				award = {type=0, id=719, count=5, bind=1},--龙纹石(15%)
			},
			{			
				rand = {3401, 5900}, -- 概率范围(万分之几)
				award = {type=0, id=717, count=8, bind=1},--神装石(25%)
			},
			{			
				rand = {5901, 8900}, -- 概率范围(万分之几)
				award = {type=0, id=702, count=1, bind=1},--100万灵力丹(30%)
			},
			{			
				rand = {8901, 10000}, -- 概率范围(万分之几)
				award = {type=0, id=859, count=1, bind=0},--10000元宝(11%)
			},
		},
	},
	-- 第 2 ~ 5 名奖励的礼包
	{
		item_id = 0,--第2-5名
			
		itemList = {
			{			
				rand = {0, 100}, -- 概率范围(万分之几)
				award = {type=0, id=735, count=1, bind=0},--霸者之刃(1%)
			},
			{			
				rand = {101, 200}, -- 概率范围(万分之几)
				award = {type=0, id=760, count=1, bind=0},--霸者神甲男(1%)
			},
			{			
				rand = {201, 300}, -- 概率范围(万分之几)
				award = {type=0, id=761, count=1, bind=0},--霸者神甲女(1%)
			},
			{			
				rand = {301, 600}, -- 概率范围(万分之几)
				award = {type=0, id=703, count=1, bind=0},--足迹来杀我呀(3%)
			},
			{			
				rand = {601, 900}, -- 概率范围(万分之几)--霸者吊坠（雷霆）(3%)
				award = {type=0, id=653, count=1, bind=0},
			},
			{			
				rand = {901, 1200}, -- 概率范围(万分之几)--霸者面甲（雷霆）(3%)
				award = {type=0, id=654, count=1, bind=0},
			},
			{			
				rand = {1201, 1500}, -- 概率范围(万分之几)--霸者护肩（雷霆）(3%)
				award = {type=0, id=655, count=1, bind=0},
			},
			{			
				rand = {1501, 1800}, -- 概率范围(万分之几)--霸者护膝（雷霆）(3%)
				award = {type=0, id=656, count=1, bind=0},
			},
			{			
				rand = {1801, 4500}, -- 概率范围(万分之几)--神装石碎片 (27%)
				award = {type=0, id=716, count=60, bind=1},
			},
			{			
				rand = {4501, 6200}, -- 概率范围(万分之几)--龙纹装石碎片 (17%)
				award = {type=0, id=718, count=40, bind=1},
			},
			{			
				rand = {6201, 8201}, -- 概率范围(万分之几)--50万灵力丹 (20%)
				award = {type=0, id=701, count=1, bind=1},
			},
			{			
				rand = {8201, 10000}, -- 概率范围(万分之几)--3000元宝 (18%)
				award = {type=0, id=858, count=3, bind=1},
			},
		},
	},
	-- 第 6 ~ 20 名奖励的礼包
	{
		item_id = 0,--第6-20名
			
		itemList = {
			{			
				rand = {0, 400}, -- 概率范围(万分之几)
				award = {type=0, id=703, count=1, bind=0},--足迹来杀我呀 (4%)
			},
			{			
				rand = {401, 700}, -- 概率范围(万分之几)--霸者吊坠（雷霆）(3%)
				award = {type=0, id=653, count=1, bind=0},
			},
			{			
				rand = {701, 1000}, -- 概率范围(万分之几)--霸者面甲（雷霆）(3%)
				award = {type=0, id=654, count=1, bind=0},
			},
			{			
				rand = {1001, 1300}, -- 概率范围(万分之几)--霸者护肩（雷霆）(3%)
				award = {type=0, id=655, count=1, bind=0},
			},
			{			
				rand = {1301, 1600}, -- 概率范围(万分之几)--霸者护膝（雷霆）(3%)
				award = {type=0, id=656, count=1, bind=0},
			},
			{			
				rand = {1601, 4300}, -- 概率范围(万分之几)--神装石碎片 (27%)
				award = {type=0, id=716, count=20, bind=1},
			},
			{			
				rand = {4301, 6000}, -- 概率范围(万分之几)--龙纹装石碎片 (17%)
				award = {type=0, id=718, count=10, bind=1},
			},
			{			
				rand = {6001, 8001}, -- 概率范围(万分之几)--20万灵力丹 (20%)
				award = {type=0, id=700, count=1, bind=1},
			},
			{			
				rand = {8001, 10000}, -- 概率范围(万分之几)--1000元宝 (20%)
				award = {type=0, id=858, count=1, bind=1},
			},
		},
	},
};

-- 战将灵力丹
JSLingLiDanUseTable = {
	{item_id = 550, str = "战将灵力", value = 100,logid=2696}, 	-- 战将灵力石
	{item_id = 551, str = "战将灵力", value = 100000,logid=2696}, 	-- 战将灵力丹(小)
	{item_id = 552, str = "战将灵力", value = 1000000,logid=2696},	-- 战将灵力丹(中)
	{item_id = 553, str = "战将灵力", value = 10000000,logid=2696},	-- 战将灵力丹(大)
};

--竞技证书
RankCertificate =
{
    {item_id = 6005,index = 1,}, --青铜段位证书
    {item_id = 6006,index = 2,}, --白银段位证书
    {item_id = 6007,index = 3,}, --黄金段位证书
    {item_id = 6008,index = 4,}, --钻石段位证书
    {item_id = 6009,index = 5,}, --王者段位证书
    {item_id = 6010,index = 6,}, --至尊段位证书
}
--技能书道具
SkillBookTable = 
{
	{highLevelSkill=1 ,addShuLian=1200, item_id = 313,id = 64,lv = 1,openday=0,}, --逐日剑1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 379,id = 64,lv = 2,openday=3,}, --逐日剑2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 382,id = 64,lv = 3,openday=4,}, --逐日剑3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 385,id = 64,lv = 4,openday=5,}, --逐日剑4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 388,id = 64,lv = 5,openday=6,}, --逐日剑5级

   	{highLevelSkill=1 ,addShuLian=1200, item_id = 314,id = 66,lv = 1,openday=0,}, --灭天炎1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 380,id = 66,lv = 2,openday=3,}, --灭天炎2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 383,id = 66,lv = 3,openday=4,}, --灭天炎3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 386,id = 66,lv = 4,openday=5,}, --灭天炎4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 389,id = 66,lv = 5,openday=6,}, --灭天炎5级

    {highLevelSkill=1 ,addShuLian=1200, item_id = 315,id = 67,lv = 1,openday=0,}, --群毒术1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 381,id = 67,lv = 2,openday=3,}, --群毒术2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 384,id = 67,lv = 3,openday=4,}, --群毒术3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 387,id = 67,lv = 4,openday=5,}, --群毒术4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 390,id = 67,lv = 5,openday=6,}, --群毒术5级

    {highLevelSkill=1 ,addShuLian=1200, item_id = 66,id = 155,lv = 1}, --飓风破1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 69,id = 155,lv = 2}, --飓风破2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 72,id = 155,lv = 3}, --飓风破3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 75,id = 155,lv = 4}, --飓风破4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 78,id = 155,lv = 5}, --飓风破5级

    {highLevelSkill=1 ,addShuLian=1200, item_id = 65,id = 156,lv = 1}, --群体雷电术1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 68,id = 156,lv = 2}, --群体雷电术2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 71,id = 156,lv = 3}, --群体雷电术3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 74,id = 156,lv = 4}, --群体雷电术4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 77,id = 156,lv = 5}, --群体雷电术5级

    {highLevelSkill=1 ,addShuLian=1200, item_id = 64,id = 157,lv = 1}, --彻地钉1级
    {highLevelSkill=1 ,addShuLian=2000, item_id = 67,id = 157,lv = 2}, --彻地钉2级
    {highLevelSkill=1 ,addShuLian=2500, item_id = 70,id = 157,lv = 3}, --彻地钉3级
    {highLevelSkill=1 ,addShuLian=3000, item_id = 73,id = 157,lv = 4}, --彻地钉4级
    {highLevelSkill=1 ,addShuLian=3600, item_id = 76,id = 157,lv = 5}, --彻地钉5级



	{highLevelSkill=0 ,addShuLian=500, item_id = 4707,id = 6,lv = 1 }, --烈炎斩1级
    {highLevelSkill=0 ,addShuLian=500, item_id = 4708,id = 63,lv = 1}, --劈地斩
    {highLevelSkill=0 ,addShuLian=500, item_id = 4709,id = 15,lv = 1}, --魔法盾
    {highLevelSkill=0 ,addShuLian=500, item_id = 4710,id = 16,lv = 1}, --冰咆哮
    {highLevelSkill=0 ,addShuLian=500, item_id = 4711,id = 24,lv = 1}, --圣灵战甲术
	{highLevelSkill=0 ,addShuLian=500, item_id = 4712,id = 19,lv = 1}, --施毒术

	{highLevelSkill=0 , addShuLian=500, item_id = 6133,id = 1,lv = 1}, --战神剑法
	{highLevelSkill=0 , addShuLian=500, item_id = 6134,id = 2,lv = 1}, --怒攻剑法
	{highLevelSkill=0 , addShuLian=500, item_id = 6135,id = 3,lv = 1}, --寒冰剑法
	{highLevelSkill=0 , addShuLian=500, item_id = 6136,id = 4,lv = 1}, --圆月剑法
	{highLevelSkill=0 , addShuLian=500, item_id = 6137,id = 5,lv = 1}, --怒吼冲撞

	{highLevelSkill=0 , addShuLian=500, item_id = 6139,id = 8,lv = 1}, --法神威严
	{highLevelSkill=0 , addShuLian=500, item_id = 6138,id = 9,lv = 1}, --天雷术
	{highLevelSkill=0 , addShuLian=500, item_id = 6140,id = 12,lv = 1}, --火墙术
	{highLevelSkill=0 , addShuLian=500, item_id = 6141,id = 14,lv = 1}, --雷光术

	{highLevelSkill=0 , addShuLian=500, item_id = 6142,id = 17,lv = 1}, --治疗术
	{highLevelSkill=0 , addShuLian=500, item_id = 6143,id = 20,lv = 1}, --天灵火符
	{highLevelSkill=0 , addShuLian=500, item_id = 6144,id = 22,lv = 1}, --隐身术


}

--恶魔岭副本(炎龙守卫战副本)弓箭手令牌
EmolingGuarderTokenTable = {
	{item_id = 1776}, -- 神射手护卫令牌
	{item_id = 1777},
	{item_id = 1778},
	{item_id = 1779},
	{item_id = 1780},
}

--没有分类的杂物
MisTable = {
	{item_id = 6012,types=0},--给鸿运称号   --在qfunctions.lua里面写给称号  给鸿运称号
	{item_id = 6021,types=0},--给百元大礼
	{item_id = 6278,types=0},--给51超级会员称号

	{item_id = 6356,types=0},--名人堂唯我独尊
	{item_id = 6357,types=0},--名人堂叱咤风云
	{item_id = 6358,types=0},--名人堂名扬天下

	{item_id = 6361,types=0},--超级幸运星

	{item_id = 6649,types=0},--新春称号

	{item_id = 7156,types=0},--森罗天照
	
	
	{item_id = 7134,types =0 ,isLinShi =1 ,titleId=74,index =6}, --对应TitleHasTime 里面配置限时称号
	{item_id = 7135,types =0 ,isLinShi =1 ,titleId=75,index =7},
	{item_id = 7136,types =0 ,isLinShi =1 ,titleId=76,index =8},
	{item_id = 7137,types =0 ,isLinShi =1 ,titleId=77,index =9},
	{item_id = 7138,types =0 ,isLinShi =1 ,titleId=78,index =10},
	{item_id = 7139,types =0 ,isLinShi =1 ,titleId=79,index =11},
	{item_id = 7140,types =0 ,isLinShi =1 ,titleId=80,index =12},
	{item_id = 7141,types =0 ,isLinShi =1 ,titleId=81,index =13},
		
		
	
	{item_id = 6216,types=1,value =10},--玫瑰花
	{item_id = 6217,types=1,value =90},--玫瑰花
	{item_id = 6218,types=1,value =990},--玫瑰花
	{item_id = 6219,types=1,value =9990},--玫瑰花
	
	{item_id = 6353,types=2,buffId = 352},--内工丹(小)
	{item_id = 6354,types=2,buffId = 353},--内工丹(中)
	{item_id = 6355,types=2,buffId = 354},--内工丹(大)
	
	
	--取概率随机给物品
	{item_id = 6363,types=3,txt ="壕礼宝箱" ,giveAward={
		{award={{type=0,id=538,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=489,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=542,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=552,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=509,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=536,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=570,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=573,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=5947,count=1,bind=1}},rate=10},--时装
		{award={{type=0,id=5948,count=1,bind=1}},rate=10},--时装
		{award={{type=0,id=5949,count=1,bind=1}},rate=10},--时装
		{award={{type=0,id=5950,count=1,bind=1}},rate=10},--时装
		{award={{type=0,id=5657,count=1,bind=1}},rate=10},--幻羽
		{award={{type=0,id=5658,count=1,bind=1}},rate=10},
		{award={{type=0,id=5659,count=1,bind=1}},rate=10},
		{award={{type=0,id=5660,count=1,bind=1}},rate=10},
		{award={{type=0,id=6223,count=1,bind=1}},rate=10},
		{award={{type=0,id=6224,count=1,bind=1}},rate=10},
		{award={{type=0,id=6225,count=1,bind=1}},rate=10},
		{award={{type=0,id=6226,count=1,bind=1}},rate=10},
		{award={{type=0,id=7157,count=1,bind=1}},rate=10},
		{award={{type=0,id=7158,count=1,bind=1}},rate=10},
		{award={{type=0,id=7159,count=1,bind=1}},rate=10},
		{award={{type=0,id=7160,count=1,bind=1}},rate=10},
		{award={{type=0,id=6247,count=1,bind=1}},rate=10},--灵器
		{award={{type=0,id=6248,count=1,bind=1}},rate=10},--灵器
		{award={{type=0,id=6249,count=1,bind=1}},rate=10},--灵器
		{award={{type=0,id=6250,count=1,bind=1}},rate=10},--灵器



	},},

--取概率随机给物品
	{item_id = 6653,types=3,txt ="新春爆竹" ,giveAward={
		{award={{type=0,id=538,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=489,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=542,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=552,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=509,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=536,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=570,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=573,count=1,bind=1}},rate=4},--材料
		{award={{type=0,id=6403,count=5,bind=1}},rate=10},--五行石
		{award={{type=0,id=6271,count=5,bind=1}},rate=10},--五彩石
		{award={{type=0,id=5661,count=5,bind=1}},rate=10},--幻羽精华
		{award={{type=0,id=5947,count=1,bind=1}},rate=20},--时装
		{award={{type=0,id=5948,count=1,bind=1}},rate=20},--时装
		{award={{type=0,id=5949,count=1,bind=1}},rate=20},--时装
		{award={{type=0,id=5950,count=1,bind=1}},rate=20},--时装
		{award={{type=0,id=5657,count=1,bind=1}},rate=20},--幻羽
		{award={{type=0,id=5658,count=1,bind=1}},rate=20},
		{award={{type=0,id=5659,count=1,bind=1}},rate=20},
		{award={{type=0,id=5660,count=1,bind=1}},rate=20},
		{award={{type=0,id=6223,count=1,bind=1}},rate=20},
		{award={{type=0,id=6224,count=1,bind=1}},rate=20},
		{award={{type=0,id=6225,count=1,bind=1}},rate=20},
		{award={{type=0,id=6226,count=1,bind=1}},rate=20},
		{award={{type=0,id=6247,count=1,bind=1}},rate=20},--灵器
		{award={{type=0,id=6248,count=1,bind=1}},rate=20},--灵器
		{award={{type=0,id=6249,count=1,bind=1}},rate=20},--灵器
		{award={{type=0,id=6250,count=1,bind=1}},rate=20},--灵器



	},},



-- {item_id = 6690,types=3,txt ="时装碎片礼盒" ,giveAward={
-- 		{award={{type=0,id=6686,count=10,bind=0}},rate=5},--材料
-- 		{award={{type=0,id=6687,count=10,bind=0}},rate=4},--材料
-- 		{award={{type=0,id=6688,count=10,bind=0}},rate=3},--材料
-- 		{award={{type=0,id=6689,count=10,bind=0}},rate=2},--材料



-- 	},},

{item_id = 6714,types=3,txt ="十一转装备箱" ,giveAward={
				{award={
			{type=0,id=149,count=1,job=1,bind=0},
			{type=0,id=158,count=1,job=2,bind=0},
			{type=0,id=167,count=1,job=3,bind=0},
			},rate=5},--靴子

		{award={
			{type=0,id=141,count=1,job=1,bind=0},
			{type=0,id=150,count=1,job=2,bind=0},
			{type=0,id=159,count=1,job=3,bind=0},
			},rate=60},--武器

		{award={
			{type=0,id=142,count=1,job=1,sex=0,bind=0},
			{type=0,id=143,count=1,job=1,sex=1,bind=0},
			{type=0,id=151,count=1,job=2,sex=0,bind=0},
			{type=0,id=152,count=1,job=2,sex=1,bind=0},
			{type=0,id=160,count=1,job=3,sex=0,bind=0},
			{type=0,id=161,count=1,job=3,sex=1,bind=0},
		
			},rate=40},--衣服

		{award={
			{type=0,id=144,count=1,job=1,bind=0},
			{type=0,id=153,count=1,job=2,bind=0},
			{type=0,id=162,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=145,count=1,job=1,bind=0},
			{type=0,id=154,count=1,job=2,bind=0},
			{type=0,id=163,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=146,count=1,job=1,bind=0},
			{type=0,id=155,count=1,job=2,bind=0},
			{type=0,id=164,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=147,count=1,job=1,bind=0},
			{type=0,id=156,count=1,job=2,bind=0},
			{type=0,id=165,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=148,count=1,job=1,bind=0},
			{type=0,id=157,count=1,job=2,bind=0},
			{type=0,id=166,count=1,job=3,bind=0},
			},rate=5},--腰带



	},},


	{item_id = 6364,types=3,txt ="九转装备箱" ,giveAward={
				{award={
			{type=0,id=122,count=1,job=1,bind=0},
			{type=0,id=131,count=1,job=2,bind=0},
			{type=0,id=140,count=1,job=3,bind=0},
			},rate=5},--靴子

		{award={
			{type=0,id=114,count=1,job=1,bind=0},
			{type=0,id=123,count=1,job=2,bind=0},
			{type=0,id=132,count=1,job=3,bind=0},
			},rate=60},--武器

		{award={
			{type=0,id=115,count=1,job=1,sex=0,bind=0},
			{type=0,id=116,count=1,job=1,sex=1,bind=0},
			{type=0,id=124,count=1,job=2,sex=0,bind=0},
			{type=0,id=125,count=1,job=2,sex=1,bind=0},
			{type=0,id=133,count=1,job=3,sex=0,bind=0},
			{type=0,id=134,count=1,job=3,sex=1,bind=0},
		
			},rate=40},--衣服

		{award={
			{type=0,id=117,count=1,job=1,bind=0},
			{type=0,id=126,count=1,job=2,bind=0},
			{type=0,id=135,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=118,count=1,job=1,bind=0},
			{type=0,id=127,count=1,job=2,bind=0},
			{type=0,id=136,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=119,count=1,job=1,bind=0},
			{type=0,id=128,count=1,job=2,bind=0},
			{type=0,id=137,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=120,count=1,job=1,bind=0},
			{type=0,id=129,count=1,job=2,bind=0},
			{type=0,id=138,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=121,count=1,job=1,bind=0},
			{type=0,id=130,count=1,job=2,bind=0},
			{type=0,id=139,count=1,job=3,bind=0},
			},rate=5},--腰带



	},},

	{item_id = 6365,types=3,txt ="七转装备箱" ,giveAward={
		{award={
			{type=0,id=95,count=1,job=1,bind=0},
			{type=0,id=104,count=1,job=2,bind=0},
			{type=0,id=113,count=1,job=3,bind=0},
			},rate=5},--靴子

		{award={
			{type=0,id=87,count=1,job=1,bind=0},
			{type=0,id=96,count=1,job=2,bind=0},
			{type=0,id=105,count=1,job=3,bind=0},
			},rate=50},--武器

		{award={
			{type=0,id=88,count=1,job=1,sex=0,bind=0},
			{type=0,id=89,count=1,job=1,sex=1,bind=0},
			{type=0,id=97,count=1,job=2,sex=0,bind=0},
			{type=0,id=98,count=1,job=2,sex=1,bind=0},
			{type=0,id=106,count=1,job=3,sex=0,bind=0},
			{type=0,id=107,count=1,job=3,sex=1,bind=0},
		
			},rate=30},--衣服

		{award={
			{type=0,id=90,count=1,job=1,bind=0},
			{type=0,id=99,count=1,job=2,bind=0},
			{type=0,id=108,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=91,count=1,job=1,bind=0},
			{type=0,id=100,count=1,job=2,bind=0},
			{type=0,id=109,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=92,count=1,job=1,bind=0},
			{type=0,id=101,count=1,job=2,bind=0},
			{type=0,id=110,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=93,count=1,job=1,bind=0},
			{type=0,id=102,count=1,job=2,bind=0},
			{type=0,id=111,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=94,count=1,job=1,bind=0},
			{type=0,id=103,count=1,job=2,bind=0},
			{type=0,id=112,count=1,job=3,bind=0},
			},rate=5},--腰带

		

	},},

	{item_id = 6366,types=3,txt ="六转装备箱" ,giveAward={
		{award={
			{type=0,id=4680,count=1,job=1,bind=0},
			{type=0,id=4689,count=1,job=2,bind=0},
			{type=0,id=4698,count=1,job=3,bind=0},
			},rate=5},--靴子
		{award={
			{type=0,id=4672,count=1,job=1,bind=0},
			{type=0,id=4681,count=1,job=2,bind=0},
			{type=0,id=4690,count=1,job=3,bind=0},
			},rate=30},--武器

		{award={
			{type=0,id=4673,count=1,job=1,sex=0,bind=0},
			{type=0,id=4674,count=1,job=1,sex=1,bind=0},
			{type=0,id=4682,count=1,job=2,sex=0,bind=0},
			{type=0,id=4683,count=1,job=2,sex=1,bind=0},
			{type=0,id=4691,count=1,job=3,sex=0,bind=0},
			{type=0,id=4692,count=1,job=3,sex=1,bind=0},
		
			},rate=15},--衣服

		{award={
			{type=0,id=4675,count=1,job=1,bind=0},
			{type=0,id=4684,count=1,job=2,bind=0},
			{type=0,id=4693,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=4676,count=1,job=1,bind=0},
			{type=0,id=4685,count=1,job=2,bind=0},
			{type=0,id=4694,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=4677,count=1,job=1,bind=0},
			{type=0,id=4686,count=1,job=2,bind=0},
			{type=0,id=4695,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=4678,count=1,job=1,bind=0},
			{type=0,id=4687,count=1,job=2,bind=0},
			{type=0,id=4696,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=4679,count=1,job=1,bind=0},
			{type=0,id=4688,count=1,job=2,bind=0},
			{type=0,id=4697,count=1,job=3,bind=0},
			},rate=5},--腰带



	},},

	{item_id = 6367,types=3,txt ="五转装备箱" ,giveAward={
		{award={
			{type=0,id=4653,count=1,job=1,bind=0},
			{type=0,id=4662,count=1,job=2,bind=0},
			{type=0,id=4671,count=1,job=3,bind=0},
			},rate=5},--靴子
		{award={
			{type=0,id=4645,count=1,job=1,bind=0},
			{type=0,id=4654,count=1,job=2,bind=0},
			{type=0,id=4663,count=1,job=3,bind=0},
			},rate=30},--武器

		{award={
			{type=0,id=4646,count=1,job=1,sex=0,bind=0},
			{type=0,id=4647,count=1,job=1,sex=1,bind=0},
			{type=0,id=4655,count=1,job=2,sex=0,bind=0},
			{type=0,id=4656,count=1,job=2,sex=1,bind=0},
			{type=0,id=4664,count=1,job=3,sex=0,bind=0},
			{type=0,id=4665,count=1,job=3,sex=1,bind=0},
		
			},rate=15},--衣服
		{award={
			{type=0,id=4648,count=1,job=1,bind=0},
			{type=0,id=4657,count=1,job=2,bind=0},
			{type=0,id=4666,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=4649,count=1,job=1,bind=0},
			{type=0,id=4658,count=1,job=2,bind=0},
			{type=0,id=4667,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=4650,count=1,job=1,bind=0},
			{type=0,id=4659,count=1,job=2,bind=0},
			{type=0,id=4668,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=4651,count=1,job=1,bind=0},
			{type=0,id=4660,count=1,job=2,bind=0},
			{type=0,id=4669,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=4652,count=1,job=1,bind=0},
			{type=0,id=4661,count=1,job=2,bind=0},
			{type=0,id=4670,count=1,job=3,bind=0},
			},rate=5},--腰带

		

	},},

	{item_id = 6820,types=3,txt ="龍装Ⅱ装备箱" ,giveAward={
		{award={
			{type=0,id=5977,count=1,job=1,bind=0},
			{type=0,id=5977,count=1,job=2,bind=0},
			{type=0,id=5977,count=1,job=3,bind=0},
			},rate=5},--靴子
		{award={
			{type=0,id=5969,count=1,job=1,bind=0},
			{type=0,id=5969,count=1,job=2,bind=0},
			{type=0,id=5969,count=1,job=3,bind=0},
			},rate=30},--武器

		{award={
			{type=0,id=5970,count=1,job=1,sex=0,bind=0},
			{type=0,id=5971,count=1,job=1,sex=1,bind=0},
			{type=0,id=5970,count=1,job=2,sex=0,bind=0},
			{type=0,id=5971,count=1,job=2,sex=1,bind=0},
			{type=0,id=5970,count=1,job=3,sex=0,bind=0},
			{type=0,id=5971,count=1,job=3,sex=1,bind=0},
		
			},rate=15},--衣服
		{award={
			{type=0,id=5972,count=1,job=1,bind=0},
			{type=0,id=5972,count=1,job=2,bind=0},
			{type=0,id=5972,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=5973,count=1,job=1,bind=0},
			{type=0,id=5973,count=1,job=2,bind=0},
			{type=0,id=5973,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=5974,count=1,job=1,bind=0},
			{type=0,id=5974,count=1,job=2,bind=0},
			{type=0,id=5974,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=5975,count=1,job=1,bind=0},
			{type=0,id=5975,count=1,job=2,bind=0},
			{type=0,id=5975,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=5976,count=1,job=1,bind=0},
			{type=0,id=5976,count=1,job=2,bind=0},
			{type=0,id=5976,count=1,job=3,bind=0},
			},rate=5},--腰带

		

	},},

	{item_id = 6821,types=3,txt ="龍装Ⅲ装备箱" ,giveAward={
		{award={
			{type=0,id=5986,count=1,job=1,bind=0},
			{type=0,id=5986,count=1,job=2,bind=0},
			{type=0,id=5986,count=1,job=3,bind=0},
			},rate=5},--靴子
		{award={
			{type=0,id=5978,count=1,job=1,bind=0},
			{type=0,id=5978,count=1,job=2,bind=0},
			{type=0,id=5978,count=1,job=3,bind=0},
			},rate=30},--武器

		{award={
			{type=0,id=5979,count=1,job=1,sex=0,bind=0},
			{type=0,id=5980,count=1,job=1,sex=1,bind=0},
			{type=0,id=5979,count=1,job=2,sex=0,bind=0},
			{type=0,id=5980,count=1,job=2,sex=1,bind=0},
			{type=0,id=5979,count=1,job=3,sex=0,bind=0},
			{type=0,id=5980,count=1,job=3,sex=1,bind=0},
		
			},rate=15},--衣服
		{award={
			{type=0,id=5981,count=1,job=1,bind=0},
			{type=0,id=5981,count=1,job=2,bind=0},
			{type=0,id=5981,count=1,job=3,bind=0},
			},rate=5},--头盔

		{award={
			{type=0,id=5982,count=1,job=1,bind=0},
			{type=0,id=5982,count=1,job=2,bind=0},
			{type=0,id=5982,count=1,job=3,bind=0},
			},rate=5},--项链

		{award={
			{type=0,id=5983,count=1,job=1,bind=0},
			{type=0,id=5983,count=1,job=2,bind=0},
			{type=0,id=5983,count=1,job=3,bind=0},
			},rate=5},--手镯

		{award={
			{type=0,id=5984,count=1,job=1,bind=0},
			{type=0,id=5984,count=1,job=2,bind=0},
			{type=0,id=5984,count=1,job=3,bind=0},
			},rate=5},--戒指

		{award={
			{type=0,id=5985,count=1,job=1,bind=0},
			{type=0,id=5985,count=1,job=2,bind=0},
			{type=0,id=5985,count=1,job=3,bind=0},
			},rate=5},--腰带

		

	},},

}

--无敌幸运星称号道具
SuperStarTitle = 
{
   -- {item_id = 6361,titleid=67,time=30,} --titleid=称号id time=天
}

--幻形道具
MagicShapeItem =
{
    --lefttime 道具持续时间/ 秒
    --addbuffid  添加的buffid
    --shapeid 模型id
    {item_id = 6918,name="骷髅精灵幻形水晶",lefttime=604800,shapeid = 231,addbuffid={355,356,357,376,377}},
	{item_id = 6919,name="黄泉教主幻形水晶",lefttime=604800,shapeid = 232,addbuffid={358,359,360,378,379}},
	{item_id = 6920,name="杜美莎幻形水晶",lefttime=604800,shapeid = 236,addbuffid={361,362,363,380,381}},
	{item_id = 6921,name="帝王教主幻形水晶",lefttime=604800,shapeid = 233,addbuffid={364,365,366,382,383}},
	{item_id = 6922,name="双斧虎王幻形水晶",lefttime=604800,shapeid = 235,addbuffid={367,368,369,384,385}},
	{item_id = 6923,name="天蓬元帅幻形水晶",lefttime=604800,shapeid = 234,addbuffid={370,371,372,386,387}},
	{item_id = 6924,name="齐天大圣幻形水晶",lefttime=604800,shapeid = 237,addbuffid={373,374,375,388,389}},

	{item_id = 7041,name="雪域巨熊幻形水晶",lefttime=1209600,shapeid = 243,addbuffid={390,391,392,393,394,395}},
	{item_id = 7042,name="烈焰双斧幻形水晶",lefttime=1209600,shapeid = 242,addbuffid={396,397,398,399,400,401}},

	{item_id = 7087,name="龙王幻形水晶",lefttime=1296000,shapeid = 251,addbuffid={408,409,410,411,412,413}},
	{item_id = 7088,name="黑龙幻形水晶",lefttime=1296000,shapeid = 252,addbuffid={414,415,416,417,418,419}},
	{item_id = 7089,name="冰龙幻形水晶",lefttime=1296000,shapeid = 284,addbuffid={420,421,422,423,424,425}},
	{item_id = 7090,name="火龙幻形水晶",lefttime=1296000,shapeid = 254,addbuffid={426,427,428,429,430,431}},
	{item_id = 7091,name="龙骑士幻形水晶",lefttime=1296000,shapeid = 255,addbuffid={432,433,434,435,436,437}},
	{item_id = 7092,name="逍遥幻形水晶",lefttime=1296000,shapeid = 256,addbuffid={438,439,440,441,442,443}},
	{item_id = 7093,name="通天幻形水晶",lefttime=1296000,shapeid = 257,addbuffid={444,445,446,447,448,449}},

}

-- 战灵潜能物品
SpiritFighterEnergyItemTable = 
{
	{item_id = 7061, addExp = 2 },
	{item_id = 7062, addExp = 5 },
	{item_id = 7063, addExp = 10 },
	{item_id = 7064, addExp = 100 },
	{item_id = 7065, addExp = 1000 },
	{item_id = 7066, addExp = 10000 },
}

