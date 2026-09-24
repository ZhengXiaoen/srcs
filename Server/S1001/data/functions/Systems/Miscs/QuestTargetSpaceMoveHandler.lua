
--#include "data\envir\FubenConfig\CaiFuGuangChang.lua" once
--疾风令飞往任务目标地点的实现函数
--[[
  目前这个实现存在很大的设计漏洞： 
    现在的实现是客户端发目标地图、X、Y上来，脚本里面直接传，这样的话客户端可以任意伪造数据包传送到任何地点。
    正确的实现方法是，服务器读取每个任务的需求的Location，然后客户端上发任务ID、需求索引，服务器通过配置中的地点传送玩家。
]] 

SendToSceneItemID = 680

g_forbidSceneId = {
	564, --生肖宫殿
	111,
	112,
	113,
	114,
	120,
	115,
	116,
	121,
	117,
	118,--神威狱10层
	634,
	635,
	636,
	637,
	633,
	344,
	345,
	346,
	568,
	569,--出世之境
	570,
	571,
	572,
	573,
	574,
	424,--玛雅神殿
	425,
	426,
	77,--BOSS之家
	78,
	79,
	630,
	287,--转神殿
	288,
	289,
	290,
	291,
	292,
	293,
	294,
	295,
	296,
	297,
	632,--蚩尤地宫
	234,--夺宝奇兵
	434,--恐怖BOSS
	435,--行会BOSS
	436,
	437,
	438,
	439,
	440,
	441,
	650,
	651,
	652,
	653,
	654,
	655,
	656,
	657,
	658,
	659,
	660,
	661,
	662,
	663,
	664,
	403,--跨服
	404,
	405,
	406,
	407,
	408,
	409,
	410,
	411,
	442,
	443,
	444,
	445,
	446,
	447,
	448,
	449,
	450,
	451,
	452,
	453,
	454,
	455,
	456,
	457,
	458,
	459,
	460,
	461,
	462,
	463,
	464,
	465,
	466,
	467,
	468,
	469,
	470,
	471,
	472,
	473,
	474,
	475,
	476,
	477,
	478,
	479,
	480,
	481,
	482,
	483,
	484,
	485,
	486,
	487,
	488,
	489,
	490,
	491,
	492,
	493,
	494,
	495,
	496,
	497,
	498,
	499,
	500,
	501,
	502,
	503,
	504,
	505,
	506,
	507,
	508,
	509,
	510,
	511,
	512,
	513,
	514,
	515,
	516,
	517,
	518,
	519,
	520,
	521,
	522,
	523,
	524,
	525,
	526,
	527,
	528,
	529,
	530,
	531,
	532,
	533,
	534,
	535,
	536,
	537,
	538,
	539,
	540,
	541,
	542,
	543,
	544,
	545,
	546,
	547,
	548,
	549,
	550,
	551,
	552,
	553,
	554,
	555,
	556,
	557,
	558,
	559,
	560,
	561,
	562,
	563,
	576,
	577,
	578,
	579,
	580,
	581,
	582,
	583,
	584,
	585,
	586,
	587,
	588,
	589,
	590,
	591,
	592,
	593,
	594,
	595,
	596,
	597,
	598,
	599,
	600,
	624,
	625,
	626,
	627,
	628,
	644,
	645,
	646,
	647,
	648,
	668,--熊猫林
	666,--小悟之境
	667,--大悟之境
	670,--1v1竞技
	671,--一支穿云箭
	672,--远古押镖
	673,
	674,
	675,
	676,
	677,
	678,
	679,
	680,
	681,
	682,
	683,
	684,
	685,
	686,
	687,
	688,
	689,
	690,
	691,


}

