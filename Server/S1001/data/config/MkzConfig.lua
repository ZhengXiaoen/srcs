--军魂配置 2017.7.24     w   w w .    c n 1 2 1. c o m
MkzConfig =
{
    nSceneId = 413, --军魂之地场景id
    Refresh = --BOSS刷新偶数整点刷新
    {
        {nMonsterId = 953,nX = 36,nY = 45,},
    },
    nPaoDianTime = 1000 * 60 * 5, --泡点持续时间- 三分钟
    nPaoDianGiveTime = 5000,    --泡点几秒获得奖励 5秒
    nAddJunGuZhi = 2988,       --获得增加的军鼓值,加到军鼓瓶
    Flag = 
    {
        nMonsterId = 954,  --旗帜怪物id
        nX = 36,        --旗帜怪物X坐标
        nY =45,         --旗帜怪物Y坐标
    },           
}