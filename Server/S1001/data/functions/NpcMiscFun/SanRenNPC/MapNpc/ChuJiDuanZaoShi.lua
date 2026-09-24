--#include "data\functions\VipRecovery.lua" once
local t = {}
--此NPC暂时无用, 2017/1/5 zer 废弃

t.hsdata = {	--起始ID,结束ID,回收绑金,回收金币
[1]={1,12,1,0,'青铜套装'},  --矿洞套装
[2]={13,21,2,0,'白银套装'},  --虫洞套装
[3]={22,30,5,0,'黄金套装'},  --羊窟套装
[4]={31,39,10,0,'白金套装'},  --猪洞套装
[5]={40,48,20,0,'钻石套装'},  --寺庙套装
[6]={49,57,50,0,'王者套装'},  --蛮荒套装


[7]={319,327,100,0,'热血套装'},  --散人+0
[8]={328,336,200,0,'热血①套'},  --散人+1
[9]={337,345,400,0,'热血②套'},  --散人+2
[10]={346,354,800,0,'热血③套'},  --散人+3
[11]={355,363,1600,0,'热血④套'},  --散人+4
[12]={364,372,3200,0,'热血⑤套'},  --散人+5
[13]={394,402,6400,0,'热血⑥套'},  --散人+6
[14]={403,411,12800,0,'热血⑦套'},  --散人+7
[15]={412,420,25600,0,'热血⑧套'},  --散人+8
[16]={421,429,51200,0,'热血⑨套'},  --散人+9
[17]={430,438,102400,102400,'霸主套装'},  --霸主套装
[18]={439,447,204800,204800,'通天套装'},  --傲视套装
[19]={448,456,409600,409600,'毁灭套装'},  --毁灭套装
[20]={577,585,819200,819200,'奔雷套装'},  --奔雷套装
[21]={586,594,1638400,1638400,'雷神套装'},  --雷神套装
[22]={595,603,3276800,3276800,'至尊套装'},  --至尊套装
	};

t.main = function(sysarg)
	local sVar = Actor.getDyanmicVar(sysarg)--任务箭头
	sVar.nowNumberOfStep =0 
    return t.VipRecoveryInit(sysarg)
end

t.shsall = function(sysarg,a,b)
if not a then a,b = 1,6; end
	a,b = tonumber(a),tonumber(b);
	local hsdata = t.hsdata;
	local nBagItemCount = {};
	local nGold1 = {};
	local nGold2 = {};
	for i = a,b do
			if not nBagItemCount[i] then nBagItemCount[i] = 0; end
			if not nGold1[i] then nGold1[i] = 0; end
			if not nGold2[i] then nGold2[i] = 0; end
			local c,d = hsdata[i][1],hsdata[i][2]
			for k = c,d do
				local n = Actor.getItemCount(sysarg,k);
				Actor.removeItem(sysarg,k,n,-1,-1,-1);
				nBagItemCount[i] = nBagItemCount[i] + n;
				nGold1[i] = nGold1[i] + n * hsdata[i][3]
				nGold2[i] = nGold2[i] + n * hsdata[i][4]
			end
	end
	local nAllCount = 0;
	local nAllGold1 = 0;
	local nAllGold2 = 0;
	for i = a,b do
		nAllCount = nAllCount + nBagItemCount[i];
		nAllGold1 = nAllGold1 + nGold1[i];
		nAllGold2 = nAllGold2 + nGold2[i];
	end
	if nAllCount > 0 then
		Actor.changeMoney(sysarg,0,nAllGold1,100,"回收装备得钱");
		Actor.changeMoney(sysarg,1,nAllGold2,100,"回收装备得钱");
		--Actor.sendTipmsg(sysarg,string.format("<(c0xFFd4ab6f)回收%s件装备,绑金＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),金币＋><(c0xFF00ff00)%s>",nAllCount,nAllGold1,nAllGold2),128+256);
	else
		Actor.sendTipmsg(sysarg,"您包裹内没有可回收的装备.",256);
	end
	local mid = Actor.getSceneId(sysarg);
	--if mid ~= 1 then
	--	-- if nAllCount > 0 then
	--	-- 	local NpcName = Actor.getTalkNpcName(sysarg);
	--	-- 	local StrNpcE = string.format("<%s/M炎龙城:127:127:%s><(x炎龙城:127:127:%s)>",NpcName,NpcName,NpcName);
	--	-- 	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s回收装备获得了绑金＋<(c0xFF00ff00)%s>,金币＋<(c0xFF00ff00)%s>.", Actor.getName(sysarg), StrNpcE, nAllGold1,nAllGold2),128);
	--	-- end
	--	return t.main(sysarg);
	--else
	--	Actor.closearrowsguide(sysarg,1005);
	--end