g_forbidSceneName = {
	"黄铜BOSS",
	"白银BOSS",
	"黄金BOSS",
	"宝鉴珍兽-黄铜",
	"宝鉴珍兽-白银",
	"宝鉴珍兽-黄金",
	"宝鉴珍兽-铂金",
	"宝鉴珍兽-钻石",
	"生肖宫殿",
	"神威狱1层",	
	"神威狱2层",	
	"神威狱3层",	
	"神威狱4层",
	"神威狱5层",	
	"神威狱6层",
	"神威狱7层",
	"神威狱8层",
	"神威狱9层",
	"神威狱10层",	
	"嗜魔峡谷1层",
	"嗜魔峡谷2层",
	"嗜魔峡谷3层",
	"嗜魔峡谷4层",
	"混沌1层",
	"混沌2层",
	"混沌3层",
	"混沌4层",
	"混乱地界",
	"出世之境",
	"练气之境",
	"固本之境",
	"培元之境",
	"红尘之境",
	"明心之境",
	"玛雅神殿1层",
	"玛雅神殿2层",
	"玛雅神殿3层",
	"BOSS之家1层",
	"BOSS之家2层",
	"BOSS之家3层",
	"BOSS之家4层",
	"1转神殿",
	"2转神殿",
	"3转神殿",
	"4转神殿",
	"5转神殿",
	"6转神殿",
	"7转神殿",
	"9转神殿",
	"11转神殿",
	"13转神殿",
	"15转神殿",
	"蚩尤地宫",
	"夺宝奇兵",
	"青龙圣宫",
	"朱雀圣宫",
	"白虎圣宫",
	"玄武圣宫",
	"巫师魔宫",
	"蛟龙魔宫",
	"死神魔宫",
	"领主魔宫",
	"行会BOSS(1层)",
	"行会BOSS(2层)",
	"行会BOSS(3层)",
	"行会BOSS(4层)",
	"行会BOSS(5层)",
	"行会BOSS(6层)",
	"行会BOSS(7层)",
	"行会BOSS(8层)",
	"行会BOSS(9层)",
	"行会BOSS(10层)",
	"行会BOSS(11层)",
	"行会BOSS(12层)",
	"行会BOSS(13层)",
	"行会BOSS(14层)",
	"行会BOSS(15层)",
	"远古战场(1层)2线",
	"远古战场(3层)2线",
	"远古战场(5层)2线",
	"远古战场(7层)2线",
	"远古战场(9层)2线",
	"远古战场(1层)3线",
	"远古战场(3层)3线",
	"远古战场(5层)3线",
	"远古战场(7层)3线",
	"远古战场(9层)3线",
	"远古战场(1层)4线",
	"远古战场(3层)4线",
	"远古战场(5层)4线",
	"远古战场(7层)4线",
	"远古战场(9层)4线",
	"远古运镖(1层)",
	"远古运镖(2层)",
	"远古运镖(3层)",
	"远古运镖(4层)",
	"远古运镖(5层)",
	"远古运镖(6层)",
	"远古运镖(7层)",
	"远古运镖(8层)",
	"远古运镖(9层)",
	"远古运镖(1层)1线",
	"远古运镖(2层)1线",
	"远古运镖(3层)1线",
	"远古运镖(4层)1线",
	"远古运镖(5层)1线",
	"远古运镖(6层)1线",
	"远古运镖(7层)1线",
	"远古运镖(8层)1线",
	"远古运镖(9层)1线",
	"远古运镖(1层)2线",
	"远古运镖(2层)2线",
	"远古运镖(3层)2线",
	"远古运镖(4层)2线",
	"远古运镖(5层)2线",
	"远古运镖(6层)2线",
	"远古运镖(7层)2线",
	"远古运镖(8层)2线",
	"远古运镖(9层)2线",
	"远古运镖(1层)3线",
	"远古运镖(2层)3线",
	"远古运镖(3层)3线",
	"远古运镖(4层)3线",
	"远古运镖(5层)3线",
	"远古运镖(6层)3线",
	"远古运镖(7层)3线",
	"远古运镖(8层)3线",
	"远古运镖(9层)3线",
	"远古运镖(1层)4线",
	"远古运镖(2层)4线",
	"远古运镖(3层)4线",
	"远古运镖(4层)4线",
	"远古运镖(5层)4线",
	"远古运镖(6层)4线",
	"远古运镖(7层)4线",
	"远古运镖(8层)4线",
	"远古运镖(9层)4线",
	"远古战场(2层)1线",
	"远古战场(4层)1线",
	"远古战场(6层)1线",
	"远古战场(8层)1线",
	"远古战场(2层)2线",
	"远古战场(4层)2线",
	"远古战场(6层)2线",
	"远古战场(8层)2线",
	"远古战场(2层)3线",
	"远古战场(4层)3线",
	"远古战场(6层)3线",
	"远古战场(8层)3线",
	"远古战场(2层)4线",
	"远古战场(4层)4线",
	"远古战场(6层)4线",
	"远古战场(8层)4线",
	"远古战场(10层)",
	"远古战场(11层)",
	"远古战场(12层)",
	"远古战场(13层)",
	"远古战场(10层)1线",
	"远古战场(11层)1线",
	"远古战场(12层)1线",
	"远古战场(13层)1线",
	"远古战场(10层)2线",
	"远古战场(11层)2线",
	"远古战场(12层)2线",
	"远古战场(13层)2线",
	"远古战场(10层)3线",
	"远古战场(11层)3线",
	"远古战场(12层)3线",
	"远古战场(13层)3线",
	"远古战场(10层)4线",
	"远古战场(11层)4线",
	"远古战场(12层)4线",
	"远古战场(13层)4线",
	"远古运镖(10层)",
	"远古运镖(11层)",
	"远古运镖(12层)",
	"远古运镖(13层)",
	"远古运镖(10层)1线",
	"远古运镖(11层)1线",
	"远古运镖(12层)1线",
	"远古运镖(13层)1线",
	"远古运镖(10层)2线",
	"远古运镖(11层)2线",
	"远古运镖(12层)2线",
	"远古运镖(13层)2线",
	"远古运镖(10层)3线",
	"远古运镖(11层)3线",
	"远古运镖(12层)3线",
	"远古运镖(13层)3线",
	"远古运镖(10层)4线",
	"远古运镖(11层)4线",
	"远古运镖(12层)4线",
	"远古运镖(13层)4线",
	"3v3竞技",
	"远古战场(14层)",
	"远古战场(15层)",
	"远古战场(16层)",
	"远古战场(17层)",
	"远古战场(18层)",
	"远古战场(14层)1线",
	"远古战场(15层)1线",
	"远古战场(16层)1线",
	"远古战场(17层)1线",
	"远古战场(18层)1线",
	"远古战场(14层)2线",
	"远古战场(15层)2线",
	"远古战场(16层)2线",
	"远古战场(17层)2线",
	"远古战场(18层)2线",
	"远古战场(14层)3线",
	"远古战场(15层)3线",
	"远古战场(16层)3线",
	"远古战场(17层)3线",
	"远古战场(18层)3线",
	"远古战场(14层)4线",
	"远古战场(15层)4线",
	"远古战场(16层)4线",
	"远古战场(17层)4线",
	"远古战场(18层)4线",
	"远古运镖(14层)",
	"远古运镖(14层)1线",
	"远古运镖(14层)2线",
	"远古运镖(14层)3线",
	"远古运镖(14层)4线",
	"远古运镖(15层)",
	"远古运镖(15层)1线",
	"远古运镖(15层)2线",
	"远古运镖(15层)3线",
	"远古运镖(15层)4线",
	"熊猫林",
	"小悟之境",
	"大悟之境",
	"1v1竞技",
	"一支穿云箭",
	"一支穿云箭(1)",
	"一支穿云箭(2)",
	"一支穿云箭(3)",
	"一支穿云箭(4)",
	"一支穿云箭(5)",
	"一支穿云箭(6)",
	"一支穿云箭(7)",
	"一支穿云箭(8)",
	"一支穿云箭(9)",
	"一支穿云箭(10)",
	"远古运镖(16层)",
	"远古运镖(16层)1线",
	"远古运镖(16层)2线",
	"远古运镖(16层)3线",
	"远古运镖(16层)4线",
	"远古运镖(17层)",
	"远古运镖(17层)1线",
	"远古运镖(17层)2线",
	"远古运镖(17层)3线",
	"远古运镖(17层)4线",

}

