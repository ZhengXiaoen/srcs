--#include "data\config\activity\LivenessActivityCfg.lua" once
--#include "data\functions\Activity\PublicTest.lua" once

--每日活跃度活动

S2C_LivenessMsgId = {
	GetLivenessInfo = 1, --获取活跃度活动信息
	GetLivenessAwardResult = 2, --下发领取活跃度奖励结果
	IconStatus = 3, --下发图标状态
	SendGuildLiveness = 4, --下发行会活跃度(行会界面要显示行会活跃度,所以这里单独下发这个值)
}

-- var.days.LivenessData.flags
LivenessAwardFlags = {	
	--活跃度等级奖励领取状态
	LivenessAward1 = 0,
	LivenessAward2 = 1,
	LivenessAward3 = 2,
	LivenessAward4 = 3,
	LivenessAward5 = 4,	
}

function GetActorLivenessAwardFlag(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! GetActorLivenessAwardFlag flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.LivenessData == nil then return false end
	
	local flags = var.days.LivenessData.flags
	if flags == nil then return false end
	
	local f = System.getIntBit(flags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function SetActorLivenessAwardFlag(sysarg, flag, true_or_false)
	if flag < 0 or flag > 31 then
		print("----error! SetActorLivenessAwardFlag flag="..flag)
		return
	end
	
	local flags = 0
	local var = Actor.getStaticVar(sysarg)
	if var.days.LivenessData == nil then
		var.days.LivenessData = {}
	else
		flags = var.days.LivenessData.flags
		if flags == nil then flags = 0 end
	end
		
	flags = System.setIntBit(flags, flag, true_or_false)--flags是保存flag的值
	var.days.LivenessData.flags = flags
end

--下发领取活跃度等级奖励结果(领完奖的时候发送)
function SendActorLivenessAwardResult(sysarg, var)
    if System.isCrossServer() == true then return end
	if var == nil then
		var = Actor.getStaticVar(sysarg)
	end
	
	local flags = 0
	if var.days.LivenessData ~= nil then		
		flags = var.days.LivenessData.flags
		if flags == nil then flags = 0 end
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sLivenessActivity)
	DataPack.writeByte(netPack, S2C_LivenessMsgId.GetLivenessAwardResult)
	
	DataPack.writeUInt(netPack, flags)--第几个领了，第个没有领
	
	local status = GetLivenessIconStatus(sysarg) --看看是否显示那个活跃度的图标	
	DataPack.writeByte(netPack, status)
	
	DataPack.flush(netPack)
end

--返回活跃度活动信息给前端
function GetLivenessActivityInfo(sysarg, packet)
	if System.isCrossServer() == true then return end
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sLivenessActivity)
	DataPack.writeByte(netPack, S2C_LivenessMsgId.GetLivenessInfo) -- 获取活动信息
	
	local flags = 0
	local liveness = 0
	
	local var = Actor.getStaticVar(sysarg)
	local data = var.days.LivenessData
	if data ~= nil then
		if data.flags ~= nil then
			flags = data.flags
		end
		
		if data.liveness ~= nil then
			liveness = data.liveness
		end		
	end	
	
	DataPack.writeUInt(netPack, flags)	 --哪些奖励可以取，哪些不可以取
	DataPack.writeUInt(netPack, liveness) -- 当前活跃度		
	
	--local counts = {0,0,0,0,0,0,0}
	--
	--if data ~= nil then
	--	counts[1] = var.days.xycmCount -- 降妖除魔完成次数
	--	counts[2] = var.days.cjzzCount	-- 采集珍珠完成次数		
	--	counts[5] = data.pkCount -- 激情PK完成次数
	--	counts[6] = data.donateCount -- 行会捐献完成次数	
	--	counts[7] = data.ybCount -- 每日充值1000元宝次数	
	--end
	--
	--counts[3] = var.days.DartTimes -- 护送皇杠完成次数
	--
	---- 屠魔圣殿完成次数
	--if var.d[51] < 0 then --全部完成 
	--	counts[4] = 3
	--else
	--	counts[4] = 3 - var.d[51]
	--end	
	--		
	--DataPack.writeByte(netPack, 7) -- 共有 7 项
	--
	--local taskCfg = LivenessActivityCfg.livenessTask
    --
	--for i = 1, 7 do
	--	local c = counts[i]
	--	if c == nil then
	--		c = 0
	--	elseif c > taskCfg[i].limitTimes then
	--		c = taskCfg[i].limitTimes
	--	end
	--	
	--	DataPack.writeByte(netPack, c)
	--end
	if var.days.LivenessData == nil then var.days.LivenessData={} end 
	DataPack.writeByte(netPack, 23) -- 共有 25 项
	
	if var.days.LivenessData.meiriqiandao ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meiriqiandao) end--每日签到--1
	if var.days.LivenessData.meirishouchong ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meirishouchong) end--每日首充--2
	if var.days.LivenessData.weiduandenglu ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.weiduandenglu) end--微端登录--3
	--if var.days.LivenessData.wulinzhengba ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.wulinzhengba) end--武林争霸4 
	if var.days.LivenessData.benpaoxiongdi ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.benpaoxiongdi) end--奔跑兄弟
	if var.days.LivenessData.xiangyaochumo ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.xiangyaochumo) end--除妖降魔5 
	if var.days.LivenessData.lianyu ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.lianyu) end--炼狱6
	if var.days.LivenessData.meirichongzhi ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meirichongzhi) end--每日充值1000元宝--7 
	if var.days.LivenessData.shenweiyu ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.shenweiyu) end--神威狱8
	if var.days.LivenessData.juntuanzhan ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.juntuanzhan) end--军团战9 
	if var.days.LivenessData.tansuofuben ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.tansuofuben) end--探索副本10
	if var.days.LivenessData.shenmizhidian ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.shenmizhidian) end--散人殿堂11
	if var.days.LivenessData.jiqingbiguan ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.jiqingbiguan) end--激情闭关12 
	if var.days.LivenessData.gerenboss ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.gerenboss) end--个人boss--13
	if var.days.LivenessData.yabiao ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.yabiao) end--押镖--14
	if var.days.LivenessData.xunbao ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.xunbao) end--寻宝--15
	if var.days.LivenessData.mobaichengzhu ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.mobaichengzhu) end--膜拜城主16
	if var.days.LivenessData.meirizhuanxian ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meirizhuanxian) end--每日捐献17
	if var.days.LivenessData.qianghuazhuangbei ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.qianghuazhuangbei) end--强化装备--18
	if var.days.LivenessData.meirihuishou ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meirihuishou) end--每日回收19
	--if var.days.LivenessData.meirihecheng ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.meirihecheng) end--每日合成20
	if var.days.LivenessData.zhanjiangheti ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.zhanjiangheti) end--战将合体--20
	if var.days.LivenessData.shenlutishen ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.shenlutishen) end--神炉提升21
	if var.days.LivenessData.neigongshengji ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.neigongshengji) end--内功升级--22
	if var.days.LivenessData.zuduicaozuo ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.zuduicaozuo) end--组队操作--23
	--if var.days.LivenessData.zhanjiangheti ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.zhanjiangheti) end--战将合体--24
	--if var.days.LivenessData.shijieboss ==nil then DataPack.writeByte(netPack, 0) else DataPack.writeByte(netPack, var.days.LivenessData.shijieboss) end--世界BOSS--25
	
	DataPack.flush(netPack)