end





t.VipRecoveryInit = function(sysarg)
    local echo = "";
    local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep ==0 then   --需要改的now
		sVar.nowNumberOfStep=1
		Actor.openarrowsguide(sysarg, 1005, 11, 91, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

   	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep == 4 then   --需要改的now
		sVar.nowNumberOfStep=5 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 8, 360, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep ==0 then   --需要改的now
		sVar.nowNumberOfStep=1
		Actor.openarrowsguide(sysarg, 1005, 11, 91, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	   	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep == 4 then   --需要改的now
		sVar.nowNumberOfStep=5 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 8, 360, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep ==0 then   --需要改的now
		sVar.nowNumberOfStep=1
		Actor.openarrowsguide(sysarg, 1005, 11, 91, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep == 4 then   --需要改的now
		sVar.nowNumberOfStep=5 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 8, 360, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end


	
-- 	echo = echo ..[[

--   <(c0xFFff9000)第一步: 特色存放> <(c0xFFb6946c)一键存入包裹内所有热血类装备>
--   <快速存放包裹内所有热血类装备/@VipRecoveryInit_chucun|点击后自动储存在专属纯装备仓库内#vip2玩家可享受随身回收以及合成#vip5玩家每天0点-7点挂机时自动存储热血类装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)特殊步: VIP特权> <(c0xFFb6946c)赞助游戏研发的回报>

--   <(c0xFFc1bdb7)vip2玩家可享受包裹内随身回收以及合成>
--   <(c0xFFc1bdb7)vip5玩家每天0点-7点挂机会自动存储热血装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)第二步: 一键合成> <(c0xFFb6946c)热血套合成,采用2合1规则,来试试吧>
--   <点击合成高级热血装备/@Page2|用多余低级装备来合成高级装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)第三步: 随意换取> <(c0xFFb6946c)存个戒指进去,取件衣服出来~>

-- ]]
-- 	for i = 7,16 do
-- 		k = i - 6;
-- 		if i==9 or i==12 or i==15 then
-- 			--if get_d_val(sysarg,99 + k) ==0 then 
-- 				--echo = echo .. string.format(" 	<(c0xFF888888)%s(%s件)>", t.hsdata[i][5], get_d_val(sysarg,99 + k), i).."\\\\"
-- 			--else 
-- 				echo = echo .. string.format("  <%s(%s件)/@VipRecoveryInit_tiqu,%s|可以任意取出此类套装内任何一个部件>", t.hsdata[i][5], get_d_val(sysarg,99 + k), i).."\\\\"
-- 			--end
-- 		else
-- 			--if get_d_val(sysarg,99 + k) ==0 then 
-- 				--echo = echo .. string.format(" 	<(c0xFF888888)%s(%s件)>", t.hsdata[i][5], get_d_val(sysarg,99 + k), i)
-- 			--else 
-- 				echo = echo .. string.format("  <%s(%s件)/@VipRecoveryInit_tiqu,%s|可以任意取出此类套装内任何一个部件>", t.hsdata[i][5], get_d_val(sysarg,99 + k), i)
-- 			--end
-- 		end
-- 	end



	echo = echo ..[[

  <(c0xFFff9000)合成装备:>

    <合成热血两仪套/@onZBHC,1>  <合成热血三才套/@onZBHC,2>  <合成热血四象套/@onZBHC,3>

    <合成热血五行套/@onZBHC,4>  <合成热血六合套/@onZBHC,5>  <合成热血七星套/@onZBHC,6>

    <合成热血八荒套/@onZBHC,7>  <合成热血九宫套/@onZBHC,8>  <合成热血十方套/@onZBHC,9>

<(idecoLine#330)>

  <(c0xFFff9000)简单说明:>

  <(c0xFFb6946c)1.  存  →  将您包裹内的装备存入到NPC仓库中>

  <(c0xFFb6946c)2.  取  →  将NPC仓库中的装备取出1件到包裹中>

  <(c0xFFb6946c)3. 合成 →  将NPC仓库中的低级装备合成为高级装备>

  <(c0xFFeabc78)4. VIP5玩家在每天的0点到7点之间会自动储存热血类装备>

  <(c0xFFeabc78)5. VIP2可在包裹的VIP特权按钮进行随身储存、合成、回收>
]]
    return echo
end

t.onZBHC = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx)+7;
	local d = t.hsdata[idx];
	local e = "\\  <(c0xFFb6946c)请选择您要操作的装备:>\\\\";
	for i = d[1],d[2] do
		local str = "";
		if idx ~= 16 then
			str = string.format("<合成/@onZBHC_HCGJ,%s,%s|合成1件 [%s] 到已存NPC仓库中#合成每次需要消耗 200 绑定或金币的手续费#可以到下页面内随时提取出来>", i, idx, Item.getItemName(i+9));
		end
		e = e .. string.format("  %s <存/@onZBHC_ChuCun,%s,%s|将您包裹内的此件装备存入到NPC仓库中> <取/@onZBHC_QuChu,%s,%s|将NPC仓库中的此件装备取出1件到包裹中> %s <(c0xFFb6946c)已存数量:> <%s>\\\\", Item.getItemLinkMsg(i), i, idx, i, idx, str, get_r_val(sysarg,i));
	end
	return e .. "  <返回/@main>";
end
t.onZBHC_ChuCun = function(sysarg,i,idx)
	if not i then return; end
	if not idx then return; end
	idx = tonumber(idx)-7;
	i = tonumber(i);
	if Actor.getItemCount(sysarg,i) > 0 then
		Actor.removeItem(sysarg,i,1,-1,-1,-1);
		add_r_val(sysarg,i,1);
	else
		Actor.sendTipmsg(sysarg, string.format("您的包裹内没有 <%s> ,储存失败.",Item.getItemName(i)), 256);
	end
	return t.onZBHC(sysarg,idx);
end
t.onZBHC_QuChu = function(sysarg,i,idx)
	if not i then return; end
	if not idx then return; end
	idx = tonumber(idx)-7;
	i = tonumber(i);
	if get_r_val(sysarg,i) >= 1 then
		del_r_val(sysarg,i,1);
		Actor.addItem(sysarg, i, 0, 0, 1,0,"duanzao strong",1);
	else
		Actor.sendTipmsg(sysarg, string.format("您的NPC仓库内没有 <%s> ,取出失败.",Item.getItemName(i)), 256);
	end
	return t.onZBHC(sysarg,idx);
end
t.onZBHC_HCGJ = function(sysarg,i,idx)
	if not i then return; end
	if not idx then return; end
	idx = tonumber(idx)-7;
	i = tonumber(i);
	if get_r_val(sysarg,i) >= 2 then
		local del_ngold = 200;
		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
			return ;
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,101,"合成装备扣钱");
		del_r_val(sysarg,i,2);
		add_r_val(sysarg,i+9,1);
		Actor.sendTipmsg(sysarg, string.format("合成 <%s> 成功,已经添加到NPC仓库内,可以到下页查看.",Item.getItemName(i+9)), 256);
	else
		Actor.sendTipmsg(sysarg, string.format("您的NPC仓库内没有 <2> 件 <%s> ,合成失败.",Item.getItemName(i)), 256);
	end
	return t.onZBHC(sysarg,idx);
