--lua script
--#include "data\language\LangCode.txt" once   --语言包

--第一坐骑主题活动

--23结算
function OnAccountRide()
	--[[ 屏蔽
	System.onAccountAllActivity(7,0)
	System.onAccountAllActivity(8,0)
	System.onAccountAllActivity(9,0)
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(5)
	BroadBrationEffect()
	--]]
end

function sortRidefunc(a, b)
	return a.ridelevel > b.ridelevel or (a.ridelevel == b.ridelevel and a.rideExp > b.rideExp)
end

--坐骑等级提升给提示
function UpRideLevelGiveTips(sysarg)
	--[[ 屏蔽
	if System.getActivityFinishDays(5) > 0 then return end
	if System.getDaysSinceOpenServer() > 5 then return end
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if System.getDaysSinceOpenServer() == 5 and nHour >= 23 then return end
	
	
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nRideLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_RIDE_LEVEL)
	local nRideExp = Actor.getIntProperty(sysarg,PROP_ACTOR_MOUNT_EXP)
	
	local var = System.getStaticVar()
	local IsInList = false
	if not var.TopMount then
		var.TopMount = {}
	end
	
	List = var.TopMount
	for k = 1, 3 do
		--空位置,直接放入数据
		if not List[k] then
			List[k] = {}
			List[k].actorid = nActorId
			List[k].name = sName
			List[k].ridelevel = nRideLevel
			List[k].rideExp = nRideExp
			IsInList = true
			break
		end
		
		--不是空看看是不是角色
		if List[k].actorid == nActorId then
			--找到后更新数据
			List[k].ridelevel = nRideLevel
			List[k].rideExp = nRideExp
			
			IsInList = true
			break
		end
	end

	if not IsInList then
		--没查找到,对比最小的,如果大于,就直接替换
		--print(List[3].value, nCurChopLevel)
		if List[3].ridelevel < nRideLevel or (List[3].ridelevel == nRideLevel and List[3].rideExp < nRideExp) then
			List[3].actorid = nActorId
			List[3].name = sName
			List[3].ridelevel = nRideLevel
			List[3].rideExp = nRideExp
			
			IsInList = true
		end
	end
	
	--没有变化或者数组大小为1,不用排序
	if not IsInList or 1 == #List then
		return List
	end

	--重新排序
	local Tmp = {}
	
	for k = 1, 3 do
		if nil == List[k] then
			break
		end
		
		local TmpData = {}
		TmpData.actorid = List[k].actorid
		TmpData.name = List[k].name
		TmpData.ridelevel = List[k].ridelevel
		TmpData.rideExp = List[k].rideExp

		table.insert(Tmp, TmpData)
	end

	table.sort(Tmp, sortRidefunc)
	
	--排序完赋值回去
	for k, v in pairs(Tmp) do
		List[k].actorid = v.actorid
		List[k].name = v.name
		List[k].ridelevel = v.ridelevel
		List[k].rideExp = v.rideExp
	end
	--]]
end