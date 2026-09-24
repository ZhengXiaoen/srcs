
SpecialQuestFuncs = {}

--#include "data\config\quest\BranchTaskCfg.lua" once
--#include "data\functions\FuBenNpcFunc\NewFubenFunc.lua" once
--#include "data\functions\ActorFlags.lua" once
--#include "data\config\quest\CircleQuest.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\BuyRiChang.lua" once	2016/12/26 zer 移动更新
--#include "data\functions\StdTask.lua" once
--#include "data\functions\Systems\ActivitySystem\FuBen.lua" once
--#include "data\config\activity\FuBenAward.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\JunTuanGuanLiYuan.lua" once
--#include "data\config\vocation\VocationConfig.lua" once
--#include "data\config\fuben\emoling.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ShenMiZhiDian.lua" once
--#include "data\functions\Systems\Miscs\WindowFunc.lua" once
--#include "data\functions\SpecialTitle.lua" once --特权
--#include "data\functions\guildOperate\GuildXiangYaoChuMo_Cfg.lua" once --行会除魔
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\config\guild\GuildFubenBossCfg.lua" once
--日常除魔显示的表，在npc战无双处"MakeTheConfigSame"同步
rc_chumo = {

}


-- local funcs = { {GetTitle, args}, {CanQuest, args}, {CanFinish, args}, {GetAward, args} }
function RegisterSpecialQuestFunc(qid, funcs)
	SpecialQuestFuncs[qid] = funcs
end

------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--//每日捐献排行数据初始化和刷新
function RefreshJXRankS()
	-- local GLOBSL_var = System.getStaticVar();
	-- local GLOBSL_Rank = GLOBSL_var.Rank;
	-- if GLOBSL_Rank == nil then GLOBSL_var.Rank = {}; GLOBSL_Rank = GLOBSL_var.Rank; end

	-- local nYear,nMonth,nDay = System.getDate(0,0,0);
	-- local Today = tonumber(nYear..nMonth..nDay);

	-- for i = 1,10 do
	-- 	if GLOBSL_Rank[i] == nil then
	-- 		GLOBSL_Rank[i] = "";
	-- 		GLOBSL_Rank[i+10] = 0;
	-- 	end
	-- end

	-- if GLOBSL_Rank[99] ~= Today then
	-- 	for i = 1,10 do
	-- 		local Fplayer = Actor.getActorPtrByName(Rank[i]);
	-- 		if Fplayer then
	-- 			Actor.delBuff(Fplayer,12,203);
	-- 			Actor.delBuff(Fplayer,16,203);
	-- 			Actor.delBuff(Fplayer,20,203);
	-- 		end
	-- 		GLOBSL_Rank[i] = "";
	-- 		GLOBSL_Rank[i+10] = 0;
	-- 	end
	-- 	GLOBSL_Rank[99] = Today;
	-- end


end

--//膜拜城主所得的存储
function RefreshSKRankS()
	-- local var = System.getStaticVar();
	-- local KingVar = var.KingVar;
	-- if KingVar == nil then var.KingVar = {};KingVar = var.KingVar; end
	
	-- local nYear,nMonth,nDay = System.getDate(0,0,0);
	-- local Today = tonumber(nYear..nMonth..nDay);

	-- for i = 1,9 do
	-- 	if KingVar[i] == nil then
	-- 		KingVar[i] = 0;
	-- 	end
	-- end
	-- if KingVar[10] ~= Today then
	-- 	KingVar[1] = 0;	--膜拜城主人数
	-- 	KingVar[4] = 0;
	-- 	KingVar[10] = Today;
	-- end

end

--每日充值排行数据初始化和刷新
function RefreshEYRankS()
	-- local var = System.getStaticVar();
	-- local cRank = var.cRank;
	-- if cRank == nil then var.cRank = {}; cRank = var.cRank; end

	-- local nYear,nMonth,nDay = System.getDate(0,0,0);
	-- local Today = tonumber(nYear..nMonth..nDay);

	-- for i = 1,10 do
	-- 	if cRank[i] == nil then
	-- 		cRank[i] = "";
	-- 		cRank[i+10] = 0;
	-- 	end
	-- 	if cRank[i+20] == nil then
	-- 		cRank[i+20] = "";
	-- 		cRank[i+30] = 0;
	-- 	end
	-- end

	-- if cRank[99] ~= Today then
	-- 	for i = 1,10 do
	-- 		cRank[i+20] = cRank[i];
	-- 		cRank[i+30] = cRank[i+10];
	-- 	end
	-- 	for i = 1,10 do
	-- 		cRank[i] = "";
	-- 		cRank[i+10] = 0;
	-- 	end
	-- 	cRank[99] = Today;
	-- end
end



-------------------------------------------------------------------------------------------------
--刷新每日变量(登录和0点调用)
function RefreshActorZero(sysarg)
	local dMeiRiShuaXin = {
		{2,10},	--日常任务,降妖除魔,每天赠送次数
		--3 记录地图
		--4 记录杀怪数
		--5 记录杀怪需求数
		--6 记录任务经验
		--7 记录星数
		--8 成长武器的杀怪值记录(散人传说已用,慎重)
		{9,0}, --每日清零能量点
		{10,0}, --日常任务降妖除魔每天可购买5次
		{11,0},	--每天散人殿堂进入次数刷新,每天1次免费
		--12 荒古定时器记录用

		{20,2},	--护符副本每日次数
		{21,2},	--护盾副本每日次数
		{22,2},	--宝石副本每日次数
		{23,2}, --圣珠副本每日次数
		{24,2}, --强化副本每日次数
		{25,2}, --羽毛副本每日次数
		{26,0},	--上面6副本每天可购买2次上限清零
		{27,0},	--上面6副本每天可购买2次上限清零
		
		{13,0},	--上面6副本每天可购买2次上限清零  （13）
		
		{29,0},	--上面6副本每天可购买2次上限清零
		{30,0},	--上面6副本每天可购买2次上限清零
		{31,0},	--上面6副本每天可购买2次上限清零
		{32,1}, --功勋副本每日次数
        {33,1}, --每日膜拜城主次数
        {34,60}, --BOSS之家1层每日进入时间
        {35,60}, --BOSS之家2层每日进入时间
        {36,60}, --BOSS之家3层每日进入时间
        {37,3}, --每日押镖刷新次数
			
		--
		--{38,2}, --斗笠副本每日次数,别的什么地方用了，取没有写在这里
		{39,0}, --斗笠副本每天可购买2次上限清零
		{40,2},  --斗笠副本每日次数,别的什么地方用了，取没有写在这里
		
		
		{41,0}, --修真副本每天可购买2次上限清零
		{42,1},  --修真副本每日次数,
		
		{43,0}, --坐骑副本每天可购买2次上限清零
		{44,1},  --坐骑副本每日次数,
		
		{45,0}, --血练副本每天可购买1次上限清零
		{46,1},  --血练副本每日次数,
		
		
		{47,0}, --戒灵副本每天可购买2次上限清零
		{48,2},  --戒灵副本每日次数,
		
		
		--注意，这种初始化不为0的，考虑更新前，玩家已经跨天的情况，需要做特殊处理的。。。
		
		--
		--100 ~ 116 VIP纯装备仓库 废弃
		--110 军衔等级记录
		{111,0}, --军团军衔 时光印记属性记录
		{112,0}, --军团军衔 屠魔印记属性记录
		{113,0}, --军团军衔 财神印记属性记录
		{114,0}, --军团军衔 掠夺印记属性记录
		{115,0}, --军团军衔 土豪印记属性记录

		--116 BOSS积分
		--117 首充武器杀怪数记录
		--119~129 做VIP自动回收用了
		--130 主线隐藏任务
		{150,0}, --军团福利
		{151,0}, --军团福利
		{152,0}, --军团福利
		{153,0}, --军团福利
		{154,0}, --军团福利
		{155,0}, --军团福利
		{156,0}, --军团福利
		{157,0}, --军团福利
		--198特殊药品使用间隔
		--199做寻宝次数记录
	};	

	--//取到今天的日期(年月日)
	local nYear,nMonth,nDay = System.getDate(0,0,0);
	local Today = tonumber(nYear..nMonth..nDay);

	--//读取私人变量d
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;
	-- local l = var.l
	
	--//初始化私人变量d
	if d == nil then var.d = {}; d = var.d; end

	--//初始化私人变量d1~200,初始值为0
	for i = 1,dMeiRiShuaXin[#dMeiRiShuaXin][1] do if d[i] == nil then d[i] = 0; end end

    local function RefreshZiYuanZhuiHui(sysarg)
        local var = Actor.getStaticVar(sysarg);
        local d = var.d;
        --跨天资源找回保存
		if var.ziYuanXunHui ==nil then 
			var.ziYuanXunHui ={}
		end
		var.ziYuanXunHui[1]=d[2] --战无双
		var.ziYuanXunHui[2]=d[20] --护符副本
		var.ziYuanXunHui[3]=d[21] --护盾副本
		var.ziYuanXunHui[4]=d[22] --宝石副本
		var.ziYuanXunHui[5]=d[23] --圣珠副本
		var.ziYuanXunHui[6]=d[25] --羽毛副本
		var.ziYuanXunHui[7]=d[32] --功勋副本
		if System.getDaysSinceOpenServer()<4 then 	
			var.ziYuanXunHui[8]=0
		else 
			var.ziYuanXunHui[8]=d[40] --斗笠副本
		end
		

    end
	--//刷新每日变量信息
	if d[1] ~= Today then
		
		RefreshZiYuanZhuiHui(sysarg)
	
		for i = 1,#dMeiRiShuaXin do
			local d_var = d[dMeiRiShuaXin[i][1]]
			if d_var ~= nil and (d_var < dMeiRiShuaXin[i][2] or dMeiRiShuaXin[i][2] == 0) then
				d[dMeiRiShuaXin[i][1]] = dMeiRiShuaXin[i][2];
			end
		end
		ShuaXinFengHao(sysarg);

		
        --跨了二天-给满
        if var.ziYuanLastTime2 == nil then
            var.ziYuanLastTime2 = System.getToday()
        end
		
        if System.getCurrMiniTime() - var.ziYuanLastTime2 > 86400*2 then
            --跨越了二天，给满
            RefreshZiYuanZhuiHui(sysarg)
        end
      
		d[1] = Today;
        var.ziYuanLastTime2 = System.getToday()

		--散人传说 每在线10秒自动回收装备设置
		Actor.addTimer(sysarg, 27, 10000);
	end



	-- --//刷新佣兵封号
	-- local Gv = Actor.getIntProperty(sysarg,PROP_ACTOR_MERCENA_LEVEL);
	-- if Gv > 0 then ShuaXinFengHao(sysarg); end

	-- --//刷新任务
	-- --Quest_ShuaXin(sysarg,5000,nil,d[3],d[7],d[8],d[6]);
	-- --Quest_ShuaXin(sysarg,5001,nil,d[13],d[24],d[15],d[14]);
	-- --Quest_ShuaXin(sysarg,5002,nil,d[30],"百草园",d[32],20);

	-- --//王城城主上线给予1.1倍攻击BUFF
	-- local KingId = Guild.getSbkCityOwner();
	-- local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID);
	-- local JOB = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	-- local LX = 12; if JOB == 2 then LX = 16; elseif JOB == 3 then LX = 20; end
	-- local LastKingId = Guild.getLastSbkOwnerId()
	-- if LastKingId == ActorId then
	-- 	Actor.delBuff(sysarg,LX,206)
	-- end
	-- if KingId == ActorId then
	-- 	Actor.addBuff(sysarg,LX,206,0.1,1,36000,"王城城主(只计算装备属性)",false,0,0,0,0,69);
	-- end
end

-------------------------------------------------------------------------------------------------
--//封号
function ShuaXinFengHao(sysarg)

	--跨服服务器不要显示封号
	if System.isCrossServer() ==true then
		return 
	end

	local str = "";
	str = str .. get_jtname(sysarg);
	Actor.setFontTitle(sysarg,str);
end



-------------------------------------------------------------------------------------------------

--刷新全服BUFF 天下第一的
function RefreshDonationNumOneBUFF(sysarg)
	-- local var = System.getStaticVar();
	-- local Tx = var.Tx;
	-- local idx = 1;
	-- local Name = Actor.getName(sysarg);
	-- local JOB = 1;
	-- local LX = 12;

	-- for i = 1,6 do
	-- 	idx = i * 10 - 10 + 1;
	-- 	if Tx[idx] == Name then
	-- 		local Nplayer = Actor.getActorPtrByName(Tx[idx]);
	-- 		if Nplayer then
	-- 			local JOB = Actor.getIntProperty(Nplayer,PROP_ACTOR_VOCATION);
	-- 			if JOB == 1 then LX = 12; end
	-- 			if JOB == 2 then LX = 16; end
	-- 			if JOB == 3 then LX = 20; end
	-- 			Actor.setTopTitle(Nplayer,JOB,true);
	-- 			Actor.addBuff(Nplayer,LX,204,0.1,1,36000,"天下第一(只计算装备属性)",false,0,0,0,0,69);
	-- 		end
	-- 	end
	-- end
end
-------------------------------------------------------------------------------------------------
function Giveback(sysarg)
--	local security = {1,2,5,9};
--	local mid = Actor.getSceneId(sysarg);
--	for i = 1,#security do
--		if mid == security[i] then
--			return;
--		end
--	end
--	local BagCount = Item.getBagEmptyGridCount(sysarg);
--	if BagCount < 1 then return; end
--	if Actor.getItemCount(sysarg,314,-1,-1,-1) >= 1 then return; end
--	Actor.addItem(sysarg,314,0,0,1,1);
end

---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<支线全局方法开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---
function getBranchAwardResult(sysarg,nIndex)
	if BranchTaskConfig[tonumber(nIndex)].btnLink ~= nil then
		local netPack = DataPack.allocPacket(sysarg, 139,152)
		DataPack.writeString(netPack,BranchTaskConfig[tonumber(nIndex)].btnLink)
		DataPack.flush(netPack)
	end
end

--获取支线任务奖励
function getBranchTaskAward(sysarg,index)
	----print(index)
		
	if index == 100 then -- 日常经验珠
		if DayQuest_ExpJade(sysarg) == true then
			Quest_ShuaXin(sysarg)
		end		
		return	
	elseif index == 101 then -- 日常经验珠弹窗
		DayQuest_ExpJadeWndTip(sysarg)
		return
	elseif index == 102 then --购买降妖除魔
		Buy_XiangYaoChuMoWndTip(sysarg)
		return
	elseif index == 103 then --购买领取皇杠
		Buy_HuangGangWndTip(sysarg)
		return
	elseif index == 104 then --购买采集珍珠
		Buy_CaiJiZhenZhuWndTip(sysarg)
		return
	elseif index == 105 then -- 一键全部完成
		CircleQuestFastFinishMsgBox(sysarg)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX)
	local awards = {}
	BranchTaskConditionCheck(sysarg,index)
	if var.BranchTaskComplete == nil then
		Actor.sendTipmsg(sysarg,"请先完成任务",ttFlyTip)
		--还未完成
		return
	end
	if var.BranchTaskComplete[index] == nil or var.BranchTaskComplete[index] == 0 then
		Actor.sendTipmsg(sysarg,"请先完成任务",ttFlyTip)
		--还未完成
		return
	end 
	if var.BranchTaskComplete[index] == 2 then
		Actor.sendTipmsg(sysarg,"你已经领取过",ttFlyTip)
		--已经领取过
		return
	end
	if var.BranchTaskComplete[index] == 1 then
		if BranchTaskConfig[index] then

			for i=1,table.getn(BranchTaskConfig[index].Award) do
				if BranchTaskConfig[index].Award[i].sex == nil or BranchTaskConfig[index].Award[i].sex == nSex then
					if BranchTaskConfig[index].Award[i].job == nil or BranchTaskConfig[index].Award[i].job == nJob then	
						table.insert(awards,BranchTaskConfig[index].Award[i])
					end
				end
			end
			if not Awards.CheckBagGridCount(sysarg,awards) then
				return	
			end
			
			var.BranchTaskComplete[index] = 2
			Awards.Give(sysarg,awards,2300,tostring(index))
			System.broadcastTipmsg(string.format(BranchTaskConfig[index].broadcastDesc,Actor.getName(sysarg)),2048)
			if BranchTaskConfig[index].ttwindowDesc ~= nil then
				local btn1 = "我要前往/getBranchAwardResult,"..index
				Actor.messageBox(sysarg,0,0,BranchTaskConfig[index].ttwindowDesc, btn1, "", "", 0)	
			end
			Quest_ShuaXin(sysarg)
		end
	end
