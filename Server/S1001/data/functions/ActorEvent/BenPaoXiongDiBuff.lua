--加buff功能(奔跑兄弟)
function BenPaoBaXiongDiBuff(sysarg, sysid, packet)
	
	if sysid ~= LogicCmd.miscSys.sub.cBPbuff then
		return
	end

	local msgid = DataPack.readByte(packet)
	
	local dVar = System.getDyanmicVar()
	if dVar.bpbxdTime ==nil then 
		return 
	end
	--在有在奔跑兄弟时间内使用
	if  msgid == 1 then  --加速buff
		BPAddBuff1(sysarg)
	elseif msgid == 2 then --减速buff
		BPAddBuff2(sysarg)
	elseif msgid == 3 then --消除减速buff
		BPDelBuff(sysarg)
	end
end

function BPAddBuff1(sysarg)
	if Actor.hasBuffById(sysarg,200) then 
		Actor.sendTipmsg(sysarg, string.format("您已经存在加速buff"), ttFlyTip)
		return 
	end
		
	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.bpAB1~=nil and sVar.days.bpAB1<3 then 
		Actor.addBuffById(sysarg, 200)
		Actor.sendTipmsg(sysarg, string.format("使用加速buff"), ttFlyTip)
		sVar.days.bpAB1=sVar.days.bpAB1+1
		SendMsgs(sysarg,1)
	else 	
		if Actor.changeMoney(sysarg,3,-50,2643, "benpaobuff")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法使用buff", ttFlyTip)
			return 
		else 
			Actor.addBuffById(sysarg, 200)
			Actor.sendTipmsg(sysarg, string.format("使用加速buff"), ttFlyTip)
		end
		--Actor.sendTipmsg(sysarg, string.format("超出使用次数"), ttFlyTip)
	end
end
function BPAddBuff2(sysarg)
	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.bpAB2~=nil and sVar.days.bpAB2<3 then 
		local entitylist = LuaHelp.getNearEntityList(sysarg,10)
		for _,v in pairs(entitylist) do 
			if v~=nil and v~=sysarg then 
				if (Actor.hasBuffById(sysarg,201))==false then --已经中了一次，不种第二次/有免疫buff
					Actor.addBuffById(v, 201)
					Actor.sendTipmsg(v, string.format("您已中减速buff"), ttFlyTip)
				end
				
			end
		end
		sVar.days.bpAB2=sVar.days.bpAB2+1
		SendMsgs(sysarg,2)
		Actor.sendTipmsg(sysarg, string.format("使用减速buff"), ttFlyTip)
	else 
		if Actor.changeMoney(sysarg,3,-50,2643, "benpaobuff")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法使用buff", ttFlyTip)
			return 
		else 
			local entitylist = LuaHelp.getNearEntityList(sysarg,10)
			for _,v in pairs(entitylist) do 
				if v~=nil and v~=sysarg then 
					if (Actor.hasBuffById(sysarg,201))==false then --已经中了一次，不种第二次/有免疫buff
						Actor.addBuffById(v, 201)
						Actor.sendTipmsg(v, string.format("您已中减速buff"), ttFlyTip)
					end
					
				end
			end
			Actor.sendTipmsg(sysarg, string.format("使用减速buff"), ttFlyTip)
		end
		--Actor.sendTipmsg(sysarg, string.format("超出使用次数"), ttFlyTip)
	end
end
function BPDelBuff(sysarg)
	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.bpAB3~=nil and sVar.days.bpAB3<3 then 
		if Actor.hasBuffById(sysarg,201) then 
			Actor.delBuffById(sysarg,201)
			Actor.sendTipmsg(sysarg, string.format("您身上的减速buff已经消除，是否觉得身轻如燕"), ttFlyTip)
			sVar.days.bpAB3=sVar.days.bpAB3+1
			SendMsgs(sysarg,3)
		else 
			Actor.sendTipmsg(sysarg, string.format("您不存在减速buff,不用消除"), ttFlyTip)
			return
		end
	else 
		if Actor.hasBuffById(sysarg,201) then 
			if Actor.changeMoney(sysarg,3,-50,2643, "benpaobuff")==false then 
				Actor.sendTipmsg(sysarg, "元宝不足，无法使用buff", ttFlyTip)
				return 
			else 
				Actor.delBuffById(sysarg,201)
				Actor.sendTipmsg(sysarg, string.format("您身上的减速buff已经消除，是否觉得身轻如燕"), ttFlyTip)
			end
		else 
			Actor.sendTipmsg(sysarg, string.format("您不存在减速buff,不用消除"), ttFlyTip)
		end
		--Actor.sendTipmsg(sysarg, string.format("超出使用次数"), ttFlyTip)
	end
end

function SendMsgs(sysarg,index)
	index = tonumber(index)
	local sVar=Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, 210)
	DataPack.writeByte(netPack, index) 
	local tosend =nil 
	if index ==1 then 
		DataPack.writeByte(netPack, sVar.days.bpAB1) 
	elseif index ==2 then 
		DataPack.writeByte(netPack, sVar.days.bpAB2) 
	elseif index ==3 then 
		DataPack.writeByte(netPack, sVar.days.bpAB3) 
	end
	DataPack.flush(netPack)
end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBPbuff, BenPaoBaXiongDiBuff)