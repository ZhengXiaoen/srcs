--#include "data\config\CliffordConfig.lua" once
--#include "data\config\MkzConfig.lua" once
--#include "data\config\item\ShenQiJingYanYuCfg.lua" once
--#include "data\config\activity\OpenServerAwardCfg.lua" once
    --#include "data\config\equipSynthesis\EquipWarCfg.lua" once
--#include "data\config\activity\KuaFuTuMoDianCfg.lua" once
--#include "data\functions\EquipEnhance\EquipStove.lua" once
--#include "data\config\activity\CopyBackConfig.lua" once
--#include "data\config\equipSynthesis\EquipStoveCfg.lua" once
----#include "data\config\equipSynthesis\SpecialRingDamoCfg.lua" once
--#include "data\config\SportsTitleCfg.lua" once
--#include "data\config\activity\ActivityGiftConfig.lua" once --首冲扩展
--#include "data\config\NewZodiac.lua" once
--#include "data\config\guild\GuildFlagConfig.lua" once
--#include "data\config\activity\YuanGuZhanChangCfg.lua" once
--#include "data\functions\modules\yuanshen.lua" once -- 元神系统
--#include "data\functions\Systems\ActivitySystem\PalaceFighting.lua" once -- 皇宫大乱斗
--#include "data\functions\RedPacketFunc.lua" once
--#include "data\functions\SuperLuckStarFunc.lua" once
--#include "data\functions\LegendEquipFunc.lua" once
--#include "data\config\GodWeaponCfg.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\config\activity\YongChuangTianGuanCfg.lua" once
--#include "data\functions\BossRuneExFunc.lua" once
--#include "data\functions\new_activity\festival\festival.lua" once -- 节日相关
--#include "data\functions\new_activity\festival\activity_dajidali.lua" once --大吉大利活动
--#include "data\functions\Activity\XiaoFeiZhuanPan.lua" once --消费转盘
--#include "data\functions\BlueVipFunc.lua" once
--#include "data\functions\IdentifyCodeFunc.lua" once
--#include "data\functions\new_activity\festival\OneYearActivity.lua" once --周年活动
--#include "data\functions\modules\guard_dragon.lua" once -- 龙灵守护系统
--#include "data\functions\modules\foot_print.lua" once -- 足迹
--#include "data\config\PersonalSeasonaward.lua" once
--#include "data\functions\modules\LongTengZhuanPan.lua" once -- 龙腾转盘
--#include "data\functions\SkyRingFunc.lua" once 
--#include "data\functions\new_activity\SanRenHongLi.lua" once --散人红利
--#include "data\config\SkyDropBonusCfg.lua" once
--#include "data\config\activity\TongTianTaCfg.lua" once--通天塔
--#include "data\functions\ImmortalSystemFunc.lua" once--仙装
--#include "data\functions\Activity\XianGongZhuanPan.lua" once--仙宫转盘
--#include "data\functions\new_activity\festival\activity_jingji.lua" once --竞技
--#include "data\functions\Activity\JingjiActivityZhuanPan.lua" once --竞技转盘



--获取祈福信息
function MiscExGetCliffordInfo(sysarg,sysid,packet,bDouble)
    if bDouble == nil then bDouble = false end
    local var = Actor.getStaticVar(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,2)
    DataPack.writeInt(pack,var.clifford.time)
    DataPack.writeByte(pack,var.clifford.free)
    DataPack.writeByte(pack,var.clifford.money)
    if bDouble == true then
        DataPack.writeByte(pack,1)
    else
         DataPack.writeByte(pack,0)
    end
    DataPack.writeInt(pack,var.clifford.allCount)
    DataPack.flush(pack)

end

--祈福
function MiscExCliffordInfo(sysarg,sysid,packet)
    local nType = DataPack.readByte(packet)
    if System.getDaysSinceOpenServer() <= 3 then return end
    --免费祈福
    local var = Actor.getStaticVar(sysarg)
    local bDouble = false
    if nType == 0 then
        if var.clifford.time ~= 0 then 
            Actor.sendTipmsg(sysarg,"还没有到时间，无法祈福!",ttFlyTip)
            return
        end
        if var.clifford.free >= CliffordConfig.FreeCliffordCount then
            Actor.sendTipmsg(sysarg,"今日祈福次数已满",ttFlyTip)
            return
        end

        var.clifford.free = var.clifford.free + 1
        if var.clifford.free < CliffordConfig.FreeCliffordCount then
            var.clifford.time = CliffordConfig.FreeTime
        else   
            Actor.deleteTimer(sysarg,46)
        end
        local awardMoney = 0
        for i = 1,table.getn(CliffordConfig.FreeClifford) do
            if var.clifford.money == CliffordConfig.FreeClifford[i].count then
                awardMoney = CliffordConfig.FreeClifford[i].awardMoney
                break
            end
        end
        if awardMoney > 0 then
            Actor.changeMoney(sysarg,mtBindCoin,awardMoney,LogIds.qifu,"免费祈福"..var.clifford.free)
        end
        local str = "<(n%s)>在免费祈福活动获得%d绑定金币。<我也要去/@@showWin,211>"
        str = string.format(str,Actor.getName(sysarg),awardMoney)
        System.broadcastTipmsg(str,ttChatWindow)
        Actor.sendTipmsg(sysarg,"免费祈福获得"..awardMoney.."绑定金币!",ttFlyTip)
        var.clifford.allCount = var.clifford.allCount + awardMoney
    else --元宝祈福
        if var.clifford.money >= table.getn(CliffordConfig.MoneyClifford) then
            Actor.sendTipmsg(sysarg,"今日祈福次数已满",ttFlyTip)
            return
        end
        local nMoneyCount =  var.clifford.money + 1
        local cfg = CliffordConfig.MoneyClifford[nMoneyCount]
        if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.needMoney then
            Actor.sendTipmsg(sysarg,"元宝不足"..cfg.needMoney.."无法祈福!",ttFlyTip)
            return
        end
        local awardMoney  = cfg.awardMoney
        if cfg.double then 
            awardMoney = awardMoney * 2
            bDouble = true
        end
        Actor.changeMoney(sysarg,mtYuanbao,-cfg.needMoney,LogIds.qifu,"元宝祈福")
        Actor.changeMoney(sysarg,mtBindCoin,awardMoney,LogIds.qifu,"元宝祈福")
        var.clifford.money = nMoneyCount
        local str = "<(n%s)>在元宝祈福活动获得%d绑定金币。<我也要去/@@showWin,211>"
        str = string.format(str,Actor.getName(sysarg),awardMoney)
        System.broadcastTipmsg(str,ttChatWindow)
        --var.clifford.allCount = var.clifford.allCount + awardMoney
        Actor.sendTipmsg(sysarg,"元宝祈福获得"..awardMoney.."绑定金币!",ttFlyTip)
    end
    MiscExGetCliffordInfo(sysarg,nil,nil,bDouble)
end


--得到神级经验玉的奖励
MiscGetShenQiJingYanYu = function( sysarg, msgid, packet )
	local itemSec = DataPack.readInt64(packet)
    local nType = DataPack.readByte(packet)
    local itemPtr = Item.getBagItemPtrByGuid(sysarg,itemSec)
	
	if itemPtr == nil then
        return false
    end
	
	--判断是否是非法值
    if nType < 1 or nType > #ShenQiJingYanYuCfg.rate then
        return
    end
	
	if 5468 ~=Item.getItemId(itemPtr)then --传过来的物品不能错
		return 
	end
	
	--判断这个军魂值是否是满了    
	local nValue = 0
	local nDua = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,nValue)
	
	if nDua <= 0 then
		return
	end	
	
	local itemId = Item.getItemProperty(sysarg,itemPtr,0,nValue)	
	local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
	--满了才能使用
	--print("nDua="..nDua)
	--print("maxDua="..maxDua)
	if nDua < maxDua then
		Actor.sendTipmsg(sysarg,"神级经验玉还未满，不能使用",ttFlyTip)
		return
	end
	
	
	--判断身上的钱够不够
	if nType~=1 then 
		if Actor.getMoneyCount(sysarg,3)<ShenQiJingYanYuCfg.rate[nType][2] then
			Actor.sendTipmsg(sysarg,"元宝不够", ttFlyTip) 
			return
		end
	end
	if Item.removeItem(sysarg,itemPtr,1,"使用神级经验玉",LogIds.ShenQiJingYanYu) then
	
		Actor.changeMoney(sysarg,3,-ShenQiJingYanYuCfg.rate[nType][2],2407,ShenQiJingYanYuCfg.rate[nType][1].."倍神级经验玉奖励")
		
		--给经验值
		 Actor.addExp(sysarg,ShenQiJingYanYuCfg.addExp*ShenQiJingYanYuCfg.rate[nType][1],2047,"使用神级经验玉")
		--发送成功的结果
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGetShenQiJingYanYu)
		DataPack.flush(netPack)
		
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", JunHunPingCfg.addJunHunZhi*JunHunPingCfg.rate[nType][1], "军魂值"), 1);
	end
end

--打开天神护体
MiscOpenTianShenHuTi = function( sysarg, msgid, packet )
	 local nType = DataPack.readByte(packet)
	 if nType== 1 then
		if Actor.hasState(sysarg,esStateShield) then
			Actor.sendTipmsg(sysarg,"您的护体效果已经开启了",ttFlyTip)
			return 
		end
		
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < 2000 then
			Actor.sendTipmsg(sysarg,"元宝不足，开启护体效果失败！",ttFlyTip)
			return 
		end
		
		if Actor.addState(sysarg,esStateShield) == false then
			Actor.sendTipmsg(sysarg,"开启护体效果失败！",ttFlyTip)
			return 
		end
		
		
		Actor.sendTipmsg(sysarg,"您已成功开启护体效果！",ttFlyTip)
		Actor.collectOperate(sysarg,0)
	 elseif  nType	== 0 then
		
		--if not Actor.hasState(sysarg,esStateShield) then
		--	Actor.sendTipmsg(sysarg,"您的护体效果是关闭的",ttFlyTip)
		--	return false
		--end
		--
		--if Actor.removeState(sysarg,esStateShield) == false then
		--	Actor.sendTipmsg(sysarg,"关闭护体效果失败！",ttFlyTip)
		--	return false
		--end
		--
		--Actor.collectOperate(sysarg,0)
		--
		--Actor.sendTipmsg(sysarg,"您的护体效果已经关闭！",ttFlyTip)
	 end
end



--function TestMiscExLeaseTitle(sysarg,index)
--    index = tonumber(index)
--    MiscExLeaseTitle(sysarg,index,nil)
--end
function MiscExLeaseTitle(sysarg, msgid, packet )
    local cfg  =OpenServerAward[10]
   local nIndex = DataPack.readByte(packet)
