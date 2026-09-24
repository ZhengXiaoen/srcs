--#include "..\..\language\LangCode.txt" once
-- 个人副本
GameFubenCfg = 
{	
	fubenList = 
	{
		-- 
		{
			fubenId = 100,
			bossId = 748,--怪物id
			fubenName = "尸王[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 1},{id = 678, count = 2},{id = 678, count = 3}},
			-- 进入副本的等级
			needLevel = 50,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
			   {type = 0, id = 319, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 320, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 321, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 322, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 323, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 324, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 325, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 326, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 327, count = 1, strong = 0, quality = 0, bind = 1},


			   
			},
		},

		
		{
			fubenId = 101,
			bossId = 749,--怪物id
			fubenName = "邪恶钳虫[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 1},{id = 678, count = 2},{id = 678, count = 3}},
			-- 进入副本的等级
			needLevel = 50,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 355, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 356, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 357, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 358, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 359, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 360, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 361, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 362, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 363, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

		{
			fubenId = 102,
			bossId = 750,--怪物id
			fubenName = "沃玛教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 2},{id = 678, count = 4},{id = 678, count = 6}},
			-- 进入副本的等级
			needLevel = 55,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 9,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 364, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 365, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 366, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 367, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 368, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 369, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 370, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 371, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 372, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

-- 		{
-- 			fubenId = 103,
-- 			bossId = 751,--怪物id
-- 			fubenName = "幻影沃玛教主",
-- 			fubenBg = 1,
-- 			-- 前端显示用（1:经验；2：金币；3：装备；）
-- 			fubenType = 1,
-- 			-- 进入副本需要传送令多少个（不配则不需要）
-- 			needItem = {{id = 678, count = 2},{id = 678, count = 4},{id = 678, count = 6}},
-- 			-- 进入副本的等级
-- 			needLevel = 60,
-- 			isCanBuyTimes = true,--可以买
-- 			-- 购买次数消耗
-- 			buyTimesConsume = {type = 15, count = 300},
-- 			-- 购买次数限制（-1则不限）
-- 			buyTimesLimit = 2,
-- 			desc = Lang.ScriptTips.fb00006,
-- 			-- 领取双倍奖励消耗
-- 			doubleConsume = {type = 15,id = 0, count = 58},
-- 			-- 奖励
-- 			num = 8,
-- 			award = 
-- 			{
-- 			   {type = 0, id = 0, count = 1800000}, 	-- 经验
-- 			},
-- 			drops =
-- 			{
-- {type = 0, id = 394, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 395, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 396, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 397, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 398, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 399, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 400, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 401, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 402, count = 1, strong = 0, quality = 0, bind = 1},

-- 			},
-- 		},

-- 		{
-- 			fubenId = 104,
-- 			bossId = 752,--怪物id
-- 			fubenName = "幻影白野猪",
-- 			fubenBg = 1,
-- 			-- 前端显示用（1:经验；2：金币；3：装备；）
-- 			fubenType = 1,
-- 			-- 进入副本需要传送令多少个（不配则不需要）
-- 			needItem = {{id = 678, count = 3},{id = 678, count = 6},{id = 678, count = 9}},
-- 			-- 进入副本的等级
-- 			needLevel = 65,
-- 			isCanBuyTimes = true,--可以买
-- 			-- 购买次数消耗
-- 			buyTimesConsume = {type = 15, count = 300},
-- 			-- 购买次数限制（-1则不限）
-- 			buyTimesLimit = 2,
-- 			desc = Lang.ScriptTips.fb00006,
-- 			-- 领取双倍奖励消耗
-- 			doubleConsume = {type = 15,id = 0, count = 58},
-- 			-- 奖励
-- 			num = 8,
-- 			award = 
-- 			{
-- 			   {type = 0, id = 0, count = 1800000}, 	-- 经验
-- 			},
-- 			drops =
-- 			{
-- {type = 0, id = 403, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 404, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 405, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 406, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 407, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 408, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 409, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 410, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 411, count = 1, strong = 0, quality = 0, bind = 1},

-- 			},
-- 		},

		{
			fubenId = 105,
			bossId = 753,--怪物id
			fubenName = "赤月恶魔[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 3},{id = 678, count = 6},{id = 678, count = 9}},
			-- 进入副本的等级
			needLevel = 70,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 412, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 413, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 414, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 415, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 416, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 417, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 418, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 419, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 420, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

		-- {
		-- 	fubenId = 106,
		-- 	bossId = 484,--怪物id
		-- 	fubenName = "蛮荒大教皇[一阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 80,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	   { type = 0, id = 328, count = 1, strong = 0,quality = 0, bind = 1},--1转战士武器
		-- 	   { type = 0, id = 329, count = 1, strong = 0,quality = 0, bind = 1},--1转法师武器
		-- 	   { type = 0, id = 330, count = 1, strong = 0,quality = 0, bind = 1},--1转道士武器
		-- 	   { type = 0, id = 331, count = 1, strong = 0,quality = 0, bind = 1},--2转战盔
		-- 	   { type = 0, id = 332, count = 1, strong = 0,quality = 0, bind = 1},--2转魔链
		-- 	   { type = 0, id = 333, count = 1, strong = 0,quality = 0, bind = 1},--2转道镯
		-- 	   { type = 0, id = 334, count = 1, strong = 0,quality = 0, bind = 1},--2转战戒
		-- 	   { type = 0, id = 335, count = 1, strong = 0,quality = 0, bind = 1},--2转道带
		-- 	   { type = 0, id = 336, count = 1, strong = 0,quality = 0, bind = 1},--2转魔靴
		-- 	},
		-- },

-------------------------------------1阶------------------------------

		-- {
		-- 	fubenId = 107,
		-- 	bossId = 428,--怪物id
		-- 	fubenName = "变异骷髅王[五阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 70,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	   { type = 0, id = 355, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 356, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 357, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 358, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 359, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 360, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 361, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 362, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 363, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	},
		-- },

		-- 
-- 		{
-- 			fubenId = 108,
-- 			bossId = 754,--怪物id
-- 			fubenName = "幻影魔龙教主",
-- 			fubenBg = 1,
-- 			-- 前端显示用（1:经验；2：金币；3：装备；）
-- 			fubenType = 1,
-- 			-- 进入副本需要传送令多少个（不配则不需要）
-- 			needItem = {{id = 678, count = 3},{id = 678, count = 6},{id = 678, count = 9}},
-- 			-- 进入副本的等级
-- 			needLevel = 75,
-- 			isCanBuyTimes = true,--可以买
-- 			-- 购买次数消耗
-- 			buyTimesConsume = {type = 15, count = 300},
-- 			-- 购买次数限制（-1则不限）
-- 			buyTimesLimit = 2,
-- 			desc = Lang.ScriptTips.fb00006,
-- 			-- 领取双倍奖励消耗
-- 			doubleConsume = {type = 15,id = 0, count = 58},
-- 			-- 奖励
-- 			num = 8,
-- 			award = 
-- 			{
-- 			   {type = 0, id = 0, count = 1800000}, 	-- 经验
-- 			},
-- 			drops =
-- 			{
-- {type = 0, id = 421, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 422, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 423, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 424, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 425, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 426, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 427, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 428, count = 1, strong = 0, quality = 0, bind = 1},
-- {type = 0, id = 429, count = 1, strong = 0, quality = 0, bind = 1},

-- 			},
-- 		},

		-- {
		-- 	fubenId = 109,
		-- 	bossId = 448,--怪物id
		-- 	fubenName = "暗之钳虫皇[五阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 74,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	  { type = 0, id = 355, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 356, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 357, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 358, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 359, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 360, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 361, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 362, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 363, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	},
		-- },

		-- {
		-- 	fubenId = 110,
		-- 	bossId = 458,--怪物id
		-- 	fubenName = "异教教皇[五阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 76,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	  { type = 0, id = 355, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 356, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 357, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 358, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 359, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 360, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 361, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 362, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 363, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	},
		-- },

		-- {
		-- 	fubenId = 111,
		-- 	bossId = 468,--怪物id
		-- 	fubenName = "虚空大帝[五阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 78,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	   { type = 0, id = 355, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 356, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 357, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 358, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 359, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 360, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 361, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 362, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 363, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	},
		-- },
---------------转生boss
		{
			fubenId = 112,
			bossId = 755,--怪物id
			fubenName = "祖玛教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 8},{id = 678, count = 16},{id = 678, count = 24}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 433, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 434, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 435, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 436, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 437, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 438, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 421, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 422, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 423, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

		-- {
		-- 	fubenId = 113,
		-- 	bossId = 488,--怪物id
		-- 	fubenName = "蛮荒大教皇[五阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 80,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	   { type = 0, id = 355, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 356, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 357, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 358, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 359, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 360, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 361, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 362, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	   { type = 0, id = 363, count = 1, strong = 0,quality = 0, bind = 1},--五行套
		-- 	},
		-- },



-------------------------------5阶-----------------------------


		-- {
		-- 	fubenId = 114,
		-- 	bossId = 433,--怪物id
		-- 	fubenName = "变异骷髅王[十阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 70,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	   { type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	},
		-- },

		-- -- 
		-- {
		-- 	fubenId = 115,
		-- 	bossId = 443,--怪物id
		-- 	fubenName = "铁链僵尸皇[十阶]",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 72,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 300},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 200},
		-- 	-- 奖励
		-- 	num = 7,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 3000000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	  { type = 0, id = 421, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 422, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 423, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 424, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 425, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 426, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 427, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 428, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	   { type = 0, id = 429, count = 1, strong = 0,quality = 0, bind = 1},--十方套
		-- 	},
		-- },

		{
			fubenId = 116,
			bossId = 756,--怪物id
			fubenName = "牛魔王[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 10},{id = 678, count = 20},{id = 678, count = 30}},
			-- 进入副本的等级
			needLevel = 82,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 442, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 443, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 444, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 445, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 446, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 447, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 433, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 434, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 435, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

	{
			fubenId = 117,
			bossId = 757,--怪物id
			fubenName = "玛雅教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 12},{id = 678, count = 24},{id = 678, count = 36}},
			-- 进入副本的等级
			needLevel = 85,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 451, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 452, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 453, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 454, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 455, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 456, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 442, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 443, count = 1, strong = 0, quality = 0, bind = 1},
{type = 0, id = 444, count = 1, strong = 0, quality = 0, bind = 1},

			},
		},

		{
			fubenId = 118,
			bossId = 758,--怪物id
			fubenName = "魔龙教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 15},{id = 678, count = 30},{id = 678, count = 45}},
			-- 进入副本的等级
			needLevel = 90,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取3倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 6,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
			    
{type = 0, id = 4621, count = 1, strong = 0, quality = 0, bind = 1},--上古战盔
{type = 0, id = 4622, count = 1, strong = 0, quality = 0, bind = 1},--上古战链
{type = 0, id = 4623, count = 1, strong = 0, quality = 0, bind = 1},--上古战镯
{type = 0, id = 4630, count = 1, strong = 0, quality = 0, bind = 1},--上古法盔
{type = 0, id = 4631, count = 1, strong = 0, quality = 0, bind = 1},--上古法链
{type = 0, id = 4632, count = 1, strong = 0, quality = 0, bind = 1},--上古法镯
{type = 0, id = 4639, count = 1, strong = 0, quality = 0, bind = 1},--上古道盔
{type = 0, id = 4640, count = 1, strong = 0, quality = 0, bind = 1},--上古道链
{type = 0, id = 4641, count = 1, strong = 0, quality = 0, bind = 1},--上古道镯


			},	
		},

	{
			fubenId = 119,
			bossId = 759,--怪物id
			fubenName = "炼狱教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 20},{id = 678, count = 40},{id = 678, count = 60}},
			-- 进入副本的等级
			needLevel = 95,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 6,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 4648, count = 1, strong = 0, quality = 0, bind = 1},--起源战盔
{type = 0, id = 4649, count = 1, strong = 0, quality = 0, bind = 1},--起源战链
{type = 0, id = 4650, count = 1, strong = 0, quality = 0, bind = 1},--起源战镯
{type = 0, id = 4657, count = 1, strong = 0, quality = 0, bind = 1},--起源法盔
{type = 0, id = 4658, count = 1, strong = 0, quality = 0, bind = 1},--起源法链
{type = 0, id = 4659, count = 1, strong = 0, quality = 0, bind = 1},--起源法镯
{type = 0, id = 4666, count = 1, strong = 0, quality = 0, bind = 1},--起源道盔
{type = 0, id = 4667, count = 1, strong = 0, quality = 0, bind = 1},--起源道链
{type = 0, id = 4668, count = 1, strong = 0, quality = 0, bind = 1},--起源道镯


									       
		},
	},

	{
			fubenId = 120,
			bossId = 760,--怪物id
			fubenName = "神龙教主[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 25},{id = 678, count = 50},{id = 678, count = 75}},
			-- 进入副本的等级
			needLevel = 100,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id = 4675, count = 1, strong = 0, quality = 0, bind = 1},--誓言战盔
{type = 0, id = 4676, count = 1, strong = 0, quality = 0, bind = 1},--誓言战链
{type = 0, id = 4677, count = 1, strong = 0, quality = 0, bind = 1},--誓言战镯
{type = 0, id = 4684, count = 1, strong = 0, quality = 0, bind = 1},--誓言法盔
{type = 0, id = 4685, count = 1, strong = 0, quality = 0, bind = 1},--誓言法链
{type = 0, id = 4686, count = 1, strong = 0, quality = 0, bind = 1},--誓言法镯
{type = 0, id = 4693, count = 1, strong = 0, quality = 0, bind = 1},--誓言道盔
{type = 0, id = 4694, count = 1, strong = 0, quality = 0, bind = 1},--誓言道链
{type = 0, id = 4695, count = 1, strong = 0, quality = 0, bind = 1},--誓言道镯


								        

			},
		
		},

		{
			fubenId = 121,
			bossId = 836,--怪物id
			fubenName = "九尾狐妖[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 50},{id = 678, count = 100},{id = 678, count = 150}},
			-- 进入副本的等级
			needLevel = 105,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id =90, count = 1, strong = 0, quality = 0, bind = 1},--冲天战盔
{type = 0, id =91, count = 1, strong = 0, quality = 0, bind = 1},--冲天战链
{type = 0, id =92, count = 1, strong = 0, quality = 0, bind = 1},--冲天战腕
{type = 0, id =102, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔戒
{type = 0, id =103, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔带
{type = 0, id =104, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔靴
{type = 0, id =111, count = 1, strong = 0, quality = 0, bind = 1},--冲天道戒
{type = 0, id =112, count = 1, strong = 0, quality = 0, bind = 1},--冲天道带
{type = 0, id =113, count = 1, strong = 0, quality = 0, bind = 1},--冲天道靴



			},
		
		},

		{
			fubenId = 158,
			bossId = 1111,--怪物id
			fubenName = "雪域魔王[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 75},{id = 678, count = 150},{id = 678, count = 225}},
			-- 进入副本的等级
			needLevel = 110,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
				
{type = 0, id =117, count = 1, strong = 0, quality = 0, bind = 1},--冲天战盔
{type = 0, id =118, count = 1, strong = 0, quality = 0, bind = 1},--冲天战链
{type = 0, id =119, count = 1, strong = 0, quality = 0, bind = 1},--冲天战腕
{type = 0, id =126, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔戒
{type = 0, id =127, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔带
{type = 0, id =128, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔靴
{type = 0, id =135, count = 1, strong = 0, quality = 0, bind = 1},--冲天道戒
{type = 0, id =136, count = 1, strong = 0, quality = 0, bind = 1},--冲天道带
{type = 0, id =137, count = 1, strong = 0, quality = 0, bind = 1},--冲天道靴


			},
		
		},


	
		{
			fubenId = 159,
			bossId = 1112,--怪物id
			fubenName = "镇狱龙王[副本]",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 100},{id = 678, count = 200},{id = 678, count = 300}},
			-- 进入副本的等级
			needLevel = 115,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 150},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 8,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
{type = 0, id =144, count = 1, strong = 0, quality = 0, bind = 1},--冲天战盔
{type = 0, id =145, count = 1, strong = 0, quality = 0, bind = 1},--冲天战链
{type = 0, id =146, count = 1, strong = 0, quality = 0, bind = 1},--冲天战腕
{type = 0, id =153, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔戒
{type = 0, id =154, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔带
{type = 0, id =155, count = 1, strong = 0, quality = 0, bind = 1},--冲天魔靴
{type = 0, id =162, count = 1, strong = 0, quality = 0, bind = 1},--冲天道戒
{type = 0, id =163, count = 1, strong = 0, quality = 0, bind = 1},--冲天道带
{type = 0, id =164, count = 1, strong = 0, quality = 0, bind = 1},--冲天道靴




			},
		
		},


	


------------------------------------------------------

------特权boss
		{
			fubenId = 113,
			bossId = 786,--怪物id
			fubenName = "黄铜BOSS",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 0, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 6888},
			buyTimesConsume2 = {type = 15, count = 12888},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
			{ type = 0, id =4618, count = 1, strong = 0,quality = 0, bind = 1},--转转箱
			{ type = 0, id =4627, count = 1, strong = 0,quality = 0, bind = 1},--羽毛
			{ type = 0, id =4636, count = 1, strong = 0,quality = 0, bind = 1},--书页
			{ type = 0, id =4621, count = 1, strong = 0,quality = 0, bind = 1},--八荒刃
			{ type = 0, id =4631, count = 1, strong = 0,quality = 0, bind = 1},--九宫刃
			{ type = 0, id =5657, count = 1, strong = 0,quality = 0, bind = 1},--堕天使之魂
			{ type = 0, id =5658, count = 1, strong = 0,quality = 0, bind = 1},--战天使之魂
			{ type = 0, id =5659, count = 1, strong = 0,quality = 0, bind = 1},--血影冥光魂
			{ type = 0, id =5660, count = 1, strong = 0,quality = 0, bind = 1},--光芒天照灵



			},
		},

  --       -- 11
		{
			fubenId = 114,
			bossId = 787,--怪物id
			fubenName = "白银BOSS",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 6888},
			buyTimesConsume2 = {type = 15, count = 12888},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{
			
			{ type = 0, id =4645, count = 1, strong = 0,quality = 0, bind = 1},--转转箱
			{ type = 0, id =4649, count = 1, strong = 0,quality = 0, bind = 1},--毁灭灵链
			{ type = 0, id =4650, count = 1, strong = 0,quality = 0, bind = 1},--毁灭灵镯
			{ type = 0, id =4654, count = 1, strong = 0,quality = 0, bind = 1},--羽毛
			{ type = 0, id =4658, count = 1, strong = 0,quality = 0, bind = 1},--毁灭灵带
			{ type = 0, id =6223, count = 1, strong = 0,quality = 0, bind = 1},--烈焰火之魂
			{ type = 0, id =6224, count = 1, strong = 0,quality = 0, bind = 1},--金轮仙之魂
			{ type = 0, id =6225, count = 1, strong = 0,quality = 0, bind = 1},--蓝魅影之魂
			{ type = 0, id =6226, count = 1, strong = 0,quality = 0, bind = 1},--火炎焱之魂

			},
		},
  --       --12
		{
			fubenId = 115,
			bossId = 788,--怪物id
			fubenName = "黄金BOSS",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 6888},
			buyTimesConsume2 = {type = 15, count = 12888},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =4672, count = 1, strong = 0,quality = 0, bind = 1},--冲天战盔
			{ type = 0, id =4676, count = 1, strong = 0,quality = 0, bind = 1},--冲天战链
			{ type = 0, id =4677, count = 1, strong = 0,quality = 0, bind = 1},--冲天魔腕
			{ type = 0, id =4681, count = 1, strong = 0,quality = 0, bind = 1},--冲天魔戒
			{ type = 0, id =4685, count = 1, strong = 0,quality = 0, bind = 1},--冲天道带
			{ type = 0, id =7157, count = 1, strong = 0,quality = 0, bind = 1},--大鹏展翅之魂
			{ type = 0, id =7158, count = 1, strong = 0,quality = 0, bind = 1},--蓝灵羽翼之魂
			{ type = 0, id =7159, count = 1, strong = 0,quality = 0, bind = 1},--孔雀灵羽之魂
			{ type = 0, id =7160, count = 1, strong = 0,quality = 0, bind = 1},--飞龍在天之魂


			},
		},


