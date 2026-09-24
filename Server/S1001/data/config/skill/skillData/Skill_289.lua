{
	id = 289,			--技能的ID
	name = Lang.Skill.s289Name,	--技能的名字
	desc = Lang.Skill.s289L1Desc,	--技能介绍
	-- = 物理攻击伤害暴击	
	vocation = 2,			--使用职业,如果是0，那么就任何职业都能学习 1战士 2法师 3道士
	isDelete = false,		--是否废弃，如果废弃了用true,否则用false
	skillType = 0,			--技能的类型(从技能的功能上划分,物理、魔法、毒物主要用于区分命中、闪避),0表示物理攻击,1被动,2魔法攻击,3,毒物攻击,4表示生活技能,5其他特殊技能(比如光环类)
	skillClass = 1,			--技能的分类(从系统上做区分的技能的分类),1玩家职业基本技能，2玩家通用技能(所有人都能学),3宠物技能(道士宝宝)，4怪物技能,5必杀技,6,挖矿技能,7，结拜技能，8，开门技能（沙巴克城门）,9 英雄技能 10 赛马技能 ,11 喷泉技能
	skillSpellType = 0,		--0表示直接释放，如果选择了目标将直接释放
	isAutoLearn = false;
					--1表示点击了技能图标以后，还需要选择一个目标才会释放
					--2表示点击技能图标以后,在鼠标位置释放,(类似法师的火墙术),方向是当前与鼠标的方向
					--3 表示仅对自己使用，这时将忽略选中的目标，上发的坐标是当前面向的1格的坐标,方向上发的面向的方向
					--4 直接释放（类似战士的野蛮冲撞，坐标是当前玩家的坐标，朝向是当前玩家的朝向，目标发个0）
	commonCd = 500,			--使用的时候触发的公共的cd时间，单位是毫秒
	canbeDefault = false,		--能否作为默认技能，不填写就是false
	specialBuffCond = 0,		--技能在特殊的buff的下是否能够使用
					--0表示在封断和晕眩都不能使用，默认是0
					--1表示在封断的时候能够使用
					--2表示在晕眩的时候能够使用
					--3表示在晕眩和封断的时候都能使用
	notAutoUse = false,		--挂机时不自动使用,默认都是false
	magicLock = false,		--是否支持魔法锁定，默认是false,只有配置了true，魔法锁定才能有效
	needCalPassiveProperty = false,	--是否需要计算被动属性，某些主动技能也需要按被动技能计算属性
	priority = 0,			--技能的优先级，优先级高的在同等条件下放
	skillSubLevel = { 		--下面是技能的各等级的信息
--#include "Skill_289_1.lua"
--#include "Skill_289_2.lua"
--#include "Skill_289_3.lua"
--#include "Skill_289_4.lua"
--#include "Skill_289_5.lua"
--#include "Skill_289_6.lua"
--#include "Skill_289_7.lua"
--#include "Skill_289_8.lua"
--#include "Skill_289_9.lua"
--#include "Skill_289_10.lua"



	},
},