--   local nIndex = 0
--   packet = nil
--    if packet == nil then
--        nIndex = msgid
--    end

    if nIndex <= 0 or nIndex > #cfg.list then
           
        return
    end
    --过去了开服时间
    local nOpenDay = System.getDaysSinceOpenServer()

    if nOpenDay < cfg.openTime[1] or nOpenDay > cfg.openTime[2] then
        Actor.sendTipmsg(sysarg,"开服时间已过"..cfg.openTime[2].."天,无法购买!",ttFlyTip)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.leasetitleid == nil then
        var.leasetitleid = 0
    end
    if var.leasetitleid == nIndex then return end
    --只能从低往高了租赁
    if nIndex <= var.leasetitleid then
        return
    end
    --补差价
    local diff = 0
    if var.leasetitleid > 0 then
        diff = cfg.list[var.leasetitleid].price
    end
    local nNeedMoney = cfg.list[nIndex].price - diff
    if Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney then
        Actor.sendTipmsg(sysarg,"元宝不足"..nNeedMoney..",无法购买!",ttFlyTip)
        return
    end
    Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.leasetitle,"称号租赁")
    --撤掉原先的称号
    if var.leasetitleid > 0 then
        Actor.setTopTitle(sysarg,cfg.list[var.leasetitleid].conditions.params[1],false)
    end

    var.leasetitleid = nIndex
    --给予新的称号
    Actor.setTopTitle(sysarg,cfg.list[var.leasetitleid].conditions.params[1],true)
    Actor.sendTipmsg(sysarg,"称号租赁成功!",ttFlyTip)
    local pack = DataPack.allocPacket(sysarg,151,27)
    DataPack.writeByte(pack,nIndex)
    DataPack.flush(pack)
   
     local str = "<(n%s)>租赁了%s称号,超值属性到手,随意单挑BOSS无压力！开服第八天返还租赁元宝。<我也要租赁/@@showWin,180,7>"
    str = string.format(str,Actor.getName(sysarg),cfg.list[var.leasetitleid].name)

    System.broadcastTipmsg(str,ttChatWindow)
    

end

--跨服屠魔点数
function MiscKuafuTuMoDian (sysarg, msgid, packet )
	local nIndex = DataPack.readByte(packet)
	if nIndex==0 then --请求信息
		sendKuafuTuMoDianInfo(sysarg)
	elseif nIndex==1 then  --购买点数
		buyKuafuTuMoDian(sysarg)
	end
end
--发送跨服屠魔点数的信息
function sendKuafuTuMoDianInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--屠魔点
	if var.days.kuafuTMDian ==nil then 	
		var.days.kuafuTMDian=300 --初始化就有300点
	end	
	if var.days.kuafuTMDian<0 then 
		var.days.kuafuTMDian =0
	end
	--购买屠魔点的次数
	if  var.days.kuafuTMDianBT ==nil then 
		var.days.kuafuTMDianBT =0 
	end
	
	local leftTimes = KuaFuTuMoDianCfg.candBuyTimes - var.days.kuafuTMDianBT
	if leftTimes<0 then 
		leftTimes =0
	end

	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKuafuTuMoDian)
	DataPack.writeByte(pack,KuaFuTuMoDianCfg.candBuyTimes)	--总次数，前端不读配置，把总次数也发给前端
    DataPack.writeInt(pack,var.days.kuafuTMDian) --屠魔点
	DataPack.writeByte(pack,leftTimes)	--剩余次数
    DataPack.flush(pack)
end
--购买跨服屠魔点数
function buyKuafuTuMoDian(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--屠魔点
	if var.days.kuafuTMDian ==nil then 	
		var.days.kuafuTMDian=300 --初始化就有300点
	end	
	if var.days.kuafuTMDian<0 then 
		var.days.kuafuTMDian =0
	end
	--购买屠魔点的次数
	if  var.days.kuafuTMDianBT ==nil then 
		var.days.kuafuTMDianBT =0 
	end

	
	--判断点数
	if	var.days.kuafuTMDian>=KuaFuTuMoDianCfg.topPoint then 
		Actor.sendTipmsg(sysarg,"屠魔点数已经达到上限",ttFlyTip)
		return 
	end
	
	--判断剩余次数
	if var.days.kuafuTMDianBT>=KuaFuTuMoDianCfg.candBuyTimes then 
		Actor.sendTipmsg(sysarg,"今天的购买次数已经用完",ttFlyTip)
		return 
	end
	
	if KuaFuTuMoDianCfg.buyInfo[var.days.kuafuTMDianBT+1]==nil then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return 
	end
	
	--判断金钱
	if Actor.getMoneyCount(sysarg,3) < KuaFuTuMoDianCfg.buyInfo[var.days.kuafuTMDianBT+1].needMoney then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	end
	
	--扣金钱
	Actor.changeMoney( sysarg, 3, -KuaFuTuMoDianCfg.buyInfo[var.days.kuafuTMDianBT+1].needMoney, LogIds.buyKuaFuTuMoDian, "买跨服屠魔点")
	
	--增加点
	var.days.kuafuTMDian =var.days.kuafuTMDian + KuaFuTuMoDianCfg.buyInfo[var.days.kuafuTMDianBT+1].addPoint
	
	--扣次数
	var.days.kuafuTMDianBT = var.days.kuafuTMDianBT+1
	--发送给前端
	sendKuafuTuMoDianInfo(sysarg)
end

--资源找回
function MisZiYuanXunHui (sysarg, msgid, packet )
	local nIndex = DataPack.readByte(packet)
	if nIndex==0 then --请求信息
		GetZiYuanZhaoHuiInfo(sysarg)
	elseif nIndex==1 then  --资源找回
		DoZiYuanZhaoHui(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	elseif nIndex ==2 then  --一键找回全部
		DoZiYuanZhaoHuiYiJianZhaoHui(sysarg,DataPack.readByte(packet))
	end
end
function MiscExGetMapPlayerInfo(sysarg, msgid, packet)
    local nPage = DataPack.readByte(packet)
    nPage = nPage - 1;
  
    if nPage < 0 then return end;
    local nStart = nPage * 5 + 1
    
    local playerList = LuaHelp.getSceneActorListById(Actor.getSceneId(sysarg))
    
    if playerList ~= nil then
        local pack = nil
        local arrInfo = {}
        local nCount = 0
        for i = nStart, #playerList do
            local actor = playerList[i]
            local info = {}
            if Actor.getIntProperty(actor,PROP_ENTITY_ID) ~= Actor.getIntProperty(sysarg,PROP_ENTITY_ID) then
                info.id = Actor.getIntProperty(actor,PROP_ENTITY_ID)
                info.name = Actor.getName(actor)
                info.level = Actor.getIntProperty(actor,PROP_CREATURE_LEVEL)
                info.job = Actor.getIntProperty(actor,PROP_ACTOR_VOCATION)
                info.sex = Actor.getIntProperty(actor,PROP_ACTOR_SEX)
                info.guildname= Actor.getGuildName(actor)
                table.insert(arrInfo,info)
                nCount = nCount + 1
                if nCount>=5 then break end
            end
        end
        if #arrInfo <= 0 then nPage = -1 end
        if #playerList <= 1 then nPage = 254 end
        pack = DataPack.allocPacket(sysarg,151,36)
        DataPack.writeByte(pack,nPage + 1)
        DataPack.writeByte(pack,nCount);
      
        for i= 1,nCount do
            if i > #arrInfo then break end
            local info =arrInfo[i]
            DataPack.writeInt(pack,info.id)
            DataPack.writeString(pack,info.name)
            DataPack.writeByte(pack,info.level)
            DataPack.writeByte(pack,info.job)
            DataPack.writeByte(pack,info.sex)
            DataPack.writeString(pack,info.guildname)

            
        end
       
         DataPack.flush(pack)
    end

end
--得到资源找回的信息
function GetZiYuanZhaoHuiInfo(sysarg)
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sZiYuanXunHui)
	DataPack.writeByte(pack,0) --类型
	
	local var = Actor.getStaticVar(sysarg)
	if var.ziYuanXunHui==nil then var.ziYuanXunHui ={} end --初始化
	local ziYuanXunHui = var.ziYuanXunHui
	
	for i=1,#CopyBackConfig do 
		if ziYuanXunHui[i]==nil then 
			DataPack.writeByte(pack,0)
		else 
			DataPack.writeByte(pack,ziYuanXunHui[i])
		end
	end
	DataPack.flush(pack)
end

--实现资源找回
function DoZiYuanZhaoHui(sysarg,index,types)

	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay<2 then
		Actor.sendTipmsg(sysarg,"开服第2天开启",ttFlyTip)
		return 
	end

	index =tonumber(index)
	types =tonumber(types)
	
	--前端发了错误的配置来
	if index<1 or index >#CopyBackConfig then 
		return 
	end

	if types~=1 and  types~=2 then 
		return 
	end

	local var = Actor.getStaticVar(sysarg)
	if var.ziYuanXunHui==nil then var.ziYuanXunHui ={} end --初始化
	local ziYuanXunHui = var.ziYuanXunHui
	
	--没有找回的次数
	if ziYuanXunHui[index]==nil or ziYuanXunHui[index]==0 then 
		Actor.sendTipmsg(sysarg,"没有找回的次数",ttFlyTip)
		return 
	end
	--print("ziYuanXunHui[index]="..ziYuanXunHui[index])
	
	--金钱不够
	local MC = 2 
	local needMoneyType =1
	if types==1 then
		--if Actor.getMoneyCount(sysarg,1) < CopyBackConfig[index].jbBack then
		--	Actor.sendTipmsg(sysarg,"金币不足",ttFlyTip)
		--	return
		--end
		
		if Actor.getMoneyCount(sysarg,1) >= CopyBackConfig[index].jbBack then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= CopyBackConfig[index].jbBack then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg,"绑金/金币不足",ttFlyTip)
			return
		end	
		
	elseif types==2 then
		needMoneyType =3
		if Actor.getMoneyCount(sysarg,3) < CopyBackConfig[index].ybBack then
			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			return
		end
	end

	--判断格子是否足够 --一键完成的时候要先判断
	if types==1 then
		if not Awards.CheckBagGridCount(sysarg,CopyBackConfig[index].copyAwards_half) then
			return 
		end
	else 
		if not Awards.CheckBagGridCount(sysarg,CopyBackConfig[index].copyAwards) then
			return 
		end
	end

	--扣钱
	if types==1 then
		Actor.changeMoney( sysarg, MC, -CopyBackConfig[index].jbBack, LogIds.ziyuanzhaohui, CopyBackConfig[index].copyName)
	elseif types==2 then
		Actor.changeMoney( sysarg, needMoneyType, -CopyBackConfig[index].ybBack, LogIds.ziyuanzhaohui, CopyBackConfig[index].copyName)
	end
	
	--扣次数
	var.ziYuanXunHui[index] = var.ziYuanXunHui[index] -1
	--给奖励
	--Actor.sendTipmsg(sysarg,"得到奖励",ttFlyTip)
	if types==1 then
		Awards.Give(sysarg,CopyBackConfig[index].copyAwards_half,LogIds.ziyuanzhaohui,CopyBackConfig[index].copyName)
	else
		Awards.Give(sysarg,CopyBackConfig[index].copyAwards,LogIds.ziyuanzhaohui,CopyBackConfig[index].copyName)
	end

	--发送给前端
	GetZiYuanZhaoHuiInfo(sysarg)
