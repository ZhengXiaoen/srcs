--恶魔岭副本(炼狱副本)配置
fuben_emoling_cfg = {
	fubenid = 65, 
	sceneid = 109,
	need_level = 30,
	enter_count_daily = 2, -- 每日的进入次数
	enter_pos = {-1, -1},
	ready_time = 15, -- 准备时间(秒)
    ref_monster_time = 5, --每波刷新时间
	--game_time = 1200, -- 副本时间(秒)
	total_exp = 3000000, -- 总经验(前端显示)
    renwu_exp = 240000,--主线任务引导进去后，前端显示经验。
	max_refresh_count = 16, -- 最大刷怪波数(前端显示)
	max_guarder_count = 14, -- 最多能放几个守卫
	guarder_monster_type = 5, -- 一键秒杀时需要排除掉守卫这种怪物
	ref_monster = 
    {
        --第一波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},


        },
        --第二波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},

        },
        --第三波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},
            {count=2,mapx=49,mapy=54,range=8,entityid=141},
            {count=2,mapx=49,mapy=54,range=8,entityid=142},
            {count=2,mapx=49,mapy=54,range=8,entityid=143},
            {count=2,mapx=49,mapy=54,range=8,entityid=144},

        },
        --第四波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},

        },
        --第五波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},

        },
        --第六波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},
            {count=2,mapx=49,mapy=54,range=8,entityid=145},
            {count=2,mapx=49,mapy=54,range=8,entityid=146},
            {count=2,mapx=49,mapy=54,range=8,entityid=147},
            {count=2,mapx=49,mapy=54,range=8,entityid=148},

        },
        --第七波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},


        },
        --第八波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},

        },
        --第九波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},
            {count=2,mapx=49,mapy=54,range=8,entityid=149},
            {count=2,mapx=49,mapy=54,range=8,entityid=150},
            {count=2,mapx=49,mapy=54,range=8,entityid=151},
            {count=2,mapx=49,mapy=54,range=8,entityid=152},

        },
        --bOOS
        {
            {count=1,mapx=49,mapy=54,range=8,entityid=153},

        },
           --第十一波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},

        },
           --第十二波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},

        },

           --第十三波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=155},
            {count=2,mapx=49,mapy=54,range=8,entityid=156},
            {count=2,mapx=49,mapy=54,range=8,entityid=157},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},
            {count=2,mapx=49,mapy=54,range=8,entityid=154},

        },
            --第十四波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},

        },
            --第十五波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},

        },
            --第十六波
        {
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=2,mapx=49,mapy=54,range=8,entityid=158},
            {count=2,mapx=49,mapy=54,range=8,entityid=159},
            {count=2,mapx=49,mapy=54,range=8,entityid=160},
            {count=1,mapx=49,mapy=54,range=8,entityid=158},
                       

        },




    },
	guarder_update_consume = {
		{type = 5, count = 100000}, -- 1级升到2级消耗
		{type = 5, count = 200000}, -- 2级升到3级消耗
		-- {type = 5, count = 100000}, -- 3级升到4级消耗
		-- {type = 5, count = 200000}, -- 4级升到5级消耗
},
	
	-- 守卫配置
	guarder_tokens = {		
		-- 毒雾师护卫
		{
			token = { itemid = 1780, consume = {type = 15, count = 10} }, -- 令牌
			guarders = {
				{ monsterid = 136 },
				{ monsterid = 137 },
				{ monsterid = 138 },
				-- { monsterid = 139 },
				-- { monsterid = 140 },
			},
		},

                -- 火炎神护卫
        {
            token = { itemid = 1778, consume = {type = 15, count = 10} }, -- 令牌
            guarders = {
                { monsterid = 126 },
                { monsterid = 127 },
                { monsterid = 128 },
                -- { monsterid = 129 },
                -- { monsterid = 130 },
            },
        },

		--冰法神护卫
		{
			token = { itemid = 1777, consume = {type = 15, count = 10} }, -- 令牌
			guarders = {
				{ monsterid = 121 },
				{ monsterid = 122 },
				{ monsterid = 123 },
				-- { monsterid = 124 },
				-- { monsterid = 125 },
			},
		},


		-- 雷电神护卫
		{
			token = { itemid = 1779, consume = {type = 15, count = 10} }, -- 令牌
			guarders = {
				{ monsterid = 131 },
				{ monsterid = 132 },
				{ monsterid = 133 },
				-- { monsterid = 134 },
				-- { monsterid = 135 },
			},
		},
		
	},

	-- 一键排位消耗
	auto_put_consume = {type = 5, count = 0},
	-- 一键排位的位置(14个), {x位置, y位置}
	fixed_pos_list = { {25,30}, {25,25}, {27,22}, {30,22}, {33,22}, {36,22}, {39,22}, {42,22}, {45,22}, {48,22},
		{51,22}, {54,22}, {57,22}, {60,22}},
		
	-- 一键秒杀
	second_kill = {
		cd = 300, -- CD(秒)
		consume = {type = 15, count = 50},
	},
	
	-- 绝地反击
	call_boss = {
	 	cd = 600, -- CD(秒)
	 	consume = {type = 5, count = 140},
	 	bossid = 162,
	 	pos = {50,16}, --刷怪点。
	 	live_time = 120, -- 存活时间(秒)
	},
	
	-- 领取3倍奖励消耗
	reward_3_consume = {type = 15, count = 29},
	-- 领取5倍奖励消耗
	reward_5_consume = {type = 15, count = 99},
}
