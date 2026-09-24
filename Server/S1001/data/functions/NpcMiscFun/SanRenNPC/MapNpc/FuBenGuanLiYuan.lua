--#include "data\functions\SpecialTitle.lua" once --特权
--副本管理员248
local t = {
	data = {
		[1] = {s = "[护 符]", lv = 65, mapname = "护符副本", fbid = 19, var = 20,hah = "护符碎片", num = 10000, n3 = 30000, id = 18}, --数量,双倍数量,资源图片的id
		[2] = {s = "[护 盾]", lv = 65, mapname = "护盾副本", fbid = 20, var = 21,hah = "护盾碎片", num = 10000, n3 = 30000, id = 16},
		[3] = {s = "[宝 石]", lv = 65, mapname = "宝石副本", fbid = 21, var = 22,hah = "宝石结晶", num = 800, n3 = 2400, id = 15},
		[4] = {s = "[圣 珠]", lv = 65, mapname = "圣珠副本", fbid = 22, var = 23,hah = "圣珠结晶", num = 800, n3 = 2400, id = 20},
		[5] = {s = "[强 化]", lv = 65, mapname = "强化副本", fbid = 23, var = 24,hah = "强化石", num = 80, n3 = 240, id = 10},
		[6] = {s = "[翅 膀]", lv = 65, mapname = "羽毛副本", fbid = 24, var = 25,hah = "羽毛", num = 80, n3 = 240, id = 11},
		[7] = {s = "[军 印]", lv = 65, mapname = "功勋副本", fbid = 25, var = 32,hah = "功勋令牌", num = 2500, n3 = 7500, id = 13},
		[8] = {s = "[斗 笠]", lv = 65, mapname = "斗笠副本", fbid = 26, var = 40,hah = "斗笠精华", num = 80000, n3 = 240000, id = 133},
		[9] = {s = "[修 真]", lv = 80, mapname = "修真副本", fbid = 188, var = 42,hah = "内丹", num = 40, n3 = 120, id = 136},
		[10] = {s = "[坐 骑]", lv = 80, mapname = "坐骑副本", fbid = 189, var = 44,hah = "坐骑丹", num = 5, n3 = 15, id = 142},
		[11] = {s = "[血 炼]", lv = 80, mapname = "血炼副本", fbid = 205, var = 46,hah = "血炼精华", num = 50, n3 = 150, id = 143},
		[12] = {s = "[戒 灵]", lv = 80, mapname = "戒灵副本", fbid = 207, var = 48,hah = "戒灵粉尘", num = 500, n3 = 1500, id = 144},
	},
}

t.detailedlook = function(sysarg)
    Actor.openDialogs(sysarg,187)

end