end


--实现资源找回一键完成
function DoZiYuanZhaoHuiYiJianZhaoHui(sysarg,types)

	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay<2 then
		Actor.sendTipmsg(sysarg,"开服第2天开启",ttFlyTip)
		return 
	end
	
	types =tonumber(types)
	
	if types~=1 and  types~=2 then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	if var.ziYuanXunHui==nil then var.ziYuanXunHui ={} end --初始化
	local ziYuanXunHui = var.ziYuanXunHui
	
	local needjb=0
	local needyb=0 
	
	--算钱，判断背包
	for i=1,#CopyBackConfig do 
		if ziYuanXunHui[i] ~=nil and ziYuanXunHui[i]~=0 then --不为空，也不为0
			if types==1 then
				if not Awards.CheckBagGridCount(sysarg,CopyBackConfig[i].copyAwards_half) then --背包不足
					return 
				end
			else 
				if not Awards.CheckBagGridCount(sysarg,CopyBackConfig[i].copyAwards) then --背包不足
					return 
				end
			end
			needjb = needjb + ziYuanXunHui[i] * CopyBackConfig[i].jbBack
			needyb = needyb + ziYuanXunHui[i] * CopyBackConfig[i].ybBack
		end			
	end
	if needjb==0 and needyb ==0 then 
		Actor.sendTipmsg(sysarg,"没有找回的次数",ttFlyTip)
		return 
	end
	--打9折
	needjb =math.floor(0.9 * needjb)
	needyb =math.floor(0.9 * needyb)
		
	--金钱不够
	local needMoneyType =1
	local MC = 2
	if types==1 then
		--if Actor.getMoneyCount(sysarg,1) < needjb then
		--	Actor.sendTipmsg(sysarg,"金币不足",ttFlyTip)
		--	return
		--end

		if Actor.getMoneyCount(sysarg,1) >= needjb then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= needjb then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg,"绑金/金币不足",ttFlyTip)
			return
		end			
	elseif types==2 then
		needMoneyType =3
		if Actor.getMoneyCount(sysarg,3) < needyb then
			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			return
		end
	end
	
	------------
	--扣钱
	if types==1 then
		Actor.changeMoney( sysarg, MC, -needjb, LogIds.ziyuanzhaohui_YiJian, "一键找回资源")
	elseif types==2 then
		Actor.changeMoney( sysarg, needMoneyType, -needyb, LogIds.ziyuanzhaohui_YiJian, "一键找回资源")
	end
	
	--扣次数
	for i=1,#CopyBackConfig do 
        for j =1,var.ziYuanXunHui[i] do
        	if types==1 then
			    Awards.Give(sysarg,CopyBackConfig[i].copyAwards_half,LogIds.ziyuanzhaohui,CopyBackConfig[i].copyName)
		    else 
			    Awards.Give(sysarg,CopyBackConfig[i].copyAwards,LogIds.ziyuanzhaohui,CopyBackConfig[i].copyName)
		    end
        end
        var.ziYuanXunHui[i] = 0
	end	
	
	--发送给前端
	GetZiYuanZhaoHuiInfo(sysarg)
end


function MiscExRingDamo(sysarg, msgid, packet)

    local nEquipPos = DataPack.readByte(packet)
    local pEquip = Item.getEquipByPos(sysarg,nEquipPos)
    if pEquip == nil  then
        Actor.sendTipmsg(sysarg,"错误!!code:1",ttFlyTip)
        return
    end
    --类型
    if Item.getItemProperty(sysarg,pEquip,Item.ipItemType) ~= 18 then
        Actor.sendTipmsg(sysarg,"错误!!code:2".."itemtype:"..Item.getItemProperty(sysarg,pEquip,Item.ipItemType),ttFlyTip)
        return
    end
    local nItemId =  Item.getItemProperty(sysarg,pEquip,Item.ipItemID)
    local nStartItemId = 0
    local nUseType = Item.getItemProperty(sysarg,pEquip,Item.ipItemUseType)
    if nUseType == 1 then --重生戒指
        nStartItemId = EquipStoveCfg.SpecialRing[2][1].award.id
    elseif nUseType == 2 then --麻痹戒指
        nStartItemId = EquipStoveCfg.SpecialRing[1][1].award.id
    elseif nUseType == 3 then  --护体戒指
        nStartItemId = EquipStoveCfg.SpecialRing[3][1].award.id
    end
    if nStartItemId == 0 then 
        Actor.sendTipmsg(sysarg,"错误!!code:3",ttFlyTip)
        return
    end
    local nLevel = nItemId - nStartItemId + 1
    if nLevel < 5 then
        Actor.sendTipmsg(sysarg,"五级才可打磨!",ttFlyTip)
        return
    end
    local nCurrentCount = Item.getItemProperty(sysarg,pEquip,Item.ipItemInsureTimes)
    local nAllCount = (nLevel - 5) * 5 + 5
    if nCurrentCount >= nAllCount then
        Actor.sendTipmsg(sysarg,"当前特戒打磨次数不足，请提升特戒等级！",ttFlyTip)
        return
    end
    local needCfg = SpecialRingDamoCfg[nUseType]
    if nCurrentCount > #needCfg then
         Actor.sendTipmsg(sysarg,"等级已满,无法打磨!",ttFlyTip)
         return
    end
    needCfg = needCfg[nCurrentCount + 1]
    local consumeData = {}
    local result = CheckOneConsume(sysarg, false, needCfg.consume[1], true, consumeData)
	if not result or result == false then 
         Actor.sendTipmsg(sysarg,"特戒结晶数量不足，无法打磨！!",ttFlyTip)
		return 
	end

	result = DeductOneConsume(sysarg, false, needCfg.consume[1], LogIds.RingDamo)
	if not result then
		return
	end
    nCurrentCount = nCurrentCount + 1
    Item.setItemProperty(sysarg,pEquip,Item.ipItemInsureTimes,nCurrentCount)
    Actor.sendTipmsg(sysarg,"打磨成功！",ttFlyTip)
    local pack = DataPack.allocPacket(sysarg,151,38)
    DataPack.writeByte(pack,nEquipPos)
    DataPack.flush(pack)
end

