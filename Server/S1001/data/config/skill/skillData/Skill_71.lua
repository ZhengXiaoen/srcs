{
	id = 71,
	name = Lang.Skill.s71Name,
	desc = Lang.Skill.s71Desc,
	-- = 解毒秘术,
	vocation = 3,--使用职业,如果是0，那么就任何职业都能学习 1战士 2法师 3道士
	isDelete = true,--false=使用，true=弃用
	skillType = 2,--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 1,
	skillSpellType = 2,
	commonCd = 500,
	canbeDefault = false,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = true,
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
----#include "Skill_71_1.lua"
----#include "Skill_71_2.lua"
----#include "Skill_71_3.lua" 
----#include "Skill_71_4.lua" 
	},
},