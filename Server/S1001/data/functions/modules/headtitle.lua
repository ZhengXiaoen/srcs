--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\config\platforms\SouGouConfigs.lua" once
--#include "data\config\SportsTitleCfg.lua" once
--#include "data\config\modules\TitleHasTime.lua" once
--#include "data\functions\RedPacketFunc.lua"
--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\config\modules\TimeHasnotTime.lua" once

-- 称号

-- titleflags
-- 0: 壕 (单笔充值达到500000元宝)
-- 1: 一掷萬金 (开服5天内,累计消费达到100000元宝)
-- 2: 無翼伦比 (开服5天内, 翅膀进阶至7阶)
-- 3: 珠光宝气 (开服7天内, 圣珠装备提升至20阶)
-- 4: 铄石流金 (开服7天内,宝石装备提升至20阶)

function ht_get_titleflags(sysarg, flag, var)	
	if var == nil then
		var = Actor.getStaticVar(sysarg)
	end
	
	if var.titleflags == nil then return false end
	
	local f = System.getIntBit(var.titleflags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function ht_set_titleflags(sysarg, flag, true_or_no, var)
	if flag < 0 or flag > 31 then
		print("----error! ht_set_extflags flag="..flag)
		return
	end
	
	if var == nil then
		var = Actor.getStaticVar(sysarg)
	end
	
	local titleflags = var.titleflags
	if titleflags == nil then titleflags = 0 end
	
	titleflags = System.setIntBit(titleflags, flag, true_or_no)
	var.titleflags = titleflags
end


-- 下发称号数据
function send_headtitle_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sHeadTitleModule)
	DataPack.writeByte(netPack, 1)
	
	local svar = Actor.getStaticVar(sysarg)
	local titleflags = svar.titleflags
	if titleflags == nil then titleflags = 0 end
	DataPack.writeUInt(netPack, titleflags)
	
	-- 登陆天数
	local loginDays = Actor.getLoginDays(sysarg)
	DataPack.writeInt(netPack, loginDays)
	
	-- 探索宝藏累计消费达到多少元宝
	local dmkjYb = svar.dmkjYb
	DataPack.writeUInt(netPack, dmkjYb and dmkjYb or 0)
	
	-- 累计获得500000绑定元宝
	local _totalBindYb = svar._totalBindYb
	DataPack.writeUInt(netPack, _totalBindYb and _totalBindYb or 0)
	
	-- 阵营战(活动)中累计击杀达到1000人
	local campKillCount = svar.campKillCount
	DataPack.writeUInt(netPack, campKillCount and campKillCount or 0)
	
	-- 消耗元宝数
	DataPack.writeUInt(netPack, Actor.getConsumeYb(sysarg))	

	DataPack.flush(netPack)
end

-- 从 1 开始(1~32对应PROP_ACTOR_HEAD_TITLE,33开始为VIP称号), 0 为清除
function ht_has_head_title(sysarg, titleId)
	if titleId < 0 or titleId > 255 then return false end	
	if titleId == 0 then return true end -- 0 为清除
		
	if titleId >= 1 and titleId <= 32 * 4 then
		return Actor.HasHeadTitle(sysarg, titleId - 1) 
--	elseif titleId > 64 then
--		local vipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)

--		return (vipLevel >= (titleId - 32))
	else
		return false
	end
end

function ht_set_actor_current_head_title(sysarg, value)
	if value == nil then value = 0 end
	
	-- 玩家当前选择的称号,设置给 PROP_ACTOR_CURRENT_HEAD_TITLE, 以便广播
	local curTitle1 = System.getIntByte(value, 0)
	local curTitle2 = System.getIntByte(value, 1)
	
	if curTitle1 ~= 0 and ht_has_head_title(sysarg, curTitle1) == false then
		curTitle1 = 0 -- 该称号已经没有了
	end
	
	if curTitle2 ~= 0 and ht_has_head_title(sysarg, curTitle2) == false then
		curTitle2 = 0 -- 该称号已经没有了
	end
		
	-- PROP_ACTOR_CURRENT_HEAD_TITLE（byte0:头衔1[0为没有选择],byte1:头衔2[0为没有选择],byte2:捐献排行[0为没有上榜])
	local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
	headtitleVal = System.setIntByte(headtitleVal, 0, curTitle1)
	headtitleVal = System.setIntByte(headtitleVal, 1, curTitle2)
	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
