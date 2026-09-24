{
	id = 76,
	name = Lang.Skill.s76Name,
	desc = Lang.Skill.s76Desc,
	-- = 万剑归宗法师,
	vocation = 0,  --职业
	isNoShow = true,
	isDelete = true, --是否废弃
	skillType = 5, --技能类型
	skillClass = 1,--技能的分类
	skillSpellType = 2,
	commonCd = 700,--使用的时候触发的公共的cd时间，单位是毫秒
	canbeDefault = false, --能否作为默认技能，不填写就是false
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = true,
	needCalPassiveProperty = false,
	priority = 0,
	specialType = 2,    --使用技能限制特殊类型，0：代表无。 1：代表身上需要佩戴那些装备物品  2:是否有下列神器神甲  以后有新特殊类型可以在这添加，在C++那边写对应逻辑
	specialParam = {737,764,765,1219,1223,1224},	--根据不同的特殊类型参数不同，当类型为0时括号内为空。  1：代表物品ID（可多个参数）
	skillSubLevel = { 
--#include "Skill_76_1.lua"
----#include "Skill_76_2.lua"
----#include "Skill_76_3.lua" 
	},
},