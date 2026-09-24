
--#include "..\Interactive\Interact.lua" once
--#include "data\functions\Systems\MarrySystem\MarryKiss.lua" once

MiscsImplement.SpecialInteract = function( sysarg, msgid, packet )
		local type = DataPack.readByte(packet)
		local name = DataPack.readString(packet)
	
	InitInteractDatas(sysarg)
	
	if type == 1 then
		--DeliverSoap(sysarg, name)
		Fondle(sysarg, name)
	elseif type == 2 then
		--RubBack(sysarg, name)
		Chirismus(sysarg, name)
	elseif type == 3 then
		Massage(sysarg, name)
	elseif type == 4 then
		InviteKiss(sysarg,name)
	elseif type == 5 then		--邀请陆地亲吻
		InviteKissOnLand(sysarg,name)
	end
	
end

--2013-05-16
--自动接收互动
MiscsImplement.AutoAcceptAction =  function( sysarg, msgid, packet )
	local flag = DataPack.readByte(packet)
	local svar = Actor.getStaticVar(sysarg)
	if flag == 1 then
		svar.autoAcceptSpringAction = 1
	else
		svar.autoAcceptSpringAction = 0
	end	
	--SendAutoAcceptFlag(sysarg)
end


--注册Misc子系统的64、76号消息与相关方法的关系，以准备响应客户端请求
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSpecialSpringAction, MiscsImplement.SpecialInteract)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cAutoAcceptSpringAction, MiscsImplement.AutoAcceptAction)
