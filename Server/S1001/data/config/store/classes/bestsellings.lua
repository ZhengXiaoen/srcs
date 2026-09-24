--热销商品
{
	name = Lang.Store.c00001, --分类名称
	labelId =0,  --0表示是普通的商城，1表示背包限时抢购，2表示0元抢购,3表示1元抢购
	totalBuyLimit =0,    --表示大类的数目的限制个数,0表示无限制，1表示限制一个
	dynamicAdd =false, --是否是动态添加进来的，true表示是动态添加的，动态添加的有数量限制，客户端需要向服务器请求剩余的数据，普通的没有时间限制的配置false
	hasShowWind = false,

        --desc =Lang.Store.desc0001,   --分类的刷新描述

	--该分类中的商品表
	items = {
		{
			-- = 神秘彩蛋,
			id = 10001,
			item = 1362,
			quality = 0,
			strong = 0,
			singleBuyLimit = 0,
			price = {
				{ spid = "*", bind = false, type = 3, price = 10, oldPrice = 99,
				}, 
			},
		},



	},
},