end

--领取活跃度活动奖励
function GetLivenessActivityAward(sysarg, packet)	
	local liveness = 0
	local var = Actor.getStaticVar(sysarg)
	if var.days.LivenessData ~= nil then
		liveness = var.days.LivenessData.liveness
	end	
	
	if liveness == nil or liveness <= 0 then
		Actor.sendTipmsg(sysarg, "您的活跃度不足，无法领取该奖励。", ttFlyTip)
		return
	end

	local index = DataPack.readByte(packet) -- 从1开始
	if index < 1 or index > 32 then return end

	local cfg = LivenessActivityCfg.livenessLevels[index]
	if cfg == nil then return end

	if liveness < cfg.liveness then
		Actor.sendTipmsg(sysarg, "您的活跃度不足，无法领取该奖励。", ttFlyTip)
		return
	end

	local bit = LivenessAwardFlags.LivenessAward1 + (index - 1)
	if bit >= 32 then return end

	if GetActorLivenessAwardFlag(sysarg, bit) then
		Actor.sendTipmsg(sysarg, "您已经领取了该奖励!", ttFlyTip)
		return
	end 
	
	if System.getDaysSinceOpenServer() >3 then 
		if Awards.Give(sysarg, cfg.award, GameLog.cDayLivenessAward, tostring(index)) == false then
			Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)		
			return
		end
	else 
		if Awards.Give(sysarg, cfg.awardbefore4, GameLog.cDayLivenessAward, tostring(index)) == false then
			Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)		
			return
		end
	end
	

	SetActorLivenessAwardFlag(sysarg, bit, true)--要是得到奖励，那就改变旗帜	
	
	--下发领取活跃度活动奖励结果
	SendActorLivenessAwardResult(sysarg, var)
			
	Actor.sendTipmsg(sysarg, "您成功领取了活跃度等级"..index.."的奖励。", ttFlyTip)