{
			fubenId = 183,
			bossId = 1290,--怪物id
			fubenName = "黄铜宝鉴",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 200},
			buyTimesConsume2 = {type = 15, count = 500},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =4618, count = 1, strong = 0,quality = 0, bind = 1},--上古开山
			{ type = 0, id =4627, count = 1, strong = 0,quality = 0, bind = 1},--上古拂尘
			{ type = 0, id =4636, count = 1, strong = 0,quality = 0, bind = 1},--上古霹雷
			{ type = 0, id =4621, count = 1, strong = 0,quality = 0, bind = 1},--上古战盔
			{ type = 0, id =4622, count = 1, strong = 0,quality = 0, bind = 1},--上古战链
			{ type = 0, id =4630, count = 1, strong = 0,quality = 0, bind = 1},--上古法盔
			{ type = 0, id =4639, count = 1, strong = 0,quality = 0, bind = 1},--上古道盔
			{ type = 0, id =6709, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘宝鉴
			{ type = 0, id =6704, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘碎片


			},
		},


{
			fubenId = 184,
			bossId = 1291,--怪物id
			fubenName = "白银宝鉴",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 300},
			buyTimesConsume2 = {type = 15, count = 600},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =4645, count = 1, strong = 0,quality = 0, bind = 1},--起源战刃
			{ type = 0, id =4646, count = 1, strong = 0,quality = 0, bind = 1},--起源战甲(男)
			{ type = 0, id =4650, count = 1, strong = 0,quality = 0, bind = 1},--起源战镯
			{ type = 0, id =4654, count = 1, strong = 0,quality = 0, bind = 1},--起源法剑
			{ type = 0, id =4655, count = 1, strong = 0,quality = 0, bind = 1},--起源魔袍(女)
			{ type = 0, id =4663, count = 1, strong = 0,quality = 0, bind = 1},--起源道剑
			{ type = 0, id =4664, count = 1, strong = 0,quality = 0, bind = 1},--起源道衣(男)
			{ type = 0, id =6709, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘宝鉴
			{ type = 0, id =6710, count = 1, strong = 0,quality = 0, bind = 1},--五彩宝鉴

			},
		},