end

-- 选择称号
function onht_selecte_headtitle(sysarg, packet)
	-- 从 1 开始(1~32对应PROP_ACTOR_HEAD_TITLE,33开始为VIP称号), 0 为清除
	local title1 = DataPack.readByte(packet)
	local title2 = DataPack.readByte(packet)	
		
	if title1 == title2 then title2 = 0 end	
	
	local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
	local curTitle1 = System.getIntByte(headtitleVal, 0)
	local curTitle2 = System.getIntByte(headtitleVal, 1)	
		
	if curTitle1 == title1 and curTitle2 == title2 then
		return
	end

	
	if (title1 ~= 0 and ht_has_head_title(sysarg, title1) == false) or (title2 ~= 0 and ht_has_head_title(sysarg, title2) == false) then
		--print("title1="..title1)
		Actor.sendTipmsg(sysarg, "您没有该称号", ttFlyTip)
		return
	end
	
	local sceneId = Actor.getSceneId(sysarg)
	if(sceneId == StdActivityCfg.JuntuanZhan.sceenId) then
		Actor.sendTipmsg(sysarg, "不能在军团战中设置称号", ttFlyTip)
		return
	end
	
	headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	headtitleVal = System.setIntByte(headtitleVal, 1, title2)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
	
	local svar = Actor.getStaticVar(sysarg)
	svar.seltitle = headtitleVal -- 只是显示而已,所以不用重新计算属性	
			
	Actor.sendTipmsg(sysarg, "设置称号成功", ttFlyTip)	
	Actor.sendTipmsg(sysarg,"设置称号成功",ttChatWindow)
end

