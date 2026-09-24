--#include "data\functions\StdTask.lua" once
--#include "data\functions\FunctionGift\FunctionGift.lua" once
-- var.extflags 标志位，永久标志
actor_extflags = {
	gave_exp_bead = 0, -- 是否已经领取经验灵珠
	gave_wing_gift = 1, -- 是否已经领取青铜礼包(翅膀) 880 功能屏蔽了
	gave_stone_gift = 2, -- 是否已经领取青铜礼包(宝石) 888 功能屏蔽了
	gave_bead_gift = 3, -- 是否已经领取青铜礼包(灵珠) 884 功能屏蔽了
}

-- var.days.dayflags 标志位，每日清0
actor_dayflags = {
	gave_pay_gift = 0, -- 是否已经领取每日充值大礼包
	exp_jade_quest1 = 1, -- 日常经验珠任务(使用10颗)
	exp_jade_quest2 = 2, -- 日常经验珠任务(使用20颗)
	exp_jade_quest3 = 3, -- 日常经验珠任务(使用30颗)
	enter_sbk = 4,		 -- 是否已进入过沙巴克场景
}

------------------------------------------------------------------------------------------
--- 设置角色主线任务标志 
function set_taskflags_val(sysarg, value)
	local sVar = Actor.getStaticVar(sysarg)
    local bLog = true
    if sVar.taskflags_val ~= nil  and sVar.taskflags_val == value then
        bLog = false
    end
	sVar.taskflags_val = value
	
	--关闭特效
	local netPack = DataPack.allocPacket(sysarg, 26 , 83)
	DataPack.writeByte(netPack,4)
	DataPack.writeByte(netPack,0)
	DataPack.flush(netPack)
					
	local ta = task_all[value]
	
	if ta == nil then return end
	if ta.picid ~= nil then --设置任务的时候有图片需要显示
		SpecialQuest_UpdatePic(sysarg,ta.picid)
	end
	
	local dvar = Actor.getDyanmicVar(sysarg)
	dvar.hasChangeTheTask=nil
    if bLog == true then
         System.sendCommonLog(GameLog.clFinishQuest,Actor.getUIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),value,0,0,ta.tname)
    end
   
    if value == 85 then --功能礼包
        OnCompleteGiftTask(sysarg,4)
    end
end

--- 获取角色主线任务标志 --- 
function get_taskflags_val(sysarg)  
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.taskflags_val == nil then return 0 end
	return sVar.taskflags_val
end


function add_d_val(sysarg, value, n)
	local var = Actor.getStaticVar(sysarg);
	if var.d == nil then var.d={} end
	local d = var.d;
	d[value] = get_d_val(sysarg, value) + n;
end
function del_d_val(sysarg, value, n)
	local var = Actor.getStaticVar(sysarg);
	if var.d == nil then var.d={} end
	local d = var.d;
	d[value] = get_d_val(sysarg, value) - n;
end

function set_d_val(sysarg, value, n)
	local var = Actor.getStaticVar(sysarg);
	if var.d == nil then var.d={} end
	local d = var.d;
	d[value] = n;
end
function get_d_val(sysarg, value)  
	--//读取私人变量d
	local var = Actor.getStaticVar(sysarg);
	if var.d == nil then var.d={} end
	local d = var.d;
	if d[value] == nil then return 0; end
	return d[value];
end
------------------------------------------------------------------------------------------
--军团相关获取
function get_jtname(sysarg)

	local LegionTitle = {
		Lt = {"雷霆","光芒","烈焰"},
		Title = {
			[1] = {c = "c8fe86", str = {"战士","法士","道士"} },
			[2] = {c = "c8fd1f", str = {"战将","法魂","道玄"} },
			[3] = {c = "f2fe50", str = {"战狂","法灵","道魂"} },
			[4] = {c = "f8fd1b", str = {"战王","法王","道灵"} },
			[5] = {c = "fed05e", str = {"战圣","法尊","道尊"} },
			[6] = {c = "fdbe0b", str = {"武将","魔魂","天将"} },
			[7] = {c = "fe8134", str = {"武狂","魔灵","天玄"} },
			[8] = {c = "fd530f", str = {"武王","魔王","天魂"} },
			[9] = {c = "fd3a2b", str = {"武尊","魔尊","天灵"} },
			[10] = {c = "ff0000", str = {"武圣","魔神","天尊"} },

		},
	};

	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local var = Actor.getStaticVar(sysarg);
	local legionId = Actor.getLegionId(sysarg);
	local ltlv = get_d_val(sysarg,110);
	local StrLegionT = "";
	if legionId > 0 and ltlv > 0 then
		StrLegionT = LegionTitle.Lt[legionId];
		local lt = LegionTitle.Title;
		if ltlv >= 10 then ltlv = 10; end
		if lt[ltlv].str[job] then
			local sl213 = "";
			if Actor.hasBuff(sysarg, 80, 213) then
				sl213 = "(神力护身)";
			end
			StrLegionT = string.format("<(c0xFF%s)%s%s%s>", lt[ltlv].c, StrLegionT, lt[ltlv].str[job], sl213);
		end
	elseif legionId > 0 then 
		StrLegionT = LegionTitle.Lt[legionId]
		StrLegionT = StrLegionT.."平民"
	else
		StrLegionT = "平民";
	end

	return StrLegionT;
end

