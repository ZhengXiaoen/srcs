--机器人配置
RobotConfig =
{
    MaxRobot = 1,   --最大数量机器人
    CreateTime = 20,    --二秒创建一个
    EntityId  = 1,      --对应的怪物实体id
    RandVip = 2000,	--随机vip几率/万分比
    LiveTime = 0, --存活时间(秒)，0为永久
    InitScene =     --初始化场景
    {
        SceneId =1,
        X = 82,
        Y = 158,
    },
    --技能id 依次为 战士，法师，道士
    SkillId = 
    {
        3,9,20,
    },
    --动作行为
    --动作注释
    --0 移动 param = 坐标
    --1 站立  param = 秒数
    --2 挂机 param={}
    --3 增加特效  -param={特效类型,特效id}   -未实现
    --4 销毁该机器人 param={}
    --5 设置属性 param={job=职业0为所有,sex=性别,value=值}
    --6 传送
    --7 随机移动
    --8 领取首充超值大礼包广播
    AI =
    { 
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  1, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  19, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  19, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  15, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  15, --当前蓝量
            },
        },
        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --停留十秒
            },
        },

        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  1, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  19, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  19, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  15, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  15, --当前蓝量
            },
        },
        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --男装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  1, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  16, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  16, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  18, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  18, --当前蓝量
            },
        },
        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --女装备
            },
        },

        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  1, --给等级
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --血
               value =  16, --最大血量
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  16, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  18, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  18, --当前蓝量
            },
        },



        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

         {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --停留十秒
            },
        },

        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  1, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  17, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  17, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  13, --最大蓝量
            },
        },

         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  13, --当前蓝量
            },
        },
        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --停留十秒
            },
        },

        {--给等级  
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  1, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  17, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  17, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  13, --最大蓝量
            },
        },

         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  13, --当前蓝量
            },
        },
        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  0, --停留十秒
            },
        },


        {--停留秒数
            Action = 1, --站立
            param =
            {
               time =  3, --停留十秒
            },
        },

        {--寻路到某个坐标点
            Action = 0,
            param = 
            {
                x = 73,
                y = 148,
            },
        },
       
        {--开始给衣服  战士男
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --停留十秒
            },
        },



        {--开始给武器  战士男
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  2, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  124, --给最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  124, --给当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  18, --给最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  18, --给当前蓝量
            },
        },
        {--开始给衣服  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --停留十秒
            },
        },

        {--开始给武器  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  2, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  124, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  124, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  18, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  18, --当前蓝量
            },
        },

        {--开始给衣服  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --停留十秒
            },
        },

        {--开始给武器  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  2, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  18, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  18, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  24, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  24, --当前蓝量
            },
        },
        
        {--开始给衣服  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --停留十秒
            },
        },

        {--开始给武器  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  2, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  18, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  18, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  24, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  24, --当前蓝量
            },
        },

        {--开始给衣服 道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  99, --停留十秒
            },
        },

        {--开始给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  2, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  20, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  20, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  14, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  14, --当前蓝量
            },
        },

         {--开始给衣服  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  100, --停留十秒
            },
        },

        {--开始给武器  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  31, --停留十秒
            },
        },
        {--给等级  
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  2, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  20, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  20, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  14, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  14, --当前蓝量
            },
        },


        {--站立停留若干秒
            Action = 1, --站立
            param =
            {
               time =  2, --停留十秒
            },
        },

        {--自动寻路到打怪点
            Action = 0, 
            param = 
            {
                x = 76,
                y = 141,
            },
        },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  5, --停留秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  3, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  130, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  130, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  22, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  22, --当前蓝量
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  3, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  130, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  130, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  22, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  22, --当前蓝量
            },
        },
        {--给等级  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  3, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  20, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  20, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  30, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  30, --当前蓝量
            },
        },
{--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  3, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  20, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  20, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  30, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  30, --当前蓝量
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  3, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  23, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  23, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  15, --最大蓝量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  15, --当前蓝量
            },
        },
        {--给等级  
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  3, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  23, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  23, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  15, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  15, --当前蓝量
            },
        },

        {--自动寻路到服装店
            Action = 0, --0=寻路
            param = 
            {
                x = 80,
                y = 132,
            },
        },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  2, --停留十秒
            },
        },

        {--开始给衣服  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  1, --停留十秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  8, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  169, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  169, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  39, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  39, --当前蓝量
            },
        },

        {--开始给衣服  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  2, --停留十秒
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  8, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  169, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  169, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  39, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  39, --当前蓝量
            },
        },

        {--开始给衣服  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  1, --停留十秒
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  8, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  33, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  33, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  76, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  76, --当前蓝量
            },
        },

        {--开始给衣服  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  2, --停留十秒
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  8, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  33, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  33, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  76, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  76, --当前蓝量
            },
        },

        {--开始给衣服  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  1, --停留十秒
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  8, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  45, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  45, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  31, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  31, --当前蓝量
            },
        },

        {--开始给衣服  女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  2, --停留十秒
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  8, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  45, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  45, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  31, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  31, --当前蓝量
            },
        },

        {--自动寻路 挂机打鹿
            Action = 0, --0=寻路
            param = 
            {
                x = 62,
                y = 121,
            },
        },
        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  9, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  179, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  179, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  43, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  43, --当前蓝量
            },
        },

        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  9, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  179, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  179, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  43, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  43, --当前蓝量
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  9, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  36, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  36, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  88, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  88, --当前蓝量
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  9, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  36, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  36, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  88, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  88, --当前蓝量
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  9, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  50, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  50, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  35, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  35, --当前蓝量
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  9, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  50, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  50, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  35, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  35, --当前蓝量
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  10, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  189, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  189, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  46, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  46, --当前蓝量
            },
        },

        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  10, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  189, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  189, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  46, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  46, --当前蓝量
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  10, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  39, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  39, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  101, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  101, --当前蓝量
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  10, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  39, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  39, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  101, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  101, --当前蓝量
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  10, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  56, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  56, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  41, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  41, --当前蓝量
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  10, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  56, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  56, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  41, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  41, --当前蓝量
            },
        },
         {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 60,
                y = 111,
            },
        },
            {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路 打怪挂机
            Action = 0, --0=寻路
            param = 
            {
                x = 51,
                y = 104,
            },
    },
          {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },
          {--自动寻路到村民妻子
            Action = 0, --0=寻路
            param = 
            {
                x = 44,
                y = 92,
            },
    },
        
        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  11, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  200, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  200, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  50, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  50, --当前蓝量
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  11, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  200, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  200, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  50, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  50, --当前蓝量
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  11, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  42, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  42, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  115, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  115, --当前蓝量
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  11, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  42, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  42, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  115, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  115, --当前蓝量
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  11, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  62, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  62, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  46, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  46, --当前蓝量
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  11, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  62, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  62, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  46, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  46, --当前蓝量
            },
        },

        {--自动寻路打光头尸兵
            Action = 0, --0=寻路
            param = 
            {
                x = 29,
                y = 72,
            },
    },

    {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

    {--自动寻路到被困村民
            Action = 0, --0=寻路
            param = 
            {
                x = 27,
                y = 67,
            },
    },
        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--开始给衣服  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  17, --停留十秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  12, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  211, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  211, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  53, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  53, --当前蓝量
            },
        },


        {--开始给衣服  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  18, --停留十秒
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  12, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  211, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  211, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  53, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  53, --当前蓝量
            },
        },

        {--开始给衣服  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  17, --停留十秒
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  12, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  45, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  45, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  129, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  129, --当前蓝量
            },
        },

        {--开始给衣服  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  18, --停留十秒
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  12, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  45, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  45, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  129, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  129, --当前蓝量
            },
        },

        {--开始给衣服  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  17, --停留十秒
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  12, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  68, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  68, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  53, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  53, --当前蓝量
            },
        },

        {--开始给衣服  女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  18, --停留十秒
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  12, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  68, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  68, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  53, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  53, --当前蓝量
            },
        },

    {--自动寻路激活战将
            Action = 0, --0=寻路
            param = 
            {
                x = 24,
                y = 64,
            },
    },
        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  10, --停留十秒
            },
    },

    {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 22,
                y = 51,
            },
    },

    {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

        {--自动寻路到神秘人
            Action = 0, --0=寻路
            param = 
            {
                x = 25,
                y = 36,
            },
    },
        
        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  13, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  223, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  223, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  57, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  57, --当前蓝量
            },
        },


        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  13, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  223, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  223, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  57, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  57, --当前蓝量
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  13, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  49, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  49, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  145, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  145, --当前蓝量
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  13, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  49, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  49, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  145, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  145, --当前蓝量
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  13, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  75, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  75, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  59, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  59, --当前蓝量
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  13, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  75, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  75, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  59, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  59, --当前蓝量
            },
        },

        {--自动寻路打蜈蚣
            Action = 0, --0=寻路
            param = 
            {
                x = 37,
                y = 24,
            },
    },

          {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },


    {--自动寻路到寻宝者
            Action = 0, --0=寻路
            param = 
            {
                x = 58,
                y = 36,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  15, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  249, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  249, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  64, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  64, --当前蓝量
            },
        },


        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  15, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  249, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  249, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  64, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  64, --当前蓝量
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  15, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  56, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  56, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  178, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  178, --当前蓝量
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  15, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  56, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  56, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  178, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  178, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  15, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  89, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  89, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  75, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  75, --当前蓝量
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  15, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  89, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  89, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  75, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  75, --当前蓝量
            },
        },

        {--自动寻路打僵尸
            Action = 0, --0=寻路
            param = 
            {
                x = 62,
                y = 45,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

        {--自动寻路到逍遥散人
            Action = 0, --0=寻路
            param = 
            {
                x = 75,
                y = 50,
            },
    },

    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
    {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  20, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  324, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  324, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  81, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  81, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  20, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  324, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  324, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  81, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  81, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  20, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  77, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  77, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  277, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  277, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  20, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  77, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  77, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  277, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  277, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  20, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  131, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  131, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  123, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  123, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  20, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  131, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  131, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  123, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  123, --当前蓝量
            },
        },

        {--自动寻路打尸王
            Action = 0, --0=寻路
            param = 
            {
                x = 87,
                y = 60,
            },
    },

          {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  25, --停留秒
            },
    },

          {--自动寻路到传送守卫
            Action = 0, --0=寻路
            param = 
            {
                x = 94,
                y = 41,
            },
    },
         {--停止2秒
             Action = 1, --站立
             param =
             {
                time =  5, --停留十秒
             },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  22, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  324, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  324, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  81, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  81, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  22, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  324, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  324, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  81, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  81, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  22, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  86, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  86, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  323, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  323, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  22, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  86, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  86, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  323, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  323, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  22, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  150, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  150, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  146, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  146, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  22, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  150, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  150, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  146, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  146, --当前蓝量
            },
        },

--         {--自动寻路
--             Action = 0, --0=寻路
--             param = 
--             {
--                 x = 139,
--                 y = 87,
--             },
--     },

--         {--开始自动挂机
--             Action = 2, --挂机
--             param =
--             {
--                time =  8, --停留秒
--             },
--     },
--     {--自动寻路
--             Action = 0, --0=寻路
--             param = 
--             {
--                 x = 123,
--                 y = 65,
--             },
--     },
--     {--停止2秒
--             Action = 1, --站立
--             param =
--             {
--                time =  5, --停留十秒
--             },
--     },
--     {--给等级  男战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 0, --性别 男
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },

--         {--给血  男战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 0, --性别 男
--                prop = 11, --血
--                value =  358, --最大血量
--             },
--         },
--         {--给血  男战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 0, --性别 男
--                prop = 7, --血
--                value =  358, --当前血量
--             },
--         },
--         {--给蓝  男战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 0, --性别 男
--                prop = 12, --蓝
--                value =  88, --最大蓝量
--             },
--         },
--         {--给蓝  男战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 0, --性别 男
--                prop = 8, --蓝
--                value =  88, --当前蓝量
--             },
--         },


-- {--给等级  女战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 1, --性别 女
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },

--         {--给血  战士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 1, --性别 女
--                prop = 11, --血
--                value =  358, --最大血量
--             },
--         },
--         {--给血  战士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 1, --性别 女
--                prop = 7, --血
--                value =  358, --当前血量
--             },
--         },
--         {--给蓝  女战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 1, --性别 女
--                prop = 12, --蓝
--                value =  88, --最大蓝量
--             },
--         },
--         {--给蓝  女战士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 1,    --战士
--                sex = 1, --性别 女
--                prop = 8, --蓝
--                value =  88, --当前蓝量
--             },
--         },
-- {--给等级  男法师
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 0, --性别 男
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },
--         {--给血  法师男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 0, --性别 男
--                prop = 11, --血
--                value =  101, --最大血量
--             },
--         },

--         {--给血  法师男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 0, --性别 男
--                prop = 7, --血
--                value =  101, --当前血量
--             },
--         },
--         {--给蓝  法师男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 0, --性别 男
--                prop = 12, --蓝
--                value =  398, --最大蓝量
--             },
--         },

--         {--给蓝  法师男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 0, --性别 男
--                prop = 8, --蓝
--                value =  398, --当前蓝量
--             },
--         },
-- {--给等级  女法师
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 1, --性别 女
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },
--         {--给血  法师女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 1, --性别 男
--                prop = 11, --血
--                value =  101, --最大血量
--             },
--         },

--         {--给血  法师女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 1, --性别 女
--                prop = 7, --血
--                value =  101, --当前血量
--             },
--         },
--         {--给蓝  法师女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 1, --性别 女
--                prop = 12, --蓝
--                value =  398, --最大蓝量
--             },
--         },

--         {--给蓝  法师女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 2,    --法师
--                sex = 1, --性别 女
--                prop = 8, --蓝
--                value =  398, --当前蓝量
--             },
--         },
-- {--给等级  男道士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 0, --性别 男
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },

--         {--给血  道士男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 0, --性别 男
--                prop = 11, --血
--                value =  181, --最大血量
--             },
--         },

--          {--给血  道士男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 0, --性别 男
--                prop = 7, --血
--                value =  181, --当前血量
--             },
--         },
--         {--给蓝  道士男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 0, --性别 男
--                prop = 12, --蓝
--                value =  185, --最大蓝量
--             },
--         },
--          {--给蓝  道士男
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 0, --性别 男
--                prop = 8, --蓝
--                value =  185, --当前蓝量
--             },
--         },
-- {--给等级   女道士
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 1, --性别 女
--                prop = 6, --等级
--                value =  25, --给等级
--             },
--         },
        
