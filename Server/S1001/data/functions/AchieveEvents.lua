
--[[
var.achvData[1] 64位,现在用了1个

0. (BYTE) 参与攻城战次数，每次攻城期间时进入皇宫为1次(地图ID:51)
1. (BYTE) 天关闯到第几关，共200关(地图ID:163)
2. (BYTE) 进入封魔谷地图次数统计(地图ID:175)
3. (BYTE) 进入玛雅神殿地图次数统计(地图ID:53)
4. (BYTE) 击杀BOSS数量(BOSS ID:339)
5. (BYTE) 击杀BOSS数量(BOSS ID:340)
6. (BYTE) 击杀BOSS数量(BOSS ID:341) 

--]]


function GetActorVarAchieveData(sysarg, dataIdx, byteIdx)
	local var = Actor.getStaticVar(sysarg)
	local achvData = var.achvData
	if achvData == nil then return 0 end
	
	local achvVal = achvData[dataIdx]
	if achvVal == nil then return 0 end
	
	return System.getInt64Byte(achvVal, byteIdx)
end

function SetActorVarAchieveData(sysarg, dataIdx, byteIdx, byteVal)
	-- 现在用1个就够了，以后可能会用多个再改
	if dataIdx ~= 1 then return end
	
	local var = Actor.getStaticVar(sysarg)
	local achvData = var.achvData
	if achvData == nil then
		var.achvData = {}		
		achvData = var.achvData
	end
	
	local achvVal = achvData[dataIdx]
	if achvVal == nil then
		achvData[dataIdx] = 0
		achvVal = 0
	end
	
	achvVal = System.setInt64Byte(achvVal, byteIdx, byteVal)
	achvData[dataIdx] = achvVal
end
