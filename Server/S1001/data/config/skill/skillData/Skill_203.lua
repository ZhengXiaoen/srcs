{
	id = 203,
	name = Lang.Skill.s78Name,
	desc = Lang.Skill.s78Desc,
	-- = 气波功,
	vocation = 0,--使用职业,如果是0，那么就任何职业都能学习 1战士 2法师 3道士
	isDelete = false,--false=使用，true=弃用
	skillType = 2,--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 9,
	skillSpellType = 2,
	commonCd = 500,
	canbeDefault = false,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,--是否支持魔法锁定，默认是false,只有配置了true，魔法锁定才能有效
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
--#include "Skill_203_1.lua"  战将技能
	},
},