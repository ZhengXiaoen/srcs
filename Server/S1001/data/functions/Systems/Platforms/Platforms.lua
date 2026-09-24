
--#include "data\functions\Systems\Platforms\PlatformDef.lua" once --平台定义

--子消息号的用的表
PlatformImplement = 
{
} 

PlatformImplement.main = function (sysarg, platformId, msgid, packet)
	local platformFuncs = PlatformImplement[platformId]
	if platformFuncs == nil then return end
	
	local func = platformFuncs[msgid]
	if func == nil then return end
	
	func(sysarg, platformId, msgid, packet)
end    

--平台系统消息处理函数，函数的形式为function (sysarg, msgid, packet)
PlatformImplement.registerMsgHandler = function (platformId, msgid, proc)
  if PlatformImplement[platformId] == nil then
  	PlatformImplement[platformId] = {}
  end
  
  if PlatformImplement[platformId][msgid] == nil then
  	PlatformImplement[platformId][msgid] = proc
  	return true
  end
    
  return false
end

--取消已注册的子系统消息处理函数
PlatformImplement.unregisterMsgHandler = function (platformId, msgid, proc)
	if PlatformImplement[platformId] == nil then return false end
	
	if PlatformImplement[platformId][msgid] == proc then
		PlatformImplement[platformId][msgid] = nil
		return true
	else
		return false
	end
end     


function AllocPlatformPacket(sysarg,  platformId,msgid)
	if platformId == nil then
		platformId = System.getSpid()
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPlatformCmd)
	DataPack.writeByte(netPack, platformId)
	DataPack.writeByte(netPack, msgid)
	--print("AllocPlatformPacket:"..platformId.."msgid:"..msgid)
	return netPack
end

--每日平台数据清理
function PlatformEveryDayClear(sysarg, var)
	--根据游戏处理
	if System.getSpid() == TencentBZZR_PlatformIDs._Tencent then		--腾讯霸者之刃2
		TencentVIPEveryDayClear(sysarg, var)
	end
end

function Platform_OnPlayerLogin(sysarg, isCrossDay, var)
	
	--根据游戏处理
	if System.getSpid() == TencentBZZR_PlatformIDs._Tencent then		--腾讯霸者之刃2
		Tencent_OnPlayerLogin(sysarg, isCrossDay, var)
	end
end

--平台消息处理
MiscsImplement.PlatformCmdHandle = function( sysarg, msgid, packet )

	local platformId = DataPack.readByte(packet)
	local msgid = DataPack.readByte(packet)
	--print("--------------platformId="..platformId..",msgid="..msgid)
	
	local spid = System.getSpid()
	if spid ~= platformId then
		print("[ERR] server platformId="..spid..",client platformId="..platformId..",msgid="..msgid)
		return
	end
	
	PlatformImplement.main(sysarg, platformId, msgid, packet)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cPlatformCmd, MiscsImplement.PlatformCmdHandle)


--平台
--#include "data\functions\Systems\Platforms\DaBaiTuPlatform.lua" once --大白兔平台
    --#include "data\functions\Systems\Platforms\XYPlatform.lua" once --XY平台
    --#include "data\functions\Systems\Platforms\360Platform.lua" once --360平台
--#include "data\functions\Systems\Platforms\TencentPlatform.lua" once --腾讯平台
    --#include "data\functions\Systems\Platforms\TencentInvitationFriend.lua" once --腾讯平台
