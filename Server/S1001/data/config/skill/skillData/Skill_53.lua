{
	id = 53,
	name = Lang.Skill.s53Name,
	desc = Lang.Skill.s53Desc,
	-- = 祖玛教主,
	vocation = 0,
	isDelete = true,
	skillType = 0,	--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 4,	--0表示直接释放，如果选择了目标将直接释放
					--1表示点击了技能图标以后，还需要选择一个目标才会释放
					--2表示点击技能图标以后,在鼠标位置释放,(类似法师的火墙术),方向是当前与鼠标的方向
					--3 表示仅对自己使用，这时将忽略选中的目标，上发的坐标是当前面向的1格的坐标,方向上发的面向的方向
					--4 直接释放（类似战士的野蛮冲撞，坐标是当前玩家的坐标，朝向是当前玩家的朝向，目标发个0）
	skillSpellType = 0,
	commonCd = 500,
	canbeDefault = true,
	specialBuffCond = 0,
	notAutoUse = false,
	magicLock = false,
	needCalPassiveProperty = false,
	priority = 0,
	skillSubLevel = { 
--#include "Skill_53_1.lua"----祖玛教主带火身影
--#include "Skill_53_2.lua"----虹魔教主变金身
--#include "Skill_53_3.lua"----牛魔法师半月
	},
},