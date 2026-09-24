--VIP系统脚本


--#include "data\language\LangCode.txt" once
--#include "data\config\vip\VipConfig.lua" once  --vip配置

LocalDT.VIPFreeTelCountCfg = 
{
	0,
	0,
	0,
}


LocalDT.InitVIPSystem = function()
	for k, v in ipairs(VipConfig.Vips) do
		for _, tab in ipairs(v.Effect) do
			if tab.tp == 13 then
				LocalDT.VIPFreeTelCountCfg[k] = tab.param1
			end
		end
	end	
end

-- 下发剩余免费速传次数给客户端
LocalDT.SyncLeftFreeTelCount = function (sysarg)
	local isVip = Actor.isVip(sysarg)			
	if isVip then
		local vipType = Actor.getVipType(sysarg)
		local svar = Actor.getStaticVar(sysarg)
		if (svar.days.VipFreeTelCnt == nil) then svar.days.VipFreeTelCnt = 0 end
		local maxTimes = LocalDT.VIPFreeTelCountCfg[vipType]	or 0
		local leftTimes = 0
		if (maxTimes == -1) then
			leftTimes = -1;
		else
			leftTimes = maxTimes - svar.days.VipFreeTelCnt
			if (leftTimes < 0) then
				leftTimes = 0
			end
		end
		local npack = DataPack.allocPacket(sysarg,139,32)  --申请一个数据包
		DataPack.writeInt(npack,leftTimes)
		DataPack.flush(npack)		
		--print("send vipFreeTelCount to Client:"..leftTimes)
	end
end

--LocalDT.InitVIPSystem()
