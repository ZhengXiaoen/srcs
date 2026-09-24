--[[File:NetMS.lua]]

--#include "Common.lua" once --通用

-- 魔幻星宫的网络部分



-- 启动祭台
function OnStartRoulette( sysarg, msgid, packet )
	print("OnStartRoulette");
	if CheckActivityCondition(sysarg) ~= true then return end;
	local v = RouletteCfg.RunCon;
	if v and ( Actor.getItemCount(sysarg,v.id,-1,-1) >= v.count) then		
		--if Consumes.CheckAndRemove(sysarg, config.upConsumes, 701, Lang.LogTips.ml00002) ~= true then return end
		Actor.removeItem(sysarg,v.id, v.count, -1,-1,-1,"AskUpTransByItem",5)      --删除一个物品
		local npack = DataPack.allocPacket(sysarg,139,78)  --申请一个数据包
		if (npack == nil) then
			--print("npack:nil")
			return
		end
		local iIdx = System.getRandomNumber(#(RouletteCfg.InnerRing));
		local oIdx = System.getRandomNumber(#(RouletteCfg.OutterRing));
		local i = RouletteCfg.InnerRing[iIdx+1];
		local o = RouletteCfg.OutterRing[oIdx+1];
		DataPack.writeByte(npack, iIdx); -- 内层数据
		DataPack.writeByte(npack, oIdx); -- 外层数据
		--print("iIdx="..iIdx,"oIdx="..oIdx);
		--print("i="..i,"o="..o);
		DataPack.flush(npack);
		--存储数据
		local var = Actor.getDyanmicVar(sysarg);
		var.lunpanData =  {};
		var.lunpanData.i = i;
		var.lunpanData.o = o;
	else
		Actor.sendTipmsg(sysarg, Lang.Activity.a00056f15, ttFlyTip);
	end
end
-- 停止滚动，返回
function OnStopRoulette( sysarg, msgid, packet )
	--print("OnStopRoulette");
	if CheckActivityCondition(sysarg) ~= true then print("OnStopRoulette cond failed") return end;
	-- 服务器存储数据，不要通过网络回传，不然可能被别人伪造包发回来
	-- local i = DataPack.readByte(packet);
	-- local o = DataPack.readByte(packet);
	local var = Actor.getDyanmicVar(sysarg);
	if not var.lunpanData or not var.lunpanData.i or not var.lunpanData.o then return end;
	local i =	var.lunpanData.i;
	local o =	var.lunpanData.o;
		
	local targetL = i-o; -- 目标层数
	local thisFloor = FloorConfig[i];
	local targetFloor = FloorConfig[targetL];
	if (not thisFloor) or (not targetFloor) then
		System.trace("Can't find thisFloor floor config or targetFloor floor config!");
		return
	end
	-- 全部退
	local playerList = LuaHelp.getSceneActorListById(thisFloor.sid)  --获取某场景玩家对象列表
	if playerList then
		for _, p in pairs(playerList or {})do
			if Actor.enterScene(p, targetFloor.sid, unpack(targetFloor.range)) == true then
				Actor.changeActivityProgress(p, targetL, -2);			
			end
		end
	end
	System.broadcastTipmsg(string.format(Lang.Activity.a00056f4, Actor.getName(sysarg), i, o), ttScreenCenter+ttChatWindow);
	var.lunpanData = {};
end

MiscsImplement.registerMsgHandler(78, OnStartRoulette); -- 注册协议处理函数
MiscsImplement.registerMsgHandler(79, OnStopRoulette); -- 注册协议处理函数
