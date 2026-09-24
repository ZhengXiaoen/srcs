 --跨服服务器设置
    CrossServerConfig =
    {
        Is3V3RankServer = 0,    --是否是3v3竞技服务器  w w w .  c n 1 2 1. c o m
        Is3V3ShuntServer = 0,   --是否是3v3竞技分流服务器
        Version = 2,        --跨服服务器当前版本- 用于不同的逻辑服版本
        Address = "127.0.0.1",		--跨服服务器内部通讯ip地址
        Port = 0,			--跨服服务器内部通讯端口
        DartAddress = "172.30.0.6", --远古押镖内部通讯端口
        DartPort = 33102,   --远古押镖内部通讯ip地址
        ShuntAddress = "0", --竞技分流服务器ip
        ShuntPort = 0,  --竞技分流服务器端口
        GateAddress = "139.186.147.172", --跨服服务器的GateServer ip地址
        GatePort = {13007,}, --跨服服务器的GateServer 端口
	    CrossServerIndex = 11111,	--跨服服务器id
	    localBak = 0, --是否本地备份玩家数据(0为不备份, 1为备份)
        MaxPlayCount = 800, --跨服服务器最大人数   800
		EnterSceneLimCount = 50,--限制进入一个场景的数量限制(多于该值则分流)    50
        Npc = {396,397,402}, --允许通行的npcid
		YuanGuZhanChangOpenDay = 6, --远古战场改为开服第13天开启
		ThreeVThreeOpenDay = 6,--3v3也改为开服第13天开启
		YuanGuYaBiAoOpenDay = 6,--远古押镖开启时间
        EnterScene =
        {	
			{
                nSceneId = {403,442,447,452,457,},  --1层
                posx = 134,
                posy = 119,
                minBattlePower = 50000, -- 需要战力最小值
                maxBattlePower = 199999, -- 需要战力最大值
			},
            {
                nSceneId = {404,507,511,515,519,},--2层
                posx = 134,
                posy = 119,
                minBattlePower = 200000, -- 需要战力最小值
                maxBattlePower = 299999, -- 需要战力最大值
			},
			{
                nSceneId = {405,443,448,453,458,}, --3层
                posx = 134,
                posy = 119,
                minBattlePower = 300000, -- 需要战力最小值
                maxBattlePower = 399999, -- 需要战力最大值
			},

			{
                nSceneId = {406,508,512,516,520,}, --4层
                posx = 134,
                posy = 119,
                minBattlePower = 400000, -- 需要战力最小值
                maxBattlePower = 499999, -- 需要战力最大值
			},

			{
                nSceneId = {407,444,449,454,459,}, --5层
                posx = 134,
                posy = 119,
                minBattlePower = 500000, -- 需要战力最小值
                maxBattlePower = 599999, -- 需要战力最大值
			},
			{
                nSceneId = {408,509,513,517,521,}, --6层
                posx = 134,
                posy = 119,
                minBattlePower = 600000, -- 需要战力最小值
                maxBattlePower = 699999, -- 需要战力最大值
			},

			{
                nSceneId = {409,445,450,455,460,}, --7层
                posx = 134,
                posy = 119,
                minBattlePower = 700000, -- 需要战力最小值
                maxBattlePower = 799999, -- 需要战力最大值
			},
			{
                nSceneId = {410,510,514,518,522,}, --8层
                posx = 134,
                posy = 119,
                minBattlePower = 800000, -- 需要战力最小值
                maxBattlePower = 899999, -- 需要战力最大值
			},
            {
                nSceneId = {411,446,451,456,461,}, --9层
                posx = 134,
                posy = 119,
                minBattlePower = 900000, -- 需要战力最小值
                maxBattlePower = 999999, -- 需要战力最大值
			},

            {
                nSceneId = {523,527,531,535,539,}, --10层
                posx = 134,
                posy = 119,
                minBattlePower = 1000000, -- 需要战力最小值
                maxBattlePower = 1099999, -- 需要战力最大值
			},

            {
                nSceneId = {524,528,532,536,540,}, --11层
                posx = 134,
                posy = 119,
                minBattlePower = 1100000, -- 需要战力最小值
                maxBattlePower = 1199999, -- 需要战力最大值
			},

            {
                nSceneId = {525,529,533,537,541,}, --12层
                posx = 134,
                posy = 119,
                minBattlePower = 1200000, -- 需要战力最小值
                maxBattlePower = 1299999, -- 需要战力最大值
			},

            {
                nSceneId = {526,530,534,538,542,}, --13层
                posx = 134,
                posy = 119,
                minBattlePower = 1300000, -- 需要战力最小值
                maxBattlePower = 1499999, -- 需要战力最大值
			},
             --14
			{
			    nSceneId = {576,581,586,591,596,},
                posx = 134, 
                posy = 119,
                minBattlePower = 1500000, -- 需要战力最小值
                maxBattlePower = 1999999, -- 需要战力最大值
			},

            --15
			{
			    nSceneId = {577,582,587,592,597,},
                posx = 134, 
                posy = 119,
                minBattlePower = 2000000, -- 需要战力最小值
                maxBattlePower = 2499999, -- 需要战力最大值
			},
            --16
			{
			    nSceneId = {578,583,588,593,598,},
                posx = 134, 
                posy = 119,
                minBattlePower = 2500000, -- 需要战力最小值
                maxBattlePower = 4999999, -- 需要战力最大值
			},
            --17
			{
			    nSceneId = {579,584,589,594,599,},
                posx = 134, 
                posy = 119,
                minBattlePower = 5000000, -- 需要战力最小值
                maxBattlePower = 7999999, -- 需要战力最大值
			},
            --18
			{
			    nSceneId = {580,585,590,595,600,},
                posx = 134, 
                posy = 119,
                minBattlePower = 8000000, -- 需要战力最小值
                maxBattlePower = -1, -- 需要战力最大值
			},
			
        },
		BiaoCheEnterScene = 
		{
			--1层
			{
			    nSceneId = {462,471,480,489,498,},
                posx = 202, 
                posy = 150,
                minBattlePower = 50000, -- 需要战力最小值
                maxBattlePower = 199999, -- 需要战力最大值
                needYb = 1000, -- 需要元宝  和掉落元宝
			},
			
			--2层
			{
			    nSceneId = {463,472,481,490,499,},
                posx = 202, 
                posy = 150,
                minBattlePower = 200000, -- 需要战力最小值
                maxBattlePower = 299999, -- 需要战力最大值
                needYb = 1000, -- 需要元宝
			},
			
			--3
			{
			    nSceneId = {464,473,482,491,500,},
                posx = 202, 
                posy = 150,
                minBattlePower = 300000, -- 需要战力最小值
                maxBattlePower = 399999, -- 需要战力最大值
                needYb = 2000, -- 需要元宝asda
			},
			
			--4
			{
			    nSceneId = {465,474,483,492,501,},
                posx = 202, 
                posy = 150,
                minBattlePower = 400000, -- 需要战力最小值
                maxBattlePower = 499999, -- 需要战力最大值
                needYb = 2000, -- 需要元宝
			},
			
			--5
			{
			    nSceneId = {466,475,484,493,502,},
                posx = 202, 
                posy = 150,
                minBattlePower = 500000, -- 需要战力最小值
                maxBattlePower = 599999, -- 需要战力最大值
                needYb = 3000, -- 需要元宝
			},
			
			--6
			{
			    nSceneId = {467,476,485,494,503,},
                posx = 202, 
                posy = 150,
                minBattlePower = 600000, -- 需要战力最小值
                maxBattlePower = 699999, -- 需要战力最大值
                needYb = 3000, -- 需要元宝
			},
			
			--7
			{
			    nSceneId = {468,477,486,495,504,},
                posx = 202, 
                posy = 150,
                minBattlePower = 700000, -- 需要战力最小值
                maxBattlePower = 799999, -- 需要战力最大值
                needYb = 4000, -- 需要元宝
			},
			
			--8
			{
			    nSceneId = {469,478,487,496,505,},
                posx = 202, 
                posy = 150,
                minBattlePower = 800000, -- 需要战力最小值
                maxBattlePower = 899999, -- 需要战力最大值
                needYb = 4000, -- 需要元宝
			},
			
			--9
			{
			    nSceneId = {470,479,488,497,506,},
                posx = 202, 
                posy = 150,
                minBattlePower = 900000, -- 需要战力最小值
                maxBattlePower = 999999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

			--10
			{
			    nSceneId = {543,547,551,555,559,},
                posx = 202, 
                posy = 150,
                minBattlePower = 1000000, -- 需要战力最小值
                maxBattlePower = 1099999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

			--11
			{
			    nSceneId = {544,548,552,556,560,},
                posx = 202, 
                posy = 150,
                minBattlePower = 1100000, -- 需要战力最小值
                maxBattlePower = 1199999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

			--12
			{
			    nSceneId = {545,549,553,557,561,},
                posx = 202, 
                posy = 150,
                minBattlePower = 1200000, -- 需要战力最小值
                maxBattlePower = 1299999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

			--13
			{
			    nSceneId = {546,550,554,558,562,},
                posx = 202, 
                posy = 150,
                minBattlePower = 1300000, -- 需要战力最小值
                maxBattlePower = 1999999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},
            --14
			{
			    nSceneId = {624,625,626,627,628,},
                posx = 202, 
                posy = 150,
                minBattlePower = 2000000, -- 需要战力最小值
                maxBattlePower = 2499999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},
            --15
			{
			    nSceneId = {644,645,646,647,648,},
                posx = 202, 
                posy = 150,
                minBattlePower = 2500000, -- 需要战力最小值
                maxBattlePower = 4999999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

            --16
			{
			    nSceneId = {682,683,684,685,686,},
                posx = 202, 
                posy = 150,
                minBattlePower = 5000000, -- 需要战力最小值
                maxBattlePower = 7999999, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

            --17
			{
			    nSceneId = {687,688,689,690,691,},
                posx = 202, 
                posy = 150,
                minBattlePower = 8000000, -- 需要战力最小值
                maxBattlePower = -1, -- 需要战力最大值
                needYb = 5000, -- 需要元宝
			},

           
        


		
		},
        --行会跨服
        GuildEnterScene = 
        {
			{
			    nSceneId = {671,672,673,674,675,676,677,678,679,680,681},
                posx = 131, 
                posy = 65,
                minBattlePower = 3000000, -- 需要战力最小值
                maxBattlePower = -1, -- 需要战力最大值
			},
        },
        ExitScene = 
        {
            nSceneId = 9,
            posx = 134,
            posy = 157,
        },

        --3v3竞技
        Sports =
        {
            Open = 1,   --是否开启该功能
            nFBId = 157,  --竞技地图副本id
            nSceneId = 563,   --副本对应的场景id
            nCountDownTime = 30,    --倒计时时间 秒60
            nContinueTime = 300,    --持续时间 秒
            nLeaveTime = 30,    --离开倒计时- 秒
            nLowLevel = 3,  --最低转数
            nEnterCount = 5,    --每天进入次数
            InitRankPoint = 1000,   --初始化竞技积分值
            nFirstColletPoint = 30, --首次采集得分
            nColletPoint = 15,  --采集得分
            nFirstKillPoint = 40,   --首次击杀得分
            nKillPoint = 20,    --击杀得分
            nAssistsTime = 20,  --助攻时间  秒
            nFirstKillYuanguPoint = 50,--首次击杀额外获得的远古积分
            nFirstCollectYuanguPoint = 50,  --首次采集额外获得的远古积分
            nTeamFirstYuanguPoint = 50, --队伍第一名额外获得的远古积分
            nWinTeamYuanguPoint = 600,  --胜利方获得的远古积分
            nFailedTeamYuanguPoint = 400,   --失败方获得的远古积分
            nReliveTime = 10,        --复活时间 5秒
            nTeam1Corlor =  65280,  --1队颜色
            nTeam2Corlor = 16711680,  --2队颜色
            nMvpAddYuanGu = 50, --MVP增加远古积分
            Collect = --采集配置
            {
                nEntityId = 1110,   --实体id
                nPosX = 125, --x坐标
                nPosY = 130, --Y坐标
                nReliveCd = 10, --复活时间 10秒
            },
            EnterScene =
            {
                --1队进入场景坐标点
                {
                    x = 46,
                    y = 218,
                },
                --2队进入场景坐标点
                {
                    x = 206,
                    y = 43,
                },
            },
            --倒计时进入到传送圈后随机进入的坐标点
            RandomEnterScene = 
            {
                 --1
                { x = 73,y = 79,},
                --2
                {x = 72, y = 181,},
                --3
                { x = 178,y = 180,},
                --4
                {x = 175, y = 78,},
            },
            --奖励
            Award = 
            {
                --胜利方奖励
                {
                    
                },
                --失败方奖励
                {
                    
                },
            },

            --段位信息
            Dan=
            {
                {name ="青铜段位I",min=0,max=1099,},
                {name ="青铜段位II",min=1100,max=1199,},
                {name ="青铜段位III",min=1200,max=1299,},
                {name ="青铜段位Ⅳ",min=1300,max=1399,},
                {name ="青铜段位V",min=1400,max=1499,},
                {name ="白银段位I",min=1500,max=1699,},
                {name ="白银段位II",min=1700,max=1899,},
                {name ="白银段位III",min=1900,max=2099,},
                {name ="白银段位IV",min=2100,max=2299,},
                {name ="白银段位V",min=2300,max=2499,},
                {name ="黄金段位I",min=2500,max=2799,},
                {name ="黄金段位II",min=2800,max=3099,},
                {name ="黄金段位III",min=3100,max=3399,},
                {name ="黄金段位IV",min=3400,max=3699,},
                {name ="黄金段位V",min=3700,max=3999,},
                {name ="钻石段位I",min=4000,max=4399,},
                {name ="钻石段位II",min=4400,max=4799,},
                {name ="钻石段位III",min=4800,max=5199,},
                {name ="钻石段位IV",min=5200,max=5599,},
                {name ="钻石段位V",min=5600,max=5999,},
                {name ="王者段位I",min=6000,max=6499,},
                {name ="王者段位II",min=6500,max=6499,},
                {name ="王者段位III",min=7000,max=7499,},
                {name ="王者段位IV",min=7500,max=7999,},
                {name ="王者段位V",min=8000,max=8499,},
                {name ="至尊段位I",min=8500,max=9499,},
                {name ="至尊段位II",min=9500,max=10499,},
                {name ="至尊段位III",min=10500,max=11499,},
                {name ="至尊段位IV",min=11500,max=12499,},
                {name ="至尊段位V",min=12500,max=999999,},


            },
        },

        --个人竞技
        SingleSports =
        {
            Open = 1,   --是否开启该功能
            nFBId = 206,  --竞技地图副本id
            nSceneId = 670,   --副本对应的场景id
            nCountDownTime = 30,    --倒计时时间 秒60
            nContinueTime = 180,    --持续时间 秒
            nLeaveTime = 10,    --离开倒计时- 秒
            nLowLevel = 3,  --最低转数
            nEnterCount = 0,    --每天进入次数
            InitRankPoint = 1000,   --初始化竞技积分值
            nFirstColletPoint = 30, --首次采集得分
            nColletPoint = 15,  --采集得分
            nFirstKillPoint = 40,   --首次击杀得分
            nKillPoint = 20,    --击杀得分
            nAssistsTime = 20,  --助攻时间  秒
            nFirstKillYuanguPoint = 0,--首次击杀额外获得的远古积分
            nFirstCollectYuanguPoint = 0,  --首次采集额外获得的远古积分
            nTeamFirstYuanguPoint = 0, --队伍第一名额外获得的远古积分
            nWinTeamYuanguPoint = 0,  --胜利方获得的远古积分
            nFailedTeamYuanguPoint = 0,   --失败方获得的远古积分
            nReliveTime = 5,        --复活时间 5秒
            nTeam1Corlor =  65280,  --1队颜色
            nTeam2Corlor = 16711680,  --2队颜色
            nMvpAddYuanGu = 0, --MVP增加远古积分
            Collect = --采集配置
            {
                nEntityId = 1110,   --实体id
                nPosX = 74, --x坐标
                nPosY = 84, --Y坐标
                nReliveCd = 10, --复活时间 10秒
            },
            EnterScene =
            {
                --1队进入场景坐标点
                {
                    x = 44,
                    y = 122,
                },
                --2队进入场景坐标点
                {
                    x = 116,
                    y = 31,
                },
            },
            --倒计时进入到传送圈后随机进入的坐标点
            RandomEnterScene = 
            {
                 --1
                { x = 84,y = 74,},
                --2
                {x = 83, y = 94,},
                --3
                { x = 67,y = 93,},
                --4
                {x = 65, y = 77,},
            },
            --奖励
            Award = 
            {
                --胜利方奖励
                {
                    
                },
                --失败方奖励
                {
                    
                },
            },

            --段位信息
            Dan=
            {
                {name ="青铜段位I",min=0,max=1099,},
                {name ="青铜段位II",min=1100,max=1199,},
                {name ="青铜段位III",min=1200,max=1299,},
                {name ="青铜段位Ⅳ",min=1300,max=1399,},
                {name ="青铜段位V",min=1400,max=1499,},
                {name ="白银段位I",min=1500,max=1699,},
                {name ="白银段位II",min=1700,max=1899,},
                {name ="白银段位III",min=1900,max=2099,},
                {name ="白银段位IV",min=2100,max=2299,},
                {name ="白银段位V",min=2300,max=2499,},
                {name ="黄金段位I",min=2500,max=2799,},
                {name ="黄金段位II",min=2800,max=3099,},
                {name ="黄金段位III",min=3100,max=3399,},
                {name ="黄金段位IV",min=3400,max=3699,},
                {name ="黄金段位V",min=3700,max=3999,},
                {name ="钻石段位I",min=4000,max=4399,},
                {name ="钻石段位II",min=4400,max=4799,},
                {name ="钻石段位III",min=4800,max=5199,},
                {name ="钻石段位IV",min=5200,max=5599,},
                {name ="钻石段位V",min=5600,max=5999,},
                {name ="王者段位I",min=6000,max=6499,},
                {name ="王者段位II",min=6500,max=6499,},
                {name ="王者段位III",min=7000,max=7499,},
                {name ="王者段位IV",min=7500,max=7999,},
                {name ="王者段位V",min=8000,max=8499,},
                {name ="至尊段位I",min=8500,max=9499,},
                {name ="至尊段位II",min=9500,max=10499,},
                {name ="至尊段位III",min=10500,max=11499,},
                {name ="至尊段位IV",min=11500,max=12499,},
                {name ="至尊段位V",min=12500,max=999999,},


            },
        },
        AllowNet = --允许的封包协议
        {
            --缺省登录
            {
                sysid = 0,
                cmdid = {1,5}, --押镖需要与npc对话
            },
            --移动子系统
            {
                sysid = 1,
                cmdid={1,2}, --移动 走和跑
            },
            --技能子系统
            {
                sysid = 5,
                cmdid={1,2,6,8,12,13}, --获取技能列表与使用技能
            },
            --装备子系统
            {
                sysid = 7,
                cmdid={4,5,6,11,12,18}, --获取自身装备,查看其他角色装备
            },
            --背包子系统
            {
                sysid = 8,
                cmdid = {1,2,7}, --获取背包列表 与使用道具
            },
            --聊天子系统
            {
                sysid = 9,
                cmdid ={1,},
            },
            --商城系统
			{
			    sysid = 12,
                cmdid = {1,},
			},
			--拾取系统
			{
			    sysid = 15,
                cmdid = {9,},
			},
			--设置子系统
            {
                sysid = 26,
                cmdid = {30,}
            },  
            --道士宝宝子系统
            {
                sysid = 34,
                cmdid = {1,2,},--设置出战和休息  与 召回
            },
            --坐骑子系统
            {
            	sysid = 42,
                cmdid = {1,2,}, --上坐骑, 下坐骑
            },
            --战将子系统
            {
                sysid = 44,
                cmdid = {1,4,}, --获取英雄列表 与设置英雄状态
            },
            --跨服子系统退出跨服服务器
			{
				sysid = 46,
                cmdid = {8,12},
			},              
            --加速检测
            {
                sysid = 59,
                cmdid = {1,},
            },
            --ai操作
            {
                sysid = 65,
                cmdid = {1,2,3,},
            },
             --注魂
            {
                sysid = 66,
                cmdid = {1,},
            },
            --快捷键子系统
            {
                sysid = 134,
                cmdid ={1,2},
            },            
            --杂项系统
			{
				sysid = 139,
                cmdid = {35,207,},--复活与森罗神戒		
	
			},
            --登录子系统
            {
                sysid = 255,
                cmdid = {1,128,},
            },
            --远古押镖
			{
                sysid = 151,
                cmdid = {30,13,74},
            },
			--血练系统属性
			{
				sysid = 73,
                cmdid = {1},
			},
		
        }
    }