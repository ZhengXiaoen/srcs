--#include "data\config\misc\scriptTimerConfig\activityTips.lua" once 


--config:活动配置 参照activityTips的ID来填
--Tipstr,活动开启字符串
function StrTipsFunc(strName,Tipstr,ActivityId)
	
	if not activityTips[ActivityId] then return end
	--发送客户端请求打开弹窗
	local npack = DataPack.allocPacketEx()
	if (npack ~= nil) then
		DataPack.writeByte(npack, 139)
		DataPack.writeByte(npack, 39) -- sSendActivityDialog
		--print("config.name"..strName)
		DataPack.writeString(npack,strName)
		DataPack.writeString(npack,Tipstr)
		DataPack.writeByte(npack,ActivityId)
		Actor.worldBroadCastMsg(npack, activityTips[ActivityId].level)
		DataPack.freePacketEx(npack)
	end
end


--活动开启提示公告函数
--configId 配置的ID
--index    活动的第几场，0表示第1场，1表示第2场
function OnActivityTipsFunc(configId,index)
	if not configId then return end

	local configId = tonumber(configId)
	if index == nil then
		index =0
	end
	if(configId <1 or configId > table.getn(activityTips) ) then
		return
	end
	
--[[	local config = activityTips[configId]
	local limitTime = config.moveLimit
	if not limitTime or limitTime == 0 then
		limitTime = 0
	else
		local curTime = System.getCurrMiniTime()
		limitTime = curTime + limitTime
	end--]]
	
	--如果没有开启跨服并且配置了需要跨服，则不提示
	if(--[[config.crossServer ==1 and --]]System.isStartCommonServer()==false) then return end
	--发送客户端请求打开弹窗
	local npack = DataPack.allocPacketEx()
	if (npack ~= nil) then
		DataPack.writeByte(npack, 139)
		DataPack.writeByte(npack, 39)
		DataPack.writeString(npack, config.name)  --活动开启提示公告表ID
		DataPack.writeWord(npack, "")  --停留时间
		DataPack.writeByte(npack, index)
		--DataPack.writeUInt(npack, limitTime)
		Actor.battleGroupBroadCastMsgCs(npack, config.level)
		DataPack.freePacketEx(npack)
	end	
	return true;
end


--活动开启提示公告函数（跨服版） 需放到--跨服服务器配置下
--configId 配置的ID
--index    活动的第几场，0表示第1场，1表示第2场   101 表示跨服的
function OnActivityTipsFuncCs(configId,index)
	if not configId then return end
	local configId = tonumber(configId)
	if index == nil then
		index =0
	end
	if(configId <1 or configId > table.getn(activityTips) ) then
		return
	end
	local config = activityTips[configId]
	local limitTime = config.moveLimit
	if not limitTime or limitTime == 0 then
		limitTime = 0
	else
		local curTime = System.getCurrMiniTime()
		limitTime = curTime + limitTime
	end	
	
	--发送客户端请求打开弹窗
	local npack = DataPack.allocPacketEx()
	if (npack ~= nil) then
		DataPack.writeByte(npack, 139)
		DataPack.writeByte(npack, 39)
		DataPack.writeString(npack, config.name)  --活动开启提示公告表ID
		DataPack.writeWord(npack, config.delay)  --停留时间
		DataPack.writeByte(npack, index)
		DataPack.writeUInt(npack, limitTime)
		Actor.battleGroupBroadCastMsgCs(npack, config.level)
		DataPack.freePacketEx(npack)
	end	
end

function OnOpenServerOneDay()
	
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay ~= 1 then
		return 
	end
	
	local nNoticeList = 
	{	
		"只需提取<(c0xFFFF0000)[1000元宝]>,即可成为本服的VIP,享受VIP<(c0xFFFF0000)超级功能>和<(c0xFFFF0000)属性加成>!",
		"探索宝藏可获得高级装备、大额经验、特殊装备,免费赠送宝藏积分<(c0xFFFF0000)(可兑换装备和各种材料)>!",
		"<(c0xFFFF0000)[神炉]>面板处可升级各种超强属性的<(c0xFFFF0000)特殊装备>!",
		"<(c0xFFFF0000)[VIP]>可享受超强特权并且能获得神力BUFF,详情请点击左上角VIP按钮!",
		"<(c0xFFFF0000)[VIP专属BOSS之家]>爆率超高,可爆出高级装备和稀有道具!",
		"点击键盘<(c0xFFFF0000)[S]键>可随时选中所要攻击的敌人,使PK方便快捷.",
		"各种升级材料,在<(c0xFFFF0000)材料副本>均可获得.",
	}
	
	local nNoticeId = math.random(1,table.getn(nNoticeList))
	System.broadcastTipmsg(nNoticeList[nNoticeId],128+2)
end

function OnEveryDayBulletin()
	
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay == 1 then
		return 
	end
	
	local nNoticeList = 
	{	
		"新服开区第四天晚上20-21点,统一举行攻城活动,所有帮派无需申请均可参加,奖励相当丰厚,详情请点击右上角<(c0xFFFF0000)[王城争霸]>按钮!",
		"只需提取<(c0xFFFF0000)[1000元宝]>,即可成为本服的VIP,享受VIP<(c0xFFFF0000)超级功能>和<(c0xFFFF0000)属性加成>!",
		"探索宝藏可获得高级装备、大额经验、特殊装备,免费赠送宝藏积分<(c0xFFFF0000)(可兑换装备和各种材料)>!",
		"<(c0xFFFF0000)[神炉]>面板处可升级各种超强属性的<(c0xFFFF0000)特殊装备>!",
		"<(c0xFFFF0000)[VIP专属BOSS之家]>爆率超高,可爆出高级装备和稀有道具!",
		"点击键盘<(c0xFFFF0000)[S]键>可随时选中所要攻击的敌人,使PK方便快捷.",
		"各种升级材料,在<(c0xFFFF0000)材料副本>均可获得.",
	}
	
	local nNoticeId = math.random(1,table.getn(nNoticeList))
	System.broadcastTipmsg(nNoticeList[nNoticeId],128+2)	
end