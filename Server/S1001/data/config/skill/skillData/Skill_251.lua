{
	id = 251,
	name = Lang.Skill.s9Name,
	desc = Lang.Skill.s9Desc,
	-- = 霹雳雷电（大雷电术）,
	isFabaoSkill = true,--不显示在技能面板上
	vocation = 0,  --职业
	isDelete = false, --是否废弃
	skillType = 2, --技能类型
	skillClass = 1,--技能的分类
	skillSpellType = 2,
	commonCd = 300,--使用的时候触发的公共的cd时间，单位是毫秒
	canbeDefault = false, --能否作为默认技能，不填写就是false
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = true,
	needCalPassiveProperty = false,
	priority = 0,
	miaoshu = "升到1级自动学习",
	skillSubLevel = { 
--#include "Skill_251_1.lua"
	},
},