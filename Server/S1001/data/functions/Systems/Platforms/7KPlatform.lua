--7K平台相关功能

--[[
function Platform_7K_Pay(sysarg, nYuanBao)
	
	if System.getSpid() ~= 11 then 
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.Send7KPayFlag then
		return 
	end
	
	local nCurTime = System.getCurrMiniTime()
	
	if not var.Pay7KCount then
		var.Pay7KCount = {}
		var.Pay7KCount[1] = 0
		var.Pay7KCount[2] = nCurTime
	end
	
	if not System.isSameMonth(nCurTime,nCurTime) then
		var.Pay7KCount = nil
	end
	
	var.Pay7KCount[1] = var.Pay7KCount[1] + nYuanBao
	var.Pay7KCount[2] = nCurTime
	
	if var.Pay7KCount[1] >= 500000 or nYuanBao >= 200000 then
		local pack = DataPack.allocPacket(sysarg, 139, 130)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
		var.Send7KPayFlag = 1
	end
end
--]]