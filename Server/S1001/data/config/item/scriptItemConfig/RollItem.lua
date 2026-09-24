--按怪物的死亡爆率掉落物品，比如端午节的粽子这种物品，玩家点击能够按照爆率获取物品
RollItemConfig=
{
	--端午节粽子
	{
		item_id = 1002,     --item_id表示物品的id
       		 itemCount =1, --消耗物品的数目，默认是1，可以不配置，就是一次roll消耗多少个道具	
		needDelete = true,  --needDelete 表示是否需要删除
		needMinBagGrid = 1, --至少需要多少个背包格子的数量 
		onlyDoRoll = true, --是否只执行爆物品的操作，如果程序还有其他的业务逻辑处理，这里使用false(自身注册函数单独处理)，否则使用true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops1.lua",     --爆率的配置文件，同怪物的掉落
	},
	{
		item_id = 855,     --日常礼盒
		itemCount =1, --消耗物品的数目，默认是1，可以不配置，就是一次roll消耗多少个道具	
		needDelete = true,  --needDelete 表示是否需要删除
		needMinBagGrid = 1, --至少需要多少个背包格子的数量 
		onlyDoRoll = true, --是否只执行爆物品的操作，如果程序还有其他的业务逻辑处理，这里使用false(自身注册函数单独处理)，否则使用true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops2.lua",     --爆率的配置文件，同怪物的掉落
	},
	{
--答题状元礼包
		item_id = 818, 
		itemCount =1,
		needDelete = true,
		needMinBagGrid = 2,
		onlyDoRoll = true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops3.lua",     --爆率的配置文件，同怪物的掉落
	},
	{
--答题榜眼礼包
		item_id = 819, 
		itemCount =1,
		needDelete = true,
		needMinBagGrid = 2,
		onlyDoRoll = true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops4.lua",     --爆率的配置文件，同怪物的掉落
	},
	{
--答题探花礼包
		item_id = 820, 
		itemCount =1,
		needDelete = true,
		needMinBagGrid = 2,
		onlyDoRoll = true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops5.lua",     --爆率的配置文件，同怪物的掉落
	},
	{
--答题智者礼包
		item_id = 821, 
		itemCount =1,
		needDelete = true,
		needMinBagGrid = 1,
		onlyDoRoll = true,
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops6.lua",     --爆率的配置文件，同怪物的掉落
	},
	
{
	item_id = 1561,
	itemCount = 1,
	needMinBagGrid = 4,
	needDelete = true,
	onlyDoRoll = true,	
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops7.lua",     --爆率的配置文件，同怪物的掉落

},

{
	item_id = 1562,
	itemCount = 1,
	needMinBagGrid = 4,
	needDelete = true,
	onlyDoRoll = true,	
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops8.lua",     --爆率的配置文件，同怪物的掉落
},

{
	item_id = 1563,
	itemCount = 1,
	needMinBagGrid = 4,
	needDelete = true,
	onlyDoRoll = true,	
		dropName = "data/config/item/scriptItemConfig/RollItemDrops/drops9.lua",     --爆率的配置文件，同怪物的掉落
},
	
	
	
	
}