--获取竞技称号信息
function MiscExGetSportsTitleInfo(sysarg, msgid, packet)
    local var = Actor.getStaticVar(sysarg)
     if var.sportstitle == nil then
        var.sportstitle = {}
    end
    local pack = DataPack.allocPacket(sysarg,151,40)
    DataPack.writeByte(pack,#SportsTitleCfg)
    for i = 1,#SportsTitleCfg do
        if var.sportstitle[i] ~= nil then
            DataPack.writeChar(pack,var.sportstitle[i])
        else
             DataPack.writeChar(pack,-1)
        end
    end
    DataPack.flush(pack)
end

--激活/升级竞技称号
function MiscExUpSportsTitleLev(sysarg,msgid,packet)
    local nIndex = DataPack.readByte(packet)
    if nIndex >#SportsTitleCfg then 
        Actor.sendTipmsg(sysarg,"激活/升级竞技称号失败！",ttFlyTip)
    end
    local var = Actor.getStaticVar(sysarg)
    if var.sportstitle == nil then
        var.sportstitle = {}
    end
    local cfg = SportsTitleCfg[nIndex].Uplev
	if cfg==nil then 
		return 
	end
    local nItemIndex = 1 --lua下标为1  c++为0
    if var.sportstitle[nIndex] ~= nil then
        nItemIndex=nItemIndex +  var.sportstitle[nIndex]  + 1
    end
    cfg = cfg[nItemIndex]
	
	if cfg==nil then 
		return 
	end
	
    local expendData = {}
    for i = 1,#cfg do
        local isok = CheckOneConsume(sysarg, false, cfg[i], false, expendData)				
	    if not isok then
            Actor.sendTipmsg(sysarg,"材料不足,无法升级！",ttFlyTip)
		    return 
	    end
    end
    --扣除消耗
	 for i = 1,#cfg do
        DeductOneConsume(sysarg, false, cfg[i], LogIds.SportsTitle)	
     end
	
	
    var.sportstitle[nIndex] = nItemIndex - 1
    MiscExGetSportsTitleInfo(sysarg)
    --给予称号
    Actor.setTopTitle(sysarg,SportsTitleCfg[nIndex].TitleId,true)
    --重新计算属性
    Actor.collectOperate(sysarg,0)

    local pack = DataPack.allocPacket(sysarg,151,41)
    DataPack.flush(pack)
end



--首冲扩展，现在的首冲是2档，如果有更多档，也可以写在这里面
TakeFirstRechargeGiftEx =function(sysarg, msgid, packet)
	local types = DataPack.readByte(packet)
	if types==0 then 
		GetFirstRechargeGiftEx(sysarg)
	elseif types ==1 then 
		OnTakeFirstRechargeGiftEx(sysarg)
	end
	
end

MiscexGetNewZodiacInfo = function(sysarg, msgid, packet)
    SendNewZodiacInfo(sysarg)
end

--function TestZoliac(sysarg,index)
--    MiscexUplevNewZodiac(sysarg,tonumber(index))
--end
--激活/升级十二生肖信息
MiscexUplevNewZodiac = function(sysarg, msgid, packet)
   local nIndex =DataPack.readByte(packet)
 
  --local nIndex = tonumber(msgid)
   if nIndex < 0 or nIndex > table.getn(NewZodiacCfg.BasicAttr) then
        Actor.sendTipmsg(sysarg,"错误的索引"..nIndex.."!",ttFlyTip)
        return
   end
   InitNewZodiacInfo(sysarg)
   local svar = Actor.getStaticVar(sysarg)
   --需要激活
   local cfg = NewZodiacCfg.BasicAttr[nIndex]
    
    if svar.newzodiac[nIndex] == nil or svar.newzodiac[nIndex].level == nil then 
            svar.newzodiac[nIndex] = {} 
            svar.newzodiac[nIndex].level = -1
            svar.newzodiac[nIndex].exp = 0
    end
    local nLevel = svar.newzodiac[nIndex].level + 2
    if svar.newzodiac[nIndex].level == -1 then
        nLevel = 1
    end
    
    if nLevel > #cfg.level then
        Actor.sendTipmsg(sysarg,"已满级，无法继续升级!",ttFlyTip)
        return
    end
    local str = ""
    if cfg.level[nLevel].item ~= nil then
                if Actor.getItemCount(sysarg,cfg.level[nLevel].item.itemid) < cfg.level[nLevel].item.count then
                Actor.sendTipmsg(sysarg,Item.getItemName(cfg.level[nLevel].item.itemid).."不足"..cfg.level[nLevel].item.count.."个,无法激活!",ttFlyTip)
                return
            end
            Actor.removeItem(sysarg,cfg.level[nLevel].item.itemid,cfg.level[nLevel].item.count,-1, -1, -1,"激活生肖",LogIds.activeitzodiac)
            local broad =""
            
            if svar.newzodiac[nIndex].level == -1 then
                str = "成功激活"..cfg.level[nLevel].stage.."·"..NewZodiacCfg.BasicAttr[nIndex].name.."0级"
                --<我也要去/@@showWin,1,6>
                 broad = string.format("<(n%s)>成功激活,获得<(c0xFFFFCC00)%s·%s0级>我也要去<(x沙漠土城:160:145:[传])>",Actor.getName(sysarg),cfg.level[nLevel].stage,NewZodiacCfg.BasicAttr[nIndex].name)
            else
                str = "成功突破至"..cfg.level[nLevel].stage.."·"..NewZodiacCfg.BasicAttr[nIndex].name.."0级"
                broad = string.format("<(n%s)>成功突破,获得<(c0xFFFFCC00)%s·%s0级>我也要去<(x沙漠土城:160:145:[传])>",Actor.getName(sysarg),cfg.level[nLevel].stage,NewZodiacCfg.BasicAttr[nIndex].name)
            end
            System.broadcastTipmsg(broad,ttChatWindow)
               
                
    else
            if svar.newzodiac[nIndex].exp < cfg.level[nLevel].exp then
                Actor.sendTipmsg(sysarg,"经验不足"..cfg.level[nLevel].exp..",无法升级!",ttFlyTip)
                return
            end
            str = string.format("<(n%s)>将%s·%s提升至%d级",Actor.getName(sysarg),cfg.level[nLevel].stage,NewZodiacCfg.BasicAttr[nIndex].name,(nLevel - 1) % 11)
    end
    Actor.sendTipmsg(sysarg,str,ttFlyTip)
    svar.newzodiac[nIndex].exp = svar.newzodiac[nIndex].exp - cfg.level[nLevel].exp
       
    if svar.newzodiac[nIndex].level == -1 then
            svar.newzodiac[nIndex].level = 0
    else
            svar.newzodiac[nIndex].level = svar.newzodiac[nIndex].level + 1
    end

   
   svar.newzodiaclevel  = svar.newzodiaclevel  + 1
   SendNewZodiacInfo(sysarg)
   Actor.collectOperate(sysarg,0)
   local pack = DataPack.allocPacket(sysarg,151,46)
   DataPack.flush(pack)
end
GetFirstRechargeGiftEx=function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.ShouChongEx == nil then 
		var.ShouChongEx={}
	end	
	
	--处理数据类型报错的
	if type(var.ShouChongEx)=="number" then 
		var.ShouChongEx=nil
		var.ShouChongEx={}
	end
	
	if var.ShouChongEx[1] == nil then 
		var.ShouChongEx[1]=0
	end	
	
	--暂时只加1档
	local npack = DataPack.allocPacket(sysarg,151,43) 
	if var.ShouChongEx[1]==0 then
		DataPack.writeByte(npack,0)
	else 
		DataPack.writeByte(npack,1)
	end
	DataPack.flush(npack)  
end
OnTakeFirstRechargeGiftEx=function(sysarg)
	local var = Actor.getStaticVar( sysarg )

	if var.ShouChongEx == nil then 
		var.ShouChongEx={}
	end	
	if var.ShouChongEx[1] == nil then 
		var.ShouChongEx[1]=0
	end	
	
	if var.ShouChongEx[1]==1 then 
		Actor.sendTipmsg( sysarg,"不能重复领取",ttFlyTip )
		return 
	end
	
	--首冲二挡改放在开服活动里面，过了就不能领取
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay>7 then 
		return 
	end
	
	local cfg = ActivityGiftConfig.ShouChongEx[1]
	
	--判断金钱是否达到9900
	local curPoint = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_POINT) --这个就是总元宝数量，用作计算vip值的，是最准确的
	if curPoint <cfg.money then 
		Actor.sendTipmsg( sysarg,"充值元宝不足"..cfg.money..",不能领取",ttFlyTip )
		return 
	end
	
	
	if not Awards.CheckBagGridCount(sysarg,cfg.reward) then
		return	
	end
	
	Awards.Give(sysarg,cfg.reward,996,"领取首充二挡")
	
	
	var.ShouChongEx[1]=1
	GetFirstRechargeGiftEx(sysarg)
	
	local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local ActorName = Actor.getName(sysarg)
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	
	System.sendCommonLog(1013,ActorId,ActorName,nLevel,0,0,"领取首充二挡","","")

	--System.broadcastTipmsg(string.format(Lang.ScriptTips.zf254,Actor.getName(sysarg)),2048+2)
	--
	--System.broadcastTipmsg(string.format(Lang.ScriptTips.zf254..",<我要领取/@@showWin,34>",Actor.getName(sysarg)),ttChatWindow)
end

--爱奇艺vip登录
MiscexAiQiYiVIPLogin = function(sysarg, msgid, packet)
   local nIndex =DataPack.readByte(packet)
   if nIndex==1 then 
	  Actor.setTopTitle(sysarg, 48, true)
   end
end

MiscexGuildFlagUpLevel = function(sysarg,msgid,packet)
    local nGuildId = Actor.getGuildId(sysarg)
    if nGuildId <= 0 then
        Actor.sendTipmsg(sysarg,"无行会,无法提升!",ttFlyTip)
        return
    end
    --判断是否是帮主
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if nActorId ~= Guild.getGuildLeaderId(nGuildId) then
        if Actor.getName(sysarg) ~= Guild.getGuildBackboneName(nGuildId,5) then
             Actor.sendTipmsg(sysarg,"您不是会长/副会长,无权利升级！",ttFlyTip)
            return
        end

    end
    local nLevel = Guild.getFlagLevel(nGuildId) + 1
    if nLevel > #GuildFlagConfig then
        Actor.sendTipmsg(sysarg,"旗帜已满级，无法继续升级!",ttFlyTip)
        return
    end
    local cfg = GuildFlagConfig[nLevel]
    if Guild.getGuildLevel(nGuildId) < cfg.NeedGuildLevel then
        Actor.sendTipmsg(sysarg,"行会等级小于"..cfg.NeedGuildLevel.."无法继续升级!",ttFlyTip)
        return
    end
    if Guild.getFlagExp(nGuildId) < cfg.NeedExp then
        Actor.sendTipmsg(sysarg,"行会经验小于"..cfg.NeedExp.."无法继续升级!",ttFlyTip)
        return
    end
    local nExp = Guild.getFlagExp(nGuildId) - cfg.NeedExp

    Guild.setFlagExp(nGuildId,nExp)
    Guild.setFlagLevel(nGuildId,nLevel)
    Actor.sendTipmsg(sysarg,string.format("行会旗帜升级至%d阶%d星！",nLevel / 10 + 1,nLevel % 10),ttFlyTip)
    System.sendCommonLog(LogIds.guildflaguplevel,nActorId,Actor.getName(sysarg),nLevel,nExp,0,Guild.getGuildName(nGuildId),"","")
   -- local szStr= string.format("经所有人的努力，会长%s成功升级了战旗，行会旗帜成功升至%d阶%d星，行会全部成员属性大涨！ ",Actor.getName(sysarg),nLevel / 10 + 1,nLevel % 10)
   -- Guild.broadcastTipmsg(nGuildId,szStr,ttChatWindow)
    --Guild.sendChat(nGuildId,szStr,false)
    local szStr = string.format("经所有成员的努力,%s行会会长<(n%s)>将战旗成功升至%d阶%d星,所有行会成员属性暴涨！每日做行会除魔可获得大量战旗值与灵力值.",Actor.getGuildName(sysarg),Actor.getName(sysarg),nLevel / 10 + 1,nLevel % 10);
    System.broadcastTipmsg(szStr,ttChatWindow)
end

--是否在远古战场的活动时间内
IsInYuanGuZhanChangTime = function(sysarg,msgid,packet)

	local svar = System.getDyanmicVar()
    if svar.yuanGuZhanChangTime == nil then 
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sYuanGuZhanChangStart)
		DataPack.writeByte(pack,0) --开启
		DataPack.flush(pack)
		--print("0000")
	else 
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sYuanGuZhanChangStart)
		DataPack.writeByte(pack,1) --开启
		DataPack.flush(pack)
		--print("1111")
	end
	

    local svar = System.getDyanmicVar()
    if svar.yuanGuZhanChangguildTime == nil then 
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sCrossGuildState)
		DataPack.writeByte(pack,0) --开启
		DataPack.flush(pack)
		--print("0000")
	else 
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sCrossGuildState)
		DataPack.writeByte(pack,1) --开启
		DataPack.flush(pack)
		--print("1111")
	end
end

--请求成就杀怪
MiscAskAchieveKillBoss = function(sysarg)

	local var = Actor.getStaticVar( sysarg )
	if var.killMonsterNum==nil then var.killMonsterNum=0 end
	if var.killBossN==nil then var.killBossN=0 end
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sAskAchieveKillBoss)
	DataPack.writeUint64(pack,var.killMonsterNum)  --怪物
	DataPack.writeUint64(pack,var.killBossN) 	--boss
	DataPack.flush(pack)
end


--请求花的数量
MiscGetFlowerCount =function(sysarg,msgid,packet)
	local var = Actor.getStaticVar( sysarg )
	if var.giveFlower ==nil then 
		var.giveFlower =0
	end
	local giveFlowerCount = var.giveFlower
	if var.giveFlower >=1000 then 
		giveFlowerCount =1000
	end
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGetFlowerCount)
	DataPack.writeInt(pack,giveFlowerCount)  
	DataPack.flush(pack)		