{
			fubenId = 185,
			bossId = 1292,--怪物id
			fubenName = "白银宝鉴",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 400},
			buyTimesConsume2 = {type = 15, count = 700},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =4672, count = 1, strong = 0,quality = 0, bind = 1},--誓言星王
			{ type = 0, id =4673, count = 1, strong = 0,quality = 0, bind = 1},--誓言战甲(男)
			{ type = 0, id =4681, count = 1, strong = 0,quality = 0, bind = 1},--誓言血饮
			{ type = 0, id =4683, count = 1, strong = 0,quality = 0, bind = 1},--誓言魔袍(女)
			{ type = 0, id =4690, count = 1, strong = 0,quality = 0, bind = 1},--誓言天玑
			{ type = 0, id =4691, count = 1, strong = 0,quality = 0, bind = 1},--誓言道衣(男)
			{ type = 0, id =6709, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘宝鉴
			{ type = 0, id =6710, count = 1, strong = 0,quality = 0, bind = 1},--五彩宝鉴
			{ type = 0, id =6711, count = 1, strong = 0,quality = 0, bind = 1},--晶莹宝鉴


			},
		},

{
			fubenId = 186,
			bossId = 1293,--怪物id
			fubenName = "黄金宝鉴",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 500},
			buyTimesConsume2 = {type = 15, count = 800},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =87, count = 1, strong = 0,quality = 0, bind = 1},--冲天战刃
			{ type = 0, id =88, count = 1, strong = 0,quality = 0, bind = 1},--冲天战甲(男)
			{ type = 0, id =96, count = 1, strong = 0,quality = 0, bind = 1},--冲天魔杖
			{ type = 0, id =98, count = 1, strong = 0,quality = 0, bind = 1},--冲天魔袍(女)
			{ type = 0, id =105, count = 1, strong = 0,quality = 0, bind = 1},--冲天道剑
			{ type = 0, id =6709, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘宝鉴
			{ type = 0, id =6710, count = 1, strong = 0,quality = 0, bind = 1},--五彩宝鉴
			{ type = 0, id =6711, count = 1, strong = 0,quality = 0, bind = 1},--晶莹宝鉴
			{ type = 0, id =6712, count = 1, strong = 0,quality = 0, bind = 1},--曙光宝鉴


			},
		},

