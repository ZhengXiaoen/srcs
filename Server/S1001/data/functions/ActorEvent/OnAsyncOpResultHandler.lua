--lua script

--type : 2 为增值卡的类型
--#include "data\config\item\ZhanZheKaReward.lua" once
--#include "data\functions\ActorEvent\NormalItem\NormalItemRewards.lua" once

-- 增值卡年月数，相对于2018年，如2019年2月为(102)
function GetZhanZheKaYearMonth()
	local y,m,d = System.getDate()
	if y < 2018 then y = 2018 end
	
	local ym = (y - 2018) * 100 + m
	return ym
end

EventCallDispatcher.OnAsyncOpResultFunc = function (sysarg,arg)
  --print("on result!!"..arg[1].." "..arg[2])
  local typeid = arg[1]   --序列号类型  2为增值卡 
  local result = arg[2]
  --用于记录玩家使用增值卡的次数
	local var = Actor.getStaticVar(sysarg)
	
	if var.ZengZhiKa ~= nil then
		--请先调用 TransformZengZhiKaData() 转换为新数据
		return
	end

  if typeid == 2 then   	
	  if result == 0 then 
	    --print("result can reward!!")
	    local bQuery = arg[3] -- 查询或者使用  1为查询  
	    local err = arg[4]     --错误信息号 
	    local number = arg[5] 
	    local mtype = arg[6]  --增值 类型 
	    local stype = arg[7]
	    
	    local config = ZhanZheKaReward[mtype]
		if not config then
			return
		end
		
		if (bQuery == 1) then --如果是查询，就先检查是否使用次数已超过，并判断背包是否已满
      		--动态变量 用于判断输入窗口类型 用于限制每个按钮只能固定输入类型  0则为不受限制 
			local sDvar = Actor.getDyanmicVar(sysarg)
			local getRewardCodeBag = sDvar.getRewardCodeBag
			if getRewardCodeBag ~= nil and getRewardCodeBag ~= 0 and getRewardCodeBag ~= mtype then --增值类型
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00081,ttDialog)
				return
			end	
		end
		
		local storeYearMonth = 0
		
		--判断使用次数
		local useCount = 0
		if config.value > 0 then -- 有次数限制
			local newZengZhiKa = var.newZengZhiKa
			if newZengZhiKa ~= nil then
				local zzkVal = newZengZhiKa[mtype]
				if zzkVal ~= nil then
					useCount = System.getInt64UShort(zzkVal, 0)
					if config.version ~= nil then -- 如果有版号
						local version = System.getInt64UShort(zzkVal, 1) -- 解析为版号
						if config.version > version then
							useCount = 0 -- 重置领取次数
						end
					elseif config.platformList ~= nil then -- 如果有第月可再次领取的平台列表(版号优先)						
						storeYearMonth = System.getInt64UShort(zzkVal, 1) -- 解析为年月，相对于2018年，如2019年2月为(102)
						local zzkYearMonth = GetZhanZheKaYearMonth()
						if zzkYearMonth ~= storeYearMonth then -- 月份改变了							
							
							if type(config.platformList) == "table" then		
								local mySpid = System.getSpid()
								 for _i, _v in ipairs(config.platformList) do
								 	if _v == mySpid then -- 有该平台
								 		useCount = 0 -- 重置领取次数
								 		storeYearMonth = zzkYearMonth
								 		break
								 	end
								end
							else
								if tonumber(config.platformList) == -1 then
									useCount = 0 -- 重置领取次数
									storeYearMonth = zzkYearMonth
								end
							end
						end
					end
					
					if useCount >= config.value then
						Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00063,ttDialog)
						return
					end
				end
			end
		end
		
		--奖励判断
	    local checkResult,needspace = rewardConfigCheck(sysarg,config)   
	    --print("arg[5]:"..arg[5].." "..checkResult.." "..needspace)
	    if ( checkResult ~= 0 ) then
			if ( checkResult == 2 ) then 
				local str = string.format(Lang.ScriptTips.f00016,needspace)
				Actor.sendTipmsg( sysarg, str,ttDialog )
			end
			return
  		end
			
	    if (bQuery == 1) then  --如果是查询，就先检查是否使用次数已超过，并判断背包是否已满			
	  		Actor.userServicesAddCard(sysarg, number)
			Actor.triggerAchieveEvent(sysarg,91,mtype)
	  	else --增值卡奖励，先判断背包是否已满	  					
			
	  		if config.value > 0 then -- 有次数限制
	  			local zzkVal = System.setInt64UShort(0, 0, useCount+1)
	  			if config.version ~= nil then -- 如果有版号
	  				zzkVal = System.setInt64UShort(zzkVal, 1, config.version)
	  			elseif config.platformList ~= nil then -- 如果有第月可再次领取的平台列表(版号优先)	
	  				if storeYearMonth == 0 then
	  					storeYearMonth = GetZhanZheKaYearMonth()	  					
	  				end
	  				zzkVal = System.setInt64UShort(zzkVal, 1, storeYearMonth)
	  			end
	  			
	  			local newZengZhiKa = var.newZengZhiKa
	  			if newZengZhiKa == nil then
	  				var.newZengZhiKa = {}
    				newZengZhiKa = var.newZengZhiKa
	  			end
	  			newZengZhiKa[mtype] = zzkVal	  			
	  		end
	  		
  			doRewardConfig(sysarg,config)
	    	Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00056,ttDialog)
	    	
	    	-- 如果是微信礼包则记录一下日志
	    	if mtype == 19 then
				local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
				System.sendCommonLog(GameLog.cWeixinGift,nActorId,'',0,0,0,'','','','','','','',"OnAsyncOpResultFunc")
			end
		end
	  elseif result == 1 then 
		local err = arg[4]	    
		if err == 1 then 
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00054,ttDialog) 
		elseif err == 2 then 
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00055,ttDialog)
		elseif err == 3 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00055,ttDialog) 
		end
	  elseif result == 2 then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00053,ttDialog)
	  elseif result == 3 then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00057,ttDialog)
	  end
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeAsyncOpResult, EventCallDispatcher.OnAsyncOpResultFunc)