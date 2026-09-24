{
	--开服OpenDays或者合服CombineDay  如果两项都配置了则先判断开服天数再判断合服天数
	--OpenDays或者CombineDay配置为0 代表 当作常规库 
	--如果两项都配置为nil则为首次盗梦库 此位置索引要与FirstDmIndex对应
	--配置 {1, 2} 代表 开服第 1 2天库
	OpenDays = {3, 4},	
	--CombineDay = 0,
	
	--每档的物品库,刷新的时候会从以下各档抽取物品
	--[[
		--yb:全局元宝消耗判断  服务器每盗梦yb元宝,产出一次,如果再使用yb元宝才能再次命中
		--mjPoint:个人梦阶值限制，当前梦阶值大于等于mjPoint才能命中
		--useItem：使用道具是否能可以开出来true为可开出，false为不可开出，默认为true
	--]]
	MjLibList=
	{
		--梦境级
		{
	
	
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=1,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=2,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=3,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=4,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=5,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=6,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=7,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=8,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=9,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=10,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=11,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=12,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=13,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=14,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=15,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=16,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=17,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=18,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=19,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=20,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=21,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=22,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=23,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=24,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},
			{ Persent = 2300, ItemList =
				{	
					{ type=0,itemid=25,count=1,quality=0,strongMin=0,strongMax=0,bind=1,persent=1,mjpoint=0,yb=0,broadcast=0,autoUse=false,useItem=true },
				},	
			},


		},
	}
},