{
			fubenId = 187,
			bossId = 1294,--怪物id
			fubenName = "黄金宝鉴",
			fubenBg = 1,
			-- 前端显示用（1:经验；2：金币；3：装备；）
			fubenType = 1,
			-- 进入副本需要传送令多少个（不配则不需要）
			needItem = {{id = 678, count = 0}},
			-- 进入副本的等级
			needLevel = 80,
			isCanBuyTimes = true,--可以买
			-- 购买次数消耗
			buyTimesConsume = {type = 15, count = 600},
			buyTimesConsume2 = {type = 15, count = 900},
			-- 购买次数限制（-1则不限）
			buyTimesLimit = 2,
			desc = Lang.ScriptTips.fb00006,
			-- 领取双倍奖励消耗
			doubleConsume = {type = 15,id = 0, count = 58},
			-- 奖励
			num = 1,
			award = 
			{
			   {type = 0, id = 0, count = 1800000}, 	-- 经验
			},
			drops =
			{


			{ type = 0, id =114, count = 1, strong = 0,quality = 0, bind = 1},--菩提彻地斩
			{ type = 0, id =115, count = 1, strong = 0,quality = 0, bind = 1},--菩提战狂甲(男)
			{ type = 0, id =123, count = 1, strong = 0,quality = 0, bind = 1},--菩提骷髅杖
			{ type = 0, id =132, count = 1, strong = 0,quality = 0, bind = 1},--菩提金纹剑
			{ type = 0, id =6709, count = 1, strong = 0,quality = 0, bind = 1},--蒙尘宝鉴
			{ type = 0, id =6710, count = 1, strong = 0,quality = 0, bind = 1},--五彩宝鉴
			{ type = 0, id =6711, count = 1, strong = 0,quality = 0, bind = 1},--晶莹宝鉴
			{ type = 0, id =6712, count = 1, strong = 0,quality = 0, bind = 1},--曙光宝鉴
			{ type = 0, id =6713, count = 1, strong = 0,quality = 0, bind = 1},--梦幻宝鉴


			},
		},

