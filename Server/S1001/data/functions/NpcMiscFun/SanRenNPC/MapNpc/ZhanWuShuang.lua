--#include "data\functions\OldPlayerReturnFunc.lua" once
-- 降妖除魔
local t = {
	--mapid = 86, --无双殿堂,任务专用地图
	--mapname = "无双殿堂";
	[1]={lvSatrt=50,lvEnd=55,circle= 0, Exp=200000,innerExp=1000,mapId=12,monsterId=0,monsterNum=1,x=0,y=0},
	[2]={lvSatrt=56,lvEnd=60,circle= 0, Exp=250000,innerExp=1000,mapId=13,monsterId=0,monsterNum=1,x=0,y=0},
	[3]={lvSatrt=61,lvEnd=65,circle= 0, Exp=300000,innerExp=1000,mapId=14,monsterId=0,monsterNum=1,x=0,y=0},
	[4]={lvSatrt=66,lvEnd=70,circle= 0, Exp=350000,innerExp=1000,mapId=15,monsterId=0,monsterNum=1,x=0,y=0},
	[5]={lvSatrt=71,lvEnd=75,circle= 0, Exp=500000,innerExp=1000,mapId=98,monsterId=0,monsterNum=1,x=0,y=0},
	[6]={lvSatrt=76,lvEnd=79,circle= 0, Exp=500000,innerExp=1000,mapId=98,monsterId=0,monsterNum=1,x=0,y=0},
	[7]={lvSatrt=80,lvEnd=90,circle= 0, Exp=500000,innerExp=1000,mapId=99,monsterId=0,monsterNum=1,x=0,y=0},
	
	[8]={lvSatrt=0,lvEnd=0,circle= 1, Exp=500000,innerExp=1000,mapId=31,monsterId=0,monsterNum=1,x=45,y=21},
	[9]={lvSatrt=0,lvEnd=0,circle= 2, Exp=500000,innerExp=1000,mapId=34,monsterId=0,monsterNum=1,x=159,y=151},
	[10]={lvSatrt=0,lvEnd=0,circle= 3, Exp=500000,innerExp=1000,mapId=38,monsterId=0,monsterNum=1,x=176,y=47},
	[11]={lvSatrt=0,lvEnd=0,circle= 4, Exp=500000,innerExp=1000,mapId=41,monsterId=0,monsterNum=1,x=160,y=32},
	[12]={lvSatrt=0,lvEnd=0,circle= 5, Exp=500000,innerExp=1000,mapId=45,monsterId=0,monsterNum=1,x=111,y=27},
	[13]={lvSatrt=0,lvEnd=0,circle= 6, Exp=500000,innerExp=1000,mapId=49,monsterId=0,monsterNum=1,x=205,y=117},
	[14]={lvSatrt=0,lvEnd=0,circle= 7, Exp=500000,innerExp=1000,mapId=53,monsterId=0,monsterNum=1,x=45,y=26},
	[15]={lvSatrt=0,lvEnd=0,circle= 8, Exp=500000,innerExp=1000,mapId=56,monsterId=0,monsterNum=1,x=187,y=208},
	[16]={lvSatrt=0,lvEnd=0,circle= 9, Exp=500000,innerExp=1000,mapId=58,monsterId=0,monsterNum=1,x=29,y=32},
	[17]={lvSatrt=0,lvEnd=0,circle= 10, Exp=500000,innerExp=1000,mapId=66,monsterId=0,monsterNum=1,x=155,y=122},
	
	kuangshi =
	{
		{needItem = 4699,	name = "铜矿", 		needcount = 1,mapId = 343,},  --这里的经验奖励也是用上面的配置
		{needItem = 4700,	name = "铁矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},
		{needItem = 4701,	name = "银矿",		needcount = 1,mapId = 343,},

	},
	findNpc =
	{
		{mapId = 9, npcName ="万事通",x=126,y=139,},
		{mapId = 9, npcName ="装备宝箱",x=118,y=147,},
		{mapId = 9, npcName ="装备回收",x=113,y=152,},
		{mapId = 9, npcName ="副本管理员",x=132,y=171,}, 
		{mapId = 9, npcName ="首领之家",x=126,y=165,},
		{mapId = 9, npcName ="散人殿堂",x=127,y=119,},


	},
	index=0,

}

--分辨出多少级别，做哪个任务
t.main = function(sysarg)
	
	local sVar = Actor.getDyanmicVar(sysarg)
	sVar.nowNumberOfStep =0
	

	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if pLv < 50 then return "\\    50级后再来找我吧."; end
	if get_taskflags_val(sysarg)==nil or get_taskflags_val(sysarg)<64 then 
		return " 小伙子你还年轻，耐心跟着主线任务走，到时候我们自然会相见"
	end
		
	local sVar = Actor.getDyanmicVar(sysarg)
	sVar.shuaxinStar =0
	
	return t.main2 (sysarg)
end

--npc内容显示
t.main2 = function(sysarg)
	
	--加上是否在任务状态，不然最后一个任务接了之后就不能完成了
	local Var = Actor.getStaticVar(sysarg)
	if get_d_val(sysarg,10) >= 5 and get_d_val(sysarg,2) == 0 and ( Var.RiChangRenWuFlag ==nil or Var.RiChangRenWuFlag ==0 )then
		return "\\  <(c0xFFeabc78)您今天的战无双任务已经都完成了,明天再来找我吧.>\\\\  <(c0xFFeabc78)看看今天的炼狱您做过了吗?>";
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)	
	local Var = Actor.getStaticVar(sysarg)
	
	if nowVar == 65 and sVar.nowNumberOfStep ==0 and (Var.RiChangRenWuFlag ~=nil and Var.RiChangRenWuFlag==1) then   --需要改的now
		sVar.nowNumberOfStep=1
		Actor.addTimer(sysarg,20,7*1000)
	end
	
	
	if nowVar == 64 and ta.type == 4 and sVar.nowNumberOfStep ==0 and (Var.RiChangRenWuFlag ==nil or Var.RiChangRenWuFlag ==0) then   --需要改的now
		sVar.nowNumberOfStep=1
		Actor.addTimer(sysarg,20,7*1000)
	end
	
	if nowVar == 64 and ta.type == 4 then --任务中不用刷都是10星
		set_d_val(sysarg,7,10)
	end
	
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local MaxExpS = 0
	local innerExpS =0
	local MaxExp = 0
	local innerExp = 0

	
	--当前任务索引
	if Var.RiChangRenWuIndex~=nil then 
		MaxExp = t[Var.RiChangRenWuIndex].Exp
		innerExp = t[Var.RiChangRenWuIndex].innerExp
	end

	local nSdm = math.floor(MaxExp * 20 / 30000);
	local nSsj = 18000;

	if get_d_val(sysarg,7)==0 then set_d_val(sysarg,7,1) end 
	MaxExpS =  MaxExp * get_d_val(sysarg,7)
	innerExpS = innerExp * get_d_val(sysarg,7)

	local sNengLiang = "&FF0000&当前: "..Actor.getMoneyCount(sysarg,0).." 绑定金币#&FF0000&当前: "..Actor.getMoneyCount(sysarg,1).." 金币";
	local sYuanBao = "&FF0000&当前: "..Actor.getMoneyCount(sysarg,3).." 元宝#&888888&(进行元宝充值1元人民币等于100元宝)";

	--set_d_val(sysarg,6,MaxExpS);	--记录任务经验
	if get_d_val(sysarg,2) == 0 and get_d_val(sysarg,10) < 5 and (Var.RiChangRenWuFlag ==nil or Var.RiChangRenWuFlag ==0) then
		Actor.openarrowsguide(sysarg, 1005, 308, 487, 1);
	end

	local ehco = [[

                   <(c0xFFeabc78)[每日降妖除魔任务]>

<(idecoLine#330)>

]]
	if Var.RiChangRenWuType == nil then --这里控制一下，已经随机过类型的，不再随机
		--Var.RiChangRenWuType = System.getRandomNumber(3)
		--Var.RiChangRenWuType = System.getRandomNumber(2) --屏蔽了对话npc
		
		local randNumber = System.getRandomNumber(10) --产生0~9的随机
		if randNumber<9 then --90%是打怪
			Var.RiChangRenWuType = 0
		else  --10%是挖矿
			Var.RiChangRenWuType = 1
		end
		
	end
	if pLv<=70 then 
		Var.RiChangRenWuType = 0
	end
	
	
	--没接受任务
    if Var.RiChangRenWuFlag ==nil or Var.RiChangRenWuFlag ==0 then 
		local str =""
	
		if Var.RiChangRenWuType == 0 then  --任务类型0，打怪物
			if Var.RiChangRenWuKillMonsters ==nil then 
				Var.RiChangRenWuKillMonsters=0
			end 
			if Var.RiChangRenWuIndex ==nil then 
				local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
				local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
				if myCircle == 0 then 
					if pLv>=50 and pLv<=55 then Var.RiChangRenWuIndex=1
					elseif pLv>=56 and pLv<=60 then Var.RiChangRenWuIndex=2
					elseif pLv>=61 and pLv<=65 then Var.RiChangRenWuIndex=3
					elseif pLv>=66 and pLv<=70 then Var.RiChangRenWuIndex=4
					elseif pLv>=71 and pLv<=75 then Var.RiChangRenWuIndex=5
					elseif pLv>=76 and pLv<=79 then Var.RiChangRenWuIndex=6
					elseif pLv>=80 and pLv<=90 then Var.RiChangRenWuIndex=7
					else Var.RiChangRenWuIndex=7
					end	
				else	
					if myCircle>t[17].circle then Var.RiChangRenWuIndex=17 end 
					for i=1,17 do 
						if myCircle==t[i].circle then 
							Var.RiChangRenWuIndex = i
						end
					end
				end
			end
			local NumMon = t[Var.RiChangRenWuIndex].monsterNum
			local mapName =Fuben.getSceneNameById(t[Var.RiChangRenWuIndex].mapId)
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)击杀> <(c0xFFeabc78)任意怪 %s> <(c0xFFb6946c)只>",mapName,NumMon)
		elseif Var.RiChangRenWuType == 1 then  --任务类型1 ，收集矿物
			if Var.RiChangRenWuIndex ==nil then 
				Var.RiChangRenWuIndex = System.getRandomNumber(#t.kuangshi)+1  --在这任务类型中随机一个任务
			end
			if Var.RiChangRenWuIndex >= #t.kuangshi then 
				Var.RiChangRenWuIndex = #t.kuangshi
			end
			--str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)收集> <(c0xFFeabc78)%s %s> <(c0xFFb6946c)颗>","矿洞",t.kuangshi[Var.RiChangRenWuIndex].name,t.kuangshi[Var.RiChangRenWuIndex].needcount)
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)收集> <(c0xFFeabc78)%s %s> <(c0xFFb6946c)颗>","矿洞","任意矿",t.kuangshi[Var.RiChangRenWuIndex].needcount)
		elseif Var.RiChangRenWuType == 2 then  --任务类型2，对话npc
			if Var.RiChangRenWuIndex ==nil then 
				Var.RiChangRenWuIndex = System.getRandomNumber(#t.findNpc)+1  --在这任务类型中随机一个任务
			end
			if Var.RiChangRenWuIndex >= #t.findNpc then 
				Var.RiChangRenWuIndex = #t.findNpc
			end
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)寻找> <(c0xFFeabc78)%s>",Fuben.getSceneNameById(t.findNpc[Var.RiChangRenWuIndex].mapId),t.findNpc[Var.RiChangRenWuIndex].npcName)
		end
		
		if Var.RiChangRenWuIndex~=nil then 
			MaxExp = t[Var.RiChangRenWuIndex].Exp
			innerExp = t[Var.RiChangRenWuIndex].innerExp
			MaxExpS =  MaxExp * get_d_val(sysarg,7)
			innerExpS = innerExp * get_d_val(sysarg,7)
		end
	
		ehco = ehco..[[    <(inpcTalkImg#4#70#20)>

        ]]..str..[[ 

    <(inpcTalkImg#3#70#20)>
        <(c0xFFbf975f)><(iaward#2#1)> <(c0xFFb6946c)角色经验> <(c0xFFeabc78)+]]..MaxExpS..[[>
        <(c0xFFbf975f)><(iaward#0#1)> <(c0xFFb6946c)内功经验> <(c0xFFeabc78)+]]..innerExpS..[[\>

<#BN接受任务/@rcJieShouRenWu> \\\\
]];
	Actor.addTimer(sysarg,47,5*1000)
	--接了任务，但是没有完成
	elseif Var.RiChangRenWuFinish ==nil or Var.RiChangRenWuFinish ==0 then --显示继续前往任务

		local str =""
		if Var.RiChangRenWuType ==0 then 
			if Var.RiChangRenWuKillMonsters ==nil then 
				Var.RiChangRenWuKillMonsters=0
			end 
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)击杀> <(c0xFFeabc78)任意怪 %s/%s> <(c0xFFb6946c)只>",Fuben.getSceneNameById(t[Var.RiChangRenWuIndex].mapId),Var.RiChangRenWuKillMonsters,t[Var.RiChangRenWuIndex].monsterNum)
		elseif  Var.RiChangRenWuType ==1 then 
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)收集> <(c0xFFeabc78)%s %s> <(c0xFFb6946c)颗>","矿洞",t.kuangshi[Var.RiChangRenWuIndex].name,t.kuangshi[Var.RiChangRenWuIndex].needcount)
			if Var.RiChangRenWuIndex >= #t.kuangshi then 
				Var.RiChangRenWuIndex = #t.kuangshi 
			end
		elseif Var.RiChangRenWuType == 2 then
			if Var.RiChangRenWuIndex >= #t.findNpc then 
				Var.RiChangRenWuIndex = #t.findNpc
			end
			str = string.format("<(c0xFFb6946c)前往> <(c0xFFeabc78)%s> <(c0xFFb6946c)寻找> <(c0xFFeabc78)%s>",Fuben.getSceneNameById(t.findNpc[Var.RiChangRenWuIndex].mapId),t.findNpc[Var.RiChangRenWuIndex].npcName)
		end
		ehco=ehco..[[    <(inpcTalkImg#4#70#20)>

        ]]..str..[[ 

    <(inpcTalkImg#3#70#20)>
        <(c0xFFbf975f)><(iaward#2#1)> <(c0xFFb6946c)角色经验> <(c0xFFeabc78)+]]..MaxExpS..[[>
        <(c0xFFbf975f)><(iaward#0#1)> <(c0xFFb6946c)内功经验> <(c0xFFeabc78)+]]..innerExpS..[[\>

<#BN继续任务/@rcQianWangRenWuScene> \\\\
]];
	--完成了任务
	Actor.addTimer(sysarg,47,5*1000)
	else
		ehco=ehco..[[    <(inpcTalkImg#5#70#20)> <#star/]]..get_d_val(sysarg,7)..[[/10/119/120/15>                            <(c0xFFbf975f)(]]..get_d_val(sysarg,7)..[[/10)>
		          <(c0xFFbf975f)(每亮><(c0xFFbf975f)1颗星><(c0xFFbf975f)经验><(c0xFFbf975f)翻1倍><(c0xFFbf975f))>	
    <(inpcTalkImg#3#70#20)>
        <(c0xFFbf975f)><(iaward#2#1)> <(c0xFFb6946c)角色经验> <(c0xFFeabc78)+]]..MaxExpS..[[>
        <(c0xFFbf975f)><(iaward#0#1)> <(c0xFFb6946c)内功经验> <(c0xFFeabc78)+]]..innerExpS..[[\>
    <(inpcTalkImg#6#70#20)> <金币随机刷星/@dlxx,1|]]..nSsj..[[绑金或金币随机刷星级#]]..sNengLiang..[[>  <元宝直刷十星/@dlxx,3|]].."9"..[[ 颗元宝直接刷满星级#]]..sYuanBao..[[>
]]
		if get_d_val(sysarg,7) ~= 1 then
			ehco = ehco .. "<#BN完成任务/@rcWanChengRenWu> \\\\\\\\\\"
		else
			ehco = ehco .. "<#BN先刷星级吧/@rcWanChengRenWuNO> \\\\\\\\\\"
		end
		local sVar = Actor.getDyanmicVar(sysarg)
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
		if (sVar.shuaxinStar==nil or sVar.shuaxinStar == 0 ) and pLv < 80 and get_d_val(sysarg,7)~= 10 then 
			Actor.openarrowsguide(sysarg, 1005, 46, 342, 2);
		end
	end
	
	if get_d_val(sysarg,7) >= 10 then
		Actor.openarrowsguide(sysarg, 1005, 45, 415, 2);
	end
	
	Actor.addTimer(sysarg,47,5*1000)
	
	ehco = ehco .. string.format("	        <(c0xFFbf975f)今日剩余任务次数> <(c0xFFeabc78)%s> <(c0xFFbf975f)次> <购买次数/@buycs|需要20万金币#每天可购买5次##如果哪天在外面看到身穿降妖除魔衣服的人,那个人就是我>",get_d_val(sysarg,2));
	return ehco;

end

--------------------------------------------------------------------------------------------------------------------------------------------------
--[[
t.YiJianWanCheng = function(sysarg)


	if Actor.getMoneyCount(sysarg,3) < 50 then
		Actor.sendTipmsg(sysarg, string.format("您的元宝不足 <%s> ,刷新失败.",50), 256);
		return t.main2(sysarg)
	end
	-- local Var = Actor.getStaticVar(sysarg)
	-- Var.RiChangRenWuFinish =1
	-- Var.RiChangRenWuKillMonsters=t[Var.RiChangRenWuIndex].monsterNum
	-- Quest_ShuaXin(sysarg)
	-- return t.main2(sysarg)
	
	local Var = Actor.getStaticVar(sysarg)
	local Times = get_d_val(sysarg,7)
	local actorName =Actor.getName(sysarg)
	
	set_d_val(sysarg,7,0);
	Var.RiChangRenWuFlag=0
	Var.RiChangRenWuFinish=0
	if Var.RiChangRenWuIndex ~=nil and Var.RiChangRenWuIndex==0 then 
		Var.RiChangRenWuIndex=1
	end
	
	Actor.addExp(sysarg,t[Var.RiChangRenWuIndex].Exp*Times)
	Actor.addInnerExp(sysarg, t[Var.RiChangRenWuIndex].innerExp*Times)
	local tishi = string.format("<(c0xFFd4ab6f)恭喜><(n%s)><(c0xFFd4ab6f)在威龙城的><(c0xFF00ff00)战无双><(c0xFFd4ab6f)处完成了降妖除魔任务,经验＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),内功经验＋><(c0xFF00ff00)%s><(c0xFFd4ab6f).>",actorName,t[Var.RiChangRenWuIndex].Exp*Times,t[Var.RiChangRenWuIndex].innerExp*Times)
	System.broadcastTipmsg(tishi,128)
	
	--活跃度
	OnFinish_Liveness(sysarg,5)
	
	Quest_ShuaXin(sysarg)
	return t.main2(sysarg)


end
--]]
t.rcWanChengRenWuNO = function(sysarg)
	Actor.sendTipmsg(sysarg,"请先刷新任务星级再来领取任务奖励吧！",256);
	return t.main2(sysarg);
end

--购买次数
t.buycs = function(sysarg)
	local needn = 200000;
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= needn then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= needn then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s,购买失败..",needn),256);
		return t.main2(sysarg);
	end
	if get_d_val(sysarg,10) >= 5 then
		Actor.sendTipmsg(sysarg,"您今天已经购买过5次参与任务机会了,无法再继续购买!\\请明天再来吧.(每天0点刷新任务次数)",256);
		return;
	end
	Actor.changeMoney(sysarg,MC,-needn,2122,"购买降妖除魔次数");
	add_d_val(sysarg,2,1);
	add_d_val(sysarg,10,1);
	Actor.sendTipmsg(sysarg,"购买成功!",256);
	Quest_ShuaXin(sysarg)
	return t.main2(sysarg);
end

--完成任务
t.rcWanChengRenWu = function(sysarg)

	Actor.deleteTimer(sysarg,47)
	local Var = Actor.getStaticVar(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		
	--有任务，并且任务已经完成
	if Var.RiChangRenWuFlag~=nil and Var.RiChangRenWuFlag==1 and Var.RiChangRenWuFinish ~=nil and Var.RiChangRenWuFinish ==1 then
		local taskIndex = tonumber(Var.RiChangRenWuIndex)
		if taskIndex == 0 then taskIndex = 1 end
		local rewardConfig = t[taskIndex]
		if rewardConfig == nil or type(rewardConfig.Exp) ~= "number" or type(rewardConfig.innerExp) ~= "number" then
			Actor.sendTipmsg(sysarg,"日常任务记录异常，领取状态已保留，请重新登录后再提交。",256)
			return
		end
		if Var.RiChangRenWuType ~= nil and Var.RiChangRenWuType == 1 then --日常除魔收集矿石
			--Actor.removeItem(sysarg,t.kuangshi[Var.RiChangRenWuIndex].needItem,t.kuangshi[Var.RiChangRenWuIndex].needcount)
			
			--改成用私人变量控制
			--if Var.days.kuangshi_RCCM ==nil then 
			--	Var.days.kuangshi_RCCM ={}
			--end
			--if Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem]==nil then 
			--	Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem] = 0
			--end
			--Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem] = Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem]-t.kuangshi[Var.RiChangRenWuIndex].needcount
			--
			--if Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem]<0 then 
			--	Var.days.kuangshi_RCCM[t.kuangshi[Var.RiChangRenWuIndex].needItem] = 0
			--end
			
			--if Var.kuangshi_RCCM ==nil then 
			--	Var.kuangshi_RCCM =0
			--end
			Var.kuangshi_RCCM = 0
			--if Var.kuangshi_RCCM<0 then 
			--	Var.kuangshi_RCCM =0
			--end
			
		end
	
		local Times = get_d_val(sysarg,7)
		local actorName =Actor.getName(sysarg)
		
		local SpeciaTitleTime=1
		--特权
		if IsSpeciaTitleVip(sysarg,1)==true then 
			SpeciaTitleTime = 1.2
			Actor.sendTipmsg(sysarg,string.format("黄铜特权加成百分之20奖励,获得经验:%s,内功经验%s",math.floor(rewardConfig.Exp*Times*SpeciaTitleTime),math.floor(rewardConfig.innerExp*Times*SpeciaTitleTime)),ttFlyTip)
		end
        --老兵回归
        local nOldPlayerRate = 1
		local sys = System.getStaticVar()
            if sys.oldplayer ~= nil then
                local aVar = InitOldPlayerReturnInfo(sysarg)
                if aVar.oldplayret.isold == 1 then
                      nOldPlayerRate = OldPlayerReturnCfg[1].Daily.rate
                end
            end		
		local rewardExp = math.floor(rewardConfig.Exp*Times*SpeciaTitleTime * nOldPlayerRate)
		local rewardInnerExp = math.floor(rewardConfig.innerExp*Times*SpeciaTitleTime * nOldPlayerRate)
		Var.days = Var.days or {}
		set_d_val(sysarg,7,1);
		Var.RiChangRenWuIndex=taskIndex
		Var.RiChangRenWuFlag=0
		Var.RiChangRenWuFinish=0
		Actor.addExp(sysarg,rewardExp)
		Actor.addInnerExp(sysarg,rewardInnerExp)
		Var.days = Var.days or {}
		
		--广播日常除魔
		if Var.days.KoRccmTime ==nil then 
			Var.days.KoRccmTime = 1 
		elseif Var.days.KoRccmTime<=9 then 
			Var.days.KoRccmTime = 1 + Var.days.KoRccmTime 
			if Var.days.KoRccmTime==10 then 
				local tishi = string.format("<(n%s)>玩家完成了每日的战无双任务,得到大量提升,再这样坚持下去必定超神.",Actor.getName(sysarg))
				System.broadcastTipmsg(tishi,128)
			end
		end
	
		--活跃度
		OnFinish_Liveness(sysarg,5)
	
		Quest_ShuaXin(sysarg)
		
		--把之前的任务数据清空
		Var.RiChangRenWuType = nil --任务类型
		Var.RiChangRenWuIndex = nil --任务index（进行着这类任务中的第几个）
		--return t.main2(sysarg)
		
		--新添加的战无双任务
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		local ta = task_all[get_taskflags_val(sysarg)]
		--local taskTable2 = {102,106,110,113}
		local taskTable2 = {93,96,99,101,103,105,107,109}
		local zhanwushuangT = 0
		
		for i=1,#taskTable2 do 
			if get_taskflags_val(sysarg)== taskTable2[i] then --已经提前完成了战无双任务
				zhanwushuangT =1
				--自动过任务
				local taNext = task_all[get_taskflags_val(sysarg)+1]
				set_taskflags_val(sysarg,taskTable2[i]+1)
				
				if taNext ~= nil then
					if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
						Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
					elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
						Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
					end
				end
				Quest_ShuaXin(sysarg)
				break
			end
		end
		
		if get_taskflags_val(sysarg)== 65 then --已经提前完成了战无双任务
			Actor.autoFindPathToNpc( sysarg, ta.mapid, ta.npcname);
		end
		
		
		
		if pLv >=72 then 
			if zhanwushuangT==0 then 
				return t.main(sysarg)
			end
		end
	else
		Actor.sendTipmsg(sysarg, "您的任务条件还没有完成，请完成了再来", 256)
		--Quest_ShuaXin(sysarg)
		--return t.main2(sysarg)	
		if pLv >=72 then 
			return t.main(sysarg)
		end
	end
	
end

--点亮星星
t.dlxx = function(sysarg,idx)

	--local nowVar =get_taskflags_val(sysarg)
	--local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	--if nowVar == 61 and ta.type == 4 and sVar.nowNumberOfStep ==2 then   --需要改的now
	--	sVar.nowNumberOfStep=3
	--	Actor.openarrowsguide(sysarg, 1005, 120, 416, 2);
	--	Actor.addTimer(sysarg,20,60*1000)
    --end
	
	
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if pLv < 50 then return "50级后再来找我吧."; end
	
	if get_taskflags_val(sysarg)==nil or get_taskflags_val(sysarg)<64 then 
		return " 小伙子你还年轻，耐心跟着主线任务走，到时候我们自然会相见"
	end
	
	if get_d_val(sysarg,7) >= 10 then
		Actor.sendTipmsg(sysarg, "已经满了,不用再刷了!", 256);
		return;
	end

	if not idx then return; end
	idx = tonumber(idx);
	if idx < 1 or idx > 4 then return; end
	local MaxExp = math.floor(Actor.getIntProperty(sysarg,PROP_ACTOR_MAX_EXP) / 10);
	local MaxExpS = 0
	local innerExpS =0
	local Var = Actor.getStaticVar(sysarg)
	
	local MaxExp = t[Var.RiChangRenWuIndex].Exp
	local innerExp =t[Var.RiChangRenWuIndex].innerExp
	
	if Var.RiChangRenWuIndex~=nil then 
		MaxExp = t[Var.RiChangRenWuIndex].Exp
		innerExp = t[Var.RiChangRenWuIndex].innerExp
	end

	local nSdm = math.floor(MaxExp * 20 / 30000);
	local nSsj = 18000;

	MaxExpS =  MaxExp * get_d_val(sysarg,7)
	innerExpS = innerExp * get_d_val(sysarg,7)
	local nNengLiang = 0;
	local nYuanBao = 0;
	if idx == 1 then nNengLiang = nSsj; end
	if idx == 2 then nNengLiang = nSdm; end
	--if idx == 3 then nYuanBao = nSsj*10; end
	--if idx == 4 then nYuanBao = nSdm; end
	if idx == 3 then nYuanBao = 9; end
	if idx == 4 then nYuanBao = 9; end

	if idx == 1 or idx == 2 then

		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= nNengLiang then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= nNengLiang then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,刷新失败..",nNengLiang), 256);
			return ;
		end

		if idx == 1 then
			Actor.changeMoney(sysarg, MC, -nNengLiang, 2605, "金币刷星");
			
			
			if sVar.shuaxinStar ==nil then 
				sVar.shuaxinStar = 0
			end
			sVar.shuaxinStar = sVar.shuaxinStar+1
			local var = Actor.getStaticVar(sysarg)
			if var.days.firstTimeFreshen == nil then  --角色每天首次刷新，必定10星
				var.days.firstTimeFreshen = 1 
				set_d_val(sysarg,7,10)
			elseif(sVar.shuaxinStar<3) then --第三次刷新必出10星，只限于当前面板未关闭，如果关闭再次打开，则重新计算。
				local a = math.random(1,100);
				if a >= 70 then
					set_d_val(sysarg,7,math.random(2,10));
				else
					set_d_val(sysarg,7,math.random(2,10));
				end
			else 
				set_d_val(sysarg,7,10);
			end
		end
		if idx == 2 then
			Actor.changeMoney(sysarg, MC, -nNengLiang, 2605, "金币刷10星");
			set_d_val(sysarg,7,10);
		end
	end
	if idx == 3 or idx == 4 then
		if Actor.getMoneyCount(sysarg,3) < nYuanBao then
			Actor.sendTipmsg(sysarg, string.format("您的元宝不足 <%s> ,刷新失败.",nYuanBao), 256);
			return;
		end
		if idx == 3 then
			Actor.changeMoney(sysarg,3,-nYuanBao,2605,"元宝刷10星");
			--local a = math.random(1,100);
			--if a >= 10 then
			--	set_d_val(sysarg,7,math.random(1,10));
			--else
			--	set_d_val(sysarg,7,math.random(1,9));
			--end
			set_d_val(sysarg,7,10)
		end
		if idx == 4 then
			Actor.changeMoney(sysarg,3,-nYuanBao,2605,"元宝刷10星");
			set_d_val(sysarg,7,10);
		end
	end
	Actor.sendTipmsg(sysarg, string.format("恭喜您成功刷新到 <%s> 星任务奖励",get_d_val(sysarg,7)), 256);
	return t.main2(sysarg);
end

--继续任务
t.rcQianWangRenWuScene=function(sysarg)
	Actor.deleteTimer(sysarg,47)
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if nowVar == 64 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=2
		--Actor.openarrowsguide(sysarg, 1005, 130, 306, 2);
		--Actor.addTimer(sysarg,20,60*1000)
		MasterStokeAcceptTask(sysarg,ta.npcid)	
    end
	

	local Var = Actor.getStaticVar(sysarg)
	local mapname =""
	local mapId = 0
	if Var.RiChangRenWuType==0 then --任务类型0，按继续任务
		mapId = t[Var.RiChangRenWuIndex].mapId
		mapname = Fuben.getSceneNameById(mapId)
	elseif  Var.RiChangRenWuType==1 then --任务类型1，按继续任务
		mapId = t.kuangshi[1].mapId
		mapname = Fuben.getSceneNameById(mapId)
	elseif  Var.RiChangRenWuType==2 then --任务类型2，按继续任务
		Actor.autoFindPathToNpc( sysarg, t.findNpc[Var.RiChangRenWuIndex].mapId, t.findNpc[Var.RiChangRenWuIndex].npcName);
		Quest_ShuaXin(sysarg)
		return 
	end
	--System.telportSceneDefaultPoint(sysarg,mapname);
	
	
	--散人殿堂的地图需要特殊处理，分流
	if mapId==99 then 
		if GetNpcANYINMIDIAN().IsMaxActor(99) ==false then  
			mapId =99
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene2.sceneId2) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene2.sceneId2[5]
			end
		end
	elseif mapId ==100 then 
		if GetNpcANYINMIDIAN().IsMaxActor(100) ==false then  
			mapId =100
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene3.sceneId3) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene3.sceneId3[5]
			end
		end
	elseif mapId ==98 then 
		if GetNpcANYINMIDIAN().IsMaxActor(98) ==false then  
			mapId =98
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene1.sceneId1) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene1.sceneId1[5]
			end
		end
		
	end	
	
	
	--随机传送
	if t[Var.RiChangRenWuIndex].x==0 and t[Var.RiChangRenWuIndex].y == 0 then 
		local h=0
		local w=0
		local times=0
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapId,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times <10000 then 
			System.telportScene(sysarg,	mapId, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,mapname)
		end
	else 
		System.telportScene(sysarg,	mapId, t[Var.RiChangRenWuIndex].x, t[Var.RiChangRenWuIndex].y)
	end
	
	Actor.addTimer(sysarg,25,1000)
	
	--local nowVar =get_taskflags_val(sysarg)
	--local ta = task_all[nowVar]
	--local sVar = Actor.getDyanmicVar(sysarg)
	--if nowVar == 61 and ta.type == 4 and sVar.nowNumberOfStep ==3 then   --需要改的now
	--	sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
	--	MasterStokeAcceptTask(sysarg,ta.npcid)	
	--	return
	--end
	
end

--接受任务
t.rcJieShouRenWu = function(sysarg)
	Actor.deleteTimer(sysarg,47)
	local Var = Actor.getStaticVar(sysarg)
	if Var.RiChangRenWuFlag==1 then --禁止点两次接受任务
		return 
	end
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if nowVar == 64 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=2
		--Actor.openarrowsguide(sysarg, 1005, 130, 306, 2);
		--Actor.addTimer(sysarg,20,60*1000)
		MasterStokeAcceptTask(sysarg,ta.npcid)	
    end
	
	if get_d_val(sysarg,2) < 1 then Actor.sendTipmsg(sysarg, "您今天的降妖除魔任务次数已经用完了,明天再来吧.\\\\<或是点击购买任务次数吧>", 4); return t.main2(sysarg) end
	
	del_d_val(sysarg,2,1)
	Var.RiChangRenWuFlag=1--接受了任务
	Var.RiChangRenWuKillMonsters=0

	local Var = Actor.getStaticVar(sysarg)
	local mapname =""
	local mapId = 0
	if Var.RiChangRenWuType==0 then   --任务类型0，按接受任务
		--Var.RiChangRenWuIndex=t.index--保存接受了哪个任务
		mapId = t[Var.RiChangRenWuIndex].mapId
		mapname = Fuben.getSceneNameById(mapId)
	elseif  Var.RiChangRenWuType==1 then --任务类型1，按接受任务
		mapId = t.kuangshi[Var.RiChangRenWuIndex].mapId
		mapname = Fuben.getSceneNameById(mapId)
	elseif  Var.RiChangRenWuType==2 then --任务类型2，按接受任务 
		Actor.autoFindPathToNpc( sysarg, t.findNpc[Var.RiChangRenWuIndex].mapId, t.findNpc[Var.RiChangRenWuIndex].npcName);
		Quest_ShuaXin(sysarg)
		return 
	end
	--System.telportSceneDefaultPoint(sysarg,mapname)
	
	--散人殿堂的地图需要特殊处理，分流
	if mapId==99 then 
		if GetNpcANYINMIDIAN().IsMaxActor(99) ==false then  
			mapId =99
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene2.sceneId2) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene2.sceneId2[5]
			end
		end
	elseif mapId ==100 then 
		if GetNpcANYINMIDIAN().IsMaxActor(100) ==false then  
			mapId =100
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene3.sceneId3) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene3.sceneId3[5]
			end
		end
	elseif mapId ==98 then 
		if GetNpcANYINMIDIAN().IsMaxActor(98) ==false then  
			mapId =98
		else 
			local haveenter = false 
			for i,v in pairs(GetNpcANYINMIDIAN().data.scene1.sceneId1) do 
				if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
					mapId=v
					haveenter =true
					break
				end
			end
			if haveenter ==false then 
				mapId=GetNpcANYINMIDIAN().data.scene1.sceneId1[5]
			end
		end
	end	
	
	--随机传送
	if t[Var.RiChangRenWuIndex].x==0 and t[Var.RiChangRenWuIndex].y == 0 then 
		local h=0
		local w=0
		local times=0
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapId,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times <10000 then 
			System.telportScene(sysarg,	mapId, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,mapname)
		end
	else 
		System.telportScene(sysarg,	mapId, t[Var.RiChangRenWuIndex].x, t[Var.RiChangRenWuIndex].y)
	end
	
	
	--检测，一开始需要收集的物品已经够了。
	--local var = Actor.getStaticVar(sysarg)
	--if var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 1 then --日常除魔收集矿石
	--	local itemId = t.kuangshi[var.RiChangRenWuIndex].needItem  
	--	local itemCount = Actor.getItemCount(sysarg,itemId)
	--	if itemCount>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
	--		var.RiChangRenWuFinish = 1
	--	else 
	--		var.RiChangRenWuFinish = 0
	--	end
	--	
	--	--if var.days.kuangshi_RCCM ==nil then 
	--	--	var.days.kuangshi_RCCM ={}
	--	--end
	--	--if var.days.kuangshi_RCCM[itemId]==nil then 
	--	--	var.days.kuangshi_RCCM[itemId] = 0 
	--	--end
	--	--if var.days.kuangshi_RCCM[itemId]>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
	--	--	var.RiChangRenWuFinish = 1
	--	--else 
	--	--	var.RiChangRenWuFinish = 0
	--	--end
	--	Quest_ShuaXin(sysarg)
	--end
	
	Actor.addTimer(sysarg,25,2*1000)
	
	Quest_ShuaXin(sysarg)
	return t.main2(sysarg)
end


--把任务栏显示的表 和 Npc的表同步
MakeTheConfigSame = function()
	for i=1,17 do 
		rc_chumo[i]={}
		rc_chumo[i].mapId=t[i].mapId
		rc_chumo[i].monsterId=t[i].monsterId
		rc_chumo[i].monsterNum=t[i].monsterNum
	end

	rc_chumo.kuangshi ={}
	for i=1,#t.kuangshi do 
		rc_chumo.kuangshi[i] ={}
		rc_chumo.kuangshi[i].needItem = t.kuangshi[i].needItem
		rc_chumo.kuangshi[i].name = t.kuangshi[i].name
		rc_chumo.kuangshi[i].needcount = t.kuangshi[i].needcount
		rc_chumo.kuangshi[i].mapId = t.kuangshi[i].mapId
	end
	
	rc_chumo.findNpc = {}
	for i=1,#t.findNpc do
		rc_chumo.findNpc[i] ={}
		rc_chumo.findNpc[i].mapId = t.findNpc[i].mapId
		rc_chumo.findNpc[i].npcName = t.findNpc[i].npcName
		rc_chumo.findNpc[i].x = t.findNpc[i].x
		rc_chumo.findNpc[i].y = t.findNpc[i].y
	end
end
MakeTheConfigSame()




------------------------------------------------------------------------------------
function SpecialQuest_RiChangChuMoShi_GetTitle(sysarg, QuestId, Title)end

function SpecialQuest_RiChangChuMoShi_CanQuest(sysarg, qid, args)
	--local level = t.Str.enterSence[1].minlv;
	--return Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) >= level;
	return true;
end

function SpecialQuest_RiChangChuMoShi_CanFinish(sysarg, qid, args) 
	return true; 
end

function RegisterSpecialQuest_RiChangChuMoShi()
	local funcs = {
		{SpecialQuest_RiChangChuMoShi_GetTitle, nil},
		{SpecialQuest_RiChangChuMoShi_CanQuest, nil}, 
		{SpecialQuest_RiChangChuMoShi_CanFinish, nil},
		};
	RegisterSpecialQuestFunc(5000,funcs);
end

function WoLongNPC(sysarg)
	System.telportScene(sysarg,9,151,134);
	Actor.addTimer(sysarg, 15, 1000);
end

function HuSong(sysarg)
	local config = t.Str
	if not config then return end
	Actor.enterScene(sysarg,config.NpcMapId,config.HuSongNpcPos[1],config.HuSongNpcPos[2])
end

RegisterSpecialQuest_RiChangChuMoShi();
function GetNpcRiChangChuMo() return t end