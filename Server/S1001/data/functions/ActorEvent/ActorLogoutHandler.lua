--lua script
--本脚本片段实现了角色登出游戏的默认处理 

--#include "data\functions\Activity\PKChallenge\PKChallengeCommon.lua" once  --处理pk挑战退出
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua" once
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--#include "data\config\NpcMiscCfg\HunDunShiJieCfg.lua" once
--#include "data\functions\BossListInfo\BossListInfoEx.lua" once
--#include "data\functions\Systems\ActivitySystem\YuanBaoJiaNianHuaNew.lua" once
--#include "data\config\activityconfig\WuLinZhengBa\WuLinZhengBa.lua" once
--#include "data\config\activity\ShengXiaoGongDianCfg.lua" once
--#include "data\config\ActorEvent\XiuZhenCfg.lua" once
--#include "data\config\equipSynthesis\XueLianCfg.lua" once --血练属性
--#include "data\config\equipSynthesis\ThorEquipCfg.lua" once
--#include "data\config\equipSynthesis\XinFaSystemCfg.lua" once --心法系统
--#include "data\config\equipSynthesis\LongTengCfg.lua" once --龙腾系统
-------------------------------------------------------------------------------------------
--释放回购物品
EventCallDispatcher._LogoutReleaseRepurchase = function ( sysarg, args )
  local pid = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
  local rd = getActorData( sysarg, 133 )
  if ( rd == nil or table.getn(rd) <= 0 ) then
    return
  end
  table.foreachi( rd, function( i, v ) Item.releaseItemPtr( v.ptr ) end )
end
             