--玩家点击速传按钮的函数[指定场景名称和坐标] 
MiscsImplement.questTargetSpaceMoveHandler = function (sysarg, msgid, packet)
	local DELAYTYPE = 13	--延时回调类型
	local delayTime = 3000	--延时时间
	
	local sendFlag = DataPack.readByte(packet)
    local sceneId = DataPack.readWord(packet)  --读取场景的ID
	
    local scenename = DataPack.readString(packet) --读取场景的名字
	--local scenename = "黄铜BOSS"
	--  -- 
	local pos_x = DataPack.readWord(packet)
	local pos_y = DataPack.readWord(packet)
	
	local oldSceneId = Actor.getSceneId(sysarg)
	
	for i, _v in ipairs(g_forbidSceneId) do
		if sceneId==_v then 
			--Actor.sendTipmsg(sysarg,"非法进入场景",ttFlyTip)
			return 
		end
	end
	
	for i, _v in ipairs(g_forbidSceneName) do 
		if scenename==_v then 
			--Actor.sendTipmsg(sysarg,"非法进入场景",ttFlyTip)
			return 
		end
	end
	
	
	--限时速传
	local limitTime = DataPack.readUInt(packet)
	if limitTime and limitTime > 0 then
		local curTime = System.getCurrMiniTime()
		if limitTime < curTime then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.x00191 ,ttDialog)
		else
			local result = false
			local handle,result = Actor.postEntityScriptDelayMsg(sysarg,delayTime,result,DELAYTYPE,sceneId,pos_x,pos_y,0)
			if not result then return end 
			local npack = DataPack.allocPacket(sysarg,139,4)
			if npack == nil then return end
			DataPack.writeInt(npack,handle)
			DataPack.writeInt(npack,delayTime)
			DataPack.writeByte(npack,1)
			DataPack.writeByte(npack,1)
			DataPack.writeString(npack,scenename)
			DataPack.flush(npack)
			--System.telportSceneByName(sysarg,scenename,pos_x,pos_y)
		end
		return
	end
	---------------
	if not Actor.canUseItem(sysarg,SendToSceneItemID) then
		Actor.sendTipmsg( sysarg, Lang.ScriptTips.x00043,ttTipmsgWindow )
		return
	end
	
	--禁止速传物品
	local pScene = Fuben.getScenePtrByName(scenename)
	if Fuben.hasMapAreaAttri(pScene, pos_x, pos_y, aaNotItemTran) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00072, ttFlyTip)
		return
	end
  
	-- 战斗状态禁止使用疾风令
	--if sendFlag == 0 and Actor.hasState(sysarg, esStateBattle) then  	
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.x00143, ttTipmsgWindow)
	--	return
	--end
	
	if Actor.hasState(sysarg, esPaTaFubenBattle) then
		Actor.sendTipmsg( sysarg, Lang.ScriptTips.pataNotice021,ttFlyTip )
		return
	end

	if Actor.hasState(sysarg,esStateDeath) then
		return
	end
	--正在押镖
	if Actor.getIsDartFlag(sysarg) ~= 0 then
		Actor.sendTipmsg(sysarg, Lang.Activity.g00030, ttFlyTip)
		return
	end
    
	if sendFlag == 0 then
		--local svar 		= Actor.getStaticVar(sysarg)	
		--local vipType 	= Actor.getVipType(sysarg)
		--local isVip 	= Actor.isVip(sysarg)  -- 是否是VIP用户	
		
		-- VIP免费传送剩余次数。如果为-1，不需要同步到客户端；如果不为-1，则同步给客户端
		--local leftVIPFreeTelCount = -1
		
