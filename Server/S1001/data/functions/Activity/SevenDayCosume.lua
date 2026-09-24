--#include "data\config\activity\SevenDayCosumeCfg.lua" once

SevenDayCosumes = function( sysarg, msgid, packet )
	----前7天
	--local openServerDay = System.getDaysSinceOpenServer()
	--if openServerDay<1 or openServerDay>7 then 
	--	return 
	--end
	--
	--local nType = DataPack.readByte(packet)
	--if	nType== 0 then --获得信息
	--	SendSevenDayCosumesInfo(sysarg)
	--	SendSevenDayCosumesMoney(sysarg)
	--elseif nType== 1 then 
	--	GetSevenDayCosumesAward(sysarg,DataPack.readByte(packet))
	--end
end

--发送信息
SendSevenDayCosumesInfo  = function(sysarg)

	--local openServerDay = System.getDaysSinceOpenServer()
	--if openServerDay<1 or openServerDay>7 then 
	--	return 
	--end
	--
	--local var = Actor.getStaticVar(sysarg)
	--local svar = System.getStaticVar()
	----初始化
	--if var.days.senveDcosume==nil then  var.days.senveDcosume=0 end --每日消费
	--if var.days.senveDcosumeFlag==nil then  var.days.senveDcosumeFlag={} end --每日是否领取
	--if svar.senveDcosumequota==nil then svar.senveDcosumequota={} end	
	--if svar.senveDcosumequota[openServerDay]==nil then svar.senveDcosumequota[openServerDay]={} end --剩下多少个
	--
	--local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.s7dCosume)
	--DataPack.writeByte(netPack,0)	--总信息
	--
	--for i=1,#SevenDayCosumeCfg[openServerDay].list do
	--	--每档每日是否领取过
	--	if var.days.senveDcosumeFlag[i]==nil then var.days.senveDcosumeFlag[i]=0 end
	--	DataPack.writeByte(netPack,var.days.senveDcosumeFlag[i])
	--	--每档每日已经领取了几个
	--	if svar.senveDcosumequota[openServerDay][i]==nil then svar.senveDcosumequota[openServerDay][i] =0 end
	--	DataPack.writeInt(netPack,svar.senveDcosumequota[openServerDay][i])
	--end
	--DataPack.flush(netPack)
end

--消费金额
SendSevenDayCosumesMoney = function(sysarg)
	----今天消费多少
	--local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.s7dCosume)
	--DataPack.writeByte(netPack,1)	--消费金额
	--DataPack.writeUInt(netPack,var.days.senveDcosume)	--每日消费金额
	--DataPack.flush(netPack)
end

--领取7日奖励
GetSevenDayCosumesAward = function(sysarg,index)
	
	--local var = Actor.getStaticVar(sysarg)
	--local svar = System.getStaticVar()
	--local openServerDay = System.getDaysSinceOpenServer()
	--
	--if openServerDay<1 or openServerDay>7 then 
	--	return 
	--end
	--
	----初始化
	--if var.days.senveDcosume==nil then  var.days.senveDcosume=0 end
	--if var.days.senveDcosumeFlag==nil then  var.days.senveDcosumeFlag={} end
	--if svar.senveDcosumequota==nil then svar.senveDcosumequota={} end
	--if svar.senveDcosumequota[openServerDay]==nil then svar.senveDcosumequota[openServerDay]={} end
	--
	----判断index是否合理
	--if index<1 or index >#SevenDayCosumeCfg[openServerDay].list then --非法上传数据
	--	return 
	--end
	--
	----领取条件是否满足
	--if var.days.senveDcosume<#SevenDayCosumeCfg[openServerDay].list[index].conditions then 
	--	Actor.sendTipmsg(sysarg,"未达到领取条件",ttFlyTip)
	--	return
	--end
    --
	--
	----还有没有得领取
	--if svar.senveDcosumequota[openServerDay][index]==nil then svar.senveDcosumequota[openServerDay][index]=0 end
	--if svar.senveDcosumequota[openServerDay][index]>=#SevenDayCosumeCfg[openServerDay].list[index].quota then 
	--	Actor.sendTipmsg(sysarg,"今天的次数已经领取完成",ttFlyTip)
	--	return 
	--end
	--
	----自己是否已经领取过
	--if var.days.senveDcosumeFlag[index]==nil then var.days.senveDcosumeFlag[index]=0 end
	--if var.days.senveDcosumeFlag[index]~=0 then 
	--	Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
	--	return 
	--end
	--
	----判断格子是否足够
	--if not Awards.CheckBagGridCount(sysarg,SevenDayCosumeCfg[openServerDay].list[index].award) then
	--	return 
	--end
	--
	----给物品
	--Awards.Give(sysarg,SevenDayCosumeCfg[openServerDay].list[index].award,GameLog.cOpenServerAward,"开服活动7日消费奖励")
	--
	----记录
	--var.days.senveDcosumeFlag[index]=1
	--svar.senveDcosumequota[openServerDay][index] = svar.senveDcosumequota[openServerDay][index] + 1
	--
	----发消息通知前端
	--SendSevenDayCosumesInfo(sysarg)
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.c7dCosume, SevenDayCosumes)