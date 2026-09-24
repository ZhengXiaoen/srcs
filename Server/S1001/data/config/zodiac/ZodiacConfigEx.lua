--套装属性 2017/4/18 zer
--suitId 根据套装id 进行索引 哈希表
ZodiacEx =
    {
        --装备佩戴的位置
        equipslot =
        {
            {0, 1},
            {2, 3},
            {5, 6},
            {7, 8},
            {9, 10},
           

        },
        --神装佩戴的位置
        equipslotEx =
        {
            {15, 13},
            {40, 41},
            {42, 43},
            {44, 45},
            {46, 47},
        },
        --首饰套装属性
         equipslotJew = {{22,23,24,25},},
        --神装套装属性
        equipgod =
        {
             {49,50},--首充神器神甲佩戴位置
        },
        --传世装备
        legend=
        {
            {64,65,66,67,68,69,70,71,72,73,},
        },
        suit =
        {
            
            
            
            --模版
            -- {
            --     name = "(a1)",
            --     suitId = (a2),
            --     attr =
            --     {
            --         {
            --             {type = 128, value = (a3), }, --暴击机率
            --             {type = 129, value = (a4), }, --暴击值
            --         },
            --         {
            --             {type = 11, value = (a5), }, --最大物理攻击
            --             {type = 15, value = (a5), }, --最大魔法攻击
            --             {type = 19, value = (a5), }, --最大道术攻击
            --             {type = 27, value = (a6), }, --魔法防御
            --         },
            --         {
            --             {type = 5, value = (a7), }, --最大生命值
            --             {type = 7, value = (a8), }, --最大魔法值
            --         },
            --         {
            --             {type = 11, value = (a9), }, --最大物理攻击
            --             {type = 15, value = (a9), }, --最大魔法攻击
            --             {type = 19, value = (a9), }, --最大道术攻击
            --             {type = 23, value = (a10), }, --物理防御
            --         },
            --         {
            --             {type = 23, value = (a11), }, --物理防御
            --             {type = 27, value = (a12), }, --魔法防御
            --         },
            --     },
            --     jobattr =
            --     {
            --         {
            --             {type = 163, value = (a14), }, --对法师伤害增加
            --             {type = 121, value = (a14), }, --受法师伤害减少
            --             {type = 165, value = (a16), }, --对道士伤害增加
            --             {type = 123, value = (a16), }, --受道士伤害减少
            --         },
            --         {
            --             {type = 161, value = (a13), }, --对战士伤害增加
            --             {type = 119, value = (a13), }, --受战士伤害减少
            --             {type = 165, value = (a16), }, --对道士伤害增加
            --             {type = 123, value = (a16), }, --受道士伤害减少
            --         },
            --         {
            --             {type = 163, value = (a14), }, --对法师伤害增加
            --             {type = 121, value = (a14), }, --受法师伤害减少
            --             {type = 161, value = (a18), }, --对战士伤害增加
            --             {type = 119, value = (a18), }, --受战士伤害减少
            --         },
            --     },
            -- },
            
            -- {
            --     name = "(a1)",
            --     suitId = (a2),
            --     attr =
            --     {
            --         {
            --             {type = 128, value = (a3), }, --暴击机率
            --             {type = 129, value = (a4), }, --暴击值
            --         },
            --         {
            --             {type = (a19), value = (a5), }, --职业属性
            --             {type = 27, value = (a6), }, --魔法防御
            --         },
            --         {
            --             {type = 5, value = (a7), }, --最大生命值
            --             {type = 7, value = (a8), }, --最大魔法值
            --         },
            --         {
            --             {type = (a19), value = (a9), }, --职业属性
            --             {type = 23, value = (a10), }, --物理防御
            --         },
            --         {
            --             {type = 23, value = (a11), }, --物理防御
            --             {type = 27, value = (a12), }, --魔法防御
            --         },
            --     },
            --     jobattr =
            --     {
            --         {
            --             {type = 163, value = (a14), }, --对法师伤害增加
            --             {type = 121, value = (a14), }, --受法师伤害减少
            --             {type = 165, value = (a16), }, --对道士伤害增加
            --             {type = 123, value = (a16), }, --受道士伤害减少
            --         },
            --         {
            --             {type = 161, value = (a13), }, --对战士伤害增加
            --             {type = 119, value = (a13), }, --受战士伤害减少
            --             {type = 165, value = (a16), }, --对道士伤害增加
            --             {type = 123, value = (a16), }, --受道士伤害减少
            --         },
            --         {
            --             {type = 163, value = (a14), }, --对法师伤害增加
            --             {type = 121, value = (a14), }, --受法师伤害减少
            --             {type = 161, value = (a18), }, --对战士伤害增加
            --             {type = 119, value = (a18), }, --受战士伤害减少
            --         },
            --     },
            -- },
            --神装的模版
            -- {
            -- 	name = "(a1)",
            -- 	suitId = (a2),
            -- 	attr =
            -- 	{
            -- 		{
            -- 		    {type = 66,		value = (a3),	},	--杀怪伤害
            -- 		},
            -- 		{
            -- 		    {type = 5,		value = (a5),	},	--最大生命值
            -- 		    {type = 7,		value = (a6),	},	--最大魔法值
            -- 		},
            -- 		{
            -- 		    {type = 5,		value = (a7),	},	--最大生命值
            -- 		    {type = 7,		value = (a8),	},	--最大魔法值
            -- 		},
            -- 		{
            -- 		    {type = 5,		value = (a9),	},	--最大生命值
            -- 		    {type = 7,		value = (a10),	},	--最大魔法值
            -- 		},
            -- 		{
            -- 		    {type = 5,		value = (a11),	},	--最大生命值
            -- 		    {type = 7,		value = (a12),	},	--最大魔法值
            -- 		},
            -- 	},
            -- 	jobattr =
            -- 	{
            -- 		{
            -- 			{type = 153,	value = (a4),	},	--抗暴击力
            -- 		},
            -- 		{
            -- 			{type = 153,	value = (a4),	},	--抗暴击力
            -- 		},
            -- 		{
            -- 			{type = 153,	value = (a4),	},	--抗暴击力
            -- 		},
            -- 	},
            -- },

            -- 饰品的模版
            -- {
            -- 	name = "(a1)",
            -- 	suitId = (a2),
            -- 	jobattr =
            -- 	{
            -- 		{
            --             {type = 126,	value = (a3),	},	--暴击几率
            --             {type = 127,	value = (a4),	},	--暴击值
            --             {type = 5,	value = (a5),	},	--生命值

            -- 		},
            -- 		{
            --             {type = 126,	value = (a6),	},	--暴击几率
            --             {type = 127,	value = (a7),	},	--暴击值
            --             {type = 5,	value = (a8),	},	--生命值
            -- 		},
            -- 		{
            --             {type = 126,	value = (a9),	},	--暴击几率
            --             {type = 127,	value = (a10),	},	--暴击值
            --             {type = 5,	value = (a11),	},	--生命值
            -- 		},
            -- 	},
            -- },




            {
                name = "霸主",
                suitId = 1,
                attr =
                {
                    {
                        {type = 128, value = 50, }, --暴击机率
                        {type = 129, value = 1888, }, --暴击值
                    },
                    {
                        {type = 11, value = 188, }, --最大物理攻击
                        {type = 15, value = 188, }, --最大魔法攻击
                        {type = 19, value = 188, }, --最大道术攻击
                        {type = 27, value = 58, }, --魔法防御
                    },
                    {
                        {type = 5, value = 2800, }, --最大生命值
                        {type = 7, value = 2800, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 188, }, --最大物理攻击
                        {type = 15, value = 188, }, --最大魔法攻击
                        {type = 19, value = 188, }, --最大道术攻击
                        {type = 23, value = 58, }, --物理防御
                    },
                    {
                        {type = 23, value = 118, }, --物理防御
                        {type = 27, value = 118, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 300, }, --对法师伤害增加
                        {type = 121, value = 300, }, --受法师伤害减少
                        {type = 165, value = 300, }, --对道士伤害增加
                        {type = 123, value = 300, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 300, }, --对战士伤害增加
                        {type = 119, value = 300, }, --受战士伤害减少
                        {type = 165, value = 300, }, --对道士伤害增加
                        {type = 123, value = 300, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 300, }, --对法师伤害增加
                        {type = 121, value = 300, }, --受法师伤害减少
                        {type = 161, value = 300, }, --对战士伤害增加
                        {type = 119, value = 300, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "通天",
                suitId = 2,
                attr =
                {
                    {
                        {type = 128, value = 100, }, --暴击机率
                        {type = 129, value = 2888, }, --暴击值
                    },
                    {
                        {type = 11, value = 288, }, --最大物理攻击
                        {type = 15, value = 288, }, --最大魔法攻击
                        {type = 19, value = 288, }, --最大道术攻击
                        {type = 27, value = 88, }, --魔法防御
                    },
                    {
                        {type = 5, value = 4300, }, --最大生命值
                        {type = 7, value = 4300, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 288, }, --最大物理攻击
                        {type = 15, value = 288, }, --最大魔法攻击
                        {type = 19, value = 288, }, --最大道术攻击
                        {type = 23, value = 88, }, --物理防御
                    },
                    {
                        {type = 23, value = 178, }, --物理防御
                        {type = 27, value = 178, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 450, }, --对法师伤害增加
                        {type = 121, value = 450, }, --受法师伤害减少
                        {type = 165, value = 450, }, --对道士伤害增加
                        {type = 123, value = 450, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 450, }, --对战士伤害增加
                        {type = 119, value = 450, }, --受战士伤害减少
                        {type = 165, value = 450, }, --对道士伤害增加
                        {type = 123, value = 450, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 450, }, --对法师伤害增加
                        {type = 121, value = 450, }, --受法师伤害减少
                        {type = 161, value = 450, }, --对战士伤害增加
                        {type = 119, value = 450, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "毁灭",
                suitId = 3,
                attr =
                {
                    {
                        {type = 128, value = 150, }, --暴击机率
                        {type = 129, value = 3888, }, --暴击值
                    },
                    {
                        {type = 11, value = 388, }, --最大物理攻击
                        {type = 15, value = 388, }, --最大魔法攻击
                        {type = 19, value = 388, }, --最大道术攻击
                        {type = 27, value = 118, }, --魔法防御
                    },
                    {
                        {type = 5, value = 5800, }, --最大生命值
                        {type = 7, value = 5800, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 388, }, --最大物理攻击
                        {type = 15, value = 388, }, --最大魔法攻击
                        {type = 19, value = 388, }, --最大道术攻击
                        {type = 23, value = 118, }, --物理防御
                    },
                    {
                        {type = 23, value = 238, }, --物理防御
                        {type = 27, value = 238, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 600, }, --对法师伤害增加
                        {type = 121, value = 600, }, --受法师伤害减少
                        {type = 165, value = 600, }, --对道士伤害增加
                        {type = 123, value = 600, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 600, }, --对战士伤害增加
                        {type = 119, value = 600, }, --受战士伤害减少
                        {type = 165, value = 600, }, --对道士伤害增加
                        {type = 123, value = 600, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 600, }, --对法师伤害增加
                        {type = 121, value = 600, }, --受法师伤害减少
                        {type = 161, value = 600, }, --对战士伤害增加
                        {type = 119, value = 600, }, --受战士伤害减少
                    },
                },
            },

            {
                name = "上古",
                suitId = 4,
                attr =
                {
                    {
                        {type = 128, value = 200, }, --暴击机率
                        {type = 129, value = 5888, }, --暴击值
                    },
                    {
                        {type = 11, value = 508, }, --职业属性
                        {type = 27, value = 158, }, --魔法防御
                    },
                    {
                        {type = 5, value = 7600, }, --最大生命值
                        {type = 7, value = 760, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 508, }, --职业属性
                        {type = 23, value = 158, }, --物理防御
                    },
                    {
                        {type = 23, value = 318, }, --物理防御
                        {type = 27, value = 318, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "上古",
                suitId = 5,
                attr =
                {
                    {
                        {type = 128, value = 200, }, --暴击机率
                        {type = 129, value = 5888, }, --暴击值
                    },
                    {
                        {type = 15, value = 508, }, --职业属性
                        {type = 27, value = 158, }, --魔法防御
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 15200, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 508, }, --职业属性
                        {type = 23, value = 158, }, --物理防御
                    },
                    {
                        {type = 23, value = 318, }, --物理防御
                        {type = 27, value = 318, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "上古",
                suitId = 6,
                attr =
                {
                    {
                        {type = 128, value = 200, }, --暴击机率
                        {type = 129, value = 5888, }, --暴击值
                    },
                    {
                        {type = 19, value = 508, }, --职业属性
                        {type = 27, value = 158, }, --魔法防御
                    },
                    {
                        {type = 5, value = 6800, }, --最大生命值
                        {type = 7, value = 13600, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 508, }, --职业属性
                        {type = 23, value = 158, }, --物理防御
                    },
                    {
                        {type = 23, value = 318, }, --物理防御
                        {type = 27, value = 318, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                        {type = 165, value = 750, }, --对道士伤害增加
                        {type = 123, value = 750, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 750, }, --对法师伤害增加
                        {type = 121, value = 750, }, --受法师伤害减少
                        {type = 161, value = 750, }, --对战士伤害增加
                        {type = 119, value = 750, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "起源",
                suitId = 7,
                attr =
                {
                    {
                        {type = 128, value = 300, }, --暴击机率
                        {type = 129, value = 7888, }, --暴击值
                    },
                    {
                        {type = 11, value = 688, }, --职业属性
                        {type = 27, value = 208, }, --魔法防御
                    },
                    {
                        {type = 5, value = 10300, }, --最大生命值
                        {type = 7, value = 1030, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 688, }, --职业属性
                        {type = 23, value = 208, }, --物理防御
                    },
                    {
                        {type = 23, value = 418, }, --物理防御
                        {type = 27, value = 418, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "起源",
                suitId = 8,
                attr =
                {
                    {
                        {type = 128, value = 300, }, --暴击机率
                        {type = 129, value = 7888, }, --暴击值
                    },
                    {
                        {type = 15, value = 688, }, --职业属性
                        {type = 27, value = 208, }, --魔法防御
                    },
                    {
                        {type = 5, value = 6200, }, --最大生命值
                        {type = 7, value = 20600, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 688, }, --职业属性
                        {type = 23, value = 208, }, --物理防御
                    },
                    {
                        {type = 23, value = 418, }, --物理防御
                        {type = 27, value = 418, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "起源",
                suitId = 9,
                attr =
                {
                    {
                        {type = 128, value = 300, }, --暴击机率
                        {type = 129, value = 7888, }, --暴击值
                    },
                    {
                        {type = 19, value = 688, }, --职业属性
                        {type = 27, value = 208, }, --魔法防御
                    },
                    {
                        {type = 5, value = 7800, }, --最大生命值
                        {type = 7, value = 15600, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 688, }, --职业属性
                        {type = 23, value = 208, }, --物理防御
                    },
                    {
                        {type = 23, value = 418, }, --物理防御
                        {type = 27, value = 418, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                        {type = 165, value = 900, }, --对道士伤害增加
                        {type = 123, value = 900, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 900, }, --对法师伤害增加
                        {type = 121, value = 900, }, --受法师伤害减少
                        {type = 161, value = 900, }, --对战士伤害增加
                        {type = 119, value = 900, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "誓言",
                suitId = 10,
                attr =
                {
                    {
                        {type = 128, value = 400, }, --暴击机率
                        {type = 129, value = 9888, }, --暴击值
                    },
                    {
                        {type = 11, value = 888, }, --职业属性
                        {type = 27, value = 268, }, --魔法防御
                    },
                    {
                        {type = 5, value = 13300, }, --最大生命值
                        {type = 7, value = 1330, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 888, }, --职业属性
                        {type = 23, value = 268, }, --物理防御
                    },
                    {
                        {type = 23, value = 538, }, --物理防御
                        {type = 27, value = 538, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "誓言",
                suitId = 11,
                attr =
                {
                    {
                        {type = 128, value = 400, }, --暴击机率
                        {type = 129, value = 9888, }, --暴击值
                    },
                    {
                        {type = 15, value = 888, }, --职业属性
                        {type = 27, value = 268, }, --魔法防御
                    },
                    {
                        {type = 5, value = 6500, }, --最大生命值
                        {type = 7, value = 26600, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 888, }, --职业属性
                        {type = 23, value = 268, }, --物理防御
                    },
                    {
                        {type = 23, value = 538, }, --物理防御
                        {type = 27, value = 538, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "誓言",
                suitId = 12,
                attr =
                {
                    {
                        {type = 128, value = 400, }, --暴击机率
                        {type = 129, value = 9888, }, --暴击值
                    },
                    {
                        {type = 19, value = 888, }, --职业属性
                        {type = 27, value = 268, }, --魔法防御
                    },
                    {
                        {type = 5, value = 8800, }, --最大生命值
                        {type = 7, value = 17600, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 888, }, --职业属性
                        {type = 23, value = 268, }, --物理防御
                    },
                    {
                        {type = 23, value = 538, }, --物理防御
                        {type = 27, value = 538, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                        {type = 165, value = 1050, }, --对道士伤害增加
                        {type = 123, value = 1050, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1050, }, --对法师伤害增加
                        {type = 121, value = 1050, }, --受法师伤害减少
                        {type = 161, value = 1050, }, --对战士伤害增加
                        {type = 119, value = 1050, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "冲天",
                suitId = 13,
                attr =
                {
                    {
                        {type = 128, value = 500, }, --暴击机率
                        {type = 129, value = 12888, }, --暴击值
                    },
                    {
                        {type = 11, value = 1088, }, --职业属性
                        {type = 27, value = 328, }, --魔法防御
                    },
                    {
                        {type = 5, value = 16300, }, --最大生命值
                        {type = 7, value = 1630, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 1088, }, --职业属性
                        {type = 23, value = 328, }, --物理防御
                    },
                    {
                        {type = 23, value = 658, }, --物理防御
                        {type = 27, value = 658, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "冲天",
                suitId = 14,
                attr =
                {
                    {
                        {type = 128, value = 500, }, --暴击机率
                        {type = 129, value = 12888, }, --暴击值
                    },
                    {
                        {type = 15, value = 1088, }, --职业属性
                        {type = 27, value = 328, }, --魔法防御
                    },
                    {
                        {type = 5, value = 6800, }, --最大生命值
                        {type = 7, value = 32600, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 1088, }, --职业属性
                        {type = 23, value = 328, }, --物理防御
                    },
                    {
                        {type = 23, value = 658, }, --物理防御
                        {type = 27, value = 658, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "冲天",
                suitId = 15,
                attr =
                {
                    {
                        {type = 128, value = 500, }, --暴击机率
                        {type = 129, value = 12888, }, --暴击值
                    },
                    {
                        {type = 19, value = 1088, }, --职业属性
                        {type = 27, value = 328, }, --魔法防御
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 1088, }, --职业属性
                        {type = 23, value = 328, }, --物理防御
                    },
                    {
                        {type = 23, value = 658, }, --物理防御
                        {type = 27, value = 658, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                        {type = 165, value = 1200, }, --对道士伤害增加
                        {type = 123, value = 1200, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1200, }, --对法师伤害增加
                        {type = 121, value = 1200, }, --受法师伤害减少
                        {type = 161, value = 1200, }, --对战士伤害增加
                        {type = 119, value = 1200, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "菩提",
                suitId = 16,
                attr =
                {
                    {
                        {type = 128, value = 600, }, --暴击机率
                        {type = 129, value = 15888, }, --暴击值
                    },
                    {
                        {type = 11, value = 1288, }, --职业属性
                        {type = 27, value = 388, }, --魔法防御
                    },
                    {
                        {type = 5, value = 19300, }, --最大生命值
                        {type = 7, value = 1930, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 1288, }, --职业属性
                        {type = 23, value = 388, }, --物理防御
                    },
                    {
                        {type = 23, value = 778, }, --物理防御
                        {type = 27, value = 778, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "菩提",
                suitId = 17,
                attr =
                {
                    {
                        {type = 128, value = 600, }, --暴击机率
                        {type = 129, value = 15888, }, --暴击值
                    },
                    {
                        {type = 15, value = 1288, }, --职业属性
                        {type = 27, value = 388, }, --魔法防御
                    },
                    {
                        {type = 5, value = 7200, }, --最大生命值
                        {type = 7, value = 38600, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 1288, }, --职业属性
                        {type = 23, value = 388, }, --物理防御
                    },
                    {
                        {type = 23, value = 778, }, --物理防御
                        {type = 27, value = 778, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "菩提",
                suitId = 18,
                attr =
                {
                    {
                        {type = 128, value = 600, }, --暴击机率
                        {type = 129, value = 15888, }, --暴击值
                    },
                    {
                        {type = 19, value = 1288, }, --职业属性
                        {type = 27, value = 388, }, --魔法防御
                    },
                    {
                        {type = 5, value = 11500, }, --最大生命值
                        {type = 7, value = 23000, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 1288, }, --职业属性
                        {type = 23, value = 388, }, --物理防御
                    },
                    {
                        {type = 23, value = 778, }, --物理防御
                        {type = 27, value = 778, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                        {type = 165, value = 1350, }, --对道士伤害增加
                        {type = 123, value = 1350, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1350, }, --对法师伤害增加
                        {type = 121, value = 1350, }, --受法师伤害减少
                        {type = 161, value = 1350, }, --对战士伤害增加
                        {type = 119, value = 1350, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "无尘",
                suitId = 19,
                attr =
                {
                    {
                        {type = 128, value = 800, }, --暴击机率
                        {type = 129, value = 19888, }, --暴击值
                    },
                    {
                        {type = 11, value = 1588, }, --职业属性
                        {type = 27, value = 508, }, --魔法防御
                    },
                    {
                        {type = 5, value = 23800, }, --最大生命值
                        {type = 7, value = 2380, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 1588, }, --职业属性
                        {type = 23, value = 508, }, --物理防御
                    },
                    {
                        {type = 23, value = 1018, }, --物理防御
                        {type = 27, value = 1018, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "无尘",
                suitId = 20,
                attr =
                {
                    {
                        {type = 128, value = 800, }, --暴击机率
                        {type = 129, value = 19888, }, --暴击值
                    },
                    {
                        {type = 15, value = 1588, }, --职业属性
                        {type = 27, value = 508, }, --魔法防御
                    },
                    {
                        {type = 5, value = 7500, }, --最大生命值
                        {type = 7, value = 47600, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 1588, }, --职业属性
                        {type = 23, value = 508, }, --物理防御
                    },
                    {
                        {type = 23, value = 1018, }, --物理防御
                        {type = 27, value = 1018, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "无尘",
                suitId = 21,
                attr =
                {
                    {
                        {type = 128, value = 800, }, --暴击机率
                        {type = 129, value = 19888, }, --暴击值
                    },
                    {
                        {type = 19, value = 1588, }, --职业属性
                        {type = 27, value = 508, }, --魔法防御
                    },
                    {
                        {type = 5, value = 13800, }, --最大生命值
                        {type = 7, value = 27600, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 1588, }, --职业属性
                        {type = 23, value = 508, }, --物理防御
                    },
                    {
                        {type = 23, value = 1018, }, --物理防御
                        {type = 27, value = 1018, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                        {type = 165, value = 1500, }, --对道士伤害增加
                        {type = 123, value = 1500, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1500, }, --对法师伤害增加
                        {type = 121, value = 1500, }, --受法师伤害减少
                        {type = 161, value = 1500, }, --对战士伤害增加
                        {type = 119, value = 1500, }, --受战士伤害减少
                    },
                },
            },



           {
                name = "芙蓉",
                suitId = 22,
                attr =
                {
                    {
                        {type = 128, value = 1000, }, --暴击机率
                        {type = 129, value = 25888, }, --暴击值
                    },
                    {
                        {type = 11, value = 1888, }, --职业属性
                        {type = 27, value = 628, }, --魔法防御
                    },
                    {
                        {type = 5, value = 28800, }, --最大生命值
                        {type = 7, value = 2880, }, --最大魔法值
                    },
                    {
                        {type = 11, value = 1888, }, --职业属性
                        {type = 23, value = 628, }, --物理防御
                    },
                    {
                        {type = 23, value = 1288, }, --物理防御
                        {type = 27, value = 1288, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "芙蓉",
                suitId = 23,
                attr =
                {
                    {
                        {type = 128, value = 1000, }, --暴击机率
                        {type = 129, value = 25888, }, --暴击值
                    },
                    {
                        {type = 15, value = 1888, }, --职业属性
                        {type = 27, value = 628, }, --魔法防御
                    },
                    {
                        {type = 5, value = 8800, }, --最大生命值
                        {type = 7, value = 52800, }, --最大魔法值
                    },
                    {
                        {type = 15, value = 1888, }, --职业属性
                        {type = 23, value = 628, }, --物理防御
                    },
                    {
                        {type = 23, value = 1288, }, --物理防御
                        {type = 27, value = 1288, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                    },
                },
            },
            {
                name = "芙蓉",
                suitId = 24,
                attr =
                {
                    {
                        {type = 128, value = 1000, }, --暴击机率
                        {type = 129, value = 25888, }, --暴击值
                    },
                    {
                        {type = 19, value = 1888, }, --职业属性
                        {type = 27, value = 628, }, --魔法防御
                    },
                    {
                        {type = 5, value = 16800, }, --最大生命值
                        {type = 7, value = 32800, }, --最大魔法值
                    },
                    {
                        {type = 19, value = 1888, }, --职业属性
                        {type = 23, value = 628, }, --物理防御
                    },
                    {
                        {type = 23, value = 1280, }, --物理防御
                        {type = 27, value = 1280, }, --魔法防御
                    },
                },
                jobattr =
                {
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                        {type = 165, value = 1650, }, --对道士伤害增加
                        {type = 123, value = 1650, }, --受道士伤害减少
                    },
                    {
                        {type = 163, value = 1650, }, --对法师伤害增加
                        {type = 121, value = 1650, }, --受法师伤害减少
                        {type = 161, value = 1650, }, --对战士伤害增加
                        {type = 119, value = 1650, }, --受战士伤害减少
                    },
                },
            },







            {
                name = "屠龙战Lv1",
                suitId = 100,
                attr =
                {
                    {
                        {type = 66, value = 2800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 1750, }, --最大生命值
                        {type = 7, value = 175, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1750, }, --最大生命值
                        {type = 7, value = 175, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1750, }, --最大生命值
                        {type = 7, value = 175, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1750, }, --最大生命值
                        {type = 7, value = 175, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战Lv2",
                suitId = 101,
                attr =
                {
                    {
                        {type = 66, value = 5600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 350, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 350, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 350, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 350, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战Lv3",
                suitId = 102,
                attr =
                {
                    {
                        {type = 66, value = 8400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 5250, }, --最大生命值
                        {type = 7, value = 525, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5250, }, --最大生命值
                        {type = 7, value = 525, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5250, }, --最大生命值
                        {type = 7, value = 525, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5250, }, --最大生命值
                        {type = 7, value = 525, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战Lv4",
                suitId = 103,
                attr =
                {
                    {
                        {type = 66, value = 11200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 700, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 700, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 700, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 700, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战Lv5",
                suitId = 104,
                attr =
                {
                    {
                        {type = 66, value = 14000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 8750, }, --最大生命值
                        {type = 7, value = 875, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8750, }, --最大生命值
                        {type = 7, value = 875, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8750, }, --最大生命值
                        {type = 7, value = 875, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8750, }, --最大生命值
                        {type = 7, value = 875, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战Lv6",
                suitId = 105,
                attr =
                {
                    {
                        {type = 66, value = 16800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 1050, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 1050, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 1050, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 1050, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙战LvMax",
                suitId = 106,
                attr =
                {
                    {
                        {type = 66, value = 19600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 12250, }, --最大生命值
                        {type = 7, value = 1225, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12250, }, --最大生命值
                        {type = 7, value = 1225, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12250, }, --最大生命值
                        {type = 7, value = 1225, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12250, }, --最大生命值
                        {type = 7, value = 1225, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv1",
                suitId = 107,
                attr =
                {
                    {
                        {type = 66, value = 2800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 500, }, --最大生命值
                        {type = 7, value = 2000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 500, }, --最大生命值
                        {type = 7, value = 2000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 500, }, --最大生命值
                        {type = 7, value = 2000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 500, }, --最大生命值
                        {type = 7, value = 2000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv2",
                suitId = 108,
                attr =
                {
                    {
                        {type = 66, value = 5600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 4000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 4000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 4000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 4000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv3",
                suitId = 109,
                attr =
                {
                    {
                        {type = 66, value = 8400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 1500, }, --最大生命值
                        {type = 7, value = 6000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1500, }, --最大生命值
                        {type = 7, value = 6000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1500, }, --最大生命值
                        {type = 7, value = 6000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1500, }, --最大生命值
                        {type = 7, value = 6000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv4",
                suitId = 110,
                attr =
                {
                    {
                        {type = 66, value = 11200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 8000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 8000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 8000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 8000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv5",
                suitId = 111,
                attr =
                {
                    {
                        {type = 66, value = 14000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 2500, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2500, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2500, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2500, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法Lv6",
                suitId = 112,
                attr =
                {
                    {
                        {type = 66, value = 16800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 12000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 12000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 12000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 12000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙法LvMax",
                suitId = 113,
                attr =
                {
                    {
                        {type = 66, value = 19600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 14000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 14000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 14000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3500, }, --最大生命值
                        {type = 7, value = 14000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv1",
                suitId = 114,
                attr =
                {
                    {
                        {type = 66, value = 2800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 1250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 1250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 1250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 1000, }, --最大生命值
                        {type = 7, value = 1250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 6500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv2",
                suitId = 115,
                attr =
                {
                    {
                        {type = 66, value = 5600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 2500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 2500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 2500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 2000, }, --最大生命值
                        {type = 7, value = 2500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 13000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv3",
                suitId = 116,
                attr =
                {
                    {
                        {type = 66, value = 8400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 3750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 3750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 3750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 3000, }, --最大生命值
                        {type = 7, value = 3750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 19500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv4",
                suitId = 117,
                attr =
                {
                    {
                        {type = 66, value = 11200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 5000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 5000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 5000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 5000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 26000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv5",
                suitId = 118,
                attr =
                {
                    {
                        {type = 66, value = 14000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 6250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 6250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 6250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 6250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 32500, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道Lv6",
                suitId = 119,
                attr =
                {
                    {
                        {type = 66, value = 16800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 7500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 7500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 7500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 7500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 39000, }, --抗暴击力
                    },
                },
            },
            {
                name = "屠龙道LvMax",
                suitId = 120,
                attr =
                {
                    {
                        {type = 66, value = 19600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 8750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 8750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 8750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 8750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 45500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv1",
                suitId = 121,
                attr =
                {
                    {
                        {type = 66, value = 22400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 1400, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 1400, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 1400, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 1400, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv2",
                suitId = 122,
                attr =
                {
                    {
                        {type = 66, value = 25200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 15750, }, --最大生命值
                        {type = 7, value = 1575, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15750, }, --最大生命值
                        {type = 7, value = 1575, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15750, }, --最大生命值
                        {type = 7, value = 1575, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15750, }, --最大生命值
                        {type = 7, value = 1575, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv3",
                suitId = 123,
                attr =
                {
                    {
                        {type = 66, value = 28000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 17500, }, --最大生命值
                        {type = 7, value = 1750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17500, }, --最大生命值
                        {type = 7, value = 1750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17500, }, --最大生命值
                        {type = 7, value = 1750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17500, }, --最大生命值
                        {type = 7, value = 1750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv4",
                suitId = 124,
                attr =
                {
                    {
                        {type = 66, value = 30800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 19250, }, --最大生命值
                        {type = 7, value = 1925, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19250, }, --最大生命值
                        {type = 7, value = 1925, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19250, }, --最大生命值
                        {type = 7, value = 1925, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19250, }, --最大生命值
                        {type = 7, value = 1925, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv5",
                suitId = 125,
                attr =
                {
                    {
                        {type = 66, value = 33600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 2100, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 2100, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 2100, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 2100, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战Lv6",
                suitId = 126,
                attr =
                {
                    {
                        {type = 66, value = 36400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 22750, }, --最大生命值
                        {type = 7, value = 2275, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 22750, }, --最大生命值
                        {type = 7, value = 2275, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 22750, }, --最大生命值
                        {type = 7, value = 2275, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 22750, }, --最大生命值
                        {type = 7, value = 2275, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙战LvMax",
                suitId = 127,
                attr =
                {
                    {
                        {type = 66, value = 39200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 24500, }, --最大生命值
                        {type = 7, value = 2450, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 24500, }, --最大生命值
                        {type = 7, value = 2450, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 24500, }, --最大生命值
                        {type = 7, value = 2450, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 24500, }, --最大生命值
                        {type = 7, value = 2450, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv1",
                suitId = 128,
                attr =
                {
                    {
                        {type = 66, value = 22400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 16000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 16000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 16000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4000, }, --最大生命值
                        {type = 7, value = 16000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv2",
                suitId = 129,
                attr =
                {
                    {
                        {type = 66, value = 25200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 4500, }, --最大生命值
                        {type = 7, value = 18000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4500, }, --最大生命值
                        {type = 7, value = 18000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4500, }, --最大生命值
                        {type = 7, value = 18000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 4500, }, --最大生命值
                        {type = 7, value = 18000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv3",
                suitId = 130,
                attr =
                {
                    {
                        {type = 66, value = 28000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv4",
                suitId = 131,
                attr =
                {
                    {
                        {type = 66, value = 30800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 5500, }, --最大生命值
                        {type = 7, value = 22000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5500, }, --最大生命值
                        {type = 7, value = 22000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5500, }, --最大生命值
                        {type = 7, value = 22000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 5500, }, --最大生命值
                        {type = 7, value = 22000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv5",
                suitId = 132,
                attr =
                {
                    {
                        {type = 66, value = 33600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 24000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 24000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 24000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6000, }, --最大生命值
                        {type = 7, value = 24000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法Lv6",
                suitId = 133,
                attr =
                {
                    {
                        {type = 66, value = 36400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 6500, }, --最大生命值
                        {type = 7, value = 26000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6500, }, --最大生命值
                        {type = 7, value = 26000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6500, }, --最大生命值
                        {type = 7, value = 26000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 6500, }, --最大生命值
                        {type = 7, value = 26000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙法LvMax",
                suitId = 134,
                attr =
                {
                    {
                        {type = 66, value = 39200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 28000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 28000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 28000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7000, }, --最大生命值
                        {type = 7, value = 28000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv1",
                suitId = 135,
                attr =
                {
                    {
                        {type = 66, value = 22400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 10000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 48500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv2",
                suitId = 136,
                attr =
                {
                    {
                        {type = 66, value = 25200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 11250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 11250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 11250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 11250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 55000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv3",
                suitId = 137,
                attr =
                {
                    {
                        {type = 66, value = 28000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 12500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 12500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 12500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 12500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 61500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv4",
                suitId = 138,
                attr =
                {
                    {
                        {type = 66, value = 30800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 11000, }, --最大生命值
                        {type = 7, value = 13750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 11000, }, --最大生命值
                        {type = 7, value = 13750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 11000, }, --最大生命值
                        {type = 7, value = 13750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 11000, }, --最大生命值
                        {type = 7, value = 13750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 68000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv5",
                suitId = 139,
                attr =
                {
                    {
                        {type = 66, value = 33600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 12000, }, --最大生命值
                        {type = 7, value = 15000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12000, }, --最大生命值
                        {type = 7, value = 15000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12000, }, --最大生命值
                        {type = 7, value = 15000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 12000, }, --最大生命值
                        {type = 7, value = 15000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 74500, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道Lv6",
                suitId = 140,
                attr =
                {
                    {
                        {type = 66, value = 36400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 13000, }, --最大生命值
                        {type = 7, value = 16250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 13000, }, --最大生命值
                        {type = 7, value = 16250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 13000, }, --最大生命值
                        {type = 7, value = 16250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 13000, }, --最大生命值
                        {type = 7, value = 16250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 81000, }, --抗暴击力
                    },
                },
            },
            {
                name = "祖龙道LvMax",
                suitId = 141,
                attr =
                {
                    {
                        {type = 66, value = 39200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 17500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 17500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 17500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 14000, }, --最大生命值
                        {type = 7, value = 17500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 87500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv1",
                suitId = 142,
                attr =
                {
                    {
                        {type = 66, value = 42000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 26250, }, --最大生命值
                        {type = 7, value = 2625, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 26250, }, --最大生命值
                        {type = 7, value = 2625, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 26250, }, --最大生命值
                        {type = 7, value = 2625, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 26250, }, --最大生命值
                        {type = 7, value = 2625, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv2",
                suitId = 143,
                attr =
                {
                    {
                        {type = 66, value = 44800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 28000, }, --最大生命值
                        {type = 7, value = 2800, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 28000, }, --最大生命值
                        {type = 7, value = 2800, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 28000, }, --最大生命值
                        {type = 7, value = 2800, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 28000, }, --最大生命值
                        {type = 7, value = 2800, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv3",
                suitId = 144,
                attr =
                {
                    {
                        {type = 66, value = 47600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 29750, }, --最大生命值
                        {type = 7, value = 2975, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 29750, }, --最大生命值
                        {type = 7, value = 2975, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 29750, }, --最大生命值
                        {type = 7, value = 2975, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 29750, }, --最大生命值
                        {type = 7, value = 2975, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv4",
                suitId = 145,
                attr =
                {
                    {
                        {type = 66, value = 50400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 31500, }, --最大生命值
                        {type = 7, value = 3150, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 31500, }, --最大生命值
                        {type = 7, value = 3150, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 31500, }, --最大生命值
                        {type = 7, value = 3150, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 31500, }, --最大生命值
                        {type = 7, value = 3150, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv5",
                suitId = 146,
                attr =
                {
                    {
                        {type = 66, value = 53200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 33250, }, --最大生命值
                        {type = 7, value = 3325, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 33250, }, --最大生命值
                        {type = 7, value = 3325, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 33250, }, --最大生命值
                        {type = 7, value = 3325, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 33250, }, --最大生命值
                        {type = 7, value = 3325, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战Lv6",
                suitId = 147,
                attr =
                {
                    {
                        {type = 66, value = 56000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 35000, }, --最大生命值
                        {type = 7, value = 3500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 35000, }, --最大生命值
                        {type = 7, value = 3500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 35000, }, --最大生命值
                        {type = 7, value = 3500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 35000, }, --最大生命值
                        {type = 7, value = 3500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇战LvMax",
                suitId = 148,
                attr =
                {
                    {
                        {type = 66, value = 58800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 36750, }, --最大生命值
                        {type = 7, value = 3675, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 36750, }, --最大生命值
                        {type = 7, value = 3675, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 36750, }, --最大生命值
                        {type = 7, value = 3675, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 36750, }, --最大生命值
                        {type = 7, value = 3675, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv1",
                suitId = 149,
                attr =
                {
                    {
                        {type = 66, value = 42000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 7500, }, --最大生命值
                        {type = 7, value = 30000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7500, }, --最大生命值
                        {type = 7, value = 30000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7500, }, --最大生命值
                        {type = 7, value = 30000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 7500, }, --最大生命值
                        {type = 7, value = 30000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv2",
                suitId = 150,
                attr =
                {
                    {
                        {type = 66, value = 44800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 32000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 32000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 32000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8000, }, --最大生命值
                        {type = 7, value = 32000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv3",
                suitId = 151,
                attr =
                {
                    {
                        {type = 66, value = 47600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 8500, }, --最大生命值
                        {type = 7, value = 34000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8500, }, --最大生命值
                        {type = 7, value = 34000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8500, }, --最大生命值
                        {type = 7, value = 34000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 8500, }, --最大生命值
                        {type = 7, value = 34000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv4",
                suitId = 152,
                attr =
                {
                    {
                        {type = 66, value = 50400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 36000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 36000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 36000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9000, }, --最大生命值
                        {type = 7, value = 36000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv5",
                suitId = 153,
                attr =
                {
                    {
                        {type = 66, value = 53200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 9500, }, --最大生命值
                        {type = 7, value = 38000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9500, }, --最大生命值
                        {type = 7, value = 38000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9500, }, --最大生命值
                        {type = 7, value = 38000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 9500, }, --最大生命值
                        {type = 7, value = 38000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法Lv6",
                suitId = 154,
                attr =
                {
                    {
                        {type = 66, value = 56000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 40000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 40000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 40000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10000, }, --最大生命值
                        {type = 7, value = 40000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇法LvMax",
                suitId = 155,
                attr =
                {
                    {
                        {type = 66, value = 58800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 42000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 42000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 42000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 10500, }, --最大生命值
                        {type = 7, value = 42000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv1",
                suitId = 156,
                attr =
                {
                    {
                        {type = 66, value = 42000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 15000, }, --最大生命值
                        {type = 7, value = 18750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15000, }, --最大生命值
                        {type = 7, value = 18750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15000, }, --最大生命值
                        {type = 7, value = 18750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 15000, }, --最大生命值
                        {type = 7, value = 18750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 90500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv2",
                suitId = 157,
                attr =
                {
                    {
                        {type = 66, value = 44800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 16000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 16000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 16000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 16000, }, --最大生命值
                        {type = 7, value = 20000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 97000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv3",
                suitId = 158,
                attr =
                {
                    {
                        {type = 66, value = 47600, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 17000, }, --最大生命值
                        {type = 7, value = 21250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17000, }, --最大生命值
                        {type = 7, value = 21250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17000, }, --最大生命值
                        {type = 7, value = 21250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 17000, }, --最大生命值
                        {type = 7, value = 21250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 103500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv4",
                suitId = 159,
                attr =
                {
                    {
                        {type = 66, value = 50400, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 18000, }, --最大生命值
                        {type = 7, value = 22500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 18000, }, --最大生命值
                        {type = 7, value = 22500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 18000, }, --最大生命值
                        {type = 7, value = 22500, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 18000, }, --最大生命值
                        {type = 7, value = 22500, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 110000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv5",
                suitId = 160,
                attr =
                {
                    {
                        {type = 66, value = 53200, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 19000, }, --最大生命值
                        {type = 7, value = 23750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19000, }, --最大生命值
                        {type = 7, value = 23750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19000, }, --最大生命值
                        {type = 7, value = 23750, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 19000, }, --最大生命值
                        {type = 7, value = 23750, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 116500, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道Lv6",
                suitId = 161,
                attr =
                {
                    {
                        {type = 66, value = 56000, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 20000, }, --最大生命值
                        {type = 7, value = 25000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 20000, }, --最大生命值
                        {type = 7, value = 25000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 20000, }, --最大生命值
                        {type = 7, value = 25000, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 20000, }, --最大生命值
                        {type = 7, value = 25000, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 123000, }, --抗暴击力
                    },
                },
            },
            {
                name = "秦皇道LvMax",
                suitId = 162,
                attr =
                {
                    {
                        {type = 66, value = 58800, }, --杀怪伤害
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 26250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 26250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 26250, }, --最大魔法值
                    },
                    {
                        {type = 5, value = 21000, }, --最大生命值
                        {type = 7, value = 26250, }, --最大魔法值
                    },
                },
                jobattr =
                {
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                    {
                        {type = 153, value = 129500, }, --抗暴击力
                    },
                },
            },
            
            {
            	name = "主宰",
            	suitId = 163,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
                        {type = 5,	    value = 10000,	},	--生命值

            		},
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
                        {type = 5,	    value = 2788,	},	--生命值
            		},
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
                        {type = 5,	    value = 5580,	},	--生命值
            		},
            	},
            },
            {
            	name = "皓月",
            	suitId = 164,
                 attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 128,	value = 200,	},	--暴击几率
                        {type = 129,	value = 5888,	},	--暴击值
                        {type = 5,  	value = 20000,	},	--生命值

            		},
            		{
                        {type = 128,	value = 200,	},	--暴击几率
                        {type = 129,	value = 5888,	},	--暴击值
                        {type = 5,	    value = 5558,	},	--生命值
            		},
            		{
                        {type = 128,	value = 200,	},	--暴击几率
                        {type = 129,	value = 5888,	},	--暴击值
                        {type = 5,	    value = 11180,	},	--生命值
            		},
            	},
            },
            {
            	name = "热血",
            	suitId = 165,
                 attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 128,	value = 300,	},	--暴击几率
                        {type = 129,	value = 9888,	},	--暴击值
                        {type = 5,	    value = 40000,	},	--生命值

            		},
            		{
                        {type = 128,	value = 300,	},	--暴击几率
                        {type = 129,	value = 9888,	},	--暴击值
                        {type = 5,	    value = 11180,	},	--生命值
            		},
            		{
                        {type = 128,	value = 300,	},	--暴击几率
                        {type = 129,	value = 9888,	},	--暴击值
                        {type = 5,  	value = 22380,	},	--生命值
            		},
            	},
            },

            {
            	name = "神装",
            	suitId = 166,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
            		},
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
            		},
            		{
                        {type = 128,	value = 100,	},	--暴击几率
                        {type = 129,	value = 2888,	},	--暴击值
            		},
            	},
            },

            -- --传世模块
            -- {
            -- 	name = "(a1)",
            -- 	suitId = (a2),
            --     attr =
            --     {
            --     },
            -- 	jobattr =
            -- 	{
            -- 		{
            --             {type = (a3),	value = (a4),	},	--(a5)
            --             {type = (a6),	value = (a7),	},	--(a8)
            --             {type = (a9),	value = (a10),	},	--(a11)
            --             {type = (a12),	value = (a13),	},	--(a14)
            --             {type = (a15),	value = (a16),	},	--(a17)
            --             {type = (a18),	value = (a19),	},	--(a20)
            -- 		},
            -- 		{
            --             {type = (a21),	value = (a22),	},	--(a23)
            --             {type = (a24),	value = (a25),	},	--(a26)
            --             {type = (a27),	value = (a28),	},	--(a29)
            --             {type = (a30),	value = (a31),	},	--(a32)
            --             {type = (a33),	value = (a34),	},	--(a35)
            --             {type = (a36),	value = (a37),	},	--(a38)
            -- 		},
            -- 		{
            --             {type = (a39),	value = (a40),	},	--(a41)
            --             {type = (a42),	value = (a43),	},	--(a44)
            --             {type = (a45),	value = (a46),	},	--(a47)
            --             {type = (a48),	value = (a49),	},	--(a50)
            --             {type = (a51),	value = (a52),	},	--(a53)
            --             {type = (a54),	value = (a55),	},	--(a56)
            -- 		},
            -- 	},
            -- },




            {
            	name = "传世神装",
            	suitId = 167,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 165,	},	--最小物理攻击
                        {type = 11,	value = 328,	},	--最大物理攻击
                        {type = 5,	value = 9888,	},	--战士生命
                        {type = 7,	value = 988,	},	--战士魔法
                        {type = 169,	value = 100,	},	--神圣一击率
                        {type = 170,	value = 3800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 165,	},	--最小魔法攻击
                        {type = 15,	value = 328,	},	--最大魔法攻击
                        {type = 5,	value = 5055,	},	--法师生命
                        {type = 7,	value = 10110,	},	--法师魔法
                        {type = 169,	value = 100,	},	--神圣一击率
                        {type = 170,	value = 3800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 165,	},	--最小道术攻击
                        {type = 19,	value = 328,	},	--最大道术攻击
                        {type = 5,	value = 7518,	},	--道士生命
                        {type = 7,	value = 7518,	},	--道士魔法
                        {type = 169,	value = 100,	},	--神圣一击率
                        {type = 170,	value = 3800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv1",
            	suitId = 168,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 315,	},	--最小物理攻击
                        {type = 11,	value = 628,	},	--最大物理攻击
                        {type = 5,	value = 18888,	},	--战士生命
                        {type = 7,	value = 1888,	},	--战士魔法
                        {type = 169,	value = 200,	},	--神圣一击率
                        {type = 170,	value = 6800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 315,	},	--最小魔法攻击
                        {type = 15,	value = 628,	},	--最大魔法攻击
                        {type = 5,	value = 9555,	},	--法师生命
                        {type = 7,	value = 19110,	},	--法师魔法
                        {type = 169,	value = 200,	},	--神圣一击率
                        {type = 170,	value = 6800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 315,	},	--最小道术攻击
                        {type = 19,	value = 628,	},	--最大道术攻击
                        {type = 5,	value = 14268,	},	--道士生命
                        {type = 7,	value = 14268,	},	--道士魔法
                        {type = 169,	value = 200,	},	--神圣一击率
                        {type = 170,	value = 6800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv2",
            	suitId = 169,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 515,	},	--最小物理攻击
                        {type = 11,	value = 1028,	},	--最大物理攻击
                        {type = 5,	value = 30888,	},	--战士生命
                        {type = 7,	value = 3088,	},	--战士魔法
                        {type = 169,	value = 300,	},	--神圣一击率
                        {type = 170,	value = 9800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 515,	},	--最小魔法攻击
                        {type = 15,	value = 1028,	},	--最大魔法攻击
                        {type = 5,	value = 15555,	},	--法师生命
                        {type = 7,	value = 31110,	},	--法师魔法
                        {type = 169,	value = 300,	},	--神圣一击率
                        {type = 170,	value = 9800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 515,	},	--最小道术攻击
                        {type = 19,	value = 1028,	},	--最大道术攻击
                        {type = 5,	value = 23268,	},	--道士生命
                        {type = 7,	value = 23268,	},	--道士魔法
                        {type = 169,	value = 300,	},	--神圣一击率
                        {type = 170,	value = 9800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv3",
            	suitId = 170,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 765,	},	--最小物理攻击
                        {type = 11,	value = 1528,	},	--最大物理攻击
                        {type = 5,	value = 45888,	},	--战士生命
                        {type = 7,	value = 4588,	},	--战士魔法
                        {type = 169,	value = 400,	},	--神圣一击率
                        {type = 170,	value = 12800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 765,	},	--最小魔法攻击
                        {type = 15,	value = 1528,	},	--最大魔法攻击
                        {type = 5,	value = 23055,	},	--法师生命
                        {type = 7,	value = 46110,	},	--法师魔法
                        {type = 169,	value = 400,	},	--神圣一击率
                        {type = 170,	value = 12800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 765,	},	--最小道术攻击
                        {type = 19,	value = 1528,	},	--最大道术攻击
                        {type = 5,	value = 34518,	},	--道士生命
                        {type = 7,	value = 34518,	},	--道士魔法
                        {type = 169,	value = 400,	},	--神圣一击率
                        {type = 170,	value = 12800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv4",
            	suitId = 171,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 1065,	},	--最小物理攻击
                        {type = 11,	value = 2128,	},	--最大物理攻击
                        {type = 5,	value = 63888,	},	--战士生命
                        {type = 7,	value = 6388,	},	--战士魔法
                        {type = 169,	value = 500,	},	--神圣一击率
                        {type = 170,	value = 15800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 1065,	},	--最小魔法攻击
                        {type = 15,	value = 2128,	},	--最大魔法攻击
                        {type = 5,	value = 32055,	},	--法师生命
                        {type = 7,	value = 64110,	},	--法师魔法
                        {type = 169,	value = 500,	},	--神圣一击率
                        {type = 170,	value = 15800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 1065,	},	--最小道术攻击
                        {type = 19,	value = 2128,	},	--最大道术攻击
                        {type = 5,	value = 48018,	},	--道士生命
                        {type = 7,	value = 48018,	},	--道士魔法
                        {type = 169,	value = 500,	},	--神圣一击率
                        {type = 170,	value = 15800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv5",
            	suitId = 172,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 1415,	},	--最小物理攻击
                        {type = 11,	value = 2828,	},	--最大物理攻击
                        {type = 5,	value = 84888,	},	--战士生命
                        {type = 7,	value = 8488,	},	--战士魔法
                        {type = 169,	value = 600,	},	--神圣一击率
                        {type = 170,	value = 18800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 1415,	},	--最小魔法攻击
                        {type = 15,	value = 2828,	},	--最大魔法攻击
                        {type = 5,	value = 42555,	},	--法师生命
                        {type = 7,	value = 85110,	},	--法师魔法
                        {type = 169,	value = 600,	},	--神圣一击率
                        {type = 170,	value = 18800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 1415,	},	--最小道术攻击
                        {type = 19,	value = 2828,	},	--最大道术攻击
                        {type = 5,	value = 63768,	},	--道士生命
                        {type = 7,	value = 63768,	},	--道士魔法
                        {type = 169,	value = 600,	},	--神圣一击率
                        {type = 170,	value = 18800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv6",
            	suitId = 173,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 1815,	},	--最小物理攻击
                        {type = 11,	value = 3628,	},	--最大物理攻击
                        {type = 5,	value = 108888,	},	--战士生命
                        {type = 7,	value = 10888,	},	--战士魔法
                        {type = 169,	value = 800,	},	--神圣一击率
                        {type = 170,	value = 21800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 1815,	},	--最小魔法攻击
                        {type = 15,	value = 3628,	},	--最大魔法攻击
                        {type = 5,	value = 54555,	},	--法师生命
                        {type = 7,	value = 109110,	},	--法师魔法
                        {type = 169,	value = 800,	},	--神圣一击率
                        {type = 170,	value = 21800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 1815,	},	--最小道术攻击
                        {type = 19,	value = 3628,	},	--最大道术攻击
                        {type = 5,	value = 81768,	},	--道士生命
                        {type = 7,	value = 81768,	},	--道士魔法
                        {type = 169,	value = 800,	},	--神圣一击率
                        {type = 170,	value = 21800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv7",
            	suitId = 174,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 2265,	},	--最小物理攻击
                        {type = 11,	value = 4528,	},	--最大物理攻击
                        {type = 5,	value = 135888,	},	--战士生命
                        {type = 7,	value = 13588,	},	--战士魔法
                        {type = 169,	value = 1000,	},	--神圣一击率
                        {type = 170,	value = 24800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 2265,	},	--最小魔法攻击
                        {type = 15,	value = 4528,	},	--最大魔法攻击
                        {type = 5,	value = 68055,	},	--法师生命
                        {type = 7,	value = 136110,	},	--法师魔法
                        {type = 169,	value = 1000,	},	--神圣一击率
                        {type = 170,	value = 24800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 2265,	},	--最小道术攻击
                        {type = 19,	value = 4528,	},	--最大道术攻击
                        {type = 5,	value = 102018,	},	--道士生命
                        {type = 7,	value = 102018,	},	--道士魔法
                        {type = 169,	value = 1000,	},	--神圣一击率
                        {type = 170,	value = 24800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv8",
            	suitId = 175,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 2765,	},	--最小物理攻击
                        {type = 11,	value = 5528,	},	--最大物理攻击
                        {type = 5,	value = 165888,	},	--战士生命
                        {type = 7,	value = 16588,	},	--战士魔法
                        {type = 169,	value = 1200,	},	--神圣一击率
                        {type = 170,	value = 27800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 2765,	},	--最小魔法攻击
                        {type = 15,	value = 5528,	},	--最大魔法攻击
                        {type = 5,	value = 83055,	},	--法师生命
                        {type = 7,	value = 166110,	},	--法师魔法
                        {type = 169,	value = 1200,	},	--神圣一击率
                        {type = 170,	value = 27800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 2765,	},	--最小道术攻击
                        {type = 19,	value = 5528,	},	--最大道术攻击
                        {type = 5,	value = 124518,	},	--道士生命
                        {type = 7,	value = 124518,	},	--道士魔法
                        {type = 169,	value = 1200,	},	--神圣一击率
                        {type = 170,	value = 27800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv9",
            	suitId = 176,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 3315,	},	--最小物理攻击
                        {type = 11,	value = 6628,	},	--最大物理攻击
                        {type = 5,	value = 198888,	},	--战士生命
                        {type = 7,	value = 19888,	},	--战士魔法
                        {type = 169,	value = 1400,	},	--神圣一击率
                        {type = 170,	value = 30800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 3315,	},	--最小魔法攻击
                        {type = 15,	value = 6628,	},	--最大魔法攻击
                        {type = 5,	value = 99555,	},	--法师生命
                        {type = 7,	value = 199110,	},	--法师魔法
                        {type = 169,	value = 1400,	},	--神圣一击率
                        {type = 170,	value = 30800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 3315,	},	--最小道术攻击
                        {type = 19,	value = 6628,	},	--最大道术攻击
                        {type = 5,	value = 149268,	},	--道士生命
                        {type = 7,	value = 149268,	},	--道士魔法
                        {type = 169,	value = 1400,	},	--神圣一击率
                        {type = 170,	value = 30800,	},	--神圣一击值
            		},
            	},
            },
            {
            	name = "传世神装Lv10",
            	suitId = 177,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 3915,	},	--最小物理攻击
                        {type = 11,	value = 7828,	},	--最大物理攻击
                        {type = 5,	value = 238888,	},	--战士生命
                        {type = 7,	value = 23888,	},	--战士魔法
                        {type = 169,	value = 1600,	},	--神圣一击率
                        {type = 170,	value = 33800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 3915,	},	--最小魔法攻击
                        {type = 15,	value = 7828,	},	--最大魔法攻击
                        {type = 5,	value = 119555,	},	--法师生命
                        {type = 7,	value = 239110,	},	--法师魔法
                        {type = 169,	value = 1600,	},	--神圣一击率
                        {type = 170,	value = 33800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 3915,	},	--最小道术攻击
                        {type = 19,	value = 7828,	},	--最大道术攻击
                        {type = 5,	value = 179268,	},	--道士生命
                        {type = 7,	value = 179268,	},	--道士魔法
                        {type = 169,	value = 1600,	},	--神圣一击率
                        {type = 170,	value = 33800,	},	--神圣一击值
            		},
            	},
            },

             {
            	name = "星☆传世神装Lv1",
            	suitId = 178,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 4615,	},	--最小物理攻击
                        {type = 11,	value = 9228,	},	--最大物理攻击
                        {type = 5,	value = 278888,	},	--战士生命
                        {type = 7,	value = 27888,	},	--战士魔法
                        {type = 169,	value = 1800,	},	--神圣一击率
                        {type = 170,	value = 36800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 4615,	},	--最小魔法攻击
                        {type = 15,	value = 9228,	},	--最大魔法攻击
                        {type = 5,	value = 139555,	},	--法师生命
                        {type = 7,	value = 279110,	},	--法师魔法
                        {type = 169,	value = 1800,	},	--神圣一击率
                        {type = 170,	value = 36800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 4615,	},	--最小道术攻击
                        {type = 19,	value = 9228,	},	--最大道术攻击
                        {type = 5,	value = 209268,	},	--道士生命
                        {type = 7,	value = 209268,	},	--道士魔法
                        {type = 169,	value = 1800,	},	--神圣一击率
                        {type = 170,	value = 36800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv2",
            	suitId = 179,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 5445,	},	--最小物理攻击
                        {type = 11,	value = 10888,	},	--最大物理攻击
                        {type = 5,	value = 328888,	},	--战士生命
                        {type = 7,	value = 32888,	},	--战士魔法
                        {type = 169,	value = 2000,	},	--神圣一击率
                        {type = 170,	value = 39800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 5445,	},	--最小魔法攻击
                        {type = 15,	value = 10888,	},	--最大魔法攻击
                        {type = 5,	value = 164555,	},	--法师生命
                        {type = 7,	value = 329110,	},	--法师魔法
                        {type = 169,	value = 2000,	},	--神圣一击率
                        {type = 170,	value = 39800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 5445,	},	--最小道术攻击
                        {type = 19,	value = 10888,	},	--最大道术攻击
                        {type = 5,	value = 246768,	},	--道士生命
                        {type = 7,	value = 246768,	},	--道士魔法
                        {type = 169,	value = 2000,	},	--神圣一击率
                        {type = 170,	value = 39800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv3",
            	suitId = 180,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 6445,	},	--最小物理攻击
                        {type = 11,	value = 12888,	},	--最大物理攻击
                        {type = 5,	value = 388888,	},	--战士生命
                        {type = 7,	value = 38888,	},	--战士魔法
                        {type = 169,	value = 2200,	},	--神圣一击率
                        {type = 170,	value = 42800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 6445,	},	--最小魔法攻击
                        {type = 15,	value = 12888,	},	--最大魔法攻击
                        {type = 5,	value = 194555,	},	--法师生命
                        {type = 7,	value = 389110,	},	--法师魔法
                        {type = 169,	value = 2200,	},	--神圣一击率
                        {type = 170,	value = 42800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 6445,	},	--最小道术攻击
                        {type = 19,	value = 12888,	},	--最大道术攻击
                        {type = 5,	value = 291768,	},	--道士生命
                        {type = 7,	value = 291768,	},	--道士魔法
                        {type = 169,	value = 2200,	},	--神圣一击率
                        {type = 170,	value = 42800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv4",
            	suitId = 181,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 6945,	},	--最小物理攻击
                        {type = 11,	value = 13888,	},	--最大物理攻击
                        {type = 5,	value = 428888,	},	--战士生命
                        {type = 7,	value = 42888,	},	--战士魔法
                        {type = 169,	value = 2400,	},	--神圣一击率
                        {type = 170,	value = 45800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 6945,	},	--最小魔法攻击
                        {type = 15,	value = 13888,	},	--最大魔法攻击
                        {type = 5,	value = 214555,	},	--法师生命
                        {type = 7,	value = 429110,	},	--法师魔法
                        {type = 169,	value = 2400,	},	--神圣一击率
                        {type = 170,	value = 45800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 6945,	},	--最小道术攻击
                        {type = 19,	value = 13888,	},	--最大道术攻击
                        {type = 5,	value = 321768,	},	--道士生命
                        {type = 7,	value = 321768,	},	--道士魔法
                        {type = 169,	value = 2400,	},	--神圣一击率
                        {type = 170,	value = 45800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv5",
            	suitId = 182,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 7945,	},	--最小物理攻击
                        {type = 11,	value = 15888,	},	--最大物理攻击
                        {type = 5,	value = 488888,	},	--战士生命
                        {type = 7,	value = 48888,	},	--战士魔法
                        {type = 169,	value = 2600,	},	--神圣一击率
                        {type = 170,	value = 48800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 7945,	},	--最小魔法攻击
                        {type = 15,	value = 15888,	},	--最大魔法攻击
                        {type = 5,	value = 244555,	},	--法师生命
                        {type = 7,	value = 489110,	},	--法师魔法
                        {type = 169,	value = 2600,	},	--神圣一击率
                        {type = 170,	value = 48800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 7945,	},	--最小道术攻击
                        {type = 19,	value = 15888,	},	--最大道术攻击
                        {type = 5,	value = 366768,	},	--道士生命
                        {type = 7,	value = 366768,	},	--道士魔法
                        {type = 169,	value = 2600,	},	--神圣一击率
                        {type = 170,	value = 48800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv6",
            	suitId = 183,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 8945,	},	--最小物理攻击
                        {type = 11,	value = 17888,	},	--最大物理攻击
                        {type = 5,	value = 528888,	},	--战士生命
                        {type = 7,	value = 52888,	},	--战士魔法
                        {type = 169,	value = 2800,	},	--神圣一击率
                        {type = 170,	value = 51800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 8945,	},	--最小魔法攻击
                        {type = 15,	value = 17888,	},	--最大魔法攻击
                        {type = 5,	value = 264555,	},	--法师生命
                        {type = 7,	value = 529110,	},	--法师魔法
                        {type = 169,	value = 2800,	},	--神圣一击率
                        {type = 170,	value = 51800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 8945,	},	--最小道术攻击
                        {type = 19,	value = 17888,	},	--最大道术攻击
                        {type = 5,	value = 396768,	},	--道士生命
                        {type = 7,	value = 396768,	},	--道士魔法
                        {type = 169,	value = 2800,	},	--神圣一击率
                        {type = 170,	value = 51800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv7",
            	suitId = 184,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 9945,	},	--最小物理攻击
                        {type = 11,	value = 19888,	},	--最大物理攻击
                        {type = 5,	value = 588888,	},	--战士生命
                        {type = 7,	value = 58888,	},	--战士魔法
                        {type = 169,	value = 3000,	},	--神圣一击率
                        {type = 170,	value = 54800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 9945,	},	--最小魔法攻击
                        {type = 15,	value = 19888,	},	--最大魔法攻击
                        {type = 5,	value = 294555,	},	--法师生命
                        {type = 7,	value = 589110,	},	--法师魔法
                        {type = 169,	value = 3000,	},	--神圣一击率
                        {type = 170,	value = 54800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 9945,	},	--最小道术攻击
                        {type = 19,	value = 19888,	},	--最大道术攻击
                        {type = 5,	value = 441768,	},	--道士生命
                        {type = 7,	value = 441768,	},	--道士魔法
                        {type = 169,	value = 3000,	},	--神圣一击率
                        {type = 170,	value = 54800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv8",
            	suitId = 185,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 10945,	},	--最小物理攻击
                        {type = 11,	value = 21888,	},	--最大物理攻击
                        {type = 5,	value = 628888,	},	--战士生命
                        {type = 7,	value = 62888,	},	--战士魔法
                        {type = 169,	value = 3200,	},	--神圣一击率
                        {type = 170,	value = 57800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 10945,	},	--最小魔法攻击
                        {type = 15,	value = 21888,	},	--最大魔法攻击
                        {type = 5,	value = 314555,	},	--法师生命
                        {type = 7,	value = 629110,	},	--法师魔法
                        {type = 169,	value = 3200,	},	--神圣一击率
                        {type = 170,	value = 57800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 10945,	},	--最小道术攻击
                        {type = 19,	value = 21888,	},	--最大道术攻击
                        {type = 5,	value = 471768,	},	--道士生命
                        {type = 7,	value = 471768,	},	--道士魔法
                        {type = 169,	value = 3200,	},	--神圣一击率
                        {type = 170,	value = 57800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv9",
            	suitId = 186,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 11945,	},	--最小物理攻击
                        {type = 11,	value = 23888,	},	--最大物理攻击
                        {type = 5,	value = 688888,	},	--战士生命
                        {type = 7,	value = 68888,	},	--战士魔法
                        {type = 169,	value = 3400,	},	--神圣一击率
                        {type = 170,	value = 60800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 11945,	},	--最小魔法攻击
                        {type = 15,	value = 23888,	},	--最大魔法攻击
                        {type = 5,	value = 344555,	},	--法师生命
                        {type = 7,	value = 689110,	},	--法师魔法
                        {type = 169,	value = 3400,	},	--神圣一击率
                        {type = 170,	value = 60800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 11945,	},	--最小道术攻击
                        {type = 19,	value = 23888,	},	--最大道术攻击
                        {type = 5,	value = 516768,	},	--道士生命
                        {type = 7,	value = 516768,	},	--道士魔法
                        {type = 169,	value = 3400,	},	--神圣一击率
                        {type = 170,	value = 60800,	},	--神圣一击值
            		},
            	},
            },
 {
            	name = "星☆传世神装Lv10",
            	suitId = 187,
                attr =
                {
                },
            	jobattr =
            	{
            		{
                        {type = 9,	value = 12945,	},	--最小物理攻击
                        {type = 11,	value = 25888,	},	--最大物理攻击
                        {type = 5,	value = 728888,	},	--战士生命
                        {type = 7,	value = 72888,	},	--战士魔法
                        {type = 169,	value = 3600,	},	--神圣一击率
                        {type = 170,	value = 63800,	},	--神圣一击值
            		},
            		{
                        {type = 13,	value = 12945,	},	--最小魔法攻击
                        {type = 15,	value = 25888,	},	--最大魔法攻击
                        {type = 5,	value = 364555,	},	--法师生命
                        {type = 7,	value = 729110,	},	--法师魔法
                        {type = 169,	value = 3600,	},	--神圣一击率
                        {type = 170,	value = 63800,	},	--神圣一击值
            		},
            		{
                        {type = 17,	value = 12945,	},	--最小道术攻击
                        {type = 19,	value = 25888,	},	--最大道术攻击
                        {type = 5,	value = 546768,	},	--道士生命
                        {type = 7,	value = 546768,	},	--道士魔法
                        {type = 169,	value = 3600,	},	--神圣一击率
                        {type = 170,	value = 63800,	},	--神圣一击值
            		},
            	},
            },


            

        
        
        
        
        
        
        
        
        
        ---------------------------------------------------------------------------------------------------------------------------------
        }
    
    
    }
