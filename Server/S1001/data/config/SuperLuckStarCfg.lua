--超级幸运星活动配置   w w  w .  c n 1   2 1. c      o m
----#include "data\config\SuperLuckStarCfg.lua" once
SuperLuckStarCfg = 
{
    --档数
    Level = 
    {   
        --第一档
        {
            name = "蓝色幸运星", --名称
            luckValue = 20, --获得的幸运积分
            payYuanBao = 1000, --累计冲值元宝
            maxStar = 15,   --最大星星数量
        },
        --第二档
        {
            name = "紫色幸运星", --名称
            luckValue = 50, --获得的幸运积分
            payYuanBao = 10000, --累计冲值元宝
            maxStar = 8,   --最大星星数量
        },
        --第三档
        {
            name = "橙色幸运星", --名称
            luckValue = 100, --获得的幸运积分
            payYuanBao = 100000, --累计冲值元宝
            maxStar = 5,   --最大星星数量
        },
    },
    --抽奖- 
    LuckDraw = 
    {
        needLuckValue = 100, --抽一次需要多少幸运值
        countTwo = 10,   --第二个库抽奖达到几次后使用
        award = 
        {
            --第一个库
            {
                {itemid=465,count=99,bind=1,money=1200,rate=2,}, --itemid=物品id,count=数量,bind=绑定
                {itemid=542,count=3,bind=1,money=1200,rate=3,}, --itemid=物品id,count=数量,bind=绑定
                 {itemid=527,count=5,bind=1,money=1200,rate=8,}, --itemid=物品id,count=数量,bind=绑定
                 {itemid=7196,count=1,bind=1,money=1200,rate=15,}, --itemid=物品id,count=数量,bind=绑定
                 {itemid=490,count=1,bind=1,money=1200,rate=20,}, --itemid=物品id,count=数量,bind=绑定
                  {itemid=5647,count=1,bind=1,money=1200,rate=25,}, --itemid=物品id,count=数量,bind=绑定
                  {itemid=539,count=1,bind=1,money=1200,rate=30,}, --itemid=物品id,count=数量,bind=绑定
                  {itemid=574,count=1,bind=1,money=1200,rate=35,}, --itemid=物品id,count=数量,bind=绑定
                   {itemid=6371,count=1,bind=1,money=1200,rate=50,}, --itemid=物品id,count=数量,bind=绑定
                {itemid=6365,count=1,bind=1,money=1200,rate=60,}, --itemid=物品id,count=数量,bind=绑定
               
                
                
               
                
                
               
                
                
            },

            --第二个库
            {
                {itemid=6364,count=1,bind=1,money=0,rate=3,}, --itemid=物品id,count=数量,bind=绑定
                {itemid=6361,count=1,bind=1,money=0,rate=3,}, --itemid=物品id,count=数量,bind=绑定

            },
        }    
    },
}