--[[		if isVip then		
			local maxFreeTelCount = LocalDT.VIPFreeTelCountCfg[vipType] or 0
			if (maxFreeTelCount == -1) then			
				needConsumeItem = false
			else
				if (svar.days.VipFreeTelCnt == nil) then svar.days.VipFreeTelCnt = 0 end
				if (maxFreeTelCount > svar.days.VipFreeTelCnt) then
					svar.days.VipFreeTelCnt = svar.days.VipFreeTelCnt + 1
					leftVIPFreeTelCount = maxFreeTelCount - svar.days.VipFreeTelCnt
					needConsumeItem = false
					
					local npack = DataPack.allocPacket(sysarg,139,32)
					DataPack.writeInt(npack,leftVIPFreeTelCount)
					DataPack.flush(npack)	
				else
					Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000068, ttFlyTip)
				end
			end	
		end--]]
		
		------------------------------------
		-- 小飞鞋，改为需要65级
		--[[
		--Vip永久免费任务(NPC)传送
		local needConsumeItem = true
		local VipGrade =  Actor.getUIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
		if VipGrade > 0 then
			needConsumeItem = false
		end	
		if (needConsumeItem) then
			if( 1 ~= Actor.removeItem(sysarg,SendToSceneItemID,1,-1,-1,-1,"任务速传",5) ) then      --删除一个物品			
				--Actor.openDialogs(sysarg,diBuyAnItem, tostring(SendToSceneItemID))
				return
			end
		end
		]]--> 22任务追踪栏中的传送，都去掉需要VIP/小飞鞋，现在写上传的，都是免费让玩家用。 
		-- local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		-- if nActorLevel < 65 then
		-- 	Actor.sendTipmsg(sysarg, "等级未达到65级，无法传送", ttFlyTip)
		-- 	return
		-- end
		------------------------------------
		
		local Fesult = System.telportSceneByName(sysarg,scenename,pos_x,pos_y,1)
		SpecialScene(sysarg,oldSceneId)
		if Fesult == true then
			Actor.triggerAchieveEvent(sysarg, 69, 0, 0, 0) -- 触发成就事件
		end
	elseif sendFlag == 1 then
		local Fesult = System.telportSceneByName(sysarg,scenename,pos_x,pos_y,1)
		SpecialScene(sysarg,oldSceneId)
		if Fesult == true then
			Actor.triggerAchieveEvent(sysarg, 69, 0, 0, 0) -- 触发成就事件
		end
	elseif sendFlag == 2 then   --直接传送不扣道具
		if Actor.getFubenId(sysarg) > 0 or oldSceneId == StdActivityCfg.WuLinZhengBa.lowSceenId then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
			return
		end
		
		local SceneTab = {{171,true}}  --场景表，第一个数据：场景ID  第二个数据：进去不让宝宝进去
		for _,scene in ipairs(SceneTab) do
			if scene[1] == sceneId then
				if CheckFreeTelportScene(sysarg,sceneId) then
					local Fesult = System.telportSceneByName(sysarg,scenename,pos_x,pos_y,1)
					if Fesult and scene[2] then
						EnterFightDelPet(sysarg)
					end
				end
				break
			end
		end
	end
