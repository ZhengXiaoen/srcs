{
	id = 65,
	name = Lang.Skill.s65Name,
	desc = Lang.Skill.s65Desc,
	-- = 火龙气焰,
	vocation = 2,  --职业
	isDelete = true,--false=使用，true=弃用
	skillType = 2, --技能类型
	skillClass = 1,--技能的分类
	skillSpellType = 2,
	commonCd = 700,--使用的时候触发的公共的cd时间，单位是毫秒
	canbeDefault = false, --能否作为默认技能，不填写就是false
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = true,
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
----#include "Skill_65_1.lua"
----#include "Skill_65_2.lua"
----#include "Skill_65_3.lua" 
----#include "Skill_65_4.lua"
	},
},