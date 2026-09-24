--炎龙桃源
{
	--场景1
	scenceid = 270,					--这个id必须每次递增，比如第一个场景id是0，下一个一定是1，类推
	scencename = Lang.SceneName.s00270,					--场景名称
	mapfilename = "175SanRenZhenChun",								--场景对应的地图
	minlevel = 1,						--限制等级
	forbiddenitem = {1,2},		--限制物品
	--forbiddenpet = {5,3},		--限制的坐骑（宠物）
	forbiddenskill = {100,20},	--限制的技能
	nopk = 0,								--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "1.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 136,
	sceneHeight = 200,
	posx = 79,
	posy = 153,
	area =	
	{
		{	--区域属性,注释规范,明确. 
			name = Lang.SceneName.s00270,
			range = { 17,198, 134,198, 134,88, 17,88 },	--范围点,3个坐标点以上连成线.
			center = { 79,153 }, --范围点内的中心点
			attri = {
				{type=18,value = {}},--穿人
				{type=1, value = {}},--世界安全区
				{type=19,value = {}},--穿怪
				{type=39,value = {}},--城镇，表示回城卷或者回城复活，就会回到这里
				{type=87,value = {}},--新手保护有效
				{type=46,value = {76,151, 89,164}},--安全区复活点
				
			 },
		},


        {	--特效区域属性,注释规范,明确. 新手村块
			name = Lang.SceneName.s00270,
			range = { 0,88, 135,88, 135,0, 0,0 },	--范围点,3个坐标点以上连成线.
			center = { 79,153 }, --范围点内的中心点
			attri = {
				{type=97,value = {}}, --黑暗区域
				{type=98,value = {202}}, 	--lan色 		
				
			 },
		},



		{	--特效区域属性,注释规范,明确. 
			name = Lang.SceneName.s00270,
			range = { 0,198, 135,198, 135,89, 0,89 },	--范围点,3个坐标点以上连成线.
			center = { 79,153 }, --范围点内的中心点
			attri = {
				--{type=97,value = {}},
				{type=98,value = {201}}, --黑暗区域
				
			 },
		},


		-- {	--特效区域属性,注释规范,明确. 新手村块
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 1,176, 135,176, 135,225, 1,225 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		-- {type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {202}}, 	--lan色 		
				
		-- 	 },
		-- },

        -- {	--特效区域属性,注释规范,明确. 新手村块
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 1,110,62,110,62,175,1,175 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		-- {type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {202}}, 	--lan色 		
				
		-- 	 },
		-- },


		-- {	--黑暗区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 1,1,62,1,62,110,1,110 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {200}}, 	--lv色	被困村民	
				
		-- 	 },
		-- },



		-- {	--黑暗区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 62,61,114,61,114,131,62,131 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {201}},  --红色  神秘人
				
		-- 	 },
		-- },


		-- {	--黑暗区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 114,60,170,60,170,136,114,136},	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {200}}, --lv色 士兵
				
		-- 	 },
		-- },

		
		-- {	--黑暗区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 114,136,170,136,170,158,114,158},	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {200}},  --lv色  散人
				
		-- 	 },
		-- },


        -- {	--黑暗区域属性,注释规范,明确. 受伤老道附近
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 114,60,145,60,145,80,114,80},	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {201}}, --红色
				
		-- 	 },
		-- },


        -- {	--特效区域属性,注释规范,明确. 靠近传送点块
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 66,1,124,1,124,50,66,50 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		-- {type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {202}}, 	--lan色 		
				
		-- 	 },
		-- },

        -- {	--特效区域属性,注释规范,明确. 传送点块靠近老道
		-- 	name = Lang.SceneName.s00631,
		-- 	range = { 90,50,124,50,124,60,90,60 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		-- {type=97,value = {}}, --黑暗区域
		-- 		{type=98,value = {202}}, 	--lan色 		
				
		-- 	 },
		-- },

		-- {	--特效区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00270,
		-- 	range = { 113,84,125,84,120,125,113,125 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=98,value = {201}}, --黑暗区域
				
		-- 	 },
		-- },

		-- {	--特效区域属性,注释规范,明确. 
		-- 	name = Lang.SceneName.s00270,
		-- 	range = { 113,85,163,85,163,154,116,163 },	--范围点,3个坐标点以上连成线.
		-- 	center = { 78,177 }, --范围点内的中心点
		-- 	attri = {
		-- 		{type=98,value = {202}}, --黑暗区域
				
		-- 	 },
		-- },



	},
	refresh =
	  {
--#include "refresh1.lua"

	  },
	----magicPassPoints={1,2,56,32}, --可以魔法穿透的障碍点的列表，比如小的石头，是可以魔法穿透的，这里

	npc =
	{
		--边界村
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货  10 书店，默认是0可以不配置
		
		


		{id = 2, posx = 70, posy = 146},--铁匠
		{id = 3, posx = 82, posy = 130},--小美
		{id = 4, posx = 58, posy = 109},--任务3
		{id = 5, posx = 42, posy = 90},--任务4
		{id = 6, posx = 24, posy = 64},--任务5
		{id = 7, posx = 27, posy = 34},--任务6
		{id = 8, posx = 60, posy = 36},--任务7
		{id = 9, posx = 79, posy = 52},--任务8
		{id = 12, posx = 96, posy = 39},--任务11
		{id = 325, posx = 105, posy = 136},--传送员



	} ,

  teleport =
  {
     --posx和posy表示传送门出现的位置
     --toSceneid表示要传送的目的场景id
     --toPosx和toPosy分别要传送的目的坐标，此坐标必须是位于toSceneid场景里的
     --script是传送点关联的脚本文件，
     --modelid表示外观模型的id
	--{ posx = 84, posy = 26,toSceneid = 9,toPosx = 228, toPosy = 241,modelid = 62700,name = Lang.SceneName.s00009 },  --炎龙桃源→炎龙城
  },

 landscape=
 {
	--{posx1=54,posy1=54,posx2=54,posy2=54,modelid=87,xinterval=0,yinterval=0},  --新手村特效

},

  },