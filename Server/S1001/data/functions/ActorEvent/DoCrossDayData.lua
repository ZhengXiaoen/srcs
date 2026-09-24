

--处理跨天的数据，0点在线玩家和新的一天第一次登陆处理

--#include "data\config\vip\VipConfig.lua" once

function OnCrossDayOpt(sysarg)
	OnVipUpgrade(sysarg)

end

--更新vip信息
function OnVipUpgrade(sysarg)
	local addPoint = nil
	local curPoint = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_POINT)
	if Actor.isVip(sysarg) then	
		addPoint = VipConfig.VipAddPoint		
	else
		if curPoint > 0 then
			if curPoint < VipConfig.NoVipRemPoint then
				addPoint = -curPoint
			else
				addPoint = -VipConfig.NoVipRemPoint
			end
		end		
	end
	if addPoint then
		Actor.changeVipPoint(sysarg, addPoint)
	end
end