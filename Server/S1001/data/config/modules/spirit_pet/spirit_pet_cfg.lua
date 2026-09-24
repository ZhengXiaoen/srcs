-- 灵兽配置
spirit_pet_cfg = 
{

-- 灵兽槽位(金 木 水 火 土 阴阳)
slots = {
--#include "spirit_pet_jin_level_list.lua"
--#include "spirit_pet_mu_level_list.lua"
--#include "spirit_pet_shui_level_list.lua"
--#include "spirit_pet_huo_level_list.lua"
--#include "spirit_pet_tu_level_list.lua"
--#include "spirit_pet_yinyang_level_list.lua"
},

-- 回收物品获得灵兽经验
--#include "spirit_pet_recycle_item_list.lua"

-- 灵兽外观列表(所有槽位达到几级后送一个外观)
spirit_pet_list = {
	{
		level = 5, -- 所有槽位达到几级后送一个外观
		appearance = 1, -- 灵兽外观
		name = "功夫熊猫", -- 灵兽名称
	},
	{
		level = 10,
		appearance = 2,
		name = "齐天大圣",
	},
	{
		level = 15,
		appearance = 3,
		name = "雪域狮王",
	},
	{
		level = 20,
		appearance = 4,
		name = "红绸灵童",
	},
	{
		level = 25,
		appearance = 5,
		name = "小恶魔",
	},	

},

}