function ht_OnPlayerLogin(sysarg, isCrossDay, svar)	
	local titleflags = svar.titleflags
	if titleflags == nil then titleflags = 0 end		
	
	
	

	--国庆绝版称号
	if not System.isCrossServer() then
		if svar.buyNDTitle==nil then svar.buyNDTitle={} end
		if svar.buyNDTitle[1]~=nil and svar.buyNDTitle[1]==1 then 
			Actor.setTopTitle(sysarg, 36, true)
		end
		if svar.buyNDTitle[2]~=nil and svar.buyNDTitle[2]==1 then 
			Actor.setTopTitle(sysarg, 37, true)
		end
		
		--限时称号
		if svar.LinShiTitle==nil then 
			svar.LinShiTitle={}
		end
		for i=1,#TitleHasTime do 
			local titleId = TitleHasTime[i].titleId
			if svar.LinShiTitle[titleId]~=nil then  --鸿运当头
				if System.getCurrMiniTime()<svar.LinShiTitle[titleId] then 
					Actor.setTopTitle(sysarg, titleId, true)
					Actor.addTimer(sysarg,52,5*1000) --5秒执行一次
					
					--告诉前端限时称号的剩余时间
					local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sSendLinShiTitleTime)
					DataPack.writeByte(netPack,titleId) --称号id
					DataPack.writeUint64(netPack,svar.LinShiTitle[titleId]-System.getCurrMiniTime())
					DataPack.flush(netPack)
				else
					svar.LinShiTitle[titleId]=nil 
				end
			end
		end
		
		--百元大户
		if svar.BYDH_Title~=nil then 	
			Actor.setTopTitle(sysarg,45,true)
		end
		
		--给鲜花送称号
		if svar.giveFlower ==nil then 
			svar.giveFlower=0
		end
		local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX )
		if svar.giveFlower>=1000 then 
			--男
			if nSex==0 then 
				Actor.setTopTitle(sysarg,56,true)
			else --女	
				Actor.setTopTitle(sysarg,57,true)
			end
		end
		
		--51超级vip
		if svar.sVIP51_Title~=nil then 	
			Actor.setTopTitle(sysarg,58,true)
		end
		
		
		--同一模板，使用道具后得到的称号
		for i=1,#GiveTitle do 
			local titleName = "titles"..GiveTitle[i].item_id
			if svar.Give_Title_byItem ==nil then 
				svar.Give_Title_byItem={}
			end
		
			if svar.Give_Title_byItem[titleName]~=nil then  
				Actor.setTopTitle(sysarg,GiveTitle[i].titleidId,true)
			end
		end
		
		--春节称号
		--if svar.spring_Titles~=nil then 
		--	Actor.setTopTitle(sysarg,68,true)
		--end
		
		
	end
		
	-- 有钱就是任性 (有充值元宝)
	if Actor.getIntProperty(sysarg, PROP_ACTOR_DRAW_YB_COUNT) > 0 then
		--Actor.setTopTitle(sysarg, Title.WithDrawYuanBao, true)
		local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
		if myJob==1 then
			Actor.setTopTitle(sysarg, 69, true)
		elseif myJob==2 then 
			Actor.setTopTitle(sysarg, 70, true)
		elseif myJob==3 then 
			Actor.setTopTitle(sysarg, 71, true)
		end
		
	end
	
	-- 0: 壕 (单笔充值达到500000元宝)
	if System.getIntBit(titleflags, 0) ~= 0 then
		Actor.setTopTitle(sysarg, Title.Tuhao, true)
	end
	
	-- 1: 一掷萬金 (开服5天内,累计消费达到100000元宝)
	if System.getIntBit(titleflags, 1) ~= 0 then
		Actor.setTopTitle(sysarg, Title.ConsumeYbWan, true)
	end
		
	-- 有品味的VIP (VIP等级达到 n/6 VIP)
	if Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE) >= 6 then
		Actor.setTopTitle(sysarg, Title.VIP6, true)
	end
	
	-- 万人斩阵营战(活动)中累计击杀达到1000人
	val = svar.campKillCount
	if val ~= nil and val >= 1000 then
		Actor.setTopTitle(sysarg,Title.CampKill,true)
	end
	
	-- 累计获得500000绑定元宝
	val = svar._totalBindYb
	if val ~= nil and val >= 500000 then
		Actor.setTopTitle(sysarg, Title.BindYb500000, true)
	end
	
	-- 热血青年 (累积登陆游戏4天)
	local loginDays = Actor.getLoginDays(sysarg)
	if loginDays >= 4 then
		Actor.setTopTitle(sysarg, Title.LonginDays, true)
	end
	
	-- 称号:寻宝不归路 (探索宝藏累计消费达到1000000元宝)
	val = svar.dmkjYb
	if val ~= nil and val >= 1000000 then
		Actor.setTopTitle(sysarg, Title.DmkjYb, true)
	end
	
	-- 2: 無翼伦比 (开服5天内, 翅膀进阶至7阶)SwingLevel7