end







t.VipRecoveryInit_chucun = function(sysarg)
   --return VipRecoveryInit_chucun(sysarg,i)
   local nowVar =get_taskflags_val(sysarg)
   local ta = task_all[nowVar]
   local sVar = Actor.getDyanmicVar(sysarg)
   if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=2
		Actor.openarrowsguide(sysarg, 1005, 22, 270, 2);
		Actor.addTimer(sysarg,20,30*1000)
   end

   local nowVar =get_taskflags_val(sysarg)
   local ta = task_all[nowVar]
   local sVar = Actor.getDyanmicVar(sysarg)
   if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=2
		Actor.openarrowsguide(sysarg, 1005, 22, 270, 2);
		Actor.addTimer(sysarg,20,30*1000)
   end

   local nowVar =get_taskflags_val(sysarg)
   local ta = task_all[nowVar]
   local sVar = Actor.getDyanmicVar(sysarg)
   if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		sVar.nowNumberOfStep=2
		Actor.openarrowsguide(sysarg, 1005, 22, 270, 2);
		Actor.addTimer(sysarg,20,30*1000)
   end
	
   for i = 7,16 do
		k = i - 6;
		local a,b = HuiShouData[i][1],HuiShouData[i][2];
      
		for i = a,b do
			local n = Actor.getItemCount(sysarg,i);
            if n > 0 then
                Actor.removeItem(sysarg,i,n,-1,-1,-1);
			    add_d_val(sysarg, 99 + k, n);
            end
			
		end
	end
	return  t.VipRecoveryInit(sysarg)
