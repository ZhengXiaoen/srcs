
-- conditions 条件类型 参考 data/function/Activity/AwardConditions.lua

-- 征途配置
warpath_cfg = {

path = {
	-- 60 级开始 -----------------------------------------------------
	{
		level = 60,
		--conditions = {{type=4, params = {2}}}, -- 条件列表
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=1,},
			{type=11,value=5,},
			{type=13,value=1,},
			{type=15,value=5,},
			{type=17,value=1,},
			{type=19,value=5,},
			{type=21,value=1,},
			{type=23,value=3,},
			{type=25,value=1,},
			{type=27,value=2,},
		},
	},
	{
		level = 61,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = 5, --负1表示不做功能开启提示
		openFunctionName = "护送皇杠", --功能开启名字
		attrs = {
			{type=9,value=3,},
			{type=11,value=15,},
			{type=13,value=3,},
			{type=15,value=15,},
			{type=17,value=3,},
			{type=19,value=15,},
			{type=21,value=4,},
			{type=23,value=9,},
			{type=25,value=4,},
			{type=27,value=7,},
		},
	},
	{
		level = 62,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=5,},
			{type=11,value=25,},
			{type=13,value=5,},
			{type=15,value=25,},
			{type=17,value=5,},
			{type=19,value=25,},
			{type=21,value=6,},
			{type=23,value=15,},
			{type=25,value=6,},
			{type=27,value=12,},
		},
	},
	{
		level = 63,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=7,},
			{type=11,value=35,},
			{type=13,value=7,},
			{type=15,value=35,},
			{type=17,value=7,},
			{type=19,value=35,},
			{type=21,value=8,},
			{type=23,value=21,},
			{type=25,value=9,},
			{type=27,value=17,},
		},
	},
	{
		level = 64,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=9,},
			{type=11,value=45,},
			{type=13,value=9,},
			{type=15,value=45,},
			{type=17,value=9,},
			{type=19,value=45,},
			{type=21,value=11,},
			{type=23,value=27,},
			{type=25,value=11,},
			{type=27,value=22,},
		},
	},
	{
		level = 65,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=11,},
			{type=11,value=55,},
			{type=13,value=11,},
			{type=15,value=55,},
			{type=17,value=11,},
			{type=19,value=55,},
			{type=21,value=13,},
			{type=23,value=33,},
			{type=25,value=13,},
			{type=27,value=26,},
		},
	},
	{
		level = 66,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = 6, --负1表示不做功能开启提示
		openFunctionName = "环式任务", --功能开启名字
		attrs = {
			{type=9,value=13,},
			{type=11,value=65,},
			{type=13,value=13,},
			{type=15,value=65,},
			{type=17,value=13,},
			{type=19,value=65,},
			{type=21,value=16,},
			{type=23,value=39,},
			{type=25,value=16,},
			{type=27,value=31,},
		},
	},
	{
		level = 67,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=15,},
			{type=11,value=75,},
			{type=13,value=15,},
			{type=15,value=75,},
			{type=17,value=15,},
			{type=19,value=75,},
			{type=21,value=18,},
			{type=23,value=45,},
			{type=25,value=18,},
			{type=27,value=36,},
		},
	},
	{
		level = 68,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = 12, --负1表示不做功能开启提示
		openFunctionName = "支线任务", --功能开启名字
		attrs = {
			{type=9,value=17,},
			{type=11,value=85,},
			{type=13,value=17,},
			{type=15,value=85,},
			{type=17,value=17,},
			{type=19,value=85,},
			{type=21,value=20,},
			{type=23,value=51,},
			{type=25,value=21,},
			{type=27,value=41,},
		},
	},
	{
		level = 69,
		consume = {{type = 5,count = 200000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 10000, -- 成功率(万分比)
		bigIcon = 4, --负1表示不做功能开启提示
		openFunctionName = "个人BOSS", --功能开启名字
		attrs = {
			{type=9,value=19,},
			{type=11,value=95,},
			{type=13,value=19,},
			{type=15,value=95,},
			{type=17,value=19,},
			{type=19,value=95,},
			{type=21,value=23,},
			{type=23,value=57,},
			{type=25,value=23,},
			{type=27,value=46,},
		},
	},
	-- 70 级开始 -----------------------------------------------------
	{
		level = 70,
		consume = {{type = 5,count = 300000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = 8, --负1表示不做功能开启提示
		openFunctionName = "经验塔防", --功能开启名字
		attrs = {
			{type=9,value=23,},
			{type=11,value=115,},
			{type=13,value=23,},
			{type=15,value=115,},
			{type=17,value=23,},
			{type=19,value=115,},
			{type=21,value=28,},
			{type=23,value=69,},
			{type=25,value=28,},
			{type=27,value=55,},
		},
	},
	{
		level = 71,
		--conditions = {},
		consume = {{type = 5,count = 300000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=27,},
			{type=11,value=135,},
			{type=13,value=27,},
			{type=15,value=135,},
			{type=17,value=27,},
			{type=19,value=135,},
			{type=21,value=32,},
			{type=23,value=81,},
			{type=25,value=33,},
			{type=27,value=65,},
		},
	},
	{
		level = 72,
		--conditions = {},
		consume = {{type = 5,count = 300000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = 13, --负1表示不做功能开启提示
		openFunctionName = "宝石系统", --功能开启名字
		attrs = {
			{type=9,value=31,},
			{type=11,value=155,},
			{type=13,value=31,},
			{type=15,value=155,},
			{type=17,value=31,},
			{type=19,value=155,},
			{type=21,value=37,},
			{type=23,value=93,},
			{type=25,value=37,},
			{type=27,value=74,},
		},
	},
	{
		level = 73,
		--conditions = {},
		consume = {{type = 5,count = 300000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=35,},
			{type=11,value=175,},
			{type=13,value=35,},
			{type=15,value=175,},
			{type=17,value=35,},
			{type=19,value=175,},
			{type=21,value=42,},
			{type=23,value=105,},
			{type=25,value=42,},
			{type=27,value=84,},
		},
	},
	{
		level = 74,
		--conditions = {},
		consume = {{type = 5,count = 300000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = 16, --负1表示不做功能开启提示
		openFunctionName = "富贵兽", --功能开启名字
		attrs = {
			{type=9,value=39,},
			{type=11,value=195,},
			{type=13,value=39,},
			{type=15,value=195,},
			{type=17,value=39,},
			{type=19,value=195,},
			{type=21,value=47,},
			{type=23,value=117,},
			{type=25,value=47,},
			{type=27,value=94,},
		},
	},
	{
		level = 75,
		--conditions = {},
		consume = {{type = 5,count = 400000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = 14, --负1表示不做功能开启提示
		openFunctionName = "灵珠系统", --功能开启名字
		attrs = {
			{type=9,value=43,},
			{type=11,value=215,},
			{type=13,value=43,},
			{type=15,value=215,},
			{type=17,value=43,},
			{type=19,value=215,},
			{type=21,value=52,},
			{type=23,value=129,},
			{type=25,value=52,},
			{type=27,value=103,},
		},
	},
	{
		level = 76,
		--conditions = {},
		consume = {{type = 5,count = 400000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=47,},
			{type=11,value=235,},
			{type=13,value=47,},
			{type=15,value=235,},
			{type=17,value=47,},
			{type=19,value=235,},
			{type=21,value=56,},
			{type=23,value=141,},
			{type=25,value=57,},
			{type=27,value=113,},
		},
	},
	{
		level = 77,
		--conditions = {},
		consume = {{type = 5,count = 400000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=51,},
			{type=11,value=255,},
			{type=13,value=51,},
			{type=15,value=255,},
			{type=17,value=51,},
			{type=19,value=255,},
			{type=21,value=61,},
			{type=23,value=153,},
			{type=25,value=61,},
			{type=27,value=122,},
		},
	},
	{
		level = 78,
		--conditions = {},
		consume = {{type = 5,count = 400000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = 17, --负1表示不做功能开启提示
		openFunctionName = "足迹系统", --功能开启名字
		attrs = {
			{type=9,value=55,},
			{type=11,value=275,},
			{type=13,value=55,},
			{type=15,value=275,},
			{type=17,value=55,},
			{type=19,value=275,},
			{type=21,value=66,},
			{type=23,value=165,},
			{type=25,value=66,},
			{type=27,value=132,},
		},
	},
	{
		level = 79,
		--conditions = {},
		consume = {{type = 5,count = 400000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 6000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=59,},
			{type=11,value=295,},
			{type=13,value=59,},
			{type=15,value=295,},
			{type=17,value=59,},
			{type=19,value=295,},
			{type=21,value=71,},
			{type=23,value=177,},
			{type=25,value=71,},
			{type=27,value=142,},
		},
	},
	-- 80 级开始 -----------------------------------------------------
	{
		level = 80,
		--conditions = {},
		consume = {{type = 7,count = 500}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3500, -- 成功率(万分比)
		bigIcon = 10, --负1表示不做功能开启提示
		openFunctionName = "转生系统", --功能开启名字
		attrs = {
			{type=9,value=65,},
			{type=11,value=325,},
			{type=13,value=65,},
			{type=15,value=325,},
			{type=17,value=65,},
			{type=19,value=325,},
			{type=21,value=78,},
			{type=23,value=195,},
			{type=25,value=78,},
			{type=27,value=156,},
		},
	},
	{
		level = 81,
		--conditions = {},
		consume = {{type = 7,count = 500}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3500, -- 成功率(万分比)
		bigIcon = 20, --负1表示不做功能开启提示
		openFunctionName = "天神之力", --功能开启名字
		attrs = {
			{type=9,value=71,},
			{type=11,value=355,},
			{type=13,value=71,},
			{type=15,value=355,},
			{type=17,value=71,},
			{type=19,value=355,},
			{type=21,value=85,},
			{type=23,value=213,},
			{type=25,value=85,},
			{type=27,value=170,},
		},
	},
	{
		level = 82,
		--conditions = {},
		consume = {{type = 7,count = 500}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=77,},
			{type=11,value=385,},
			{type=13,value=77,},
			{type=15,value=385,},
			{type=17,value=77,},
			{type=19,value=385,},
			{type=21,value=92,},
			{type=23,value=231,},
			{type=25,value=93,},
			{type=27,value=185,},
		},
	},
	{
		level = 83,
		--conditions = {},
		consume = {{type = 7,count = 500}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3500, -- 成功率(万分比)
		bigIcon = 18, --负1表示不做功能开启提示
		openFunctionName = "潜能系统", --功能开启名字
		attrs = {
			{type=9,value=83,},
			{type=11,value=415,},
			{type=13,value=83,},
			{type=15,value=415,},
			{type=17,value=83,},
			{type=19,value=415,},
			{type=21,value=100,},
			{type=23,value=249,},
			{type=25,value=100,},
			{type=27,value=199,},
		},
	},
	{
		level = 84,
		--conditions = {},
		consume = {{type = 7,count = 500}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=89,},
			{type=11,value=445,},
			{type=13,value=89,},
			{type=15,value=445,},
			{type=17,value=89,},
			{type=19,value=445,},
			{type=21,value=107,},
			{type=23,value=267,},
			{type=25,value=107,},
			{type=27,value=214,},
		},
	},
	{
		level = 85,
		--conditions = {},
		consume = {{type = 7,count = 1000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=97,},
			{type=11,value=485,},
			{type=13,value=97,},
			{type=15,value=485,},
			{type=17,value=97,},
			{type=19,value=485,},
			{type=21,value=116,},
			{type=23,value=291,},
			{type=25,value=117,},
			{type=27,value=233,},
		},
	},
	{
		level = 86,
		--conditions = {},
		consume = {{type = 7,count = 1000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3000, -- 成功率(万分比)
		bigIcon = 19, --负1表示不做功能开启提示
		openFunctionName = "翅膀魂石", --功能开启名字
		attrs = {
			{type=9,value=105,},
			{type=11,value=525,},
			{type=13,value=105,},
			{type=15,value=525,},
			{type=17,value=105,},
			{type=19,value=525,},
			{type=21,value=126,},
			{type=23,value=315,},
			{type=25,value=126,},
			{type=27,value=252,},
		},
	},
	{
		level = 87,
		--conditions = {},
		consume = {{type = 7,count = 1000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=113,},
			{type=11,value=565,},
			{type=13,value=113,},
			{type=15,value=565,},
			{type=17,value=113,},
			{type=19,value=565,},
			{type=21,value=136,},
			{type=23,value=339,},
			{type=25,value=136,},
			{type=27,value=271,},
		},
	},
	{
		level = 88,
		--conditions = {},
		consume = {{type = 7,count = 1000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=121,},
			{type=11,value=605,},
			{type=13,value=121,},
			{type=15,value=605,},
			{type=17,value=121,},
			{type=19,value=605,},
			{type=21,value=145,},
			{type=23,value=363,},
			{type=25,value=145,},
			{type=27,value=290,},
		},
	},
	{
		level = 89,
		--conditions = {},
		consume = {{type = 7,count = 1000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 3000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=129,},
			{type=11,value=645,},
			{type=13,value=129,},
			{type=15,value=645,},
			{type=17,value=129,},
			{type=19,value=645,},
			{type=21,value=155,},
			{type=23,value=387,},
			{type=25,value=155,},
			{type=27,value=310,},
		},
	},
	-- 90 级开始 -----------------------------------------------------
	{
		level = 90,
		--conditions = {},
		consume = {{type = 7,count = 2000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=139,},
			{type=11,value=695,},
			{type=13,value=139,},
			{type=15,value=695,},
			{type=17,value=139,},
			{type=19,value=695,},
			{type=21,value=167,},
			{type=23,value=417,},
			{type=25,value=167,},
			{type=27,value=334,},
		},
	},
	{
		level = 91,
		--conditions = {},
		consume = {{type = 7,count = 2000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=149,},
			{type=11,value=745,},
			{type=13,value=149,},
			{type=15,value=745,},
			{type=17,value=149,},
			{type=19,value=745,},
			{type=21,value=179,},
			{type=23,value=447,},
			{type=25,value=179,},
			{type=27,value=358,},
		},
	},
	{
		level = 92,
		--conditions = {},
		consume = {{type = 7,count = 2000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=159,},
			{type=11,value=795,},
			{type=13,value=159,},
			{type=15,value=795,},
			{type=17,value=159,},
			{type=19,value=795,},
			{type=21,value=191,},
			{type=23,value=477,},
			{type=25,value=191,},
			{type=27,value=382,},
		},
	},
	{
		level = 93,
		--conditions = {},
		consume = {{type = 7,count = 2000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=169,},
			{type=11,value=845,},
			{type=13,value=169,},
			{type=15,value=845,},
			{type=17,value=169,},
			{type=19,value=845,},
			{type=21,value=203,},
			{type=23,value=507,},
			{type=25,value=203,},
			{type=27,value=406,},
		},
	},
	{
		level = 94,
		--conditions = {},
		consume = {{type = 7,count = 2000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=179,},
			{type=11,value=895,},
			{type=13,value=179,},
			{type=15,value=895,},
			{type=17,value=179,},
			{type=19,value=895,},
			{type=21,value=215,},
			{type=23,value=537,},
			{type=25,value=215,},
			{type=27,value=430,},
		},
	},
	{
		level = 95,
		--conditions = {},
		consume = {{type = 7,count = 3000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=191,},
			{type=11,value=955,},
			{type=13,value=191,},
			{type=15,value=955,},
			{type=17,value=191,},
			{type=19,value=955,},
			{type=21,value=229,},
			{type=23,value=573,},
			{type=25,value=229,},
			{type=27,value=458,},
		},
	},
	{
		level = 96,
		--conditions = {},
		consume = {{type = 7,count = 3000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=203,},
			{type=11,value=1015,},
			{type=13,value=203,},
			{type=15,value=1015,},
			{type=17,value=203,},
			{type=19,value=1015,},
			{type=21,value=244,},
			{type=23,value=609,},
			{type=25,value=244,},
			{type=27,value=487,},
		},
	},
	{
		level = 97,
		--conditions = {},
		consume = {{type = 7,count = 3000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=215,},
			{type=11,value=1075,},
			{type=13,value=215,},
			{type=15,value=1075,},
			{type=17,value=215,},
			{type=19,value=1075,},
			{type=21,value=258,},
			{type=23,value=645,},
			{type=25,value=258,},
			{type=27,value=516,},
		},
	},
	{
		level = 98,
		--conditions = {},
		consume = {{type = 7,count = 3000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=227,},
			{type=11,value=1135,},
			{type=13,value=227,},
			{type=15,value=1135,},
			{type=17,value=227,},
			{type=19,value=1135,},
			{type=21,value=272,},
			{type=23,value=681,},
			{type=25,value=273,},
			{type=27,value=545,},
		},
	},
	{
		level = 99,
		--conditions = {},
		consume = {{type = 7,count = 3000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 2000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=239,},
			{type=11,value=1195,},
			{type=13,value=239,},
			{type=15,value=1195,},
			{type=17,value=239,},
			{type=19,value=1195,},
			{type=21,value=287,},
			{type=23,value=717,},
			{type=25,value=287,},
			{type=27,value=574,},
		},
	},
	-- 100 级开始 -----------------------------------------------------
	{
		level = 100,
		--conditions = {},
		consume = {{type = 7,count = 4000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=253,},
			{type=11,value=1265,},
			{type=13,value=253,},
			{type=15,value=1265,},
			{type=17,value=253,},
			{type=19,value=1265,},
			{type=21,value=304,},
			{type=23,value=759,},
			{type=25,value=304,},
			{type=27,value=607,},
		},
	},
	{
		level = 101,
		--conditions = {},
		consume = {{type = 7,count = 4000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=267,},
			{type=11,value=1335,},
			{type=13,value=267,},
			{type=15,value=1335,},
			{type=17,value=267,},
			{type=19,value=1335,},
			{type=21,value=320,},
			{type=23,value=801,},
			{type=25,value=321,},
			{type=27,value=641,},
		},
	},
	{
		level = 102,
		--conditions = {},
		consume = {{type = 7,count = 4000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=281,},
			{type=11,value=1405,},
			{type=13,value=281,},
			{type=15,value=1405,},
			{type=17,value=281,},
			{type=19,value=1405,},
			{type=21,value=337,},
			{type=23,value=843,},
			{type=25,value=337,},
			{type=27,value=674,},
		},
	},
	{
		level = 103,
		--conditions = {},
		consume = {{type = 7,count = 4000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=295,},
			{type=11,value=1475,},
			{type=13,value=295,},
			{type=15,value=1475,},
			{type=17,value=295,},
			{type=19,value=1475,},
			{type=21,value=354,},
			{type=23,value=885,},
			{type=25,value=354,},
			{type=27,value=708,},
		},
	},
	{
		level = 104,
		--conditions = {},
		consume = {{type = 7,count = 4000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1500, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=309,},
			{type=11,value=1545,},
			{type=13,value=309,},
			{type=15,value=1545,},
			{type=17,value=309,},
			{type=19,value=1545,},
			{type=21,value=371,},
			{type=23,value=927,},
			{type=25,value=371,},
			{type=27,value=742,},
		},
	},
	{
		level = 105,
		--conditions = {},
		consume = {{type = 7,count = 5000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=325,},
			{type=11,value=1625,},
			{type=13,value=325,},
			{type=15,value=1625,},
			{type=17,value=325,},
			{type=19,value=1625,},
			{type=21,value=390,},
			{type=23,value=975,},
			{type=25,value=390,},
			{type=27,value=780,},
		},
	},
	{
		level = 106,
		--conditions = {},
		consume = {{type = 7,count = 5000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=341,},
			{type=11,value=1705,},
			{type=13,value=341,},
			{type=15,value=1705,},
			{type=17,value=341,},
			{type=19,value=1705,},
			{type=21,value=409,},
			{type=23,value=1023,},
			{type=25,value=409,},
			{type=27,value=818,},
		},
	},
	{
		level = 107,
		--conditions = {},
		consume = {{type = 7,count = 5000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=357,},
			{type=11,value=1785,},
			{type=13,value=357,},
			{type=15,value=1785,},
			{type=17,value=357,},
			{type=19,value=1785,},
			{type=21,value=428,},
			{type=23,value=1071,},
			{type=25,value=429,},
			{type=27,value=857,},
		},
	},
	{
		level = 108,
		--conditions = {},
		consume = {{type = 7,count = 5000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=373,},
			{type=11,value=1865,},
			{type=13,value=373,},
			{type=15,value=1865,},
			{type=17,value=373,},
			{type=19,value=1865,},
			{type=21,value=448,},
			{type=23,value=1119,},
			{type=25,value=448,},
			{type=27,value=895,},
		},
	},
	{
		level = 109,
		--conditions = {},
		consume = {{type = 7,count = 5000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 1000, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=389,},
			{type=11,value=1945,},
			{type=13,value=389,},
			{type=15,value=1945,},
			{type=17,value=389,},
			{type=19,value=1945,},
			{type=21,value=467,},
			{type=23,value=1167,},
			{type=25,value=467,},
			{type=27,value=934,},
		},
	},
	-- 110 级开始 -----------------------------------------------------
	{
		level = 110,
		--conditions = {},
		consume = {{type = 7,count = 6000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 800, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=407,},
			{type=11,value=2035,},
			{type=13,value=407,},
			{type=15,value=2035,},
			{type=17,value=407,},
			{type=19,value=2035,},
			{type=21,value=488,},
			{type=23,value=1221,},
			{type=25,value=489,},
			{type=27,value=977,},
		},
	},
	{
		level = 111,
		--conditions = {},
		consume = {{type = 7,count = 6000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 800, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=425,},
			{type=11,value=2125,},
			{type=13,value=425,},
			{type=15,value=2125,},
			{type=17,value=425,},
			{type=19,value=2125,},
			{type=21,value=510,},
			{type=23,value=1275,},
			{type=25,value=510,},
			{type=27,value=1020,},
		},
	},
	{
		level = 112,
		--conditions = {},
		consume = {{type = 7,count = 6000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 800, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=443,},
			{type=11,value=2215,},
			{type=13,value=443,},
			{type=15,value=2215,},
			{type=17,value=443,},
			{type=19,value=2215,},
			{type=21,value=532,},
			{type=23,value=1329,},
			{type=25,value=532,},
			{type=27,value=1063,},
		},
	},
	{
		level = 113,
		--conditions = {},
		consume = {{type = 7,count = 6000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 800, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=461,},
			{type=11,value=2305,},
			{type=13,value=461,},
			{type=15,value=2305,},
			{type=17,value=461,},
			{type=19,value=2305,},
			{type=21,value=553,},
			{type=23,value=1383,},
			{type=25,value=553,},
			{type=27,value=1106,},
		},
	},
	{
		level = 114,
		--conditions = {},
		consume = {{type = 7,count = 6000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 800, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=479,},
			{type=11,value=2395,},
			{type=13,value=479,},
			{type=15,value=2395,},
			{type=17,value=479,},
			{type=19,value=2395,},
			{type=21,value=575,},
			{type=23,value=1437,},
			{type=25,value=575,},
			{type=27,value=1150,},
		},
	},
	{
		level = 115,
		--conditions = {},
		consume = {{type = 7,count = 7000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 700, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=499,},
			{type=11,value=2495,},
			{type=13,value=499,},
			{type=15,value=2495,},
			{type=17,value=499,},
			{type=19,value=2495,},
			{type=21,value=599,},
			{type=23,value=1497,},
			{type=25,value=599,},
			{type=27,value=1198,},
		},
	},
	{
		level = 116,
		--conditions = {},
		consume = {{type = 7,count = 7000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 700, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=519,},
			{type=11,value=2595,},
			{type=13,value=519,},
			{type=15,value=2595,},
			{type=17,value=519,},
			{type=19,value=2595,},
			{type=21,value=623,},
			{type=23,value=1557,},
			{type=25,value=623,},
			{type=27,value=1246,},
		},
	},
	{
		level = 117,
		--conditions = {},
		consume = {{type = 7,count = 7000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 700, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=539,},
			{type=11,value=2695,},
			{type=13,value=539,},
			{type=15,value=2695,},
			{type=17,value=539,},
			{type=19,value=2695,},
			{type=21,value=647,},
			{type=23,value=1617,},
			{type=25,value=647,},
			{type=27,value=1294,},
		},
	},
	{
		level = 118,
		--conditions = {},
		consume = {{type = 7,count = 7000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 700, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=559,},
			{type=11,value=2795,},
			{type=13,value=559,},
			{type=15,value=2795,},
			{type=17,value=559,},
			{type=19,value=2795,},
			{type=21,value=671,},
			{type=23,value=1677,},
			{type=25,value=671,},
			{type=27,value=1342,},
		},
	},
	{
		level = 119,
		--conditions = {},
		consume = {{type = 7,count = 7000}}, --  消耗绑金5，绑元7，元宝15
		ratio = 700, -- 成功率(万分比)
		bigIcon = -1, --负1表示不做功能开启提示
		openFunctionName = "", --功能开启名字
		attrs = {
			{type=9,value=579,},
			{type=11,value=2895,},
			{type=13,value=579,},
			{type=15,value=2895,},
			{type=17,value=579,},
			{type=19,value=2895,},
			{type=21,value=695,},
			{type=23,value=1737,},
			{type=25,value=695,},
			{type=27,value=1390,},
		},
	},

---------------------------------------------------------------------------------
},

}