--	if System.getIntBit(titleflags, 2) ~= 0 then
--		Actor.setTopTitle(sysarg, Title.SwingLevel7, true)
--	end

	
	-- 3: 珠光宝气 (开服7天内, 圣珠装备提升至20阶)
	if System.getIntBit(titleflags, 3) ~= 0 then
		Actor.setTopTitle(sysarg, Title.BeadEquipLevel, true)
	end
	
	-- 4: 铄石流金 (开服7天内,宝石装备提升至20阶)
	if System.getIntBit(titleflags, 4) ~= 0 then
		Actor.setTopTitle(sysarg, Title.StoneEquipLevel, true)
	end
	if not System.isCrossServer() then
	    --雷霆、光芒、烈焰军团长称号
	    local legionId = Actor.getLegionId(sysarg)
	    local sysVar = System.getStaticVar()
	    if legionId > 0 and sysVar.legion ~= nil then
            ----------------修复线上bug-------begin------------------------
            if sysVar.legion[legionId].ActorId == nil and sysVar.legion[legionId].Master ~= nil then
                if sysVar.legion[legionId].Master == Actor.getName(sysarg) then
                    sysVar.legion[legionId].ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
                end
            end
            ----------------修复线上bug-------end------------------------
		    if Actor.getIntProperty(sysarg,PROP_ENTITY_ID) ==  sysVar.legion[legionId].ActorId then
			    Actor.setTopTitle(sysarg,LEGIONID[legionId].HeadTitle,true)
                --改名校验
                if sysVar.legion[legionId].Master ~= Actor.getName(sysarg) then
                    sysVar.legion[legionId].Master = Actor.getName(sysarg)
                end 
		    end
	    end
   
        --补刀王
	    local titleid =24
	    if sysVar.bdking ~= nil and sysVar.bdking == Actor.getUIntProperty(sysarg,PROP_ENTITY_ID) then
		    Actor.setTopTitle(sysarg,titleid,true)
	    end
	    -- 检查是否武林盟主
	    ht_check_wulin_master(sysarg)
	
	    --天下第一xxx上线
	    if ht_has_head_title(sysarg, 2) == true then --第一战士
		    System.broadcastTipmsg(string.format("天下第一战士实力登场，尽情膜拜吧！",Actor.getName(sysarg)),128)	
	    elseif ht_has_head_title(sysarg, 3) == true then --第一法师
		    System.broadcastTipmsg(string.format("天下第一法师实力登场，尽情膜拜吧！",Actor.getName(sysarg)),128)	
	    elseif ht_has_head_title(sysarg, 4) == true then --第一道士
		    System.broadcastTipmsg(string.format("天下第一道士实力登场，尽情膜拜吧！",Actor.getName(sysarg)),128)	
	    end

    end
	
	
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if pLv>=10 then
		Actor.setTopTitle(sysarg, 0, true)
	end
    --超级幸运星称号
    if svar.superstartime ~= nil then
        if System.getCurrMiniTime() >= svar.superstartime then  
            svar.superstartime = nil
        else
             Actor.setTopTitle(sysarg, 67, true)
        end

    end
    --个人变量存储的永久称号
    if svar._headtitlecount ~= nil and svar._headtitlecount > 0 then
        for i= 1,svar._headtitlecount do
            if svar._headtitle[i] ~= nil  then
                Actor.setTopTitle(sysarg, svar._headtitle[i], true)
            end
            
        end
    end
    if not System.isCrossServer() then
    	--称号租赁
        if svar.leasetitleid ~= nil and svar.leasetitleid > 0 then
             local cfg =OpenServerAward[10].list[svar.leasetitleid]
              Actor.setTopTitle(sysarg,cfg.conditions.params[1],true)
        end
    end

    --竞技称号
    if not System.isCrossServer() then
        local var = Actor.getStaticVar(sysarg)
        if var.sportstitle == nil then
            var.sportstitle = {}
        end
        for i = 1,#SportsTitleCfg do
            if  var.sportstitle[i] ~= nil then
                Actor.setTopTitle(sysarg,SportsTitleCfg[i].TitleId,true)
            end

        end

    end
       --搜狗平台给搜狗称号
    --[[if System.getSpid() == 5 then
       Actor.setTopTitle(sysarg, 35, true)
    end

    --7k7k平台给搜狗称号
    if System.getSpid() == 14 then
       Actor.setTopTitle(sysarg, 46, true)
    end
	
	--爱奇艺平台给普通称号
    if System.getSpid() == 18 then
       Actor.setTopTitle(sysarg, 47, true)
    end
	

	--趣酷平台给称号
    if System.getSpid() == 16 then
       Actor.setTopTitle(sysarg, 49, true)
    end

    --747平台给称号
    if System.getSpid() == 21 then
        Actor.setTopTitle(sysarg, 59, true)
    end
	--9377平台给普通称号
    if System.getSpid() == 24 then
       Actor.setTopTitle(sysarg, 60, true)
    end

    	--酷爱玩
    if System.getSpid() == 29 then
       Actor.setTopTitle(sysarg, 73, true)
    end]]--
    --抢红包
    HandPlayerLoginRedPacket(sysarg)
	ht_set_actor_current_head_title(sysarg, svar.seltitle)

    --跨服服务器不佩戴称号
    if  System.isCrossServer() then
        Actor.setIntProperty(sysarg,PROP_ACTOR_CURRENT_HEAD_TITLE,0)
    end    
    
