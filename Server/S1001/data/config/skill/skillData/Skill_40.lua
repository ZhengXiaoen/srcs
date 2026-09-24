{
	id = 40,
	name = Lang.Skill.s40Name,
	desc = Lang.Skill.s40Desc,
	-- = 火墙,
	vocation = 0,
	isDelete = true,
	skillType = 2,	----技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 4,	--技能的分类(从系统上做区分的技能的分类),1玩家职业基本技能，2玩家通用技能(所有人都能学),3宠物技能(道士宝宝)，4怪物技能,5必杀技,6,挖矿技能,
					--7，结拜技能，8，开门技能（沙巴克城门）,9 英雄技能 10 赛马技能 ,11 喷泉技能
	skillSpellType = 0,
	commonCd = 500,
	canbeDefault = true,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
--#include "Skill_40_1.lua"----凤凰火墙
--#include "Skill_40_2.lua"----狂热火蜥蜴:火墙
	},
},