EventCallDispatcher.defaultHandlerPlayerEnterSceneBack= function (sysarg,arg)

     local nSrcSceneId = arg[1]
     local nDestSceneId = arg[2]
         --退出激情大本营- 删除定时器
    
     if nSrcSceneId ==ArdourCampCfg.mapid and nDestSceneId ~= ArdourCampCfg.mapid then
        Actor.deleteTimer(sysarg,35)
        local var = Actor.getStaticVar(sysarg)
        --进入地图时间已满，设置为保底领取奖励标记
        if var.ardourentertag == nil and var.ardourentertick ~= nil  then
             if System.getCurrMiniTime() - var.ardourentertick >= ArdourCampCfg.givetime then
                var.ardourentertag = 1
             end
        end
        --设置满血
         Actor.collectOperateForNow(sysarg,0)

        local nMaxHp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
       
        local nMaxMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
        Actor.setIntProperty(sysarg,PROP_CREATURE_HP,nMaxHp)
        Actor.setIntProperty(sysarg,PROP_CREATURE_MP,nMaxMp)
    end
    --退出混沌世界
    if Actor.existTimer(sysarg,HunDunShiJieCfg.TimeId) then
        local bFind = false
        for i =1,table.getn(HunDunShiJieCfg.MapId) do
            if HunDunShiJieCfg.MapId[i] == nDestSceneId then
                bFind = true
                break
            end
        end
        if  bFind == false then
            Actor.deleteTimer(sysarg,HunDunShiJieCfg.TimeId)
            Actor.deleteTimer(sysarg,HunDunShiJieCfg.CountDownId) 
           
        end
    end
    --散人BOSS刷新右侧栏
    HandlePlayerEnterSceneBossTips(sysarg,nDestSceneId)	
	
	--进入元宝嘉年华的场景，检查一下是否活动开启了，是的话，就进入活动
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
	if nDestSceneId==cfg.sceneId and nSrcSceneId~= nDestSceneId then   --登录的时候还没初始化完，不能进入这个函数
		EnterYuanBaoJiaNianHuaScene(sysarg)
	end
	
	--主线任务。。。
	if nDestSceneId==9 and nSrcSceneId==235 then   --从某个场景到某个场景	
		if get_taskflags_val(sysarg) ==86 then
			local dvar = Actor.getDyanmicVar(sysarg)
			if dvar.hasChangeTheTask86==nil then 
				System.trace("shiwang task success"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
				Actor.addTimer(sysarg,48,5000)
				dvar.hasChangeTheTask86=1
			else
				System.trace("shiwang task failed x:"..Actor.getIntProperty(sysarg,PROP_ENTITY_POSX).."y:"..Actor.getIntProperty(sysarg,PROP_ENTITY_POSY))
			end
		end
	end
	
	if nDestSceneId==9 and nSrcSceneId==236 then   --从某个场景到某个场景	
		--个人副本的主线任务，特殊处理
		if get_taskflags_val(sysarg) ==92 then
			Actor.addTimer(sysarg,14,5000)
			System.trace("92task5s:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		end
	end
	
	if nDestSceneId==9 and nSrcSceneId==237 then   --从某个场景到某个场景	
		if get_taskflags_val(sysarg) ==97 then
			Actor.addTimer(sysarg,14,5000)
			System.trace("97task5s:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		end
	end

    --临时修正--------用于跨服押镖地图配置出错2017.10.14
--    if System.isCrossServer() == true then
--        if Actor.getSceneId(sysarg) == 570 then
--            Actor.enterScene(sysarg,470,202,150)
--        end
--    end

	--在生肖宫殿中退出
	if nSrcSceneId==564 then 
		local dVar = Actor.getDyanmicVar(sysarg)
		if dVar.SXGD_calYb~=nil and dVar.SXGD_calYb~=0 then 
			local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			System.AddMail(actor_id, 0, 0, "生肖宫殿 ", "尊敬的玩家您好,\\\\您在生肖殿堂中挂机"..(dVar.SXGD_calYb*ShengXiaoGongDianCfg.BuyTheTime[1]).."秒，消耗了"..dVar.SXGD_calYb.."元宝。")
			dVar.SXGD_calYb=0
		end
	end
    --世界BOSS 移除buff
    if nSrcSceneId == 119 then
        local cfgBuff =
         {
           {type=0,value=100000,money=50,buff={163,164,165},},
           {type=0,value=500000,money=100,buff={166,167,168},},
           {type=0,value=1000000,money=200,buff={169,170,171},},
         }
         for i =1,#cfgBuff do
            for j =1,#cfgBuff[i].buff do
                 if Actor.hasBuffById(sysarg,cfgBuff[i].buff[j]) then
                    Actor.delBuffById(sysarg,cfgBuff[i].buff[j])
                 end

            end
           

         end

    end
	
	--检查皇宫大乱斗
	local dVar = System.getDyanmicVar()
	if dVar.PalaceFightingStart ~=nil and dVar.PalaceFightingStart==1 then 
		if nDestSceneId==10 then 
			OnFinish_Liveness(sysarg,9)
		end
	end
    Actor.removeState(sysarg,esStateSing)
end
-------------------------------------------------------------------------------------------
EventCallDispatcher.defaultHandlerPlayerEnterScene= function (sysarg,arg)
    local nSrcSceneId = arg[1]
    local nDestSceneId = arg[2]
    
    --退出夺宝奇兵场景
    if nSrcSceneId == 234 and nDestSceneId ~= nSrcSceneId then
        local dVar = System.getDyanmicVar()
	    if dVar.duobaoqibingTime ~= nil then
            local nCount = 0
            nCount = Actor.getItemCount(sysarg,304)
            if nCount  > 0 then
                Actor.removeItem(sysarg,304,nCount)
                --重新在场景内爆出
                local pItem = Item.createItem(304,1)
                Item.createDropItem(sysarg,pItem,LogIds.chibaoren,"chibaoren",nil)
            end
        end
        
    end
--    --进入夺宝奇兵场景
    if nDestSceneId == 234 and nSrcSceneId ~= 234 then
        local nCount = 0
        nCount = Actor.getItemCount(sysarg,304)
        if nCount> 0 then
              Actor.removeItem(sysarg,304,nCount,-1, -1, -1,"刷宝箱进入",LogIds.shuabaoxiang)
        end
    end
    --进入王城
    if nDestSceneId == 10 and System.IsInSBKWar() then
        local nGuildId = Actor.getGuildId(sysarg)
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local sTips = ""
        local typeTips = ttScreenCenter
        if nGuildId > 0 then
            --王城会长
            if Guild.getSbkCityOwner() == nActorId then
                sTips = string.format("城主<(n%s)>只身飞入<(c0xFFFFFF)热血王城>,整个王城沸腾了,是虚名还是真本事,手底下见高低,谁敢应战?",Actor.getName(sysarg))
            elseif Guild.getGuildLeaderId(nGuildId) == nActorId then
                sTips = string.format("%s行会会长<(n%s)>,不服任何行会,亲临王城作战,此刻城主位空缺,群雄争锋,势必引发一场血雨腥风.",Guild.getGuildName(nGuildId),Actor.getName(sysarg))
            else
                local guildPos = Actor.getGuildPos(sysarg)
                local posName = ""
                if guildPos ~= 0 then
                    if guildPos == 1 then
                        posName  ="青龙堂主"
                    elseif guildPos == 2 then
                        posName= "朱雀堂主"
                    elseif guildPos == 3 then
                        posName = "白虎堂主"
                     elseif guildPos == 4 then
                        posName = "玄武堂主"
                    elseif guildPos == 5 then
                        posName = "副首领"
                    elseif guildPos == 6 then
                        posName = "首领"
                    end
                end
               sTips = string.format("%s行会%s<(n%s)>无所畏惧,一脚踏入热血王城,让暴风雨来得更猛烈些吧。",Guild.getGuildName(nGuildId),posName,Actor.getName(sysarg))
               typeTips =  ttChatWindow
            end
        end

        if sTips ~= "" then
            System.broadcastTipmsg(sTips,typeTips)
        end
    end
    ----杀猪副本 只允许进入二次
   -- if nDestSceneId == 169 then
   --     local var = Actor.getStaticVar(sysarg)
   --     if var.taskshazhu == nil then var.taskshazhu = 0 end
   --     if var.taskshazhu >= 2 then
   --         System.trace("杀猪副本,非法进入！name:"..Actor.getName(sysarg))
   --         return 0
   --     end
   --     var.taskshazhu = var.taskshazhu + 1
   -- end
	if nSrcSceneId==169 then 
		local var = Actor.getStaticVar(sysarg)
		if get_taskflags_val(sysarg)~=nil and  get_taskflags_val(sysarg)== 23 then --这个任务需要特殊处理
			if var.zhudongtask1==nil then 
				var.zkillmon=nil
				var.zkillmon ={}
				var.zkillmon[1]=0
				
				set_taskflags_val(sysarg,22)
			else
				set_taskflags_val(sysarg,24)
				Quest_ShuaXin(sysarg)
			end
			Quest_ShuaXin(sysarg)
		end
	end
   
    return 1;
end
-- 下线了
EventCallDispatcher.defaultHandlerPlayerLogout = function (sysarg,arg)

 --押镖状态，记录镖车坐标，用于下次登录创建
    local var = Actor.getStaticVar(sysarg)
    if Actor.getIsDartFlag(sysarg) == 1 then -- 普通押镖
        local monster = Actor.getEntity(var.bcHandle)
       
	    local monsterX,monsterY = Actor.getEntityPosition(monster,0,0)
        var.bcpoint={}
        var.bcpoint.x = monsterX
        var.bcpoint.y = monsterY
        var.bcpoint.sceneid = Actor.getSceneId(monster)
        var.bcpoint.bcHandle = var.bcHandle
    end 

    local TeamId = Actor.getTeamId(sysarg)
    if TeamId ~= 0 then
	    --if Fuben.getTeamFubenStatus(TeamId) == tsReady then
	    Actor.exitTeam(sysarg)
	    --end
    end
  --noviceLogoff(sysarg, arg)
  SaveData(sysarg,Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
  --释放回购物品
  --EventCallDispatcher._LogoutReleaseRepurchase(sysarg,arg)
  
	local dyvar = Actor.getDyanmicVar(sysarg)
	local iFbId = dyvar and dyvar.releaseFbId or 0
	local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
	if iFbId > 0 then
		RemFromList(iFbId, myId)
		dyvar.releaseFbId = 0
	end
	if dyvar.escortMonsterHandle then
		Fuben.clearMonster(dyvar.escortMonsterHandle)
		dyvar.escortMonsterHandle = nil
	end
	--处理pk挑战数据
	if IsInPkChallengeScene(sysarg) then
		doClearPkData(sysarg)
	end

	--天书任务下线保存值
	local sVar = Actor.getStaticVar(sysarg)
	local times, flushLv, surpItemId = Actor.getQuestBookInfo(sysarg, 0, 0)
    if sVar.days == nil then sVar.days = {} end
	sVar.days.CoinQuestTimes = times
	sVar.BookFlushLevel = flushLv
	sVar.BookSurpItemId = surpItemId

	--local vipAwarFalg = Actor.getVipAwardFlag(sysarg)
	--if vipAwarFalg > 0 then
	--	sVar.days.VipRewardDate = vipAwarFalg
	--else
	--	sVar.days.VipRewardDate = nil
	--end

	local guildAwardFlag, myTodayCoin = Actor.getGuildCoinAwardFlag(sysarg,0,0)
	sVar.GuildAwardFlag = guildAwardFlag
	sVar.GuildTodayCoin = myTodayCoin

	if sVar.ybstate == 1 then
		OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailActorLogout);
		Quest_ShuaXin(sysarg);
	end

	--玩家复活时间下线保存
	local nNextReliveCd = Actor.getReliveTimeCD(sysarg,1)
	sVar.NextHpReliveCd = tonumber(nNextReliveCd)

	-- 处理玩家登出
	OnPlayerLogout(sysarg)
	
	--下线时删除显示真气升级的冷却时间的定时器
	local nExist = Actor.existTimer(sysarg,ActorTimerIds.AvoidUp)
	if nExist then
		Actor.deleteTimer(sysarg,ActorTimerIds.AvoidUp)
	end
	
	--下线时删除显示炼金冷却时间的定时器
	nExist = Actor.existTimer(sysarg,ActorTimerIds.Alchemy)
	if nExist then
		Actor.deleteTimer(sysarg,ActorTimerIds.Alchemy)
	end
	
	
	--下线保存宝宝数据
	for i = 256,258 do
		local petCount = Pet.getPetCountById(sysarg,i)
		if petCount > 0 then
			local petPtr = Pet.getPetById(sysarg,sVar.petId)
			local nHp = Actor.getIntProperty(petPtr,PROP_CREATURE_HP)
			if nHp > 0 then
				if not sVar.petInfo then
					sVar.petInfo = {}
				end
				sVar.petInfo[1] = i
				sVar.petInfo[2] = nHp
				break			
			end
		end
	end
	
	OneHundredActivityEvent(sysarg)
	
	
	--在生肖宫殿中退出游戏
	if Actor.getSceneId(sysarg) == 564 then
		local dVar = Actor.getDyanmicVar(sysarg)
		if dVar.SXGD_calYb~=nil and dVar.SXGD_calYb~=0 then 
			local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			System.AddMail(actor_id, 0, 0, "生肖宫殿 ", "尊敬的玩家您好,\\\\您在生肖殿堂中挂机"..(dVar.SXGD_calYb*ShengXiaoGongDianCfg.BuyTheTime[1]).."秒，消耗了"..dVar.SXGD_calYb.."元宝。")
			SXGD_calYb=0
		end
	end

end              

function OneHundredActivityEvent(sysarg)
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.HundredOnlineTime then
		var.HundredOnlineTime = 0
	end	
		
	var.HundredOnlineTime = var.HundredOnlineTime + GetActorTodayOnlineTime(sysarg)
end

EventCallDispatcher.InnerLvUp = function (sysarg,arg)
	local nLevel = arg[1]
    local mai={"梁丘","箕门","关元","少商","腹中","曲池","灵虚","华盖","天鼎","神庭"}
    local chong = math.ceil(nLevel / 10)

    local aaa =nLevel % 10
    if aaa == 0 then aaa = table.getn(mai) end
    local mai = mai[aaa]

	Actor.sendTipmsg(sysarg,string.format("内功提升至%d重%s,查看详细属性<打开/@@showWin,1>",chong,mai),ttChatWindow)
end


EventCallDispatcher.XiuZhenLevelUp = function (sysarg,arg)
	local types = arg[1]
	if types==1 then --升级操作
		local index = arg[2]
		onXiuZhenLevelUp(sysarg,index)
	end
end

--实现修真的等级提升
function onXiuZhenLevelUp(sysarg ,index)

--print("index="..index)
	
	local innerLevel = Actor.getUIntProperty(sysarg,PROP_ACTOR_INNER_LEVEL)
	--每10级1重
	local chong = math.ceil(innerLevel / 10)
	
	--槽位等级
	local pointLevel = Actor.getXiuZhenData(sysarg,index-1)
	local needChong = math.ceil((pointLevel+1 )/ 10)
	if needChong>chong then 
		Actor.sendTipmsg(sysarg,"请把内功升到"..needChong.."重再来",ttFlyTip)
		return 
	end
	
	--这是要激活
	if pointLevel==0 then
		--激活需要培元丹
		local bNeedItemCount = XiuZhenCfg.BrokenAndLvUp.brokenNeedItemCount[1]
		local bNeedItem = XiuZhenCfg.BrokenAndLvUp.LevelUpNeedItemId[1]
		
		local itemCount = Actor.getItemCount(sysarg,bNeedItem,-1,-1,-1)
		if itemCount<bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"所需物品不足,突破失败",ttFlyTip)
			return 
		end
		
		if Actor.removeItem(sysarg,bNeedItem,bNeedItemCount, -1, -1, -1,"修真激活",LogIds.xiuzhenLvUp)~=bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"无法扣除,突破失败",ttFlyTip)
			return 
		end

		
		Actor.setXiuZhenData(sysarg,index-1,1)
		Actor.sendTipmsg(sysarg,"突破成功",ttFlyTip)
		
		Actor.collectOperate(sysarg,0) -- 重新计算属性
		
		local netPack = DataPack.allocPacket(sysarg, 71, 1) -- 下发当前魂值	
		for i=1,8 do 
			DataPack.writeByte(netPack, Actor.getXiuZhenData(sysarg,i-1))	
		end	
		DataPack.flush(netPack)	
	
		return 
	end
	
	local cfg = XiuZhenCfg.Postion[index]
	if pointLevel>=#cfg.attr then 
		Actor.sendTipmsg(sysarg,"已经是最高重了",ttFlyTip)
		return 
	end
	
	--突破扣除
	if pointLevel%10==0 then --这是要突破的 
		local bNeedItemCount = XiuZhenCfg.BrokenAndLvUp.brokenNeedItemCount[needChong]
		local bNeedItem = XiuZhenCfg.BrokenAndLvUp.brokenNeedItemId
		if bNeedItemCount==nil then 
			Actor.sendTipmsg(sysarg,"配置错误,突破失败",ttFlyTip)
			return 
		end
		
		
		local itemCount = Actor.getItemCount(sysarg,bNeedItem,-1,-1,-1)
		if itemCount<bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"所需物品不足,突破失败",ttFlyTip)
			return 
		end
		
		if Actor.removeItem(sysarg,bNeedItem,bNeedItemCount, -1, -1, -1,"修真突破",LogIds.xiuzhenLvUp)~=bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"无法扣除,突破失败",ttFlyTip)
			return 
		end
		
		local noticeStr = string.format("恭喜玩家<(n%s)>成功将<(c0xFF00FF00)%s>突破至<(c0xFF00FF00)%s>,实力更上一层楼<我也要修真/@@showWin,110,1>", Actor.getName(sysarg), XiuZhenCfg.Postion[index].name,XiuZhenCfg.BrokenAndLvUp.name[needChong])
		
		Actor.sendTipmsg(sysarg,noticeStr,ttChatWindow)
		
		Actor.sendTipmsg(sysarg,"突破成功",ttFlyTip)
		
	else 
		local y = pointLevel%10
		local bNeedItemCount = XiuZhenCfg.BrokenAndLvUp.LevelUpNeedItemCount[needChong][y]
		local bNeedItem = XiuZhenCfg.BrokenAndLvUp.LevelUpNeedItemId[math.ceil(needChong/2)]
		if bNeedItemCount==nil  or bNeedItem==nil then 
			Actor.sendTipmsg(sysarg,"配置错误,突破失败",ttFlyTip)
			return 
		end
		
		
		local itemCount = Actor.getItemCount(sysarg,bNeedItem,-1,-1,-1)
		if itemCount<bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"所需物品不足,升级失败",ttFlyTip)
			return 
		end
		
		if Actor.removeItem(sysarg,bNeedItem,bNeedItemCount, -1, -1, -1,"修真升级",LogIds.xiuzhenLvUp)~=bNeedItemCount then 
			Actor.sendTipmsg(sysarg,"无法扣除,升级失败",ttFlyTip)
			return 
		end
		
		Actor.sendTipmsg(sysarg,"升级成功",ttFlyTip)
	
	end

	--升级
	Actor.setXiuZhenData(sysarg,index-1,pointLevel+1)	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
		
	local netPack = DataPack.allocPacket(sysarg, 71, 1) -- 下发当前魂值	
	for i=1,8 do 
		DataPack.writeByte(netPack, Actor.getXiuZhenData(sysarg,i-1))	
	end	
	DataPack.flush(netPack)	
	
	System.sendCommonLog(LogIds.xiuzhenLvUp,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),index,pointLevel, pointLevel+1, "","","","","")