t.main = function(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local nowVar =get_taskflags_val(sysarg)
	--local ta = task_all[nowVar]
	--if nowVar == 95 and ta.type == 4 then   --需要改的now
	--	local sVar = Actor.getDyanmicVar(sysarg)
	--	sVar.nowNumberOfStep=1
	--	Actor.openarrowsguide(sysarg, 1005, 307, 175, 1);
	--	Actor.addTimer(sysarg,20,30*1000)
	--end
	--if nowVar == 96 and ta.type == 4 then   --需要改的now
	--	local sVar = Actor.getDyanmicVar(sysarg)
	--	sVar.nowNumberOfStep=1
	--	Actor.openarrowsguide(sysarg, 1005, 307, 237, 1);
	--	Actor.addTimer(sysarg,20,30*1000)
	--end 

    -- <(c0xFFdac220)每天最多购买2次(功勋副本除外),98元宝/次.>
    -- <(c0xFFdac220)完成副本后可花费168元宝领取三倍奖励.>
  --<(inpcTalkImg#9#70#20)>  <(idecoLine#315)>
	if pLv < 65 then return "<(c0xFFb6946c)65级后再来找我吧.>"; end
	local echo = [[
<(c0xFFdac220)黄铜特权:><(c0xFFb6946c)一键领取> <(c0xFFdac220)白银特权:><(c0xFFb6946c)3倍领取享8折优惠><查看特权/@detailedlook>
  <(inpcTalkImg#10#70#20)> <(c0xFFb6946c)副本次数每天0点刷新.> 
<(idecoLine#315)>
]]

	--特殊处理，var44是跨天之后再赋值的，有的玩家在更新之前就已经跨天了。。-----------
	local avar = Actor.getStaticVar(sysarg);
	if get_d_val(sysarg,44) == 0 and avar.enterFu44 ==nil then --进过一次的，不能再给补偿
		set_d_val(sysarg,44,1)
		avar.enterFu44=1
	end
	
	
	local avar = Actor.getStaticVar(sysarg);
	if get_d_val(sysarg,46) == 0 and avar.enterFu46 ==nil then --进过一次的，不能再给补偿
		set_d_val(sysarg,46,1)
		avar.enterFu46=1
	end
	
	
	local avar = Actor.getStaticVar(sysarg);
	if get_d_val(sysarg,48) == 0 and avar.enterFu48 ==nil then --进过一次的，不能再给补偿
		set_d_val(sysarg,48,2)
		avar.enterFu48=1
	end
	
	-----------------------------------------------
	
	local td = t.data;
	for i = 1, #td do
		if i~=5 then --把强化石的副本屏蔽
			if i~= 8 or i==8 and System.getDaysSinceOpenServer()>=3 then 
				local s = td[i].s;
				local lv = td[i].lv;
				local mn = td[i].mapname;
				local vr = td[i].var;
				local hah = td[i].hah;
				local id = td[i].id;
				local num = td[i].num;
				local n3 = td[i].n3;
				local str = "<%s/@rpfb,%s|&afc5fb&每次做完奖励:##lbt(iaward~%s)rbt &ff9625&%s%s点##&afc5fb&领取&ff9625&3倍&afc5fb&奖励每次需要&ff9625&238元宝(白银特权玩家享受8折)&afc5fb&获得&ff9625&%s%s点>";
				if i==12 then 
					str = "<%s/@rpfb,%s|&afc5fb&每次做完奖励:##lbt(iaward~%s)rbt &ff9625&%s%s点##&afc5fb&领取&ff9625&3倍&afc5fb&奖励每次需要&ff9625&288元宝(白银特权玩家享受8折)&afc5fb&获得&ff9625&%s%s点>";
				end
				
				local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
				if i~=11 or (i==11 and nCircle>=3 )then 
					local nTimes = get_d_val(sysarg,vr)
					local enterBtn = string.format(str,"进入",i,id,hah,num,hah,n3)
					local buyBtn = "<(c0xFF888888)购买>"
					if nTimes <= 0 then
						enterBtn = "<(c0xFF888888)进入>"
					end
					if i ~= 7 then
						local canBuy = get_d_val(sysarg,vr+6) < 2 and vr~=22 and vr~=40 and vr~=42 and vr~=44 and vr~=46 and vr~=48 or vr==22 and get_d_val(sysarg,13) < 2 or vr==40 and get_d_val(sysarg,39)< 2 or vr==42 and get_d_val(sysarg,41)< 2 or vr==44 and get_d_val(sysarg,43)< 2 or vr==46 and get_d_val(sysarg,45)< 1 or vr==48 and get_d_val(sysarg,47)< 2
						if canBuy then
							buyBtn = "<购买/@buyfbcs,%s|每天最多购买2次#购买需要98元宝>";
							if i==9 then 
								buyBtn = "<购买/@buyfbcs,%s|每天最多购买2次#购买需要168元宝>";
							elseif i==10 then 
								buyBtn = "<购买/@buyfbcs,%s|每天最多购买2次#购买需要128元宝>";
							elseif i==11 then 
								buyBtn = "<购买/@buyfbcs,%s|每天最多购买1次#购买需要168元宝>";
							elseif i==12 then 
								buyBtn = "<购买/@buyfbcs,%s|每天最多购买2次#购买需要168元宝>";
							end
							buyBtn = string.format(buyBtn,i)
						end
					end
					echo = echo .. string.format("    <(c0xFFdac220)%s>  <(c0xFFb6946c)%s级>  %s %s <一键/@yijianwancheng,%s|黄铜特权玩家可使用一键完成副本功能> <(c0xFFb6946c)余:><(c0xFFeabc78)%s>\\\\",s, lv, enterBtn, buyBtn, i, nTimes);
				end
			end
		end
	end
    








    -- <进入护符副本/@rpfb,1> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,20)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,1|每天最多购买2次#购买需要220元宝>

    -- <进入护盾副本/@rpfb,2> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,21)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,2|每天最多购买2次#购买需要220元宝>

    -- <进入宝石副本/@rpfb,3> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,22)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,3|每天最多购买2次#购买需要220元宝>

    -- <进入圣珠副本/@rpfb,4> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,23)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,4|每天最多购买2次#购买需要220元宝>

    -- <进入强化副本/@rpfb,5> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,24)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,5|每天最多购买2次#购买需要220元宝>

    -- <进入羽毛副本/@rpfb,6> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,25)..[[> <(c0xFF705e45)/ 2> <购买次数/@buyfbcs,6|每天最多购买2次#购买需要220元宝>

    -- <进入功勋副本/@rpfb,7> <(c0xFF705e45)今天剩余进入次数:> <(c0xFFeabc78)]]..get_d_val(sysarg,32)..[[> <(c0xFF705e45)/ 1>


	return echo;
end

--黄铜特权，一键完成
t.yijianwancheng =function(sysarg,index)

	index = tonumber(index)
	if index<1 or index>#t.data then 
		System.trace("非法参数-一键完成。"..Actor.getName(sysarg))
		return 
	end
	
	local Times = get_d_val(sysarg,t.data[index].var)
	if Times <=0 then 
		Actor.sendTipmsg(sysarg,"当前副本剩余次数为0，无法使用一键完成",ttFlyTip)
		return
	end
	
	--黄铜特权
	if IsSpeciaTitleVip(sysarg,1)==true then 
		----改一个新的窗口进行一键完成
		----local okBtn = string.format("%s/yijianwancheng1_sureFun,%s", "领取奖励",index)
		----local okBtn2 = string.format("%s/yijianwancheng2_sureFun,%s", "领取3倍奖励",index)
		--策划要求分成情况，把总价算出来。
		--分三种情况
		--(剩下1次)
		--(剩下2次，2次都够钱)
		--(剩下2次，一次够钱，一次不够)
		if Times ==1 then 
			local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetYiJianWanChengBox)
			DataPack.writeByte(netPack,index)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
			----Actor.messageBox(sysarg, 0, 0, "\\请选择一种一键完成的方式\\\\领取<3倍>奖励需要消耗<238元宝>\\\\白银特权玩家享受<8>折特惠,也就是只需要<190元宝>即可领取<3倍>奖励\\", okBtn, okBtn2, NULL)
		else 
			--if Actor.getMoneyCount(sysarg,3) < Times*190 then 
			--	Actor.messageBox(sysarg, 0, 0, "\\请选择一种一键完成的方式\\\\领取<3倍>奖励需要消耗<238元宝>\\\\白银特权玩家享受<8>折特惠,也就是只需要<190元宝>即可领取<3倍>奖励\\", okBtn, okBtn2, NULL)
			--else 
				local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetYiJianWanChengBox)
				DataPack.writeByte(netPack,index)
				DataPack.writeByte(netPack,2)
				DataPack.flush(netPack)
				----Actor.messageBox(sysarg, 0, 0, "\\请选择一种一键完成的方式\\\\领取<3倍>奖励需要消耗<476元宝>\\\\白银特权玩家享受<8>折特惠,也就是只需要<380元宝>即可领取<3倍>奖励\\", okBtn, okBtn2, NULL)
			--end
		end
	else
		Actor.sendTipmsg(sysarg, "您没有拥有黄铜特权,不能使用一键完成功能!\\点击屏幕左上角<特权>即可查看特权相关信息", ttFlyTip)
	end
