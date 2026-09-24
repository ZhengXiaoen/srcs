--动态活动配置文件
DynamicScriptTimer=
{
    {
        name = "老哥跑吧",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_bpbxd",  --开始活动函数   
        end_func = "EndActivity_bpbxd", --结束活动函数
        
    },
    {
        name = "全服双倍",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_DoubleExp",  --开始活动函数   
        end_func = "EndActivity_DoubleExp", --结束活动函数
    },
    {
        name = "激情闭关",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_BGXL",  --开始活动函数   
        end_func = "EndActivity_BGXL", --结束活动函数
    },
    {
        name = "财宝豆豆",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_YBJNH",  --开始活动函数   
        end_func = "EndActivity_YBJNH", --结束活动函数
    },
    {
        name = "武林争霸",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_wlzb",  --开始活动函数   
        end_func = "EndActivity_YBJNH", --结束活动函数
    },
    {
        name = "多倍炼狱",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "onBroadcast_ShuangBeiLianYu_Start",  --开始活动函数   
        end_func = "OnBroadcast_ShuangBeiLianYu_End", --结束活动函数
    },
    {
        name = "神威闯关",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_JMZC",  --开始活动函数   
        end_func = "EndActivity_JMZC", --结束活动函数
    },
    {
        name = "军团战场",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_juntuanzhan",  --开始活动函数   
        end_func = "EndActivity_juntuanzhan", --结束活动函数
    },
    {
        name = "秘境之旅",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_MiJingZhiLv",  --开始活动函数   
        end_func = "EndActivity_MiJingZhiLv", --结束活动函数
    },
    {
        name = "夺宝奇兵",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_duobaoqibing",  --开始活动函数   
        end_func = "EndActivity_duobaoqibing", --结束活动函数
    },
    {
        name = "抵御入侵",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "onstartguildfight",  --开始活动函数   
        end_func = "onstopguildfight", --结束活动函数
    },
    {
        name = "双倍押镖",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "onBroadcast_DuoBeiYaSong_Start",  --开始活动函数   
        end_func = "OnBroadcast_DuoBeiYaSong_End", --结束活动函数
    },
    
    {
        name ="开服活动充值排行第一轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,1",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="开服活动充值排行第二轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,2",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="开服活动充值排行第三轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,3",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="开服活动充值排行第四轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,4",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="开服活动充值排行第五轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,5",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="开服活动充值排行第六轮",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "Pay_Rank_Activity_Start,6",  --开始活动函数   
        end_func = "Pay_Rank_Activity_Stop", --结束活动函数
    },
    {
        name ="世界BOSS",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_WorldBoss",  --开始活动函数   
        end_func = "EndActivity_WorldBoss", --结束活动函数
    },
   {
        name ="饕餮神殿",
        npcid = 0,
        timer = 60, --持续时间 / 秒
        start_func = "StartActivity_TTSD,6",  --开始活动函数   
        end_func = "EndActivity_TTSD", --结束活动函数
    },
}