end



EventCallDispatcher.defaultHandlerPlayerChangeName = function(sysarg,arg)
    --军团长
    local legionId = Actor.getLegionId(sysarg)
	local sysVar = System.getStaticVar()
	if legionId > 0 and sysVar.legion ~= nil then
		if Actor.getIntProperty(sysarg,PROP_ENTITY_ID) ==  sysVar.legion[legionId].ActorId then
            --改名校验
            if sysVar.legion[legionId].Master ~= Actor.getName(sysarg) then
                sysVar.legion[legionId].Master = Actor.getName(sysarg)
            end 
		end
	end
        --武林盟主
    if sysVar.wulin ~= nil then  
        if sysVar.wulin.wulinId ~= nil and sysVar.wulin.wulinId  == Actor.getIntProperty(sysarg,PROP_ENTITY_ID) then
             sysVar.wulin.wulinMaster = Actor.getName(sysarg)
        end
    end

--    local ranking = Ranking.getRanking(WuLinZhengBaConfig.RankName)
--	if ranking ~= nil then

--		local pItem = Ranking.getItemPtrFromId(ranking,nIndex)
--		if pItem then
--            local nActorId = Ranking.getPoint(pItem)
--            if nActorId == Actor.getIntProperty(sysarg,PROP_ENTITY_ID) then
--                 if sysVar.wulin == nil then  
--                    sysVar.wulin = {} 
--                    sysVar.wulin.wulinMoney = 0
--                end
--                sysVar.wulin.wulinMaster = Actor.getName(sysarg)
--                Ranking.setSub(pItem,0,Actor.getName(sysarg))