end
function yijianwancheng1_sureFun(sysarg,index)
	--print("index="..index)
	index=tonumber(index)
	
	if index<1 or index>#t.data then 
		System.trace("非法参数-一键完成。"..Actor.getName(sysarg))
		return 
	end
	
	local param={}
    local nCount = 1
	table.insert(param,""..index)
	table.insert(param,tostring(nCount))
	table.insert(param,"rc_fb")
	table.insert(param,"oneKey") -- 一键完成
   
	local Times = get_d_val(sysarg,t.data[index].var)
	if Times <=0 or Times < nCount then 
		Actor.sendTipmsg(sysarg,"当前副本剩余次数为0，无法使用一键完成",ttFlyTip)
        return
	end
    for i = 1,Times do
        GetbranchAward(sysarg,param)
    end

	System.sendCommonLog(LogIds.yijianwancheng,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,t.data[index].s.."免费")
	
	Actor.npcTalkByNameEx(sysarg,"副本管理员")
end

function yijianwancheng2_sureFun(sysarg,index)
	index=tonumber(index)
	
	if index<1 or index>#t.data then 
		System.trace("非法参数-一键完成。"..Actor.getName(sysarg))
		return 
	end

	local param={}
    local nCount = 2
	table.insert(param,""..index)
	table.insert(param,tostring(nCount))
	table.insert(param,"rc_fb")
	table.insert(param,"oneKey") -- 一键完成
	
	local Times = get_d_val(sysarg,t.data[index].var)
	
	if Times <=0  then 
		Actor.sendTipmsg(sysarg,"当前副本剩余次数为0，无法使用一键完成",ttFlyTip)
        return
	end
	
	--记录
	System.sendCommonLog(LogIds.yijianwancheng,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,t.data[index].s.."3倍")
	
    for i = 1,Times do
         GetbranchAward(sysarg,param)
    end

	Actor.npcTalkByNameEx(sysarg,"副本管理员")
