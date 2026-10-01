--#include "data\config\vocation\VocationConfig.lua" once



--主线任务单击npc初始化
MasterStokeInit = function(sysarg,npc_id)

	local echo = ""
	local actormapid = Actor.getSceneId(sysarg);
    local tvar = get_taskflags_val(sysarg);
    local ta = task_all[tvar];
    if ta == nil then 
        --print("找不到任务:"..tvar)
        return echo 
    end --没有任务了
	
	local cond=false 
	if ta.mapid == 1 then 
		for _,v in ipairs(ActorInitConfig.nCreateInitFb[1].createPos) do 
			if v.nScenceID == actormapid then 
				cond = true
			end
		end
	end
	
    if (actormapid == ta.mapid or cond==true) and ta.npcid == npc_id then
		local talk = ta.talk;
		local jiangli = "";
		for i = 1,#ta.additem do
			local aid = ta.additem[i].id;
			local anum = ta.additem[i].num;
			local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX);
			local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);

			if ta.additem[i].sex or ta.additem[i].job then
				if (ta.additem[i].sex==nil or ta.additem[i].sex == nSex) and (ta.additem[i].job==nil or ta.additem[i].job == njob) then
					jiangli = jiangli .. string.format("    <(iitem#%s#%s#)> %s x%s\\",aid,anum,Item.getItemLinkMsg(aid),anum);					
				end
			else
				if ta.additem[i].id == -1 then
					jiangli = jiangli .. string.format("    <(iaward#5#1)> <(c0xFFfff000)绑定金币> x%s\\",anum);
				elseif ta.additem[i].id == -2 then
					jiangli = jiangli .. string.format("    <(iaward#2#1)> <(c0xFF00cb52)升级经验 +%s>\\",anum);
				elseif ta.additem[i].id == -3 then 
					jiangli = jiangli .. string.format("    <(iaward#34#1)> <(c0xFF00cb52)能量点 +%s>\\",anum);
				else	
					jiangli = jiangli .. string.format("    <(iitem#%s#%s#)> %s x%s\\",aid,anum,Item.getItemLinkMsg(aid),anum);
				end
			end
		end

		local str= ""
		if ta.type == 1 then
            str = "接受任务";
		else
            str = "完成任务";
		end
		Quest_ShuaXin(sysarg); --刷新任务
        echo = "\\    ...";
		echo = string.format([[

  <(inpcTalkImg#4#70#20)>
<(idecoLine#330)>
    <(c0xFFcec099)%s>\\
  <(inpcTalkImg#3#70#20)>
<(idecoLine#330)>
%s\\
<#BN%s/@onAcceptTask>
]], talk, jiangli, str);

		Actor.openarrowsguide(sysarg, 1005, 247, 442, 1);
    end
	return echo;

end


--主线任务接受或者完成
MasterStokeAcceptTask = function(sysarg,npcid)
    if System.isCrossServer() == true then return end
    local actormapid = Actor.getSceneId(sysarg);
	local tvar = get_taskflags_val(sysarg);
    local ta = task_all[tvar];
    if ta == nil then 
         --print("找不到任务:"..tvar)
        return 
    end--没有任务了
	-- NPC 的旧对话或自动提交不能完成其他 NPC 的主线。
	if ta.npcid ~= npcid or Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL) < ta.lv then
		return
	end
	
	local cond=false 
	if ta.mapid == 1 then 
		for _,v in ipairs(ActorInitConfig.nCreateInitFb[1].createPos) do 
			if v.nScenceID == actormapid then 
				cond = true
			end
		end
	end
	
	-- 传送引导在到达目标地图后由 14 号定时器提交。
	if ta.type == 4 and (tvar == 30 or tvar == 49 or tvar == 72) then
		local dvar = Actor.getDyanmicVar(sysarg)
		local nextTask = task_all[ta.nvar]
		if dvar.nowNumberOfStep == 2 and nextTask ~= nil and actormapid == nextTask.mapid then
			cond = true
		end
	end

	if (actormapid == ta.mapid or cond==true) and (ta.type == 2 or ta.type == 4 or ta.type == 1) then
		local nItemId = 0;
		local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX);
		local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
		if ta.additem then
			
			local count = 0
			for i = 1,#ta.additem do --计算格子数够不够
				local aid = ta.additem[i].id
			    local anum = ta.additem[i].num
				if aid ~= -1 and aid ~= -2 and aid ~= -3 then
					if (ta.additem[i].sex == nil or ta.additem[i].sex == nSex) and (ta.additem[i].job == nil or ta.additem[i].job == njob) then
						count = count + Item.getAddItemNeedGridCount( sysarg,aid,anum)
					end
				end
			end
			local bagIdxs = Item.getBagEmptyGridCount( sysarg )
			
			if bagIdxs < count then 
				Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
				return 
			end
			
		    for i = 1,#ta.additem do
			    local aid = ta.additem[i].id;
			    local anum = ta.additem[i].num;
			    if aid == -1 then
			    	Actor.changeMoney(sysarg, 0, anum,114,"主线任务奖励金钱");
				elseif aid == -2 then
					Actor.addExp(sysarg,anum)
				elseif aid == -3 then
					add_d_val(sysarg,9,anum)
					Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s(%s)能量>",anum,get_d_val(sysarg,9)),1)
			    else
				    if (ta.additem[i].sex and ta.additem[i].sex ~= -1) or (ta.additem[i].job and ta.additem[i].job ~= -1 )then
					    if (ta.additem[i].sex==nil or ta.additem[i].sex == nSex) and (ta.additem[i].job==nil or ta.additem[i].job == njob) then
						    Actor.addItem(sysarg,aid,0,0,anum,1,0,"taskaward",GameLog.clQuestGiveItem);
					    end
				    elseif ta.additem[i].use == 1 then
						  local pItem = Item.createItem(aid,anum,0,0,1);
						  Item.addItem(sysarg,pItem);
						  Actor.useItem(sysarg,pItem);
					else
						  Actor.addItem(sysarg,aid,0,0,anum,1,0,"taskaward",GameLog.clQuestGiveItem);
				    end
				end
		    end
			
			--for i=1, #ta.recoverItem do 
			--	local dItem = ta.recoverItem[i].item;
			--    local dIount = ta.recoverItem[i].count;
			--	
			--	local bindCount   = Actor.getItemCount(sysarg,dItem,0,-1,1,-1, nil, true);  --绑定的数量
			--	local noBindCount = Actor.getItemCount(sysarg,dItem,0,-1,0,-1, nil, true);  --不绑定的数量
			--	if bindCount+noBindCount >= dIount then 
			--		if ta.recoverItem[i].Id ==-1 then 
			--			Actor.changeMoney(sysarg, 0, ta.recoverItem[i].num);
			--		elseif ta.recoverItem[i].Id == -2 then 
			--			Actor.addExp(sysarg,ta.recoverItem[i].num)
			--		end
			--		Actor.removeItem(sysarg,dItem,dIount,-1,-1,-1)
			--	end
			--end

				set_taskflags_val(sysarg, ta.nvar);

						
			
			--设置npc的状态（没有任务）
			local netPack = DataPack.allocPacket(sysarg, 0, 33)
			if ta.mapid == 1 then 
				DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(actormapid,ta.npcid)))
			else 
				DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(ta.mapid,ta.npcid)))
			end
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			
			--print(tvar,ta.type,ta.mid,ta.nexmapid)
			--不同场景
			local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
			
			if ta.mid and ta.mid ~= ta.mapid and ta.mid ~= 0 then
				if ta.type == 1 then
					local Hfuben = Fuben.createFuBen(ta.mid)  --1:表示副本ID
					if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return false end  --从NPC那将玩家传进副本
					--Actor.openguajiGuide(sysarg, 1);
					Actor.addTimer(sysarg, 14, 2*1000)
				else
					System.telportScene(sysarg, ta.mid, ta.mx, ta.my);
					
					Actor.addTimer(sysarg, 14, 2*1000);

				end
			else
				--同一场景
                --开始执行下一个任务动作
                 ta = task_all[ta.nvar];
                if ta ~= nil then
                    if ta.type == 2 or ta.type == 4 or ta.type ==1 then
						if level>ta.lv then 
							if ta.mapid == 1 then 
								--print("Npc:自动寻路")
								Actor.autoFindPathToNpc( sysarg, actormapid, ta.npcname)
							else 
								--print("Npc:自动寻路2")
								if get_taskflags_val(sysarg)~=83 then --特殊处理，这个是打开面板
									Actor.autoFindPathToNpc( sysarg, ta.mapid, ta.npcname)
								end
							end
							
						end
                    elseif ta.type == 3 and get_taskflags_val(sysarg)~=85 and get_taskflags_val(sysarg)~=91 and  get_taskflags_val(sysarg)~= 95 then
                    	--print(ta.type, ta.mapid , ta.mx , ta.my , ta.monid)
	                   
						if ta.mapid == 1 then 
							Actor.autoFindPathToKillMonster(sysarg, actormapid , ta.mx , ta.my , ta.monid)
						else 
							Actor.autoFindPathToKillMonster(sysarg, ta.mapid , ta.mx , ta.my , ta.monid)
						end
					end
                end
			end
			Actor.closeNPCDialog(sysarg);
			Actor.addEffect(sysarg,161,6,500,0);
			Quest_ShuaXin(sysarg)
			return;
		end
	end
end