end




t.VipRecoveryInit_tiqu = function(sysarg,i)

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep == 5 then   --需要改的now
		sVar.nowNumberOfStep=6 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 30, 110, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep == 5 then   --需要改的now
		sVar.nowNumberOfStep=6 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 30, 110, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep == 5 then   --需要改的now
		sVar.nowNumberOfStep=6 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg,  1005, 30, 110, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end


	if not i then return; end
	i = tonumber(i);

	local e = string.format("\\  <(c0xFFff9000)随意换取> <(c0xFFb6946c)此类装备库存:> <(c0xFF06ff00)".. get_d_val(sysarg, i-6+99) .."><(c0xFFb6946c)件>\\\\");
	for k = HuiShouData[i][1],HuiShouData[i][2] do
		e = e .. string.format("  <点击取出1件/@VipRecoveryInit_tiqu_on,%s,%s> %s \\\\",  i, k ,Item.getItemLinkMsg(k));
	end
	e = e .. "                                          <返回上页/@VipRecoveryInit>";
	return e;
end

t.VipRecoveryInit_tiqu_on = function(sysarg,i,k)

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep == 6 then   --需要改的now
		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		MasterStokeAcceptTask(sysarg,ta.npcid)
		return

	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep == 6 then   --需要改的now
		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		MasterStokeAcceptTask(sysarg,ta.npcid)
		return
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep == 6 then   --需要改的now
		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		MasterStokeAcceptTask(sysarg,ta.npcid)
		return
	end

	if not i then return; end
	if not k then return; end
	i = tonumber(i);
	k = tonumber(k);
	local val = i - 6 + 99;
	if Item.getBagEmptyGridCount(sysarg)>0 then 
		if get_d_val(sysarg, val) >= 1 then
			del_d_val(sysarg, val, 1);
			Actor.addItem(sysarg, k, 0, 0, 1,0,0,"duanzao give",1);
		else
			Actor.sendTipmsg(sysarg,"您没有可提取的此类装备.",256);
		end
		return t.VipRecoveryInit_tiqu(sysarg,i);
	else 
		Actor.sendTipmsg(sysarg,"您的背包空间不足.",256);
	end
end



--     return VipRecoveryInit_tiqu(sysarg,i)
-- end

-- t.VipRecoveryInit_huishou = function(sysarg,k,u)
--     VipRecoveryInit_huishou(sysarg,k,u)
--     return t.VipRecoveryInit(sysarg)
-- end

