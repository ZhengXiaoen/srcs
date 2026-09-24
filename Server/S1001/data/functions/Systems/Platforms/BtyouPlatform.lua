--btyou平台相关功能

--[[
function Platform_Btyou_Pay(sysarg, nYuanBao)
	
	if System.getSpid() ~= 17 then 
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.SendBtyouPayFlag then
		return 
	end
	
	local nCurTime = System.getCurrMiniTime()
	
	if not var.PayBtyouCount then
		var.PayBtyouCount = {}
		var.PayBtyouCount[1] = 0
		var.PayBtyouCount[2] = nCurTime
	end
	
	if not System.isSameMonth(nCurTime,nCurTime) then
		var.PayBtyouCount = nil
	end
	
	var.PayBtyouCount[1] = var.PayBtyouCount[1] + nYuanBao
	var.PayBtyouCount[2] = nCurTime
	
	if var.PayBtyouCount[1] >= 100000 or nYuanBao >= 50000 then
		local pack = DataPack.allocPacket(sysarg, 139, 130)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
		var.SendBtyouPayFlag = 1
	end
end
--]]