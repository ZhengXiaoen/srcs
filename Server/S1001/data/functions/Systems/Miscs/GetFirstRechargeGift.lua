--#include "data\config\activity\ActivityGiftConfig.lua" once
--#include "data\functions\SpecialQuest.lua" once
--#include "data\functions\modules\misc.lua" once
--#include "data\functions\SpecialQuest.lua" once
MiscsImplement.GetFirstRechargeInfo = function(sysarg)

	local var = Actor.getStaticVar( sysarg )
	local firstRecharge = var.FirstRechargeFlag
	if not firstRecharge then
		firstRecharge = 0
	end
	
	local nYuanBao = var.nYuanBao
	if not nYuanBao then nYuanBao = 0 end
	
	local npack = DataPack.allocPacket(sysarg,139,92)
	if nYuanBao > 0 and firstRecharge ~= 2 then
		DataPack.writeByte(npack,0)
	elseif firstRecharge ~= 2 then  
		DataPack.writeByte(npack,0)
	else
		DataPack.writeByte(npack,1)
	end
	DataPack.flush(npack)  
	
end

MiscsImplement.BuyEveryDayPreference = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	local today = System.getToday()
	local pending = var.everyDayPreferenceGrant
	-- 已付款的待补发记录放在 days 外；跨天后先补上一笔，不重复扣款。
	if pending ~= nil then
		if pending.paid ~= true or pending.paymentInFlight or pending.needsReview then
			Actor.sendTipmsg(sysarg, "上次购买需要核对付款和发奖记录，请联系客服", ttFlyTip)
			return
		end
		if Awards.GiveTracked(sysarg, pending.items, pending, GameLog.cBuyEveryDayPreference, "补发每日特惠礼包") then
			if pending.purchaseDay == today then var.days.everyDayPreferenceFlag = 1 end
			var.everyDayPreferenceGrant = nil
		end
		return
	end
	if var.days.everyDayPreferenceFlag == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf407, ttFlyTip)
		return
	end
	local cfg = ActivityGiftConfig and ActivityGiftConfig.EveryDayPreference
	-- 空奖励配置意味着不可销售，必须在任何扣款和购买标记之前拒绝。
	if not cfg or type(cfg.award) ~= "table" or #cfg.award == 0 then
		Actor.sendTipmsg(sysarg, "每日特惠礼包暂未开放", ttFlyTip)
		return
	end
	local progress = {purchaseDay = today}
	if Awards.PrepareTracked(cfg.award, progress) ~= true then
		Actor.sendTipmsg(sysarg, "每日特惠礼包配置异常，暂时无法购买", ttFlyTip)
		return
	end
	local consumeData = {}
	if not CheckAllConsume(sysarg, false, cfg.consume, true, consumeData) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf408, ttFlyTip)
		return
	end
	if not Awards.CheckBagGridCount(sysarg, progress.items) then return end
	var.everyDayPreferenceGrant = progress
	progress.paymentInFlight = true
	local ok, paid = pcall(DeductAllConsume, sysarg, false, cfg.consume, GameLog.cBuyEveryDayPreference)
	if not ok then
		progress.needsReview = true
		Actor.sendTipmsg(sysarg, "购买付款异常，请联系客服核对，请勿重复付款", ttFlyTip)
		return
	end
	progress.paymentInFlight = nil
	if paid ~= true then
		var.everyDayPreferenceGrant = nil
		return
	end
	progress.paid = true
	if not Awards.GiveTracked(sysarg, progress.items, progress, GameLog.cBuyEveryDayPreference, "购买每日特惠礼包") then return end
	var.days.everyDayPreferenceFlag = 1
	var.everyDayPreferenceGrant = nil
end

MiscsImplement.TakeFirstRechargeGift = function(sysarg)
	local var = Actor.getStaticVar( sysarg )
	local firstRecharge = var.FirstRechargeFlag
	local progress = var.firstRechargeGrant
	local pendingAwards = type(progress) == "table" and progress.items or nil
	if firstRecharge ~= nil and firstRecharge == 2 then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.zf375,ttFlyTip )
		return
	end
	if pendingAwards == nil and firstRecharge ~= 1 then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.zf156,ttFlyTip )
		return
	end
	

	-- 已受理的奖励按冻结清单补发；配置只在首次领取时读取。
	local awards = pendingAwards
	if awards == nil then
		local config = ActivityGiftConfig and ActivityGiftConfig.RechargeGift
		local gift = config and config[1]
		if not gift then return end
		awards = gift.reward
		if progress == nil then
			local prepared = {}
			if Awards.PrepareTracked(awards, prepared) ~= true then return end
			progress = prepared
			var.firstRechargeGrant = progress
		elseif Awards.PrepareTracked(awards, progress) ~= true then
			return
		end
	end

	if not Awards.GiveTracked(sysarg, awards, progress, 996, "领取首充奖励") then
		return
	end
	
	--Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf669,2048)
 	--System.broadcastTipmsg(string.format(Lang.ScriptTips.zf670,Actor.getName(sysarg)),2)

	local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local ActorName = Actor.getName(sysarg)
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	System.sendCommonLog(1013,ActorId,ActorName,nLevel,0,0,Lang.LogTips.l00218,"","")
	var.FirstRechargeFlag = 2
	Quest_ShuaXin(sysarg)
	local npack = DataPack.allocPacket(sysarg,139,92)
	DataPack.writeByte(npack,1)
	DataPack.flush(npack)
	
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf254,Actor.getName(sysarg)),2048+2)
	
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf254..",<我要领取/@@showWin,34>",Actor.getName(sysarg)),ttChatWindow)
   
    var.buyoldgod = 1
    --发送是否领取神器 神甲状态
     var.showgodtask = 1 --显示主线任务的标识
    MiscSendGiveGodEquipState(sysarg)
    Quest_ShuaXin(sysarg)