end

t.buyfbcs = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	if not t.data[idx] then return; end
	local f = t.data[idx];
	local var = f.var;

	-- 计算今日已购买次数和上限
	local boughtCount = 0
	local maxBuy = 2
	if var == 22 then
		boughtCount = get_d_val(sysarg, 13)
	elseif var == 40 then
		boughtCount = get_d_val(sysarg, 39)
	elseif var == 42 then
		boughtCount = get_d_val(sysarg, 41)
	elseif var == 44 then
		boughtCount = get_d_val(sysarg, 43)
	elseif var == 46 then
		boughtCount = get_d_val(sysarg, 45)
		maxBuy = 1
	elseif var == 48 then
		boughtCount = get_d_val(sysarg, 47)
	else
		boughtCount = get_d_val(sysarg, var + 6)
	end

	local canBuyCount = maxBuy - boughtCount
	if canBuyCount <= 0 then
		Actor.sendTipmsg(sysarg, "本副本今日购买次数已达上限.", 4)
		return
	end

	-- 计算单次价格
	local singlePrice = 98
	if var == 42 or var == 46 or var == 48 then
		singlePrice = 168
	elseif var == 44 then
		singlePrice = 128
	end

	local totalCost = singlePrice * canBuyCount
	if Actor.getMoneyCount(sysarg, 3) < totalCost then
		Actor.sendTipmsg(sysarg, string.format("元宝不足，需要 <%s> 元宝购买剩余 %s 次.", totalCost, canBuyCount), 4)
		return
	end

	local fubenName = "护符副本"
	if idx == 1 then
		fubenName = "护符副本"
	elseif idx == 2 then
		fubenName = "护盾副本"
	elseif idx == 3 then
		fubenName = "宝石副本"
	elseif idx == 4 then
		fubenName = "圣珠副本"
	elseif idx == 5 then
		fubenName = "强化副本"
	elseif idx == 6 then
		fubenName = "羽毛副本"
	elseif idx == 8 then
		fubenName = "斗笠副本"
	elseif idx == 9 then
		fubenName = "修真副本"
	elseif idx == 10 then
		fubenName = "坐骑副本"
	elseif idx == 11 then
		fubenName = "血练副本"
	elseif idx == 12 then
		fubenName = "戒灵副本"
	end

	Actor.changeMoney(sysarg, 3, -totalCost, 2125, "购买" .. fubenName .. "次数")
	add_d_val(sysarg, var, canBuyCount)

	if var == 22 then
		add_d_val(sysarg, 13, canBuyCount)
	elseif var == 40 then
		add_d_val(sysarg, 39, canBuyCount)
	elseif var == 42 then
		add_d_val(sysarg, 41, canBuyCount)
	elseif var == 44 then
		add_d_val(sysarg, 43, canBuyCount)
	elseif var == 46 then
		add_d_val(sysarg, 45, canBuyCount)
	elseif var == 48 then
		add_d_val(sysarg, 47, canBuyCount)
	else
		add_d_val(sysarg, var + 6, canBuyCount)
	end
	return t.main(sysarg)