end

-- --支线任务条件判断
function BranchTaskConditionCheck(sysarg,index)
	local var = Actor.getStaticVar(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	if BranchTaskConfig[index] == nil then
		--还未完成
		return false
	end

	if pLv < BranchTaskConfig[index].needLevel then
		return false
	end

	if var.BranchTaskComplete == nil then
		var.BranchTaskComplete = {}
	end

	--已经领取或者已经监测过
	if var.BranchTaskComplete[index] and var.BranchTaskComplete[index] >= 1 then
		return true
	end

	if BranchTaskConfig[index].condition then
		local nCount
		local nType = BranchTaskConfig[index].condition.type
		if nType == 1 then  ---击杀未知暗殿boss
			if var.BranchTaskillMonsterCount and var.BranchTaskillMonsterCount >= BranchTaskConfig[index].condition.params[1][1] then
				var.BranchTaskComplete[index] = 1
				var.BranchTaskKillMonsterStart = nil --暂停杀怪监听
				Actor.openquestarrowsguide(sysarg,"领奖");
				return true
			end
			return false,'<(c0xFFFFF0000)('..var.BranchTaskillMonsterCount..'/'..BranchTaskConfig[index].condition.params[1][1]..')>'
		elseif nType == 2 then --身上是否有对应装备
			nCount = Actor.GetEquipCountByLevel(sysarg,BranchTaskConfig[index].condition.params[1][1])
			if nCount >= BranchTaskConfig[index].condition.params[2][1] then
				var.BranchTaskComplete[index] = 1
				Actor.openquestarrowsguide(sysarg,"领奖");
				return true
			end
			return false,'<(c0xFFFFF0000)('..nCount..'/'..BranchTaskConfig[index].condition.params[2][1]..')>'
		elseif nType == 3 then --身上是否有x件强化+x的装备
			nCount = Item.getStrongEquipNumByStrong(sysarg,BranchTaskConfig[index].condition.params[1][1])
			if nCount >= BranchTaskConfig[index].condition.params[2][1] then
				var.BranchTaskComplete[index] = 1
				Actor.openquestarrowsguide(sysarg,"领奖")
				return true
			end
			return false,'<(c0xFFFFF0000)('..nCount..'/'..BranchTaskConfig[index].condition.params[2][1]..')>'
		elseif nType == 4 then --等级是否大于XX
			if pLv >= BranchTaskConfig[index].condition.params[1][1] then
				var.BranchTaskComplete[index] = 1
				Actor.openquestarrowsguide(sysarg,"领奖")
				return true
			end
			return false,''
		elseif nType == 5 then --转生装备数量大于XX
			nCount = Actor.GetEquipCountByCircle(sysarg,BranchTaskConfig[index].condition.params[1][1])
			if nCount >= BranchTaskConfig[index].condition.params[2][1] then
				var.BranchTaskComplete[index] = 1
				Actor.openquestarrowsguide(sysarg,"领奖");
				return true
			end
			return false,'<(c0xFFFFF0000)('..nCount..'/'..BranchTaskConfig[index].condition.params[2][1]..')>'
		elseif nType == 6 then --是否有行会
			--当前行会ID
			local guildId = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
			if guildId ~= 0 then
				var.BranchTaskComplete[index] = 1
				Actor.openquestarrowsguide(sysarg,"领奖");
				return true
			end
			return false
		end
	end
	return false 
end
-- --需要注册支线事件
function registerBranchEvent(sysarg,index)
	local var = Actor.getStaticVar(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);

	if BranchTaskConfig[index] == nil then
		return 
	end

	if var.BranchTaskEvent == nil then
		var.BranchTaskEvent = {}
	end

	if pLv < BranchTaskConfig[index].needLevel then
		return
	end
	
	if BranchTaskConfig[index].condition then
		local nType = BranchTaskConfig[index].condition.type
		if nType == 1 then  ---击杀未知暗殿boss
			var.BranchTaskKillMonsterStart = 1
			var.BranchTaskKillMonsterScene = BranchTaskConfig[index].condition.params[2][1]
			var.BranchTaskillMonsterLimit = {}
			var.BranchTaskillMonsterCount = 0  --- 这个需商义
			for i=1,#BranchTaskConfig[index].condition.params[3] do
				var.BranchTaskillMonsterLimit[i] = BranchTaskConfig[index].condition.params[3][i]
			end
		end
		var.BranchTaskEvent[index] = 1
	end
	BranchTaskConditionCheck(sysarg,index)
end

---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<支线全局方法完>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---
--主线获取经验优先级
function MainQuestPriority(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local var = Actor.getStaticVar(sysarg)
	local d = var.d

	--降妖除魔
	if pLv >= 52 then
		return 1,'<降妖除魔/M比奇城:128:101:炎龙使者> <(x比奇城:128:101:炎龙使者)>'
	end

	--采集珍珠
	if pLv >= 59 and d[31] >= 0 then
		return 2,'<采集珍珠/M比奇城:143:180:采珠农女> <(x比奇城:143:180:采珠农女)>'
	end

	--护送任务
	if pLv >= 70 and var.days.darttms <= 3 then
		return 3,'<护送镖车/M比奇城:191:118:军需官> <(x比奇城:191:118:军需官)>'
	end

	--副本任务 55级副本
	local leftTimes = get_fb_left_times(sysarg, 3)
	if pLv >= 55 and leftTimes > 0 then
		return 4,'<经验副本/M比奇城:175:173:副本总管> <(x比奇城:175:173:副本总管)>'
	end

	--副本任务 60级副本
	leftTimes = get_fb_left_times(sysarg, 5)
	if pLv >= 60 and leftTimes > 0 then
		return 5,'<经验副本/M比奇城:175:173:副本总管> <(x比奇城:175:173:副本总管)>'
	end

	--屠魔殿引导
	if pLv >= 69 then 
		return 6,'<屠魔将军/M比奇城:146:184:屠魔将军> <(x比奇城:146:184:屠魔将军)>'
	end
	--实在所有任务都完成了话 引导去挂机了  累。
	return 7,'<安全挂机/M比奇城:171:166:挂机休闲> <(x比奇城:171:166:挂机休闲)>'
end
---------------------------------------------------------------------------

function Buy_RiChangChuMo(sysarg)

	local needn = 200000;
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= needn then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= needn then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s,购买失败..",needn),256);
		return ;
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
	
end
      --[[ 	/*
	* Comments: 创建一个引导者
	* Param short nId 引导者索引
	* Param LPCTSTR sName 引导者名字
	* Param short nBodyId 引导者身体
	* Param short nWeapon 引导者武器
	* Param short nSwingId 引导者翅膀
	* @Return void:
	*/]]--
function CreateGuideFollower(sysarg,nId,sName,nBodyId,nWeapon,nSwingId)
    local netPack = DataPack.allocPacket(sysarg, 0, 72);
    DataPack.writeByte(netPack,nId)
    DataPack.writeString(netPack,sName)
    DataPack.writeWord(netPack,nBodyId)
    DataPack.writeWord(netPack,nWeapon)
    DataPack.writeWord(netPack,nSwingId)
    DataPack.flush(netPack)
  --  print("创建一个引导者:"..sName)
end
	--[[/*
	* Comments: 删除一个引导者
	* Param short nId 引导者索引
	* @Return void:
	*/]]--
function deleteGuideFollower(sysarg,nId)
    if System.isCrossServer() == true then return end
    local netPack = DataPack.allocPacket(sysarg, 0, 73);
    DataPack.writeByte(netPack,nId)

    DataPack.flush(netPack)
    --print("删除引导者:"..nid)
end

	--[[/*
	* Comments: 分发引导者事件
	* Param unsigned short nId 引导者索引
	* Param unsigned short nType 操作类型 1 气泡  2 寻路 3 攻击怪物
	* Param unsigned char* sParams 参数
	* @Return void:
	*/]]--
function dispatchGuideFollowerEvent(sysarg,nId,nType,sParams)
    if System.isCrossServer() == true then return end
    local netPack = DataPack.allocPacket(sysarg, 0, 74);
    DataPack.writeByte(netPack,nId)
    DataPack.writeByte(netPack,nType)
    DataPack.writeString(netPack,sParams)
    DataPack.flush(netPack)
  --  print("分发引导事件:".."nType:"..nType..sParams)
end




function Quest_ShuaXin(sysarg)
    if System.isCrossServer() == true then return end
	--开区前三天显示 hwei
	--if System.getDaysSinceOpenServer() <= 3 then 
		--SpecialQuest_RefrshStrongQuest(sysarg)
	--end
	local QuestId = 5000;
	if Actor.hasQuest(sysarg,QuestId) == false then Actor.addQuest(sysarg,5000); end
	if Actor.hasQuest(sysarg,QuestId) then
		local needChuan = false
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
		local var = Actor.getStaticVar(sysarg);
		local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX);
		local mid = Actor.getSceneId(sysarg);
		local d = var.d;
		local taskstr = "";
		local branchTaskStr = "" --支线1
		local branchTaskStr1 = "" --支线2
		--//日常降妖除魔任务追踪
		local str1 = "";
		local str2 = "";

		local expId = 1
		local expDesc = ""

		-------------------主线任务
		local tMkm = var.zkillmon;	--主线杀怪数记录
		if tMkm == nil then var.zkillmon = {}; tMkm = var.zkillmon; end
		--if pLv <= 65 then Actor.addEffect(sysarg,162,6,500,0); end
		if pLv < 30 then
			CreateGuideFollower(sysarg,1,"隐世战神",9,15,0);
		elseif pLv < 50 then
			CreateGuideFollower(sysarg,1,"隐世战神",15,2,0);
		elseif pLv < 70 then
			CreateGuideFollower(sysarg,1,"隐世战神",101,13,8);
		end
		
		----------------------------------以下读任务配置----------------------------------------------
        local ta = task_all[get_taskflags_val(sysarg)]
        if ta ~= nil then  
            local tname = ta.tname;
				local npcname = ta.npcname;
				local mapname = Fuben.getSceneNameById(ta.mapid);
				local x,y = Actor.getNpcPos(ta.mapid,ta.npcid)
				if ta.mapid==1 then  --处理分流问题
					for _,v in ipairs(ActorInitConfig.nCreateInitFb[1].createPos) do 
						if v.nScenceID == mid then 
							mapname = Fuben.getSceneNameById(mid)
                         
                             x,y = Actor.getNpcPos(Actor.getSceneId(sysarg),ta.npcid);
                            
							
						end
					end
				end
				local jiangli = "";
				-- if ta.nvar == 2 then
				-- 	CreateGuideFollower(sysarg,1,"狂拽酷炫屎靓仔",15,2,0);
				-- 	dispatchGuideFollowerEvent(sysarg,1,3,"0,0");
				-- end

				if ta.bubble1 then
					dispatchGuideFollowerEvent(sysarg,1,1,ta.bubble1);
				end


				for i = 1,#ta.additem do
					local aid = ta.additem[i].id;
					local anum = ta.additem[i].num;

					if ta.additem[i].sex then
						if ta.additem[i].sex == nSex then
							jiangli = jiangli .. string.format("<(c0xFFdce0cb)  奖励:> %s x%s\\",Item.getItemLinkMsg(aid),anum);
						end
					else
						if ta.additem[i].id == -1 then
							jiangli = jiangli .. string.format("<(c0xFFdce0cb)  奖励:  绑定金币> x%s\\",anum);
						elseif ta.additem[i].id == -2 then
							jiangli = jiangli .. string.format("<(c0xFFdce0cb)  奖励:> <(c0xFF00cb52)升级经验 +%s\\>",anum);
						elseif ta.additem[i].id == -3 then 
							jiangli = jiangli .. string.format("<(c0xFFdce0cb)  奖励:> <(c0xFF00cb52)能量点 +%s\\>",anum);
						else
							jiangli = jiangli .. string.format("<(c0xFFdce0cb)  奖励:> %s x%s\\",Item.getItemLinkMsg(aid),anum);
						end
						
					end
				end
				
				local needItem =""--所需要物品的件数
				if ta.needItem ~= nil then
					for i=1,#ta.needItem do
						local item = ta.needItem[i].item;
						local count = ta.needItem[i].count;
						local bindCount   = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,1,-1, nil, true);  --绑定的数量
						local noBindCount = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,0,-1, nil, true);  --不绑定的数量
						local curItemCount = bindCount+noBindCount
						if curItemCount >= count then
							needItem = needItem .. string.format("%s<(c0xFF00cb52)(%s/%s)>\\           ",Item.getItemLinkMsg(item),curItemCount,count)
						else 
							needItem = needItem .. string.format("%s<(c0xFFFF0000)(%s/%s)>\\           ",Item.getItemLinkMsg(item),curItemCount,count)
						end

					end
				end
				-----------------------------------以上读任务配置----------------------------------------------
				
				
				
				-----------------------------------以下是各种任务类型的显示处理---------------------------------
												   --特殊NPC任务用任务id区分--
											
				if ta.type == 3 then--打怪，升级，拥有物品
					if tMkm[1] == nil then tMkm[1] = 0; end
					x,y = ta.mx,ta.my;
					local smonn = "任意怪";
					if ta.monid ~= 0 then
						smonn = System.getMonsterNameById(ta.monid);
					end
					
					taskstr=taskstr..string.format([[
					
<(c0xFFe19f21)[主线] %s>

<(c0xFFcec099)  %s>\]], tname, ta.rwzzdh )

					if ta.monnum ~= 0 and get_taskflags_val(sysarg)~= 85 and get_taskflags_val(sysarg)~= 91 and get_taskflags_val(sysarg)~= 95 then
					taskstr = taskstr .. string.format([[

<(c0xFF00cb52)  击败:> <%s/@@GetbranchAward><(c0xFFFF0000)(%s/%s)> <(x%s:%s:%s:%s)>\]], smonn, tMkm[1], ta.monnum, mapname, x, y, "")
					end
					
					--打个人boos副本里面的boss
					if ta.monnum ~= 0 and get_taskflags_val(sysarg)== 85 then
					taskstr = taskstr .. string.format([[

<(c0xFF00cb52)  击败:> <%s/@@showWinWithGuide,96,2>]], smonn)

						local dvar = Actor.getDyanmicVar(sysarg)
						if dvar.hasChangeTheTask==nil then 
							sendHyperLink(sysarg,"@@showWinWithGuide,96,2")
							dvar.hasChangeTheTask=1
						end
						
						local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sShowTheChallengeBoss)
						DataPack.flush(netPack)
					end
					
					if ta.monnum ~= 0 and get_taskflags_val(sysarg)== 91 then
					taskstr = taskstr .. string.format([[

<(c0xFF00cb52)  击败:> <%s/@@showWinWithGuide,96,2,1>]], smonn)

						local dvar = Actor.getDyanmicVar(sysarg)
						if dvar.hasChangeTheTask2==nil then 
							sendHyperLink(sysarg,"@@showWinWithGuide,96,2,1")
							dvar.hasChangeTheTask2=1
						end
						
					end
					
					if ta.monnum ~= 0 and get_taskflags_val(sysarg)== 95 then
					taskstr = taskstr .. string.format([[

<(c0xFF00cb52)  击败:> <%s/@@showWinWithGuide,96,2,2>]], smonn)
						local dvar = Actor.getDyanmicVar(sysarg)
						if dvar.hasChangeTheTask3==nil then 
							sendHyperLink(sysarg,"@@showWinWithGuide,96,2,2")
							dvar.hasChangeTheTask3=1
						end
					end
					
					
					
					if ta.lv ~= 0 then
					taskstr = taskstr .. string.format([[
				
<(c0xFF00cb52)  需要等级:> <%s>]], ta.lv)

					end
					
					--处理需要收集单件物品的逻辑
					if #ta.needItem ~=0 then
