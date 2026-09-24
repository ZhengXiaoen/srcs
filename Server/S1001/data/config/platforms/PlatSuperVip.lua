PlatSuperVip =
{
	platOver={
			{spid="igg",level={30,70,999},time=600,},
	},



	-------微信礼包配置---------------------------------------------------------
	weiXinGift = {
		--spid平台id, picId 微信图片名数字(otherpng目录下);需要微信礼包的才在platList里填
		platList = {
			--{spid="51t",picId=2101},  --51平台
			{spid="539",picId=2101},	--5399平台微信
			{spid="kaw",picId=2322},	--酷爱玩平台微信
		},
		awardList = 
		{
			{type = 0, id = 509, count = 2, bind = 1},--大金砖 X 2
			{type = 0, id = 552, count = 2, bind = 1},--战将灵力丹中*2
		}

	},
	-------第二种直接扫码关注微信的礼包配置---------------------------------------------------------
	weiXinGift2 = {
		--spid平台id, picId 微信图片名数字(otherpng目录下);需要微信礼包的才在platList里填
		platList = {
			
			{spid="kug",picId=2135},	--酷趣
		},
		awardList = 
		{
			{type = 0, id = 509, count = 2, bind = 1},--大金砖 X 2
			{type = 0, id = 552, count = 2, bind = 1},--战将灵力丹中*2
		}

	},
	-------超级vip配置---------------------------------------------------------
	superVipList = {
		{
			spid = "51g",
			QQ = "800002075", --超级vip客服QQ
			girl = "2201,1831,2202,2203,2204", --超级vip客服美女头像，目录在jxClient\data\lang\zh-cn\interface\otherpng
			gold = "5000000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = false, --点击了是显示QQ,不然是弹窗到php下发的SuperVipUrl网址　
		},
		{
			spid = "sog",
			QQ = "3002905838", --超级vip客服QQ
			girl = "2061", --超级vip客服美女头像，目录otherpng
			gold = "300000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},
		{
			spid = "539",
			QQ = "800187568", --超级vip客服QQ
			girl = "2148", --超级vip客服美女头像，目录在otherpng
			gold = "50000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "214",
			QQ = "800052276", --超级vip客服QQ
			girl = "2117", --超级vip客服美女头像，目录在otherpng
			gold = "300000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "7k7",
			QQ = "3355732022", --超级vip客服QQ
			girl = "2127", --超级vip客服美女头像，目录在otherpng
			gold = "300000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "igg",
			QQ = "168732751", --超级vip客服QQ
			girl = "2147", --超级vip客服美女头像，目录在otherpng
			gold = "200000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "kug",
			QQ = "2850316986", --超级vip客服QQ
			girl = "2146", --超级vip客服美女头像，目录在otherpng
			gold = "200000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "qqg",
			QQ = "800111286", --超级vip客服QQ
			girl = "2208", --超级vip客服美女头像，目录在otherpng
			gold = "80000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "937",
			QQ = "4000089377", --超级vip客服QQ
			girl = "2216", --超级vip客服美女头像，目录在otherpng
			gold = "200000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

		{
			spid = "kaw",
			QQ = "527060", --超级vip客服QQ
			girl = "2323", --超级vip客服美女头像，目录在otherpng
			gold = "200000", --需要元宝
			isOpen = true,   -- 是否开启
			clickShowQQ = true, --点击了是显示QQ
		},

	},
	-------手机礼包配置---------------------------------------------------------
	phoneList = {	--默认有礼包，要不一样的礼包请配下边
		{
			spid = "214",
			spguid = 7, --平台id
			isOpen = true,   -- 是否开启
			awardList = 
			{
				{type = 0, id = 6017, count = 1, bind = 1},
 
			}
		},
		{
			spid = "51g",
			spguid = 3, --平台id
			isOpen = true,   -- 是否开启
			awardList = 
			{

				{type = 0, id = 376, count = 1, bind = 1},
				{type = 0, id = 464, count = 128, bind = 1},
				{type = 0, id = 561, count = 2, bind = 1},
				{type = 0, id = 5475, count = 5, bind = 1},
				{type = 0, id = 678, count = 20, bind = 1},
 
			}
		},
	},
	-------二维码支付配置---------------------------------------------------------
	erWeiPayList = {	--开启二维码
		{
			spid = "ylw",
			spguid = 15,		--平台id
			isOpen = true,		-- 是否开启
			showMore = false,	--设置为true时点充值弹二维码，二维码界面里显示更多，点去官网充
		},

		{
			spid = "sog",
			spguid = 5,		--平台id
			isOpen = true,		-- 是否开启
			showMore = true,	--设置为true时点充值弹二维码，二维码界面里显示更多，点去官网充
		},
	},
	-------51工资　礼包配置
	wagesList = {	
		{
			spid = "51g",
			spguid = 3, --平台id
			isOpen = true,   -- 是否开启
			awardList = 
			{

				{type = 0, id = 6220, count = 1, bind = 1},
				{type = 0, id = 6221, count = 1, bind = 1},
				{type = 0, id = 6222, count = 1, bind = 1},
			}
		},
	},
}