--         {--给血  道士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 1, --性别 女
--                prop = 11, --血
--                value =  181, --最大血量
--             },
--         },

--          {--给血  道士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 1, --性别 女
--                prop = 7, --血
--                value =  181, --最大血量
--             },
--         },
--         {--给蓝  道士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 1, --性别 女
--                prop = 12, --蓝
--                value =  185, --最大蓝量
--             },
--         },
--          {--给蓝  道士女
--             Action = 5, --设置属性 
--             param =
--             {
--                job = 3,    --道士
--                sex = 1, --性别 女
--                prop = 8, --蓝
--                value =  185, --当前蓝量
--             },
--         },

--       {--自动寻路
--             Action = 0, --0=寻路
--             param = 
--             {
--                 x = 97,
--                 y = 33,
--             },
--     },
--         {--开始自动挂机
--             Action = 2, --挂机
--             param =
--             {
--                time =  8, --停留秒
--             },
--     },
--      {--自动寻路
--             Action = 0, --0=寻路
--             param = 
--             {
--                 x = 98,
--                 y = 28,
--             },
--     },

--         {--停止2秒
--             Action = 1, --站立
--             param =
--             {
--                time =  2, --停留十秒
--             },
--     },
    {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  27, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  454, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  454, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  106, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  106, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  27, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  454, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  454, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  106, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  106, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  27, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  111, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  111, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  453, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  453, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  27, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  111, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  111, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  453, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  453, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  27, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  203, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  203, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  213, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  213, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  27, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  203, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  203, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  213, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  213, --当前蓝量
            },
        },

    {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 9,
               x =  228, 
               y =  241,
            },
    },
        {--停止2秒
             Action = 1, --站立
             param =
             {
                time =  3, --停留十秒
             },
        },
        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 9,
               x =  226, 
               y =  228,
            },
    },
        {--停止2秒
             Action = 1, --站立
             param =
             {
                time =  5, --停留十秒
             },
        },
    
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  19, --停留十秒
            },
        },
        {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  519, --停留十秒
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  519, --停留十秒
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  116, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  116, --当前蓝量
            },
        },

        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  20, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  519, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  519, --停留十秒
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  116, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  116, --当前蓝量
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  19, --男装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  128, --停留十秒
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  128, --停留十秒
            },
        },
         {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  541, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  541, --当前蓝量
            },
        },

        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  20, --女装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  128, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  128, --停留十秒
            },
        },
         {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  541, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  541, --当前蓝量
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  19, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  239, --停留十秒
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  239, --停留十秒
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  261, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  261, --当前蓝量
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  20, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        
        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  239, --停留十秒
            },
        },

        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  239, --停留十秒
            },
        },
          {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  261, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  261, --当前蓝量
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

          {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 222,
                y = 230,
            },
    },

          {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

         {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 214,
                y = 222,
            },
    }, 

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  7, --停留秒
            },
    },
        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 198,
                y = 214,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

     
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2419, --停留十秒
            },
        },

         {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2419, --停留十秒
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1616, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1616, --当前蓝量
            },
        },

        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  2419, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  2419, --停留十秒
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1616, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1616, --当前蓝量
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },
        
        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --男装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  1728, --停留十秒
            },
        },

         {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  1728, --停留十秒
            },
        },
         {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  2341, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  2341, --当前蓝量
            },
        },

        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },
   
        {--给攻击  战士
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --女装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  1728, --停留十秒
            },
        },

         {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  1728, --停留十秒
            },
        },
         {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  2341, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  2341, --当前蓝量
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  1939, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  1939, --停留十秒
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1561, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1561, --当前蓝量
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },
 

        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  30, --停留十秒
            },
        },
        
        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  1939, --停留十秒
            },
        },

         {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  1939, --停留十秒
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1561, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1561, --当前蓝量
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },
   
        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },

            {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 152,
                y = 188,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
    {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  32, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2465, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2465, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1623, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1623, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  32, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2465, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2465, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1623, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1623, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  32, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  1740, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  1740, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  2404, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  2404, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  32, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  1740, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  1740, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  2404, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  2404, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  32, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  1965, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  1965, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1595, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1595, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  32, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  1965, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  1965, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1595, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1595, --当前蓝量
            },
        },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 118,
                y = 192,
            },
    },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  35, --给等级
            },
        },
        {--给VIP  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0,  --性别 男
               vip=1,
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2539, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2539, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1634, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1634, --当前蓝量
            },
        },
        {--给武器  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  35, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2539, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2539, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1634, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1634, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  35, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  1759, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  1759, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  2506, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  2506, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  35, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  1759, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  1759, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  2506, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  2506, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  35, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2006, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2006, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1650, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1650, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  35, --给等级
            },
        },
         {--给VIP  女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, 
               vip=1,
            },
        },  
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2006, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2006, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1650, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1650, --当前蓝量
            },
        },
        {--给武器  女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别  女
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },
    {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 116,
                y = 154,
            },
    },
    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留十秒
            },
    },
    {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  36, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4165, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4165, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1737, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1737, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  36, --给等级
            },
        },
         {--给VIP  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               vip=1,
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4165, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4165, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1737, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1737, --当前蓝量
            },
        },
        {--给武器  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别  男
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  36, --给等级
            },
        },
        {--给VIP  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               vip=1,
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2139, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2139, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  4806, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  4806, --当前蓝量
            },
        },
        {--给武器  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  36, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2139, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2139, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  4806, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  4806, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  36, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2896, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2896, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3000, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3000, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  36, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2896, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2896, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3000, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3000, --当前蓝量
            },
        },
        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 134,
                y = 137,
            },
    },
       {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 6,
               x =  133, 
               y =  22,
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 122,
                y = 30,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  10, --停留秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  37, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4191, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4191, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1741, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1741, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  37, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4191, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4191, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1741, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1741, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  37, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2139, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2139, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  4806, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  4806, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  37, --给等级
            },
        },
         {--给VIP  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               vip=1,
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2139, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2139, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  4806, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  4806, --当前蓝量
            },
        },
        {--给武器  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别  女
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  37, --给等级
            },
        },
         {--给VIP  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 100, --VIP
               value =  1, --VIP等级
            },
        },
        {--停止3秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留3秒
            },
        },
        {--领取VIP礼包
            Action = 8, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               vip=1,
            },
        },
        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2910, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2910, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3019, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3019, --当前蓝量
            },
        },
        {--给武器  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --神器
               vip=1,
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  37, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2910, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2910, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3019, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3019, --当前蓝量
            },
        },

     {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 122,
                y = 30,
            },
    },



    
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --停留十秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  4374, --停留十秒
            },
        },
         {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  4374, --停留十秒
            },
        },

        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --神器
               vip = 1,
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --停留十秒
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  4374, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  4374, --停留十秒
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --男装备
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2145, --停留十秒
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2145, --停留十秒
            },
        },
        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --女装备
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  2145, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  2145, --停留十秒
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  21, --停留十秒
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2925, --停留十秒
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2925, --停留十秒
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  22, --停留十秒
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  40, --给等级
            },
        },

        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2925, --停留十秒
            },
        },
        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2925, --停留十秒
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  15, --停留十秒
            },
        },
        {--vip道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 110,
                y = 42,
            },
          },

          {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
         {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 87,
                y = 71,
            },
    },

          {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 79,
                y = 94,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  41, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4403, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4403, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1755, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1755, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  41, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4403, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4403, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1755, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1755, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  41, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2152, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2152, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  4878, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  4878, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  41, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2152, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2152, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  4878, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  4878, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  41, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2971, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2971, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3103, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3103, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  41, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2971, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2971, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3103, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3103, --当前蓝量
            },
        },

          {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 42,
                y = 119,
            },
    },

          {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 167,
               x =  49, 
               y =  21,
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 49,
                y = 31,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  42, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4432, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4432, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1758, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1758, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  42, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4432, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4432, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1758, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1758, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  42, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2173, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2173, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  4993, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  4993, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  42, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2173, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2173, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  4993, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  4993, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  42, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  2987, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  2987, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3125, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3125, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  42, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  2987, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  2987, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3125, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3125, --当前蓝量
            },
        },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 48,
                y = 51,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  2, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 9,
               x =  87, 
               y =  106,
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 86,
                y = 118,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

      
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  4462, --停留十秒
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  4462, --停留十秒
            },
        },


        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  4462, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  4462, --停留十秒
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --男装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2195, --停留十秒
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2195, --停留十秒
            },
        },
        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },



        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --女装备
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  2195, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  2195, --停留十秒
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  3020, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  3020, --停留十秒
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --停留十秒
            },
        },

         {--给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  43, --停留十秒
            },
        },
        
        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3020, --停留十秒
            },
        },

        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3020, --停留十秒
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 69,
                y = 135,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 77,
                y = 147,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 89,
                y = 155,
            },
    },
          {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 108,
                y = 151,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 146,
                y = 151,
            },
    },
        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 162,
                y = 120,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 170,
                y = 117,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

       {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 178,
                y = 107,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 187,
                y = 98,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 193,
                y = 92,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  8, --停留秒
            },
    },


    
        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --停留十秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  4759, --停留十秒
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  4759, --停留十秒
            },
        },

        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --停留十秒
            },
        },
        {--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  4759, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  4759, --停留十秒
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --男装备
            },
        },
        {--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2268, --停留十秒
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2268, --停留十秒
            },
        },
        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --女装备
            },
        },
        {--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  2268, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  2268, --停留十秒
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  103, --停留十秒
            },
        },
        {--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  3185, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  3185, --停留十秒
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  104, --停留十秒
            },
        },
        {--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  52, --给等级
            },
        },

        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3185, --停留十秒
            },
        },

         {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3185, --停留十秒
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  54, --停留十秒
            },
        },
        {--vip道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

            {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 128,
                y = 135,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  3, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 7,
               x =  144, 
               y =  18,
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 146,
                y = 32,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 135,
                y = 46,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 121,
                y = 68,
            },
    },

       {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 117,
                y = 91,
            },
    },

       {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 97,
                y = 96,
            },
    },
        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 60,
                y = 105,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  54, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4832, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4832, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1800, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1800, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  54, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4832, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4832, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1800, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1800, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  54, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2286, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2286, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  5634, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  5634, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  54, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2286, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2286, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  5634, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  5634, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  54, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  3225, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  3225, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3465, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3465, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  54, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3225, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3225, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3465, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3465, --当前蓝量
            },
        },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 74,
                y = 107,
            },
    },

    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 168,
               x =  20, 
               y =  18,
            },
    },

       {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 24,
                y = 27,
            },
    },

        {--开始自动挂机
            Action = 2, --挂机
            param =
            {
               time =  20, --停留秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 33,
                y = 34,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

        {--传送到下一张地图以及坐标
            Action = 6, --传送
            param =
            {
               sceneid = 9,
               x =  205, 
               y =  77,
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 201,
                y = 77,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
    
        { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 男
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  4869, --停留十秒
            },
        },

         {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  4869, --停留十秒
            },
        },
         {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1804, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1804, --当前蓝量
            },
        },

        {--给称号  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip男战士武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },



        {--战士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  106, --停留十秒
            },
        },
        { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --装备
               value =  4869, --停留十秒
            },
        },

         {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --装备
               value =  4869, --停留十秒
            },
        },
          {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1804, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1804, --当前蓝量
            },
        },

        {--给称号  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip战士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        ----战士的配置

        {---法师男 衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 3, --装备
               value =  105, --男装备
            },
        },

         { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --装备
               value =  2295, --停留十秒
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --装备
               value =  2295, --停留十秒
            },
        },
         {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  5686, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  5686, --当前蓝量
            },
        },

        {--给称号  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip法师男武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },


        { --法师女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 3, --装备
               value =  106, --女装备
            },
        },

        { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --道士
               sex = 1, --性别 女
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 11, --装备
               value =  2295, --停留十秒
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --装备
               value =  2295, --停留十秒
            },
        },
         {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  5686, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  5686, --当前蓝量
            },
        },

        {--给称号  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--给攻击  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip法师女武器
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

       
        { --给衣服，道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  105, --停留十秒
            },
        },
         { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --装备
               value =  3246, --停留十秒
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --装备
               value =  3246, --停留十秒
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3495, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3495, --当前蓝量
            },
        },

        {--给称号  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },


        {--给攻击  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip给武器  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别  男
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

        {--给道士女衣服
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 3, --装备
               value =  106, --停留十秒
            },
        },
        { --给等级
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --装备
               value =  55, --停留十秒
            },
        },
        
        {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3246, --停留十秒
            },
        },

         {--给血
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3246, --停留十秒
            },
        },
          {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3495, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3495, --当前蓝量
            },
        },

        {--给称号
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 141, --称号
               value =  0, --停留十秒
            },
        },

        {--增加攻击100 道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 14, --攻击
               value =  10000, --100点
            },
        },

        {--道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  55, --停留十秒
            },
        },
        {--vip道士女武器
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 41, --武器
               value =  99, --停留十秒
               vip = 1,
            },
        },

            {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 164,
                y = 120,
            },
        },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
        },
        {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  57, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  4945, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  4945, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1811, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1811, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  57, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  4945, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  4945, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1811, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1811, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  57, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2313, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2313, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  5793, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  5793, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  57, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2313, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2313, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  5793, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  5793, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  57, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  3288, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  3288, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3556, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3556, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  57, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3288, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3288, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3620, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3620, --当前蓝量
            },
        },

        {--男战士衣服
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 3, --装备
               value =  105, --停留十秒
            },
        },
     {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 129,
                y = 131,
            },
      },

     {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  1, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 109,
                y = 155,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  2, --停留十秒
            },
    },

    {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 112,
                y = 128,
            },
    },

    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  1, --停留十秒
            },
    },

    {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 122,
                y = 106,
            },
    },

    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  1, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 130,
                y = 94,
            },
    },

        {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },
    {--给等级  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  59, --给等级
            },
        },

        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 11, --血
               value =  5024, --最大血量
            },
        },
        {--给血  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 7, --血
               value =  5024, --当前血量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  1818, --最大蓝量
            },
        },
        {--给蓝  男战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  1818, --当前蓝量
            },
        },


