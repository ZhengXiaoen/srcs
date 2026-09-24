
--购买宠物配置
PetCofig = 
{
	buyPet = 
	{
		giftLevel = 62, --礼物窗口开放等级
		openLevel = 57, -- 开放等级
		{	
			id = 1,			--索引ID
			petId = 257,    --宠物ID
			modelId = 724,  --宠物模型ID
			petAi = 261,    --宠物AI
			coinMaxNum = -1,--每日购买最大上限
			consume = {type = 5, id = 0, count = 100000},--购买价格
			vipLevel = 0,	--需要VIP的等级
			SuperpositionDay = 0,  --需要登录累积的天数
			
			attrCalc = 		 --前端用来显示宠物属性Tip
			{
				{type = 9,value = 511},
				{type = 11,value = 1022},
				{type = 13,value = 511},
				{type = 15,value = 1022},
				{type = 17,value = 511},
				{type = 19,value = 1022},
			},
		},
		{
			id = 2,
			petId = 258,
			modelId = 725,
			petAi = 262,
			coinMaxNum = 10,
			consume = {type = 5, id = 0, count = 150000},
			vipLevel = 0,	
			SuperpositionDay = 7, 
			
			attrCalc = 
			{
				{type = 9,value = 818},
				{type = 11,value = 1635},
				{type = 13,value = 818},
				{type = 15,value = 1635},
				{type = 17,value = 818},
				{type = 19,value = 1635},
			},
		},
		{
			id = 3,			
			petId = 256,	
			modelId = 723,	
			petAi = 260,	
			coinMaxNum = 5,	
			consume = {type = 5, id = 0, count = 200000}, 	
			vipLevel = 2,									
			SuperpositionDay = 0, 							
			
			attrCalc =
			{
				{type = 9,value = 1022},
				{type = 11,value = 2044},
				{type = 13,value = 1022},
				{type = 15,value = 2044},
				{type = 17,value = 1022},
				{type = 19,value = 2044},
			},
		},
	},
	
	StrengthenAttr = 
	{
		PetId = {256,257,258},
		times = 1800,
		attrType = {9,11,13,15,17,19,21,23,25,27},	--属性Type
		multipleConfig = 
		{
			{
				--needOpenServerDay = 2,
				multiple = 2,  --倍数
				--consume = {type = 15,count = 200},
			},
			{
				--needOpenServerDay = 3,
				multiple = 3,
				--consume = {type = 15,count = 500},
			},
			{
				--needOpenServerDay = 5,
				multiple = 4,
				--consume = {type = 15,count = 1200},
			},
			{
				--needOpenServerDay = 5,
				multiple = 6,
				--consume = {type = 15,count = 1200},
			},
		}
	}
}