--            end
--        end
--    end
end



EventCallDispatcher.XueLianLevelUp = function (sysarg,arg)
	local types = arg[1]
	if types==1 then --升级操作
		local index = arg[2]
		onXueLianLevelUp(sysarg,index)
	end
end

--实现血练的等级提升
function onXueLianLevelUp(sysarg ,index)
	
	local cfg = XueLianCfg.LevepUp
	if index<1 or index>#cfg then 
		return 
	end
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle<3 then 
		return 
	end
	
	local xiuzhenValue = Actor.getXueLianValue(sysarg)
	local xiuzhenPosLevel = Actor.getXueLianData(sysarg,index-1)
	
	if xiuzhenPosLevel>=#cfg[index].level then 
		Actor.sendTipmsg(sysarg,"已经最高级",ttFlyTip)
		return 
	end
	
	local cfg2 = cfg[index].level[xiuzhenPosLevel+1]
	
	if xiuzhenValue<cfg2.needJingHua then 
		Actor.sendTipmsg(sysarg,"血练精华不足",ttFlyTip)
		return 
	end
	
	xiuzhenValue = xiuzhenValue -cfg2.needJingHua
	Actor.setXueLianValue(sysarg,xiuzhenValue)
	
	Actor.setXueLianData(sysarg,index-1,xiuzhenPosLevel+1)
	Actor.sendTipmsg(sysarg,"升级成功",ttFlyTip)
	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
		
		
	local netPack = DataPack.allocPacket(sysarg, 73, 2) -- 下发当前血练精华
	DataPack.writeInt(netPack, Actor.getXueLianValue(sysarg))
	DataPack.writeByte(netPack, index)		
	DataPack.writeByte(netPack, Actor.getXueLianData(sysarg,index-1))	
	DataPack.flush(netPack)	
	
	System.sendCommonLog(LogIds.xuelianLevelup,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),index,Actor.getXueLianData(sysarg,index-1)-1, Actor.getXueLianData(sysarg,index-1), "","","","","")
	System.sendCommonLog(LogIds.xuelianValue,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,cfg2.needJingHua + Actor.getXueLianValue(sysarg), Actor.getXueLianValue(sysarg), "","","升级扣除","","")
	
	if (xiuzhenPosLevel+1)%5==0 then 
		local posName = cfg[index].name
		str = string.format("<(n%s)>玩家将%s部件血炼至%s级,获得大量属性,战斗力直线飙升!<我也要升级/@@showWin,129>",Actor.getName(sysarg),posName,xiuzhenPosLevel+1)
		Actor.sendTipmsg(sysarg,str,ttChatWindow)
	end
	