end

function MiscExGetRedPacketInfo(sysarg,msgid,packet)
    SendRedPacketLog(sysarg)
    SendRedPacketInfo(sysarg)

end

function MiscExRobRedPacket(sysarg,msgid,packet)
    HandRobRedPaclet(sysarg)
end

function MiscExSendRedPacket(sysarg,msgid,packet)
    HandSendRedPacket(sysarg,DataPack.readUInt(packet))
end

function MiscExGetSuperLuckStarInfo(sysarg,msgid,packet)
    if SuperLuckStarDisabled then
        local info = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGetSuperLuckStarInfo)
        DataPack.writeUInt(info,0)
        DataPack.writeWord(info,0)
        for i = 1,#SuperLuckStarCfg.Level do
            DataPack.writeByte(info,0)
            DataPack.writeByte(info,0)
        end
        DataPack.flush(info)
        local log = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSuperLuckStarLogInfo)
        DataPack.writeByte(log,0)
        DataPack.flush(log)
        return
    end
    HandSendSuperStarPlayerInfo(sysarg)
    HandSendSuperLuckStarLogInfo(sysarg)
end

function MiscExDrawSuperLuckStarInfo(sysarg,msgid,packet)
    if SuperLuckStarDisabled then
        Actor.sendTipmsg(sysarg,"超级幸运星活动已关闭",ttFlyTip)
        local result = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sDrawSuperLuckStarInfo)
        DataPack.writeByte(result,0)
        DataPack.flush(result)
        return
    end
    HandSuperLuckStarLuckDraw(sysarg)
end

function MiscExGiveSuperLuckStar(sysarg,msgid,packet)
    if SuperLuckStarDisabled then return end
    HandSuperLuckStarGive(sysarg)

end

function MiscExUpdateLevLegendEquip(sysarg,msgid,packet)
    handleUpLegendEquip(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
end


function MiscExInitPlayerGodWeaponInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.godweapon == nil then 
        var.godweapon = {} 
        for i = 1,#GodWeaponCfg do
            var.godweapon[i] = {}
            var.godweapon[i].active = 0
            var.godweapon[i].level = {}
            var.godweapon[i].ex = 0 --扩展等级
            for j = 1,4 do  --人,神,鬼,魔
                var.godweapon[i].level[j] = 0
            end
        end
    end


end

function MiscExHappyBirthday(sysarg,msgid,packet)
    local szName = DataPack.readString(packet)
    local nItemId =6676
    if Actor.getItemCount(sysarg,nItemId) <= 0 then
        Actor.sendTipmsg(sysarg,"生日烟花不足!",ttFlyTip)
        return
    end
    local ptr = Actor.getActorByName(szName)
    if ptr == nil then
        Actor.sendTipmsg(sysarg,"玩家离线或者不存在!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg,nItemId,1,0,0,0,"生日烟花",LogIds.HappyBirthday)
    local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	for k, plyPtr in ipairs(playerList or {}) do
		if plyPtr then 
			local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sBroadDiffEffect)
            DataPack.writeByte(netPack,2)
			DataPack.flush(netPack)
		end 
	end
    local nLocalServerId = System.getLocalServerId()
    local str ="热烈庆祝<(c0xFF00c0ff)%d区>大神<%s>生日快乐！愿您生活更加美好,散人传说有你更精彩！"
    System.SendPlatformMsg(string.format(str, nLocalServerId,szName), ttMousePosTip)
end

function MiscExUpdateGodWeaponEx(sysarg,msgid,packet)
     MiscExInitPlayerGodWeaponInfo(sysarg)
     local nIndex = DataPack.readByte(packet)
     if nIndex < 1 or  nIndex > #GodWeaponCfg  then
        Actor.sendTipmsg(sysarg,"索引错误!",ttFlyTip)
        return
     end
     local var = Actor.getStaticVar(sysarg)
     if var.godweapon[nIndex].active ~= 1 then 
         Actor.sendTipmsg(sysarg,"请先激活神兵再升级!",ttFlyTip)
         return
     end
     if var.godweapon[nIndex].ex == nil then var.godweapon[nIndex].ex = 0 end
     if  var.godweapon[nIndex].ex >= #GodWeaponCfg[nIndex].level then
        Actor.sendTipmsg(sysarg,"已满级,无法继续升级!",ttFlyTip)
        return
     end
     local cfg = GodWeaponCfg[nIndex].level[var.godweapon[nIndex].ex + 1]
     --检查消耗的道具
     if Actor.getItemCount(sysarg,cfg.consume.itemid) < cfg.consume.count then
        Actor.sendTipmsg(sysarg,"材料不足!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg, cfg.consume.itemid, cfg.consume.count, -1, -1, -1, "神兵升级扩展idx:"..nIndex.."lv:"..var.godweapon[nIndex].ex + 1,LogIds.godweaponupdateEx) 
    var.godweapon[nIndex].ex = var.godweapon[nIndex].ex + 1
    Actor.collectOperate(sysarg,0)

    MiscExGetGodWeaponInfo(sysarg,nil,nil)
    Actor.sendTipmsg(sysarg,"升级成功!",ttFlyTip)
    if var.godweapon[nIndex].ex % 5 == 0 then
         local str = "<(n%s)>玩家将神兵-%s升至%d级，战力暴涨！<我也要升/@@showWin,200,1>"
        System.broadcastTipmsg(string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(GodWeaponCfg[nIndex].itemId), var.godweapon[nIndex].ex),ttChatWindow)
    end
end
function MiscExUpdateGodWeapon(sysarg,msgid,packet)
    MiscExInitPlayerGodWeaponInfo(sysarg)
    local nIndex = DataPack.readByte(packet)
    local nLevel = DataPack.readByte(packet)

    local var = Actor.getStaticVar(sysarg)
    if nIndex < 1 or nLevel < 1 or nIndex > #GodWeaponCfg or nLevel > 4 then
        Actor.sendTipmsg(sysarg,"索引错误!",ttFlyTip)
        return
    end
    if  var.godweapon[nIndex].level[nLevel] == 1 then
        Actor.sendTipmsg(sysarg,"已经激活,无需再次激活!",ttFlyTip)
        return
    end
    local cfg = GodWeaponCfg[nIndex].levelattr[nLevel]
    if cfg == nil then return end
    if Actor.getItemCount(sysarg,cfg.active.itemid) < cfg.active.count then
        Actor.sendTipmsg(sysarg,"材料不足!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg, cfg.active.itemid, cfg.active.count, -1, -1, -1, "神兵升级idx:"..nIndex.."lv:"..nLevel,LogIds.godweaponupdate) 

   
    var.godweapon[nIndex].level[nLevel] = 1
    Actor.collectOperate(sysarg,0)

    MiscExGetGodWeaponInfo(sysarg,nil,nil)
end
function MiscExActiveGodWeapon(sysarg,msgid,packet)
    MiscExInitPlayerGodWeaponInfo(sysarg)
    local nIndex = DataPack.readByte(packet)
    
    if nIndex < 1 or nIndex > #GodWeaponCfg  then
        Actor.sendTipmsg(sysarg,"索引错误!",ttFlyTip)
        return
    end
    local var = Actor.getStaticVar(sysarg)

    for i =1,4 do
        if var.godweapon[nIndex].level[i] == 0 then
            Actor.sendTipmsg(sysarg,"激活失败!",ttFlyTip)
            return
        end
    end
    if var.godweapon[nIndex].active == 1 then return end
    var.godweapon[nIndex].active = 1
    Actor.collectOperate(sysarg,0)
    MiscExGetGodWeaponInfo(sysarg,nil,nil)
    Actor.sendTipmsg(sysarg,"激活成功!",ttFlyTip)
    local str = "<(n%s)>玩家激活了神兵-%s,神兵附体获得大量属性.<我也要激活/@@showWin,200,1>"
    System.broadcastTipmsg(string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(GodWeaponCfg[nIndex].itemId)),ttChatWindow)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.acvitegodweapon,nActorId,Actor.getName(sysarg),nIndex,0,0,GodWeaponCfg[nIndex].name)
end

function MiscExGetGodWeaponInfo(sysarg,msgid,packet)
   MiscExInitPlayerGodWeaponInfo(sysarg)  
   local var = Actor.getStaticVar(sysarg)
   local pack = DataPack.allocPacket(sysarg,151,66)
   DataPack.writeByte(pack,#GodWeaponCfg)
   for i = 1,#GodWeaponCfg do
      DataPack.writeByte(pack,var.godweapon[i].active) 
      for j=1,4 do
        DataPack.writeByte(pack,var.godweapon[i].level[j]) 
      end 
      if var.godweapon[i].ex == nil then var.godweapon[i].ex = 0 end
      DataPack.writeByte(pack,var.godweapon[i].ex) 
   end
   DataPack.flush(pack)
end
--离线奖励
MiscExOffLineAwardInfo  =function(sysarg,msgid,packet)
	local var = Actor.getStaticVar( sysarg )
	local topTime = 259200
	if var.allOffLineTime ==nil then 	
		var.allOffLineTime=0
	elseif var.allOffLineTime>topTime then 
		var.allOffLineTime = topTime
	end
	
	local nIndex =DataPack.readByte(packet)
	if nIndex==1 then 
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOffLineAward)
		DataPack.writeInt(pack,var.allOffLineTime)  
		DataPack.flush(pack)	
	elseif nIndex==2 then 
		if var.allOffLineTime<60 then 
			Actor.sendTipmsg(sysarg,"离线时间小于1分钟",ttFlyTip)
			return 
		end
		local addExpValue = 120000*math.floor(var.allOffLineTime/60)
		
		local types = DataPack.readByte(packet)
		if types==1 then 
			Actor.addExp( sysarg, addExpValue, LogIds.offLineAwardExp, 0)
			var.allOffLineTime=0
		elseif types==2 then
			local needYb = addExpValue*5/10000000*100
			if needYb>Actor.getMoneyCount(sysarg,mtYuanbao) then 
				Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
				return 
			end 
		
			Actor.changeMoney(sysarg,mtYuanbao,-needYb,LogIds.offLineAwardExp,"离线奖励经验")
			Actor.addExp( sysarg, addExpValue*5, LogIds.offLineAwardExp, 0)
			var.allOffLineTime=0
		elseif types==3 then
			local needYb = addExpValue*10/10000000*100
			if needYb>Actor.getMoneyCount(sysarg,mtYuanbao) then 
				Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
				return 
			end 
			
			Actor.changeMoney(sysarg,mtYuanbao,-needYb,LogIds.offLineAwardExp,"离线奖励经验")
			Actor.addExp( sysarg, addExpValue*10, LogIds.offLineAwardExp, 0)
			var.allOffLineTime=0
		end
		
		local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOffLineAward)
		DataPack.writeInt(pack,var.allOffLineTime)  
		DataPack.flush(pack)	
	end
