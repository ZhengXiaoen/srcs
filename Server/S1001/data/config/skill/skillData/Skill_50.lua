{
	id = 50,
	name = Lang.Skill.s50Name,
	desc = Lang.Skill.s50Desc,
	-- = 祖玛教主:召唤小怪
	vocation = 0,
	isDelete = true,
	skillType = 0,	--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 4,	--技能的分类(从系统上做区分的技能的分类),1玩家职业基本技能，2玩家通用技能(所有人都能学),3宠物技能(道士宝宝)，4怪物技能,5必杀技,6,挖矿技能,
					--7，结拜技能，8，开门技能（沙巴克城门）,9 英雄技能 10 赛马技能 ,11 喷泉技能
	skillSpellType = 0,
	commonCd = 0,
	canbeDefault = true,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
--#include "Skill_50_1.lua"----祖玛教主:召唤小怪
--#include "Skill_50_2.lua"----角蝇:喷小怪
--#include "Skill_50_3.lua"----幻影蜘蛛:喷小怪
--#include "Skill_50_4.lua"----海老:召唤小怪
--#include "Skill_50_5.lua"----半岩人:召唤小怪
--#include "Skill_50_6.lua"----青龙:召唤小怪
--#include "Skill_50_7.lua"----初级炮塔:召唤双重
--#include "Skill_50_8.lua"----双重炮塔:召唤四重
--#include "Skill_50_9.lua"----四重炮塔:召唤重型
	},
},