end

function addXueLianValue(sysarg,value) 
	local xiuzhenValue = Actor.getXueLianValue(sysarg)
	print("xiuzhenValue="..xiuzhenValue)
	Actor.setXueLianValue(sysarg,value)
end



--雷神的操作
EventCallDispatcher.ThorEquipLevelUp = function (sysarg,arg)
	local types = arg[1]
	if types==1 then --升级操作
		local index = arg[2]
		onThorEquipLevelUp(sysarg,index)
	end
end


function onThorEquipLevelUp(sysarg,index)
	
	index = tonumber(index)
	
	local cfg = ThorEquipCfg.ForLevelUp
	if index<1 or index>#cfg then 
		return 
	end
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle<1 then 
		Actor.sendTipmsg(sysarg,"系统1转之后开启",ttFlyTip)
		return 
	end
	
	local ThorEquipValue = Actor.getThorEquipValue(sysarg)
	local ThorEquipPosLevel = Actor.getThorEquipData(sysarg,index-1)
	
	if ThorEquipPosLevel>=#cfg[index].levelUpInfo then 
		Actor.sendTipmsg(sysarg,"已经最高级",ttFlyTip)
		return 
	end
	
	local cfg2 = cfg[index].levelUpInfo[ThorEquipPosLevel+1]
	
	local needXianShui = cfg2.needXianShui
	
	--需要突破
	if needXianShui==0 then 
		local brokenNeedItem = cfg[index].brokenNeedItem 
		local brokenNeedItemCount = 0
		if ThorEquipPosLevel==0 then 
			brokenNeedItemCount =cfg[index].brokenNeedItemCount[1]
		elseif ThorEquipPosLevel==10 then 
			brokenNeedItemCount =cfg[index].brokenNeedItemCount[2]
		elseif ThorEquipPosLevel==20 then 
			brokenNeedItemCount =cfg[index].brokenNeedItemCount[3]
		elseif ThorEquipPosLevel==30 then
			brokenNeedItemCount =cfg[index].brokenNeedItemCount[4]
		elseif ThorEquipPosLevel==40 then 
			brokenNeedItemCount =cfg[index].brokenNeedItemCount[5]
		else
			Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
			return 
		end
		
		if Actor.getItemCount(sysarg,brokenNeedItem) < brokenNeedItemCount then
			Actor.sendTipmsg(sysarg,"所需物品不足",ttFlyTip)
			return			
		end
		
		if Actor.removeItem(sysarg,brokenNeedItem,brokenNeedItemCount,-1,-1,-1,"雷神突破扣除", LogIds.ThorEquipLevelUp) ~= brokenNeedItemCount then 
			Actor.sendTipmsg(sysarg,"扣除物品失败",ttFlyTip)
			return 
		end
		
		if ThorEquipPosLevel==0 then 
			Actor.sendTipmsg(sysarg,"激活成功",ttFlyTip)
		else
			Actor.sendTipmsg(sysarg,"升阶成功",ttFlyTip)
		end
		
	else --普通升级
		if ThorEquipValue<cfg2.needXianShui then 
			Actor.sendTipmsg(sysarg,"仙力值不足",ttFlyTip)
			return 
		end
		
		--扣除仙力值
		ThorEquipValue = ThorEquipValue -cfg2.needXianShui
		Actor.setThorEquipValue(sysarg,ThorEquipValue)
		
		Actor.sendTipmsg(sysarg,"升星成功",ttFlyTip)
	end
	
	
	--设置雷神装备
	Actor.setThorEquipData(sysarg,index-1,ThorEquipPosLevel+1)
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
		
	local netPack = DataPack.allocPacket(sysarg, 75, 2) -- 下发当前血练精华
	--DataPack.writeInt(netPack, Actor.getThorEquipValue(sysarg))
	DataPack.writeByte(netPack, index)		
	DataPack.writeByte(netPack, Actor.getThorEquipData(sysarg,index-1))	
	DataPack.flush(netPack)	

	
	System.sendCommonLog(LogIds.ThorEquipLevelUp,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),index,Actor.getThorEquipData(sysarg,index-1)-1, Actor.getThorEquipData(sysarg,index-1), "","","","","")
	System.sendCommonLog(LogIds.ThorEquipValueChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getThorEquipValue(sysarg)+cfg2.needXianShui, Actor.getThorEquipValue(sysarg), "","","升级扣除","","")

	local nowLevel = Actor.getThorEquipData(sysarg,index-1)
	local equipName = { "武器","衣服","头盔","项链","手镯","手镯","戒指","戒指","腰带","靴子"}
	
	local str=""
	if nowLevel%10==1 then 
		str = string.format("恭喜<(n%s)>玩家将[雷神-%s]升至%s阶,战斗力瞬间飙升！<我也要提升/@@showWin,1>",Actor.getName(sysarg),equipName[index],math.floor(nowLevel/10)+1)
	elseif 	nowLevel%5==0 then 
		local xing = nowLevel%10
		if xing==0 then 
			xing=10
		end
		str = string.format("恭喜<(n%s)>玩家将[雷神-%s]升至%s阶%s星,战斗力瞬间飙升！<我也要提升/@@showWin,1>",Actor.getName(sysarg),equipName[index],math.floor((nowLevel-1)/10)+1,xing)
	end
	if str~="" then 
		System.broadcastTipmsg(str,   ttChatWindow)
	end