end

function SpecialScene(sysarg,oldSceneId)
	
	if oldSceneId == 171 or oldSceneId == StdActivityCfg.WuLinZhengBa.lowSceenId then
		OnAddPet(sysarg)
	elseif oldSceneId == 142 then
		Actor.updateActorName(sysarg)
	end
end

function CheckFreeTelportScene(sysarg,sceneId)
	
	if sceneId == 171 then
		if not Actor.changeMoney(sysarg,0,-9000,GameLog.cShieldSceneConsume,"盾灵场景消耗金币") then
			if not Actor.changeMoney(sysarg,1,-9000,GameLog.cShieldSceneConsume,"盾灵场景消耗金币") then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf061, ttFlyTip)
				return false
			end
		end
	end
	
	return true
end

MiscsImplement.telportCFGCMoveHandler = function (sysarg, msgid, packet)
    local sceneId = DataPack.readWord(packet)  --读取场景的ID
    local scenename = DataPack.readString(packet)  --读取场景的名字
	local pos_x = DataPack.readWord(packet)
	local pos_y = DataPack.readWord(packet)
	local mySceneId = Actor.getSceneId(sysarg)
	if mySceneId == sceneId then 
		return
	end
	if sceneId == 47 then
		if not Actor.checkActorLevel(sysarg,CaiFuGuangChang.needLevel) then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.f00064, ttFlyTip)
			return
		end

		--禁止速传物品
		local pScene = Fuben.getScenePtrByName(scenename)
		if Actor.hasState(sysarg, esPaTaFubenBattle) then
			Actor.sendTipmsg( sysarg, Lang.ScriptTips.pataNotice021,ttFlyTip )
			return
		end

		--玩家在武林争霸场地，夺宝奇兵，部落战场场景不能跑到财富广场，后端做限制
		if mySceneId == 58 or mySceneId == 65 or mySceneId == 66  then
			Actor.sendTipmsg( sysarg,  Lang.ScriptTips.f00071,ttFlyTip )
			return
		end
		--正在押镖
		if Actor.getIsDartFlag(sysarg) ~= 0 then
			Actor.sendTipmsg(sysarg, Lang.Activity.g00030, ttFlyTip)
			return
		end

    
		--检查消耗
		local consumeData = {}
		local isok = CheckOneConsume(sysarg, false, CaiFuGuangChang.consume, true, consumeData)
		if not isok then 
			return
		end
		--扣除消耗
		isok = DeductOneConsume(sysarg, false, CaiFuGuangChang.consume, GameLog.cNewJiFengLingTelportConsume)		
		if not isok then
			return
		end		

		local Fesult = System.telportSceneByName(sysarg,scenename,pos_x,pos_y,1)
		
		local str = string.format(Lang.ScriptTips.zf611,Actor.getName(sysarg))
		System.broadcastTipmsg(str, ttScreenCenter)
		str = string.format(Lang.ScriptTips.zf610,Actor.getName(sysarg))
		System.broadcastTipmsg(str, ttChatWindow)
		
		if Fesult == true then
			local value = 0
			if CaiFuGuangChang.revenue and CaiFuGuangChang.consume and CaiFuGuangChang.consume.count then
				value = CaiFuGuangChang.revenue * CaiFuGuangChang.consume.count
			end
			if value > 0 then
				System.modifySBKRevenue(value)
			end
			Actor.triggerAchieveEvent(sysarg, 69, 0, 0, 0) -- 触发成就事件
		end
	elseif sceneId == 6 then
		System.telportSceneByName(sysarg,scenename,pos_x,pos_y,1)
	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cQuestTargetSpaceMoveHandler, MiscsImplement.questTargetSpaceMoveHandler)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterCFGCReq, MiscsImplement.telportCFGCMoveHandler)