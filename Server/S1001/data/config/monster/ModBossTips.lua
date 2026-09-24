-- 注意：只有 StdMonster.lua 中 monsterType = 4 的怪物才能配置在这里，其他怪物品类型，C++ 的 CModMonsterProvider 会过滤掉的

--BOSS挑战 - 野外BOSS 配置 , 配置表格: 其他杂项配置.xls // 2017/1/6 zer


ModBossConfig = {
---------------------------------------------------

	{type = 1,BossId = 433,BossName = '变异骷髅王[十阶]',SceneId=0,SceneName = '变异洞窟',Time = 1800,FirstRefTime = 3,level = 65,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 2,BossId = 443,BossName = '铁链僵尸皇[十阶]',SceneId=0,SceneName = '幽冥矿区',Time = 1800,FirstRefTime = 3,level = 70,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 3,BossId = 453,BossName = '暗之钳虫皇[十阶]',SceneId=0,SceneName = '死亡棺材',Time = 1800,FirstRefTime = 3,level = 72,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 4,BossId = 463,BossName = '异教教皇[十阶]',SceneId=0,SceneName = '异教宫殿',Time = 1800,FirstRefTime = 3,level = 74,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 5,BossId = 473,BossName = '虚空大帝[十阶]',SceneId=0,SceneName = '虚空古墓',Time = 1800,FirstRefTime = 3,level = 76,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 6,BossId = 483,BossName = '破碎教皇[十阶]',SceneId=0,SceneName = '破碎寺庙',Time = 1800,FirstRefTime = 3,level = 78,circle=0,viplevel=0,fastBtnState=1,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 7,BossId = 636,BossName = '蛮荒荒主',SceneId=0,SceneName = '散人殿堂8层',Time = 1800,FirstRefTime = 3,level = 80,circle=0,viplevel=0,fastBtnState=3,award = {},

		drop=
		{	
			{--战士
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
			{--法师
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},									        
			{--道士								           
				{ type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 0},--十方刃
				{ type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(男)
				{ type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 0},--十方甲(女)
				{ type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 0},--十方盔
				{ type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 0},--十方链
				{ type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 0},--十方镯
				{ type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 0},--十方戒
				{ type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 0},--十方带
				{ type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 0},--十方靴
			},
		},	
	},

	{type = 8,BossId = 637,BossName = '迷失圣王[1转]',SceneId=0,SceneName = '散人殿堂9层',Time = 3600,FirstRefTime = 3,level = 80,circle=0,viplevel=0,fastBtnState=3,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 430, count = 1, strong = 0,quality = 0, bind = 0},--霸主血剑
{ type = 0, id = 431, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(男)
{ type = 0, id = 432, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(女)
{ type = 0, id = 433, count = 1, strong = 0,quality = 0, bind = 0},--霸主血盔
{ type = 0, id = 434, count = 1, strong = 0,quality = 0, bind = 0},--霸主血链
{ type = 0, id = 435, count = 1, strong = 0,quality = 0, bind = 0},--霸主血镯
{ type = 0, id = 436, count = 1, strong = 0,quality = 0, bind = 0},--霸主血戒
{ type = 0, id = 437, count = 1, strong = 0,quality = 0, bind = 0},--霸主血带
{ type = 0, id = 438, count = 1, strong = 0,quality = 0, bind = 0},--霸主血靴

			},
			{--法师
{ type = 0, id = 430, count = 1, strong = 0,quality = 0, bind = 0},--霸主血剑
{ type = 0, id = 431, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(男)
{ type = 0, id = 432, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(女)
{ type = 0, id = 433, count = 1, strong = 0,quality = 0, bind = 0},--霸主血盔
{ type = 0, id = 434, count = 1, strong = 0,quality = 0, bind = 0},--霸主血链
{ type = 0, id = 435, count = 1, strong = 0,quality = 0, bind = 0},--霸主血镯
{ type = 0, id = 436, count = 1, strong = 0,quality = 0, bind = 0},--霸主血戒
{ type = 0, id = 437, count = 1, strong = 0,quality = 0, bind = 0},--霸主血带
{ type = 0, id = 438, count = 1, strong = 0,quality = 0, bind = 0},--霸主血靴

			},									        
			{--道士								           
{ type = 0, id = 430, count = 1, strong = 0,quality = 0, bind = 0},--霸主血剑
{ type = 0, id = 431, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(男)
{ type = 0, id = 432, count = 1, strong = 0,quality = 0, bind = 0},--霸主血甲(女)
{ type = 0, id = 433, count = 1, strong = 0,quality = 0, bind = 0},--霸主血盔
{ type = 0, id = 434, count = 1, strong = 0,quality = 0, bind = 0},--霸主血链
{ type = 0, id = 435, count = 1, strong = 0,quality = 0, bind = 0},--霸主血镯
{ type = 0, id = 436, count = 1, strong = 0,quality = 0, bind = 0},--霸主血戒
{ type = 0, id = 437, count = 1, strong = 0,quality = 0, bind = 0},--霸主血带
{ type = 0, id = 438, count = 1, strong = 0,quality = 0, bind = 0},--霸主血靴

			},
		},	
	},

	{type = 9,BossId = 638,BossName = '赤月魔王[2转]',SceneId=0,SceneName = '散人殿堂10层',Time = 3600,FirstRefTime = 3,level = 90,circle=0,viplevel=0,fastBtnState=3,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 439, count = 1, strong = 0,quality = 0, bind = 0},--通天神棍
{ type = 0, id = 440, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(男)
{ type = 0, id = 441, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(女)
{ type = 0, id = 442, count = 1, strong = 0,quality = 0, bind = 0},--通天神盔
{ type = 0, id = 443, count = 1, strong = 0,quality = 0, bind = 0},--通天神链
{ type = 0, id = 444, count = 1, strong = 0,quality = 0, bind = 0},--通天神镯
{ type = 0, id = 445, count = 1, strong = 0,quality = 0, bind = 0},--通天神戒
{ type = 0, id = 446, count = 1, strong = 0,quality = 0, bind = 0},--通天神带
{ type = 0, id = 447, count = 1, strong = 0,quality = 0, bind = 0},--通天神靴

			},
			{--法师
{ type = 0, id = 439, count = 1, strong = 0,quality = 0, bind = 0},--通天神棍
{ type = 0, id = 440, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(男)
{ type = 0, id = 441, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(女)
{ type = 0, id = 442, count = 1, strong = 0,quality = 0, bind = 0},--通天神盔
{ type = 0, id = 443, count = 1, strong = 0,quality = 0, bind = 0},--通天神链
{ type = 0, id = 444, count = 1, strong = 0,quality = 0, bind = 0},--通天神镯
{ type = 0, id = 445, count = 1, strong = 0,quality = 0, bind = 0},--通天神戒
{ type = 0, id = 446, count = 1, strong = 0,quality = 0, bind = 0},--通天神带
{ type = 0, id = 447, count = 1, strong = 0,quality = 0, bind = 0},--通天神靴

			},									        
			{--道士								           
{ type = 0, id = 439, count = 1, strong = 0,quality = 0, bind = 0},--通天神棍
{ type = 0, id = 440, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(男)
{ type = 0, id = 441, count = 1, strong = 0,quality = 0, bind = 0},--通天神甲(女)
{ type = 0, id = 442, count = 1, strong = 0,quality = 0, bind = 0},--通天神盔
{ type = 0, id = 443, count = 1, strong = 0,quality = 0, bind = 0},--通天神链
{ type = 0, id = 444, count = 1, strong = 0,quality = 0, bind = 0},--通天神镯
{ type = 0, id = 445, count = 1, strong = 0,quality = 0, bind = 0},--通天神戒
{ type = 0, id = 446, count = 1, strong = 0,quality = 0, bind = 0},--通天神带
{ type = 0, id = 447, count = 1, strong = 0,quality = 0, bind = 0},--通天神靴

			},
		},	
	},

	{type = 10,BossId = 639,BossName = '妖蛮蛮王[3转]',SceneId=0,SceneName = 'BOSS之家1层',Time = 3600,FirstRefTime = 3,level = 100,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 448, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵斩
{ type = 0, id = 449, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(男)
{ type = 0, id = 450, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(女)
{ type = 0, id = 451, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵盔
{ type = 0, id = 452, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵链
{ type = 0, id = 453, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵镯
{ type = 0, id = 454, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵戒
{ type = 0, id = 455, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵带
{ type = 0, id = 456, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵靴

			},
			{--法师
{ type = 0, id = 448, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵斩
{ type = 0, id = 449, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(男)
{ type = 0, id = 450, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(女)
{ type = 0, id = 451, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵盔
{ type = 0, id = 452, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵链
{ type = 0, id = 453, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵镯
{ type = 0, id = 454, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵戒
{ type = 0, id = 455, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵带
{ type = 0, id = 456, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵靴

			},									        
			{--道士								           
{ type = 0, id = 448, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵斩
{ type = 0, id = 449, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(男)
{ type = 0, id = 450, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵甲(女)
{ type = 0, id = 451, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵盔
{ type = 0, id = 452, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵链
{ type = 0, id = 453, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵镯
{ type = 0, id = 454, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵戒
{ type = 0, id = 455, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵带
{ type = 0, id = 456, count = 1, strong = 0,quality = 0, bind = 0},--毁灭灵靴

			},
		},	
	},

	{type = 11,BossId = 640,BossName = '修罗王上[4转]',SceneId=0,SceneName = 'BOSS之家1层',Time = 3600,FirstRefTime = 3,level = 110,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{type = 0, id = 4618, count = 1, strong = 0, quality = 0, bind = 0},--上古开山
{type = 0, id = 4619, count = 1, strong = 0, quality = 0, bind = 0},--上古重甲(男)
{type = 0, id = 4620, count = 1, strong = 0, quality = 0, bind = 0},--上古重甲(女)
{type = 0, id = 4621, count = 1, strong = 0, quality = 0, bind = 0},--上古战盔
{type = 0, id = 4622, count = 1, strong = 0, quality = 0, bind = 0},--上古战链
{type = 0, id = 4623, count = 1, strong = 0, quality = 0, bind = 0},--上古战镯
{type = 0, id = 4624, count = 1, strong = 0, quality = 0, bind = 0},--上古战戒
{type = 0, id = 4625, count = 1, strong = 0, quality = 0, bind = 0},--上古战带
{type = 0, id = 4626, count = 1, strong = 0, quality = 0, bind = 0},--上古战靴

			},
			{--法师
{type = 0, id = 4627, count = 1, strong = 0, quality = 0, bind = 0},--上古拂尘
{type = 0, id = 4628, count = 1, strong = 0, quality = 0, bind = 0},--上古魔袍(男)
{type = 0, id = 4629, count = 1, strong = 0, quality = 0, bind = 0},--上古魔袍(女)
{type = 0, id = 4630, count = 1, strong = 0, quality = 0, bind = 0},--上古法盔
{type = 0, id = 4631, count = 1, strong = 0, quality = 0, bind = 0},--上古法链
{type = 0, id = 4632, count = 1, strong = 0, quality = 0, bind = 0},--上古法镯
{type = 0, id = 4633, count = 1, strong = 0, quality = 0, bind = 0},--上古法戒
{type = 0, id = 4634, count = 1, strong = 0, quality = 0, bind = 0},--上古法带
{type = 0, id = 4635, count = 1, strong = 0, quality = 0, bind = 0},--上古法靴

			},									        
			{--道士								           
{type = 0, id = 4636, count = 1, strong = 0, quality = 0, bind = 0},--上古霹雷
{type = 0, id = 4637, count = 1, strong = 0, quality = 0, bind = 0},--上古道衣(男)
{type = 0, id = 4638, count = 1, strong = 0, quality = 0, bind = 0},--上古道衣(女)
{type = 0, id = 4639, count = 1, strong = 0, quality = 0, bind = 0},--上古道盔
{type = 0, id = 4640, count = 1, strong = 0, quality = 0, bind = 0},--上古道链
{type = 0, id = 4641, count = 1, strong = 0, quality = 0, bind = 0},--上古道镯
{type = 0, id = 4642, count = 1, strong = 0, quality = 0, bind = 0},--上古道戒
{type = 0, id = 4643, count = 1, strong = 0, quality = 0, bind = 0},--上古道带
{type = 0, id = 4644, count = 1, strong = 0, quality = 0, bind = 0},--上古道靴

			},
		},	
	},

	{type = 12,BossId = 641,BossName = '四脚魔魔主[5转]',SceneId=0,SceneName = 'BOSS之家2层',Time = 3600,FirstRefTime = 3,level = 120,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{type = 0, id = 4645, count = 1, strong = 0, quality = 0, bind = 0},--起源战刃
{type = 0, id = 4646, count = 1, strong = 0, quality = 0, bind = 0},--起源战甲(男)
{type = 0, id = 4647, count = 1, strong = 0, quality = 0, bind = 0},--起源战甲(女)
{type = 0, id = 4648, count = 1, strong = 0, quality = 0, bind = 0},--起源战盔
{type = 0, id = 4649, count = 1, strong = 0, quality = 0, bind = 0},--起源战链
{type = 0, id = 4650, count = 1, strong = 0, quality = 0, bind = 0},--起源战镯
{type = 0, id = 4651, count = 1, strong = 0, quality = 0, bind = 0},--起源战戒
{type = 0, id = 4652, count = 1, strong = 0, quality = 0, bind = 0},--起源战带
{type = 0, id = 4653, count = 1, strong = 0, quality = 0, bind = 0},--起源战靴

			},
			{--法师
{type = 0, id = 4654, count = 1, strong = 0, quality = 0, bind = 0},--起源法剑
{type = 0, id = 4655, count = 1, strong = 0, quality = 0, bind = 0},--起源魔袍(男)
{type = 0, id = 4656, count = 1, strong = 0, quality = 0, bind = 0},--起源魔袍(女)
{type = 0, id = 4657, count = 1, strong = 0, quality = 0, bind = 0},--起源法盔
{type = 0, id = 4658, count = 1, strong = 0, quality = 0, bind = 0},--起源法链
{type = 0, id = 4659, count = 1, strong = 0, quality = 0, bind = 0},--起源法镯
{type = 0, id = 4660, count = 1, strong = 0, quality = 0, bind = 0},--起源法戒
{type = 0, id = 4661, count = 1, strong = 0, quality = 0, bind = 0},--起源法带
{type = 0, id = 4662, count = 1, strong = 0, quality = 0, bind = 0},--起源法靴

			},									        
			{--道士								           
{type = 0, id = 4663, count = 1, strong = 0, quality = 0, bind = 0},--起源道剑
{type = 0, id = 4664, count = 1, strong = 0, quality = 0, bind = 0},--起源道衣(男)
{type = 0, id = 4665, count = 1, strong = 0, quality = 0, bind = 0},--起源道衣(女)
{type = 0, id = 4666, count = 1, strong = 0, quality = 0, bind = 0},--起源道盔
{type = 0, id = 4667, count = 1, strong = 0, quality = 0, bind = 0},--起源道链
{type = 0, id = 4668, count = 1, strong = 0, quality = 0, bind = 0},--起源道镯
{type = 0, id = 4669, count = 1, strong = 0, quality = 0, bind = 0},--起源道戒
{type = 0, id = 4670, count = 1, strong = 0, quality = 0, bind = 0},--起源道带
{type = 0, id = 4671, count = 1, strong = 0, quality = 0, bind = 0},--起源道靴

			},
		},	
	},

	{type = 13,BossId = 642,BossName = '真龙圣王[6转]',SceneId=0,SceneName = 'BOSS之家2层',Time = 3600,FirstRefTime = 3,level = 130,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{type = 0, id = 4672, count = 1, strong = 0, quality = 0, bind = 0},--誓言星王
{type = 0, id = 4673, count = 1, strong = 0, quality = 0, bind = 0},--誓言战甲(男)
{type = 0, id = 4674, count = 1, strong = 0, quality = 0, bind = 0},--誓言战甲(女)
{type = 0, id = 4675, count = 1, strong = 0, quality = 0, bind = 0},--誓言战盔
{type = 0, id = 4676, count = 1, strong = 0, quality = 0, bind = 0},--誓言战链
{type = 0, id = 4677, count = 1, strong = 0, quality = 0, bind = 0},--誓言战镯
{type = 0, id = 4678, count = 1, strong = 0, quality = 0, bind = 0},--誓言战戒
{type = 0, id = 4679, count = 1, strong = 0, quality = 0, bind = 0},--誓言战带
{type = 0, id = 4680, count = 1, strong = 0, quality = 0, bind = 0},--誓言战靴

			},
			{--法师
{type = 0, id = 4681, count = 1, strong = 0, quality = 0, bind = 0},--誓言血饮
{type = 0, id = 4682, count = 1, strong = 0, quality = 0, bind = 0},--誓言魔袍(男)
{type = 0, id = 4683, count = 1, strong = 0, quality = 0, bind = 0},--誓言魔袍(女)
{type = 0, id = 4684, count = 1, strong = 0, quality = 0, bind = 0},--誓言法盔
{type = 0, id = 4685, count = 1, strong = 0, quality = 0, bind = 0},--誓言法链
{type = 0, id = 4686, count = 1, strong = 0, quality = 0, bind = 0},--誓言法镯
{type = 0, id = 4687, count = 1, strong = 0, quality = 0, bind = 0},--誓言法戒
{type = 0, id = 4688, count = 1, strong = 0, quality = 0, bind = 0},--誓言法带
{type = 0, id = 4689, count = 1, strong = 0, quality = 0, bind = 0},--誓言法靴

			},									        
			{--道士								           
{type = 0, id = 4690, count = 1, strong = 0, quality = 0, bind = 0},--誓言天玑
{type = 0, id = 4691, count = 1, strong = 0, quality = 0, bind = 0},--誓言道衣(男)
{type = 0, id = 4692, count = 1, strong = 0, quality = 0, bind = 0},--誓言道衣(女)
{type = 0, id = 4693, count = 1, strong = 0, quality = 0, bind = 0},--誓言道盔
{type = 0, id = 4694, count = 1, strong = 0, quality = 0, bind = 0},--誓言道链
{type = 0, id = 4695, count = 1, strong = 0, quality = 0, bind = 0},--誓言道镯
{type = 0, id = 4696, count = 1, strong = 0, quality = 0, bind = 0},--誓言道戒
{type = 0, id = 4697, count = 1, strong = 0, quality = 0, bind = 0},--誓言道带
{type = 0, id = 4698, count = 1, strong = 0, quality = 0, bind = 0},--誓言道靴

			},
		},	
	},

	{type = 14,BossId = 643,BossName = '炽焰山山王[7转]',SceneId=0,SceneName = 'BOSS之家3层',Time = 3600,FirstRefTime = 3,level = 140,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 87, count = 1, strong = 0,quality = 0, bind = 0},--冲天战刀
{ type = 0, id = 88, count = 1, strong = 0,quality = 0, bind = 0},--冲天战甲(男)
{ type = 0, id = 89, count = 1, strong = 0,quality = 0, bind = 0},--冲天战甲(女)
{ type = 0, id = 90, count = 1, strong = 0,quality = 0, bind = 0},--冲天战盔
{ type = 0, id = 91, count = 1, strong = 0,quality = 0, bind = 0},--冲天战链
{ type = 0, id = 92, count = 1, strong = 0,quality = 0, bind = 0},--冲天战腕
{ type = 0, id = 93, count = 1, strong = 0,quality = 0, bind = 0},--冲天战戒
{ type = 0, id = 94, count = 1, strong = 0,quality = 0, bind = 0},--冲天战带
{ type = 0, id = 95, count = 1, strong = 0,quality = 0, bind = 0},--冲天战靴

			},
			{--法师
{ type = 0, id = 96, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔杖
{ type = 0, id = 97, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔袍(男)
{ type = 0, id = 98, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔袍(女)
{ type = 0, id = 99, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔盔
{ type = 0, id = 100, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔链
{ type = 0, id = 101, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔腕
{ type = 0, id = 102, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔戒
{ type = 0, id = 103, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔带
{ type = 0, id = 104, count = 1, strong = 0,quality = 0, bind = 0},--冲天魔靴

			},									        
			{--道士								           
{ type = 0, id = 105, count = 1, strong = 0,quality = 0, bind = 0},--冲天道剑
{ type = 0, id = 106, count = 1, strong = 0,quality = 0, bind = 0},--冲天道衣(男)
{ type = 0, id = 107, count = 1, strong = 0,quality = 0, bind = 0},--冲天道衣(女)
{ type = 0, id = 108, count = 1, strong = 0,quality = 0, bind = 0},--冲天道盔
{ type = 0, id = 109, count = 1, strong = 0,quality = 0, bind = 0},--冲天道链
{ type = 0, id = 110, count = 1, strong = 0,quality = 0, bind = 0},--冲天道腕
{ type = 0, id = 111, count = 1, strong = 0,quality = 0, bind = 0},--冲天道戒
{ type = 0, id = 112, count = 1, strong = 0,quality = 0, bind = 0},--冲天道带
{ type = 0, id = 113, count = 1, strong = 0,quality = 0, bind = 0},--冲天道靴

			},
		},	
	},

	{type = 15,BossId = 644,BossName = '雷炎炎主[9转]',SceneId=0,SceneName = 'BOSS之家3层',Time = 3600,FirstRefTime = 3,level = 150,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 114, count = 1, strong = 0,quality = 0, bind = 0},--菩提彻地斩
{ type = 0, id = 115, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂甲(男)
{ type = 0, id = 116, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂甲(女)
{ type = 0, id = 117, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂盔
{ type = 0, id = 118, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂链
{ type = 0, id = 119, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂腕
{ type = 0, id = 120, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂戒
{ type = 0, id = 121, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂带
{ type = 0, id = 122, count = 1, strong = 0,quality = 0, bind = 0},--菩提战狂靴

			},
			{--法师
{ type = 0, id = 123, count = 1, strong = 0,quality = 0, bind = 0},--菩提骷髅杖
{ type = 0, id = 124, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴袍(男)
{ type = 0, id = 125, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴袍(女)
{ type = 0, id = 126, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴盔
{ type = 0, id = 127, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴链
{ type = 0, id = 128, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴腕
{ type = 0, id = 129, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴戒
{ type = 0, id = 130, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴带
{ type = 0, id = 131, count = 1, strong = 0,quality = 0, bind = 0},--菩提法痴靴

			},									        
			{--道士								           
{ type = 0, id = 132, count = 1, strong = 0,quality = 0, bind = 0},--菩提金纹剑
{ type = 0, id = 133, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙衣(男)
{ type = 0, id = 134, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙衣(女)
{ type = 0, id = 135, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙盔
{ type = 0, id = 136, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙链
{ type = 0, id = 137, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙腕
{ type = 0, id = 138, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙戒
{ type = 0, id = 139, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙带
{ type = 0, id = 140, count = 1, strong = 0,quality = 0, bind = 0},--菩提道仙靴

			},
		},	
	},

	{type = 16,BossId = 645,BossName = '冰族之王[11转]',SceneId=0,SceneName = 'BOSS之家3层',Time = 3600,FirstRefTime = 3,level = 160,circle=0,viplevel=0,fastBtnState=4,award = {},

		drop=
		{	
			{--战士
{ type = 0, id = 141, count = 1, strong = 0,quality = 0, bind = 0},--无尘怒斩
{ type = 0, id = 142, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻甲(男)
{ type = 0, id = 143, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻甲(女)
{ type = 0, id = 144, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻盔
{ type = 0, id = 145, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻链
{ type = 0, id = 146, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻腕
{ type = 0, id = 147, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻戒
{ type = 0, id = 148, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻带
{ type = 0, id = 149, count = 1, strong = 0,quality = 0, bind = 0},--无尘战幻靴

			},
			{--法师
{ type = 0, id = 150, count = 1, strong = 0,quality = 0, bind = 0},--无尘禅杖
{ type = 0, id = 151, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻袍(男)
{ type = 0, id = 152, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻袍(女)
{ type = 0, id = 153, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻盔
{ type = 0, id = 154, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻链
{ type = 0, id = 155, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻腕
{ type = 0, id = 156, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻戒
{ type = 0, id = 157, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻带
{ type = 0, id = 158, count = 1, strong = 0,quality = 0, bind = 0},--无尘法幻靴

			},									        
			{--道士								           
{ type = 0, id = 159, count = 1, strong = 0,quality = 0, bind = 0},--无尘血剑
{ type = 0, id = 160, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻衣(男)
{ type = 0, id = 161, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻衣(女)
{ type = 0, id = 162, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻盔
{ type = 0, id = 163, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻链
{ type = 0, id = 164, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻腕
{ type = 0, id = 165, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻戒
{ type = 0, id = 166, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻带
{ type = 0, id = 167, count = 1, strong = 0,quality = 0, bind = 0},--无尘道幻靴

			},
		},	
	},



}
