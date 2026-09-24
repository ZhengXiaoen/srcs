
--#include "data\config\guide\LoginOutExpConfig.lua" once
--#include "data\functions\Activity\Common\Consumes.lua" once

-- 领取离线奖励
MiscsImplement.getLogOutExpMsgFunc = function (sysarg, msgid, packet)

	Actor.sendTipmsg(sysarg, "离线奖励功能暂时屏蔽", ttFlyTip)
	local b = true
	if b == true then return end
	---------------
	
	local type = DataPack.readByte(packet) or 1
	local isRepCost = DataPack.readByte(packet) or 0
	if type == nil or isRepCost == nil then return end
	local var = Actor.getStaticVar(sysarg)
	local logoutTime = var.logoutTime
	if logoutTime == nil then
		GetLogoutExpReturn(sysarg, 0)
		return
	end
	
	local logoutHour = math.floor(logoutTime / 60)
	
	if logoutHour < LogOutExp.minTime then 
		GetLogoutExpReturn(sysarg, 0)
		return 
	end
	
	if logoutHour > LogOutExp.maxTime then
		logoutHour = LogOutExp.maxTime
	end
	
	local level =  Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	
	if level < LogOutExp.limitLevel[1] or level > LogOutExp.limitLevel[2] then 
		GetLogoutExpReturn(sysarg, 0)
		return 
	end
	
	local expPerLevel = LogOutExp.expPerLevel
	if expPerLevel.type ~= 20 then
		GetLogoutExpReturn(sysarg, 0)
		return 
	end
	
	local fVipAdd = expPerLevel.quality or 0
	local baseExp = LogOutExp.outexp
	
	--[[
	--修改为读取配置进行领取最大等级限制
	local MaxLevel = table.getn(expPerLevel)+LogOutExp.limitLevel[1]-1     
	if level > MaxLevel then
		GetLogoutExpReturn(sysarg, 0)
		return 
	end
	
	local upLevel = level - LogOutExp.limitLevel[1] + 1
	local baseExp = expPerLevel[upLevel]                          --读取当前等级能获到的经验
	--]]
	
	
	if baseExp == nil or baseExp == 0 then 
		GetLogoutExpReturn(sysarg, 0)
		return 
	end

	local getExpConsume = LogOutExp.getExpConsume[type]
	
	if not getExpConsume then 
		GetLogoutExpReturn(sysarg, 0)
		return 
	end
	
	local consume = getExpConsume.consume
	
	local logoutExp = 0

	if consume and consume.count and consume.count > 0 then
		local reqCount = consume.count*logoutHour
		local nCurYb = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
		print(reqCount,nCurYb)
		local hasCount = Actor.getItemCount(sysarg, consume.id, 0, 0, -1)

		logoutExp = math.floor(getExpConsume.rate* baseExp *logoutHour)
		if reqCount > nCurYb then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00045,ttFlyTip)
			return
		else
			Actor.changeMoney(sysarg,3,-reqCount,GameLog.clGetLogOutExp,Lang.LogTips.l00080)
		end
		--local consumes = {type = consume.type,id = consume.id,count = reqCount}

		--local ybRepTips = Lang.ScriptTips.x00045
		--local result = Consumes.SuccessCheck(sysarg, consumes, isRepCost, 0, ybRepTips)

--		if (result ~= successCheckResult.ok) then 
--			GetLogoutExpReturn(sysarg, 0)
--			return 
--		end

		--local logstr = string.format(Lang.LogTips.l00080, getExpConsume.rate)
		--local result, isBind = Consumes.OnConsumes(sysarg, consumes, isRepCost, 0, 169, logstr)
		--if (result ~= successCheckResult.ok) then 
		--	GetLogoutExpReturn(sysarg, 0)
		--	return 
		--end
	else

		logoutExp = baseExp *logoutHour
	end


	--[[if consume and consume.count and consume.count > 0 then
		local reqCount = consume.count*logoutHour
		
		local hasCount = Actor.getItemCount(sysarg, consume.id, 0, 0, -1)
		if isRepCost > 0 or hasCount > reqCount then
			hasCount = reqCount
		end
		logoutExp = math.floor((hasCount / reqCount * (getExpConsume.rate) + (reqCount - hasCount) / reqCount) * baseExp *logoutHour)
		
		if hasCount < reqCount then
			reqCount = hasCount
		end
	
		--重构消耗
		local consumes = {{type = consume.type, id = consume.id, count = reqCount, quality = consume.quality, strong = consume.strong,yb = consume.yb}}
		
		local ybRepTips = Lang.ScriptTips.x00045
		local result = Consumes.SuccessCheck(sysarg, consumes, isRepCost, 0, ybRepTips)
		
		if (result ~= successCheckResult.ok) then 
			GetLogoutExpReturn(sysarg, 0)
			return 
		end
		
		local logstr = string.format(Lang.LogTips.l00080, getExpConsume.rate)
		local result, isBind = Consumes.OnConsumes(sysarg, consumes, isRepCost, 0, 169, logstr)
		if (result ~= successCheckResult.ok) then 
			GetLogoutExpReturn(sysarg, 0)
			return 
		end
	else
		logoutExp = baseExp *logoutHour
	end--]]
	
	Actor.addExp(sysarg, logoutExp, 169, 0)
	
	local str = string.format(Lang.ScriptTips.x00047, logoutExp)
	Actor.sendTipmsg( sysarg, str, ttFlyTip )
	
	var.logoutTime = 0
	
	GetLogoutExpReturn(sysarg, 1)
	
end

function GetLogoutExpReturn(sysarg, result)
	local npack = DataPack.allocPacket(sysarg,139,6)
	if npack == nil then return end
	DataPack.writeByte(npack, (result or 0))
	DataPack.flush(npack)
end
--第三组选项
function buyDoubleLogOutExpItem(sysarg)
	local item = (LogOutExp.GETEXPITEM[1])
  Actor.openDialogs(sysarg,diBuyAnItem,string.format("%s", item))
end

--第二组 选项
function getMoreLogOutExp(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local getlogoutExp = var.getlogoutExp
	if getlogoutExp == nil then
	local npack = DataPack.allocPacket(sysarg,139,6)
	if npack == nil then return end
	DataPack.writeByte(npack,0)
	DataPack.flush(npack)
		return
	end
	local rate = (LogOutExp.GETEXPRATE[2])
	local item = (LogOutExp.GETEXPITEM[2])
	if (Actor.getItemCount(sysarg,item) > 0 and getlogoutExp[1] > 0 ) then
	local expcount = math.floor(getlogoutExp[1]*rate)
		getlogoutExp[1] = 0
	Actor.addExp(sysarg,expcount,0,0)
	Actor.removeItem(sysarg,item,1,-1,-1,-1,"",5)
	local str = string.format(Lang.ScriptTips.x00047,expcount)
	Actor.sendTipmsg( sysarg,str,ttTipmsgWindow )
	end
	--返回领取信息
	if getlogoutExp[1] == 0 then 
	  local npack = DataPack.allocPacket(sysarg,139,6)
	  if npack == nil then return end 
	DataPack.writeByte(npack,1)
	DataPack.flush(npack)
	end 
end

--取消购买道具
function cencelBuyItem(sysarg)
	local npack = DataPack.allocPacket(sysarg,139,6)
	if npack == nil then return end
	DataPack.writeByte(npack,0)
	DataPack.flush(npack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetOfflineAward, MiscsImplement.getLogOutExpMsgFunc)