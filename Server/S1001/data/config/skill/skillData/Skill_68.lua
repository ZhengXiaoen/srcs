{
	id = 68,
	name = Lang.Skill.s68Name,
	desc = Lang.Skill.s68Desc,
	-- = 万剑归宗战士,
	vocation = 0,
	isDelete = true,
	skillType = 0,
	skillClass = 5,
	skillSpellType = 0,
	commonCd = 500,
	isNoShow = true,
	canbeDefault = false,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,
	needCalPassiveProperty = false,
	priority = 0,
	specialType = 2,    --使用技能限制特殊类型，0：代表无。 1：代表身上需要佩戴那些装备物品   2:是否有下列神器神甲 以后有新特殊类型可以在这添加，在C++那边写对应逻辑
	specialParam = {736,762,763,737,764,765,1217,1221,1222,1219,1223,1224},	--根据不同的特殊类型参数不同，当类型为0时括号内为空。  1：代表物品ID（可多个参数）
	skillSubLevel = { 
--#include "Skill_68_1.lua"
----#include "Skill_68_2.lua"
----#include "Skill_68_3.lua"
	},
},