--加buff功能(奔跑兄弟)
function DuoBaoQiBinBuff(sysarg, sysid, packet)
	
	local msgid = DataPack.readByte(packet)
	
	local dVar = System.getDyanmicVar()
	if dVar.duobaoqibingTime ==nil then 
		return 
	end

	--在有在奔跑兄弟时间内使用
	if  msgid == 1 then  --随机传送
		DBQBSuiJiChuanSong(sysarg)
	elseif msgid == 2 then --减速buff
		DBQBAddBuff2(sysarg)
	end
end

function DBQBSuiJiChuanSong(sysarg)
	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.DBQBAB1~=nil and sVar.days.DBQBAB1<3 then 
		
		sVar.days.DBQBAB1=sVar.days.DBQBAB1+1
		SendMsg(sysarg,1)
		Actor.sendTipmsg(sysarg, string.format("随机传送成功"), ttFlyTip)
		
		local mapid =234
		local map_name = Fuben.getSceneNameById(mapid);	--根据地图ID取地图名字
		
		--随机传送		
		local h=0
		local w=0
		local times=0
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapid,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times < 10000 then 
			System.telportScene(sysarg,	mapid, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,map_name)
		end
		
	else 
		if Actor.changeMoney(sysarg,3,-50,2644, "duobaoqibinbuff")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法使用buff", ttFlyTip)
			return 
		else 
			Actor.sendTipmsg(sysarg, string.format("随机传送成功"), ttFlyTip)
		end
		
		local mapid =234
		local map_name = Fuben.getSceneNameById(mapid);	--根据地图ID取地图名字
		
		--随机传送		
		local h=0
		local w=0
		local times=0
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapid,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times < 10000 then 
			System.telportScene(sysarg,	mapid, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,map_name)
		end
	end
end

function DBQBAddBuff2(sysarg)
	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.DBQBAB2~=nil and sVar.days.DBQBAB2<3 then 
		local entitylist = LuaHelp.getNearEntityList(sysarg,10)
        local bFindActor = false
        if Actor.hasTopTitle(sysarg,25) == true then
            bFindActor = true
            for _,v in pairs(entitylist) do 
			    if v~=nil and v~=sysarg then 
                    if (Actor.hasBuffById(sysarg,201))==false then --已经中了一次，不种第二次/有免疫buff
                        Actor.addBuffById(v, 201)
                        Actor.sendTipmsg(v, string.format("您已中减速buff"), ttFlyTip)
                    end
                end

            end
        else
            for _,v in pairs(entitylist) do 
			    if v~=nil and v~=sysarg then 
				    if (Actor.hasBuffById(sysarg,201))==false then --已经中了一次，不种第二次/有免疫buff
                        if   Actor.hasTopTitle(v,25) == true then --是持宝人的情况下才减速
                            Actor.addBuffById(v, 201)
					        Actor.sendTipmsg(v, string.format("您已中减速buff"), ttFlyTip)
                            bFindActor = true
                            break
                        end
					
				    end
				
			    end
		    end
        end
		
        if bFindActor == false then
            Actor.sendTipmsg(sysarg, string.format("周围没有持宝人，无法使用！"), ttFlyTip)
            return
        end
		sVar.days.DBQBAB2=sVar.days.DBQBAB2+1
		SendMsg(sysarg,2)
		Actor.sendTipmsg(sysarg, string.format("使用减速buff"), ttFlyTip)
	else 
		if Actor.changeMoney(sysarg,3,-50,2644, "duobaoqibinbuff")==false then 
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


function SendMsg(sysarg,index)
	index = tonumber(index)
	local sVar=Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, 219)
	DataPack.writeByte(netPack, index) 
	local tosend =nil 
	if index ==1 then 
		DataPack.writeByte(netPack, sVar.days.DBQBAB1) 
	elseif index ==2 then 
		DataPack.writeByte(netPack, sVar.days.DBQBAB2) 
	end
	DataPack.flush(netPack)
end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cDBQBbuff, DuoBaoQiBinBuff)