--					local strtable =
--					{
--					{taskid=92,strs="<散人殿堂1层 ★★★☆☆/@@GetbranchAward,shenmizhidain,1>\\  <散人殿堂2层 ★★★★☆/@@GetbranchAward,shenmizhidain,2>\\  <散人殿堂3层 ★★★★★/@@GetbranchAward,shenmizhidain,3>"},
--					{taskid=97,strs="<进入幽冥矿区地图 ★★★☆☆/@@GetbranchAward,StrongStoneFromWhere,3>\\  <其他野外地图均爆 ★★★★☆/@@GetbranchAward,StrongStoneFromWhere,3>"},
--					{taskid=103,strs="<散人殿堂3层 ★★★☆☆/@@GetbranchAward,shenmizhidain,3>\\  <散人殿堂4层 ★★★★☆/@@GetbranchAward,shenmizhidain,4>\\  <散人殿堂5层 ★★★★★/@@GetbranchAward,shenmizhidain,5>"},
--					{taskid=107,strs="<散人殿堂5层 ★★★☆☆/@@GetbranchAward,shenmizhidain,5>\\  <散人殿堂6层 ★★★★☆/@@GetbranchAward,shenmizhidain,6>\\  <散人殿堂7层 ★★★★★/@@GetbranchAward,shenmizhidain,7>"},
--					{taskid=111,strs="<散人殿堂6层 ★★★☆☆/@@GetbranchAward,shenmizhidain,6>\\  <散人殿堂7层 ★★★★☆/@@GetbranchAward,shenmizhidain,7>\\  <散人殿堂8层 ★★★★★/@@GetbranchAward,shenmizhidain,8>"},
--					}
--					local strNow =""
--					for i=1,5 do 
--						if strtable[i].taskid == get_taskflags_val(sysarg) then 
--							strNow = strtable[i].strs
--							--printf(strNow)
--							break
--						end
--					end
--					
--					taskstr = taskstr .. string.format([[
--<(c0xFF00cb52)需要物品:> %s
--<(c0xFFdce0cb)装备来源与爆率星级:>
--  ]]..strNow..[[\]], needItem)
 
					
						--检查是否提前收集完装备
						--local flag=1
						--for i=1,9 do
						--	if ta.needItem[i]~=nil then
						--		--print(ta.needItem[i].count)
						--		local bindCount   = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,1,-1, nil, true);  --绑定的数量
						--		local noBindCount = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,0,-1, nil, true);  --不绑定的数量
						--		if  bindCount+noBindCount < ta.needItem[i].count then
						--			break
						--		end
						--	end
						--	flag=i
						--end
						--if flag == 9 then--全部的数量都满足
						--	set_taskflags_val(sysarg, ta.nvar);
						--	Actor.addEffect(sysarg,161,6,500,0);
						--	if taNext ~= nil then
						--		if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
						--			if ta.nexmapid == 1 then 
						--				Actor.autoFindPathToNpc( sysarg, actormapid, ta.nexnpc);
						--			else
						--				Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
						--			end
						--		elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
						--			if taNext.mapid == 1 then 
						--				Actor.autoFindPathToKillMonster(sysarg, actormapid , taNext.mx , taNext.my , taNext.monid)
						--			else 
						--				Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
						--			end
						--			
						--		end
						--	end
						--Quest_ShuaXin(sysarg)
						--return 
						--end
					
					end
					
										
					taskstr = taskstr .. string.format([[
					
<(idecoLine9#195)><(btn#继续任务#@@GetbranchAward#0#)>
]]);

					dispatchGuideFollowerEvent(sysarg,1,2,mapname..":"..ta.mx..":"..ta.my..":"..smonn);



				elseif ta.type == 2 or ta.type == 1 then--与npc对话
					--print("!!!!!mapname="..mapname)
					local temp = string.format([[%s:%s:%s:%s]], mapname, x, y,npcname)	
					taskstr = taskstr .. string.format([[

<(c0xFFe19f21)[主线] %s>

<(c0xFFcec099)  %s>
<(c0xFFdce0cb)  对话:> <%s/M]]..temp..[[|点击自动寻路到相关NPC> <(x]]..temp..[[)>
%s
\<(idecoLine9#195)>
<(btn#继续任务#M]]..temp..[[#2#)>]]

,tname, ta.rwzzdh, npcname, jiangli);

					



					
					--设置npc的状态（有需要交的任务）--Npc头顶上的感叹号
					local netPack = DataPack.allocPacket(sysarg, 0, 33)
					if ta.mapid == 1 then 
						DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(actormapid,ta.npcid)))
					else 
						DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(ta.mapid,ta.npcid)))
					end
					DataPack.writeByte(netPack,2)
					DataPack.flush(netPack)
					
					
					--关闭特效
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,4)
					DataPack.writeByte(netPack,0)
					DataPack.flush(netPack)
					
					
					local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
					if ta.lv > pLv then
					
					--设置npc的状态（无任务）--Npc头顶上的感叹号
					local netPack = DataPack.allocPacket(sysarg, 0, 33)
					if ta.mapid == 1 then 
						DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(actormapid,ta.npcid)))
					else 
						DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(ta.mapid,ta.npcid)))
					end
					DataPack.writeByte(netPack,0)
					DataPack.flush(netPack)
					
					
					--特效
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,4)
					DataPack.writeByte(netPack,1)
					DataPack.flush(netPack)
					
					
					
					
					local strSJ = "<探索宝藏/@@showWin,31>"
					if System.getDaysSinceOpenServer()<= 3 then 
						strSJ = "<经验炼制/@@showWin,140>"
					end
					
					local strOne = [[ <(c0xFFdce0cb)推荐①:> <装备回收/@@GetbranchAward,HelpToStrong,4|可通过回收旧装备获取大量经验>]]
					if System.getSpid() == 99 then
						strOne = [[ <(c0xFFdce0cb)推荐①:> <装备回收/@@GetbranchAward,HelpToStrong,4|可通过回收旧装备获取大量经验>]]
					end
					
						taskstr = string.format([[
							
<(c0xFFe19f21)[主线] %s>

<(c0xFFff0000) 等级未达 %s 级,无法查看任务>

]]..strOne..[[

 <(c0xFFdce0cb)推荐②:> <降妖除魔/@@GetbranchAward,HelpToStrong,7|点击直接飞到战无双NPC身边>
 <(c0xFFdce0cb)推荐③:> ]]..strSJ..[[ 
 <(c0xFFdce0cb)推荐④:> <炼狱副本//@@GetbranchAward,HelpToStrong,2|虽然炼狱做一次会消耗点时间#但是可以N倍领取炼狱经验#具体你可以来我聊聊>
 <(c0xFFdce0cb)推荐⑤:> <挑战BOSS/@@showWin,96|完成一次加60万经验>
 

<(idecoLine9#195)>
]]
,tname,ta.lv);
						--等级未达，并且在威龙城的话，直接去在战无双（让他自动任务达到等级）
						if Actor.getSceneId(sysarg)==9 and pLv<76 then 
							Actor.autoFindPathToNpc( sysarg,9,"战无双")
						end 
					end


					--taskstr = taskstr .. string.format("<(c0xFF10b9ff)[主线]> <(c0xFFfed700)%s [已完成]>\\<(c0xFFbababa)- 回复> <%s/M%s:%s:%s:%s> <(x%s:%s:%s:%s)>\\<(c0xFFfed700)任务奖励:>\\%s",tname, npcname, mapname, x, y, npcname, mapname, x, y, npcname, jiangli);
				

				dispatchGuideFollowerEvent(sysarg,1,2,mapname..":"..(ta.mx)..":"..ta.my..":"..npcname);


				
				elseif ta.type == 4 then --任务类型4，(1)引导类型 。(2)进入材料副本，出来时触发完成。
					--print("!!!!!mapname="..mapname)
					local strOfState = ""
					---local taskTable2 = {102,106,110,113}
					---for i=1,4 do 
					---	if get_taskflags_val(sysarg)== taskTable2[i] then --这个任务中
					---		if var.RiChangRenWuFinish~=nil and var.RiChangRenWuFinish==1 then 
					---			strOfState="<(c0xFFf55c95a)(已完成)>"
					---			
					---		end
					---		if (var.RiChangRenWuFinish==nil or var.RiChangRenWuFinish==0) and  var.RiChangRenWuFlag ~=nil and var.RiChangRenWuFlag == 1 then 
					---			strOfState="<(c0xFFf55c95a)(进行中)>"
					---		end
					---	end
					---end
					--战无双主线不显示
					local zhanwushuangT = 0
					local taskTable2 = {93,96,99,101,103,105,107,109}
					for i=1,#taskTable2 do 
						if get_taskflags_val(sysarg)== taskTable2[i] then 
							zhanwushuangT =1
							break
						end
					end
		
		
				
					
					local temp = string.format([[%s:%s:%s:%s]], mapname, x, y,npcname)	
					
					--if zhanwushuangT==0 then --战无双主线不显示
					if get_taskflags_val(sysarg)~=83 and  get_taskflags_val(sysarg)~=86 then
					taskstr = taskstr .. string.format([[

<(c0xFFe19f21)[主线] %s>]]..strOfState..[[

<(c0xFFcec099)  %s>
<(c0xFFdce0cb)  对话:> <%s/M]]..temp..[[|点击自动寻路到相关NPC> <(x]]..temp..[[)>
\<(idecoLine9#195)>
<(btn#继续任务#M]]..temp..[[#2#)>]]

,tname, ta.rwzzdh, npcname);
					else 
					taskstr = taskstr .. string.format([[

<(c0xFFe19f21)[主线] %s>]]..strOfState..[[

<(c0xFFcec099)  %s>
<(c0xFFdce0cb)  打开:> <体验VIP在线回收/@@showWinWithGuide,8>
\<(idecoLine9#195)>
]]

,tname, ta.rwzzdh, npcname);
					
					local dvar = Actor.getDyanmicVar(sysarg)
					if dvar.hasChangeTheTask83==nil and get_taskflags_val(sysarg)==83 then 
						sendHyperLink(sysarg,"@@showWinWithGuide,8")
						dvar.hasChangeTheTask83=1
					end

					-- if dvar.hasChangeTheTask90==nil and get_taskflags_val(sysarg)==90 then 
					-- 	sendHyperLink(sysarg,"@@showWinWithGuide,8")
					-- 	dvar.hasChangeTheTask90=1
					-- end
					
					
					end
-- 					else
-- taskstr = taskstr .. [[
	
-- <(c0xFFf5e31d)[主线] 学习如何降妖除魔>

-- <(c0xFFdce0cb)任务条件:> <#c0xFFFF0000#进行1次战无双/M威龙城:138:130:战无双> <(x威龙城:138:130:战无双)>

-- <(idecoLine9#195)>
-- ]]
					--end
	
					local netPack = DataPack.allocPacket(sysarg, 0, 33)
					DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(ta.mapid,ta.npcid)))
					DataPack.writeByte(netPack,2)
					DataPack.flush(netPack)

					
					
					--关闭特效
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,4)
					DataPack.writeByte(netPack,0)
					DataPack.flush(netPack)
					
					
					local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
					if ta.lv > pLv then
					local netPack = DataPack.allocPacket(sysarg, 0, 33)
					DataPack.writeInt64(netPack, Actor.getHandle(Fuben.getNpcPtrById(ta.mapid,ta.npcid)))
					DataPack.writeByte(netPack,0)
					DataPack.flush(netPack)
					
									
					--特效
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,4)
					DataPack.writeByte(netPack,1)
					DataPack.flush(netPack)
					
					
					local strSJ = "<探索宝藏/@@showWin,31|寻宝产出大量经验丹#装备回收获得海量经验>"
					if System.getDaysSinceOpenServer()<= 3 then 
						strSJ = "<经验炼制/@@showWin,140|限购前3天#先买先有先领先>"
					end
					
					local strOne = [[ <(c0xFFdce0cb)推荐①:> <装备回收/@@GetbranchAward,HelpToStrong,4|可通过回收旧装备获取大量经验>]]
					if System.getSpid() == 99 then
						strOne = [[ <(c0xFFdce0cb)推荐①:> <装备回收/@@GetbranchAward,HelpToStrong,4|可通过回收旧装备获取大量经验>]]
					end
						taskstr = string.format([[

<(c0xFFe19f21)[主线] %s>

<(c0xFFff0000) 等级未达 %s 级,无法查看任务>

 ]]..strOne..[[
 
 <(c0xFFdce0cb)推荐②:> <降妖除魔/@@GetbranchAward,HelpToStrong,7|点击直接飞到战无双NPC身边>
 <(c0xFFdce0cb)推荐③:> ]]..strSJ..[[ 
 <(c0xFFdce0cb)推荐④:> <炼狱副本//@@GetbranchAward,HelpToStrong,2|虽然炼狱做一次会消耗点时间#但是可以N倍领取炼狱经验#具体你可以来我聊聊>
 <(c0xFFdce0cb)推荐⑤:> <挑战BOSS/@@showWin,96|完成一次加60万经验>

<(idecoLine9#195)>
]]

,tname,ta.lv);
						--等级未达，并且在威龙城的话，直接去在战无双（让他自动任务达到等级）
						if Actor.getSceneId(sysarg)==9 and pLv<76 then 
							Actor.autoFindPathToNpc( sysarg,9,"战无双") 
						end 
					end
				
					dispatchGuideFollowerEvent(sysarg,1,2,mapname..":"..(ta.mx)..":"..ta.my..":"..npcname);
					
					--已经提前完成了提升军阶的任务了
					--local taskTable = {93,98,104,108,112}
					--local dVar = Actor.getDyanmicVar(sysarg)
					--if dVar.junTuanTask ==nil then dVar.junTuanTask ={} end
					--for i=1,#taskTable do 
					--	if get_taskflags_val(sysarg)== taskTable[i] and get_d_val(sysarg,110)>=i then --已经提前完成了提升军阶的任务了
					--		
					--		local taNext = task_all[get_taskflags_val(sysarg)+1]
					--		set_taskflags_val(sysarg,taskTable[i]+1)
					--		--自动过任务
					--		if taNext ~= nil then
					--			if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
					--				Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
					--				print(ta.nexmapid,ta.nexnpc,"next");
					--			elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
					--				Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
					--			end
					--		end
					--		Quest_ShuaXin(sysarg)
					--		return
					--	elseif get_taskflags_val(sysarg) == taskTable[i] and dVar.junTuanTask[taskTable[i]]==nil then --有任务，但是没有完成的 (保证只在第一次弹出)
					--		SendBox(sysarg,"已经完成任务,是否马上去提交",5000)
					--		dVar.junTuanTask[taskTable[i]]=1
					--	end
					--end
					local dVar = Actor.getDyanmicVar(sysarg)
					if get_taskflags_val(sysarg)==90 and dVar.Task90==nil then	
						SendBox(sysarg,"已经完成任务,是否马上去提交",5000)
						dVar.Task90=1
					end
					
					--已经提前完成了战无双任务
					--local taskTable2 = {102,106,110,113}
					local taskTable2 = {93,96,99,101,103,105,107,109}
					for i=1,#taskTable2 do 
						if get_taskflags_val(sysarg)== taskTable2[i] and get_d_val(sysarg,2) < 1 then --已经提前完成了战无双任务
							--print("完了！！！")
							
							local taNext = task_all[get_taskflags_val(sysarg)+1]
							set_taskflags_val(sysarg,taskTable2[i]+1)
							--自动过任务
							if taNext ~= nil then
								if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
									Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
									--print("ta.nexnpc:"..ta.nexnpc)
								elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
									Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
								end
							end
							Quest_ShuaXin(sysarg)
							return
						end
					end
					
					

				elseif ta.type ==5 then --(商城购买)买药水
				taskstr=taskstr..string.format([[
	
<(c0xFFe19f21)[主线] %s>

<(c0xFFcec099)  %s>\]], tname, ta.rwzzdh )
			
				taskstr = taskstr .. string.format([[

<(c0xFF00cb52)  购买:> <%s/@@showWinWithGuide,7>\\<(idecoLine9#195)>]], "高级太阳水")
					local dvar = Actor.getDyanmicVar(sysarg)
					if dvar.hasChangeTheTask==nil then 
						sendHyperLink(sysarg,"@@showWinWithGuide,7")
						dvar.hasChangeTheTask=1
					end
				

				
				elseif ta.type == 6 then --强化装备
				taskstr=taskstr..string.format([[
	
<(c0xFFe19f21)[主线] %s>

<(c0xFFcec099)  %s>\]], tname, ta.rwzzdh )
			

					if get_taskflags_val(sysarg)== 89 then 
						taskstr = taskstr .. string.format([[

<(c0xFF00cb52)>	<%s/@@showWinWithGuide,5>
<(c0xFFdce0cb)强化石来源:>	
      <矿洞挖矿/@@GetbranchAward,HelpToStrong,10|里面有丰富的矿产宝藏,普通矿石可自动出售兑换绑金#如果你挖到传说中的钻石矿了每颗可兑换1000点转生修为哟>   <商城购买/@@showWin,6>
      <登录奖励/@@showWin,181>   <特惠礼包/@@showWin,99>
	   
<(idecoLine9#195)>]], "点击打开强化系统")	

						--检查提前完成
						local count = Item.getStrongEquipNumByStrong(sysarg,2)
						if count>=1 then--完成了任务
							local taNext = task_all[get_taskflags_val(sysarg)+1]
							local ta = task_all[get_taskflags_val(sysarg)]
							local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
							set_taskflags_val(sysarg, ta.nvar)
							--if taNext ~= nil then
							--	if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
							--		Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
							--	elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
							--		Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
							--	end
							--end
							Quest_ShuaXin(sysarg)
							return
						end
						
						local dvar = Actor.getDyanmicVar(sysarg)
						if dvar.hasChangeTheTask==nil then 
							sendHyperLink(sysarg,"@@showWinWithGuide,5")
							dvar.hasChangeTheTask=1
						end
						
					elseif get_taskflags_val(sysarg)== 99 then 
						
						taskstr = taskstr .. string.format([[

<(c0xFF00cb52)>	<%s/@@showWinWithGuide,6>
<(c0xFFdce0cb)强化石来源:>	
      <矿洞挖矿/@@GetbranchAward,HelpToStrong,10|里面有丰富的矿产宝藏,普通矿石可自动出售兑换绑金#如果你挖到传说中的钻石矿了每颗可兑换1000点转生修为哟>   <商城购买/@@showWin,6>
      <登录奖励/@@showWin,181>   <特惠礼包/@@showWin,99>
<(idecoLine9#195)>]], "点击打开强化系统")	

						--检查提前完成
						local count = Item.getStrongEquipNumByStrong(sysarg,3)
						if count>=1 then--完成了任务
							local taNext = task_all[get_taskflags_val(sysarg)+1]
							local ta = task_all[get_taskflags_val(sysarg)]
							local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
							set_taskflags_val(sysarg, ta.nvar)
							if taNext ~= nil then
								if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=30 then
									Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
								elseif taNext.type ==3 and get_taskflags_val(sysarg)~=29 then
									Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
								end
							end
							Quest_ShuaXin(sysarg)
							return
						end
						
						local dvar = Actor.getDyanmicVar(sysarg)
						if dvar.hasChangeTheTask==nil then 
							sendHyperLink(sysarg,"@@showWinWithGuide,6")
							dvar.hasChangeTheTask=1
						end
					end
				elseif ta.type == 7 then --收集套装中的任意几件装备
					
					local startId=ta.collectItem.startId
					local endId=ta.collectItem.endId --套装开始和结束id，写死
					local needCount=ta.collectItem.count
					local totalNum=0
					for i=startId,endId do
						local bindCount   = Actor.getItemCount(sysarg,i,0,-1,1,-1, nil, true);  --绑定的数量
						local noBindCount = Actor.getItemCount(sysarg,i,0,-1,0,-1, nil, true);  --不绑定的数量
						if  bindCount+noBindCount >=1 then
							totalNum = totalNum + 1
						end
					end
					if totalNum >= needCount then --以开始刷新就已经完成了任务
						set_taskflags_val(sysarg, ta.nvar);
						Actor.addEffect(sysarg,161,6,500,0);
						if taNext ~= nil then
							if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
								Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
							elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
								Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
							end
						end
						Quest_ShuaXin(sysarg)
						return
					end
					taskstr=taskstr..string.format([[
					
<(c0xFFe19f21)[主线] %s>

<(c0xFFcec099)  %s>\]], tname, ta.rwzzdh )
				if get_taskflags_val(sysarg)==96 then
					taskstr = taskstr .. string.format([[				
<(c0xFF00cb52)需要物品:>%s (%s/%s)<(c0xFFdce0cb)件>
<(c0xFFdce0cb)装备来源:><散人殿堂/@@GetbranchAward,HelpToStrong,11> <个人挑战/@@showWin,96>
<(c0xFFdce0cb)任意地图:><(c0xFFdce0cb)%s>
]], ta.collectItem.name,totalNum,ta.collectItem.count,ta.collectItem.dis)
				elseif get_taskflags_val(sysarg)==92 then
					taskstr = taskstr .. string.format([[				
<(c0xFF00cb52)需要物品:>%s (%s/%s)<(c0xFFdce0cb)件>
<(c0xFFdce0cb)装备来源:><散人殿堂/@@GetbranchAward,HelpToStrong,11> <个人挑战/@@showWin,96>
<(c0xFFdce0cb)任意地图:><(c0xFFdce0cb)%s>
]], ta.collectItem.name,totalNum,ta.collectItem.count,ta.collectItem.dis)
				else 
				taskstr = taskstr .. string.format([[				
<(c0xFF00cb52)需要物品:>%s (%s/%s)<(c0xFFdce0cb)件>
<(c0xFFdce0cb)装备来源:><散人殿堂/@@GetbranchAward,HelpToStrong,11> <个人挑战/@@showWin,96>
<(c0xFFdce0cb)任意地图:><(c0xFFdce0cb)%s>
]], ta.collectItem.name,totalNum,ta.collectItem.count,ta.collectItem.dis)
				end	
					
				if get_taskflags_val(sysarg)==96 and System.getDaysSinceOpenServer()<=7 then

					taskstr=taskstr..[[          <立即购买完成任务/@@showWin,180,5>\]]
				end
taskstr=taskstr.."\\<(idecoLine9#195)>"
				end
        
		
		--没有任务了
		elseif var.betonSHENJIAFinish ==nil and pLv > 10 then --主线任务完了
			local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
			
			--因为个是不同虚拟机,所以读不到另外一个的全局函数
			local function YinShiDaDuNeedDao(sysarg)
				local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
				local itemid = 394
				if njob==2 then 
					itemid =394
				elseif njob==3 then 
					itemid =394
				end
				return itemid
			end
			
			local itemid = YinShiDaDuNeedDao(sysarg)

		taskstr=taskstr..string.format([[

<(c0xFFf5e31d)[推荐打宝]>
<散人殿堂/@@GetbranchAward,HelpToStrong,11|从1到5造就成神之路>  <BOSS之家/@@GetbranchAward,HelpToStrong,5|首领之家拥有海量高级Boss,其中不乏出现高转生级别老怪.#每日产出大量超级极品装备,里面竞争激烈啊!>  <个人挑战/@@showWin,96>
				
<(c0xFFe19f21)[主线] 打boss,送特戒>
<(c0xFFcec099)带着>]]..Item.getItemLinkMsg(itemid)..[[<(c0xFFdce0cb)找隐世老人领取奖励.>
<(c0xFFcec099)打不到装备怎么办?> <任性购买/@@GetbranchAward,buyqixindao>

<(c0xFFdce0cb)- 来源> <进入散人殿堂/@@GetbranchAward,HelpToStrong,11|点击免费之飞到散人殿堂入口> 
<(c0xFFdce0cb)- 回复> <隐世老人/M威龙城:162:163:隐世老人> <(x威龙城:162:163:隐世老人)>
<(c0xFFdce0cb)- 奖励> ]]..Item.getItemLinkMsg(527)..[[ <x1>

<(idecoLine9#195)>
]])
		elseif var.betonSHENJIAFinish ~=nil and var.betonSHENJIAFinish==1 and (pLv >=82 or var.speicltaskKM~=nil )then --主线任务完了，并且第一个额外任务做完了
		if var.speicltaskKM==nil then --额外任务杀怪数
			var.speicltaskKM=0
		end
		taskstr=taskstr..string.format([[
				
<(c0xFFe19f21)[主线] 转世重生>
<散人殿堂/@@GetbranchAward,HelpToStrong,11|从1到5造就成神之路>  <BOSS之家/@@GetbranchAward,HelpToStrong,5|首领之家拥有海量高级Boss,其中不乏出现高转生级别老怪.#每日产出大量超级极品装备,里面竞争激烈啊!>  <个人挑战/@@showWin,96>

<(c0xFFcec099)击杀5只76级以上BOSS便可完成.>
<(c0xFFdce0cb)- 怪物> <(c0xFF00FF00)(]]..var.speicltaskKM..[[/5)>
<(c0xFFdce0cb)- 回复> <首领之家/M威龙城:126:165:首领之家> <(x威龙城:126:165:首领之家)>
<(c0xFFdce0cb)- 奖励> ]]..Item.getItemLinkMsg(527)..[[ <x1>

<(idecoLine9#195)>
]])

		elseif var.betonSHENJIAFinish ~=nil and var.betonSHENJIAFinish==1 and pLv <82 then --未到82
			taskstr=taskstr..string.format([[
				
<(c0xFFff0000)[82级可查看隐藏任务]>
<(idecoLine9#195)>
<(c0xFFf5e31d)[推荐打宝]>
<散人殿堂/@@GetbranchAward,HelpToStrong,11|从1到5造就成神之路>  <BOSS之家/@@GetbranchAward,HelpToStrong,5|首领之家拥有海量高级Boss,其中不乏出现高转生级别老怪.#每日产出大量超级极品装备,里面竞争激烈啊!>  <个人挑战/@@showWin,96>\
<(c0xFFf5e31d)[推荐升级]>
<降妖除魔/@@GetbranchAward,HelpToStrong,7|点击直接飞到战无双NPC身边>  <炼狱副本//@@GetbranchAward,HelpToStrong,2|虽然炼狱做一次会消耗点时间#但是可以N倍领取炼狱经验#具体你可以来我聊聊>  <挑战BOSS/@@showWin,96|完成一次加60万经验>\
<(idecoLine9#195)>
]])
-- <(c0xFFdce0cb)- 奖励> ]]..Item.getItemLinkMsg(527)..[[ <x1>
		else	
		taskstr=taskstr.."\\"
	
		
		end
		
		-- --什么任务需要显示特效
		-- local texiaoTable = {1}
		
		-- for i=1,#texiaoTable do 
		-- 	if get_taskflags_val(sysarg)==texiaoTable[i] then 
		-- 			--特效
		-- 			local netPack = DataPack.allocPacket(sysarg, 26 , 83)
		-- 			DataPack.writeByte(netPack,4)
		-- 			DataPack.writeByte(netPack,1)
		-- 			DataPack.flush(netPack)
		-- 	end
		-- end
		
		
		
		
		-----------------------------------以上是各种任务类型的显示处理（提前完成任务的处理）---------------------------------		

		
		
		
		---------------------------------------------------------------------支线任务
		--战无双
		if taskstr ~= "" then taskstr = taskstr .. ""; end

		--RiChangRenWuFlag是接受任务的标志
		--RiChangRenWuFinish是完成任务的标志
		--RiChangRenWuIndex是表中的索引，分等级确定
		
		if get_taskflags_val(sysarg) ~= 64 then 
			local dvar = Actor.getDyanmicVar(sysarg)
			if get_d_val(sysarg,2) >= 1 or get_d_val(sysarg,10) <5 or (var.RiChangRenWuFlag ~=nil and var.RiChangRenWuFlag ==1 ) or (var.RiChangRenWuFinish ~=nil and var.RiChangRenWuFinish ==1)then
				
				--没有接受任务
				if pLv>=50 and (var.RiChangRenWuFinish==nil or var.RiChangRenWuFinish==0) and (var.RiChangRenWuFlag ==nil or var.RiChangRenWuFlag ==0) then 
					if get_d_val(sysarg,2) < 1 and get_d_val(sysarg,10) < 5 then
						taskstr = taskstr .. string.format("<(c0xFF4ba0de)[经验、内功]> <(c0xFFe19f21)日常任务><(c0xFFf55c95a)(可接受)>\\<(c0xFFdce0cb)- 回复> <战无双/M威龙城:138:130:战无双|每天获得大量经验和内功的首选之路> <(x威龙城:138:130:战无双)>\\<(c0xFFdce0cb)- 次数> <点击购买日常任务次数/@@GetbranchAward,buyRCCM|20万绑金或金币购买#每天最多买5次>\\")
					else 
						taskstr = taskstr .. string.format("<(c0xFF4ba0de)[经验、内功]> <(c0xFFe19f21)日常任务><(c0xFFf55c95a)(可接受)>\\<(c0xFFdce0cb)- 回复> <战无双/M威龙城:138:130:战无双|每天获得大量经验和内功的首选之路> <(x威龙城:138:130:战无双)>\\")
					end
					dvar.needChuan = nil
				--接受了任务没完成
				elseif pLv>=50 and (var.RiChangRenWuFinish==nil or var.RiChangRenWuFinish==0) and  var.RiChangRenWuFlag ~=nil and var.RiChangRenWuFlag == 1 then 
					
					--随机传送
					local mapname =""
					local mapId =0
					
					if var.RiChangRenWuType==0 then --打怪类型
						mapId = rc_chumo[var.RiChangRenWuIndex].mapId
						mapname = Fuben.getSceneNameById(mapId)
					elseif  var.RiChangRenWuType==1 then --收集怪物类型
						mapId = rc_chumo.kuangshi[var.RiChangRenWuIndex].mapId
						mapname = Fuben.getSceneNameById(mapId)
					end
	
					local xPoint = 96
					local yPoint = 96
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
						xPoint=h
						yPoint=w
					end
					
					local monsterName ="任意怪"
					if rc_chumo[var.RiChangRenWuIndex].monsterId ~= 0 then 
						monsterName = System.getMonsterNameById(rc_chumo[var.RiChangRenWuIndex].monsterId)
					end
					
					if  var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 0 then 
						taskstr = taskstr .. string.format("\<(c0xFF4ba0de)[经验、内功]> <(c0xFFf5e31d)降妖除魔><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 消灭> <%s/@@GetbranchAward,richangchumo><(c0xFFf55c95a)(%s/%s)><(x%s:%s:%s:%s)>\\",monsterName,var.RiChangRenWuKillMonsters, rc_chumo[var.RiChangRenWuIndex].monsterNum,mapname, xPoint, yPoint, "")
					elseif var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 1 then 	
						--taskstr = taskstr .. string.format("\<(c0xFF10b9ff)[经验、内功]> <(c0xFFf5e31d)日常挖矿><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 收集> %s<(c0xFFf55c95a)(%s/%s)><(x%s:%s:%s:%s)>\\",Item.getItemLinkMsg(rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem),Actor.getItemCount(sysarg,rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem),rc_chumo.kuangshi[var.RiChangRenWuIndex].needcount,mapname, xPoint, yPoint, "")
						
						--if var.days.kuangshi_RCCM ==nil then 
						--	var.days.kuangshi_RCCM ={}
						--end
						--if var.days.kuangshi_RCCM[rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem]==nil then 
						--	var.days.kuangshi_RCCM[rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem] = 0
						--end
						--if var.days.kuangshi_RCCM[rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem]<0 then 
						--	var.days.kuangshi_RCCM[rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem] = 0
						--end
						--
						--taskstr = taskstr .. string.format("\<(c0xFF10b9ff)[经验、内功]> <(c0xFFf5e31d)日常挖矿><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 收集> %s<(c0xFFf55c95a)(%s/%s)><(x%s:%s:%s:%s)>\\",Item.getItemLinkMsg(rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem),var.days.kuangshi_RCCM[rc_chumo.kuangshi[var.RiChangRenWuIndex].needItem],rc_chumo.kuangshi[var.RiChangRenWuIndex].needcount,mapname, xPoint, yPoint, "")
						
						
						if var.kuangshi_RCCM ==nil then 
							var.kuangshi_RCCM =0
						end
						taskstr = taskstr .. string.format("\<(c0xFF4ba0de)[经验、内功]> <(c0xFFf5e31d)日常挖矿><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 收集> %s<(c0xFFf55c95a)(%s/%s)><(x%s:%s:%s:%s)>\\","任意矿",var.kuangshi_RCCM,rc_chumo.kuangshi[var.RiChangRenWuIndex].needcount,mapname, xPoint, yPoint, "")
						
					elseif var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 2 then 
						local mapname = Fuben.getSceneNameById(rc_chumo.findNpc[var.RiChangRenWuIndex].mapId)
						local x = rc_chumo.findNpc[var.RiChangRenWuIndex].x
						local y = rc_chumo.findNpc[var.RiChangRenWuIndex].y
						local npcname = rc_chumo.findNpc[var.RiChangRenWuIndex].npcName
						local temp = string.format([[%s:%s:%s:%s]],mapname , x, y,npcname)	
						taskstr = taskstr .. string.format("\<(c0xFF4ba0de)[经验、内功]> <(c0xFFf5e31d)对话NPC><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 寻找> <%s/M"..temp.."> <(c0xFFdce0cb)他或许会帮到你>\\",npcname)
					end
				--完成了任务
				elseif pLv>=50 and  var.RiChangRenWuFinish~=nil and var.RiChangRenWuFinish==1 then 
					if pLv >=74  and dvar.needChuan == nil then 
						--战无双完成特效
						needChuan = true 
						dvar.needChuan = 1
					end
					taskstr = taskstr .. string.format("\<(c0xFF4ba0de)[经验、内功]> <(c0xFFf5e31d)降妖除魔><(c0xFFf55c95a)(已完成)>\\<(c0xFFdce0cb)- 回复> <战无双/M威龙城:138:130:战无双|每天获得大量经验和内功的首选之路> <(x威龙城:138:130:战无双)>\\")
				end
			end
		end		
		
		--支线微端
		if not var.LoginMark then
			var.LoginMark = 0
		end 
		local dVar = Actor.getDyanmicVar(sysarg)
		--没有领取过微端 and 不是微端登录
		if  pLv >= 1000 and var.LoginMark == 0  and dVar.WDLogin == nil then
			taskstr = taskstr .. "<(c0xFF4ba0de)[必备]> <(c0xFFe19f21)下载微端拿奖励>\\<(c0xFFdce0cb)- 回复> <点击开始下载微端/@@GetbranchAward,weiduandenglu|使用微端进入游戏PK体验更顺畅> \\<(c0xFFdce0cb)- 奖励> "..Item.getItemLinkMsg(675).." "..Item.getItemLinkMsg(508).."\\"
		end
		local legionId = Actor.getLegionId(sysarg);
		if pLv >= 83 and get_d_val(sysarg,110) < 10 and legionId > 0 then
			local jtlv = get_d_val(sysarg,110);
			local LegionTitle = LEGIONCFG.LegionTitle;
			
			local StrLegionT = LegionTitle.Lt[legionId];
			local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
			local lt = LegionTitle.Title;
			StrLegionT = string.format("<(c0xFF%s)%s%s(%s级)>", lt[jtlv+1].c, StrLegionT, lt[jtlv+1].str[job], (jtlv+1) );

			local upgradelist = LEGIONCFG.upgradelist;
			local updl = {};
			for i = 1,#upgradelist do
				updl[i] = "";
				local upnP = upgradelist[i].nProps;
				for k = 1,#upnP do
					--要么不用判断职业，要么职业相等
					if upnP[k].job==nil or upnP[k].job==job then 
						updl[i] = updl[i] .. string.format("%s.收集 %s %s个#", k, Item.getItemName(upnP[k].item), upnP[k].num);
					end
					if k == #upnP then
						updl[i] = updl[i] .. string.format("%s.绑金或金币%s万#", k+1, (upgradelist[i].nGold/10000) );
					end
				end
			end

			local ltnd = LegionTitle.Lt[legionId] .. LegionTitle.Title[jtlv+1].str[job];
			local lttx = string.format("&%s&%s&888888&(%s级)", LegionTitle.Title[jtlv+1].c, ltnd, jtlv+1);
			upgrade = string.format(LegionTitle.Title[jtlv+1].upgrade, lttx, updl[jtlv+1]);

			local sLaiYuan = string.format("<(c0xFFdce0cb)- 来源> %s\\", LegionTitle.Title[jtlv+1].come);
			taskstr = taskstr .. "<(c0xFF4ba0de)[军团]> <(c0xFFe19f21)提升军衔为>"..StrLegionT.."\\"..sLaiYuan.."<(c0xFFdce0cb)- 回复> <#c0xFFFF0000#军团使者(查看)/M威龙城:144:158:军团使者|"..upgrade.."> <(x威龙城:144:158:军团使者)>\\"
		end
		
		--押镖
		if pLv >= 81 then
			if var.days ==nil then var.days={} end
			if var.days.darttms == nil then 
				var.days.darttms = 0
			end
			-- 运镖次数
				--黄金特权多1次
			local maxDart = 3
			if IsSpeciaTitleVip(sysarg,3) ==true then 
				maxDart = 3+1
			end
	
			if var.days.darttms<maxDart then 
				taskstr = taskstr .. "<(c0xFF4ba0de)[血装]> <(c0xFFe19f21)押镖><(c0xFFf55c95a)(军印功勋值)>\\<(c0xFFdce0cb)- 回复> <龙门镖局/M威龙城:150:140:龙门镖局|总镖头明确的告诉你每天不押镖就亏了亏了#押镖可拿功勋值#功勋值提升军印可以增加大量人物生命值和魔法值> <(x威龙城:150:140:龙门镖局)>\\"
			end
		
		end
		--炼狱寺庙
		if pLv >= 80 then
			if var.days ==nil then var.days={} end

			if var.days.emolingCount ~= nil and var.days.emolingCount >= fuben_emoling_cfg.enter_count_daily then --次数没了
			else
				taskstr = taskstr .. "<(c0xFF4ba0de)[经验]> <(c0xFFe19f21)炼狱寺庙><(c0xFFf55c95a)(免费3倍奖励)>\\<(c0xFFdce0cb)- 回复> <炼狱/M威龙城:149:151:炼狱|虽然炼狱做一次会消耗点时间#但是可以N倍(最高可领取18倍奖励)领取炼狱经验#具体你可以来我聊聊> <(x威龙城:149:151:炼狱)>\\"
			end
		end
		
		--副本任务
		if pLv >= 75 then	
			local cond =false --判断副本任务做完了就不再显示
			local indexs={20,21,22,23,25,32}
			for i=1,#indexs do 
				if get_d_val(sysarg,indexs[i])>0 then 
					--print("indexs[i]"..indexs[i])
					cond = true 
				end
			end

			if cond ==true then 
				taskstr = taskstr .. "<(c0xFF4ba0de)[属性]> <(c0xFFe19f21)材料副本>\\<(c0xFFdce0cb)- 回复> <副本管理员/M威龙城:131:172:副本管理员|每天坚持做材料副本#每天看的到的属性大幅增长> <(x威龙城:131:172:副本管理员)>\\"
			end
		end
		
        
		local openServerDay = System.getDaysSinceOpenServer()
		if openServerDay>6 and pLv >= 60 then 	--第7天开启
			taskstr = taskstr .. "<(c0xFF4ba0de)[宝石]> <(c0xFFe19f21)勇闯天关>\\<(c0xFFdce0cb)- 回复> <勇闯天关/M沙漠土城:155:120:勇闯天关|每日闯一闯天关，总是会有意想不到的收获> <(x沙漠土城:155:120:勇闯天关)>\\"
		end
		
		local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
		if myCircle>=3 and Actor.IsHasPasswd(sysarg)==false and openServerDay>2 then --三转，并且没有设置密码的给一个支线任务
			taskstr = taskstr .. "<(c0xFF4ba0de)[安全]> <(c0xFFe19f21)设置安全锁>\\<(c0xFFdce0cb)- 回复> <前往设定/@@showWin,209> \\"
		end
		if var.showgodtask ~= nil and var.showgodtask == 1 then
            local fstr = "<(c0xFF4ba0de)[神装]> <(c0xFFe19f21)神魂任务(%d/3)>\\<(c0xFFdce0cb)- 回复> <查看神魂收集/@@showWin,201> \\"
            if var.showgodtaskindex == nil then var.showgodtaskindex = 0 end
            fstr = string.format(fstr,var.showgodtaskindex)
           
            taskstr = taskstr ..fstr 
        end
		--if pLv >= 70 and get_taskflags_val(sysarg) < 113 then
		if pLv >= 72 then
			if Actor.getGuildId(sysarg) == 0 and var.JGuild==nil then --没有加入行会（加入过再退出的不算）
				taskstr = taskstr .. "<(c0xFF4ba0de)[行会]> <(c0xFFe19f21)加入行会(领取大礼)>\\<(c0xFFdce0cb)- 回复> <查看行会/@@showWin,7>\\<(c0xFFdce0cb)- 奖励> "..Item.getItemLinkMsg(633)
			end
		end
		
		--支线行会除魔
		if Actor.getGuildId(sysarg)~=0 then 	--加入了行会	
			if var.newdays==nil then 
				var.newdays={}	
			end
			
			--行会除魔初始化
			if var.newdays.Guild_xycmTime==nil then 
				local xycmTimecfg = 5
				if IsSpeciaTitleVip(sysarg,2) ==true then 
					xycmTimecfg = 5+3
				end
				var.newdays.Guild_xycmTime =xycmTimecfg
			end
				
			if var.newdays.Guild_xycmTime ~=nil and var.newdays.Guild_xycmTime>=0 then --剩余次数不为0
				if var.Guild_xycmFlag~=nil and var.Guild_xycmFlag==1 and var.newdays.Guild_xycmTime>0 then--没接任务
					taskstr = taskstr .. "<(c0xFF4ba0de)[行会]> <(c0xFFe19f21)行会除魔><(c0xFFf55c95a)(可接受)>\\<(c0xFFdce0cb)- 回复> <接受任务/@@showWin,7,5>"
				elseif  var.Guild_xycmFlag~=nil and var.Guild_xycmFlag==2 then--接了任务
					if var.Guild_xycmKillC==nil then --初始化
						var.Guild_xycmKillC=0
					end
					if var.Guild_xycmIndex==nil and var.newdays.Guild_xycmTime>0  then --没接任务
						taskstr = taskstr .. "<(c0xFF4ba0de)[行会]> <(c0xFFe19f21)行会除魔><(c0xFFf55c95a)(可接受)>\\<(c0xFFdce0cb)- 回复> <接受任务/@@showWin,7,5>"
					else 
						if var.Guild_xycmKillC>=GuildXiangYaoChuMo_Cfg.ForClient[var.Guild_xycmIndex].monsterNum then --完成了任务
							taskstr = taskstr .. "<(c0xFF4ba0de)[行会]> <(c0xFFe19f21)行会除魔><(c0xFFf55c95a)(已完成)>\\<(c0xFFdce0cb)- 回复> <提交任务/@@showWin,7,5>"
						else --未完成任务
							local monsterName = "任意怪"
							local cfg2 = GuildXiangYaoChuMo_Cfg.ForClient
							
							local mapId = cfg2[var.Guild_xycmIndex].mapId
							local mapname = Fuben.getSceneNameById(mapId)
							local x=GuildXiangYaoChuMo_Cfg.Tasks[var.Guild_xycmIndex].x
							local y=GuildXiangYaoChuMo_Cfg.Tasks[var.Guild_xycmIndex].y
							if x==0 and y==0 then 
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
							end
							
							local monsterId = cfg2[var.Guild_xycmIndex].monsterId
							local monsterNum =cfg2[var.Guild_xycmIndex].monsterNum
							if monsterId~=0 then 
								monsterName=System.getMonsterNameById(monsterId)
							end
							taskstr = taskstr .. "<(c0xFF4ba0de)[行会]> <(c0xFFe19f21)行会除魔><(c0xFFf55c95a)(进行中)>\\<(c0xFFdce0cb)- 消灭> <"..monsterName.."/@@GetbranchAward,richangchumo><(c0xFFf55c95a)("..var.Guild_xycmKillC.."/"..monsterNum..")>"..string.format("<(x%s:%s:%s:%s)>",mapname,x,y,"").."\\"
						end
					end
				end
			end
		end
		
		if openServerDay >= 4 and Item.getEquipByPos(sysarg, itJunGuPos)==nil then
			taskstr = taskstr .."\\<(c0xFF4ba0de)[攻击]> <(c0xFFe19f21)激活军鼓(属性暴涨)>\\<(c0xFFdce0cb)- 回复> <查看军鼓/@@showWin,213>\\<(c0xFFdce0cb)- 奖励> "..Item.getItemLinkMsg(5453)
		end
		
		if var.brotherBranchTask==nil and pLv>=80 then
			 taskstr = taskstr .."\\<(c0xFF4ba0de)[结义]> <(c0xFFe19f21)结义金兰>\\<(c0xFFdce0cb)- 回复> <了解结义/@@GetbranchAward,brotherBranchTask>\\<(c0xFFdce0cb)- 奖励> "..Item.getItemLinkMsg(6216).."*9"
		end
		
		--if get_taskflags_val(sysarg) >= 113 then 
		--	if pLv >= 60 and get_d_val(sysarg,110) < 10 then
		--		taskstr = taskstr .. "<(c0xFF10b9ff)[支线]> <(c0xFFf5e31d)提升军衔>\\<(c0xFFdce0cb)- 回复> <军团使者/M威龙城:144:158:军团使者> <(x威龙城:144:158:军团使者)>\\"
		--	end
		--end
		
		--备份
			-- taskstr = taskstr .. "\\";
			-- taskstr = taskstr .. "<(c0xFFf5e31d)[经验]> <挑战BOSS/@@showWin,96> <装备回收/@@GetbranchAward,HelpToStrong,4>\\"
			-- taskstr = taskstr .. "<(c0xFFf5e31d)[金币]> <押送镖车/@@GetbranchAward,HelpToStrong,3> <装备回收/@@GetbranchAward,HelpToStrong,4>\\"
			-- if pLv >= 80 then
			-- 	taskstr = taskstr .. "<(c0xFFf5e31d)[装备]> <BOSS之家/@@GetbranchAward,HelpToStrong,5> <散人殿堂/@@GetbranchAward,HelpToStrong,6>\\"
			-- end
			-- if pLv >= 85 then
			-- 	taskstr = taskstr .. "<(c0xFFf5e31d)[技能]> <游戏推广/@@GetbranchAward,HelpToStrong,8> <秦始皇陵/@@GetbranchAward,HelpToStrong,9>\\"
			-- end

		
		
		--下面的推荐栏 <(c0xFFf5e31d)[经验]><挑战BOSS/@@showWin,96|挑战BOSS每次可获得300万经验>
		if pLv >= 75 then
		--\\<(idecoLine9#195)>
			local strXinShouBaoDian3 ="<技能/@@GetbranchAward,HelpToStrong,8|推荐好友一起来玩#双双免费拿高级技能书>\\"
			if openServerDay>6 then 
				strXinShouBaoDian3 = "<宝石/@@showWin,5,3|对装备槽位镶嵌宝石可获得丰富的属性#宝石通过沙漠土城-勇闯天关获取>\\"
			end

			local strXinShouBaoDian4 ="<押镖/@@GetbranchAward,HelpToStrong,3|可快速获得大量金币,功勋值,功勋可提升军印大幅度增加血量.#每日开启三次双倍押镖,历时参与押镖可获得双倍奖励,少一次就亏大了.>\\"
			if openServerDay>3 then 
				strXinShouBaoDian4 = "<祈福/@@showWin,211|每日有免费祈福机会可获得大量绑定金币.>\\"
			end
			
			taskstr = taskstr .. "<(idecoLine9#195)>\\";

			taskstr = taskstr .. "<(c0xFF4ba0de)[新手宝典]> <变强/@@showWin,129|神炉中拥有以下系统可对实力快速提升.# 1.护符-(生命与魔法增加)# 2.护盾-(物理防御与魔法防御,火墙抗性)# 3.军印-(生命与魔法增加)# 4.宝石-(物法道攻击增加)# 5.圣珠-(暴击几率与暴击伤害)# 6.特戒-(麻痹,重生,护体三大神戒属性暴涨)> <战将/@@showWin,118|战将系统可提升战将对BOSS的伤害.# 1.战将级别可提升战将整体属性.# 2.战将炼体可提升战将对BOSS的伤害.# 3.一个高级别的战将可以承受住BOSS的猛烈进攻!> "..strXinShouBaoDian3
			taskstr = taskstr .. "<(c0xFF4ba0de)[我要装备]> <寻宝/@@showWin,31|可快速获取到高转生装备,经验丹等生活必需品.> <BOSS/@@GetbranchAward,HelpToStrong,5|首领之家拥有海量高级Boss,其中不乏出现高转生级别老怪.#每日产出大量超级极品装备,里面竞争激烈啊!> <殿堂/@@GetbranchAward,HelpToStrong,11|从1到5造就成神之路>\\"
			taskstr = taskstr .. "<(c0xFF4ba0de)[我要升级]> <回收/@@GetbranchAward,HelpToStrong,4|八荒以上装备回收价值性价比> <挂机/@@GetbranchAward,HelpToStrong,12|传送员处可带你进入安全挂机/VIP挂机,各野外地图.#安全地图挂机可获得丰富经验以及系统所需材料.> <除魔/@@GetbranchAward,HelpToStrong,7|每日必做任务,性价比超高,可获得大量内功与经验.#等级与内功同步提升,分分钟跻身进入强者层次.>\\"
			taskstr = taskstr .. "<(c0xFF4ba0de)[我要金币]> <挖矿/@@GetbranchAward,HelpToStrong,10|里面有丰富的矿产宝藏,普通矿石可自动出售兑换绑金#如果你挖到传说中的钻石矿了每颗可兑换500点转生修为哟> <福利/@@GetbranchAward,HelpToStrong,13|加入军团每日可领取各种福利哟~> "..strXinShouBaoDian4
            if string.find(taskstr,"#继续任务#") == nil then
               taskstr = taskstr.."<(btn#日常任务#@@showWin,201#0#)>"
            end

            
			--taskstr = taskstr .. "<(c0xFFf5e31d)[我要技能]> <推广/@@GetbranchAward,HelpToStrong,8|推荐好友一起来玩#双双免费拿高级技能书> <皇陵/@@GetbranchAward,HelpToStrong,9|> <神殿/@@GetbranchAward,HelpToStrong,11|从1到10造就成神之路>\\"
			-- taskstr = taskstr .. "<(c0xFFf5e31d)[强化]><矿洞挖矿/@@GetbranchAward,HelpToStrong,10|里面有丰富的矿产宝藏,普通矿石可自动出售兑换绑金#高级矿石可在万事通锻造真魔核或转生修为#如果你挖到传说中的钻石矿了每颗可兑换1000点转生修为哟> <(c0xFFf5e31d)[金币]><装备回收/@@GetbranchAward,HelpToStrong,4|八荒以上装备回收价值性价比最佳>\\"
			-- if pLv >= 80 then
			-- 	taskstr = taskstr .. "<(c0xFFf5e31d)[装备]><散人殿堂/@@GetbranchAward,HelpToStrong,6|从1到10造就成神之路#VIP玩家推荐去BOSS之家> <(c0xFFf5e31d)[新手]><游戏推广/@@GetbranchAward,HelpToStrong,8|推荐好友一起来玩#双双免费拿高级技能书>\\"
			-- end
			-- taskstr = taskstr .. "<(c0xFFfed700)[什么都要]> <万 事 通/M威龙城:149:140:万事通>\\"
		end
		
		





--		-----------------------------------------------------------------------副本显示
--
--		local fb_list = {
--			{mapid = 91, rd_item = "护符碎片", rd_num = 5000, rd1 = 100, rd2 = 198},
--			{mapid = 92, rd_item = "护盾碎片", rd_num = 5000, rd1 = 100, rd2 = 198},
--			{mapid = 93, rd_item = "宝石结晶", rd_num = 250, rd1 = 100, rd2 = 198},
--			{mapid = 94, rd_item = "圣珠结晶", rd_num = 250, rd1 = 100, rd2 = 198},
--			{mapid = 95, rd_item = "星纹强化石", rd_num = 25, rd1 = 200, rd2 = 398},
--			{mapid = 96, rd_item = "1级羽毛", rd_num = 25, rd1 = 200, rd2 = 398},
--			{mapid = 97, rd_item = "功勋值", rd_num = 500, rd1 = 99999, rd2 = 99999},--功勋是不可翻倍
--		};
--		for i = 1,#fb_list do
--			if mid == fb_list[i].mapid then
--				local mapname,mx,my = Actor.getSceneName(sysarg);
--				local rem_mon = Actor.getLiveMonsterCount(sysarg,0);
--				if rem_mon == 0 and false then
--				taskstr = [[
--
--<(c0xFFef7716)【日常副本】 ]]..mapname..[[ (已完成)>
--
--<(c0xFFdce0cb)  奖励:> <(c0xFF0084ff)]]..fb_list[i].rd_item..[[ +]]..fb_list[i].rd_num..[[>
--\<(idecoLine9#195)>
--
--  <√.免费领取奖励回城/@@GetbranchAward,]]..i..[[,1,rc_fb>
--
--]];
--					if i ~= 7 then
--						taskstr = taskstr ..   [[
--  <√.]]..fb_list[i].rd1..[[元宝领取双倍奖励回城/@@GetbranchAward,]]..i..[[,2,rc_fb>
--
--  <√.]]..fb_list[i].rd2..[[元宝领取三倍奖励回城/@@GetbranchAward,]]..i..[[,3,rc_fb>
--]];
--					end
--
--
--					Actor.sendTipmsg(sysarg, "恭喜您,副本内怪物清理干净了.\\请在右边任务追踪处选择任务奖励吧.", 4);
--				else
--					taskstr = [[
--
--<(c0xFFef7716)【日常副本】 ]]..mapname..[[>
--
--<(c0xFFdce0cb)  目标:> <(c0xFF00cb52)清理剩余的><]]..rem_mon..[[><(c0xFF00cb52)只怪物>
--<(c0xFFdce0cb)  奖励:> <(c0xFF0084ff)]]..fb_list[i].rd_item..[[ +]]..fb_list[i].rd_num..[[>
--<(idecoLine9#195)>
--]];
--				end
--			end
--		end

		
-- 		---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<支线任务>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---
--     if pLv >= 57 then
-- 			local BranchTaskDesc
-- 			local statuDesc = ''
-- 			if var.BranchTaskIndex == nil then
-- 				var.BranchTaskIndex = 1
-- 			end
-- 			--已领取奖励
-- 			if var.BranchTaskComplete and var.BranchTaskComplete[var.BranchTaskIndex] == 2 then
-- 				var.BranchTaskIndex = var.BranchTaskIndex + 1
-- 			end

-- 			if BranchTaskConfig[var.BranchTaskIndex] ~= nil then
-- 				if BranchTaskConfig[var.BranchTaskIndex].needLevel <= pLv then
-- 					if var.BranchTaskEvent == nil or var.BranchTaskEvent[var.BranchTaskIndex] == nil then 
-- 						registerBranchEvent(sysarg,var.BranchTaskIndex)
-- 					end
-- 					local bol
-- 					bol,statuDesc = BranchTaskConditionCheck(sysarg,var.BranchTaskIndex) --开始进行监测

-- 					--已完成
-- 					if var.BranchTaskComplete and var.BranchTaskComplete[var.BranchTaskIndex] == 1 then
-- 						statuDesc = '<(c0xFFF00FF00)(已完成)>'
-- 					end

-- 					BranchTaskDesc = string.format(BranchTaskConfig[var.BranchTaskIndex].branchTaskDesc,statuDesc)
-- 					-- taskstr = taskstr..BranchTaskDesc
-- 				end
-- 			end
-- 		end

-- -------------------------------------------日常任务----------------------------------------------------------

-- 		--//降妖除魔
-- 		if pLv >= 52 then
-- 			if d[3] == 1 then
-- 				str1 = "";
-- 			elseif d[3] == 3 then
-- 				str1 = "";
-- 			elseif d[3] == 2 then
-- 				local mapname = string.sub(d[7], 1, 12);
-- 				str1 = string.format("<(c0xFFffffff)  在><(g%s:0:0:%s)><(c0xFFffffff)杀><(c0xFFfff000)%s/%s><(c0xFFffffff)只怪><(x%s:0:0:0)>\\",d[7],mapname,d[8],d[6],d[7]);				
-- 			end

-- 			taskstr = taskstr .. string.format("\\<(c0xFFF00c0ff)[经验、功勋]> <(c0xFFFff8a00)除魔任务>\\<(c0xFFFA89378)- 回复> <炎龙使者/M比奇城:128:101:炎龙使者> <(x比奇城:128:101:炎龙使者)>\\%s",str1);
-- 		end
			
-- 		--//日常采集珍珠任务追踪
-- --		local PearlTimeFlag = true
-- --		if pLv >= 59 and d[31] >= 0 then
-- --			PearlTimeFlag = false
-- --			str1 = "";
-- --			str2 = "";
-- --			if d[30] == 1 then
-- --				str1 = "";
-- --			elseif d[30] == 2 then
-- --				str1 = string.format("<(c0xFFffffff)在><(c0xFFfff000)%s><(c0xFFffffff)采集><(c0xFFfff000)%s/%s><(c0xFFffffff)颗珍珠\\>","温泉山庄",d[32],10);
-- --			elseif d[30] == 3 then
-- --				str1 = "";
-- --			end
-- --			local num = d[31] 
-- --			if not var.BuyPearlTimes then var.BuyPearlTimes = 3 end
-- --			local nAllNum = 3+(3-var.BuyPearlTimes)
-- --			if num <= 0 then num = 0 end			
-- --			taskstr = taskstr .. string.format("<(c0xFFF00c0ff)[经验、护符]><采集珍珠/M卧龙城:143:180:采珠农女> <(x卧龙城:143:180:采珠农女)>\\%s",str1);
-- --		end
-- 	---------------------------------------	
	
--     --材料副本
-- 		if pLv >= 69 then
-- 			taskstr = taskstr .. string.format("\\<(c0xFFF00c0ff)[材料]> <(c0xFFFff8a00)材料副本>\\<(c0xFFFA89378)- 回复> <副本总管/M比奇城:129:147:副本总管> <(x比奇城:129:147:副本总管)>\\");
-- 		end
		
-- 		---经验塔防
-- --		if pLv >= 70 then
-- --			if d[51] >= 1 then
-- --				str1 = "";
-- --				taskstr = taskstr .. string.format("\\<(c0xFFF00c0ff)[经验]> <(c0xFFFff8a00)经验塔防>\\<(c0xFFFA89378)- 回复> <屠魔将军/M卧龙城:146:184:屠魔将军> <(x卧龙城:146:184:屠魔将军)>\\",str1);
-- --			end
-- --		end
		
-- 		--当日免费采集珍珠用完后
-- 		local PearlTimes = 0
-- 		if var.BuyPearlTimes ~= nil then
-- 			PearlTimes = var.BuyPearlTimes
-- 		end
-- 		if pLv >= 59 and PearlTimeFlag == true and PearlTimes > 0 and (var.days.BuyCaiJiZhenZhuFlag == nil or var.days.BuyCaiJiZhenZhuFlag ~= 1) then
-- 			PearlTimeFlag = false
-- 			str1 = "";
-- 			str2 = "";
-- 			if d[30] == 1 then
-- 				str1 = "";
-- 			elseif d[30] == 2 then
-- 				str1 = string.format("<(c0xFFffffff)在><(c0xFFfff000)%s><(c0xFFffffff)采集><(c0xFFfff000)%s/%s><(c0xFFffffff)颗珍珠\\>","温泉山庄",d[32],10);
-- 			elseif d[30] == 3 then
-- 				str1 = "";
-- 			end
-- 			local num = d[31] 
-- 			if not var.BuyPearlTimes then var.BuyPearlTimes = 3 end
-- 			local nAllNum = 3+(3-var.BuyPearlTimes)
-- 			if num <= 0 then num = 0 end			
-- 			taskstr = taskstr .. string.format("<(c0xFFFF07800)[采集珍珠]> <#cffff0000#购买次数/@@GetbranchAward,104> <(x卧龙城:143:180:采珠农女)>\\%s",str1);
-- 		end
-- 		--当日免费采集珍珠用完后
		
-- 		-- 护送镖车
-- 		if pLv >= 70 then
-- 			taskstr = taskstr .. string.format("\\<(c0xFFF00c0ff)[经验、绑金、灵力]> <(c0xFFFff8a00)护送镖车>\\<(c0xFFFA89378)- 回复> <军需官/M比奇城:191:118:军需官> <(x比奇城:191:118:军需官)>\\");
-- 			if var.ybstate ~= nil and var.ybstate == 1 then
-- 				taskstr = taskstr .. string.format("<(c0xFFFA89378)- 交给> <总镖头/M沙漠土城:201:161:总镖头>\\");
-- 			end
-- 		end
		
		
------------------------------------------------------------------------------------------------------------------------------
		-- 日常经验珠
--		if pLv >= 68 then
--			local useTimes = var.jadeTime
--			if useTimes == nil then useTimes = 0 end
--			
--			local jadeCount = 0 -- 0:为3次经验珠任务都已完成
--			if get_dayflags_from_var(var, actor_dayflags.exp_jade_quest1) == false then
--				jadeCount = 10
--				
--				if useTimes >= 10 then
--					str1 = "<(c0xFFF00FF00)(已完成)>"
--				else
--					str1 = "<(c0xFFFFF0000)(" .. useTimes .. "/10)>"
--				end
--				
--				str2 = "<(c0xFFFFF0000)奖励:><(c0xFFFF07800)2000W经验>  <领奖/@@GetbranchAward,100>"
--				
--			elseif get_dayflags_from_var(var, actor_dayflags.exp_jade_quest2) == false then
--				jadeCount = 20
--				
--				if useTimes >= 20 then
--					str1 = "<(c0xFFF00FF00)(已完成)>"
--				else
--					str1 = "<(c0xFFFFF0000)(" .. useTimes .. "/20)>"
--				end
--				
--				str2 = "<(c0xFFFFF0000)奖励:><(c0xFFFF07800)3000W经验>  <领奖/@@GetbranchAward,100>"
--				
--			elseif get_dayflags_from_var(var, actor_dayflags.exp_jade_quest3) == false then
--				jadeCount = 30
--				
--				if useTimes >= 30 then
--					str1 = "<(c0xFFF00FF00)(已完成)>"
--				else
--					str1 = "<(c0xFFFFF0000)(" .. useTimes .. "/30)>"
--				end
--				
--				str2 = "<(c0xFFFFF0000)奖励:><(c0xFFFF07800)4000W经验>  <领奖/@@GetbranchAward,100>"
--				
--			end
--			
--			if jadeCount ~= 0 then			
--				taskstr = taskstr .. string.format("\\<(c0xFFFFFFF00)[日常经验珠]>\\<(c0xFFFFF0000)使用><(c0xFFF00FF00)%d颗><经验珠/@@GetbranchAward,101>%s <#cffff0000#购买/@@ShowBuyWin,479>\\%s", jadeCount, str1, str2)
--				taskstr = taskstr .. string.format("\\<(c0xFFFFF0000)快速聚集:><副本总管/M卧龙城:175:173:副本总管> <屠魔将军/M卧龙城:146:184:屠魔将军>")				
--			end
--		end
--		
--		-- 日常跑环任务
--		if pLv >= CircleQuestCfg.needLevel then
--			local finishQuestId = var.days.CircleQuestId
--			if finishQuestId == nil then finishQuestId = 0 end
--			
--			if finishQuestId < #CircleQuestCfg.List then			
--				local questCfg = CircleQuestCfg.List[finishQuestId + 1] -- 下一个任务
--				local npcName = System.getNpcName(questCfg.npcId)
--				local npcPos = string.format("%s:%d:%d:%s", questCfg.scencename, questCfg.npcPos[1], questCfg.npcPos[2], npcName)				
--				
--				str1 = string.format("<%s/M%s> <(x%s)>", npcName, npcPos, npcPos)
--		
--				taskstr = taskstr .. string.format("\\\\<(c0xFFFFFFF00)[日常跑环]>\\<(c0xFFFFF0000)任务%d:>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)350W经验、10W绑金>", finishQuestId + 1, str1);				
--				taskstr = taskstr .. "\\     <一键完成全部跑环/@@GetbranchAward,105>"
--			end
--		end

		---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<支线任务>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---	

		if pLv >= 70 then
			deleteGuideFollower(sysarg,1);
		end
		
		--把整个任务栏发到前端
		SpecialQuest_UpdateTitle(sysarg,QuestId,taskstr);
		
		--完成战无双的特效
		if needChuan == true then
			Actor.showFastBtnEffect(sysarg,5000,"威龙城:138:130:战无双")
		end
		
		--任务的时候显示箭头
		local ta = task_all[get_taskflags_val(sysarg)]
		local dVar = Actor.getDyanmicVar(sysarg)
		if dVar.chuanzi==nil then 
			dVar.chuanzi ={}
		end
        if ta ~= nil then  
			if get_taskflags_val(sysarg)==92  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
				--Actor.openarrowsguide(sysarg,1006,50,200,2)
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:125:139:万事通")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==94  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:131:133:传送员")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==97  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1

					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:117:157:游戏推广员")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==100  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:121:161:转生地宫")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==102  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:125:165:首领之家")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==104  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:131:171:副本管理员")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==106 and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:144:158:军团使者")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==108  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:149:151:炼狱")	
					DataPack.flush(netPack)
				end
			elseif get_taskflags_val(sysarg)==110  and ta.lv <= pLv then 
				if dVar.chuanzi[get_taskflags_val(sysarg)] ==nil then 
					dVar.chuanzi[get_taskflags_val(sysarg)] = 1
					local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					DataPack.writeByte(netPack,3)
					DataPack.writeInt(netPack,5000)
					DataPack.writeString(netPack,"威龙城:139:141:天神护体")	
					DataPack.flush(netPack)
				end
			--else 
				--Actor.openarrowsguide(sysarg,1006,500,500,1)
					--local netPack = DataPack.allocPacket(sysarg, 26 , 83)
					--DataPack.writeByte(netPack,2)
					--DataPack.writeInt(netPack,5000)
					--DataPack.flush(netPack)
			end
		end
		
	end
end

function sendHyperLink(sysarg,link)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendHyperLink)
	DataPack.writeString(netPack,link)
	DataPack.flush(netPack)
end

-----------------------------------我要变强任务-------------------------------------------------
--由于前端显示分开为两个面板单独显示   后端也单独分开hwei
function SpecialQuest_RefrshStrongQuest(sysarg)
-- 	local QuestId = 5001;
-- 	if Actor.hasQuest(sysarg,QuestId) == false then Actor.addQuest(sysarg,QuestId) end
-- 	if Actor.hasQuest(sysarg,QuestId) then
-- 		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
-- 		local var = Actor.getStaticVar(sysarg);
-- 		local d = var.d;
-- 		local taskstr = "";
-- 		local branchTaskStr = "" --支线1
-- 		local branchTaskStr1 = "" --支线2
-- 		--//日常降妖除魔任务追踪
-- 		local str1 = "";
-- 		local str2 = "";
-- 		if pLv >= 50 then
-- 			taskstr = taskstr .. string.format("<(c0xFFFFFFF00)[我要装备]><合成/@@showWin,120> <BOSS/@@showWin,96>\\");
-- 		end
		
-- 		if pLv >= 50 then
-- 			taskstr = taskstr .. string.format("<(c0xFFFFFFF00)[我要升级]><回收/@@showWin,120> <挂机/M比奇城:137:121:传送员> <(x比奇城:137:121:传送员)>\\");
-- 			--taskstr = taskstr .. string.format("<(c0xFFFF07800)[我要升级]> <会员打宝/M卧龙城:181:188:会员打宝> <(x卧龙城:181:188:会员打宝)>\\");
-- 		end
-- --		if pLv >= 50 then
-- --			taskstr = taskstr .. string.format("<(c0xFFFFFFF00)[我要金币]><押镖/M比奇城:137:121:押镖> <挖矿/M比奇城:137:121:矿工> <(x比奇城:137:121:矿工)>\\");
-- --		end

-- 		SpecialQuest_UpdateTitle(sysarg,QuestId,taskstr);
-- 	end

end
-------------------------------------------------------------------------------------------

--获得脚本任务的标题
function SpecialQuest_GetTitle(sysarg, qid)
	local funcs = SpecialQuestFuncs[qid]
	if funcs == nil then
		--print("SpecialQuest_GetTitle SpecialQuestFuncs["..qid.."]==nil")
		return ""
	end
	
	local func = funcs[1]
	if func == nil then
		--print("SpecialQuest_GetTitle GetTitle["..qid.."]==nil")
		return ""
	end
	
	return func[1](sysarg, qid, func[2])
end

--检查任务是否能做该任务
function SpecialQuest_CanQuest(sysarg, qid)
	local funcs = SpecialQuestFuncs[qid]
	if funcs == nil then
		--print("SpecialQuest_CanQuest SpecialQuestFuncs["..qid.."]==nil")
		return false
	end
	
	local func = funcs[2]
	if func == nil then
	--	--print("SpecialQuest_CanQuest CanQuest["..qid.."]==nil")
		return false
	end
	
	return func[1](sysarg, qid, func[2])
end

--检查任务是否能完成
function SpecialQuest_CanFinish(sysarg, qid)
	local funcs = SpecialQuestFuncs[qid]
	if funcs == nil then
		--print("SpecialQuest_CanFinish SpecialQuestFuncs["..qid.."]==nil")
		return false
	end
	
	local func = funcs[3]
	if func == nil then
		--print("SpecialQuest_CanFinish CanFinish["..qid.."]==nil")
		return false
	end
	
	return func[1](sysarg, qid, func[2])
end

--完成任务获取奖励。没有奖励则返回-1，领取奖励成功则返回0，不能领取奖励则返回错误码(QuestErrorCode)
function SpecialQuest_GetAward(sysarg, qid)
	local funcs = SpecialQuestFuncs[qid]
	if funcs == nil then
		return -1
	end
	
	local func = funcs[4]
	if func == nil then
		return -1
	end
	
	return func[1](sysarg, qid, func[2])
end

function SpecialQuest_UpdatePic(sysarg,picid)
	local netPack = DataPack.allocPacket(sysarg, 6, 19)
	DataPack.writeShort(netPack, picid)

	DataPack.flush(netPack)
end

function SpecialQuest_UpdateTitle(sysarg, qid, title)
    if System.isCrossServer() == true then return end
	local netPack = DataPack.allocPacket(sysarg, 6, 18)
	DataPack.writeShort(netPack, qid)
	DataPack.writeString(netPack, title)
		
	DataPack.flush(netPack)
end

function SpecialQuest_UpdateTitleToClient(sysarg, qid)
	local title = SpecialQuest_GetTitle(sysarg, qid)
	if title == nil then return end
	
	SpecialQuest_UpdateTitle(sysarg, qid, title)
end

-- 跑环任务一键全部完成
function CircleQuestFastFinishMsgBox(sysarg)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < CircleQuestCfg.needLevel then return end
	
	local var = Actor.getStaticVar(sysarg);
	local finishQuestId = var.days.CircleQuestId
	if finishQuestId == nil then finishQuestId = 0 end
			
	local leftCount = #CircleQuestCfg.List - finishQuestId
	if leftCount <= 0 then return end
		
	local str = string.format("花费<(c0xFF00FF00)%d>元宝将剩下的<(c0xFF00FF00)%d>环任务一键完成，可获得<(c0xFF00FF00)%d万>经验和<(c0xFF00FF00)%d万>绑金", leftCount*5, leftCount, leftCount*350, leftCount*10)
	Actor.messageBox(sysarg,0,0,str, "确定/CircleQuestFastFinish,1", "取消/CircleQuestFastFinish,0", NULL, 0)
end

function CircleQuestFastFinish(sysarg, btn)
	btn = tonumber(btn)
	if btn ~= 1 then return end
	
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < CircleQuestCfg.needLevel then return end
	
	local var = Actor.getStaticVar(sysarg);
	local finishQuestId = var.days.CircleQuestId
	if finishQuestId == nil then finishQuestId = 0 end
			
	local leftCount = #CircleQuestCfg.List - finishQuestId
	if leftCount <= 0 then return end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	local needYb = leftCount * 5
	if myYb < needYb then
		SendRecommendTips(sysarg, "1")
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -needYb, GameLog.cDayQuestCircle, "FastFinish") == false then
		return
	end
	
	local awards = { { type = 2, id = 0, count = leftCount*3500000 }, { type = 5, id = 0, count = leftCount*100000 }, }
	if Awards.Give(sysarg, awards, GameLog.cDayQuestCircle, "FastFinish") == false then
		return
	end
	
	var.days.CircleQuestId = #CircleQuestCfg.List -- 完成所以任务
	local str = string.format("您一键完成了所有跑环任务,获得<(c0xFF00FF00)%d万>经验和<(c0xFF00FF00)%d万>绑金奖励!", leftCount*350, leftCount*10)
	Actor.sendTipmsg(sysarg, str, ttFlyTip)
	
	-- 刷新任务
	Quest_ShuaXin(sysarg)
	
end

--领取支线奖励 // 20160904: 主线任务点击触发的函数  (点击任务栏，处理的函数)
function GetbranchAward(sysarg,...)
		----print(999999)
	local params = arg[1]

	--买日常除魔的次数
	if params[1]=="buyRCCM" then
		Buy_RiChangChuMo(sysarg)
	end
	
	if params[1]=="buyqixindao" then
	
		local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
		local itemid = YinShiDaDuNeedDao(sysarg)
			
		local okBtn = string.format("%s/buyDao_sureFuncEx", "确定")
		local cancelBtn = string.format("%s/buyDao_cancelBtnEx", "取消")
		Actor.messageBox(sysarg, 0, 0, "是否用98元宝购买"..Item.getItemName(itemid).."立即完成任务?", okBtn, cancelBtn, NULL,0,0,NULL,0,0)
		
		function buyDao_sureFuncEx(sysarg)
			--判断金钱
			if Actor.getMoneyCount(sysarg,3) < 98 then
				Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
				return 
			end
			
			if Item.getBagEmptyGridCount(sysarg)<1 then 
				Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
				return 
			end
			
			local var = Actor.getStaticVar(sysarg)
			if var.betonSHENJIAFinish~=nil and var.betonSHENJIAFinish~=0 then 
				return 
			end
			
			Actor.changeMoney( sysarg, 3, -98, LogIds.yinshilaoren, "隐世老人任务买武器")
			Actor.addItem(sysarg, itemid,0,0,1,1,0,"隐世老人任务买武器",LogIds.yinshilaoren)
		end
		
		function buyDao_cancelBtnEx(sysarg)
		end
		
		return 
	end
	
	--传送并打开npc
	if params[1]=="HelpToStrong" then 
        --判断是否在行会BOSS副本中
        local nFubenId = Actor.getFubenId(sysarg)
        if nFubenId > 0 then
            for i = 1,#GuildFubenBossCfg.list do
                if GuildFubenBossCfg.list[i].ref.fubenid == nFubenId  then
                    Actor.exitFuben(sysarg)
                    --Actor.telportSceneRandPos(sysarg,"沙漠土城")
                    break
                end

            end
        end
		local index = tonumber(params[2])
		local dvar=Actor.getDyanmicVar(sysarg)
		dvar.HelpToStrongIndex=index
		if index==1 then 
			Actor.enterScene(sysarg,9,111,151)
		elseif index==2 then 
			Actor.enterScene(sysarg,9,146,151)
		elseif index==3 then 
			Actor.enterScene(sysarg,9,151,143)
		elseif index==4 then 
			Actor.enterScene(sysarg,9,115,152)
		elseif index==5 then 
			Actor.enterScene(sysarg,9,126,162)
		elseif index==6 then 
			Actor.enterScene(sysarg,9,123,119)
		elseif index==7 then 
			Actor.enterScene(sysarg,9,135,130)
		elseif index==8 then 
			Actor.enterScene(sysarg,9,119,154)
		elseif index==9 then 
			Actor.enterScene(sysarg,83,150,124)
		elseif index==10 then 
			Actor.enterScene(sysarg,343,64,70)
		elseif index==11 then 
			Actor.enterScene(sysarg,9,123,119)
		elseif index==12 then 
			Actor.enterScene(sysarg,9,131,137)
		elseif index==13 then 
			Actor.enterScene(sysarg,9,143,157)
		end
		Actor.addTimer(sysarg,26,500)
	end
	
	--传送并打开npc
	if params[1]=="StrongStoneFromWhere" then 
		local index = tonumber(params[2])
		local dvar=Actor.getDyanmicVar(sysarg)
		dvar.StrongStoneFromWhereIndex=index
		if index==1 then 
			Actor.openDialogs(sysarg,6)
		elseif index==2 then 
			Actor.enterScene(sysarg,9,131,171)
			Actor.addTimer(sysarg,26,500)
		elseif index==3 then 
			Actor.enterScene(sysarg,9,131,133)
			Actor.addTimer(sysarg,26,500)
		end

  elseif params[1]=="brotherBranchTask" then --结义支线
		
			local var = Actor.getStaticVar(sysarg)
			if var.brotherBranchTask ==nil then 
				var.brotherBranchTask =1
				local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
				System.AddMail(actor_id,6,0,"结义支线","结义支线",0,0,"6216,9,1")
			end
			Actor.openDialogs(sysarg, 238)
			Quest_ShuaXin(sysarg)
			return 
  end
		
	--进入散人殿堂
	if params[1] =="shenmizhidain" then 
		--不管分流
		--local layer = tonumber(params[2])
		--if layer ==3 then 
		--	if GetNpcANYINMIDIAN().IsMaxActor(100) ==false then  
		--		Actor.enterScene(sysarg,100,105,102);
		--	else 
		--		local haveenter = false 
		--		for i,v in pairs(GetNpcANYINMIDIAN().data.scene3.sceneId3) do 
		--			if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
		--				Actor.enterScene(sysarg,v,105,102)
		--				haveenter =true
		--				break
		--			end
		--		end
		--		if haveenter ==false then 
		--			Actor.enterScene(sysarg,GetNpcANYINMIDIAN().data.scene3.sceneId3[5],105,102)
		--		end
		--	end
		--else
		--	if GetNpcANYINMIDIAN().IsMaxActor(99) ==false then  
		--		Actor.enterScene(sysarg,99,105,102);
		--	else 
		--		local haveenter = false 
		--		for i,v in pairs(GetNpcANYINMIDIAN().data.scene2.sceneId2) do 
		--			if GetNpcANYINMIDIAN().IsMaxActor(v) ==false then  
		--				Actor.enterScene(sysarg,v,105,102)
		--				haveenter =true
		--				break
		--			end
		--		end
		--		if haveenter ==false then 
		--			Actor.enterScene(sysarg,GetNpcANYINMIDIAN().data.scene2.sceneId2[5],105,102)
		--		end
		--	end
		--end
		
		local layer = tonumber(params[2])
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		--if pLv<80 then  --少于80的进入口
		--	layer = 1
		--else
		--	layer = 2
		--end
		--if layer ==1 then 
		--	Actor.enterScene(sysarg,98,105,102);
		--	Actor.addTimer(sysarg,25,2000)
		--elseif layer ==3 then 
		--	Actor.enterScene(sysarg,100,105,102);
		--	Actor.addTimer(sysarg,25,2000)
		--elseif layer ==5 then 
		--	Actor.enterScene(sysarg,102,105,102);
		--	Actor.addTimer(sysarg,25,2000)
		--elseif layer ==6 then 
		--	Actor.enterScene(sysarg,103,105,102);
		--	Actor.addTimer(sysarg,25,2000)
		--end
		local sceneIds ={[1]=98,[2]=99,[3]=100,[4]=101,[5]=102,[6]=103,[7]=230,[8]=231,[9]=232,[10]=233}
		Actor.enterScene(sysarg,sceneIds[layer],105,102)
		Actor.addTimer(sysarg,25,2000)
		
		--Actor.enterScene(sysarg,100,105,102); 
		OnFinish_Liveness(sysarg,11)
		return 
	end

	--主线任务
   	---------------------------------------------------------------------------------------------------以下是主线任务
	local mid = Actor.getSceneId(sysarg);
	local tvar = get_taskflags_val(sysarg);
    local ta = task_all[tvar];

	if ta ~= nil and ta.type == 3 then
		if ta.mapid == 1 then 
			local cond =false
			for _,v in ipairs(ActorInitConfig.nCreateInitFb[1].createPos) do --分流
				if v.nScenceID == mid then 
					cond =true
				end
			end
			if cond==true then 
				Actor.autoFindPathToKillMonster(sysarg, mid , ta.mx , ta.my , ta.monid);
			else 
				Actor.autoFindPathToKillMonster(sysarg, 1 , ta.mx , ta.my , ta.monid);
			end
		else 
			if ta.mapid == 235 or  ta.mapid == 236 or ta.mapid == 237 then --在个人副本里面不值是打特定怪
				Actor.openguajiGuide(sysarg, 1)
			else 
				Actor.autoFindPathToKillMonster(sysarg, ta.mapid , ta.mx , ta.my , ta.monid);
			end
		end
		--Actor.openguajiGuide(sysarg, 1);
	end
	
	--日常除魔(按任意怪挂机)
	if params[1]=="richangchumo" then 
		Actor.openguajiGuide(sysarg,1)
	end
	
	--微端登录
	if params[1]=="weiduandenglu" then 
		local netPack = DataPack.allocPacket(sysarg, 139, 215)  --申请一个数据包
		if netPack then
			DataPack.flush(netPack)
		end
	end
	
	--材料副本
	-------------------------------------------------------------------------------------------------以下是副本奖励领取
	--local dvar = Actor.getDyanmicVar(sysarg) 
	----print("dvar.onFcailiaoFB="..dvar.onFcailiaoFB)
	--if not (dvar.onFcailiaoFB ~= nil and dvar.onFcailiaoFB ==1 )then 
	--	return 
	--end

	if params then
	    local a = tonumber(params[1]);
	    local b = tonumber(params[2]);
	    local YanZheng = params[3];
		if YanZheng == "rc_fb" then
			--print("a="..a)
			if a<1 or a>12 then
				System.trace("非法参数-领取副本奖励。"..Actor.getName(sysarg))
				return 
			end
			if a==8 then 
				a=51
			end
			
			if a==9 then 
				a=57
			end
			
			if a==10 then 
				a=58
				
				--特殊处理，var44是跨天之后再赋值的，有的玩家在更新之前就已经跨天了。。-----------
				local avar = Actor.getStaticVar(sysarg);
				avar.enterFu44=1
			end
			
			
			if a==11 then 
				a=59
				
				--特殊处理，var44是跨天之后再赋值的，有的玩家在更新之前就已经跨天了。。-----------
				local avar = Actor.getStaticVar(sysarg);
				avar.enterFu46=1
			end
			
			if a==12 then 
				a=60
				
				--特殊处理，var44是跨天之后再赋值的，有的玩家在更新之前就已经跨天了。。-----------
				local avar = Actor.getStaticVar(sysarg);
				avar.enterFu48=1
			end
			
		
			if not FubenAwardCfg[a] then return; end
			local delgold = 0
			local Itemcount = 0
			local aid  =0
			local myexp = 0
			local needAddItem =1
            if b ~= 1 and b ~= 2 then 
                System.trace("非法参数-领取副本奖励。"..Actor.getName(sysarg))
                return
            end --校验
			Itemcount=FubenAwardCfg[a].award[2].count * 2
			myexp=FubenAwardCfg[a].award[1].count * 2
			aid=FubenAwardCfg[a].award[2].id

			if b == 2 then 
				delgold = FubenAwardCfg[a].doubleConsume.count 
				--白银特权
				if IsSpeciaTitleVip(sysarg,2)==true then 
					delgold = math.floor(delgold *0.8)
				end
				Itemcount=Itemcount*3
				myexp=myexp*3
				
				--大吉大利的时候，计算使用多倍的次数
				local svar = System.getStaticVar()
				if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<2 or svar.isDringDaJiDaLi>3)==false then 
					local tagrtVar = Actor.getStaticVar(sysarg)
					ClearDaJiDaLi_Data(sysarg,9)
					if tagrtVar.DJDL_Data.getduobeifuben==nil then 
						tagrtVar.DJDL_Data.getduobeifuben=1
					else
						tagrtVar.DJDL_Data.getduobeifuben = tagrtVar.DJDL_Data.getduobeifuben +1
					end
				end
				
				
			end 
			--老兵回归 双倍
            local sys = System.getStaticVar()
            if sys.oldplayer ~= nil then
                local aVar = InitOldPlayerReturnInfo(sysarg)
                if aVar.oldplayret.isold == 1 then
                    Itemcount = Itemcount * OldPlayerReturnCfg[1].Daily.rate
                    myexp = myexp * OldPlayerReturnCfg[1].Daily.rate
                end
            end
			if Actor.getMoneyCount(sysarg,3) < delgold then Actor.sendTipmsg(sysarg, string.format("元宝小于 <%s> ,领取多倍失败.\\您可以选择领取正常奖励或者进行元宝充值.",delgold), 4); return; end
			
			--if get_d_val(sysarg,fb_list[a].var) < 1 then System.telportScene(sysarg,9,139,146); Quest_ShuaXin(sysarg); return; end
			local var =20
			if a>=1 and a<=6 then 
				var=var+a-1
			elseif  a == 7 then
				var=32
			elseif  a == 51 then
				var=40
			elseif  a == 57 then
				var=42
			elseif a==58 then 
				var =44
			elseif a==59 then 
				var =46
			elseif a==60 then 
				var =48
			end
			
            if get_d_val(sysarg,var) <= 0 then 
                System.trace("非法参数-领取副本奖励。剩余次数:"..get_d_val(sysarg,var).."name:"..Actor.getName(sysarg))
                return
            end
			--if not (get_taskflags_val(sysarg)== 95 and a==1  )then 
				del_d_val(sysarg,var,1)
			--end
			
			local fubenName="护符"
			if a==2 then 
				fubenName="护盾"
			elseif a==3 then 
				fubenName="宝石"
			elseif a==4 then 
				fubenName="圣珠"
			elseif a==5 then 
				fubenName="强化"
			elseif a==6 then 
				fubenName="羽毛"
			elseif a==7 then 
				fubenName="功勋"
			elseif a==51 then 
				fubenName="斗笠"
			elseif a==57 then 
				fubenName="修真"
			elseif a==58 then 
				fubenName="坐骑"
			elseif a==59 then 
				fubenName ="血练"
			elseif a==60 then 
				fubenName ="戒灵"
			end
			
			Actor.changeMoney(sysarg,3,-delgold,2126,fubenName.."多倍");	--副本元宝扣除
			
			--使用了特权，提示
			if b == 2 then 
				if IsSpeciaTitleVip(sysarg,2)==true then 
					Actor.sendTipmsg(sysarg,string.format("白银特权8折领取三倍奖励消费元宝%s",delgold),ttFlyTip)
				end
			end
		
			local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			local szActorName = Actor.getName(sysarg)

			if a==1 then 
				Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + Itemcount));
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "护符碎片"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
			
				System.sendCommonLog(LogIds.hufusuipian,nActorId,szActorName,Actor.getUIntProperty(sysarg, 124) - Itemcount,Actor.getUIntProperty(sysarg, 124),Itemcount)
		
			elseif a==2 then 
				Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + Itemcount));
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "护盾碎片"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
				
				System.sendCommonLog(LogIds.hudunsuipian,nActorId,szActorName,Actor.getUIntProperty(sysarg, 126) - Itemcount,Actor.getUIntProperty(sysarg, 126),Itemcount)
				
			elseif a==3 then
				Actor.setUIntProperty(sysarg, 125, (Actor.getUIntProperty(sysarg, 125) + Itemcount));
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "宝石结晶"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
				
				System.sendCommonLog(LogIds.baoshijiejing,nActorId,szActorName,Actor.getUIntProperty(sysarg, 125) - Itemcount,Actor.getUIntProperty(sysarg, 125),Itemcount)
				
			elseif a==4 then
				Actor.setUIntProperty(sysarg, 127, (Actor.getUIntProperty(sysarg, 127) + Itemcount));
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "圣珠结晶"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
				
				System.sendCommonLog(LogIds.shengzhujiejing,nActorId,szActorName,Actor.getUIntProperty(sysarg, 127) - Itemcount,Actor.getUIntProperty(sysarg, 127),Itemcount)
				
			elseif a==7 then 
				Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, (Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE) + Itemcount));
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "功勋值"), 1);
				Actor.playEnergyEffect(sysarg,4,0)
				
				System.sendCommonLog(LogIds.gongxuanlingpai,nActorId,szActorName,Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE) - Itemcount,Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE),Itemcount)
				
			elseif a==51 then 
				local mvar = Actor.getStaticVar(sysarg)
				if mvar.MianJinZhi ==nil then  mvar.MianJinZhi =0 end
				mvar.MianJinZhi = mvar.MianJinZhi + Itemcount
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "斗笠精华"), 1);
				Actor.playEnergyEffect(sysarg,11,0)
				--local netPack = DataPack.allocPacket(sysarg,8,32) --特效
				--DataPack.flush(netPack)
				
				--增加了斗笠精华应该通知前端的
				SendMianJuInfo(sysarg)
				
				System.sendCommonLog(LogIds.doulijinhua,nActorId,szActorName,mvar.MianJinZhi - Itemcount,mvar.MianJinZhi,Itemcount)
			elseif a==59 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "血练精华"), 1);
				Actor.playEnergyEffect(sysarg,11,0)
				
				local nowValue =Actor.getXueLianValue(sysarg)
				Actor.setXueLianValue(sysarg,nowValue+Itemcount)
				
				System.sendCommonLog(LogIds.xuelianValue,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,nowValue , Actor.getXueLianValue(sysarg), "","","血练副本","","")
			elseif a==60 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, "戒灵粉尘"), 1);
				Actor.playEnergyEffect(sysarg,11,0)
				
				local nowValue =Actor.getRingGodValue(sysarg)	
				Actor.setRingGodValue(sysarg,nowValue+Itemcount)
				
				System.sendCommonLog(LogIds.UseRingGodAddValueItem,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,nowValue , Actor.getRingGodValue(sysarg), "","","戒灵副本","","")
				
			else 
				local count = 0
				count =Item.getAddItemNeedGridCount(sysarg,aid,Itemcount)
				local bagIdxs = Item.getBagEmptyGridCount(sysarg)
				if bagIdxs < count then 
					Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品，将以邮件方式下发", ttFlyTip + ttChatWindow)
					
					local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
					local awardIdAndCount=0
					awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,Itemcount)
					awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,aid)
					System.AddMail(myID,6,0,"材料副本奖励","此邮件为材料副本奖励，只要按一键提取就可以领取奖品",awardIdAndCount,0)
					needAddItem=0
				end
				if needAddItem ==  1 then 
					Actor.addItem(sysarg,aid,0,0,Itemcount,1,0,"材料副本奖励")
					Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", Itemcount, FubenAwardCfg[a].award[2].name), 1)
				end
			end
			Actor.addExp(sysarg,myexp)
			--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", myexp, FubenAwardCfg[a].award[1].name), 1);
			
            OnFinish_Liveness(sysarg,10)
			--dvar.onFcailiaoFB=0
			Quest_ShuaXin(sysarg)
			if Actor.getSceneId(sysarg) ~=9 then
              
                --Actor.enterScene(sysarg,9,131,167)
				System.telportScene(sysarg,9,131,167)
			end
			
			--材料副本的主线任务，特殊处理
			--if (get_taskflags_val(sysarg) ==95 and a==1) then
			--	set_taskflags_val(sysarg,get_taskflags_val(sysarg)+1)
			--	Quest_ShuaXin(sysarg)
			--	--Actor.addTimer(sysarg,14,1000)
			--end
		
		
			--local fb_list = {
			--	{mapid = 91, rd_item = "护符碎片", rd_num = 5000, rd1 = 100, rd2 = 198, var = 20},
			--	{mapid = 92, rd_item = "护盾碎片", rd_num = 5000, rd1 = 100, rd2 = 198, var = 21},
			--	{mapid = 93, rd_item = "宝石结晶", rd_num = 250, rd1 = 100, rd2 = 198, var = 22},
			--	{mapid = 94, rd_item = "圣珠结晶", rd_num = 250, rd1 = 100, rd2 = 198, var = 23},
			--	{mapid = 95, rd_item = "星纹强化石", rd_num = 25, rd1 = 200, rd2 = 398, var = 24},
			--	{mapid = 96, rd_item = "1级羽毛", rd_num = 25, rd1 = 200, rd2 = 398, var = 25},
			--	{mapid = 97, rd_item = "功勋值", rd_num = 500, rd1 = 9999, rd2 = 9999, var = 32},--功勋是不可翻倍
			--};
            --
			--if not fb_list[a] then return; end
            --
			--local rem_mon = Actor.getLiveMonsterCount(sysarg,0);
            --
			--if rem_mon > 0 then Actor.sendTipmsg(sysarg, "把副本内怪物清理干净才可以领取奖励哟~", 256); 
			--	OnSendTheResultOfAwards(sysarg,0)
			--return; end
			--local delgold = 0;
            --
			--if b == 2 then delgold = fb_list[a].rd1; end
			--if b == 3 then delgold = fb_list[a].rd2; end
            --
			--if delgold == 0 and b ~= 1 then delgold = 99999999; end
			--
			----判断数量
			--if fb_list[a].rd_item == "星纹强化石" or fb_list[a].rd_item == "1级羽毛" then
			--
			--	local count = 0
			--	local aid  =0
			--	if fb_list[a].rd_item == "星纹强化石" then
			--		aid = 459
			--	else 
			--		aid = 464
			--	end
			--	local anum = fb_list[a].rd_num * b;
			--	count =Item.getAddItemNeedGridCount( sysarg,aid,anum)
			--	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
			--	if bagIdxs < count then 
			--		Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
			--		OnSendTheResultOfAwards(sysarg,0)
			--		return 
			--	end
			--	
			--end
            --
			--
			--if Actor.getMoneyCount(sysarg,3) < delgold then Actor.sendTipmsg(sysarg, string.format("元宝小于 <%s> ,领取多倍失败.\\您可以选择领取正常奖励或者进行元宝充值.",delgold), 4); return; end
            --
			--if get_d_val(sysarg,fb_list[a].var) < 1 then System.telportScene(sysarg,9,139,146); Quest_ShuaXin(sysarg); return; end
            --
			--del_d_val(sysarg,fb_list[a].var,1)
			--
			--Actor.changeMoney(sysarg,3,-delgold);	--副本元宝扣除
			--
			--OnFinish_Liveness(sysarg,10)
			--OnSendTheResultOfAwards(sysarg,1)
			--
			--if fb_list[a].rd_item == "护符碎片" then
			--	local num = fb_list[a].rd_num * b;
			--	Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + num));
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--end
			--if fb_list[a].rd_item == "护盾碎片" then
			--	local num = fb_list[a].rd_num * b;
			--	Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + num));
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--end
			--if fb_list[a].rd_item == "宝石结晶" then
			--	local num = fb_list[a].rd_num * b;
			--	Actor.setUIntProperty(sysarg, 125, (Actor.getUIntProperty(sysarg, 125) + num));
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--end
			--if fb_list[a].rd_item == "圣珠结晶" then
			--	local num = fb_list[a].rd_num * b;
			--	Actor.setUIntProperty(sysarg, 127, (Actor.getUIntProperty(sysarg, 127) + num));
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--end
			--if fb_list[a].rd_item == "星纹强化石" then
			--	System.telportScene(sysarg,9,139,146);
			--	local num = fb_list[a].rd_num * b;
			--	Actor.addItem(sysarg,459,0,0,num,1);
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--	return --防止捡到物品的时候刷新两次，弹出提示怪物杀完。
			--end
			--if fb_list[a].rd_item == "1级羽毛" then
			--	System.telportScene(sysarg,9,139,146);
			--	local num = fb_list[a].rd_num * b;
			--	Actor.addItem(sysarg,464,0,0,num,1);
			--    Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--	return 
			--end
			--if fb_list[a].rd_item == "功勋值" then
			--	local num = fb_list[a].rd_num;
			--	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, (Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE) + num));
			--	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", num, fb_list[a].rd_item), 1);
			--end
			--Quest_ShuaXin(sysarg);
			--System.telportScene(sysarg,9,139,146);
			--return
		end
	end





















































	--getBranchTaskAward(sysarg,branchId)
	-- local var = Actor.getStaticVar(sysarg)
	-- local result = false
	-- if branchId == 1 or branchId == 2 then  --穿戴两件60级装备
	-- 	if not var.branchAwardFlag then
	-- 		local  nCount = Actor.GetEquipCountByLevel(sysarg,60)
	-- 		if nCount >= 2 then
	-- 			result = true
	-- 			if not Awards.CheckBagGridCount(sysarg,BranchAward[1]) then
	-- 				return	
	-- 			end
	-- 			var.branchAwardFlag = 1
	-- 			Awards.Give(sysarg,BranchAward[1],2300,"领取60级装备奖励")
	-- 			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf667,2048)
	-- 			System.broadcastTipmsg(string.format(Lang.ScriptTips.zf671,Actor.getName(sysarg)),2)
	-- 		end
	-- 	end
	-- elseif branchId == 3 then --穿戴一件特戒
	-- 	local nItem = Item.getEquipByType(sysarg,Item.itSpecialRing)
	-- 	if nItem ~= nil then
	-- 		result = true
	-- 		if not Awards.CheckBagGridCount(sysarg,BranchAward[2]) then
	-- 			return	
	-- 		end
	-- 		var.branchAwardFlag = 2
	-- 		Awards.Give(sysarg,BranchAward[2],2300,"领取特戒奖励")
	-- 		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf668,2048)
	-- 		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf673,Actor.getName(sysarg)),2)

	-- 	end
	-- end
	-- Quest_ShuaXin(sysarg)
	-- if result == false then
	-- 	if branchId == 1 then
	-- 		Actor.openDialogs(sysarg,99,10)
	-- 	elseif branchId == 2 then
	-- 		Actor.openDialogs(sysarg,96,0)
	-- 	elseif branchId == 3 then
	-- 		Actor.openDialogs(sysarg,99,12)
	-- 	end
	-- end
end