------------------------------------------------------------------------------------------
--扣除金币,优先扣除绑金
function del_money(sysarg,value,logid,comment)
	if not value then return false; end
	value = tonumber(value);
	local del_ngold = value;
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> .",del_ngold), 256);
		return false;
	end
	Actor.changeMoney(sysarg, MC, -del_ngold,logid,comment);
	return true;
end
------------------------------------------------------------------------------------------

function get_extflags(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! get_extflags flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.extflags == nil then return false end
	
	local f = System.getIntBit(var.extflags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function set_extflags(sysarg, flag, true_or_no)
	if flag < 0 or flag > 31 then
		print("----error! set_extflags flag="..flag)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local extflags = var.extflags
	if extflags == nil then extflags = 0 end
	
	extflags = System.setIntBit(extflags, flag, true_or_no)
	var.extflags = extflags
end

function get_dayflags_from_var(var, flag)
	if flag < 0 or flag > 31 then
		print("----error! get_dayflags_from_var flag="..flag)
		return false
	end
	
	if var.days.dayflags == nil then return false end
	
	local f = System.getIntBit(var.days.dayflags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function get_dayflags(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! get_dayflags flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.dayflags == nil then return false end
	
	local f = System.getIntBit(var.days.dayflags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function set_dayflags(sysarg, flag, true_or_no)
	if flag < 0 or flag > 31 then
		print("----error! set_dayflags flag="..flag)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local dayflags = var.days.dayflags
	if dayflags == nil then dayflags = 0 end
	
	dayflags = System.setIntBit(dayflags, flag, true_or_no)
	var.days.dayflags = dayflags
end

--下发玩家标志
function SendActorExtflags(sysarg)
    if System.isCrossServer() == true then return end
	local var = Actor.getStaticVar(sysarg)
	local extflags = var.extflags
	if extflags == nil then extflags = 0 end
	
	local dayflags = var.days.dayflags
	if dayflags == nil then dayflags = 0 end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendActorExtflags)	
	DataPack.writeUInt(netPack, extflags)
	DataPack.writeUInt(netPack, dayflags)
	DataPack.flush(netPack)
end

function DayQuest_ExpJade(sysarg)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < 68 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198,68), ttFlyTip)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	local useTimes = var.jadeTime
	if useTimes == nil then useTimes = 0 end
	
	-------------------------------------------------------
	-- 第1次经验珠任务
	if useTimes < 10 then -- 还没有完成任务
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf679, ttFlyTip)
		return false
	end
	
	-- 领取第1次经验珠任务奖励
	if get_dayflags_from_var(var, actor_dayflags.exp_jade_quest1) == false then
		Actor.giveAward(sysarg,2,0,20000000,0,0,0,0,GameLog.cDayQuestExpJade,"ExpJadeQuest1")	
		set_dayflags(sysarg, actor_dayflags.exp_jade_quest1, true)
		
		local msg = string.format(Lang.ScriptTips.b002, Actor.getName(sysarg), 10, 2000)
		System.broadcastTipmsg(msg,2048)
		return true -- 返回true则刷新任务
	end
	
	-------------------------------------------------------
	-- 第2次经验珠任务
	if useTimes < 20 then -- 还没有完成任务
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf679, ttFlyTip)
		return false
	end
	
	-- 领取第2次经验珠任务奖励
	if get_dayflags_from_var(var, actor_dayflags.exp_jade_quest2) == false then
		Actor.giveAward(sysarg,2,0,30000000,0,0,0,0,GameLog.cDayQuestExpJade,"ExpJadeQuest2")	
		set_dayflags(sysarg, actor_dayflags.exp_jade_quest2, true)		
				
		local msg = string.format(Lang.ScriptTips.b002, Actor.getName(sysarg), 20, 3000)
		System.broadcastTipmsg(msg,2048)
		return true -- 返回true则刷新任务
	end
	
	-------------------------------------------------------
	-- 第3次经验珠任务
	if useTimes < 30 then -- 还没有完成任务
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf679, ttFlyTip)
		return false
	end
	
	-- 领取第3次经验珠任务奖励
	if get_dayflags_from_var(var, actor_dayflags.exp_jade_quest3) == false then
		Actor.giveAward(sysarg,2,0,40000000,0,0,0,0,GameLog.cDayQuestExpJade,"ExpJadeQuest3")	
		set_dayflags(sysarg, actor_dayflags.exp_jade_quest3, true)		
				
		local msg = string.format(Lang.ScriptTips.b002, Actor.getName(sysarg), 30, 4000)
		System.broadcastTipmsg(msg,2048)
		return true -- 返回true则刷新任务
	end
	-------------------------------------------------------
	
	-- 已经领过了
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf620, ttFlyTip)
	return true -- 返回true则刷新任务
end

function DayQuest_ExpJadeWndTip(sysarg)
	local str = "1.经验珠可在商城购买；\\2.杀怪获得经验可聚入经验珠；\\3.双击集满的经验珠可获得经验；\\\\<(c0xFF7CFC00)※快速聚集经验地图：><(c0xFFFF0000)经验副本、屠魔圣殿、富贵兽、挂机地图>"
	Actor.messageBox(sysarg,0,0,str, "关闭/CanleExpJadeWndTip", NULL, NULL, 0)
end

--关闭
function CanleExpJadeWndTip(sysarg)
	return nil
end