--[[File:CommonFestival.lua]]

--#include "..\..\..\language\LangCode.txt" once

CommonFestival = {
	--节日活动界面配置
	Festival = {
		UiName = Lang.Activity.fes001,				--主界面标题
		GrilUiId = 26,				--美女资源ID
		--选项配置
		options = {
			{
				optionName = Lang.Activity.fes003,    --选项名字
				picId = 12,			--图片资源ID
				npcSceneId = 8,
				npcName = "",		--自动寻路到哪个NPC
				desc = Lang.Activity.desc002,			--活动描述
			    changeLinkUrl = Lang.Activity.chan001,       -- 充值链接
			    posX = 310,
			    posY = 179,
				size = 13 
			},
			{
				optionName = Lang.Activity.fes002,    --选项名字
				picId = 1,			--图片资源ID
				npcSceneId = 8,
				npcName = Lang.EntityName.n00211,		--自动寻路到哪个NPC
				desc = Lang.Activity.desc001,			--活动描述
				size = 13 
			},
		
			{
				optionName = Lang.Activity.fes004,    --选项名字
				picId = 12,			--图片资源ID
				npcSceneId = 8,
				npcName = Lang.EntityName.n00211,		--自动寻路到哪个NPC
				desc = Lang.Activity.desc003,			--活动描述
				size = 13 
			},
			{
				optionName = Lang.Activity.fes005,    --选项名字
				picId = 12,			--图片资源ID
				npcSceneId = 8,
				npcName = Lang.EntityName.n00211,		--自动寻路到哪个NPC
				desc = Lang.Activity.desc004,			--活动描述
				size = 13 
			},
			{
				optionName = Lang.Activity.fes006,    --选项名字
				picId = 13,			--图片资源ID
				npcSceneId = 8,
				npcName = Lang.EntityName.n00211,		--自动寻路到哪个NPC
				desc = Lang.Activity.desc005,			--活动描述
				size = 13 
			},
			
			{
				optionName = Lang.Activity.fes007,    --选项名字
				picId = 11,			--图片资源ID
				npcSceneId = 8,
				npcName = "",		--自动寻路到哪个NPC
				desc = Lang.Activity.desc006,			--活动描述
				size = 13 
			},
--[[
			{
				optionName = Lang.Activity.fes008,    --选项名字
				picId = 12,			--图片资源ID
				npcSceneId = 0,
				npcName = "",		--自动寻路到哪个NPC
				desc = Lang.Activity.desc007,			--活动描述
				size = 13 
			},
--]]
		    {
				optionName = Lang.Activity.fes009,    --选项名字
				picId = 1,			--图片资源ID
				npcSceneId = 8,
				npcName = "",		--自动寻路到哪个NPC
				desc = Lang.Activity.desc008,			--活动描述
				size = 13 
			},
			--双倍狂欢 
			{
				optionName = Lang.Activity.fes010,    --选项名字
				picId = 1,			--图片资源ID
				npcSceneId = 8,
				npcName = "",		--自动寻路到哪个NPC
				desc = Lang.Activity.desc009,			--活动描述
				size = 13
			},
		},
	},

	--百服活动配置
	HundredServer = {
		UiName = Lang.Activity.hundred01,				--百服活动名称
		GrilUiId = 1,									--美女资源ID
		options = {

			{
				optionName = Lang.Activity.hundred02,	--选项名字（幸运抽奖）
				startDate = Lang.Activity.hundred03,	--活动开启时间
				actRule = "",		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = "",
						awards = {
							--{type = 0, id = 100,count = 1,quality = 0, strong = 0, bind = 0},
						},
					},
				},
			},

			{
				optionName = Lang.Activity.hundred04,	--选项名字（平台活动）
				startDate = Lang.Activity.hundred05,	--活动开启时间
				actRule = Lang.Activity.hundred06,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = "",
						awards = {
							{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},
							{type = 0, id = 784,count = 1,quality = 0, strong = 0, bind = 0,},
							{type = 0, id = 1402,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 283,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 960,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 577,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1031,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 354,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1429,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1430,count = 1,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1431,count = 1,quality = 0, strong = 0, bind = 0},
						},
					},
				},
			},

			{
				optionName = Lang.Activity.hundred07,	--选项名字（消费排行榜）
				startDate = Lang.Activity.hundred08,	--活动开启时间
				actRule = Lang.Activity.hundred09,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
				--昨日消费前10
					{
						desc = "",
						awards = {
							{type = 0, id = 1402,count = 15,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1172,count = 30,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1172,count = 20,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 10,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1172,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1172,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
							{type = 0, id = 1172,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 283,count = 5,quality = 0, strong = 0, bind = 0},
						},
					},

					--累积消费前10
					{
						desc = "",
						awards = {
							{type = 0, id = 1093,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 1097,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 1101,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 30,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 1092,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 1096,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 1100,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 25,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 982,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 983,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 984,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 20,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 15,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 15,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = "",
						awards = {
							{type = 0, id = 549,count = 1,quality = 0, strong = 0, bind = 0,job = 1},
							{type = 0, id = 550,count = 1,quality = 0, strong = 0, bind = 0,job = 2},
							{type = 0, id = 551,count = 1,quality = 0, strong = 0, bind = 0,job = 3},
							{type = 0, id = 1402,count = 10,quality = 0, strong = 0, bind = 0},
						},
					},

				},
			},

			{
				optionName = Lang.Activity.hundred10,	--选项名字（沙城霸主）
				startDate = Lang.Activity.hundred11,	--活动开启时间
				actRule = Lang.Activity.hundred12,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = Lang.Activity.hundred13,
						awards = {
							--{type = 0, id = 1125,count = 1,quality = 0, strong = 0, bind = 0},
						},
					},
				},
			},

			{
				optionName = Lang.Activity.hundred14,	--选项名字(黄金屠龙认主）
				startDate = Lang.Activity.hundred15,	--活动开启时间
				actRule = Lang.Activity.hundred16,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = Lang.Activity.hundred17,
						awards = {
							{type = 0, id = 1125,count = 1,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = Lang.Activity.hundred18,
						awards = {
							{type = 0, id = 1721,count = 3,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = Lang.Activity.hundred19,
						awards = {
							{type = 0, id = 1721,count = 2,quality = 0, strong = 0, bind = 0},
						},
					},
					{
						desc = Lang.Activity.hundred20,
						awards = {
							{type = 0, id = 1721,count = 1,quality = 0, strong = 0, bind = 0},
						},
					},
				},
			},

			{
				optionName = Lang.Activity.hundred21,	--选项名字（豪华礼包）
				startDate = Lang.Activity.hundred22,	--活动开启时间
				actRule = Lang.Activity.hundred23,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = "",
						awards = {
							{type = 0, id = 361,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 682,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 1073,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 1075,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 910,count = 5,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 704,count = 10,quality = 0, strong = 0, bind = 1},
						},
					},
				},
			},

			{
				optionName = Lang.Activity.hundred24,	--选项名字(媒体礼包）
				startDate = Lang.Activity.hundred25,	--活动开启时间
				actRule = Lang.Activity.hundred26,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = "",
						awards = {
							{type = 0, id = 361,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 682,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 1073,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 1075,count = 1,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 910,count = 5,quality = 0, strong = 0, bind = 1},
							{type = 0, id = 704,count = 10,quality = 0, strong = 0, bind = 1},
						},
					},
				},
			},
--[[
			{
				optionName = Lang.Activity.hundred27,	--选项名字（冠名荣誉）
				startDate = Lang.Activity.hundred28,	--活动开启时间
				actRule = Lang.Activity.hundred29,		--活动规则
				actAwardStr  = "",	--活动奖励
				actAwardId = {
					{
						desc = Lang.Activity.hundred30,
						awards = {

						},
					},
				},
			},
]]
		},
	},
}