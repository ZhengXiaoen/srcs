--联运平台id
PlatformCfg = 
{

	--51g
	{
		name = "51",
		id = 3, --平台id
		titleid = 0, --称号id
		spid = "51g",
		isOpen = true,   -- 是否开启
		Activity = --活动
		{
			--大厅新手礼包,51签到礼包　 index:1
			{

				Awards=
				{
					{
						{ type =0, id =544, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =539, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =574, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =490, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5171, count =1, strong = 0, quality = 0, bind = 1},
					},
					
				},
			},
			--每日登录  index:2
			{
				--需求51贵宾等级 {"1/2/3富","4/5富","捕头/县令","知府/总督","宰相/亲王","太子/皇帝",},		--贵宾礼包名
				LimitLevel = 
				{
					{1,2,3},{4,5},{6,7},{8,9},{10,11},{12,13},		--贵宾等级范围
				},
				
				Awards = 
				{
					--51贵宾
					{
						{ type =0, id =678, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =1779, count =2, strong = 0, quality = 0, bind = 1},
					},
					--51贵宾
					{
						{ type =0, id =678, count =15, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =1779, count =3, strong = 0, quality = 0, bind = 1},
					},
					--51贵宾
					{
						{ type =0, id =678, count =30, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =10, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =1779, count =5, strong = 0, quality = 0, bind = 1},
					},
					--51贵宾
					{
						{ type =0, id =678, count =50, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =15, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =4, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =1779, count =8, strong = 0, quality = 0, bind = 1},
					},
					--51贵宾
					{
						{ type =0, id =678, count =70, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =20, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =7, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5127, count =1, strong = 0, quality = 0, bind = 1},
					},
					--51贵宾
					{
						{ type =0, id =678, count =100, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =30, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =6, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =10, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5127, count =2, strong = 0, quality = 0, bind = 1},
					},

				},
			},
				--大厅等级礼包 index:3
			{
				--需求等级下标对应Awards 下标
				NeedLevel = 
				{
					2000,4000,6000,8000,10000,12000		--转数
				},
				Awards = 
				{
					--2转
					{
						{ type =0, id =507, count =4, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =10, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5475, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =459, count =188, strong = 0, quality = 0, bind = 1},
						{ type =0, id =560, count =3, strong = 0, quality = 0, bind = 1},
					},
					--4转
					{
						{ type =0, id =538, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =15, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5475, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =3, strong = 0, quality = 0, bind = 1},
					},
					--6转
					{
						{ type =0, id =573, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =30, strong = 0, quality = 0, bind = 1},
						{ type =0, id =464, count =88, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =10, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =5, strong = 0, quality = 0, bind = 1},
					},
					--8转
					{
						{ type =0, id =538, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =573, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5171, count =188, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =15, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =8, strong = 0, quality = 0, bind = 1},
					},
					--10转
					{
						{ type =0, id =538, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =573, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5171, count =388, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =20, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =10, strong = 0, quality = 0, bind = 1},
					},
					--12转
					{
						{ type =0, id =538, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =573, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =5171, count =888, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =30, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =20, strong = 0, quality = 0, bind = 1},
					},
					
				},
			},
           
			--称号奖励　51称号 index:4
			{
				--需求51贵宾等级
				NeedLevel = 
				{
					7,8,9,10,11,12		--贵宾等级
				},
				Awards =
				{
					{
						{ type =0, id =50, count =1, strong = 0, quality = 0, bind = 1,name = "蝙蝠侠"},   --称号id
					},
					{
						{ type =0, id =51, count =1, strong = 0, quality = 0, bind = 1,name = "黑羽蝠王"}, --称号id
					},
					{
						{ type =0, id =52, count =1, strong = 0, quality = 0, bind = 1,name = "红羽蝠王"}, --称号id
					},
					{
						{ type =0, id =53, count =1, strong = 0, quality = 0, bind = 1,name = "金翼蝠王"}, --称号id
					},
					{
						{ type =0, id =54, count =1, strong = 0, quality = 0, bind = 1,name = "幻影蝠王"}, --称号id
					},
					{
						{ type =0, id =55, count =1, strong = 0, quality = 0, bind = 1,name = "至尊蝠王"}, --称号id
					},
				}
			},
		},
	},
	--2144
	{
		name = "2144",
		id = 7, --平台id
		titleid = 0, --称号id
		spid = "214",
		isOpen = true,   -- 是否开启
		Activity = --活动
		{
			--大厅新手礼包
			{

				Awards=
				{
					{
						{ type =0, id =6020, count =1, strong = 0, quality = 0, bind = 1},
					},
					
				},
			},
			--每日登录
			{
				Awards = {{},},
			},
			--大厅等级礼包
			{
				--需求等级下标对应Awards 下标
				NeedLevel = {},
				Awards = {{},},
			},
			--皮肤奖励
			{
				Awards = {{},},
			},
		},
	},
	--搜狗
	{
		name = "搜狗",
		id = 5, --平台id
		titleid = 35, --称号id
		spid = "sog",
		isOpen = true,   -- 是否开启
		Activity = --活动
		{
			--大厅新手礼包
			{

				Awards=
				{
					{
						{ type =0, id =508, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =560, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =1777, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =1778, count =5, strong = 0, quality = 0, bind = 1},
					},
					
				},
			},
			--大厅累积登录七天
			{
				Awards = 
				{
				--第一天
					{
						{ type =0, id =678, count =10, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =548, count =5, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =507, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =1, strong = 0, quality = 0, bind = 1},
					},
				},
			},
				--大厅等级礼包
			{
				--需求等级下标对应Awards 下标
				NeedLevel = 
				{
					60,70,80,90
				},
				Awards = 
				{
					--60
					{
						{ type =0, id =535, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =569, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =459, count =20, strong = 0, quality = 0, bind = 1},
					},
					--70
					{
						{ type =0, id =535, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =569, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =459, count =40, strong = 0, quality = 0, bind = 1},
					},
					--80
					{
						{ type =0, id =535, count =3, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =569, count =3, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =459, count =80, strong = 0, quality = 0, bind = 1},
					},

					--90
					{
						{ type =0, id =535, count =5, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =569, count =5, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =459, count =100, strong = 0, quality = 0, bind = 1},
					},
				},
			},
			--皮肤奖励
			{
				Awards =
				{
					{
						{ type =0, id =509, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =536, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =570, count =1, strong = 0, quality = 0, bind = 1},
					},
				}
			},
		},
	},


--QQ空间
	{
        name = "QQ空间",
		id = 99, --平台id
		titleid = 35, --称号id
		spid = "qqg",
		isOpen = true,   -- 是否开启
		Activity = --活动
		{
			--新手礼包
			{

				Awards=
				{
					{
						{ type =0, id =507, count =5, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =561, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =498, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =551, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =463, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =459, count =50, strong = 0, quality = 0, bind = 1},
					},
					
				},
			},
			--每日登录礼包
			{
				Awards = 
				{
				--每日礼包
					{
						{ type =0, id =507, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =463, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =678, count =15, strong = 0, quality = 0, bind = 1},
						{ type =0, id =682, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =502, count =2, strong = 0, quality = 0, bind = 1},
					},
				-- 
				},
			},
				--大厅等级礼包
			{
				--需求等级下标对应Awards 下标
				NeedLevel = 
				{
					30,40,50,70,82
				},
				Awards = 
				{
					--30
					{
						{ type =0, id =542, count =1, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =464, count =99, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =550, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =561, count =1, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =10, strong = 0, quality = 0, bind = 1},
					},
					--40
					{
						{ type =0, id =5171, count =280, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =459, count =199, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =550, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =10, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =5, strong = 0, quality = 0, bind = 1},
					},
					--50
					{
						{ type =0, id =538, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =482, count =3, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =536, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =5, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =30, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =10, strong = 0, quality = 0, bind = 1},
					},

					--70
					{
						{ type =0, id =573, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =482, count =5, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =570, count =3, strong = 0, quality = 0, bind = 1},
						{ type =0, id =507, count =7, strong = 0, quality = 0, bind = 1},
						{ type =0, id =678, count =50, strong = 0, quality = 0, bind = 1},
						{ type =0, id =548, count =20, strong = 0, quality = 0, bind = 1},
					},
					--82
					{
						{ type =0, id =538, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =573, count =2, strong = 0, quality = 0, bind = 1},--
						{ type =0, id =489, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =536, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =570, count =2, strong = 0, quality = 0, bind = 1},
						{ type =0, id =509, count =3, strong = 0, quality = 0, bind = 1},
					},
				},
			},
			--皮肤奖励
			{
				Awards = {{},},
			},
		},
	},
	

}