end

t.rpfb = function(sysarg,idx)

		-- local nowVar =get_taskflags_val(sysarg)
		-- local ta = task_all[nowVar]
		-- local sVar = Actor.getDyanmicVar(sysarg)
		-- 	if nowVar == 94 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		-- 		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		-- 		MasterStokeAcceptTask(sysarg,ta.npcid)	
		-- 	end

		-- 	if nowVar == 96 and ta.type == 4 and sVar.nowNumberOfStep ==1 then   --需要改的now
		-- 		sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
		-- 		MasterStokeAcceptTask(sysarg,ta.npcid)	
		-- 	end


	if not idx then return; end
	idx = tonumber(idx);
	if not t.data[idx] then return; end
	local f = t.data[idx];
	local fbid = f.fbid;
	local var = f.var;
	--if get_d_val(sysarg,var) < 1 and not (get_taskflags_val(sysarg)== 95 and idx==1 )then Actor.sendTipmsg(sysarg,"副本次数不足,请购买次数或明天再来.",256); return; end	--领取奖励时扣除次数
	if get_d_val(sysarg,var) < 1 then Actor.sendTipmsg(sysarg,"副本次数不足,请购买次数或明天再来.",256); return; end	--领取奖励时扣除次数
	local Hfuben = Fuben.createFuBen(fbid)  --1:表示副本ID
	if Hfuben == 0 then return end
	
	if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return false end  --从NPC那将玩家传进副本
	--Actor.openguajiGuide(sysarg,1)--自动挂机
	
	local fbptr = Fuben.getFubenPtr(Hfuben)
	local leftSecond = Fuben.getFbTime(fbptr)
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.FubenBoshu = 1
	
	Actor.addTimer(sysarg,21,3000)
	
	OnEnterFuben(sysarg,idx,leftSecond)
	
	local var = Actor.getDyanmicVar(sysarg) --标记副本没有完成
	var.onFcailiaoFB=0
	
	-------------
	-- 更新副本数据
	--local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sUpdateFubenData)
	--DataPack.writeByte(netPack, fbid) -- 第1个参数为副本ID
	--DataPack.writeUInt(netPack, leftSecond) -- 第2个参数为副本剩余时间
	--DataPack.flush(netPack)
	-------------
end

---------------------------------------------------------------------------
function GetNpcFuBenGuanLiYuan() return t end