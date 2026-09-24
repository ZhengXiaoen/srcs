-- 单挑BOSS
--#include "data\config\modules\kill_boss_cfg.lua" once

--处理数据
function kill_boss_fuben(sysarg, msgid, packet)
	local nType = DataPack.readByte(packet)
	if nType==0 then 
		sendkill_boss_fubenInfo(sysarg)
	elseif nType==1 then --请求进入副本
		enter_kill_boss_fuben(sysarg, DataPack.readByte(packet))
	elseif nType==2 then --请求退出副本
		Actor.returnCity(sysarg)
	elseif nType==3 then --请求天数
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKillBoss)
		DataPack.writeByte(netPack,3)
		DataPack.writeInt(netPack,GetkillBossOpenDay())
		DataPack.flush(netPack)
	end
end

--请求副本信息
function sendkill_boss_fubenInfo (sysarg)
	--初始化
	local var = Actor.getStaticVar(sysarg)
	--if var.kill_boss_flags==nil then  var.kill_boss_flags =0 end
	if var.kill_boss_flags1==nil then  var.kill_boss_flags1 =0 end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKillBoss)
	DataPack.writeByte(netPack,0)
	--DataPack.writeInt(netPack,var.kill_boss_flags)
	DataPack.writeInt(netPack,var.kill_boss_flags1)
	DataPack.flush(netPack)
end

--请求进入副本
function enter_kill_boss_fuben(sysarg, idx)
	
	--非法进入
	if(GetkillBossOpenDay()>=8) then 
		return 
	end
	idx = tonumber(idx)

	--判断前端传进来的数据是否合法
	if idx > #kill_boss_cfg then
		return
	end
	if idx > 28 then
		return
	end
	
	--判断是否能进入副本
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate ~= nil and var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip)
		return false
	end

	local curFBId = Actor.getFubenId( sysarg )
	if curFBId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00040,ttDialog)
		return false
	end
	
	--检查哪些地图是不能进入个人副本的
	local canEnterFBTable = {119,11,80,81,109,110,111,112,113,114,115,116,117,118,120,121,216,217,218,234,342,340}
	for i=1,#canEnterFBTable do 
		if Actor.getSceneId(sysarg) == canEnterFBTable[i] then
			Actor.sendTipmsg(sysarg,"此地图不能传送进副本",ttFlyTip)
			return 
		end
	end
	

	--检查level是否满足
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<kill_boss_cfg[idx].level then 
		Actor.sendTipmsg(sysarg,"等级不足，无法进入",ttFlyTip)
		return 
	end
	
	--判断是都是第一次
	--local kill_boss_flags = var.kill_boss_flags
	--if kill_boss_flags == nil then kill_boss_flags = 0 end
	--local f = System.getIntBit(kill_boss_flags, idx-1)
	--if f ~= 0 then
	--	Actor.sendTipmsg(sysarg,"不可以重复参加",ttFlyTip)
	--	return
	--end
	
	local kill_boss_flags = var.kill_boss_flags1
	if kill_boss_flags == nil then kill_boss_flags = 0 end
	if kill_boss_flags+1~=idx then 
		Actor.sendTipmsg(sysarg,"请按顺序挑战",ttFlyTip)
		return
	end
	
	
	
	--创建副本
	local cfg = kill_boss_cfg[idx]
	local hfuben = Fuben.createFuBen(cfg.fubenId)
	if hfuben == 0 then
		print("kill_boss_fuben create fuben fail, fubenId="..cfg.fubenId)
		return
	end
	
	--进入副本
	if Actor.enterFuBen(sysarg, hfuben,-1,-1,-1) == false then
		print("kill_boss_fuben enter fuben fail, fubenId="..cfg.fubenId)
		return
	end
	
	Actor.addTimer(sysarg,25,3000)

	local fbptr = Fuben.getFubenPtr(hfuben)
	local leftSecond = Fuben.getFbTime(fbptr)
	
	--告诉前端进入副本
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKillBoss)
	DataPack.writeByte(netPack,1)
	DataPack.writeByte(netPack,idx)   --第几个副本
	DataPack.writeUInt(netPack,leftSecond)	--剩余多少秒
	DataPack.flush(netPack)
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cKillBoss, kill_boss_fuben)