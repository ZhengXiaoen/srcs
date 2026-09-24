
local t = {

	data = {
		sceneId ={[1]=98,[2]=99,[3]=100,[4]=101,[5]=102,[6]=103,[7]=230,[8]=231,[9]=232,[10]=233}, --只用到前5个，现在新版本改为5层
		fy_mfvar = 11,	--私人变量标志
		fy_ybnum = 5,
		fy_jbnum = 20000,
		scene1={index=1,sceneId1={303,304,305,306,307,                388,389,390,391,392,				414,415,416,417,418}},
		scene2={index=2,sceneId2={308,309,310,311,312,                393,394,395,396,397,				419,420,421,422,243}},
		scene3={index=3,sceneId3={313,314,315,316,317,                398,399,400,401,402}},
		scene4={index=4,sceneId4={378,379,380,381,382}},
		scene5={index=5,sceneId5={383,384,385,386,387}},
	},
	limitCount=15,
	limitCount2=100, --表示3天后取100
}

t.main = function(sysarg)
	
	local echo = ""
	echo = [[

  <(c0xFFff9000)散人殿堂>

  <(c0xFFeabc78)散人殿堂一共有5层,每次进入所需2W绑金/金币.>
  <(c0xFFeabc78)1-5层BOSS分掉落一元到十方装备>
  <六合以上首饰便可在锻造-合成系统中2合1获得更高阶首饰>

<(idecoLine#330)>
<(c0xFF00c0ff)友情提示：>
  <右上角><(c0xFF00FF00)挑战BOSS><面板的><(c0xFF00FF00)野外BOSS><可查看全服BOSS掉落信息.>
]];

	local smbl = {4675,4676,4677,4678,4679,4680,4684,4685,4686,4687,4688,4689,4693,4694,4695,4696,4697,4698};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end




	local mapid = Actor.getSceneId(sysarg)
	local mapIndex=0 --这个是判断是否进入分线的
	
	for i=1,5 do 
		if t.data.sceneId[i]== mapid then 
			mapIndex =i
		end
	end
	
	--可能在分流
	if mapIndex==0 then 
		for _,v in pairs (t.data.scene1.sceneId1) do 
			if mapid == v then 
				mapIndex = 1 
			end
		end
		for _,v in pairs (t.data.scene2.sceneId2) do 
			if mapid == v then 
				mapIndex = 2 
			end
		end
		
		for _,v in pairs (t.data.scene3.sceneId3) do 
			if mapid == v then 
				mapIndex = 3 
			end
		end
		
		for _,v in pairs (t.data.scene4.sceneId4) do 
			if mapid == v then 
				mapIndex = 4 
			end
		end
		
		for _,v in pairs (t.data.scene5.sceneId5) do 
			if mapid == v then 
				mapIndex = 5 
			end
		end
	
	end
	--如果还是0，那就是在外面（散人殿堂又改了，限制只剩下这种方式进入）
	if mapIndex== 0 then 

		echo = echo .. "		<#BN进入散人殿堂/@enterScene,1>"
	elseif  mapIndex== 1 then 
		echo = echo .."\\		<前往散人殿堂2层/@enterScene,2|进入所需2W绑定金币/金币,每日无限次进去>\\"

	elseif  mapIndex== 5 then 
		echo = echo .."		\\   		  <前往散人殿堂4层/@enterScene,4|进入所需2W绑定金币/金币,每日无限次进去>\\"
	else 
		echo = echo .."\\   	<前往散人殿堂"..(mapIndex-1).."/@enterScene,"..(mapIndex-1).."|进入所需2W绑定金币/金币,每日无限次进去>"

		echo = echo .."	<前往散人殿堂"..(mapIndex+1).."/@enterScene,"..(mapIndex+1).."|进入所需2W绑定金币/金币,每日无限次进去>"
	end
	
	--任务
	if mapIndex==0 then 
		local nowVar =get_taskflags_val(sysarg)
		local ta = task_all[nowVar]
		if ta~=nil and nowVar == 87 and ta.type == 4 then   --需要改的now
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			Actor.openarrowsguide(sysarg, 1005, 115, 441, 2);
			Actor.addTimer(sysarg,20,7*1000)
		end
	end
	
	
	return echo
end

t.enterScene = function(sysarg,toidx)
	
	toidx = tonumber(toidx)
	--只有一种方法可以进入
	--if toidx~=1 then
	--	return 
	--end
	--检查扣钱
	local jb = t.data.fy_jbnum;
    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= jb then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= jb then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("绑金或金币不足 <%s> ,进入失败.",jb), 256);
        return ;
    end
    Actor.changeMoney(sysarg, MC, -jb,2036,"散人殿堂扣除");

	if toidx== 1 then 
		local nowVar =get_taskflags_val(sysarg)
		local ta = task_all[nowVar]
		local sVar = Actor.getDyanmicVar(sysarg)
		if  ta~=nil and nowVar == 87 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			MasterStokeAcceptTask(sysarg,ta.npcid)	
			return
		end
	end
	
	--if mapid == 9 then
	--	System.broadcastTipmsg(string.format("<(n%s)>进入了%s%s", actorName, NpcName, NpctFly), 128);
	--end

	OnFinish_Liveness(sysarg,11)
	
	if toidx== 2 or mapIndex == 1 then 
		if t.IsMaxActor(99) ==false then  
			Actor.enterScene(sysarg,99,166,100); --1层传送免费进入2层
		else 
			local haveenter = false 
			for i,v in pairs(t.data.scene2.sceneId2) do 
				if t.IsMaxActor(v) ==false then  
					Actor.enterScene(sysarg,v,166,100)
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				Actor.enterScene(sysarg,t.data.scene2.sceneId2[5],166,100)
			end
		end
	elseif toidx== 3 or mapIndex == 2 then 
		if t.IsMaxActor(100) ==false then  
			Actor.enterScene(sysarg,100,166,100);
		else 
			local haveenter = false 
			for i,v in pairs(t.data.scene3.sceneId3) do 
				if t.IsMaxActor(v) ==false then  
					Actor.enterScene(sysarg,v,166,100)
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				Actor.enterScene(sysarg,t.data.scene3.sceneId3[5],166,100)
			end
		end
	elseif toidx== 4 or mapIndex == 3 then 
		if t.IsMaxActor(101) ==false then  
			Actor.enterScene(sysarg,101,166,100);
		else 
			local haveenter = false 
			for i,v in pairs(t.data.scene4.sceneId4) do 
				if t.IsMaxActor(v) ==false then  
					Actor.enterScene(sysarg,v,166,100)
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				Actor.enterScene(sysarg,t.data.scene4.sceneId4[5],166,100)
			end
		end
		
	elseif toidx== 5 or mapIndex == 4 then 
		if t.IsMaxActor(102) ==false then  
			Actor.enterScene(sysarg,102,166,100);
		else 
			local haveenter = false 
			for i,v in pairs(t.data.scene5.sceneId5) do 
				if t.IsMaxActor(v) ==false then  
					Actor.enterScene(sysarg,v,166,100)
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				Actor.enterScene(sysarg,t.data.scene5.sceneId5[5],166,100)
			end
		end
		
	elseif  toidx== 1 then --进入第1层
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		if pLv<80 or Actor.getSceneId(sysarg)~=9 then  --少于80的进入口/场景不为9 可以进入第一层，不然都去第2层 
			if t.IsMaxActor(98) ==false then  
				local sceneName = Fuben.getSceneNameById(98); 
				Actor.telportSceneRandPos(sysarg,sceneName)
			else 
				local haveenter = false 
				for i,v in pairs(t.data.scene1.sceneId1) do 
					if t.IsMaxActor(v) ==false then  
						Actor.enterScene(sysarg,v,166,100)
						haveenter =true
						break
					end
				end
				if haveenter ==false then 
					Actor.enterScene(sysarg,t.data.scene1.sceneId1[5],166,100)
				end
			end
		else --大于等于80的进入口
			if t.IsMaxActor(99) ==false then  
				Actor.enterScene(sysarg,99,166,100); --1层传送免费进入2层
			else 
				local haveenter = false 
				for i,v in pairs(t.data.scene2.sceneId2) do 
					if t.IsMaxActor(v) ==false then  
						Actor.enterScene(sysarg,v,166,100)
						haveenter =true
						break
					end
				end
				if haveenter ==false then 
					Actor.enterScene(sysarg,t.data.scene2.sceneId2[5],166,100)
				end
			end
		end
	end
