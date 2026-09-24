--技能书配置表

SkillBoolConfig = 
{
	-- item_id: 物品id
	-- skill_id: 技能id
	-- skill_Level: 技能的等级
	-- vip_level:至尊vip学习时达到的等级
	-- jop_id:对应的职业id  0 任何职业都可以使用 1战士 2法师 3道士 
	-- needConsume:使用技能书后是否需要删掉这个技能书
	--vipActorLv:到该等级，至尊vip的玩家自动学习该技能
	
-- 屏蔽旧代码，这些物品ID已经不是技能书了
--[[
{item_id = 479,skill_id = 1,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 5, vip_level = 5 },  --基础剑法
{item_id = 480,skill_id = 2,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 20, vip_level = 5 }, --怒杀剑法
{item_id = 481,skill_id = 3,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 25, vip_level = 5 }, --刺影剑法
{item_id = 482,skill_id = 4,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 30, vip_level = 5 }, --莲月剑法
{item_id = 483,skill_id = 5,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 35, vip_level = 5 }, --蛮力冲撞
{item_id = 484,skill_id = 6,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 40, vip_level = 5 }, --逆火剑法
--{item_id = 485,skill_id = 7,skill_Level = 1,jop_id = 1,needConsume = false, vipActorLv = 50, vip_level = 3 }, --战神冲锋

{item_id = 486,skill_id = 8,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 5, vip_level = 5 },  --法神抗拒
{item_id = 487,skill_id = 9,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 10, vip_level = 5 }, --大雷电术
{item_id = 488,skill_id = 10,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 23, vip_level = 5 },--大挪移术
--{item_id = 434,skill_id = 11,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 22, vip_level = 3 },--爆裂火焰
{item_id = 489,skill_id = 12,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 25, vip_level = 5 },--烈焰墙壁
--{item_id = 490,skill_id = 13,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 28, vip_level = 3 },--激电光影
{item_id = 491,skill_id = 14,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 30, vip_level = 5 },--魔狱地雷
{item_id = 492,skill_id = 15,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 35, vip_level = 5 },--法神灵盾
{item_id = 493,skill_id = 16,skill_Level = 1,jop_id = 2,needConsume = false, vipActorLv = 40, vip_level = 5 },--冰雪咆哮



{item_id = 494,skill_id = 17,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 7, vip_level = 5 }, --回春神术
{item_id = 495,skill_id = 20,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 10, vip_level = 5 },--天灵火符
{item_id = 496,skill_id = 19,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 25, vip_level = 5 },--怨灵毒术
{item_id = 497,skill_id = 22,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 30, vip_level = 5 },--大隐身术
{item_id = 498,skill_id = 21,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 35, vip_level = 5 },--大召唤术
--{item_id = 445,skill_id = 22,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 20, vip_level = 3 },--隐身术
--{item_id = 446,skill_id = 23,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 21, vip_level = 3 },--群体隐身术
{item_id = 499,skill_id = 24,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 40, vip_level = 5 },--大护体术
--{item_id = 448,skill_id = 25,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 26, vip_level = 3 },--神圣战甲术
--{item_id = 449,skill_id = 26,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 33, vip_level = 3 },--群体治疗术
--{item_id = 450,skill_id = 27,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 35, vip_level = 3 },--召唤神兽
--{item_id = 500,skill_id = 18,skill_Level = 1,jop_id = 3,needConsume = false, vipActorLv = 50, vip_level = 5 },--无极诅咒
--]]

--------------------------以下为新增加4级技能

{item_id = 976,skill_id = 3,skill_Level = 4,jop_id = 1,needConsume = true},--4级刺杀剑术
{item_id = 977,skill_id = 6,skill_Level = 4,jop_id = 1,needConsume = true},--4级烈火剑法
{item_id = 978,skill_id = 63,skill_Level = 4,jop_id = 1,needConsume = true},--4级开天神斩
{item_id = 979,skill_id = 64,skill_Level = 4,jop_id = 1,needConsume = true},--4级逐日剑法
{item_id = 980,skill_id = 9,skill_Level = 4,jop_id = 2,needConsume = true},--4级雷电术
{item_id = 981,skill_id = 12,skill_Level = 4,jop_id = 2,needConsume = true},--4级火墙
{item_id = 982,skill_id = 15,skill_Level = 4,jop_id = 2,needConsume = true},--4级魔法盾
{item_id = 983,skill_id = 16,skill_Level = 4,jop_id = 2,needConsume = true},--4级冰咆哮
{item_id = 984,skill_id = 65,skill_Level = 4,jop_id = 2,needConsume = true},--4级火龙气焰
{item_id = 985,skill_id = 66,skill_Level = 4,jop_id = 2,needConsume = true},--4级流星火雨
{item_id = 986,skill_id = 19,skill_Level = 4,jop_id = 3,needConsume = true},--4级施毒术）
{item_id = 987,skill_id = 20,skill_Level = 4,jop_id = 3,needConsume = true},--4级灵魂火符
{item_id = 988,skill_id = 67,skill_Level = 4,jop_id = 3,needConsume = true},--4级群体施毒术
{item_id = 989,skill_id = 69,skill_Level = 4,jop_id = 3,needConsume = true},--4级群体火符
{item_id = 1009,skill_id = 71,skill_Level = 4,jop_id = 3,needConsume = true},--4级解毒术
{item_id = 312,skill_id = 21,skill_Level = 1,jop_id = 3,needConsume = true,delskill=170,}, --强化召唤术
--{item_id = 1411,skill_id = 6,skill_Level = 4,jop_id = 1,needConsume = false},--烈焰剑法(4级)
--{item_id = 1412,skill_id = 6,skill_Level = 5,jop_id = 1,needConsume = false},--烈焰剑法(5级)
--{item_id = 1413,skill_id = 4,skill_Level = 4,jop_id = 1,needConsume = false},--弦月剑法(4级)
--{item_id = 1414,skill_id = 5,skill_Level = 4,jop_id = 1,needConsume = false},--战神冲撞(4级)
--{item_id = 1415,skill_id = 8,skill_Level = 4,jop_id = 2,needConsume = false},--法术抗拒(4级)
--{item_id = 1416,skill_id = 12,skill_Level = 4,jop_id = 2,needConsume = false},--火墙术(4级)
--{item_id = 1417,skill_id = 13,skill_Level = 4,jop_id = 2,needConsume = false},--穿透闪电(4级)
--{item_id = 1418,skill_id = 16,skill_Level = 4,jop_id = 2,needConsume = false},--冰风暴(4级)
--{item_id = 1419,skill_id = 16,skill_Level = 5,jop_id = 2,needConsume = false},--冰风暴(5级)
--{item_id = 1420,skill_id = 17,skill_Level = 4,jop_id = 3,needConsume = false},--恢复术(4级)
--{item_id = 1421,skill_id = 20,skill_Level = 4,jop_id = 3,needConsume = false},--符咒术(4级)
--{item_id = 1422,skill_id = 20,skill_Level = 5,jop_id = 3,needConsume = false},--符咒术(5级)
--{item_id = 1423,skill_id = 24,skill_Level = 4,jop_id = 3,needConsume = false},--幽灵护盾术(4级)
--{item_id = 1424,skill_id = 25,skill_Level = 4,jop_id = 3,needConsume = false},--神圣护身术(4级)
--{item_id = 1425,skill_id = 3,skill_Level = 4,jop_id = 1,needConsume = false},--刺杀秘剑(4级)
--{item_id = 1745,skill_id = 159,skill_Level = 1,jop_id = 1,needConsume = false},--战士护盾(1级)
--{item_id = 1746,skill_id = 159,skill_Level = 2,jop_id = 1,needConsume = false},--战士护盾(2级)
--{item_id = 1747,skill_id = 159,skill_Level = 3,jop_id = 1,needConsume = false},--战士护盾(3级)
--{item_id = 1748,skill_id = 160,skill_Level = 1,jop_id = 2,needConsume = false},--鬼火术(1级)
--{item_id = 1749,skill_id = 160,skill_Level = 2,jop_id = 2,needConsume = false},--鬼火术(2级)
--{item_id = 1750,skill_id = 160,skill_Level = 3,jop_id = 2,needConsume = false},--鬼火术(3级)
--{item_id = 1751,skill_id = 161,skill_Level = 1,jop_id = 3,needConsume = false},--诅咒术(1级)
--{item_id = 1752,skill_id = 161,skill_Level = 2,jop_id = 3,needConsume = false},--诅咒术(2级)
--{item_id = 1753,skill_id = 161,skill_Level = 3,jop_id = 3,needConsume = false},--诅咒术(3级)

}