end

--完成活跃度任务
function FinishLivenessTask(sysarg, taskId)	
	local task = LivenessActivityCfg.livenessTask[taskId]
	if task == nil then
		print("error, FinishLivenessTask taskId="..taskId)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	--增加活跃度信息
	local liveness = 0
	if var.days.LivenessData == nil then
		var.days.LivenessData = {}
	else
		liveness = var.days.LivenessData.liveness
		if liveness == nil then liveness = 0 end
	end	

	liveness = liveness + task.score
	var.days.LivenessData.liveness = liveness	
	
	Actor.sendTipmsg(sysarg, string.format("您的活跃度增加了%d，活跃度为%d",task.score, liveness), ttFlyTip)
	
	-- 下发活跃度活动图标状态
	SendLivenessIconStatus(sysarg)
end


function OnFinish_Liveness(sysarg,n)

	local n= tonumber(n)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if var.days.LivenessData ==nil then 
		var.days.LivenessData={}
	end
	local Count = nil
	if n==1 then 
		Count = var.days.LivenessData.meiriqiandao--每日签到--1
	elseif n==2 then 
		Count = var.days.LivenessData.meirishouchong--每日首充2
	elseif n==3 then 
		Count = var.days.LivenessData.weiduandenglu--微端登录--3
	elseif n==4 then 
		--Count = var.days.LivenessData.wulinzhengba--武林争霸4 
		Count = var.days.LivenessData.benpaoxiongdi--奔跑兄弟4 
	elseif n==5 then 
		Count = var.days.LivenessData.xiangyaochumo--除妖降魔5 
	elseif n==6 then 
		Count = var.days.LivenessData.lianyu--炼狱6
	elseif n==7 then 
		Count = var.days.LivenessData.meirichongzhi--每日充值1000元宝7
	elseif n==8 then 
		Count = var.days.LivenessData.shenweiyu--神威狱8
	elseif n==9 then 
		Count = var.days.LivenessData.juntuanzhan--军团战9
	elseif n==10 then 
		Count = var.days.LivenessData.tansuofuben--探索副本10
	elseif n==11 then 
		Count = var.days.LivenessData.shenmizhidian--散人殿堂11
	elseif n==12 then 
		Count = var.days.LivenessData.jiqingbiguan--激情闭关12
	elseif n==13 then 
		Count = var.days.LivenessData.gerenboss--个人boss--13
	elseif n==14 then 
		Count = var.days.LivenessData.yabiao--押镖--14
	elseif n==15 then 
		Count = var.days.LivenessData.xunbao--寻宝--15
	elseif n==16 then 
		Count = var.days.LivenessData.mobaichengzhu--膜拜城主16
	elseif n==17 then 
		Count = var.days.LivenessData.meirizhuanxian--每日捐献17
	elseif n==18 then 
		Count = var.days.LivenessData.qianghuazhuangbei--强化装备--18
	elseif n==19 then 
		Count = var.days.LivenessData.meirihuishou--每日回收19
	elseif n==20 then 
		--Count = var.days.LivenessData.meirihecheng--每日合成20
		Count = var.days.LivenessData.zhanjiangheti--战将合体--20
	elseif n==21 then 
		Count = var.days.LivenessData.shenlutishen--神炉提升21
	elseif n==22 then 
		Count = var.days.LivenessData.neigongshengji--内功升级--22
	elseif n==23 then 
		Count = var.days.LivenessData.zuduicaozuo--组队操作--23
	--elseif n==24 then 
	--	Count = var.days.LivenessData.zhanjiangheti--战将合体--24
	--elseif n==25 then 
	--	Count = var.days.LivenessData.shijieboss--世界BOSS--25
	end
	if Count == nil then Count = 0 end
	Count=Count+1	
	if Count > LivenessActivityCfg.livenessTask[n].limitTimes then
		return
    end
    FinishLivenessTask(sysarg, n)
	
	if n==1 then 
		var.days.LivenessData.meiriqiandao = Count --每日签到--1
	elseif n==2 then 
		var.days.LivenessData.meirishouchong= Count--每日首充--2
	elseif n==3 then 
		var.days.LivenessData.weiduandenglu= Count--微端登录--3
	elseif n==4 then 
		--var.days.LivenessData.wulinzhengba= Count--武林争霸4
		var.days.LivenessData.benpaoxiongdi= Count--奔跑兄弟4 		
	elseif n==5 then 
		var.days.LivenessData.xiangyaochumo= Count--除妖降魔5 
	elseif n==6 then 
		var.days.LivenessData.lianyu= Count--炼狱6
	elseif n==7 then 
		var.days.LivenessData.meirichongzhi= Count--每日充值1000元宝--7
	elseif n==8 then 
		var.days.LivenessData.shenweiyu= Count--神威狱8
	elseif n==9 then 
		var.days.LivenessData.juntuanzhan= Count--军团战9
	elseif n==10 then 
		var.days.LivenessData.tansuofuben= Count--探索副本10
	elseif n==11 then 
		var.days.LivenessData.shenmizhidian= Count--散人殿堂11
	elseif n==12 then 
		var.days.LivenessData.jiqingbiguan= Count--激情闭关12
	elseif n==13 then 
		var.days.LivenessData.gerenboss= Count--个人boss--13
	elseif n==14 then 
		var.days.LivenessData.yabiao= Count--押镖--14
	elseif n==15 then 
		var.days.LivenessData.xunbao= Count--寻宝--15
	elseif n==16 then 
		var.days.LivenessData.mobaichengzhu= Count--膜拜城主16
	elseif n==17 then 
		var.days.LivenessData.meirizhuanxian= Count--每日捐献17
	elseif n==18 then 
		var.days.LivenessData.qianghuazhuangbei= Count--强化装备--18
	elseif n==19 then 
		var.days.LivenessData.meirihuishou= Count--每日回收19
	elseif n==20 then 
		--var.days.LivenessData.meirihecheng= Count--每日合成20
		var.days.LivenessData.zhanjiangheti= Count--战将合体--20
	elseif n==21 then 
		var.days.LivenessData.shenlutishen= Count--神炉提升21
	elseif n==22 then 
		var.days.LivenessData.neigongshengji= Count--内功升级--22
	elseif n==23 then 
		var.days.LivenessData.zuduicaozuo= Count--组队操作--23
	--elseif n==24 then 
	--	var.days.LivenessData.zhanjiangheti= Count--战将合体--24
	--elseif n==25 then 
	--	var.days.LivenessData.shijieboss= Count--世界BOSS--25
	end
	
	GetLivenessActivityInfo(sysarg)
