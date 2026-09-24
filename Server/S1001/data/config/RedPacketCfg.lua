--抢红包配置文件   w w  w .  c n 1  2    1. c   o m
--对应系统变量
--local sVar = System.getStaticVar() 
--sVar.redpack.count = 奖金池元宝
--sVar.redpack.isfirstaward = 0 --是否已经有人领取了大奖
--sVar.redpack.rank =  --捐献排行榜- 零点清空
--sVar.redpack.log = {} --日志记录
RedPacketCfg = 
{
    InitYuanBao = 888888888, --初始化元宝
    First = 
    {
        YuanBao = 888888, --第一次大奖奖励元宝数量
        Rate = 10, --万分比，百分之一的几率
    },
    NeedVipLevel = 1,--需要vip等级
    RobCount = 30, --每日可抢红包次数
    CoolDown = 600, --抢红包冷却时间，单位秒
    MinYuanBao = 888, --普通红包最少元宝
    MaxYuanBao = 2888, --普通红包最多元宝
    Title ={64,65,66}, --第一名与第三名的称号
    LogMaxCont = 50,    --抢红包最大日志数量
    RankName= "rankredpacket",  --排行榜名称
    MaxRankList = 3,    --排行榜显示个数
    upRankNeedMoney =
    {
        10000, --第一名
        5000, --第二名
        2000, --第三名
    },
        
}