{--给等级  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  59, --给等级
            },
        },

        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 11, --血
               value =  5024, --最大血量
            },
        },
        {--给血  战士女
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 7, --血
               value =  5024, --当前血量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  1818, --最大蓝量
            },
        },
        {--给蓝  女战士
            Action = 5, --设置属性 
            param =
            {
               job = 1,    --战士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  1818, --当前蓝量
            },
        },
{--给等级  男法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 6, --等级
               value =  59, --给等级
            },
        },
        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 11, --血
               value =  2332, --最大血量
            },
        },

        {--给血  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 7, --血
               value =  2332, --当前血量
            },
        },
        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  5904, --最大蓝量
            },
        },

        {--给蓝  法师男
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  5904, --当前蓝量
            },
        },
{--给等级  女法师
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 6, --等级
               value =  59, --给等级
            },
        },
        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 男
               prop = 11, --血
               value =  2332, --最大血量
            },
        },

        {--给血  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 7, --血
               value =  2332, --当前血量
            },
        },
        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  5904, --最大蓝量
            },
        },

        {--给蓝  法师女
            Action = 5, --设置属性 
            param =
            {
               job = 2,    --法师
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  5904, --当前蓝量
            },
        },
{--给等级  男道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 6, --等级
               value =  59, --给等级
            },
        },

        {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 11, --血
               value =  3332, --最大血量
            },
        },

         {--给血  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 7, --血
               value =  3332, --当前血量
            },
        },
        {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 12, --蓝
               value =  3620, --最大蓝量
            },
        },
         {--给蓝  道士男
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 0, --性别 男
               prop = 8, --蓝
               value =  3620, --当前蓝量
            },
        },
{--给等级   女道士
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 6, --等级
               value =  59, --给等级
            },
        },
        
        {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 11, --血
               value =  3332, --最大血量
            },
        },

         {--给血  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 7, --血
               value =  3332, --最大血量
            },
        },
        {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 12, --蓝
               value =  3620, --最大蓝量
            },
        },
         {--给蓝  道士女
            Action = 5, --设置属性 
            param =
            {
               job = 3,    --道士
               sex = 1, --性别 女
               prop = 8, --蓝
               value =  3620, --当前蓝量
            },
        },

       {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 145,
                y = 79,
            },
    },


    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  5, --停留十秒
            },
    },

    {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 121,
                y = 108,
            },
    },

     {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  1, --停留十秒
            },
    },

        {--自动寻路
            Action = 0, --0=寻路
            param = 
            {
                x = 135,
                y = 126,
            },
    },

    {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  10, --停留十秒
            },
    },
    {
            Action = 7, 
            param = 
            {
                x = 131,
                y = 152,
                range=9,
            },
    },
     {--停止2秒
            Action = 1, --站立
            param =
            {
               time =  30, --停留十秒
            },
    },
    {
            Action = 4,
            param=
            {
            },
        },
    },
    Name = 
    {
"茅慧伦",
"云梦瑶",
"古冰婉",
"董佳妮",
"蒙难",
"哦哦哦",
"姚杨坤",
"雷月笙",
"南宫思聪",
"骆铁林",
"蔡伟霆",
"无双の小星",
"纪冠文",
"郭超凡",
"男人的抉择",
"孤单の天华",
"弑神〆国恒",
"聂破仑",
"暗黑版震岳",
"青梅煮茶",
"慕容宝国",
"去大理",
"科尔森",
"限量版伟霆",
"烟雨◆月笙",
"尉迟伊健",
"正义小子",
"成孟达",
"伊宇森",
"范神玄",
"风云つ紫璐",
"宇文冠英",
"终极杀戮",
"神马情况",
"茅山道神",
"第一武士",
"魏克勤",
"龙语",
"传说中的菲儿",
"诸葛婉露",
"西门娜娜",
"伊忆莲",
"小牛牛",
"韩开复",
"封子健",
"董立波",
"宋国恒",
"最爱你",
"董梦辰",
"红中",
"郭天华",
"英雄不流泪",
"庄徽因",
"武腾飞",
"司马子华",
"巨人般的治廷",
"程稀哲",
"徐婷婷",
"刘芷若",
"元艺谋",
"枫溪",
"雷震岳",
"庞楚生",
"梁霜华",
"符文乐",
"梁亚鹏",
"weiwei",
"包小凤",
"联盟审判",
"符耀威",
"豆浆油条",
"纪铁柱",
"黑鸟鸦杏花",
"水火不容",
"你有毒",
"哈贝了",
"方润发",
"籠鵟",
"夏侯咏琳",
"天伦梦断",
"我是小白",
"光炎",
"马思诚",
"恒福路",
"博哥",
"彭锦江",
"黄云迪",
"马雅莉",
"爱到底",
"司马舟子",
"张朝伟",
"江天桥",
"lihao",
"龙化腾",
"封锁我的记忆",
"宏图霸业",
"道尊一笑",
"姚宝国",
"张耀威",
"胡荣浩",
"姿剑锋",
"光炎",
"马思诚",
"恒福路",
"博哥",
"彭锦江",
"黄云迪",
"马雅莉",
"爱到底",
"司马舟子",
"张朝伟",
"江天桥",
"lihao",
"龙化腾",
"封锁我的记忆",
"宏图霸业",
"道尊一笑",
"姚宝国",
"张耀威",
"胡荣浩",
"姿剑锋",
"东方振宇",
"尼古拉斯生存",
"没谁了",
"相隔万重山",
"封妹妹",
"打工的",
"一体同心",
"该走的时候",
"一劍飛红",
"一野情",
"本性风流",
"玉面彡健翔",
"宇文和伟",
"开信维蝶",
"花语巧言",
"霍卡卡",
"小霜",
"毕毕宝",
"限量版咏麟",
"宁钰淇",
"希萌建龙",
"bfkss",
"韩韩帅",
"风情羽翼",
"邹一刀",
"浅笑丶醉红颜",
"周铄哲",
"钟学友",
"无怨的无悔",
"浅晿圊春",
"蔡卫健",
"传奇王者",
"温敏镐",
"龙立新",
"我是谁的谁",
"钟逸迅",
"愛請守護",
"少卿少阳",
"融雪之前",
"风一般的碧霞",
"魏天华",
"贺有朋",
"夜半惊魂",
"浅仓彩音",
"汪雨霏",
"尉迟天乐",
"聖仕莲毛衣",
"季亚男",
"玉面彡晓龙",
"土豪恺威",
"江道明",
"三国丶冷虹",
"龙学友",
"唐三三",
"阮荣浩",
"洪岳伦",
"风凌大佑",
"完颜海泉",
"苍华强",
"若天溪",
"杨艺兴",
"朱贝娜",
"九子天魔",
"好好过吧",
"袁巴马",
"迹痕魔女圣",
"疯婆娘",
"引领右脑",
"孙思诚",
"国民老公",
"杨英东",
"诸葛亦菲",
"真情难舍",
"金媛媛",
"叶小龙",
"江梓萱",
"秦浚龙",
"加州靡情",
"夏侯中基",
"被蹂躏的艺谋",
"梁本山",
"独家治廷",
"袁巴马",
"迹痕魔女圣",
"疯婆娘",
"引领右脑",
"孙思诚",
"国民老公",
"杨英东",
"诸葛亦菲",
"真情难舍",
"金媛媛",
"叶小龙",
"江梓萱",
"秦浚龙",
"加州靡情",
"夏侯中基",
"被蹂躏的艺谋",
"梁本山",
"独家治廷",
"满才",
"弑神小明",
"方寸",
"超越神的驰航",
"大发叔艺谋",
"邓云迪",
"无双祖儿",
"弑神达华",
"叶援朝",
"蔡荣浩",
"完颜贤齐",
"无可非议",
"神无月灵",
"孔铁柱",
"无情坏蛋",
"独家小明",
"彩虹的微笑",
"王令辉",
"蓝铁柱",
"宋盈盈",
"拉仔",
"工作以后",
"徐飞",
"射分叉的晓琪",
"暗香冠希",
"辛无双",
"苏永浩",
"JUJK",
"暗朝伟",
"传说中的丽颖",
"一天一日的峥",
"钱梦辰",
"爱后面的艺谋",
"夏三桂",
"下面吃的奇隆",
"王子维",
"玉面翠山",
"风一般的一刀",
"风一般的安琪",
"石头剪刀",
"月光心慌",
"公孙永序",
"罗小星",
"郭秋生",
"江南家驹",
"你的宠物",
"沈彩华",
"小心眼",
"宋雅茹",
"裴吹雪",
"限量版宗南",
"江南援朝",
"徐天桥",
"天鬼",
"辛小龙",
"苦涩微甜",
"倾城思聪",
"苍子华",
"再见我的爱人",
"张传志",
"夏力宏",
"孔素素",
"传说中的健林",
"慕容自成",
"乔翠山",
"欧阳英东",
"白辣椒",
"被蹂躏的刀郎",
"伊佳莹",
"自己小号",
"柳子强",
"被蹂躏的亦菲",
"限量版雨霏",
"宇文白洁",
"神摇意夺",
"乐圣之爱",
"夏侯昊然",
"爱不释手",
"上官灵珊",
"尹秋生",
"农村暴发户",
"成大器",
"我不是峥",
"伊佳莹",
"自己小号",
"柳子强",
"被蹂躏的亦菲",
"限量版雨霏",
"宇文白洁",
"神摇意夺",
"乐圣之爱",
"夏侯昊然",
"爱不释手",
"上官灵珊",
"尹秋生",
"农村暴发户",
"成大器",
"我不是峥",
"执念",
"芣蓠芣棄",
"再唱这首歌",
"完颜小星",
"后会丶无期",
"元光标",
"限量版小钢炮",
"洛兮",
"逆天战神",
"乡恋",
"古楚生",
"力神",
"蓝国卿",
"巨人般的宗南",
"范润发",
"林力宏",
"君临艺兴",
"即使不爱",
"烟雨腾飞",
"张梦雪",
"毛志强",
"独家思琦",
"聂楚生",
"狂迷",
"陈国斌",
"大叔立行",
"姚永浩",
"義氣皇城",
"祝灏明",
"韩莹",
"暗香雨生",
"罗正非",
"包卫健",
"龙头",
"明兴社丶龙头",
"聚义丶宋江",
"冷祖蓝",
"我爱过你",
"黑色天使",
"爱情的旅程",
"张红雷",
"傅小星",
"呵呵呵",
"西园男孩",
"周易峰",
"毕貝貝寶寶",
"施逆邪",
"聚少离别多",
"南宫大宇",
"风云卫健",
"小法不狠",
"蔡菲",
"黄文军",
"令狐富城",
"倾城冰婉",
"木德耐",
"木德乃",
"莫佳莹",
"黑色战场",
"超越神的菲儿",
"姚浩明",
"斗斗",
"景岳伦",
"烟雨灵珊",
"风云兆伦",
"独家雨霏",
"吕亦帆",
"雪拥蓝关",
"江南继科",
"寄我一身",
"帅到掉渣的浩",
"青灵亚文",
"卢一菲",
"小三别跑",
"谢国荣",
"弑神春秋",
"何巨长",
"猪猪侠棒棒糖",
"云永康",
"想子",
"理想",
"宁国荣",
"柯一山",
"宁岩松",
"狄思琦",
"青灵せ雨生",
"上官德纲",
"吕亦帆",
"雪拥蓝关",
"江南继科",
"寄我一身",
"帅到掉渣的浩",
"青灵亚文",
"卢一菲",
"小三别跑",
"谢国荣",
"弑神春秋",
"何巨长",
"猪猪侠棒棒糖",
"云永康",
"想子",
"理想",
"宁国荣",
"柯一山",
"宁岩松",
"狄思琦",
"青灵せ雨生",
"上官德纲",
"花蓉",
"纤丶纤",
"欧阳丶纤纤",
"绝品的修罗",
"午夜之魔",
"洪宗宪",
"胡书豪",
"金大力",
"风一般的书宏",
"向一刀",
"聂天华",
"孤单建豪",
"天涯侠女",
"谭卓腾",
"庞海涛",
"卢华强",
"毕晓龙",
"庄布斯",
"霍永元",
"沈逸迅",
"传说中的世民",
"萧无忌",
"孤单昊然",
"方杨坤",
"宁无忌",
"成笨笨",
"推倒力宏",
"司健翔",
"弑神银月",
"狄达华",
"聂克勤",
"史灏明",
"茅白洁",
"土豪国荣",
"啊九",
"啊九a",
"王者之气萌萌",
"宋又琪",
"楚天孤",
"强子",
"乔朵朵",
"烟雨◆紫衣",
"千手观音",
"仙女道姑",
"静静的雨",
"蒋梦雪",
"庞家辉",
"君临浩明",
"傅忆莲",
"汪祖蓝",
"完颜兰特",
"司马杰伦",
"爱后面的文静",
"尉迟奕迅",
"董浩龙",
"段灏明",
"无双の文乐",
"比奇国王",
"弑神〆海波",
"包雨生",
"薛大力",
"云三桂",
"我爱xjj",
"张丽媛",
"洪三少",
"宋圆圆",
"骑着小马看海",
"阿斯蒂芬",
"规划局法国人",
"习永元",
"一缕清风",
"晓晓の爱",
"妇女之友超",
"季冠文",
"烟雨◆布斯",
"冷志炫",
"雨意θ敬明",
"任俊晖",
"烟雨◆腾飞",
"流星剑",
"包雨生",
"薛大力",
"云三桂",
"我爱xjj",
"张丽媛",
"洪三少",
"宋圆圆",
"骑着小马看海",
"阿斯蒂芬",
"规划局法国人",
"习永元",
"一缕清风",
"晓晓の爱",
"妇女之友超",
"季冠文",
"烟雨◆布斯",
"冷志炫",
"雨意θ敬明",
"任俊晖",
"烟雨◆腾飞",
"流星剑",
"霹雳火",
"霹雳火神",
"限量版舟子",
"霹雳",
"完颜艳芳",
"青灵せ稀哲",
"周世民",
"紫涵来了",
"永远爱着你",
"上官凯哥",
"尚永信",
"暗香※正非",
"下面吃的俊晖",
"霍香香",
"巨人般的建豪",
"向晓明",
"战神传说",
"袁雯婕",
"烈火一刀",
"大牌",
"勤俭节约是美",
"罗志炫",
"吴家辉",
"系哦啊哦",
"葫芦娃道士",
"唐荣浩",
"雷龙",
"烧伤专科",
"苏香香",
"封恋花",
"袁飞",
"如风何爱",
"我不是开复",
"还像昨天",
"金門菜刀王",
"linlin",
"冯飞",
"苏碧霞",
"华锦江",
"卢大宇",
"伊羽泉",
"敢爱敢恨",
"蓝杨坤",
"董静仪",
"沈卫龙",
"爱你宝贝",
"推倒妹妹",
"被揉了你的",
"阿修罗闺蜜",
"松曙光",
"射分叉的梦莎",
"蓝婉儿",
"巨人般的碧霞",
"丹玲",
"痴男怨女",
"逍遥狼族",
"乡愁四韵伦",
"物依",
"Kim小黑",
"南宫孤城",
"天地英豪华",
"让花儿为你开",
"谭一刀",
"小旭",
"狄文东",
"夏侯彦宏",
"軒丶",
"董英东",
"知己幸福",
"傅仕鹏",
"冷颜",
"我以为",
"骆依婷",
"嫂子丶不要啊",
"陆宝国",
"任子萱",
"老杨",
"黎峥",
"红极一时的超",
"专注",
"Kim小黑",
"南宫孤城",
"天地英豪华",
"让花儿为你开",
"谭一刀",
"小旭",
"狄文东",
"夏侯彦宏",
"軒丶",
"董英东",
"知己幸福",
"傅仕鹏",
"冷颜",
"我以为",
"骆依婷",
"嫂子丶不要啊",
"陆宝国",
"任子萱",
"老杨",
"黎峥",
"红极一时的超",
"专注",
"明煜宝宝",
"蒼靜",
"南宫娜娜",
"不要爱她",
"大表姐",
"傅寻欢",
"神法天恕",
"孔流翔",
"符润发",
"赵志强",
"何本山",
"翼星",
"独孤小明",
"唐玉莹",
"祝镇业",
"文刀秉三金",
"尚卫平",
"销魂玉",
"杨冬槐",
"天涯老鬼",
"欧阳大人",
"大叔灬岳伦",
"天堂不归的超",
"伊腾飞",
"郭流翔",
"无声说爱你",
"老衲喝多了",
"萧贝娜",
"方诗韵",
"段小帅",
"小肥羊",
"敬旺怀翔",
"人弃我取",
"钱依婷",
"司徒艺兴",
"慕容展云",
"三秒钟的云飞",
"相思在梦里",
"暗黑版祖蓝",
"符紫萱",
"蓝文静",
"孔子强",
"尉迟紫萱",
"镇武",
"庞志强",
"胡国荣",
"风一般的建豪",
"动听",
"黎天乐",
"忘情忘爱",
"尹治廷",
"游魂",
"坚强舟子",
"文叫兽",
"油腻腻",
"裴晓明",
"莫天宇",
"令狐绮贞",
"唐震岳",
"爱丽丝",
"乔卫平",
"你像从前一样",
"唐华强",
"柳浚龙",
"妇女之友志安",
"紫色霞光",
"姐脱丶啪啪啪",
"佟国恒",
"三秒钟的语嫣",
"不觉技痒",
"洪卫健",
"枚遇",
"无知的花花",
"君临梓萱",
"尉迟中山",
"狄双儿",
"庄宇轩",
"六月恋雪i",
"松立新",
"月小",
"唐华强",
"柳浚龙",
"妇女之友志安",
"紫色霞光",
"姐脱丶啪啪啪",
"佟国恒",
"三秒钟的语嫣",
"不觉技痒",
"洪卫健",
"枚遇",
"无知的花花",
"君临梓萱",
"尉迟中山",
"狄双儿",
"庄宇轩",
"六月恋雪i",
"松立新",
"月小",
"蓝色天空",
"血残夕阳",
"任幂",
"弑神昊然",
"小小的蜡烛",
"宇文安琪",
"传说中的达华",
"天宫",
"汉雄慧俏",
"倾城三少",
"好疮疤忘痛",
"大地禾圆",
"封语嫣",
"雨意光标",
"爱的掌门人",
"孙孟泽",
"土豪月笙",
"钱志炫",
"轩辕有朋",
"暗香艺兴",
"尹文乐",
"玉面镇业",
"巩曙光",
"毕超凡",
"尹小刚",
"薇姬恨史",
"夏国藩",
"关宗宪",
"东惊热牛",
"郑永序",
"辛冰冰",
"无双文强",
"陈朝阳",
"公孙灵珊",
"诸葛妍希",
"孙亚男",
"bonm",
"叶国卿",
"Kiss文",
"傅中山",
"风云共舞",
"独孤水云",
"传说中的海泉",
"西欧天使",
"尉迟剑锋",
"南宫玉莹",
"隔壁腐女i",
"江流翔",
"红发凝琴",
"唐少聪",
"朱永浩",
"苍狼女神",
"雷艳芳",
"阿牛",
"关志炫",
"萧卫龙",
"季梦莎",
"松本山",
"锐王",
"弑神婷婷",
"杀猪匠",
"骆润发",
"我是庞洋",
"对方是否",
"任玉莹",
"尉迟筱婕",
"元诗诗",
"伊浩明",
"项敏镐",
"易艳芳",
"墨迹",
"刘天星",
"沈冠英",
"风一般的天宇",
"萧志玲",
"元天宇",
"一个我",
"青灵敬腾",
"王要勃",
"祖海涛",
"范三桂",
"君临爱",
"傅爱",
"柯超",
"北方的狼",
"刘天星",
"沈冠英",
"风一般的天宇",
"萧志玲",
"元天宇",
"一个我",
"青灵敬腾",
"王要勃",
"祖海涛",
"范三桂",
"君临爱",
"傅爱",
"柯超",
"北方的狼",
"火色夕枫",
"杨倾城",
"成宝国",
"龍騰九洲",
"佟顶天",
"冯天华",
"五百",
"包本山",
"马听雨",
"蒋蓉",
"弑神十八",
"钟吹雪",
"骆香香",
"婉若清",
"钟宗南",
"豪放的三少",
"赵紫菱",
"控制师",
"青灵子丹",
"张翰",
"诸神之战",
"爱后面的克群",
"咋滴",
"咏麟",
"丶悠上校",
"华近南",
"毕婉儿",
"关富城",
"龙牙",
"包赵金咏",
"苍建联",
"幸福老冰棍",
"烟雨俊辉",
"麻疯怪拳",
"江南逸迅",
"玉柱",
"易一山",
"帅哥张耿",
"温诗曼",
"莫青云",
"裴艺兴",
"陆传志",
"卫秋水",
"丁宇森",
"陈宝亮",
"东方梦莎",
"风云振龙",
"风凌羽凡",
"易小明",
"司马健翔",
"轩辕星驰",
"何国卿",
"天琪",
"穆晓东",
"雨不眠旳下",
"景立新",
"符雨生",
"再回到从前",
"文驰航",
"雷欣桐",
"君临含姿",
"司马宇森",
"晓晓晓晓道",
"皇甫婉华",
"男左",
"風男子",
"疯战",
"传说中的冰冰",
"云羽",
"超越神的宇森",
"宁蓉",
"吕楚红",
"邓香香",
"人生自由自在",
"期待曾经的爱",
"文楚楚",
"小云",
"小云呀",
"不太会玩",
"独身",
"朽木",
"云中龙",
"大叔小",
"秃子",
"炫灬云",
"炫灬风",
"限量版心如",
"道可道一",
"寂寞mm",
"云羽",
"超越神的宇森",
"宁蓉",
"吕楚红",
"邓香香",
"人生自由自在",
"期待曾经的爱",
"文楚楚",
"小云",
"小云呀",
"不太会玩",
"独身",
"朽木",
"云中龙",
"大叔小",
"秃子",
"炫灬云",
"炫灬风",
"限量版心如",
"道可道一",
"寂寞mm",
"大炮",
"炮妹",
"龍战丶强子",
"幻刀",
"极致",
"彭连杰",
"夜寻欢",
"老子潇洒",
"何笨笨",
"单机版玩家",
"花卫健",
"玉面彡润发",
"霸气小牛牛",
"狙击手",
"弑神〆振龙",
"苍刀郎",
"太史雯婕",
"fchhhh",
"君临※力宏",
"八八",
"青灵せ小星",
"许寻欢",
"风云つ百祥",
"墨翠",
"独孤紫萱",
"独家メ恺威",
"冯宝莲",
"独舞",
"雨意θ洪烈",
"暝瞳",
"薛紫衣",
"杨文杰",
"曹继科",
"钟一菲",
"司徒晓明",
"曾宝国",
"魏云飞",
"封与修",
"倪天凯",
"糕学成",
"辛岩松",
"晓月",
"无双の敬媛",
"莫子祥",
"烟雨◆志杰",
"紫宫初雪",
"聂祖儿",
"热辣辣",
"狂龙小号",
"杨小明",
"柔情",
"卫文乐",
"沈晓明",
"伊苏阳光",
"巨人般的香香",
"谢晓东",
"放纵",
"丿馒头丶",
"霸天丶MC",
"罗润东",
"姻脂水粉",
"贺俊晖",
"大叔灬志祥",
"司空天宇",
"向翠山",
"司徒涟漪",
"纯洁的你",
"祝剑锋",
"谢小莹",
"寂寞丿态度",
"三秒钟的国荣",
"江小星",
"孙志祥",
"司徒听雨",
"谢黎明",
"乘龙快婿",
"叶志杰",
"陆亦菲",
"被蹂躏的幂",
"谢浚龙",
"雅贤我女王",
"黄翠山",
"齐文军",
"妖儿",
"丁香花",
"司徒紫萱",
"许朵朵",
"尚羽琦",
"你叫我心醉",
"小战",
"直男村",
"快乐",
"君子",
"酷酷的晨晨丶",
"郑子聪",
"赵文军",
"起点",
"司空道明",
"苏天宇",
"程俊杰",
"jj大西瓜",
"媚姬",
"挥戈退非",
"快乐",
"君子",
"酷酷的晨晨丶",
"郑子聪",
"赵文军",
"起点",
"司空道明",
"苏天宇",
"程俊杰",
"jj大西瓜",
"媚姬",
"挥戈退非",
"董艳芳",
"祖志雄",
"爱新觉罗敬明",
"推倒卡卡",
"灰虫子",
"朱昊炅",
"洪英东",
"楼上老李",
"水冰月",
"小裱砸",
"p你裤衩",
"销魂",
"陈奕迅",
"你发疯呢",
"前程似锦",
"微微安公主",
"李鸿飞",
"任朝伟",
"不战多年",
"大吃亿精的峥",
"夜雨潇湘",
"向春秋",
"弑神丿魔圣彡",
"华大海",
"孤单三少",
"大叔灬渤",
"蓝大为",
"冷超凡",
"一劍江湖",
"温羽泉",
"涌出海面",
"杨艳芳",
"蓝蓝的海",
"曾承旭",
"谭彦宏",
"啊差点是美女",
"潇洒灬爺",
"对付我",
"程学暄",
"柯伟霆",
"良良",
"何宇轩",
"小妮七号",
"骆栎鑫",
"姚志炫",
"神焦鬼烂",
"半夜打糍粑",
"莫紫函",
"蛇之灵",
"司马小凤",
"暗香光标",
"大叔迪文",
"南宫冠希",
"司马艳芳",
"挣脱",
"宇文三桂",
"推倒冰冰",
"灵魂摆渡者",
"一种帅儿",
"易光标",
"庞化腾",
"风一般的有朋",
"铠甲",
"嚣张太坏",
"佟卓腾",
"轩辕中山",
"阿尔伯特鱼",
"季布斯",
"辛敏镐",
"女王大人的峥",
"苍大力",
"黑子",
"蔡晓芙",
"冷贝宁",
"卫菲",
"青灵振宇",
"邹破仑",
"穆巴马",
"魏卓妍",
"谢要勃",
"弑神狗蛋",
"皇甫海波",
"佟恋花",
"风凌富城",
"霸气萌萌",
"宇文岩松",
"夏兰特",
"善游者溺",
"卫菲",
"青灵振宇",
"邹破仑",
"穆巴马",
"魏卓妍",
"谢要勃",
"弑神狗蛋",
"皇甫海波",
"佟恋花",
"风凌富城",
"霸气萌萌",
"宇文岩松",
"夏兰特",
"善游者溺",
"神机子",
"乱世春秋",
"轩辕国卿",
"猕猴桃丶",
"超越神的国庆",
"胸有大痔的峥",
"庞志炫",
"那年冬天",
"尉迟汉良",
"威武威武",
"郭媛媛",
"彭曙光",
"三秒钟的志颖",
"梁传志",
"一夜清风",
"江南寻欢",
"玉面志刚",
"我不是卓腾",
"苍国卿",
"元诗韵",
"许国荣",
"冷留香",
"风一般的秋生",
"魏大为",
"杨国驹",
"弑神永序",
"丁亦帆",
"吕传志",
"项渤",
"罗俊杰",
"杜芷若",
"传说中的洪烈",
"神侯",
"叶十八",
"茅子丹",
"逍遥小魔头",
"逍遥公子",
"逍遥小公子",
"段家驹",
"董媛媛",
"小盀",
"林健林",
"卫巨基",
"松含姿",
"方玉莹",
"茅语嫣",
"坚强志杰",
"大头仔",
"玉面小豪",
"三秒钟的清华",
"金艺谋",
"龙立行",
"幽灵公主",
"道之女神",
"宇宙皇帝小刚",
"孤单飞",
"关全蛋",
"温志安",
"方玉莹",
"茅语嫣",
"坚强志杰",
"大头仔",
"玉面小豪",
"三秒钟的清华",
"金艺谋",
"龙立行",
"幽灵公主",
"道之女神",
"宇宙皇帝小刚",
"孤单飞",
"关全蛋",
"温志安",
"看蛋蛋",
"司徒咏琳",
"辛令辉",
"痞子东少",
"谭浚龙",
"朱白洁",
"澜珊丶",
"刀光剑影",
"陈超凡",
"人生彩排",
"花宇轩",
"司十八",
"齐云迪",
"何亚文",
"贺耀明",
"孤单治廷",
"云宗泽",
"偶尔爱我的人",
"祖文军",
"丿佐丶手",
"几度花落时",
"黑夜的力量",
"如花似玉的爱",
"成克勤",
"魅魔",
"纪鸿祎",
"陪伴大外甥",
"少一点溫柔",
"萧恺威",
"笑林小子",
"隐痛",
"一丝浅笑",
"纪亚鹏",
"无双峥",
"燕小豪",
"茅艳芳",
"暗影锁灵",
"倵犽o灱",
"骆叫兽",
"紫燕",
"蔡令辉",
"杨桐",
"徽娘宛心",
"噜噜",
"侽人",
"赵菲",
"打你没商量",
"符云飞",
"郑海涛",
"燕玉莹",
"伏仁甫",
"为何如此",
"霍心妍",
"灬灬魔",
"什么也不是",
"柯妹妹",
"周凡斌",
"皇甫岩松",
"告别有情天",
"卫晓龙",
"顺天局",
"年轻的爱",
"朱香香",
"李大为",
"董亚文",
"娇小香",
"超越神的楚楚",
"金眼雕",
"宋秋水",
"暗香思聪",
"孙超",
"皇甫静仪",
"龍丶",
"无法灬无天",
"胡刀郎",
"秋建联",
"程一刀",
"大吃的刀郎",
"利书世辰",
"苏志颖",
"梁世民",
"郭宗南",
"伏子怡",
"宁荣荣",
"行动支持",
"柳留香",
"毕子华",
"佳莹",
"至尊佳人",
"秋建联",
"程一刀",
"大吃的刀郎",
"利书世辰",
"苏志颖",
"梁世民",
"郭宗南",
"伏子怡",
"宁荣荣",
"行动支持",
"柳留香",
"毕子华",
"佳莹",
"至尊佳人",
"余永勤",
"王永序",
"赵百祥",
"疯狂的馒头",
"镜花水月",
"忙的人生",
"薛凯哥",
"安慧敏",
"许云飞",
"替代情人",
"江南达华",
"欧阳峥",
"暗香海泉",
"吴丽媛",
"魏冬临",
"汪海波",
"关俊晖",
"郑龙儿",
"司光标",
"无双寻欢",
"蔡星驰",
"希望之光",
"司空明",
"小华丶一",
"夏侯舟子",
"龙凤娇",
"云书豪",
"娇若游龙的",
"郭欣桐",
"燕国卿",
"雅典娜",
"阮志炫",
"伊红雷",
"封菲",
"上官心凌",
"三秒钟的芷若",
"天极V雨",
"丁雨生",
"大叔灬正非",
"聪少",
"齐耀威",
"纪奕迅",
"毛芳雨",
"唐宇森",
"烟雨世民",
"庄羽泉",
"古华健",
"乔荣浩",
"范晓琪",
"傅灵珊",
"松疏影",
"彦洪婷",
"冯继科",
"兔羊兔森",
"彭敬轩",
"亦如风",
"何破仑",
"范梦莎",
"分天",
"魔無霜",
"刘欣欣",
"清风醉",
"雨意θ诗韵",
"钱青云",
"风云疏影",
"风一般的天桥",
"城管",
"杜奇隆",
"千里马",
"豪情",
"司空听雨",
"佟天华",
"推倒霜华",
"飞天猪猪",
"柳奇隆",
"关冠希",
"辛克群",
"姚安琪",
"贺楚红",
"西门青云",
"你的最爱苏菲",
"柯海涛",
"佟十八",
"完颜易峰",
"超越神的依婷",
"弑神〆艺谋",
"刘家驹",
"习敬轩",
"情枭的黎明",
"司空听雨",
"佟天华",
"推倒霜华",
"飞天猪猪",
"柳奇隆",
"关冠希",
"辛克群",
"姚安琪",
"贺楚红",
"西门青云",
"你的最爱苏菲",
"柯海涛",
"佟十八",
"完颜易峰",
"超越神的依婷",
"弑神〆艺谋",
"刘家驹",
"习敬轩",
"情枭的黎明",
"冯俊辉",
"林俊晖",
"游王子",
"卫朝阳",
"尒莮ふ",
"倾城↘近南",
"推倒杨坤",
"SONG",
"刘立新",
"安舟子",
"杨霞",
"古伊健",
"之后狂恋",
"丁兆伦",
"诸葛狗蛋",
"玉面彡紫玲",
"胡婉清",
"黎化腾",
"薛建豪",
"邻家的男人",
"三秒钟的大力",
"蓝海波",
"大号",
"任宗纬",
"柯月笙",
"刘力宏",
"郑稀哲",
"无双の文军",
"黯然销魂掌",
"小哥丶",
"小哥丶馨",
"西门敬轩",
"谭思诚",
"风云つ志玲",
"马玉莹",
"弑神〆晓明",
"年纪轻轻",
"耶律正非",
"危情羔羊",
"洪思聪",
"史锦江",
"超越神的艾伦",
"林菲儿",
"曹刀郎",
"飞奔",
"三秒钟的卓腾",
"金伟平",
"生活是美好的",
"Vv丶小樱桃",
"自成",
"玉面彡永浩",
"孤单の圆圆",
"限量版布斯",
"谢雨生",
"蒋家驹",
"告别悲伤",
"甍她",
"英雄小姐妹",
"尚天华",
"封耀威",
"七情六欲",
"朱超",
"夏华健",
"伏小萌",
"罗贤齐",
"zhang兴",
"三秒钟的筱婕",
"裴咏麟",
"伯德",
"轩辕心凌",
"伏梦辰",
"卢卫龙",
"洪敬轩",
"卢大为",
"呵呵呢",
"看到附近",
"被蹂躏的灏明",
"射分叉的思诚",
"妇女之友寻欢",
"朱尉榕",
"郭文军",
"侩你不用勺",
"罗国恒",
"鬼丶舞",
"卢大为",
"呵呵呢",
"看到附近",
"被蹂躏的灏明",
"射分叉的思诚",
"妇女之友寻欢",
"朱尉榕",
"郭文军",
"侩你不用勺",
"罗国恒",
"鬼丶舞",
"大叔灬承旭",
"战神之手",
"囧丁",
"小丁",
"霍文东",
"卫自成",
"文永浩",
"孔岳伦",
"司徒恺",
"杜华强",
"阿文",
"齐小明",
"陆晓明",
"雲飞扬",
"邹晶晶",
"夏侯文强",
"云宗纬",
"打小就狠驴",
"妒花风雨",
"口服敵敵畏",
"医院风云",
"金芳雨",
"冷亚男",
"警方得到认同",
"祖克群",
"来电惊魂",
"韦有朋",
"我不是莲英",
"温雪",
"袁思诚",
"玉面彡子丹",
"大叔灬叼西",
"兮沐沐",
"甲壳鱼",
"任浩龙",
"夏侯小凤",
"原退托",
"小小強",
"我原有的人物",
"关珊珊",
"曹晓涵",
"爱新觉罗鸿祎",
"坐怀不乱刂",
"穆晓明",
"丁建联",
"华丽的转身",
"春水伊人",
"momo",
"Summe",
"天下第一法师",
"神龙之怒",
"东方子健",
"迎着风跟着云",
"董腾嘉",
"丁冠英",
"玄曦",
"杜允儿",
"特警",
"彩虹天堂",
"马路杀手",
"风一般的文静",
"皇甫青霞",
"一半天",
"宋贤齐",
"季艺兴",
"程健翔",
"天下至尊",
"钟朵朵",
"慕容三少",
"乔汶泽",
"三秒钟的德纲",
"上官彦斌",
"梁承旭",
"范晨",
"诸葛小刚",
"陆冠希",
"尉迟海泉",
"回家真好",
"爱妃深可测",
"受之有愧",
"皇甫天星",
"一家之主",
"周剑锋",
"故乡的天空",
"坐怀不乱的强",
"我不是巴马",
"秀才爱上兵",
"夜光杯",
"失温后的爱",
"指着太阳说",
"王达华",
"巨人般的天桥",
"三秒钟的德纲",
"上官彦斌",
"梁承旭",
"范晨",
"诸葛小刚",
"陆冠希",
"尉迟海泉",
"回家真好",
"爱妃深可测",
"受之有愧",
"皇甫天星",
"一家之主",
"周剑锋",
"故乡的天空",
"坐怀不乱的强",
"我不是巴马",
"秀才爱上兵",
"夜光杯",
"失温后的爱",
"指着太阳说",
"王达华",
"巨人般的天桥",
"快乐的天使",
"谢小帅",
"小鬼",
"海盗疯子",
"疯子海盗",
"力量仙",
"韩国丸子",
"丿力量灬丸子",
"丿力量灬霸",
"无敌有天下",
"姗姗",
"盗版孟德",
"习卓妍",
"王者之气兰特",
"金丽雯",
"彩云漫步追月",
"雷孟达",
"玉面彡小龙",
"吕志炫",
"巨人般的祖名",
"司马青霞",
"孟大海",
"夏日匆匆",
"谵台暝",
"土豪靓颖",
"谢超",
"纪温仪",
"土豪代沫",
"神秘人疯子",
"吴破仑",
"只爱猪猪",
"潇洒走一回",
"董诗曼",
"蚂蚁",
"冰情人",
"古彦宏",
"玉面彡家驹",
"江建联",
"长得帅死的快",
"伏汶泽",
"符孤城",
"聂国卿",
"秦治廷",
"李道明",
"向无忌",
"丁彦斌",
"风凌孟德",
"强九三百元宝",
"强十一千元宝",
"巨人般的传志",
"拉链夹到咪",
"龙兆伦",
"大mm",
"曹玮琪",
"上官清华",
"今次仲唔死",
"胡汉良",
"花怒波",
"南宫鸿祎",
"司冠希",
"姚朝伟",
"伊泽瑞尔",
"罗秋生",
"尛尛",
"like",
"熙倩致萤",
"铁血o魔王",
"大灬灏明",
"向希怡",
"灬魅灬",
"沙子",
"推倒石磊",
"王红",
"展翅高飞",
"项冠文",
"李正非",
"豆花女格",
"诸葛彦宏",
"庞冠文",
"司冠希",
"姚朝伟",
"伊泽瑞尔",
"罗秋生",
"尛尛",
"like",
"熙倩致萤",
"铁血o魔王",
"大灬灏明",
"向希怡",
"灬魅灬",
"沙子",
"推倒石磊",
"王红",
"展翅高飞",
"项冠文",
"李正非",
"豆花女格",
"诸葛彦宏",
"庞冠文",
"茅达华",
"钟伟平",
"佟振龙",
"卫灏明",
"夏华强",
"不要说再见",
"张小明",
"朱杰伦",
"恨锁金瓶",
"雨意思琦",
"多深的思念",
"青楼",
"金盈盈",
"大叔灬子华",
"斩天",
"伊听雨",
"叶宝国",
"佳人漫步",
"祖静仪",
"舞动青春",
"薛震岳",
"冷叫兽",
"梁汉良",
"金兰特",
"百信医疗",
"法法法法法法",
"温建豪",
"土豪润发",
"茜茜三号",
"花季岁月",
"雷清华",
"马道明",
"龙富城",
"佟中山",
"JIAJIA",
"叶近南",
"轩辕朝阳",
"郑大佑",
"华光标",
"神秘的大虾",
"燃烧的大虾",
"愤怒的大虾",
"奔跑的大虾",
"爱新觉罗含姿",
"妇女之友思聪",
"莫春秋",
"夏侯小星",
"秋永元",
"金杨坤",
"司芷若",
"庄萌萌",
"阮卫健",
"霍有朋",
"张逸欣",
"风火连城",
"欧阳雅茹",
"飘蓉咏苗",
"温婉儿",
"坚强耀明",
"江峰",
"伊连杰",
"倾城晓龙",
"汪文东",
"麻辣男人",
"我不是萌萌",
"传说中的慧敏",
"古紫函",
"苍清华",
"暗黑版鸿飞",
"徐渤",
"慕容若兰",
"守护爱的回忆",
"蓝月笙",
"族疑莣情偲",
"第一梦",
"安杨坤",
"符和伟",
"孔国庆",
"宁寻欢",
"蒋石磊",
"皇甫语嫣",
"董小春",
"风云梦瑶",
"守护爱的回忆",
"蓝月笙",
"族疑莣情偲",
"第一梦",
"安杨坤",
"符和伟",
"孔国庆",
"宁寻欢",
"蒋石磊",
"皇甫语嫣",
"董小春",
"风云梦瑶",
"新兰博基尼",
"杜圆圆",
"韩渤",
"南宫文强",
"射分叉的百祥",
"太史宗宪",
"微笑青春",
"霍楚生",
"吴巴马",
"三秒钟的要勃",
"妇女之友耀明",
"玉面晓芙",
"萧朝伟",
"尉迟倾城",
"玫瑰香香",
"罗丽雯",
"聂风灬狂刀",
"伊巨长",
"风云东城",
"蔡要勃",
"阮志伟",
"下面吃的润发",
"段国卿",
"天人合一",
"夏顶天",
"夏青云",
"风雨中的朋友",
"徐全蛋",
"厚重的记忆",
"毕耀明",
"文双儿",
"秋宇轩",
"晨女",
"卫艳芳",
"願望",
"琳琳",
"二刀",
"东君",
"流星赶月",
"林国荣",
"发奋图强",
"杨红雷",
"符婉婷",
"丿浮华半世丶",
"吴舟子",
"风云镇业",
"巧巧",
"季石磊",
"龙振龙",
"刘晓龙",
"叶若英",
"金感恩",
"无双奇隆",
"酷女孩",
"钟灏明",
"符秋生",
"阮世民",
"蒋志杰",
"东方克勤",
"程天宇",
"蒋代沫",
"范朝伟",
"卢巨棒",
"董流翔",
"罗朝阳",
"徐云迪",
"君临宝强",
"双凤惊魂",
"冰雪芷衣",
"弑神力宏",
"风云梓萱",
"心语",
"心花朵朵开",
"令狐永序",
"苦瓜烧肉",
"伪装",
"傅卫龙",
"为何常回忆",
"元无忌",
"曾允儿",
"ge很有样",
"江晓龙",
"关吹雪",
"包宗南",
"任楚红",
"穆敬明",
"陆光标",
"史若兰",
"南宫宇轩",
"野女郎",
"弑神力宏",
"风云梓萱",
"心语",
"心花朵朵开",
"令狐永序",
"苦瓜烧肉",
"伪装",
"傅卫龙",
"为何常回忆",
"元无忌",
"曾允儿",
"ge很有样",
"江晓龙",
"关吹雪",
"包宗南",
"任楚红",
"穆敬明",
"陆光标",
"史若兰",
"南宫宇轩",
"野女郎",
"唐永信",
"爱后面的夕",
"宁开复",
"坚强小明",
"你说什么四",
"方青书",
"吾为南宫",
"孔诗诗",
"唐小嫣",
"皇甫黎明",
"星星雪",
"史子华",
"衒玉贾石",
"叶大佑",
"祖素素",
"完颜全蛋",
"ll龙龙",
"最美丽的事",
"祖伟霆",
"甘冰婉",
"燕宝亮",
"习少聪",
"杀猪侠",
"火炎焱",
"云昊然",
"圣手书生",
"宁子健",
"三刀温柔",
"心的落幕",
"穆亚男",
"辛代沫",
"任文乐",
"男孩的悲哀",
"任妍希",
"庞晓涵",
"江巴马",
"志伟",
"甘若英",
"坚强卡卡",
"萧白洁",
"秋子瑶",
"咔特琳娜",
"风云つ连杰",
"布拉格丶浮尽",
"项思诚",
"青灵せ碧霞",
"完颜则天",
"风凌岳伦",
"萌萌欧巴",
"独孤爱",
"齐丽媛",
"大叔一菲",
"弑神〆承志",
"曹有朋",
"司一刀",
"李有朋",
"纪学友",
"彭寻欢",
"宋大海",
"邓孟德",
"被蹂躏的渤",
"倾城小宝",
"江大为",
"符艺兴",
"嘎嘎",
"轩辕亚鹏",
"令狐云迪",
"汪逸迅",
"若你一切安好",
"自由ML",
"生如夏花",
"终极武器",
"古继科",
"独家メ幻影",
"孟克群",
"凄风苦雨",
"卫流翔",
"甜美生活",
"独家メ志炫",
"郭达华",
"网名而已",
"文祖名",
"庄婉华",
"往事依旧",
"超越神的亦帆",
"松奕迅",
"zzzz",
"太史俊辉",
"爱着你",
"瑶敬鸣桂",
"孟传志",
"推倒咏麟",
"被蹂躏的丽珍",
"暗香※艾伦",
"洪小星",
"蔡文军",
"卫丽媛",
"雨意θ贤齐",
"如何舍得",
"卿卿小雪",
"王者之气连杰",
"难以入眠",
"侯晓明",
"金雨生",
"徐伟平",
"王贝娜",
"项流翔",
"华冠英",
"G吧M",
"祝开复",
"弑神〆渤",
"玉面彡鸿祎",
"谭伟平",
"烟雨◆一刀",
"血雨腥风",
"武成王",
"大叔卫健",
"墨染皇子",
"小寳",
"柳震岳",
"巨人般的开复",
"走过岁月",
"陈亚鹏",
"曾岳伦",
"张晓婷",
"风尘知已",
"赵前",
"谢青书",
"秋伊健",
"白色猪王",
"欧阳俊俊",
"姐夫请住手",
"爱情有了伤痕",
"林小帅",
"讀不懂的你",
"妖道无情",
"东方依晨",
"情何归",
"陈亚鹏",
"曾岳伦",
"张晓婷",
"风尘知已",
"赵前",
"谢青书",
"秋伊健",
"白色猪王",
"欧阳俊俊",
"姐夫请住手",
"爱情有了伤痕",
"林小帅",
"讀不懂的你",
"妖道无情",
"东方依晨",
"情何归",
"孔淑怡",
"李家大叔",
"老子就是天理",
"流流女",
"鬼逍遥",
"胡冠文",
"曾冬雨",
"侯韦彤",
"茅天星",
"看清就看轻",
"看清亦看轻",
"朱立新",
"李光洁",
"方冰冰",
"皇甫丽雯",
"毛飞",
"虎口余生",
"秦白洁",
"思念绕指尖",
"钟汉良",
"秦浩明",
"向妙可",
"暗黑版天星",
"天天想你",
"大煊含",
"庞正英",
"爱吃小番茄",
"风凌近南",
"尚青霞",
"司徒晓婷",
"扯扯扯",
"风一般的凯琪",
"勇往直前",
"白雪樱影",
"吴思远",
"到哪都得花钱",
"明月王朝",
"秒杀美女",
"何卫健",
"黎敬明",
"想太多小姐",
"沙滩情缘",
"情天",
"孤独的刀客",
"金玉鸳盟",
"聂小帅",
"金诗韵",
"宇文叫兽",
"龙莉宁",
"胯下有龙",
"妹妹有力",
"妹妹用力",
"司国卿",
"徐敬明",
"裴小凤",
"骆代沫",
"风凌文强",
"哎呦喂",
"司静仪",
"金卫平",
"陆俊辉",
"欧阳孤城",
"从小就很色",
"洪武战神",
"符红雷",
"聂国恒",
"尹腾",
"程子楚",
"王顶天",
"我和幸福有约",
"文朵朵",
"胤禛",
"遍体鳞伤",
"金建豪",
"百分百感觉",
"习中基",
"尹中基",
"泡妹的凯哥",
"关修启贤",
"轩辕戮",
"罗卡卡",
"心中牵挂",
"彬哥",
"汪天桥",
"老子来也",
"西门顶天",
"王顶天",
"我和幸福有约",
"文朵朵",
"胤禛",
"遍体鳞伤",
"金建豪",
"百分百感觉",
"习中基",
"尹中基",
"泡妹的凯哥",
"关修启贤",
"轩辕戮",
"罗卡卡",
"心中牵挂",
"彬哥",
"汪天桥",
"老子来也",
"西门顶天",
"卡米拉赤砂",
"任其杰",
"帅哥来",
"宇文三胖",
"超级法师",
"清晨泪依然",
"砍你的大咪咪",
"霸气领域",
"胡玮琪",
"风凌铁柱",
"项晓龙",
"从小就很猛",
"花中山",
"蒋祖名",
"郑书豪",
"佟俊晖",
"爱新觉罗宝强",
"晓琪",
"极度危险",
"宋静茹",
"段紫玲",
"元子健",
"重庆新锐印务",
"季书宏",
"一生都是错",
"安洪烈",
"在等待",
"柳婷婷",
"等待的缘分",
"诸葛彤彤",
"坚强云迪",
"何冠英",
"战败天",
"狄宝强",
"巨人般的东城",
"太史崔健",
"一刀砍死你",
"洋洋呦",
"蓝黎明",
"最近有多红",
"魏志刚",
"淅沥的雨",
"叶永元",
"江伟霆",
"林芳雨",
"韩青云",
"孔朝伟",
"萧圆圆",
"香玉青书",
"温国荣",
"林馨予",
"然然",
"蓝青云",
"妇女之友志祥",
"张亚林",
"天马流星",
"嗜血魔神",
"东京幽灵物语",
"聚沙友孝",
"独家冠文",
"林楚生",
"秦代沫",
"罗兆伦",
"推倒熙媛",
"茅文强",
"青灵耀威",
"打死甄子丹",
"微雨夜来",
"蔡艺谋",
"唐晓洁",
"刀刀剑红",
"卫小明",
"魏逸迅",
"伊幂",
"黎汉良",
"王正非",
"伏家驹",
"季宗南",
"伏晓东",
"无双治廷",
"无双巴马",
"虚情假意",
"微雨夜来",
"蔡艺谋",
"唐晓洁",
"刀刀剑红",
"卫小明",
"魏逸迅",
"伊幂",
"黎汉良",
"王正非",
"伏家驹",
"季宗南",
"伏晓东",
"无双治廷",
"无双巴马",
"虚情假意",
"雨意汶泽",
"天火燃烧",
"连连看",
"射分叉的孟德",
"袁永信",
"聂香香",
"大叔吹雪",
"下面吃的小星",
"易国卿",
"尚振宇",
"亚鹏他二舅",
"艺海星尘",
"卤白液体",
"侯奕迅",
"君临代沫",
"蒋东城",
"玉面健林",
"镇八方",
"古屋惊魂",
"青灵雪漫",
"伏国驹",
"认识你真好",
"灯是火阑珊",
"梁无双",
"朱小弟",
"下面吃的依林",
"伊一茜",
"薛婉婷",
"上官冰冰",
"诸葛紫棋",
"谭婷茹",
"雨意亚馨",
"莫含姿",
"庞国卿",
"云梦辰",
"洪汶泽",
"谢伟平",
"战士之王",
"华吹雪",
"裴元庆",
"冷健林",
"霍大海",
"祖留香",
"金币",
"庞浚龙",
"飘流两颗心",
"燕素素",
"贺化腾",
"江南孤城",
"成思捷",
"黎秋羽",
"关东六魔",
"谎言对决",
"孤单峥",
"智飞风雨",
"菲菲的牙牙",
"射分叉的曙光",
"大叔仕鹏",
"巩渤",
"裴心苗",
"叶龙儿",
"侯志伟",
"南贤齐",
"刘夕",
"孙亦帆",
"霍铁蛋",
"王冬儿",
"聂茜",
"司雯婕",
"传说中的彦斌",
"水芯雨",
"黄仕鹏",
"一离弃一",
"吴大力",
"大叔小龙",
"平凡人",
"耶律敬轩",
"云宇轩",
"JC神",
"幸福天使",
"黄继聪",
"烟雨镇业",
"康巴",
"茅浩龙",
"乔晨",
"关刀郎",
"别找死",
"踏遍红尘",
"一离弃一",
"吴大力",
"大叔小龙",
"平凡人",
"耶律敬轩",
"云宇轩",
"JC神",
"幸福天使",
"黄继聪",
"烟雨镇业",
"康巴",
"茅浩龙",
"乔晨",
"关刀郎",
"别找死",
"踏遍红尘",
"林镇业",
"赌侠",
"季丽颖",
"还未放弃你",
"易娜娜",
"有嚼劲苦",
"冰之火焰",
"王者之气玉莹",
"吕俊晖",
"推倒剑锋",
"灬小庆",
"辛恋花",
"雄魂",
"定情北海岸",
"徐自成",
"孤单灵珊",
"蔡超",
"法克",
"诸葛依晨",
"司徒雅茹",
"更加不放弃",
"郭亦菲",
"风凌渤",
"燕剑锋",
"奔跑吧蜗牛",
"珠光宝气",
"郭少聪",
"圣剑",
"柯星驰",
"雷震雨",
"锁阿宁",
"袁诗韵",
"又下雨了",
"项克群",
"翡翠fg",
"邓月笙",
"得不到回应",
"韩润东",
"祥云",
"倾城子祥",
"汪茜",
"阿理冂亠又冖",
"松海涛",
"丶娃娃",
"青灵志祥",
"薛宝亮",
"情花",
"西门治廷",
"梁茜",
"牛哥",
"天野由梨",
"霍彦宏",
"社会你宇哥",
"金锦江",
"狄国驹",
"把持不住就射",
"春梦无痕",
"寿荣发光",
"月下美人",
"孤单艺兴",
"胡子强",
"庄鸿飞",
"江逸迅",
"爬爬熊",
"霸气侧漏的蓉",
"莫杨坤",
"你的克星",
"冷孟德",
"七郎",
"齐十八",
"张晓晨",
"烟雨◆紫函",
"酷少",
"小鲜肉",
"十三太保",
"玉面彡连杰",
"弑神〆大海",
"夜猫子",
"何贝娜",
"拖鞋",
"符小宝",
"尉迟道明",
"南宫芳雨",
"齐永康",
"苍卡卡",
"骆筱婕",
"倾城正非",
"梁菲儿",
"霸气侧漏的蓉",
"莫杨坤",
"你的克星",
"冷孟德",
"七郎",
"齐十八",
"张晓晨",
"烟雨◆紫函",
"酷少",
"小鲜肉",
"十三太保",
"玉面彡连杰",
"弑神〆大海",
"夜猫子",
"何贝娜",
"拖鞋",
"符小宝",
"尉迟道明",
"南宫芳雨",
"齐永康",
"苍卡卡",
"骆筱婕",
"倾城正非",
"梁菲儿",
"蒋娜娜",
"暗香婉露",
"蒋富城",
"卫建豪",
"花天星",
"孤单の国荣",
"松继科",
"火羽飞凤",
"青灵せ镇宇",
"穆凯琪",
"烟雨◆继科",
"辛无忌",
"金乡大蒜",
"妹子",
"唐振宇",
"公主不孤单",
"庄宝国",
"弑神〆伊",
"妇女之友德纲",
"元和伟",
"阮思诚",
"赵天乐",
"风云つ芳雨",
"祝小刚",
"黄寻欢",
"爱新觉罗铁柱",
"陈飞飞",
"傅晓龙",
"诸葛永信",
"项宗泽",
"zhizi",
"拓跋老狗",
"南宫小刚",
"宇文梦雪",
"罗依婷",
"孙道明",
"风云つ国荣",
"耶律冰冰",
"无双の冠英",
"江艺谋",
"爱后面的中山",
"是是非非",
"流口水的兔子",
"街角那段情",
"陈大海",
"周佳莹",
"妇女之友峥",
"倾城↘嘉慧",
"丁巴马",
"大叔流翔",
"巩连杰",
"宁汉良",
"梁可唯",
"孙奇隆",
"山城炎哥",
"风云つ国荣",
"耶律冰冰",
"无双の冠英",
"江艺谋",
"爱后面的中山",
"是是非非",
"流口水的兔子",
"街角那段情",
"陈大海",
"周佳莹",
"妇女之友峥",
"倾城↘嘉慧",
"丁巴马",
"大叔流翔",
"巩连杰",
"宁汉良",
"梁可唯",
"孙奇隆",
"山城炎哥",
"张立新",
"限量版敬腾",
"逆灬天",
"温情永远",
"马丞琳",
"古子强",
"徐遥",
"听够珍贵丶",
"张流翔",
"方芷若",
"小苏哥",
"许连杰",
"温俊杰",
"彭巴马",
"仙道",
"温丽雯",
"蓝岳伦",
"送你个葫芦",
"完颜霜华",
"影者",
"血洗",
"爱你我也来",
"南宫卫健",
"曾孤城",
"季小帅",
"郑小明",
"司徒令辉",
"谭紫璐",
"谭子聪",
"汪云飞",
"慕容大为",
"小北",
"浴血夏侯",
"冷安琪",
"霍子祥",
"思晶景莎",
"阮晓龙",
"追杀",
"魅族V影",
"理想情人",
"安可儿",
"薛立行",
"尉迟叫兽",
"习小平",
"乱丢卫生巾",
"杨雪菲",
"孔梵羽",
"三秒钟的秋水",
"汪羽凡",
"谭亚男",
"蔡晓婷",
"萧瑶白富美",
"习小平",
"乱丢卫生巾",
"杨雪菲",
"孔梵羽",
"三秒钟的秋水",
"汪羽凡",
"谭亚男",
"蔡晓婷",
"萧瑶白富美",
"鬥帝",
"轩辕傲天",
"兜兜里爱你",
"入海蛟龙",
"薛朝阳",
"青城之恋",
"推倒心妍",
"蒋宝国",
"秋英东",
"向秋水",
"千门八将",
"丁慧雯",
"禸杺旳脆弜",
"毕灏明",
"马兆弘",
"天外倾情",
"金翔",
"袁玉莹",
"谢春秋",
"夏怡韵",
"佟语嫣",
"丧尸",
"袁力宏",
"吴春秋",
"狗尾续貂",
"秋天的旅程",
"邓健翔",
"曾经旳天真",
"纽约深秋",
"丢魂丧胆",
"霍承旭",
"孟LZ",
"魏耀明",
"蓝朵朵",
"大叔灬啊啊",
"邹俊杰",
"刘百祥",
"云中慧",
"无懈可击",
"佟卡卡",
"风一般的翠山",
"罗家驹",
"齐富城",
"力量魔",
"龍图腾",
"夜店嗨国歌",
"逻辑溺爱",
"苍老师",
"安继科",
"何菲",
"赵子祥",
"黎思诚",
"潇洒宝贝",
"司空继科",
"鬼女",
"鬼男",
"涩魅",
"三胖",
"伊亦菲",
"苏志伟",
"司空秀娜",
"卫婉清",
"洪甜甜",
"封吹雪",
"好男人",
"蓝天飞雨",
"伊健林",
"爱后面的文东",
"武武武",
"温佳宝",
"我来战",
"我来了",
"巨人般的芳雨",
"戒烟戒酒",
"黯嘫吢碎",
"恋爱达人",
"格斗天王",
"归去来",
"诺氏灬雨诺",
"朱杨坤",
"吴永浩",
"战火呼风唤雨",
"曾破仑",
"哀落的帝国",
"赵冰冰",
"南宫浚龙",
"辛耀威",
"晨晨",
"太史祖名",
"劳资蛋疼",
"宝亮",
"江寻欢",
"司徒润东",
"格斗天王",
"归去来",
"诺氏灬雨诺",
"朱杨坤",
"吴永浩",
"战火呼风唤雨",
"曾破仑",
"哀落的帝国",
"赵冰冰",
"南宫浚龙",
"辛耀威",
"晨晨",
"太史祖名",
"劳资蛋疼",
"宝亮",
"江寻欢",
"司徒润东",
"王浩龙",
"古孟德",
"超越神的子祥",
"裴三少",
"英俊潇洒的贺",
"老子弄死你啊",
"叶英东",
"水的立方",
"卫笨笨",
"天下有情",
"真心至上",
"捷聚贵材",
"山峰",
"卫子萱",
"飞翔使",
"夏侯语嫣",
"张一雪万",
"jian",
"鬼屋惊魂",
"宋冰婉",
"慕容敬轩",
"燕亦帆",
"上官艳芳",
"我是天蝎座",
"赖邦毓",
"栀子花开",
"江易峰",
"说不爱你",
"秦羽",
"爱后面的子祥",
"习敬明",
"杨康丶",
"北公爵",
"洪立行",
"战火婉儿",
"玉面援朝",
"宇宙皇帝子怡",
"纪天宇",
"曹雅莉",
"玉面腾飞",
"撕裂的心",
"风一样的影",
"中原狼",
"佟小豪",
"松紫棋",
"沈晓洁",
"宁宗南",
"暗香大宇",
"绝世霸主",
"曹志伟",
"分隔符",
"虐倩倩",
"倾城化腾",
"贺光标",
"风一般的立行",
"柳晓明",
"上官浩明",
"郭欣欣",
"神经痉挛",
"李正英",
"令狐小豪",
"花贝娜",
"曹子丹",
"龙家驹",
"花国驹",
"梦幻天子",
"世事难料",
"铁血大魔王",
"贺诗诗",
"奇奇七七",
"怀念过去",
"丁馨予",
"华笨笨",
"缘是天使",
"战火呼雨唤风",
"丁志强",
"孙近柔",
"雄霸天下灬疯",
"风一",
"吐出来的寂寞",
"毛彦宏",
"天赋博雅",
"站住别跑",
"花裴国荣",
"那年的夏天",
"陈洋",
"怀念过去",
"丁馨予",
"华笨笨",
"缘是天使",
"战火呼雨唤风",
"丁志强",
"孙近柔",
"雄霸天下灬疯",
"风一",
"吐出来的寂寞",
"毛彦宏",
"天赋博雅",
"站住别跑",
"花裴国荣",
"那年的夏天",
"陈洋",
"姚敬腾",
"唯我二号",
"刘冰启",
"何逸迅",
"见素",
"江湖女",
"华中基",
"司空志玲",
"暗黑版润发",
"玉面继聪",
"令狐宗泽",
"何耀明",
"丶丶攀冭岡",
"下面吃的有朋",
"独孤若瑄",
"龙丽媛",
"江姬达",
"韩巨长",
"林志强",
"我不是小龙",
"聂晓彤",
"欧阳三胖",
"传说中的文东",
"独孤贝娜",
"元伊健",
"春残梦断",
"地库幽魂",
"耶律破仑",
"松文东",
"东方玉婷",
"大叔渤",
"曾子强",
"花无尘",
"发呆发发",
"尚国庆",
"风云媛媛",
"黑帝神",
"彭于晏",
"小小帅哥",
"皇甫志刚",
"会飞的蚂蚁",
"风清云淡",
"佟布斯",
"夏侯绮贞",
"毛汶泽",
"热血鸳鸯",
"小样废了你",
"耶律紫璐",
"杜力宏",
"宁恋花",
"张小凡",
"高丽园",
"不可多得",
"不要告诉别人",
"冷雨",
"暮光之葬",
"尹灏明",
"松敏镐",
"这样过日子",
"姚盈盈",
"蕊宝",
"罗布斯",
"暗香十八",
"冷全蛋",
"尉迟三少",
"射分叉的青云",
"寂尊",
"慕容永浩",
"毒妇",
"聂恺",
"太史腾飞",
"莫楚生",
"太史永信",
"罗丽",
"午夜女郎",
"包布斯",
"蓝静茹",
"史振龙",
"最后五分钟",
"时常地想念你",
"不堪一击",
"欧阳飞飞",
"包全蛋",
"伊曙光",
"段志强",
"咏琳",
"毒妇",
"聂恺",
"太史腾飞",
"莫楚生",
"太史永信",
"罗丽",
"午夜女郎",
"包布斯",
"蓝静茹",
"史振龙",
"最后五分钟",
"时常地想念你",
"不堪一击",
"欧阳飞飞",
"包全蛋",
"伊曙光",
"段志强",
"咏琳",
"回头想想",
"新毒玫瑰",
"祝志颖",
"蔡欣桐",
"魏雨生",
"松子丹",
"巨人般的宗纬",
"项紫萱",
"钟非",
"古健林",
"纯洁的半烟",
"我多么羡慕你",
"季俊辉",
"冯伟霆",
"青灵灏明",
"战壹",
"天生舞男",
"龙依婷",
"想爱就爱",
"烟雨子瑶",
"辛道明",
"大哥怕过谁",
"毛彦斌",
"萨拉德",
"关三桂",
"许立新",
"皇甫紫衣",
"林安琪",
"唐彦斌",
"爱后面的志颖",
"小男人",
"甘彦斌",
"蔡子强",
"三秒钟的艾伦",
"范宗泽",
"单爱",
"关子强",
"祖梦婷",
"邹冠英",
"漠剑",
"关梦莎",
"小白腿",
"火焰妖女",
"訫k吥",
"欧阳巨长",
"曾芳雨",
"阮盈盈",
"吕三胖",
"玉面彡子聪",
"谢小波",
"史志颖",
"彭冠文",
"哈利波特大",
"松舟子",
"打死也不充钱",
"季大力",
"欧阳志祥",
"罗舟子",
"霸气侧漏的飞",
"吕全蛋",
"独孤梦婷",
"红颜笑",
"传说中的含姿",
"龙儿",
"七夜圣君",
"上官鸿飞",
"云允儿",
"走走停停",
"俘获你心",
"令狐紫衣",
"清风侠",
"太子哥",
"ご冷面法神ぃ",
"祖龙儿",
"开门放狗",
"情深深",
"倾城↘布斯",
"巨人般的凯哥",
"放屁崩出",
"十五",
"大明",
"冯冬临",
"茅静怡",
"龙儿",
"七夜圣君",
"上官鸿飞",
"云允儿",
"走走停停",
"俘获你心",
"令狐紫衣",
"清风侠",
"太子哥",
"ご冷面法神ぃ",
"祖龙儿",
"开门放狗",
"情深深",
"倾城↘布斯",
"巨人般的凯哥",
"放屁崩出",
"十五",
"大明",
"冯冬临",
"茅静怡",
"金三胖",
"雨意θ星驰",
"朱大力",
"独家メ三桂",
"齐小莹",
"KISS道",
"傅子华",
"烟雨◆天一",
"郑梓萱",
"万岁军坑货",
"云中浪子",
"云宝亮",
"暗黑版立地",
"秋一含",
"江传志",
"太史大为",
"姚孟达",
"蒋润发",
"倾城↘盈盈",
"侯一山",
"景继聪",
"唐思聪",
"捅菊达人",
"五年是我",
"单色不单调丶",
"魏宝强",
"任丽珍",
"封曙光",
"徐曙光",
"陌叹宇夕",
"暗香※志杰",
"下面吃的伊健",
"宁云迪",
"末季回忆",
"汉城我的奇缘",
"冷梅情泪",
"吕百祥",
"秦正英",
"朱天一",
"爱后面的三桂",
"封楚生",
"冰雪女皇",
"夏侯馨予",
"纪彤彤",
"沈芳雨",
"谭浩明",
"下面好硬",
"独家メ羽泉",
"珍惜所有",
"完颜三少",
"郑一刀",
"鬼魅丶凯哥",
"靓魅",
"宋国荣",
"庞卡卡",
"天天快乐",
"莫书宏",
"完颜镇宇",
"公牛战士",
"欧阳圣冰",
"祖丽珍",
"阮健翔",
"花奇隆",
"弑血",
"祖峰",
"茜杳",
"大叔灬海泉",
"云曦",
"风一般的若兰",
"季梦溪",
"郭冠希",
"祖立新",
"谭岩松",
"景朝阳",
"雪舞半雲空",
"风一般的玮琪",
"雷继聪",
"愿你知我心",
"小足球迷",
"像雨又像风",
"逍遥魔王",
"花奇隆",
"弑血",
"祖峰",
"茜杳",
"大叔灬海泉",
"云曦",
"风一般的若兰",
"季梦溪",
"郭冠希",
"祖立新",
"谭岩松",
"景朝阳",
"雪舞半雲空",
"风一般的玮琪",
"雷继聪",
"愿你知我心",
"小足球迷",
"像雨又像风",
"逍遥魔王",
"小轩轩",
"江湖小号",
"武魂",
"丢恶捡善",
"啊有哥",
"大美",
"段叫兽",
"雷叔",
"狠雷人",
"妖十九",
"菊部有霾",
"M小捣蛋",
"霸气疯火",
"阮正英",
"咬字分开读",
"司马天宇",
"第六感天使",
"裤裆一把锁",
"风一般的俊晖",
"坚强宇森",
"我还没结婚",
"赵馨予",
"尚健林",
"毕道明",
"日破地天",
"福岛",
"神一样的补刀",
"蓝紫",
"司马梦瑶",
"许华强",
"小白兽",
"仙童玉女",
"宋伟平",
"战刃",
"伤心泪",
"爱情果冻",
"羽化乖乖",
"西门小馆人",
"史燕琴",
"贺铁柱",
"你不懂好不同",
"祖三少",
"傲然独舞",
"幸福人生",
"正在删除记忆",
"封晓琪",
"聂羽泉",
"松雅茹",
"清贵禹兵",
"逆战大神来也",
"阮俊晖",
"推倒克群",
"段十八",
"土豪俊晖",
"刘志强",
"黯然灬神伤",
"大SHU",
"表情",
"我非良人i",
"等等等等彼人",
"冷暖人间",
"秋舒啸祥",
"任耀明",
"伏紫玲",
"莫怡韵",
"杀破鬼",
"枝莎怡珠",
"蓝飞",
"皇族丶传媒",
"轻地遗忘",
"宁宇森",
"秦杰伦",
"雨后的风景",
"死神归来的夜",
"云狗蛋",
"佟易峰",
"最后的爱",
"波斯猫",
"请叫我大神",
"钟馗",
"赵丽雯",
"慕容翠山",
"萧丽",
"皇族丶传媒",
"轻地遗忘",
"宁宇森",
"秦杰伦",
"雨后的风景",
"死神归来的夜",
"云狗蛋",
"佟易峰",
"最后的爱",
"波斯猫",
"请叫我大神",
"钟馗",
"赵丽雯",
"慕容翠山",
"萧丽",
"霍叫兽",
"习承旭",
"卢铁林",
"莫霜华",
"射分叉的莲英",
"袁舟子",
"花珊珊",
"几把挂镰刀",
"武安",
"武安日霸",
"杨道明",
"庞贤齐",
"蓝红雷",
"卫娜娜",
"小苦瓜",
"我不是耀明",
"王者之气一茜",
"东方bb",
"吃货人生",
"邹朵朵",
"风流哥丶",
"土豪静怡",
"君临承旭",
"毕慧敏",
"穆天龙",
"其林",
"虐狗",
"盼梦圆",
"齐振宇",
"金爵V皇帝",
"曾一菲",
"霸王牛筋",
"小妮二十一号",
"一号",
"独家破仑",
"我的爱神",
"茶杯",
"孔小春",
"冯文强",
"秋琦菲",
"义海倾情",
"邹婉清",
"庞力宏",
"太史浩明",
"梁梦婷",
"郭筠瑗",
"古书豪",
"一走一过",
"丽露金音",
"现代版",
"朱铁蛋",
"有你有我",
"东方子忆",
"泪痕无忌",
"弑神卡卡",
"顺其自然丶",
"令狐振龙",
"根本岸久",
"鸭梨",
"尚锦江",
"光芒",
"柯巴马",
"关巨棒",
"花继聪",
"雨意正英",
"华梦莎",
"jkjkjk",
"烟雨岳伦",
"笑拥江山梦",
"云冰冰",
"耶律志玲",
"今晚谁当家",
"庄铁林",
"月薪两万",
"天蝎座爱情",
"韩婉华",
"助手",
"欧兰",
"暗香子祥",
"韩梦瑶",
"醉倒的吻",
"不是我的不要",
"跳梁小丑",
"白金蛋炒饭",
"不要再想你",
"梁吹雪",
"笑拥江山梦",
"云冰冰",
"耶律志玲",
"今晚谁当家",
"庄铁林",
"月薪两万",
"天蝎座爱情",
"韩婉华",
"助手",
"欧兰",
"暗香子祥",
"韩梦瑶",
"醉倒的吻",
"不是我的不要",
"跳梁小丑",
"白金蛋炒饭",
"不要再想你",
"梁吹雪",
"关晓洁",
"周驰航",
"佟文东",
"阿怡哟",
"罗书宏",
"萧香香",
"风一般的立波",
"不想失去你",
"我爱大咪咪",
"司艺谋",
"huan",
"无香恋水",
"雨意诗曼",
"吕三泉",
"包健翔",
"蒋宇森",
"暗香永信",
"沉呤",
"轩辕腾飞",
"独家镇业",
"唐力宏",
"wieson",
"华诗韵",
"钟熙媛",
"同居之爱",
"罗奕迅",
"完颜咏琳",
"君临稀哲",
"向则天",
"毕冠希",
"薛驰航",
"惊人",
"慕容玉莹",
"宁昊然",
"慕容宝亮",
"金仕鹏",
"似梦o年华",
"乔天桥",
"尉迟逸迅",
"秦立行",
"小小小小哥",
"高冈初美",
"烟雨宗纬",
"解药",
"宇宙皇帝正英",
"董舟子",
"蔡全蛋",
"快乐就好哥",
"西门文乐",
"华润东",
"祖丽颖",
"还是会心痛",
"卢白洁",
"冷漠的",
"蔡少",
"彼岸微蓝",
"伊代沫",
"冬爱情",
"贺超",
"雨意小萌",
"德宁久辉",
"丁冰婉",
"茅英东",
"毒蘑菇",
"伊亚馨",
"阮小刚",
"天行健",
"柔枝随风展",
"宁朝伟",
"曹杰伦",
"追梦能人",
"薛孟德",
"巩静仪",
"张国驹",
"佟志杰",
"周海泉",
"妇女之友汉良",
"狄志祥",
"於杰伦",
"无双羽泉",
"新娘寝室家纺",
"情定爱琴海",
"符丝纯",
"舊傷口",
"梁巨基",
"追梦能人",
"薛孟德",
"巩静仪",
"张国驹",
"佟志杰",
"周海泉",
"妇女之友汉良",
"狄志祥",
"於杰伦",
"无双羽泉",
"新娘寝室家纺",
"情定爱琴海",
"符丝纯",
"舊傷口",
"梁巨基",
"蓝道明",
"轩辕栎鑫",
"宇宙皇帝小明",
"冰冷雨忆",
"马金辉",
"小虫",
"小能逗",
"尸魂",
"蓝馨雪奕",
"祖浩明",
"哈罗",
"无双健翔",
"卢子丹",
"城里人真会玩",
"秋恺",
"蓝晓明",
"辛晓琪",
"史贝宁",
"大叔镇业",
"拥抱阳光",
"季芷若",
"贺朵朵",
"小宝太",
"爱你让我勇敢",
"程嘉慧",
"巩嘉慧",
"青灵铁蛋",
"xinmu",
"中华利剑A",
"十秒的冲动",
"丶冷锋",
"成咏麟",
"香菱",
"雪子",
"迦若祭祀",
"蓝破仑",
"大大力",
"钱敬轩",
"暗香※青云",
"慕容冰婉",
"霜儿",
"公孙咏琳",
"冷彦宏",
"胡宝亮",
"轩辕德",
"传奇再现",
"再现传奇",
"骨灰传奇",
"传奇无双",
"小君主",
"完颜卫健",
"程仁甫",
"拒绝采访",
"武当红",
"娇娇",
"小武当红",
"幺V妹",
"成晓东",
"请叫我金国",
"游戏而已",
"哈哈哈哈哈",
"雨打蕉叶残",
"项要勃",
"公孙艺兴",
"关无忌",
"心悸",
"哥风采依旧",
"苍连杰",
"倾城↘亚男",
"我不是奕迅",
"湿湿",
"风一般的克群",
"风凌志玲",
"郑莹",
"宁驰航",
"西门永元",
"玉面彡力宏",
"霍顶天",
"诸葛奇隆",
"爱新觉罗馨予",
"青灵せ铁柱",
"小熊猫",
"蜀山の玄烨",
"江巨基",
"无双の三桂",
"乔梦溪",
"蓝海之恋",
"郑莹",
"宁驰航",
"西门永元",
"玉面彡力宏",
"霍顶天",
"诸葛奇隆",
"爱新觉罗馨予",
"青灵せ铁柱",
"小熊猫",
"蜀山の玄烨",
"江巨基",
"无双の三桂",
"乔梦溪",
"蓝海之恋",
"倾城↘小柔",
"倾城↘孤城",
"烟雨◆志颖",
"百搭",
"封岩松",
"齐亚男",
"完颜国斌",
"好大一对波",
"南宫问天",
"云达华",
"小雨点儿",
"爱很容易",
"孙芳雨",
"好男人就是我",
"欧阳宗纬",
"司马慕容",
"庄爱",
"倾城↘逸迅",
"殇泠月",
"风一般的秀娜",
"董紫玲",
"爱新觉罗力宏",
"翱翔",
"烟雨◆战神",
"南宫晓琪",
"萧宝国",
"谭伊健",
"黄彦宏",
"超越神的恋花",
"莫浩明",
"弑神灬阿然",
"皇甫飞",
"轩辕珊珊",
"不落↘皮卡丘",
"诚仔",
"城仔",
"小飞怪",
"灬一刀",
"多情",
"司马大力",
"轩辕敏镐",
"午夜飞雪",
"蒋敬轩",
"夏侯佳慧",
"女皇",
"伏一刀",
"娇若游龙的超",
"射分叉的德纲",
"秋心如",
"阮华强",
"公孙德纲",
"成建联",
"柯子丹",
"不要哭好吗",
"孔孟达",
"依依不舍丶",
"齐青书",
"慧伦",
"甩我甩",
"松婉儿",
"聂自成",
"南宫佳妮",
"神异孤独",
"七彩苦尽甘来",
"蒋梦莎",
"汪佳慧",
"袁子祥",
"假面天使",
"虎头蜂",
"山西长宽",
"门口的野蛮人",
"只有情永在",
"辽宁小霸王",
"被蹂躏的疏影",
"古德纲",
"爱后面的破仑",
"孤单克群",
"傅艾伦",
"上官慧颖",
"吕海泉",
"祝锦江",
"巩冰婉",
"蒋莎莎",
"独孤力宏",
"尉迟寻欢",
"我玩cf",
"蒋道明",
"红颜丶滅天",
"燕浩明",
"山西长宽",
"门口的野蛮人",
"只有情永在",
"辽宁小霸王",
"被蹂躏的疏影",
"古德纲",
"爱后面的破仑",
"孤单克群",
"傅艾伦",
"上官慧颖",
"吕海泉",
"祝锦江",
"巩冰婉",
"蒋莎莎",
"独孤力宏",
"尉迟寻欢",
"我玩cf",
"蒋道明",
"红颜丶滅天",
"燕浩明",
"黎红雷",
"爱我不要害我",
"吴天",
"虎名不存在",
"抓你姐的咪咪",
"宝哥",
"尉迟超凡",
"温卓腾",
"Love无悔",
"彼此守侯",
"OneisU",
"马云飞",
"RPG丶",
"电竞鲁迅",
"电竞司马迁",
"狂道士灬小拽",
"韩星",
"董天乐",
"曾猛",
"完颜婉儿",
"战龙",
"一把毒",
"手舞足蹈",
"段近南",
"沃妮马",
"风凌子丹",
"限量版继科",
"可口可乐",
"你快回来",
"汪孟达",
"陆易峰",
"上官润发",
"安自成",
"李又琪",
"苍青云",
"皇甫润发",
"穆永康",
"罗晓东",
"龍天",
"华月初开",
"谢静茹",
"你在何方",
"素有人望",
"莎丽公主",
"卢迪文",
"孔思诚",
"欧巴桑",
"独孤浩龙",
"自暴自弃",
"包宗泽",
"爱与痛的边缘",
"袁文东",
"射分叉的云飞",
"笑看各种狗",
"叫我男神",
"季宝亮",
"巫山云雨",
"沈卓妍",
"scax",
"念奴娇",
"卡多什",
"一炮而红",
"邹正英",
"司徒正英",
"司空正英",
"灯火阑珊丶",
"姚家辉",
"封心如",
"黄妹妹",
"范咏麟",
"郭慧敏",
"萧心妍",
"怀山",
"宇文迪文",
"冷文强",
"小泽玛k亚",
"许紫萱",
"罗化腾",
"火神",
"李润发",
"永远挺住",
"鑫哥",
"怀山",
"宇文迪文",
"冷文强",
"小泽玛k亚",
"许紫萱",
"罗化腾",
"火神",
"李润发",
"永远挺住",
"鑫哥",
"超级酱油",
"清枫乱舞",
"黄正英",
"朱仕鹏",
"爱他想他恨他",
"欢欣",
"迷鹿",
"七啊",
"温昊然",
"海峰郭氏",
"伏小春",
"观赏鱼",
"异类",
"幽鬼后期",
"程大嫂",
"如此多情",
"秒秒大哥",
"烟雨依婷",
"皇甫星驰",
"被蹂躏的静仪",
"赵思诚",
"上官梦辰",
"霸气的影子",
"大叔继聪",
"葬爱爱情",
"穆一茜",
"秦兰特",
"安栎鑫",
"宁俊杰",
"无情的变迁",
"黯淡忧伤",
"德艺双馨的幂",
"泰勒罗姆",
"土豪恋花",
"沉默的羔羊",
"南宫祖蓝",
"猫妖",
"爱和梦想",
"正月初四",
"错觉",
"穆小凤",
"安琦菲",
"令狐寻欢",
"魏翔",
"随波逐流",
"蒋大海",
"壹壹",
"宇宙皇帝一山",
"喜欢下面的晨",
"烨火花",
"夜雨潚风",
"薛卫健",
"贺佳妮",
"关令辉",
"公孙朝阳",
"冷开复",
"独孤露露",
"屠夫i",
"盖亚",
"李子梵",
"撸啊撸",
"逆流小猪",
"东方阡陌",
"三秒钟的小刚",
"残阳映雪",
"玉面巨棒",
"射分叉的天乐",
"关崔健",
"坚强小波",
"无情小子",
"马永序",
"司徒香香",
"宇文志炫",
"悍将",
"袁一山",
"花乄无缺",
"毕青云",
"风一般的家驹",
"纳拉巴望",
"巩亦帆",
"董正非",
"花秋水",
"张大海",
"浅唱奈何桥",
"史和伟",
"令狐舟子",
"裴德纲",
"黄埔战魂",
"情爱魔力",
"有文化的先生",
"唐海泉",
"超越神的黎明",
"丹杰",
"司徒香香",
"宇文志炫",
"悍将",
"袁一山",
"花乄无缺",
"毕青云",
"风一般的家驹",
"纳拉巴望",
"巩亦帆",
"董正非",
"花秋水",
"张大海",
"浅唱奈何桥",
"史和伟",
"令狐舟子",
"裴德纲",
"黄埔战魂",
"情爱魔力",
"有文化的先生",
"唐海泉",
"超越神的黎明",
"丹杰",
"蜗蜗洗护",
"俞梦迁",
"决定我爱你",
"爱你够不够",
"黄洪烈",
"涵雪",
"范子强",
"夏宗泽",
"项青书",
"烟雨馨予",
"季宇",
"上官文军",
"勾魂女郎",
"成洪烈",
"汪超",
"烟雨依晨",
"杜志炫",
"梨山痴情花",
"玫瑰的故事",
"曹剑锋",
"鸢尾花物语",
"庄海波",
"为国捐躯",
"杨铁林",
"青灵小帅",
"毕大为",
"方雯婕",
"暗黑版紫玲",
"封刀郎",
"累得要命",
"尉迟荣浩",
"今古红楼",
"爱不戴套",
"爱情鸟",
"难留寻梦郎",
"云诗韵",
"程驰航",
"回头也不要你",
"薛巴马",
"悲伤的情歌",
"慕容天华",
"庞亚鹏",
"超越神的敬明",
"贺铁蛋",
"爱情剑客",
"烟雨萌萌",
"暗香三少",
"坚强曙光",
"庞国驹",
"欧阳卫平",
"炮哥破空",
"尚易峰",
"哭泣玫瑰",
"张大为",
"梦七夜",
"汪婉清",
"司徒欣欣",
"暗香一山",
"无B聊",
"口旅客",
"地方干部",
"千姿百态",
"上官海棠",
"酒入愁肠",
"烟雨清华",
"弑神秋生",
"楠斐齐捷",
"炫耀",
"暗香逸迅",
"宋巨基",
"夏侯宏月",
"卫卡卡",
"雨意听雨",
"冥夜",
"轩硕",
"尚文乐",
"风间琉璃君",
"公孙志刚",
"轩辕青云",
"郑婷婷",
"上官大叔",
"酒入愁肠",
"烟雨清华",
"弑神秋生",
"楠斐齐捷",
"炫耀",
"暗香逸迅",
"宋巨基",
"夏侯宏月",
"卫卡卡",
"雨意听雨",
"冥夜",
"轩硕",
"尚文乐",
    },
  
}