end


--开服活动首杀boss
MiscOpenSeverFirstKill =function(sysarg,msgid,packet)	
	local nType = DataPack.readByte(packet)
    local var = Actor.getStaticVar(sysarg)
	local Cfg2 = OpenServerAward[11].list
		--nType=0
    if nType == 0 then	--请求全部数据
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverFirstKill)
		DataPack.writeByte(netPack, 0)
		for index,v in pairs(Cfg2) do 
			
			local sysVar = System.getStaticVar()
			if sysVar.OpenSeverFirstKill ==nil then 
				sysVar.OpenSeverFirstKill = {}
			end
			if sysVar.OpenSeverFirstKill[index]==nil then  --还没被杀
				DataPack.writeString(netPack, "")
				--print("空")
			else
				DataPack.writeString(netPack, sysVar.OpenSeverFirstKill[index])
				--print(sysVar.OpenSeverFirstKill[index])
			end
			
			--是否可领取
			if var.OSFirstKill==nil then 
				DataPack.writeByte(netPack, 0)
				--print("0")
			else 
				if var.OSFirstKill[index]==nil then 
					DataPack.writeByte(netPack, 0)
						--print("0")
				else 
					DataPack.writeByte(netPack, var.OSFirstKill[index])
						--print(var.OSFirstKill[index])
				end
			end
		end
		DataPack.flush(netPack)
		
	elseif nType == 1 then --领取奖励
		local index = DataPack.readByte(packet)
		--index=4
		if (index<1 or index >#Cfg2)==false then
			--local bossId = Cfg2[index].bossId
			if var.OSFirstKill==nil then 
				Actor.sendTipmsg(sysarg,"没有权利领取",ttFlyTip)
				return 
			else 
				if var.OSFirstKill[index]==nil then 
					Actor.sendTipmsg(sysarg,"没有权利领取",ttFlyTip)
					return 
				else 
					if var.OSFirstKill[index]==2 then 
						Actor.sendTipmsg(sysarg,"已经领取了",ttFlyTip)
						return 
					else 
						if not Awards.CheckBagGridCount(sysarg,Cfg2[index].award) then
							return 
						end
						
						var.OSFirstKill[index] = 2
						
						Awards.Give(sysarg,Cfg2[index].award,GameLog.cOpenServerAward,"开服活动首杀"..index)
						
						--告诉前端领取成功
						local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverFirstKill)
						DataPack.writeByte(netPack, 1)
						DataPack.flush(netPack)
					end
				end
			end
		end
	end
end
MiscBossSlotUpLevel = function(sysarg,msgid,packet)
    bossRuneSlotUpLevel(sysarg,packet)

end
HandleSkyRingOper = function(sysarg,msgid,packet)
    SkyRingOpear(sysarg,packet)
end
MiscBossSlotExChange = function(sysarg,msgid,packet)

    bossRuneExchangeEx(sysarg,packet)
end


HandleTianJiangHongLiOper = function (sysarg,msgid,packet)
    

    local function SendInfo(sysarg)
        local var = Actor.getStaticVar(sysarg)
	    if var.TJHL_index == nil then
            var.TJHL_index = 0
        end
	    local netPack = DataPack.allocPacket(sysarg, 151, 98)
	    DataPack.writeByte(netPack,1)
        DataPack.writeByte(netPack,var.TJHL_index)
	    DataPack.flush(netPack)

    end
    local bType = DataPack.readByte(packet)
     
    if bType == 1 then
         SendInfo(sysarg)

    elseif bType == 2 then


        local var = Actor.getStaticVar(sysarg)
		if var.TJHL_index == nil then
            var.TJHL_index = 0
        end
        local index = DataPack.readByte(packet) --第几个红包

       if var.TJHL_index >= index or var.TJHL_index >= #SkyDropBonusCfg then 
			Actor.sendTipmsg(sysarg,"已经领取该红利了，不能再领", ttFlyTip) 
			return 
		end
		
		if var.TJHL_index+1 < index then 	
			Actor.sendTipmsg(sysarg,"请把上一档领取了，再领这一档", ttFlyTip) 
			return 
		end
       
        local cfg = SkyDropBonusCfg[var.TJHL_index + 1]
        local nPower = Actor.getIntProperty(sysarg,PROP_ACTOR_BATTLE_POWER)
        if nPower < cfg.batter then
            Actor.sendTipmsg(sysarg,"战力不足,无法领取", ttFlyTip) 
			return 
        end
        if not Awards.CheckBagGridCount(sysarg, cfg.award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取", ttFlyTip) 
				return
		end

	if cfg.needYB > 0 then
        	if Actor.changeMoney(sysarg,3,-cfg.needYB,LogIds.tianjianghongli, "天降红利"..index)==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
			return 
		end
	end


        Awards.Give(sysarg, cfg.award, LogIds.tianjianghongli, "天降红利"..index)
		System.broadcastTipmsg(string.format("<(n%s)>玩家领取了天降红利，获得大量奖励.",Actor.getName(sysarg)), ttChatWindow)
        var.TJHL_index = var.TJHL_index  +1
		SendInfo(sysarg)
        local netPack = DataPack.allocPacket(sysarg, 151, 98)
	    DataPack.writeByte(netPack,2)
        DataPack.flush(netPack)
    end

end
--开服活动累计充值
MiscOpenSeverContinuePay =function(sysarg,msgid,packet)	

	local openSeverDay = System.getDaysSinceOpenServer()
	if openSeverDay<1 and openSeverDay>7 then 	
		return 
	end
	
	local nType = DataPack.readByte(packet)
    local var = Actor.getStaticVar(sysarg)
	local Cfg2 = OpenServerAward[12].list
		--nType=1
    if nType == 0 then	--充值数据
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverContinuePay)
		DataPack.writeByte(netPack, 0)
		
		if var.OScontinuePay==nil then 
			var.OScontinuePay={}
		end
		for i=1,7 do 
			if var.OScontinuePay[i]==nil then 
				DataPack.writeInt(netPack, 0)
				--print("充钱:0")
			else 
				DataPack.writeInt(netPack, var.OScontinuePay[i])
				--print("充钱:"..var.OScontinuePay[i])
			end
		end
		DataPack.flush(netPack)
	elseif  nType ==1 then --领取奖励
		local x = DataPack.readByte(packet) --领取第几档
		local y = DataPack.readByte(packet) --领取第几个
		
		--x=1
		--y=2
		
		if x<1 or x>#Cfg2.PayRMB then 
			return 
		end
		if y<1 or x>#Cfg2.totalDays then 
			return 
		end
		
		--是否满足领取条件
		if var.OScontinuePay==nil then 
			var.OScontinuePay={}
			Actor.sendTipmsg(sysarg,"条件不满足",ttFlyTip)
			return 
		end
		local needYb = Cfg2.PayRMB[x].needPayYb
		local needCount = Cfg2.totalDays[y]
		local count = 0
		--需要大于xxx元宝的有n个
		for i=1,7 do 
			if var.OScontinuePay[i]==nil then 
				
			else 
				if var.OScontinuePay[i]>=needYb then  
					count = count + 1
				end
			end
		end
		
		if count<needCount then  
			Actor.sendTipmsg(sysarg,"条件不满足",ttFlyTip)
			return 
		end
		
		--是否足够位置
		
		if not Awards.CheckBagGridCount(sysarg,Cfg2.PayRMB[x].award[y]) then
			return 
		end
		
		--是否已经领取过
		if var.GetcontinuePay==nil then 
			var.GetcontinuePay={}
		end
		
		if var.GetcontinuePay[x]==nil then 
			var.GetcontinuePay[x] ={}
		end
		
		if var.GetcontinuePay[x][y]~=nil and var.GetcontinuePay[x][y]==1 then 
			Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
			return 
		end
		
		var.GetcontinuePay[x][y]=1
		
		Awards.Give(sysarg,Cfg2.PayRMB[x].award[y],GameLog.cOpenServerAward,"累计充值"..x..","..y)
	   
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverContinuePay)
		DataPack.writeByte(netPack, 1)	 --领取成功	
		DataPack.flush(netPack)
		
	elseif nType ==2 then --个人领取数据
		if var.GetcontinuePay==nil then 
			var.GetcontinuePay={}
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverContinuePay)
		DataPack.writeByte(netPack, 2)
		
		for i=1,#Cfg2.PayRMB do --将8个是否领取全部下发
			if var.GetcontinuePay[i]==nil then 
				var.GetcontinuePay[i]={}
			end
			
			for j=1,#Cfg2.totalDays do 
				if var.GetcontinuePay[i][j]==nil then 
					DataPack.writeByte(netPack, 0)
					--print("是否领取:0")
				else 
					DataPack.writeByte(netPack, var.GetcontinuePay[i][j])
					--print("是否领取:"..var.GetcontinuePay[i][j])
				end
			end
		end
		
		DataPack.flush(netPack)
	end
end

function getOpenSeverReturnCheckVar(sysarg,x)
	local var = Actor.getStaticVar(sysarg)
	if x==1 then 
		return var.OpenSeverReturnMaterial1
	elseif x==2 then 
		return var.OpenSeverReturnMaterial2
	elseif x==3 then 
		return var.OpenSeverReturnMaterial3
	elseif x==4 then 
		return var.OpenSeverReturnMaterial4
	elseif x==5 then
		return var.OpenSeverReturnMaterial5
	elseif x==6 then 
		return var.OpenSeverReturnMaterial6
	end
	return nil
end


function MiscGetSingleRankAward(sysarg,msgid,packet)
    local dayofMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
    local nYear,nMonth,nDay = System.getDate(0,0,0)
    local nHour,nMin,nSec = System.getTime(0,0,0)
    if System.isCrossServer() == true then 
        System.trace("MiscGetSingleRankAward"..Actor.getName(sysarg))
        return 
    
     end
    if nDay ~= dayofMonth[nMonth] then
        Actor.sendTipmsg(sysarg,"赛季结束当天才能领取奖励！",ttFlyTip)
        return
    end     
    if nHour < 12 then
        Actor.sendTipmsg(sysarg,"参与奖励的领取时间为月末当天12点-24点！",ttFlyTip)
        
         return
    end
    
    local var = Actor.getStaticVar(sysarg)
    if var.singlemonthcount == nil then var.singlemonthcount = 0 end
    if var.singlegive == 1 then
        Actor.sendTipmsg(sysarg,"当月奖励已领取！",ttFlyTip)
        
        return
    end
    if var.singlemonthcount < 20 then
        Actor.sendTipmsg(sysarg,"当月参与竞技场次不足20次,领取失败!",ttFlyTip)
        return
    end
    if Awards.CheckBagGridCount(sysarg,PersonalSeasonAward[9]) then
		Awards.Give(sysarg,PersonalSeasonAward[9],LogIds.SingRank,"个人竞技参与")
        var.singlemonthcount = 0
         Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
         var.singlegive = 1
	else 
        Actor.sendTipmsg(sysarg,"包裹空间不足,请清理包裹后再领取!",ttFlyTip)
	end