end

BranchAward =
{ 
	{
		{type = 2, id = 0, count = 6000000}, --首充赠送经验
	},
	{
		{type = 2, id = 0, count = 10000000}, --首充赠送经验
	},
}	




----领取支线奖励 // 20160904: 主线任务点击触发的函数
--function GetbranchAward(sysarg,s1)

--	-------------------------------------------------------------------------------------------------以下是副本奖励领取
--	if s1 ~= 0 and s1 ~= "0" then
--		local fb_list = {
--			{mapid = 91, rd_item = "护符碎片", rd_num = 5000, rd1 = 100, rd2 = 198, var = 20},
--			{mapid = 92, rd_item = "护盾碎片", rd_num = 5000, rd1 = 100, rd2 = 198, var = 21},
--			{mapid = 93, rd_item = "宝石结晶", rd_num = 250, rd1 = 100, rd2 = 198, var = 22},
--			{mapid = 94, rd_item = "圣珠结晶", rd_num = 250, rd1 = 100, rd2 = 198, var = 23},
--			{mapid = 95, rd_item = "星纹强化石", rd_num = 25, rd1 = 200, rd2 = 398, var = 24},
--			{mapid = 96, rd_item = "1级羽毛", rd_num = 25, rd1 = 200, rd2 = 398, var = 25},
--			{mapid = 97, rd_item = "功勋值", rd_num = 500, rd1 = 9999, rd2 = 9999, var = 32},--功勋是不可翻倍
--		};
--		local a,b = math.modf(tonumber(s1)/10);
--		a = tonumber(a);
--		b = tonumber(b*10);
--		b = tostring(b);
--		if not fb_list[a] then return; end

--		local rem_mon = Actor.getLiveMonsterCount(sysarg,0);

--		if rem_mon > 0 then Actor.sendTipmsg(sysarg, "把副本内怪物清理干净才可以领取奖励哟~", 256); return; end
--		local delgold = 0;

--		if b == "2" then delgold = fb_list[a].rd1; end
--		if b == "3" then delgold = fb_list[a].rd2; end

--		if Actor.getMoneyCount(sysarg,3) < delgold then Actor.sendTipmsg(sysarg, string.format("元宝小于 <%s> ,领取多倍失败.\\您可以选择领取正常奖励或者进行元宝充值.",delgold), 4); return; end

--		b = tonumber(b);
--		if get_d_val(sysarg,fb_list[a].var) < 1 then System.telportScene(sysarg,9,139,146); Quest_ShuaXin(sysarg); return; end

--		del_d_val(sysarg,fb_list[a].var,1);
--		Actor.changeMoney(sysarg,3,-delgold);	--副本元宝扣除
--		if fb_list[a].rd_item == "护符碎片" then
--			local num = fb_list[a].rd_num * b;
--			Actor.setUIntProperty(sysarg, 124, (Actor.getUIntProperty(sysarg, 124) + num));
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "护盾碎片" then
--			local num = fb_list[a].rd_num * b;
--			Actor.setUIntProperty(sysarg, 126, (Actor.getUIntProperty(sysarg, 126) + num));
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "宝石结晶" then
--			local num = fb_list[a].rd_num * b;
--			Actor.setUIntProperty(sysarg, 125, (Actor.getUIntProperty(sysarg, 125) + num));
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "圣珠结晶" then
--			local num = fb_list[a].rd_num * b;
--			Actor.setUIntProperty(sysarg, 127, (Actor.getUIntProperty(sysarg, 127) + num));
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "星纹强化石" then
--			local num = fb_list[a].rd_num * b;
--			Actor.addItem(sysarg,459,0,0,num,1);
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "1级羽毛" then
--			local num = fb_list[a].rd_num * b;
--			Actor.addItem(sysarg,464,0,0,num,1);
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end
--		if fb_list[a].rd_item == "功勋值" then
--			local num = fb_list[a].rd_num;
--			Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, (Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE) + num));
--			Actor.sendTipmsg(sysarg, string.format("副本完成,获得 <%s> ,数量: <%s>",fb_list[a].rd_item, num), 256 + 128);
--		end

