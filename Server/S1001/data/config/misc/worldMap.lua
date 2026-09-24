--#include "..\..\language\LangCode.txt"
--世界地图配置
worldMap =
{
	--世界地图中红快描述的配置
	--blockDesc = 
	--{
		--blockId要和mapBlocks的对应,没开放的写0
	     -- {blockId = 3, blockDesc = Lang.MapTips.m00003, blockDescX = 507, blockDescY = 260,},  --死亡矿井（25-29级）
	     -- {blockId = 4, blockDesc = Lang.MapTips.m00004, blockDescX = 460, blockDescY = 188,}, --玛雅古墓（30-39级）
	     -- {blockId = 5, blockDesc = Lang.MapTips.m00005, blockDescX = 342, blockDescY = 331,}, --骷髅祭坛（40-49级）
	     -- {blockId = 8, blockDesc = Lang.MapTips.m00008, blockDescX = 292, blockDescY = 91,},  --蛮荒禁地 （50-59级）
	     -- {blockId = 9, blockDesc = Lang.MapTips.m00009, blockDescX = 202, blockDescY = 81,},  --妖狼宫殿（60-69级）
	     -- {blockId = 10, blockDesc = Lang.MapTips.m00010, blockDescX = 182, blockDescY = 176,},  --蜘蛛魔窟（70-74级）
	    --  {blockId = 11, blockDesc = Lang.MapTips.m00011, blockDescX = 299, blockDescY = 248,},  --伏魔峡谷（75-79级）
	     -- {blockId = 12, blockDesc = Lang.MapTips.m00013, blockDescX = 223, blockDescY = 324,}, --幽魂峡谷（一转地图）
	     -- {blockId = 13, blockDesc = Lang.MapTips.m00014, blockDescX = 143, blockDescY = 355,},  --修罗地宫 （二转地图）
	     -- {blockId = 14, blockDesc = Lang.MapTips.m00015, blockDescX = 77, blockDescY = 352,},  --孽境地狱（三转地图）
	     -- {blockId = 15, blockDesc = Lang.MapTips.m00016, blockDescX = 34, blockDescY = 265,},  --蓬莱仙岛 （四转地图）
	     -- {blockId = 16, blockDesc = Lang.MapTips.m00017, blockDescX = 91, blockDescY = 188,},  --大雷音寺 （五转地图）
 
	--},

	--重点城市显示
	--hideRightTrans 表示是否隐藏右侧的速传，否则将在右侧加一个传送到场景的默认点  findAbility能否自动寻路 默认为true 不能寻路的提示 请寻找传送员
	--cities = 
	--{
		--{cityName = Lang.SceneName.s00001, x = 472, y = 320, txtColor = "00ff00", filterColor = "0", size = 12,findAbility = false},  --凤凰村
		--{cityName = Lang.SceneName.s00002, x = 419, y = 258, txtColor = "00ff00", filterColor = "0", size = 12,findAbility = false},  --卧龙城 
		--{cityName = Lang.SceneName.a00036, x = 496, y = 242, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --死亡矿井
		--{cityName = Lang.SceneName.a00037, x = 447, y = 172, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --玛雅古墓
		--{cityName = Lang.SceneName.a00038, x = 331, y = 314, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --骷髅祭坛
		--{cityName = Lang.SceneName.s00005, x = 274, y = 158, txtColor = "00ff00", filterColor = "0", size = 12,findAbility = false},  --土城
		--{cityName = Lang.SceneName.a00048, x = 361, y = 158, txtColor = "00ff00", filterColor = "0", size = 12,findAbility = false},  --沙巴克 
		--{cityName = Lang.SceneName.a00039, x = 281, y = 74,  txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --蛮荒禁地
		--{cityName = Lang.SceneName.a00040, x = 190, y = 63, txtColor = "00ffff", filterColor = "0",  size = 12,findAbility = false},  --妖狼宫殿
		--{cityName = Lang.SceneName.a00041, x = 170, y = 158, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --蜘蛛魔窟
		--{cityName = Lang.SceneName.a00042, x = 287, y = 230, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --伏魔峡谷
		--{cityName = Lang.SceneName.a00049, x = 109, y = 258, txtColor = "00ff00", filterColor = "0", size = 12,findAbility = false},  --西域荒漠
		--{cityName = Lang.SceneName.a00043, x = 213, y = 306, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --幽魂峡谷
		--{cityName = Lang.SceneName.a00044, x = 134, y = 336, txtColor = "00ffff", filterColor = "0", size = 12,findAbility = false},  --修罗地宫
		--{cityName = Lang.SceneName.a00045, x = 68, y = 333, txtColor = "00ffff", filterColor = "0",  size = 12,findAbility = false},  --孽境地狱
		--{cityName = Lang.SceneName.a00046, x = 25, y = 246, txtColor = "00ffff", filterColor = "0",  size = 12,findAbility = false},  --蓬莱仙岛
		--{cityName = Lang.SceneName.a00047, x = 82, y = 169, txtColor = "00ffff", filterColor = "0",  size = 12,findAbility = false},  --大雷音寺
		--{cityName = Lang.SceneName.a00050, x = 36, y = 97, txtColor = "00ff00", filterColor = "0",   size = 12,findAbility = false},  --神圣庄园

	--},


	--需要点击的块
	mapBlocks = 
	{
		--文件名 这个id和下面secondMap的id要对应
		{blockId = 1,  blockX = 12, blockY = 301, sceneId = 1},--隐龙村
		--{blockId = 2,  blockX = 163, blockY = 293, sceneId = 5},--霸者秘境
		{blockId = 3,  blockX = 215, blockY = 170, sceneId = 2},--卧龙城
		--{blockId = 4,  blockX = 415, blockY = 156, sceneId = 7},--乱石林 
		--{blockId = 5,  blockX = 101, blockY = 119, sceneId = 13},--枫叶沼泽
		{blockId = 6,  blockX = 172, blockY = 12, sceneId = 3},--沙漠土城
		{blockId = 7,  blockX = 407, blockY = 18, sceneId = 4},--王城
		
		
	},
}