end
MisOpenServerReturnAndTreasureStore  =function(sysarg,msgid,packet)	
	local openSeverDay = System.getDaysSinceOpenServer()
	if openSeverDay<1 and openSeverDay>7 then 	
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	  
	local nType = DataPack.readByte(packet)

	if nType==1 then --材料返利

		local x =DataPack.readByte(packet)
		if x <1 or x >#OpenServerAward[13].list then return end 

		local y = DataPack.readByte(packet)
		if y <1 or y >#OpenServerAward[13].list[x] then return end 

		local cfg = OpenServerAward[13].list[x][y]
				
		--已经领取了吗
		if var.openServerMaterialFlag ~=nil and var.openServerMaterialFlag[x]~=nil and var.openServerMaterialFlag[x][y]~=nil and var.openServerMaterialFlag[x][y]==1 then 
			Actor.sendTipmsg(sysarg,"已经领取过了",ttFlyTip)
			return 
		end

		--是否符合条件
		local checkVar = getOpenSeverReturnCheckVar(sysarg,x)

		if checkVar==nil or checkVar<cfg.needValue then
			Actor.sendTipmsg(sysarg,"不符合领取条件",ttFlyTip)
			return 
		end

		--改变状态	
		if var.openServerMaterialFlag ==nil then 
			var.openServerMaterialFlag={}
		end

		if var.openServerMaterialFlag[x] ==nil then
			var.openServerMaterialFlag[x]={}
		end
		var.openServerMaterialFlag[x][y] =1
	
		--给奖励
		local name = "护符碎片"
		local nowValue =0
		if x==1 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_SOUL)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_SOUL,nowValue+cfg.giveValue) --护符
			name = "护符碎片"
		elseif x==2 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT,nowValue+cfg.giveValue) --护盾
			name = "护盾碎片"
		elseif x==3 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_GEM_CRYSTAL)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_GEM_CRYSTAL,nowValue+cfg.giveValue) --宝石
			name = "宝石结晶"
		elseif x==4 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP,nowValue+cfg.giveValue) --圣珠
			name = "圣珠碎片"
		elseif x==5 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_RING_CRYSTAL)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_RING_CRYSTAL,nowValue+cfg.giveValue) --特戒
			name = "特戒碎片"
		elseif x==6 then 
			nowValue = Actor.getUIntProperty(sysarg, PROP_ACTOR_PET_SPIRIT)
			Actor.setUIntProperty(sysarg, PROP_ACTOR_PET_SPIRIT,nowValue+cfg.giveValue) --战将灵力丹
			name = "灵力值"
		end
		SendRetrunMInfo(sysarg,1)
		
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", cfg.giveValue, name), 1+ttFlyTip);
		
		
		System.sendCommonLog(LogIds.openServerMaterialReturn,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,nowValue,nowValue+cfg.giveValue, "","",name.."返利","","")
		
	
	elseif nType==2 then --珍宝商店
		local index =DataPack.readByte(packet)
		local cfg = OpenServerAward[14].list[openSeverDay][index]
		if cfg ==nil then 
			return 
		end 
		
		local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
		if myVipLevel<cfg.vipLevel then 
			Actor.sendTipmsg(sysarg,"vip等级不够",ttFlyTip)
			return 
		end

		if var.newdays.openSevrerStore==nil then 
			var.newdays.openSevrerStore={}
		end

		if var.newdays.openSevrerStore[index]~=nil and var.newdays.openSevrerStore[index]>=cfg.times then 
			Actor.sendTipmsg(sysarg,"没有了剩余次数",ttFlyTip)
			return 
		end

		if Actor.getMoneyCount(sysarg,cfg.moneyType)<cfg.needMoneyValue then 
			Actor.sendTipmsg(sysarg,"所需金钱不足",ttFlyTip)
			return 
		end

		--背包不足
		if not Awards.CheckBagGridCount(sysarg, cfg.award) then
			return 
		end

		--给奖励
		if Actor.changeMoney( sysarg, cfg.moneyType, -cfg.needMoneyValue, GameLog.cOpenServerAward, "购买开服珍品") then
			Awards.Give(sysarg, cfg.award, GameLog.cOpenServerAward,"购买开服珍品")
			if var.newdays.openSevrerStore[index]==nil then 
				var.newdays.openSevrerStore[index]=1
			else
				var.newdays.openSevrerStore[index] = var.newdays.openSevrerStore[index] +1
			end
			
			SendRetrunMInfo(sysarg,2)
		end
	
		
	elseif  nType==0 then --请求信息
		SendRetrunMInfo(sysarg,DataPack.readByte(packet))
	end
end

--发送信息
SendRetrunMInfo = function(sysarg,types)
	types =tonumber(types)		
	local openSeverDay = System.getDaysSinceOpenServer()
	if openSeverDay <= 0 or openSeverDay > 7 then return end
		
	local var = Actor.getStaticVar(sysarg)
	
	if types ==1 then 
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenServerReturnAndTreasureStore)
		DataPack.writeByte(netPack,1)
		for i=1,#OpenServerAward[13].list do 
			local checkVar = getOpenSeverReturnCheckVar(sysarg,i)
			if checkVar==nil then 
				DataPack.writeUInt(netPack,0)
				--print("checkVar=0")
			else 
				DataPack.writeUInt(netPack,checkVar)
				--print("checkVar="..checkVar)
			end
		end
		
		for i=1,#OpenServerAward[13].list do 
			for j=1,#OpenServerAward[13].list[i] do 
				if var.openServerMaterialFlag ~=nil and var.openServerMaterialFlag[i]~=nil and var.openServerMaterialFlag[i][j]~=nil and var.openServerMaterialFlag[i][j]==1 then 
					DataPack.writeByte(netPack,1)
				else
					DataPack.writeByte(netPack,0)
				end
			end
		end
		DataPack.flush(netPack)
		
	elseif types ==2 then 
		
		local cfg = OpenServerAward[14]
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenServerReturnAndTreasureStore)
		DataPack.writeByte(netPack,2)
		if var.newdays.openSevrerStore ==nil then 
			for i=1,#cfg.list[openSeverDay] do 
				DataPack.writeByte(netPack,0)
				--print("var.newdays.openSevrerStore[i]=0")
			end
			DataPack.flush(netPack)
			return 
		end
		
		for i=1,#cfg.list[openSeverDay] do 
			if  var.newdays.openSevrerStore[i] ==nil then 
				DataPack.writeByte(netPack,0)
				--print("var.newdays.openSevrerStore[i]=0")
			else 
				DataPack.writeByte(netPack,var.newdays.openSevrerStore[i])
				--print("var.newdays.openSevrerStore[i]="..var.newdays.openSevrerStore[i])
			end
		end
		DataPack.flush(netPack)
	end
end

MiscYCTG_yijianwancheng =function(sysarg)

	local var = Actor.getStaticVar(sysarg) 
	if var.TGtopLayer==nil then 
		var.TGtopLayer=0
	end

	--判断是否满足
	if IsSpeciaTitleVip(sysarg,3) == false then 
		--给出不是特权的弹窗
		local ensureStr = string.format("%s/sure_tequanYZCG", "开启特权")
		local cancelStr = string.format("%s/cancle_tequanYZCG", "取消")
		Actor.messageBox(sysarg, 0, 0, "您未拥有黄金特权,请拥有特权之后再来", ensureStr, cancelStr, NULL)
		return 
	end
	
	if topLayer==0 then 
		Actor.sendTipmsg(sysarg,"至少通过一层再来扫荡", ttFlyTip)
		return 
	end
	

	if var.days.SYCGLayer~=nil and var.days.SYCGLayer~=1 then 
		Actor.sendTipmsg(sysarg,"次日再来扫荡", ttFlyTip)
		return 
	end
	
	var.SYCGLayer = var.TGtopLayer+1
	var.days.SYCGLayer = var.SYCGLayer
	var.days.IsHasEnterYCTG = 1
	
	--发邮件，给奖励
	
	local lishiTable = {}
	--如果这个数字没有随机出来
	for i=1,var.TGtopLayer do 
		local index = math.floor((i-1)/5)+1
		local cfg =YongChuangTianGuanCfg.award[index] 
		lishiTable[i] =1
		for j=1,#cfg do 
			local nRandNum = System.getRandomNumber(10000) + 1		--随机数
			if nRandNum<=cfg[j].rate then 
				lishiTable[i]=j
			end
		end
	end
	
	--随机库的index-----------------------------------------------------------------
	local giveNotNeedCount = {}
	local giveNeedCount ={}
	giveNeedCount[80] =0
	giveNeedCount[5363] =0
	giveNeedCount[5364] =0
	giveNeedCount[5365] =0
	for i=1,#lishiTable do 
		local index = math.floor((i-1)/5)+1
		local cfg =YongChuangTianGuanCfg.award[index] 
		table.insert(giveNotNeedCount,cfg[lishiTable[i]].giveAward[3])
		
		if cfg[lishiTable[i]].giveAward[1].id ==5363 then
			giveNeedCount[5363] =giveNeedCount[5363] +cfg[lishiTable[i]].giveAward[1].count
		elseif cfg[lishiTable[i]].giveAward[1].id ==5364 then
			giveNeedCount[5364] =giveNeedCount[5364] +cfg[lishiTable[i]].giveAward[1].count
		elseif cfg[lishiTable[i]].giveAward[1].id ==5365 then
			giveNeedCount[5365] =giveNeedCount[5365] +cfg[lishiTable[i]].giveAward[1].count
		end
		
		giveNeedCount[80] = giveNeedCount[80] + cfg[lishiTable[i]].giveAward[2].count
	end
	
	Awards.Give(sysarg, giveNotNeedCount, LogIds.YongChuangTianGuan, "一键勇闯天关")
	local str =""
	
	
	if giveNeedCount[5363]~=0 then
		str = str .."/5363,"..giveNeedCount[5363]..",1"
	end
	
	if giveNeedCount[5364]~=0 then
		str = str .."/5364,"..giveNeedCount[5364]..",1"
	end
	
	if giveNeedCount[5365]~=0 then
		str = str .."/5365,"..giveNeedCount[5365]..",1"
	end
	
	
	local split = math.floor(giveNeedCount[80]/200)
	local split_left = giveNeedCount[80]-split*200
	--print("split="..split)

	if split~=0 then 
		for i=1,split do 
			str = str.."/80,200,1"
		end
	end
	--print("split_left="..split_left)
	if split_left~=0 then 
		str = str.."/80,"..split_left..",1"
	end 
	
	
	System.AddMail(Actor.getIntProperty(sysarg,PROP_ENTITY_ID),6,0,"勇闯天关奖励","请及时领取!\\\\祝您游戏愉快!",0,0,str)