end

-- 退出游戏触发
function ht_OnPlayerLogout(sysarg)
	-- 用最新的 PROP_ACTOR_CURRENT_HEAD_TITLE 更新 seltitle
	local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
	local svar = Actor.getStaticVar(sysarg)
	svar.seltitle = headtitleVal
    
    
end

function ht_OnWithDrawYuanBao(sysarg, nYuanBao)
	if not Actor.hasTopTitle(sysarg, Title.WithDrawYuanBao) then
		--Actor.setTopTitle(sysarg, Title.WithDrawYuanBao, true)
		--Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "定个小目标"), ttFlyTip)
		
		local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
		if myJob==1 then
			Actor.setTopTitle(sysarg, 69, true)
		elseif myJob==2 then 
			Actor.setTopTitle(sysarg, 70, true)
		elseif myJob==3 then 
			Actor.setTopTitle(sysarg, 71, true)
		end
	end
	
	if nYuanBao >= 500000 then
		ht_set_titleflags(sysarg, 0, true)
		
		if not Actor.hasTopTitle(sysarg, Title.Tuhao) then			
			Actor.setTopTitle(sysarg, Title.Tuhao, true)
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "富甲天下"), ttFlyTip)
		end
	end	
end

function ht_OnVipLevelUp(sysarg, newVipLevel)
	if newVipLevel >= 6 then		
		if not Actor.hasTopTitle(sysarg, Title.VIP6) then
			Actor.setTopTitle(sysarg, Title.VIP6, true)
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "威名远扬"), ttFlyTip)
		end
	end
end

-- C++ 调用
function cpp_ht_set_headtitle(sysarg, title)
	if title < 0 or title > 31 then
		return
	end
	
	Actor.setTopTitle(sysarg, title, true)
	
	if title == Title.ConsumeYbWan then
		ht_set_titleflags(sysarg, 1, true)
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "财大气粗"), ttFlyTip)
	else
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, tostring(title)), ttFlyTip)
	end	
end

-- 客户端消息-称号
function onmsg_headtitle(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cHeadTitleModule then
		print("error onmsg_headtitle, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 获取称号数据
		send_headtitle_data(sysarg)	
	elseif msgid == 2 then -- 选择称号
		onht_selecte_headtitle(sysarg, packet)		
	else
		print("error onmsg_headtitle, unknown msgid="..msgid)
		return
	end

end

--玩家登陆的处理,判断是否是武林盟主，是的话加上封号和相应buff
function ht_check_wulin_master(sysarg)
	local svar = System.getStaticVar()
	-- 新的武林盟主
	local newWLKingId = svar.newWLKingId
	if newWLKingId == nil then return end
	
	local myActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if myActorId ~= newWLKingId then return end
	
	Actor.setTopTitle(sysarg, Title.WuLinMaster, true)
	Actor.setSocialMask(sysarg, smIsWulinMaster, true)
	
	System.broadcastTipmsg(string.format("英明神武,一统江湖的武林盟主<(c0xff00ff00)%s>上线了,大家热烈欢迎!",Actor.getName(sysarg)),130)	
end

-- 用于GM修复玩家的称号
function GmSetActorTitle(sysarg, actorName, id, value)
	local ptr = Actor.getActorByName(actorName)
    if ptr == nil then
        Actor.sendTipmsg(sysarg,"设置失败，玩家["..actorName.."]不在线",ttFlyTip)
        return
    end
    
    local isGive = true
    if value == 0 then
    	isGive = false
    end
    
    Actor.setTopTitle(ptr, id, isGive)
    
    Actor.sendTipmsg(sysarg,"设置玩家称号成功",ttFlyTip)
end