---配置这里不能穿插在中间，只能往下加
	



  --       -- 13
		-- {
		-- 	fubenId = 26,
		-- 	bossId = 574,--怪物id
		-- 	fubenName = "蛮荒大教皇",
		-- 	fubenBg = 1,
		-- 	-- 前端显示用（1:经验；2：金币；3：装备；）
		-- 	fubenType = 1,
		-- 	-- 进入副本需要传送令多少个（不配则不需要）
		-- 	needItem = {{id = 678, count = 1}},
		-- 	-- 进入副本的等级
		-- 	needLevel = 80,
		-- 	isCanBuyTimes = true,--可以买
		-- 	-- 购买次数消耗
		-- 	buyTimesConsume = {type = 15, count = 150},
		-- 	-- 购买次数限制（-1则不限）
		-- 	buyTimesLimit = 2,
		-- 	desc = Lang.ScriptTips.fb00006,
		-- 	-- 领取双倍奖励消耗
		-- 	doubleConsume = {type = 15,id = 0, count = 280},
		-- 	-- 奖励
		-- 				num = 16,
		-- 	award = 
		-- 	{
		-- 	   {type = 0, id = 0, count = 500000}, 	-- 经验
		-- 	},
		-- 	drops =
		-- 	{
		-- 	  { type = 0, id = 328, count = 1, strong = 0,quality = 0, bind = 1},--1转战士武器
		-- 	   { type = 0, id = 329, count = 1, strong = 0,quality = 0, bind = 1},--1转法师武器
		-- 	   { type = 0, id = 330, count = 1, strong = 0,quality = 0, bind = 1},--1转道士武器
		-- 	   { type = 0, id = 331, count = 1, strong = 0,quality = 0, bind = 1},--2转战盔
		-- 	   { type = 0, id = 332, count = 1, strong = 0,quality = 0, bind = 1},--2转魔链
		-- 	   { type = 0, id = 333, count = 1, strong = 0,quality = 0, bind = 1},--2转道镯
		-- 	   { type = 0, id = 334, count = 1, strong = 0,quality = 0, bind = 1},--2转战戒
		-- 	   { type = 0, id = 335, count = 1, strong = 0,quality = 0, bind = 1},--2转道带
		-- 	   { type = 0, id = 336, count = 1, strong = 0,quality = 0, bind = 1},--2转魔靴
		-- 	},
		-- },
	},
}