t.Page2 =function(sysarg)
		
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep ==2 then   --需要改的now
		sVar.nowNumberOfStep=3
		Actor.openarrowsguide(sysarg, 1005, 16, 244, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep ==2 then   --需要改的now
		sVar.nowNumberOfStep=3
		Actor.openarrowsguide(sysarg, 1005, 16, 244, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end
	
	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep ==2 then   --需要改的now
		sVar.nowNumberOfStep=3
		Actor.openarrowsguide(sysarg, 1005, 16, 244, 2);
		Actor.addTimer(sysarg,20,30*1000)
	end

	local echo = "";
	echo = echo ..[[

  <(c0xFFff9000)一键合成:>

  <(c0xFFb6946c)1.><(c0xFFb6946c)鼠标移动到需要合成的按钮上显示详细信息>
  <(c0xFFb6946c)2.><(c0xFFb6946c)每次合成所需200绑金或金币,成功几率为100%>
  <(c0xFFb6946c)3.><(c0xFFb6946c)只要库存装备数量大于2时,便可合成更高级的装备>
  <(c0xFFb6946c)4.><(c0xFFb6946c)拥有了高级装备数时,在提取服务中兑换你满意的部件>

<(idecoLine#330)>

]]
	local sGoldstr = {};
	local sNeedGold = {};
	for i = 7,15 do
		k = i - 6;
		sNeedGold[i] = string.format("&ffffff&所需&ff0000&%s&ffffff&2件,当前库存&ff0000&%s&ffffff&件,每次合成所需 &ff0000&%s&ffffff& 金币#(优先扣除绑定金币,绑定金币不足则扣金币)", HuiShouData[i][5], get_d_val(sysarg,99 + k), 200);
		local str1="\\\\"
		if i==9 or i==12 or i== 15 then 
			--if t.checkIsCanCompound(sysarg,k+1)==1 then 
				echo = echo .. string.format("  <合成[%s]/@VipRecoveryInit_hc,%s|%s>",t.hsdata[i+1][5], k+1, sNeedGold[i])..str1
			--else 
				--echo = echo .. string.format("    <(c0xFF888888)合成(%s)>",t.hsdata[i+1][5])..str1
			--end
		else 
			--if t.checkIsCanCompound(sysarg,k+1)==1 then 
				echo = echo .. string.format("  <合成[%s]/@VipRecoveryInit_hc,%s|%s>",t.hsdata[i+1][5], k+1, sNeedGold[i]);
			--else 
				--echo = echo .. string.format("    <(c0xFF888888)合成(%s)>",t.hsdata[i+1][5]);
			--end

		end


	end
	echo = echo .. "  <(c0xFFff9000)更高级的装备请去找高级锻造师,我水平有限> \\\\";
	echo = echo .."<(idecoLine#330)>\\\\                                          <返回上层/@VipRecoveryInit>"
    return echo
end



--是否可以合成
--t.checkIsCanCompound=function(sysarg,i)
--	local val = 99 + i;
--	if get_d_val(sysarg, val-1) >= 2 then
--		local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
--		local del_ngold = a * 200;
--		local MC = 2;
--		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
--		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
--		if MC == 2 then
--			return 0
--		end
--	else 
--		return 0
--	end
--	return 1
--end

t.VipRecoveryInit_hc = function(sysarg,i)

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep == 3 then   --需要改的now
		sVar.nowNumberOfStep=4 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 226, 429, 2);
		Actor.addTimer(sysarg,20,30*1000)	
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 115 and ta.type == 4 and sVar.nowNumberOfStep == 3 then   --需要改的now
		sVar.nowNumberOfStep=4 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 226, 429, 2);	
		Actor.addTimer(sysarg,20,30*1000)
	end

	local nowVar =get_taskflags_val(sysarg)
	local ta = task_all[nowVar]
	local sVar = Actor.getDyanmicVar(sysarg)
	if  ta~=nil and nowVar == 119 and ta.type == 4 and sVar.nowNumberOfStep == 3 then   --需要改的now
		sVar.nowNumberOfStep=4 --计算点击引导步骤用的
		Actor.openarrowsguide(sysarg, 1005, 226, 429, 2);	
		Actor.addTimer(sysarg,20,30*1000)
	end


if not i then return; end
	i = tonumber(i);
	local val = 99 + i;
	if get_d_val(sysarg, val-1) >= 2 then
		--local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
		local a = 1;
		local del_ngold = a * 200;
		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
			return ;
		end
		Actor.changeMoney(sysarg, MC, -del_ngold,101,"合成装备扣钱");
		del_d_val(sysarg, val-1, a*2);
		add_d_val(sysarg, val, a);
		Actor.sendTipmsg(sysarg,"恭喜您合成了 <"..a.."> 件装备.",256+1);
		OnFinish_Liveness(sysarg,20)
	else
		Actor.sendTipmsg(sysarg,"没有可合成的装备.(合成所需要的装备数量大于2)",256);
	end

	return t.Page2(sysarg);
end


-- t.VipRecoveryInit_Auto = function(sysarg,itemId)
--     return VipRecoveryInit_Auto(sysarg,itemId)
-- end

-- t.VipRecoveryInit_Equip = function(sysarg,isNpc)
--     return VipRecoveryInit_Equip(sysarg,isNpc)
-- end

--t.VipRecoveryInit_chucun = function (sysarg)
--	    local nowVar =get_taskflags_val(sysarg)
--		local ta = task_all[nowVar]
--		local sVar = Actor.getDyanmicVar(sysarg)
--			if nowVar == 80 and ta.type == 4 and sVar.nowNumberOfStep == 1 then   --需要改的now
--				sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
--				MasterStokeAcceptTask(sysarg,ta.npcid)	
--			end
--
--
--
--     VipRecoveryInit_chucun(sysarg)
--    return t.VipRecoveryInit(sysarg)
--end

t.VipRecoveryInit1 = function(sysarg)
    return VipRecoveryInit1(sysarg)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function GetNpcChuJiDuanZaoShi() return t end