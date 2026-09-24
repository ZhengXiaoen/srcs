--用于C++

CppMiscCfg = 
{
	-- 护体神盾
	Shield = {
		{type=6,value=0.2,},
		{type=8,value=0.1,},
		{type=24,value=0.1,},
		{type=28,value=0.1,},
	},
	
	--发大表情需要的金钱
	BigSmileGroups = {
		-- 0 为绑金; 1 为金币; 2 为绑元; 3 为元宝
		{moneyType=0, moneyCount=10000, isVipFree=true},	-- 组 1 {金钱类型, 金钱数量, VIP是否免费}
		{moneyType=3, moneyCount=2, isVipFree=false}, 		-- 组 2
	},
}