end




--神秘之殿修改前的旧版本
--t.main = function(sysarg)
--	--//主显示内容
--
--	local yb = t.data.fy_ybnum;
--	local jb = t.data.fy_jbnum;
--
--	local mapid = Actor.getSceneId(sysarg);
--	
--	local mapIndex=0 --这个是判断是否进入分线的
--	for _,v in pairs (t.data.scene1.sceneId1) do 
--		if mapid == v then 
--			mapIndex = 1 
--		end
--	end
--	for _,v in pairs (t.data.scene2.sceneId2) do 
--		if mapid == v then 
--			mapIndex = 2 
--		end
--	end
--	
--		for _,v in pairs (t.data.scene3.sceneId3) do 
--		if mapid == v then 
--			mapIndex = 3 
--		end
--	end
--	
--	local echo = "";
--	if mapid >= 100 and mapid<=103 or  mapid>=230 and mapid<=232 or mapIndex == 3 then --玩家在散人殿堂3层以上则显示以下内容
--		local n=0
--		if mapid >= 98 and mapid<=103 then 
--			n=mapid-96
--		else 
--			n=mapid-222
--		end
--		if mapIndex ~= 0 then --第3层到第4层
--			n = mapIndex+1
--		end
--		echo = [[
--
--  <(c0xFFff9000)散人殿堂]]..n..[[层入口>
--
--  <(c0xFFb6946c)散人殿堂一共有5层,进入1层免费,上下层每次所需10W绑金/金币.>
--
--<(idecoLine#330)>
--
--  <免费进入/@enterScene,1,]]..n..[[> <(c0xFFb6946c)前3层免费,4层后每天第1次进入免费>
--
--<(idecoLine#330)>
--
--  <元宝进入/@enterScene,2,]]..n..[[> <(c0xFFb6946c)需要]]..yb..[[元宝>
--
--  <金币进入/@enterScene,3,]]..n..[[> <(c0xFFb6946c)需要]]..jb..[[绑金或金币>
--
--<(idecoLine#330)>
--
--  <元宝直接进入10层/@enterSceneEx,2> <(c0xFFb6946c)需要]]..(yb*9)..[[元宝>
--
--  <金币直接进入10层/@enterSceneEx,3> <(c0xFFb6946c)需要]]..(jb*9)..[[绑金或金币>
--
--]]
---- 		local openday = System.getDaysSinceOpenServer();
---- 		if openday >= 4 then
---- 		echo=echo..[[
----   <元宝直接进入10层/@enterSceneEx,2> <(c0xFFb6946c)需要]]..(yb*9)..[[元宝>
--
----   <金币直接进入10层/@enterSceneEx,3> <(c0xFFb6946c)需要]]..(jb*9)..[[绑金或金币>]]
---- 		end
--
--
--	end
--	
--	if mapid == 9 or  mapid >= 98 and mapid<=99 or mapIndex == 1 or mapIndex == 2 then	--玩家如果在威龙城/12层则显示以下内容
--		local nowVar =get_taskflags_val(sysarg)
--		local ta = task_all[nowVar]
--		if ta~=nil and nowVar == 87 and ta.type == 4 then   --需要改的now
--			local sVar = Actor.getDyanmicVar(sysarg)
--			sVar.nowNumberOfStep=1
--			Actor.openarrowsguide(sysarg, 1005, 115, 441, 2);
--			Actor.addTimer(sysarg,20,7*1000)
--		end
--
--		--if  ta~=nil and nowVar == 91 and ta.type == 4 then   --需要改的now
--		--	local sVar = Actor.getDyanmicVar(sysarg)
--		--	sVar.nowNumberOfStep=1
--		--	Actor.openarrowsguide(sysarg, 1005, 115, 441, 2);
--		--	Actor.addTimer(sysarg,20,7*1000)
--		--end
--		local tips = "散人殿堂 1 层BOSS掉落: 一元装备#";
--		tips = tips .. "散人殿堂 2 层BOSS掉落: 两仪套装#";
--		tips = tips .. "散人殿堂 3 层BOSS掉落: 三才套装#";
--		tips = tips .. "散人殿堂 4 层BOSS掉落: 四象套装#";
--		tips = tips .. "散人殿堂 5 层BOSS掉落: 五行套装#";
--		tips = tips .. "散人殿堂 6 层BOSS掉落: 六合套装#";
--		tips = tips .. "散人殿堂 7 层BOSS掉落: 七星套装#";
--		tips = tips .. "散人殿堂 8 层BOSS掉落: 八荒套装#";
--		tips = tips .. "散人殿堂 9 层BOSS掉落: 九宫套装#";
--		tips = tips .. "散人殿堂 10 层BOSS掉落: 十方套装#";
--		echo = [[
--
--  <(c0xFFff9000)散人殿堂>
--
--  <(c0xFFb6946c)散人殿堂一共有5层,上下层传送所需10W绑金/金币.>
--
--
--<(idecoLine#330)>
--
--  <右上角><(c0xFF00FF00)挑战BOSS><面板的><(c0xFF00FF00)BOSS公告><可查看全服BOSS信息.>
--]];
--
--	local smbl = {4675,4676,4677,4678,4679,4680,4684,4685,4686,4687,4688,4689,4693,4694,4695,4696,4697,4698};
--	for j = 1,#smbl do
--		
--		if j == 6 or  j == 12 or j == 18 then
--			echo = echo .. t.ipk(smbl[j]) .. "\\";
--		else
--			echo = echo .. t.ipk(smbl[j]) .. " ";
--		end
--	end
--
--
--	echo = echo .. [[
--
--  <#BN免费进入/@enterScene,4>
--
--]];
--	end
--	return echo;
--end
t.ipk = function(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end
--
--t.enterScene = function(sysarg,idx,layer)
--	if not idx then return; end
--	idx = tonumber(idx);
--	
--	
--	local mapid = Actor.getSceneId(sysarg);
--	local mapIndex=0 --这个是判断是否进入分线的
--	for _,v in pairs (t.data.scene1.sceneId1) do 
--		if mapid == v then 
--			mapIndex = 1 
--		end
--	end
--	for _,v in pairs (t.data.scene2.sceneId2) do 
--		if mapid == v then 
--			mapIndex = 2 
--		end
--	end
--	
--	for _,v in pairs (t.data.scene3.sceneId3) do 
--		if mapid == v then 
--			mapIndex = 3 
--		end
--	end
--	
--	for _,v in pairs (t.data.scene4.sceneId4) do 
--		if mapid == v then 
--			mapIndex = 4 
--		end
--	end
--	
--	for _,v in pairs (t.data.scene5.sceneId5) do 
--		if mapid == v then 
--			mapIndex = 5
--		end
--	end
--	
--	
--	
--	if idx > 4 or idx < 1 then return; end
--
--		local nowVar =get_taskflags_val(sysarg)
--		local ta = task_all[nowVar]
--		local sVar = Actor.getDyanmicVar(sysarg)
--			if  ta~=nil and nowVar == 87 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
--				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
--				MasterStokeAcceptTask(sysarg,ta.npcid)	
--				return
--			end
--			--if  ta~=nil and nowVar == 91 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
--			--	sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
--			--	MasterStokeAcceptTask(sysarg,ta.npcid)	
--			--	return
--			--end
--
--	local c_type = 0;
--	local c_num = 0;
--	local var = Actor.getStaticVar(sysarg)
--	
--	local RwData = {"散人殿堂", "威龙城", 126,119, "散人殿堂"}
--	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
--	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
--	local actorName = Actor.getName(sysarg)
--	
--	
--	if idx == 1 then --只有第4个要检查
--		--if get_d_val(sysarg,11) > 0 then
--			--del_d_val(sysarg,11,1);
--		if var.days.enterShenMiZhiDian == nil then var.days.enterShenMiZhiDian={} end
--		if mapIndex == 0 and var.days.enterShenMiZhiDian[mapid] == nil then 
--			 var.days.enterShenMiZhiDian[mapid] = false
--		elseif mapIndex ==3 and var.days.enterShenMiZhiDian[100]==nil  then 
--			var.days.enterShenMiZhiDian[100] = false 
--		elseif mapIndex ==4 and var.days.enterShenMiZhiDian[101]==nil  then 
--			var.days.enterShenMiZhiDian[101] = false 
--		elseif mapIndex ==5 and var.days.enterShenMiZhiDian[102]==nil  then 
--			var.days.enterShenMiZhiDian[102] = false 
--		else
--			Actor.sendTipmsg(sysarg, "您今天已经免费进入过1次了,等明天再来吧,或者选择付费进入吧.", 256);
--			return t.main(sysarg)
--		end
--	elseif idx == 2 then
--		local yb = t.data.fy_ybnum;
--		if Actor.getMoneyCount(sysarg,3) < yb then
--			Actor.sendTipmsg(sysarg, string.format("元宝不足 <%s> ,进入失败.",yb), 256);
--			return t.main(sysarg)
--		end
--		Actor.changeMoney(sysarg, 3, -yb,2036,"散人殿堂扣除元宝");
--	elseif idx == 3 then
--		local jb = t.data.fy_jbnum;
--        local MC = 2;
--        if Actor.getMoneyCount(sysarg,1) >= jb then MC = 1; end
--        if Actor.getMoneyCount(sysarg,0) >= jb then MC = 0; end
--        if MC == 2 then
--            Actor.sendTipmsg(sysarg, string.format("绑金或金币不足 <%s> ,进入失败.",jb), 256);
--            return ;
--        end
--        Actor.changeMoney(sysarg, MC, -jb,2036,"散人殿堂扣除");
--	elseif idx == 4 then
--		--免费的，什么都不用处理
--	end
--
--	if layer~=nil then 
--		layer=tonumber(layer)
--	end
--	--进入处理
--	if mapid == 9 then
--			System.broadcastTipmsg(string.format("<(n%s)>进入了%s%s", actorName, NpcName, NpctFly), 128);
--		end
--
--			if Actor.getSceneId(sysarg)== 98 or mapIndex == 1 then 
--				if t.IsMaxActor(99) ==false then  
--					Actor.enterScene(sysarg,99,42,42); --1层传送免费进入2层
--				else 
--					local haveenter = false 
--					for i,v in pairs(t.data.scene2.sceneId2) do 
--						if t.IsMaxActor(v) ==false then  
--							Actor.enterScene(sysarg,v,42,42)
--							haveenter =true
--							break
--						end
--					end
--					if haveenter ==false then 
--						Actor.enterScene(sysarg,t.data.scene2.sceneId2[5],42,42)
--					end
--				end
--			elseif Actor.getSceneId(sysarg)== 99 or mapIndex == 2 then 
--				if t.IsMaxActor(100) ==false then  
--					Actor.enterScene(sysarg,100,42,42);
--				else 
--					local haveenter = false 
--					for i,v in pairs(t.data.scene3.sceneId3) do 
--						if t.IsMaxActor(v) ==false then  
--							Actor.enterScene(sysarg,v,42,42)
--							haveenter =true
--							break
--						end
--					end
--					if haveenter ==false then 
--						Actor.enterScene(sysarg,t.data.scene3.sceneId3[5],42,42)
--					end
--				end
--			elseif Actor.getSceneId(sysarg)== 100 or mapIndex == 3 then 
--				if t.IsMaxActor(101) ==false then  
--					Actor.enterScene(sysarg,101,42,42);
--				else 
--					local haveenter = false 
--					for i,v in pairs(t.data.scene4.sceneId4) do 
--						if t.IsMaxActor(v) ==false then  
--							Actor.enterScene(sysarg,v,42,42)
--							haveenter =true
--							break
--						end
--					end
--					if haveenter ==false then 
--						Actor.enterScene(sysarg,t.data.scene4.sceneId4[5],42,42)
--					end
--				end
--				
--			elseif Actor.getSceneId(sysarg)== 101 or mapIndex == 4 then 
--				if t.IsMaxActor(102) ==false then  
--					Actor.enterScene(sysarg,102,42,42);
--				else 
--					local haveenter = false 
--					for i,v in pairs(t.data.scene5.sceneId5) do 
--						if t.IsMaxActor(v) ==false then  
--							Actor.enterScene(sysarg,v,42,42)
--							haveenter =true
--							break
--						end
--					end
--					if haveenter ==false then 
--						Actor.enterScene(sysarg,t.data.scene5.sceneId5[5],42,42)
--					end
--				end
--				
--			elseif  Actor.getSceneId(sysarg)== 9 then 
--				if t.IsMaxActor(98) ==false then  
--                    local sceneName = Fuben.getSceneNameById(98); 
--                    Actor.telportSceneRandPos(sysarg,sceneName)
--				else 
--					local haveenter = false 
--					for i,v in pairs(t.data.scene1.sceneId1) do 
--						if t.IsMaxActor(v) ==false then  
--							Actor.enterScene(sysarg,v,42,42)
--							haveenter =true
--							break
--						end
--					end
--					if haveenter ==false then 
--						Actor.enterScene(sysarg,t.data.scene1.sceneId1[5],42,42)
--					end
--				end
--			else 
--				Actor.enterScene(sysarg,t.data.sceneId[layer],-1,-1)
--			end
--			OnFinish_Liveness(sysarg,11)
--	
--	
--	
--
--	--Actor.enterScene(sysarg,t.data.sceneId[layer],-1,-1)
--	if layer~=nil and layer>=5 then 
--		System.broadcastTipmsg(string.format("<(n%s)>进入<散人殿堂%s层>.", actorName,layer), 128)
--	end
--	
--end
--
--是否满人了
t.IsMaxActor = function(SceneId)
	local handleScene = Fuben.getSceneHandleById(SceneId, 0)
	local playerCount = Fuben.getScenePlayerCount(handleScene)
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<3 then   --3天后就不加这个  怪物boss没有两只以上是活的，就算是满了 规则了
		if t.limitCount <= playerCount then
			return true
		end
		
		local hScene = Fuben.getSceneHandleById(SceneId, 0)
		if hScene <= 0 then return true end
		--怪物boss没有两只以上是活的，就算是满了
		if Fuben.getLiveBossCount(hScene) < 2 then
			return true
		end
	else 
		if t.limitCount2 <= playerCount then  --3天后就取 最上面100个人再分流了
			return true
		end
	end
	  
	return false
end
--
--t.enterSceneEx = function(sysarg,idx)
--	if not idx then return; end
--	idx = tonumber(idx);
--	if idx > 4 or idx < 1 then return; end
--
--	local openday = System.getDaysSinceOpenServer();
--
--	-- if openday <= 3 then
--	-- 	Actor.sendTipmsg(sysarg, string.format("当前开区第%s天,等到第4天后才可以使用本功能.",openday), 256);
--	-- 	return t.main(sysarg)
--	-- end
--
--	local c_type = 0;
--	local c_num = 0;
--	local var = Actor.getStaticVar(sysarg)
--	if idx == 2 then
--		local yb = (t.data.fy_ybnum*9);
--		if Actor.getMoneyCount(sysarg,3) < yb then
--			Actor.sendTipmsg(sysarg, string.format("元宝不足 <%s> ,进入失败.",yb), 256);
--			return t.main(sysarg)
--		end
--		Actor.changeMoney(sysarg, 3, -yb,2036,"散人殿堂扣除元宝");
--	elseif idx == 3 then
--		local jb = (t.data.fy_jbnum*9);
--        local MC = 2;
--        if Actor.getMoneyCount(sysarg,1) >= jb then MC = 1; end
--        if Actor.getMoneyCount(sysarg,0) >= jb then MC = 0; end
--        if MC == 2 then
--            Actor.sendTipmsg(sysarg, string.format("绑金或金币不足 <%s> ,进入失败.",jb), 256);
--            return ;
--        end
--        Actor.changeMoney(sysarg, MC, -jb,2036,"散人殿堂扣除金币");
--	end
--	Actor.enterScene(sysarg,t.data.sceneId[10],42,42)
--	
--	local RwData = {"散人殿堂", "威龙城", 126,119, "我也要参加"}
--	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
--	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
--	local actorName = Actor.getName(sysarg)
--	System.broadcastTipmsg(string.format("<(n%s)>进入<散人殿堂10层>.", actorName), 128)
--end

function GetNpcANYINMIDIAN() return t end