end 

function addThorValue(name,value) 
	local ThorValue = Actor.getThorEquipValue(sysarg)
	print("ThorValue="..ThorValue)
	Actor.setThorEquipValue(sysarg,value)
end

--gfunc gmSetThorValue "xxx" 1212 ---直接给玩家多少仙力。
function gmSetThorValue(sysarg,value) 
	local name =tostring(name)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		Actor.setThorEquipValue(pActor,value)
		Actor.sendTipmsg(sysarg,"赠送成功",ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end

--gfunc gmSetThorEquipData "xxx" 1 10   --1=部位  10=等级。
function gmSetThorEquipData(name,index,ThorEquipPosLevel)

	local name =tostring(name)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		Actor.setThorEquipData(pActor,index-1,ThorEquipPosLevel)
		Actor.sendTipmsg(sysarg,"调整成功",ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end



--心法操作
EventCallDispatcher.XinFaOpHandle = function (sysarg,arg)
	local types = arg[1]
	if types==1 then --心法升级
		onXinFaLevelUp(sysarg)
	elseif types ==2 then  --命格升级
		local index = arg[2]
		onMingGeLevelUp(sysarg,index)
	end
end

--升级心法
function onXinFaLevelUp(sysarg)
	
	local XinFaValue = Actor.getXinFaValue(sysarg)
	local XinFaPosLevel = Actor.getXinFaData(sysarg)
	
	local cfg = XinFaSystemCfg.XinFaLevelUp[XinFaPosLevel+1]
		
	if XinFaPosLevel>=#XinFaSystemCfg.XinFaLevelUp then 
		Actor.sendTipmsg(sysarg,"已经最高级",ttFlyTip)
		return 
	end
	
	if cfg==nil then 
		return 
	end
	
	
	local needxinfaValue = cfg.xinfaValue
	local needinnerLevel = cfg.needNeiGongLevel
	local needMoney = cfg.needCoin
	
	--是否足够心法值
	if XinFaValue<needxinfaValue then 
		Actor.sendTipmsg(sysarg,"心法值不足",ttFlyTip)
		return 
	end
	
	--内功等级是否足够
	local innerLevel = Actor.getUIntProperty(sysarg,PROP_ACTOR_INNER_LEVEL)
	if innerLevel<needinnerLevel then 
		Actor.sendTipmsg(sysarg,"内功等级不足",ttFlyTip)
		return 	
	end
	
	--金钱是否足够
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= needMoney then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= needMoney then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,"金币/绑定金币不足",ttFlyTip);
		return;
	end
	
	--扣心法值
	Actor.setXinFaValue(sysarg,XinFaValue -needxinfaValue)
	--扣金钱
	Actor.changeMoney(sysarg,MC,-needMoney);
	--升级
	Actor.setXinFaData(sysarg,XinFaPosLevel+1)
	--通知前端
	
	Actor.sendTipmsg(sysarg,"升级成功",ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 77, 2) -- 告诉前端升级成功
	DataPack.flush(netPack)	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	--288 289 290
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local bookId ={288 ,289, 290} 
	--local skillName = {"十步一杀","天魔困牢","泽被苍生"}
	if XinFaPosLevel%10==0 then 
		Actor.learnSkill(sysarg,bookId[myJob],math.floor(XinFaPosLevel/10)+1)
		--Actor.sendTipmsg(sysarg,"学习"..skillName[myJob]..(math.floor(XinFaPosLevel/10)+1).."级成功",ttFlyTip)
	end
	System.sendCommonLog(LogIds.xinfaLevelChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getXinFaData(sysarg)-1 , Actor.getXinFaData(sysarg), "","","心法等级提升","","")
	System.sendCommonLog(LogIds.xinfaValueChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getXinFaValue(sysarg)+needxinfaValue , Actor.getXinFaValue(sysarg), "","","心法等级提升","","")
	
	local chong =math.floor(XinFaPosLevel/10)+1
	local ji = (XinFaPosLevel+1)%10
	if ji==0 then 
		ji =10
	end
	local tipsName ={"一元","两仪","三才","四象","五行","六合","七星","八荒","九宫","十方"}
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家将心法提升至%s重%s,战力暴涨！<我也要提升/@@showWin,1>",Actor.getName(sysarg),chong,tipsName[ji]),   ttChatWindow)
end

--升级命格
function onMingGeLevelUp(sysarg,index)
	index = tonumber(index)
	
	local cfg = XinFaSystemCfg.MingGeLevelUp
	if index<1 or index>#cfg then 
		return 
	end
	
	local mingGePosLevel = Actor.getMingGeData(sysarg,index-1)

	if mingGePosLevel>=#cfg[index] then 
		Actor.sendTipmsg(sysarg,"已经最高级",ttFlyTip)
		return 
	end

	local xinfaLevel = Actor.getXinFaData(sysarg)
	--心法等级是否满足
	if mingGePosLevel>=xinfaLevel then 
		Actor.sendTipmsg(sysarg,"请先提升心法",ttFlyTip)
		return 
	end
	
	local cfg2 = cfg[index][mingGePosLevel+1]
	if cfg2==nil then 	
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return 
	end
	
	--道具是否足够
	 if Actor.getItemCount(sysarg,XinFaSystemCfg.MingGeLevelUpNeedId) < cfg2[1] then
        Actor.sendTipmsg(sysarg,"道具不足",ttFlyTip)
        return
    end
	
	--扣道具
	if Actor.removeItem(sysarg, XinFaSystemCfg.MingGeLevelUpNeedId, cfg2[1], -1, -1, -1, "升级命格",LogIds.xinfaMingGeChange) ~= cfg2[1] then
		return 
	end
	
	--升级命格
	Actor.setMingGeData(sysarg,index-1,mingGePosLevel+1)

	Actor.sendTipmsg(sysarg,"升级成功",ttFlyTip)
		
	--通知前端
	local netPack = DataPack.allocPacket(sysarg, 77, 4) -- 告诉前端升级成功
	DataPack.writeByte(netPack, index)	
	DataPack.flush(netPack)	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	
	System.sendCommonLog(LogIds.xinfaMingGeChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),index,Actor.getMingGeData(sysarg,index-1)-1 , Actor.getMingGeData(sysarg,index-1), "","","命格等级提升","","")