--		System.telportScene(sysarg,9,139,146);
--		Quest_ShuaXin(sysarg);
--		return;
--	end
--	---------------------------------------------------------------------------------------------------以下是支线任务
--	local mid = Actor.getSceneId(sysarg);
--	if mid == 9 then
--		local npcr = {
--			[1] = {mapid = 9, npcname = "传送员"},
--			[2] = {mapid = 9, npcname = Lang.EntityName.n00251},
--		};

--		local idx = get_d_val(sysarg,8);
--		if not npcr[idx] then return; end

--		if npcr[idx].mapid == mid then
--			Actor.autoFindPathToNpc( sysarg, npcr[idx].mapid, npcr[idx].npcname );
--			return;
--		end
--		if get_d_val(sysarg,3) == mid then
--			Actor.openguajiGuide(sysarg, 1);
--			return;
--		end
--	end
--	---------------------------------------------------------------------------------------------------以下是主线任务
--	local npcs = {
--		[3] = {mapid = 1, monmap = 3, npcname = Lang.EntityName.n00332},
--		[6] = {mapid = 1, monmap = 4, npcname = Lang.EntityName.n00333},
--		[11] = {mapid = 1, monmap = 5, npcname = Lang.EntityName.n00334},
--		[16] = {mapid = 1, monmap = 6, npcname = Lang.EntityName.n00335},
--		[20] = {mapid = 1, monmap = 7, npcname = Lang.EntityName.n00336},
--		[22] = {mapid = 1, monmap = 8, npcname = Lang.EntityName.n00337},

--	};
--	local mid = Actor.getSceneId(sysarg);
--	local idx = get_taskflags_val(sysarg);
--	if not npcs[idx] then return; end

--	if npcs[idx].mapid == mid then
--		Actor.autoFindPathToNpc( sysarg, npcs[idx].mapid, npcs[idx].npcname );
--		return;
--	end
--	if npcs[idx].monmap == mid then
--		Actor.openguajiGuide(sysarg, 1);
--		return;
--	end
--	if npcs[idx] then
--		Actor.sendTipmsg(sysarg, "亲,你这是跑哪去了?\\去找这个NPC: <"..npcs[idx].npcname.."> 继续任务吧.\\还不知道的话可以寻求一下客服帮忙哟.", 4);
--	else
--		Actor.sendTipmsg(sysarg, "什么情况?赶紧报告客服!", 4);
--	end
























































--	--getBranchTaskAward(sysarg,branchId)
--	-- local var = Actor.getStaticVar(sysarg)
--	-- local result = false
--	-- if branchId == 1 or branchId == 2 then  --穿戴两件60级装备
--	-- 	if not var.branchAwardFlag then
--	-- 		local  nCount = Actor.GetEquipCountByLevel(sysarg,60)
--	-- 		if nCount >= 2 then
--	-- 			result = true
--	-- 			if not Awards.CheckBagGridCount(sysarg,BranchAward[1]) then
--	-- 				return	
--	-- 			end
--	-- 			var.branchAwardFlag = 1
--	-- 			Awards.Give(sysarg,BranchAward[1],2300,"领取60级装备奖励")
--	-- 			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf667,2048)
--	-- 			System.broadcastTipmsg(string.format(Lang.ScriptTips.zf671,Actor.getName(sysarg)),2)
--	-- 		end
--	-- 	end
--	-- elseif branchId == 3 then --穿戴一件特戒
--	-- 	local nItem = Item.getEquipByType(sysarg,Item.itSpecialRing)
--	-- 	if nItem ~= nil then
--	-- 		result = true
--	-- 		if not Awards.CheckBagGridCount(sysarg,BranchAward[2]) then
--	-- 			return	
--	-- 		end
--	-- 		var.branchAwardFlag = 2
--	-- 		Awards.Give(sysarg,BranchAward[2],2300,"领取特戒奖励")
--	-- 		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf668,2048)
--	-- 		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf673,Actor.getName(sysarg)),2)

--	-- 	end
--	-- end
--	-- Quest_ShuaXin(sysarg)
--	-- if result == false then
--	-- 	if branchId == 1 then
--	-- 		Actor.openDialogs(sysarg,99,10)
--	-- 	elseif branchId == 2 then
--	-- 		Actor.openDialogs(sysarg,96,0)
--	-- 	elseif branchId == 3 then
--	-- 		Actor.openDialogs(sysarg,99,12)
--	-- 	end
--	-- end
--end

MiscsImplement.GetBranchAward = function(sysarg, msgid, packet)
    local func = DataPack.readString(packet)
    local count = DataPack.readByte(packet)

    local param = {}
    for i = 1,count do
        table.insert(param,DataPack.readString(packet));
    end

    if func == nil  then
        return
    end
 
      --   _G[func](sysarg,param)
   GetbranchAward(sysarg,param)

end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFirstCharge, MiscsImplement.GetFirstRechargeInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cTakeFirstCharge, MiscsImplement.TakeFirstRechargeGift)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuyEveryDayPreference, MiscsImplement.BuyEveryDayPreference)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetBranchAward, MiscsImplement.GetBranchAward)