end

-- 完成降妖除魔
function OnFinishXiangYaoChuMo(sysarg)	
	--local var = Actor.getStaticVar(sysarg)
    --
	--local xycmCount = var.days.xycmCount
	--if xycmCount == nil then xycmCount = 0 end
	--	
	--if xycmCount > LivenessActivityCfg.livenessTask[1].limitTimes then
	--	return
	--end
	--		
	--FinishLivenessTask(sysarg, 1)
end

-- 完成采集珍珠
function OnFinishCaiJiZhenZhu(sysarg)	
	--local var = Actor.getStaticVar(sysarg)
    --
	--local cjzzCount = var.days.cjzzCount
	--if cjzzCount == nil then cjzzCount = 0 end
	--
	--if cjzzCount > LivenessActivityCfg.livenessTask[2].limitTimes then
	--	return
	--end	
	--	
	--FinishLivenessTask(sysarg, 2)
end

-- 激情PK
function OnLivenessPlayerDie(sysarg, killer)	
	--local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	--if level < LivenessActivityCfg.livenessTask[5].level then
	--	return
	--end
	--
	--local var = Actor.getStaticVar(killer)
    --
	--local pkCount = 0
	--if var.days.LivenessData == nil then
	--	var.days.LivenessData = {}
	--else
	--	pkCount = var.days.LivenessData.pkCount
	--	if pkCount == nil then pkCount = 0 end
	--end
	--
	--if pkCount >= LivenessActivityCfg.livenessTask[5].limitTimes then
	--	return
	--end
	--
	--pkCount = pkCount + 1
	--var.days.LivenessData.pkCount = pkCount
	--	
	--FinishLivenessTask(killer, 5)
end

-- 行会捐献
function OnLivenessGuildDonateResult(sysarg, bindCoinCount)
	-- 每次捐献 100000
	--if bindCoinCount < 100000 then return end
	--
	--local var = Actor.getStaticVar(sysarg)
    --
	--local donateCount = 0
	--if var.days.LivenessData == nil then
	--	var.days.LivenessData = {}
	--else
	--	donateCount = var.days.LivenessData.donateCount
	--	if donateCount == nil then donateCount = 0 end
	--end
	--
	--if donateCount >= LivenessActivityCfg.livenessTask[6].limitTimes then
	--	return
	--end
	--
	--donateCount = donateCount + 1
	--var.days.LivenessData.donateCount = donateCount
	--	
	--FinishLivenessTask(sysarg, 6)
	--
	---- 行会界面要显示
	--SendGuildLivenessToClient(sysarg, donateCount)