end


--心法值增加
function addXinFaValue(sysarg,value) 
	local XinFaValue = Actor.getXinFaValue(sysarg)
	print("XinFaValue="..XinFaValue)
	Actor.setXinFaValue(sysarg,value)
end

--用来打印数据
function showXinFaMingGeInfo(sysarg)
	local XinFaValue = Actor.getXinFaValue(sysarg)
	local XinFaPosLevel = Actor.getXinFaData(sysarg)
	print("XinFaValue="..XinFaValue)
	print("XinFaPosLevel="..XinFaPosLevel)
	
	for i=1,10 do 
		print("MingGePos[i]="..Actor.getMingGeData(sysarg,i-1))
	end
end


--龙腾操作
EventCallDispatcher.LongTengOpHandle = function (sysarg,arg)
	local types = arg[1]
	if types==1 then --心法升级
		local index = arg[2]
		onLongTengOpHandle(sysarg,index)
	end
end

onLongTengOpHandle =function(sysarg,index)
	index = tonumber(index)
	
	local cfg = LongTengCfg.StrongTheLongThengSlot
	if index<1 or index>#cfg then 
		return 
	end
	
	local LongTengPosLevel = Actor.getLongTengData(sysarg,index-1)

	
	local cfg2 = cfg[index][LongTengPosLevel+1]
	if cfg2==nil then 	
		Actor.sendTipmsg(sysarg,"已经是最高级了",ttFlyTip)
		return 
	end
	
	--道具是否足够
	 if Actor.getItemCount(sysarg,LongTengCfg.StrongNeedItemId) < cfg2.needItemCount then
        Actor.sendTipmsg(sysarg,"道具不足",ttFlyTip)
        return
    end
	
	local needMoney =cfg2.needMoneyCount
	
	--金钱是否足够
	local MC = 2;
	if Actor.getMoneyCount(sysarg,1) >= needMoney then MC = 1; end
	if Actor.getMoneyCount(sysarg,0) >= needMoney then MC = 0; end
	if MC == 2 then
		Actor.sendTipmsg(sysarg,"金币/绑定金币不足",ttFlyTip);
		return;
	end
	
	
	--扣道具
	if Actor.removeItem(sysarg, LongTengCfg.StrongNeedItemId, cfg2.needItemCount, -1, -1, -1, "强化龙腾槽位",LogIds.StrongLongTengSlot) ~=cfg2.needItemCount  then
		return 
	end
	
	--扣金钱
	Actor.changeMoney(sysarg,MC,-needMoney,LogIds.StrongLongTengSlot,"强化龙腾槽位")
	
	--强化龙腾槽位
	Actor.setLongTengData(sysarg,index-1,LongTengPosLevel+1)

	Actor.sendTipmsg(sysarg,"强化成功",ttFlyTip)
		
	--通知前端
	local netPack = DataPack.allocPacket(sysarg, 79, 2) -- 告诉前端升级成功
	DataPack.writeByte(netPack, index)	
	DataPack.writeByte(netPack, LongTengPosLevel+1)	
	DataPack.flush(netPack)	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	
	System.sendCommonLog(LogIds.StrongLongTengSlot,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),index,LongTengPosLevel , LongTengPosLevel+1, "","","强化龙腾槽位","","")

	
	local tipsName ={"龙腾圣武","龙腾衣服","龙腾圣盔","龙腾圣链","龙腾圣镯","龙腾圣镯","龙腾圣指","龙腾圣指","龙腾圣带","龙腾圣靴"}
	if (LongTengPosLevel+1)%5==0 then 
		System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家%s强化+%s,战力暴涨！<我也要强化/@@showWin,200>",Actor.getName(sysarg),tipsName[index],LongTengPosLevel+1),   ttChatWindow)
	end
end

--用来打印数据
function showLongTengInfo(sysarg)

	for i=1,10 do 
		print("LongTengData="..Actor.getLongTengData(sysarg,i-1))
	end
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout,EventCallDispatcher.defaultHandlerPlayerLogout)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterScene,EventCallDispatcher.defaultHandlerPlayerEnterScene)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterSceneBack,EventCallDispatcher.defaultHandlerPlayerEnterSceneBack)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeChangeName,EventCallDispatcher.defaultHandlerPlayerChangeName)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeInnerLevelUpgrade,EventCallDispatcher.InnerLvUp)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeXiuZhenOp,EventCallDispatcher.XiuZhenLevelUp) --修真操作
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeXueLianOp,EventCallDispatcher.XueLianLevelUp) --血练操作
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeThorEquipOp,EventCallDispatcher.ThorEquipLevelUp) --雷神操作
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeXinFaOp,EventCallDispatcher.XinFaOpHandle) --心法操作

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLongTengOp,EventCallDispatcher.LongTengOpHandle) --龙腾操作