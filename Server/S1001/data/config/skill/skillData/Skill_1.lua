{
	id = 1,
	name = Lang.Skill.s1Name,--技能名称
	desc = Lang.Skill.s1Desc,--技能描述
	--战神剑法 (编号:1  战神剑法)
	vocation = 1,--职业，0通用，1战士，2法师，3道士
	isDelete = false,--是否废弃，如果废弃了用true,否则用false
	skillType = 1,--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 1,--技能的分类(从系统上做区分的技能的分类),1玩家职业基本技能，2玩家通用技能(所有人都能学),3宠物技能(道士宝宝)，4怪物技能,5必杀技,6,挖矿技能,7，结拜技能，8，开门技能（沙巴克城门）,9 英雄技能 10 赛马技能 ,11 喷泉技能
	skillSpellType = 0,
	commonCd = 500,
	canbeDefault = false,--是否作为默认技能
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,
	needCalPassiveProperty = false,
	priority = 0,
	miaoshu = "等级达到1级便自动学习",
	skillSubLevel = { 
--#include "Skill_1_1.lua"
--#include "Skill_1_2.lua"
--#include "Skill_1_3.lua" 
--#include "Skill_1_4.lua" 
--#include "Skill_1_5.lua" 
--#include "Skill_1_6.lua" 
--#include "Skill_1_7.lua" 
--#include "Skill_1_8.lua" 
--#include "Skill_1_9.lua" 
--#include "Skill_1_10.lua" 
	},
},