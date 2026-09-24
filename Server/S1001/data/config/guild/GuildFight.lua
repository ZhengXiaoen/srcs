--行会活动- 抵御入侵
GuildFight =
{   
    --客户端配置

    --每级buf增加的百分比
    bufCfg = 
    {
        attack = {20,50,100},--个人攻击buff
        defense = {20,50,100},  --个人防御buff
        guildattack = {20,50,100}, --团队攻击buff
    },
    --按钮tips
    tips = 
    {
        "下级花费%d%d<BR>%d鼓舞Lv%d<BR>增加角色%d%攻击,持续到活动结束",
        "下级花费%d%d<BR>%d鼓舞Lv%d<BR>行会成员消耗元宝鼓舞，增加参与活动行会成员的攻击力%d%。后进入的玩家同样可以享用团体BUFF",
        "下级花费%d%d<BR>点击神兽护体恢复角色生命，限时增加角色防御%d%  1分钟CD",
    },
    --客户端配置End
 --monId =怪物id count=刷怪数量 src_x=源坐标X src_y=源坐标Y dest_x= 目的地坐标X dest_y=目的地坐标Y
    OpenTime = {20,0,21,0}, --开启时间 20点 到21点
    FubenId = 99, --副本地图id
    Time = 3600,--2700, --秒 活动持续时间 45分钟
    MaxIndex = 15,  --最大波数
    --神兽守护的坐标
    Guard =
    {
        monId = 162,
        x = 121,
        y = 108,
    }, 
    --进入场景的角色坐标
    Enter = 
    {
        SceneID = -1,  --进入的场景id【一个副本可能包含多个场景id】
        x = 111,
        y = 107,
    },
    Buff =
    {
    --个人攻击buff
        attack =
        {
           {type=0,value=100000,buff={163,164,165},},
           {type=0,value=500000,buff={166,167,168},},
           {type=0,value=1000000,buff={169,170,171},},
        },
        --个人防御buff
        defense =
        {
           {type=0,value=100000,buff={172,173,174},},
           {type=0,value=200000,buff={175,176,177},},
           {type=0,value=500000,buff={178,179,180},},

        },
        --团队攻击buff
        guildattack=
        {
           {type=3,value=1000,buff={181,182,183},},
           {type=3,value=3000,buff={184,185,186},},
           {type=3,value=8000,buff={187,188,189},},

        },
    },
    Index =
    {
        --第一波
        {
             Time = 120,   --第一波倒计时
             monstr =
            { 
                {
                    monId= 505,
                    count=5,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 506,
                    count=5,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x =170,y=155,},
                        {x =151,y=127,},
                        {x =129,y=115,},
                    },
                    
                },
                                
            },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --羽毛
               -- type = 0, id = 560,count = 1 ,bind = 1,     --1级羽毛
            },
        },
        
        --第二波 
        {
             Time = 120,   --第二波倒计时
             monstr =
             { 
                {
                    monId= 507,
                    count=5,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 508,
                    count=5,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 507,
                    count=5,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
            },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 120,   --第三波倒计时
             monstr =
             { 
                {
                    monId= 509,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 510,
                    count=5,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },

                },
                {
                    monId= 510,
                    count=5,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                                 
            },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
         {
             Time = 120,   --第四波倒计时
             monstr =
             { 
                {
                    monId= 511,
                    count=5,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 512,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 512,
                    count=5,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
          {
             Time = 120,   --第五波倒计时
             monstr =
             { 
                {
                    monId= 513,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 514,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 514,
                    count=5,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },                              
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
          {
             Time = 120,   --第六波倒计时
             monstr =
             { 
                {
                    monId= 515,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 516,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 516,
                    count=5,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 180,   --第七波倒计时
             monstr =
             { 
                {
                    monId= 517,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 518,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 518,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --羽毛
            },
        },
        
         {
             Time = 180,   --第八波倒计时
             monstr =
             { 
                {
                    monId= 519,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 519,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 520,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 180,   --第九波倒计时
             monstr =
             { 
                {
                    monId= 521,
                    count=15,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 522,
                    count=10,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 522,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 180,   --第十波倒计时
             monstr =
             { 
                {
                    monId= 523,
                    count=10,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 523,
                    count=15,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 524,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=95,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 240,   --第十一波倒计时
             monstr =
             { 
                {
                    monId= 525,
                    count=15,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 525,
                    count=15,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 526,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 240,   --第十二波倒计时
             monstr =
             { 
                {
                    monId= 527,
                    count=15,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 528,
                    count=15,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 527,
                    count=10,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 240,   --第十三波倒计时
             monstr =
             { 
                {
                    monId= 529,
                    count=15,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 530,
                    count=15,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 529,
                    count=15,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        
        {
             Time = 240,   --第十四波倒计时
            monstr =
             { 
                {
                    monId= 531,
                    count=20,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 531,
                    count=15,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=129,y=115,},
                    },
                    
                },
                {
                    monId= 531,
                    count=15,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },

        {
             Time = 300,   --第十五波倒计时
             monstr =
             { 
                {
                    monId= 532,
                    count=20,
                    src_x = 41,
                    src_y = 185,
                    dest = 
                    {
                        {x = 64,y=150,},
                        {x=93,y=123,},
                        {x=110,y=114,},
                    },
                    
                },
                {
                    monId= 532,
                    count=20,
                    src_x = 193,
                    src_y = 187,
                    dest = 
                    {
                        {x = 170,y=155,},
                        {x=151,y=127,},
                        {x=125,y=115,},
                    },
                    
                },
                {
                    monId= 532,
                    count=15,
                    src_x = 112,
                    src_y = 36,
                    dest = 
                    {
                        {x = 120,y=60,},
                        {x=119,y=82,},
                        {x=121,y=96,},
                    },
                    
                },
                 
                 
             },
            award=
            {
                money = 500,   --金币
                exp = 500,        --经验
                hudun = 1,       --护盾
            },
        },
        {
             Time = 0,   --最后一波波倒计时
             monstr =
             { 
                
                 
             },
            award=
            {
                money = 0,   --金币
                exp = 0,        --经验
                hudun = 0,       --护盾
            },
        },

    }

}