end

function OnLivenessWithDrawYB(sysarg, yuanBao)
	--local var = Actor.getStaticVar(sysarg)
	--
	---- 充值元宝完成次数
	--if var.days.PeyNum == nil then return end	
	--local totalCount = math.floor(var.days.PeyNum / 1000)	
	--if totalCount == 0 then return end	
    --
	--local oldCount = 0
	--if var.days.LivenessData == nil then
	--	var.days.LivenessData = {}
	--else
	--	oldCount = var.days.LivenessData.ybCount
	--	if oldCount == nil then oldCount = 0 end
	--end
	--
	--if oldCount >= LivenessActivityCfg.livenessTask[7].limitTimes then
	--	return
	--end
	--
	--if totalCount <= oldCount then return end
	--
	--if totalCount > LivenessActivityCfg.livenessTask[7].limitTimes then
	--	totalCount = LivenessActivityCfg.livenessTask[7].limitTimes
	--end
	--
	--local addCount = totalCount - oldCount
	--if addCount <= 0 then return end
	--
	--var.days.LivenessData.ybCount = oldCount + addCount
	--for i= 1, addCount do		
	--	FinishLivenessTask(sysarg, 7)
	--end
end


-- 获得活跃度活动图标状态(0：隐藏，1：显示，2：有奖可领)
function GetLivenessIconStatus(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.LivenessData == nil then return 1 end
	
	local liveness = var.days.LivenessData.liveness	
	if liveness == nil or liveness <= 0 then return 1 end
	
	for i, v in ipairs(LivenessActivityCfg.livenessLevels) do
		if GetActorLivenessAwardFlag(sysarg, i - 1) == false then --取了奖品没
			if liveness >= v.liveness then
				return 2
			else
				return 1
			end
		end
	end
	
	return 0 -- 奖励都领了则隐藏ICON
end

--下发活跃度活动图标状态
function SendLivenessIconStatus(sysarg, status)
    if System.isCrossServer() == true then return end
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sLivenessActivity)
	DataPack.writeByte(netPack, S2C_LivenessMsgId.IconStatus)
	
	if status == nil then
		status = GetLivenessIconStatus(sysarg)
	end	
	
	DataPack.writeByte(netPack, status)
	DataPack.flush(netPack)	

end

--下发行会活跃度
function SendGuildLivenessToClient(sysarg, value)
	--[[
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sLivenessActivity)
	DataPack.writeByte(netPack, S2C_LivenessMsgId.SendGuildLiveness)
	
	if value == nil then
		local var = Actor.getStaticVar(sysarg)
		local data = var.days.LivenessData
		if data ~= nil then
			value = data.donateCount -- 行会捐献完成次数
		else
			value = 0
		end
	end
	
	DataPack.writeUInt(netPack, value)
	DataPack.flush(netPack)	
	--]]
end

--活跃度活动消息
function OnLivenessActivity(sysarg, msgid, packet)
	if msgid ~= LogicCmd.miscSys.sub.cLivenessActivity then
		print("error OnLivenessActivity, msgid="..msgid)
		return
	end
	
	msgid = DataPack.readByte(packet)
		
	if msgid == 1 then --获取活跃度活动信息
		GetLivenessActivityInfo(sysarg, packet)	
	elseif msgid == 2 then --领取活跃度活动奖励
		GetLivenessActivityAward(sysarg, packet)
	elseif msgid == 3 then --获取行会活跃度(行会界面要显示)
		SendGuildLivenessToClient(sysarg, nil)
	else
		print("error OnLivenessActivity, unknown msgid="..msgid)
		return
	end
end

-- 完成降妖除魔 采集珍珠 护送皇杠有40%(月度活动100%)的机率获得魂石宝箱
function RandGiveSwingStoneBox(sysarg)
  -- 696 在散人传说中已经不是魂石宝箱了, 改为不送了
--[[
	-- 等级需求
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < 86 then return end
	
	-- 月度活动100% 中
	if not IsMonthActivityTime() then
		local rnd = System.getRandomNumber(1000)
		if rnd < 400 then return end -- 不中
	end
	
	-- 背包空间不足(不管它了，直接当做不中处理)
	if Awards.CheckBagNeedGridCount(sysarg, 1) ~= true then return end
	
	local award = { {type=0, id=696, count=1, bind=1} }
	Awards.Give(sysarg,award,GameLog.clScriptGiveItem,"随机赠送")	
--]]
end