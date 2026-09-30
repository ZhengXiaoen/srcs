--7天活动
--1前端请求消息
--2前端领取奖励
--#include "data\config\activity\SevenDaysActivitycfg.lua" once
function handleSevenDaysActivityOpt(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cSevenDaysActivityOpt then
		return false;
	end
	
	local nIndx = tonumber(DataPack.readByte(packet));--操作类型
	if not nIndx then
		return false
	end
	if nIndx == 1 then 
		GetThe7DayData(sysarg)
	elseif nIndx == 2 then 
		local nIndx2 = DataPack.readByte(packet)
		if nIndx2 ==nil then 
			return false
		end
		GetThe7DayAwards(sysarg,nIndx2)
	end
	
end



function GetThe7DayData(sysarg)

	local var = sevenDaysActivity_WhenLogin(sysarg)
	local sevenDActivity = var.sevenDActivity
	local sevenDActivityData = var.sevenDActivityData
	
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSevenDaysActivityResut);
	if sevenDActivity ~=nil and sevenDActivity>=1 then 
		DataPack.writeByte(netPack,sevenDActivity)--当前第几天登录
	else 
		DataPack.writeByte(netPack,1)
	end
	if sevenDActivityData ~=nil and sevenDActivityData~=0 then 
		DataPack.writeInt(netPack,sevenDActivityData)--领奖信息
	else 
		DataPack.writeInt(netPack,0)
	end
	DataPack.flush(netPack);
end

function GetThe7DayAwards(sysarg,n)
	local index = tonumber(n)
	if not index or index ~= math.floor(index) or index<1 or index>7 then
		return 
	end
	local var = sevenDaysActivity_WhenLogin(sysarg)
	if index>var.sevenDActivity then
		Actor.sendTipmsg(sysarg, "还没到天数领取奖励", ttFlyTip);
		return 
	end
	if var.sevenDActivityData == nil then 
		var.sevenDActivityData = 0 
	end
	if System.getIntBit(var.sevenDActivityData,index-1) == 1 then
		Actor.sendTipmsg(sysarg, "已经领取了奖励，不能再领", ttFlyTip);
		return 
	end
	
	--给奖励

	if Awards.Give(sysarg,Award[index],998,"领取登录7天奖励") ~= true then
		return 
	end
	
	-- 记录日志
	--local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	--System.sendCommonLog(GameLog.cGetSevenDayLogin,nActorId,'',config.id,0,0,'','','','','','','',"Get Seven Day LoginAward")
		
	--Actor.sendTipmsg(sysarg,"得到奖励",ttFlyTip)
	var.sevenDActivityData=System.setIntBit(var.sevenDActivityData,index-1,1)
	GetThe7DayData(sysarg)
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf194,ttFlyTip)

	
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSevenDaysActivityOpt, handleSevenDaysActivityOpt);