end

-- 熊猫林，前端要显示还剩余多少只怪
function sendClientXiongMaoLinMonsterCount(sysarg, sysid, packet)
	if Actor.getSceneId(sysarg) ~= 668 then -- 不在熊猫林中
		return
	end
	
	local hScene = Fuben.getSceneHandleById(668)
	local count = Fuben.getLiveMonsterCount(hScene, 0)	
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sXiongMaoLinMonsterCount)
	DataPack.writeInt(netPack, count)	
	DataPack.flush(netPack)
end



--通天塔鼓舞
function TongTianTaGuWu(sysarg,sysid,packet)


	if not (Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2] ) then  --才能使用这个buffs
		return 
	end
	
--buff组  210
--ID 
local buffTable = 
{
 {222,224}, --1级：
 {225,227}, --2级：
 {228,230}, --3级：
 {231,233}, --4级：
 {234,236}, --5级：
 {237,239}, --6级：
 {240,242}, --7级：
 {243,245}, --8级：
 {246,248}, --9级：
 {249,251}, --10级：
}

local buffTable2 = 
{
 {252,254}, --1级：
 {255,257}, --2级：
 {258,260}, --3级：
 {261,263}, --4级：
 {264,266}, --5级：
 {267,269}, --6级：
 {270,272}, --7级：
 {273,275}, --8级：
 {276,278}, --9级：
 {279,281}, --10级：
}

		
	--local nIndex = tonumber(sysid) --方便测试
	local nIndex = DataPack.readByte(packet)
	if nIndex == 1 then --金币鼓舞（绑金或者金币）
		
		
		--判断是否达到最够层了,现在到达了第几层
		local buffLayer =0
		local hasFind = 0
		for i=1,10 do 
			for j=buffTable[i][1],buffTable[i][2] do 
				if Actor.hasBuffById(sysarg,j) then 
					hasFind=1
					break
				end
			end
			if hasFind== 1 then 
				break
			end
			buffLayer = buffLayer + 1
		end
		--buffLayer为n 就有n+1层buff，为10没有buff
		if buffLayer== 10 then 
			buffLayer = 0 
		else 
			buffLayer = buffLayer+1
		end
			
		if buffLayer==10 then
			Actor.sendTipmsg(sysarg,"您的buff已经达到最高层，不能继续添加",ttFlyTip)
			return 
		end
	
	
		--直接扣钱，判断前是否够
		if Actor.changeMoney(sysarg,0,-300000,LogIds.TongTianTaLog, "通天鼓舞")==false then 
			if Actor.changeMoney(sysarg,1,-300000,LogIds.TongTianTaLog, "通天鼓舞")==false then
				Actor.sendTipmsg(sysarg, "金币/绑定金币不足", ttFlyTip)
				return 
			end
		end
		--给buff
		--print("buffLayer+1="..buffLayer+1)
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][1])
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][1]+1)
		Actor.addBuffById(sysarg, buffTable[buffLayer+1][2])
		
	elseif nIndex == 2 then --元宝鼓舞
		
		--判断是否达到最够层了,现在到达了第几层
		local buffLayer =0
		local hasFind = 0
		for i=1,10 do 
			for j=buffTable2[i][1],buffTable2[i][2] do 
				if Actor.hasBuffById(sysarg,j) then 
					hasFind=1
					break
				end
			end
			if hasFind== 1 then 
				break
			end
			buffLayer = buffLayer + 1
		end
		--buffLayer为n 就有n+1层buff，为10没有buff
		if buffLayer== 10 then 
			buffLayer = 0 
		else 
			buffLayer = buffLayer+1
		end
			
		if buffLayer==10 then
			Actor.sendTipmsg(sysarg,"您的buff已经达到最高层，不能继续添加",ttFlyTip)
			return 
		end
		
	
		if Actor.changeMoney(sysarg,3,-75,LogIds.TongTianTaLog, "天关鼓舞")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
			return 
		end
		
		--给buff
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][1])
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][1]+1)
		Actor.addBuffById(sysarg, buffTable2[buffLayer+1][2])

	end
end

MiscExImmortalSystemOper=function(sysarg, msgid, packet)
    local types = DataPack.readByte(packet)
	if types==0 then 
		GetImmortalSystemInfo(sysarg)
	elseif types ==1 then 
		 local nIndex = DataPack.readByte(packet)
       
        
         UpLevImmortalSystemInfo(sysarg,nIndex)
	end

end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetCliffordInfo, MiscExGetCliffordInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cCliffordInfo, MiscExCliffordInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetShenQiJingYanYu, MiscGetShenQiJingYanYu)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOpenTianShenHuTi, MiscOpenTianShenHuTi)

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cLeaseTitle,MiscExLeaseTitle) --称号租赁
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cWarEquipUplev,MiscExWarEquipUpLev) --战装升级

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetMapPlayerInfo,MiscExGetMapPlayerInfo) --获取地图内玩家信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cKuafuTuMoDian,MiscKuafuTuMoDian) --跨服屠魔点数
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cZiYuanXunHui,MisZiYuanXunHui) --资源找回
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cRingDamo,MiscExRingDamo)--特戒打磨
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetSportsTitleInfo,MiscExGetSportsTitleInfo)--获取竞技称号信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cUpSportsTitleLev,MiscExUpSportsTitleLev)


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTakeFirstChargeEx,TakeFirstRechargeGiftEx)--首冲扩展

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetNewZodiacInfo,MiscexGetNewZodiacInfo) --获取十二生肖信息

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cUplevNewZodiac,MiscexUplevNewZodiac) --激活/升级十二生肖信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cAiQiYiVIPLogin,MiscexAiQiYiVIPLogin) --爱奇艺vip登录
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGuildFlagUplevel,MiscexGuildFlagUpLevel) --行会旗帜升级
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cIsInYuanGuZhanChangTime,IsInYuanGuZhanChangTime) --是否在远古战场的活动时间内
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cAskAchieveKillBoss,MiscAskAchieveKillBoss) --是否在远古战场的活动时间内
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetFlowerCount,MiscGetFlowerCount) --请求花的数量
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cYuanshen, yuanshen_main) -- 元神系统
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cPalaceFighting, PalaceFighting_main) -- 皇宫大乱斗
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOffLineAward, MiscExOffLineAwardInfo)--离线奖励
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetRedPacketInfo,MiscExGetRedPacketInfo) --获取红包信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cRobRedPacket,MiscExRobRedPacket) -- 抢红包
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cSendRedPacket,MiscExSendRedPacket) --发红包
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetSuperLuckStarInfo,MiscExGetSuperLuckStarInfo) --获取超级幸运星信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cDrawSuperLuckStarInfo,MiscExDrawSuperLuckStarInfo) --超级幸运星抽奖
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGiveSuperLuckStar,MiscExGiveSuperLuckStar)--领取超级幸运星抽奖奖励
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cUpdateLevLegendEquip,MiscExUpdateLevLegendEquip)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetGodWeaponInfo,MiscExGetGodWeaponInfo) --获取神兵信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cActiveGodWeapon,MiscExActiveGodWeapon) --激活神兵
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cUpdateGodWeapon,MiscExUpdateGodWeapon) --升级神兵
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cUpdateGodWeaponEx,MiscExUpdateGodWeaponEx) --神兵升级扩展
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetOldPlayerReturnInfo,OldPlayerReturnGetInfo) --获取老兵回归标记信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGiveOldPlayerReturnInfo,OldPlayerReturnGiveAward) --获取老兵回归标记信息
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cHappyBirthday,MiscExHappyBirthday)  --生日烟花
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOpenSeverFirstKill,MiscOpenSeverFirstKill)  --开服活动首杀boss

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOpenSeverContinuePay,MiscOpenSeverContinuePay)  --开服活动累计充值
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOpenServerReturnAndTreasureStore,MisOpenServerReturnAndTreasureStore)  --开服活动首杀boss


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cYCTG_yijianwancheng,MiscYCTG_yijianwancheng)  --天关一键完成
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBossSlotUplevel,MiscBossSlotUpLevel) --boss符文槽升级
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBossSlotExchange,MiscBossSlotExChange) --符文兑换
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cFestivalActs, festival_acts_main)

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cDaJiDaLi_isOpen, handleDaJiDaLiIsOpen)  --大吉大利
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cDaJiDaLi_Acts, handleDaJiDaLi) --大吉大利是否开启

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cXiaoFeiZhuanPan, handXiaoFeiZhuanPanEx) --消费转盘
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGuildFubenBoss,MiscExGuildFubenBoss) --行会boss
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBlueVipOperat,BlueVipNetProcess)


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOneYearAct_isOpen, handleOneYearActIsOpen)  --周年活动是否开启
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cOneYearAct_Acts, handleOneYearAct) --周年活动

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGuardDragon, guard_dragon_main) -- 龙灵守护系统
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cFootPrint, foot_print_main) -- 足迹系统
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cIdentityCode,IdentifyCodeCheck)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetSingleRankAward,MiscGetSingleRankAward)

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cXiongMaoLinMonsterCount, sendClientXiongMaoLinMonsterCount) --获取熊猫林还剩余多少只怪

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cLongTengZhuanPan, LongTengZhuanPanMain)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cSkyRingOper, HandleSkyRingOper)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTianJiangHongLiOper,HandleTianJiangHongLiOper)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cSanRenHongLi_IsOpen, handleSanRenHongLiIsOpen)  --散人红利是都已经开启
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cSanRenHongLi, handleSanRenHongLi) --散人红利协议

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTongTianTa, TongTianTaGuWu) 
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cXianZhuangOper, MiscExImmortalSystemOper) 

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cXianGongZhuanPan, handXianGongZhuanPan) --仙宫转盘

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cJingJI_isOpen, handleJingJiOpen)  --竞技活动
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cJingJI_Acts, handleJingjiActivity) --竞技活动
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cJingJIZhuanPan, handJingjiZhuanPan) --竞技活动