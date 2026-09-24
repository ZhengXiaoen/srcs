-- 战灵配置
spirit_fighter_cfg = {

-- 装备槽位
slots = {
--#include "spirit_fighter_slot_1.lua"
--#include "spirit_fighter_slot_2.lua"
--#include "spirit_fighter_slot_3.lua"
--#include "spirit_fighter_slot_4.lua"
},
	
-- 战灵潜能配置
--#include "spirit_fighter_energy.lua"

	-- 装备套装属性
	equipSuits = {
		{
        level = 1,
        attrs = 
        {
            {type=9,value=180,job=1,},--最小物攻
            {type=11,value=480,job=1,},--最大物攻
            {type=13,value=180,job=2,},--最小法攻
            {type=15,value=480,job=2,},--最大法攻
            {type=17,value=180,job=3,},--最小道攻
            {type=19,value=480,job=3,},--最大道攻
            {type=5,value=2880,job=0,},--生命值
            {type=178,value=2000,job=0,},--减少受合击伤害比
            {type=179,value=2588,job=0,},--减少受合击固定伤害
        },
    },

    {
        level = 5,
        attrs = 
        {
            {type=9,value=1480,job=1,},--最小物攻
            {type=11,value=2800,job=1,},--最大物攻
            {type=13,value=1480,job=2,},--最小法攻
            {type=15,value=2800,job=2,},--最大法攻
            {type=17,value=1480,job=3,},--最小道攻
            {type=19,value=2800,job=3,},--最大道攻
            {type=5,value=16800,job=0,},--生命值
            {type=178,value=4000,job=0,},--减少受合击伤害比
            {type=179,value=12888,job=0,},--减少受合击固定伤害
        },
    },

    {
        level = 10,
        attrs = 
        {
            {type=9,value=2680,job=1,},--最小物攻
            {type=11,value=5800,job=1,},--最大物攻
            {type=13,value=2680,job=2,},--最小法攻
            {type=15,value=5800,job=2,},--最大法攻
            {type=17,value=2680,job=3,},--最小道攻
            {type=19,value=5800,job=3,},--最大道攻
            {type=5,value=34800,job=0,},--生命值
            {type=178,value=6000,job=0,},--减少受合击伤害比
            {type=179,value=25888,job=0,},--减少受合击固定伤害
        },
    },

    {
        level = 15,
        attrs = 
        {
            {type=9,value=3880,job=1,},--最小物攻
            {type=11,value=9800,job=1,},--最大物攻
            {type=13,value=3880,job=2,},--最小法攻
            {type=15,value=9800,job=2,},--最大法攻
            {type=17,value=3880,job=3,},--最小道攻
            {type=19,value=9800,job=3,},--最大道攻
            {type=5,value=58800,job=0,},--生命值
            {type=178,value=8000,job=0,},--减少受合击伤害比
            {type=179,value=39888,job=0,},--减少受合击固定伤害
        },
    },

    {
        level = 20,
        attrs = 
        {
            {type=9,value=5380,job=1,},--最小物攻
            {type=11,value=14800,job=1,},--最大物攻
            {type=13,value=5380,job=2,},--最小法攻
            {type=15,value=14800,job=2,},--最大法攻
            {type=17,value=5380,job=3,},--最小道攻
            {type=19,value=14800,job=3,},--最大道攻
            {type=5,value=88800,job=0,},--生命值
            {type=178,value=10000,job=0,},--减少受合击伤害比
            {type=179,value=56888,job=0,},--减少受合击固定伤害
        },
    },

    {
        level = 25,
        attrs = 
        {
            {type=9,value=7080,job=1,},--最小物攻
            {type=11,value=20800,job=1,},--最大物攻
            {type=13,value=7080,job=2,},--最小法攻
            {type=15,value=20800,job=2,},--最大法攻
            {type=17,value=7080,job=3,},--最小道攻
            {type=19,value=20800,job=3,},--最大道攻
            {type=5,value=124800,job=0,},--生命值
            {type=178,value=15000,job=0,},--减少受合击伤害比
            {type=179,value=78888,job=0,},--减少受合击固定伤害
        },
    },
},

	-- 战灵等级
	levels =
    { 
	               --1级
                 {
                    consume = { {type = 0, id = 7052, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵1阶1星",
                    attrs = 
                    {
                       {type=9,value=90,job=1,},--最小物攻
                       {type=11,value=300,job=1,},--最大物攻
                       {type=13,value=90,job=2,},--最小法攻
                       {type=15,value=300,job=2,},--最大法攻
                       {type=17,value=90,job=3,},--最小道攻
                       {type=19,value=300,job=3,},--最大道攻
                       {type=5,value=930,job=0,},--生命值
                       {type=174,value=2000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=4000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=60,job=0,},--暴击几率
                       {type=129,value=90,job=0,},--暴击伤害
                    },
                 },
               --2级
                 {
                    consume = { {type = 0, id = 7052, count = 7}, }, -- 升到该级所需消耗
                    name ="战灵1阶2星",
                    attrs = 
                    {
                       {type=9,value=389,job=1,},--最小物攻
                       {type=11,value=1298,job=1,},--最大物攻
                       {type=13,value=389,job=2,},--最小法攻
                       {type=15,value=1298,job=2,},--最大法攻
                       {type=17,value=389,job=3,},--最小道攻
                       {type=19,value=1298,job=3,},--最大道攻
                       {type=5,value=4022,job=0,},--生命值
                       {type=174,value=4000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=8000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=120,job=0,},--暴击几率
                       {type=129,value=158,job=0,},--暴击伤害
                    },
                 },
               --3级
                 {
                    consume = { {type = 0, id = 7052, count = 11}, }, -- 升到该级所需消耗
                    name ="战灵1阶3星",
                    attrs = 
                    {
                       {type=9,value=835,job=1,},--最小物攻
                       {type=11,value=2782,job=1,},--最大物攻
                       {type=13,value=835,job=2,},--最小法攻
                       {type=15,value=2782,job=2,},--最大法攻
                       {type=17,value=835,job=3,},--最小道攻
                       {type=19,value=2782,job=3,},--最大道攻
                       {type=5,value=8626,job=0,},--生命值
                       {type=174,value=6000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=12000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=180,job=0,},--暴击几率
                       {type=129,value=388,job=0,},--暴击伤害
                    },
                 },
               --4级
                 {
                    consume = { {type = 0, id = 7052, count = 15}, }, -- 升到该级所需消耗
                    name ="战灵1阶4星",
                    attrs = 
                    {
                       {type=9,value=1409,job=1,},--最小物攻
                       {type=11,value=4695,job=1,},--最大物攻
                       {type=13,value=1409,job=2,},--最小法攻
                       {type=15,value=4695,job=2,},--最大法攻
                       {type=17,value=1409,job=3,},--最小道攻
                       {type=19,value=4695,job=3,},--最大道攻
                       {type=5,value=14555,job=0,},--生命值
                       {type=174,value=8000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=16000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=240,job=0,},--暴击几率
                       {type=129,value=688,job=0,},--暴击伤害
                    },
                 },
               --5级
                 {
                    consume = { {type = 0, id = 7052, count = 20}, }, -- 升到该级所需消耗
                    name ="战灵1阶5星",
                    attrs = 
                    {
                       {type=9,value=2129,job=1,},--最小物攻
                       {type=11,value=7095,job=1,},--最大物攻
                       {type=13,value=2129,job=2,},--最小法攻
                       {type=15,value=7095,job=2,},--最大法攻
                       {type=17,value=2129,job=3,},--最小道攻
                       {type=19,value=7095,job=3,},--最大道攻
                       {type=5,value=21995,job=0,},--生命值
                       {type=174,value=10000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=20000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=300,job=0,},--暴击几率
                       {type=129,value=988,job=0,},--暴击伤害
                    },
                 },
               --6级
                 {
                    consume = { {type = 0, id = 7053, count = 7}, }, -- 升到该级所需消耗
                    name ="战灵2阶1星",
                    attrs = 
                    {
                       {type=9,value=2837,job=1,},--最小物攻
                       {type=11,value=9457,job=1,},--最大物攻
                       {type=13,value=2837,job=2,},--最小法攻
                       {type=15,value=9457,job=2,},--最大法攻
                       {type=17,value=2837,job=3,},--最小道攻
                       {type=19,value=9457,job=3,},--最大道攻
                       {type=5,value=29318,job=0,},--生命值
                       {type=174,value=12000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=24000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=360,job=0,},--暴击几率
                       {type=129,value=1488,job=0,},--暴击伤害
                    },
                 },
               --7级
                 {
                    consume = { {type = 0, id = 7053, count = 8}, }, -- 升到该级所需消耗
                    name ="战灵2阶2星",
                    attrs = 
                    {
                       {type=9,value=3593,job=1,},--最小物攻
                       {type=11,value=11977,job=1,},--最大物攻
                       {type=13,value=3593,job=2,},--最小法攻
                       {type=15,value=11977,job=2,},--最大法攻
                       {type=17,value=3593,job=3,},--最小道攻
                       {type=19,value=11977,job=3,},--最大道攻
                       {type=5,value=37130,job=0,},--生命值
                       {type=174,value=14000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=28000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=420,job=0,},--暴击几率
                       {type=129,value=1988,job=0,},--暴击伤害
                    },
                 },
               --8级
                 {
                    consume = { {type = 0, id = 7053, count = 9}, }, -- 升到该级所需消耗
                    name ="战灵2阶3星",
                    attrs = 
                    {
                       {type=9,value=4383,job=1,},--最小物攻
                       {type=11,value=14610,job=1,},--最大物攻
                       {type=13,value=4383,job=2,},--最小法攻
                       {type=15,value=14610,job=2,},--最大法攻
                       {type=17,value=4383,job=3,},--最小道攻
                       {type=19,value=14610,job=3,},--最大道攻
                       {type=5,value=45291,job=0,},--生命值
                       {type=174,value=16000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=32000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=480,job=0,},--暴击几率
                       {type=129,value=2488,job=0,},--暴击伤害
                    },
                 },
               --9级
                 {
                    consume = { {type = 0, id = 7053, count = 10}, }, -- 升到该级所需消耗
                    name ="战灵2阶4星",
                    attrs = 
                    {
                       {type=9,value=5193,job=1,},--最小物攻
                       {type=11,value=17310,job=1,},--最大物攻
                       {type=13,value=5193,job=2,},--最小法攻
                       {type=15,value=17310,job=2,},--最大法攻
                       {type=17,value=5193,job=3,},--最小道攻
                       {type=19,value=17310,job=3,},--最大道攻
                       {type=5,value=53661,job=0,},--生命值
                       {type=174,value=18000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=36000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=540,job=0,},--暴击几率
                       {type=129,value=3158,job=0,},--暴击伤害
                    },
                 },
               --10级
                 {
                    consume = { {type = 0, id = 7053, count = 11}, }, -- 升到该级所需消耗
                    name ="战灵2阶5星",
                    attrs = 
                    {
                       {type=9,value=6010,job=1,},--最小物攻
                       {type=11,value=20032,job=1,},--最大物攻
                       {type=13,value=6010,job=2,},--最小法攻
                       {type=15,value=20032,job=2,},--最大法攻
                       {type=17,value=6010,job=3,},--最小道攻
                       {type=19,value=20032,job=3,},--最大道攻
                       {type=5,value=62101,job=0,},--生命值
                       {type=174,value=20000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=40000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=600,job=0,},--暴击几率
                       {type=129,value=4180,job=0,},--暴击伤害
                    },
                 },
               --11级
                 {
                    consume = { {type = 0, id = 7054, count = 4}, }, -- 升到该级所需消耗
                    name ="战灵3阶1星",
                    attrs = 
                    {
                       {type=9,value=6820,job=1,},--最小物攻
                       {type=11,value=22732,job=1,},--最大物攻
                       {type=13,value=6820,job=2,},--最小法攻
                       {type=15,value=22732,job=2,},--最大法攻
                       {type=17,value=6820,job=3,},--最小道攻
                       {type=19,value=22732,job=3,},--最大道攻
                       {type=5,value=70471,job=0,},--生命值
                       {type=174,value=22000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=44000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=660,job=0,},--暴击几率
                       {type=129,value=4980,job=0,},--暴击伤害
                    },
                 },
               --12级
                 {
                    consume = { {type = 0, id = 7054, count = 5}, }, -- 升到该级所需消耗
                    name ="战灵3阶2星",
                    attrs = 
                    {
                       {type=9,value=7731,job=1,},--最小物攻
                       {type=11,value=25770,job=1,},--最大物攻
                       {type=13,value=7731,job=2,},--最小法攻
                       {type=15,value=25770,job=2,},--最大法攻
                       {type=17,value=7731,job=3,},--最小道攻
                       {type=19,value=25770,job=3,},--最大道攻
                       {type=5,value=79887,job=0,},--生命值
                       {type=174,value=24000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=48000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=720,job=0,},--暴击几率
                       {type=129,value=6180,job=0,},--暴击伤害
                    },
                 },
               --13级
                 {
                    consume = { {type = 0, id = 7054, count = 6}, }, -- 升到该级所需消耗
                    name ="战灵3阶3星",
                    attrs = 
                    {
                       {type=9,value=8703,job=1,},--最小物攻
                       {type=11,value=29010,job=1,},--最大物攻
                       {type=13,value=8703,job=2,},--最小法攻
                       {type=15,value=29010,job=2,},--最大法攻
                       {type=17,value=8703,job=3,},--最小道攻
                       {type=19,value=29010,job=3,},--最大道攻
                       {type=5,value=89931,job=0,},--生命值
                       {type=174,value=26000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=52000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=780,job=0,},--暴击几率
                       {type=129,value=7780,job=0,},--暴击伤害
                    },
                 },
               --14级
                 {
                    consume = { {type = 0, id = 7054, count = 7}, }, -- 升到该级所需消耗
                    name ="战灵3阶4星",
                    attrs = 
                    {
                       {type=9,value=9695,job=1,},--最小物攻
                       {type=11,value=32317,job=1,},--最大物攻
                       {type=13,value=9695,job=2,},--最小法攻
                       {type=15,value=32317,job=2,},--最大法攻
                       {type=17,value=9695,job=3,},--最小道攻
                       {type=19,value=32317,job=3,},--最大道攻
                       {type=5,value=100184,job=0,},--生命值
                       {type=174,value=28000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=56000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=840,job=0,},--暴击几率
                       {type=129,value=9880,job=0,},--暴击伤害
                    },
                 },
               --15级
                 {
                    consume = { {type = 0, id = 7054, count = 8}, }, -- 升到该级所需消耗
                    name ="战灵3阶5星",
                    attrs = 
                    {
                       {type=9,value=10667,job=1,},--最小物攻
                       {type=11,value=35557,job=1,},--最大物攻
                       {type=13,value=10667,job=2,},--最小法攻
                       {type=15,value=35557,job=2,},--最大法攻
                       {type=17,value=10667,job=3,},--最小道攻
                       {type=19,value=35557,job=3,},--最大道攻
                       {type=5,value=110228,job=0,},--生命值
                       {type=174,value=30000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=60000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=900,job=0,},--暴击几率
                       {type=129,value=12800,job=0,},--暴击伤害
                    },
                 },
               --16级
                 {
                    consume = { {type = 0, id = 7055, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵4阶1星",
                    attrs = 
                    {
                       {type=9,value=11761,job=1,},--最小物攻
                       {type=11,value=39202,job=1,},--最大物攻
                       {type=13,value=11761,job=2,},--最小法攻
                       {type=15,value=39202,job=2,},--最大法攻
                       {type=17,value=11761,job=3,},--最小道攻
                       {type=19,value=39202,job=3,},--最大道攻
                       {type=5,value=121528,job=0,},--生命值
                       {type=174,value=32000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=64000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=960,job=0,},--暴击几率
                       {type=129,value=15800,job=0,},--暴击伤害
                    },
                 },
               --17级
                 {
                    consume = { {type = 0, id = 7055, count = 4}, }, -- 升到该级所需消耗
                    name ="战灵4阶2星",
                    attrs = 
                    {
                       {type=9,value=13219,job=1,},--最小物攻
                       {type=11,value=44062,job=1,},--最大物攻
                       {type=13,value=13219,job=2,},--最小法攻
                       {type=15,value=44062,job=2,},--最大法攻
                       {type=17,value=13219,job=3,},--最小道攻
                       {type=19,value=44062,job=3,},--最大道攻
                       {type=5,value=136594,job=0,},--生命值
                       {type=174,value=34000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=68000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1020,job=0,},--暴击几率
                       {type=129,value=19800,job=0,},--暴击伤害
                    },
                 },
               --18级
                 {
                    consume = { {type = 0, id = 7055, count = 5}, }, -- 升到该级所需消耗
                    name ="战灵4阶3星",
                    attrs = 
                    {
                       {type=9,value=15041,job=1,},--最小物攻
                       {type=11,value=50137,job=1,},--最大物攻
                       {type=13,value=15041,job=2,},--最小法攻
                       {type=15,value=50137,job=2,},--最大法攻
                       {type=17,value=15041,job=3,},--最小道攻
                       {type=19,value=50137,job=3,},--最大道攻
                       {type=5,value=155426,job=0,},--生命值
                       {type=174,value=36000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=72000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1080,job=0,},--暴击几率
                       {type=129,value=25800,job=0,},--暴击伤害
                    },
                 },
               --19级
                 {
                    consume = { {type = 0, id = 7055, count = 6}, }, -- 升到该级所需消耗
                    name ="战灵4阶4星",
                    attrs = 
                    {
                       {type=9,value=17228,job=1,},--最小物攻
                       {type=11,value=57427,job=1,},--最大物攻
                       {type=13,value=17228,job=2,},--最小法攻
                       {type=15,value=57427,job=2,},--最大法攻
                       {type=17,value=17228,job=3,},--最小道攻
                       {type=19,value=57427,job=3,},--最大道攻
                       {type=5,value=178025,job=0,},--生命值
                       {type=174,value=38000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=76000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1140,job=0,},--暴击几率
                       {type=129,value=32800,job=0,},--暴击伤害
                    },
                 },
               --20级
                 {
                    consume = { {type = 0, id = 7055, count = 7}, }, -- 升到该级所需消耗
                    name ="战灵4阶5星",
                    attrs = 
                    {
                       {type=9,value=19780,job=1,},--最小物攻
                       {type=11,value=65932,job=1,},--最大物攻
                       {type=13,value=19780,job=2,},--最小法攻
                       {type=15,value=65932,job=2,},--最大法攻
                       {type=17,value=19780,job=3,},--最小道攻
                       {type=19,value=65932,job=3,},--最大道攻
                       {type=5,value=204391,job=0,},--生命值
                       {type=174,value=40000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=80000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1200,job=0,},--暴击几率
                       {type=129,value=42800,job=0,},--暴击伤害
                    },
                 },
               --21级
                 {
                    consume = { {type = 0, id = 7056, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵5阶1星",
                    attrs = 
                    {
                       {type=9,value=22514,job=1,},--最小物攻
                       {type=11,value=75045,job=1,},--最大物攻
                       {type=13,value=22514,job=2,},--最小法攻
                       {type=15,value=75045,job=2,},--最大法攻
                       {type=17,value=22514,job=3,},--最小道攻
                       {type=19,value=75045,job=3,},--最大道攻
                       {type=5,value=232640,job=0,},--生命值
                       {type=174,value=42000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=84000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1260,job=0,},--暴击几率
                       {type=129,value=56800,job=0,},--暴击伤害
                    },
                 },
               --22级
                 {
                    consume = { {type = 0, id = 7056, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵5阶2星",
                    attrs = 
                    {
                       {type=9,value=25247,job=1,},--最小物攻
                       {type=11,value=84157,job=1,},--最大物攻
                       {type=13,value=25247,job=2,},--最小法攻
                       {type=15,value=84157,job=2,},--最大法攻
                       {type=17,value=25247,job=3,},--最小道攻
                       {type=19,value=84157,job=3,},--最大道攻
                       {type=5,value=260888,job=0,},--生命值
                       {type=174,value=44000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=88000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1320,job=0,},--暴击几率
                       {type=129,value=75800,job=0,},--暴击伤害
                    },
                 },
               --23级
                 {
                    consume = { {type = 0, id = 7056, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵5阶3星",
                    attrs = 
                    {
                       {type=9,value=27981,job=1,},--最小物攻
                       {type=11,value=93270,job=1,},--最大物攻
                       {type=13,value=27981,job=2,},--最小法攻
                       {type=15,value=93270,job=2,},--最大法攻
                       {type=17,value=27981,job=3,},--最小道攻
                       {type=19,value=93270,job=3,},--最大道攻
                       {type=5,value=289137,job=0,},--生命值
                       {type=174,value=46000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=92000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1380,job=0,},--暴击几率
                       {type=129,value=95800,job=0,},--暴击伤害
                    },
                 },
               --24级
                 {
                    consume = { {type = 0, id = 7056, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵5阶4星",
                    attrs = 
                    {
                       {type=9,value=30715,job=1,},--最小物攻
                       {type=11,value=102382,job=1,},--最大物攻
                       {type=13,value=30715,job=2,},--最小法攻
                       {type=15,value=102382,job=2,},--最大法攻
                       {type=17,value=30715,job=3,},--最小道攻
                       {type=19,value=102382,job=3,},--最大道攻
                       {type=5,value=317386,job=0,},--生命值
                       {type=174,value=48000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=96000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1440,job=0,},--暴击几率
                       {type=129,value=128000,job=0,},--暴击伤害
                    },
                 },
               --25级
                 {
                    consume = { {type = 0, id = 7056, count = 3}, }, -- 升到该级所需消耗
                    name ="战灵5阶5星",
                    attrs = 
                    {
                       {type=9,value=33449,job=1,},--最小物攻
                       {type=11,value=111495,job=1,},--最大物攻
                       {type=13,value=33449,job=2,},--最小法攻
                       {type=15,value=111495,job=2,},--最大法攻
                       {type=17,value=33449,job=3,},--最小道攻
                       {type=19,value=111495,job=3,},--最大道攻
                       {type=5,value=345635,job=0,},--生命值
                       {type=174,value=50000,job=0,},--对人物造成伤害 万分比
                       {type=176,value=100000,job=0,},--对怪物造成伤害 万分比
                       {type=128,value=1500,job=0,},--暴击几率
                       {type=129,value=158000,job=0,},--暴击伤害
                    },
                 },



	},
	
}