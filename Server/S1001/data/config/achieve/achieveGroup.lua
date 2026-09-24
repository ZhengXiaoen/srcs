--玩家的成就的分组的信息  w   w w .  c n 1 2 1. c      o m
--#include "..\..\language\LangCode.txt"

AchieveGroups=
{

--以下由于各组的具体分类不同，请以group为准 
--初入江湖
  {
		id = 0,
		group = 0,
			--表示上一级的分组，比如初级，高级，中级
		name = Lang.AchieveName.groupName0000,
			--分组的名字
		level = 1,
			--开启的等级,5级表示 玩家>=5级就可以使用了
		camp = 0,
			--阵营的限制，如果是0表示没有限制，可以不配置，否则表示特定的阵营可以开启 1,无忌,2,逍遥3日月
		sex = -1,
			--默认为-1表示所有的性别都开启，否则0表示男性，1表示女性开启
		job = 0,
			--表示职业，否则表示哪个职业可以开启 2,华山,4水月,7御神,8影煞
		isDelete = false,
			--表示该成就分组是否显示于前端。默认为false（显示），true为不显示。
  },

--累计登陆
  {
		id = 1,
		group = 1,
		name = Lang.AchieveName.groupName0001,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

--角色成长
  {
		id = 2,
		group = 2,
		name = Lang.AchieveName.groupName0002,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

--降妖除魔
  {
		id = 3,
		group = 3,
		name = Lang.AchieveName.groupName0003,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

--击杀首领
  {
		id = 4,
		group = 4,
		name = Lang.AchieveName.groupName0004,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

--护符进阶
  {
		id = 5,
		group = 5,
		name = Lang.AchieveName.groupName0005,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },
 
--护盾进阶
  {
		id = 6,
		group = 6,
		name = Lang.AchieveName.groupName0006,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

--军印进阶
  {
		id = 7,
		group = 7,
		name = Lang.AchieveName.groupName0007,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },
  --宝石进阶
  {
		id = 8,
		group = 8,
		name = Lang.AchieveName.groupName0008,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },
  --圣珠进阶
  {
		id = 9,
		group = 9,
		name = Lang.AchieveName.groupName0009,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },
  --翅膀进阶
  {
		id = 10,
		group = 10,
		name = Lang.AchieveName.groupName0010,
		level = 1,
		camp = 0,
		sex = -1,
		job = 0,
		isDelete = false,
  },

}