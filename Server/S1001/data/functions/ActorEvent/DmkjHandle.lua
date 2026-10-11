--lua script
--处理盗梦空间相关的操作

--#include "data\config\dmkj\NewDmkjConfig.lua" once

--#include "data\config\dmkj\Dmkj.lua" once
--#include "data\config\ActorEvent\TreasureIntegralCfg.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\config\dmkj\CharItemActivity.lua" once
--#include "data\functions\Activity\PublicTest.lua" once
--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\functions\new_activity\qingdian\treasure_hunt.lua" once


local MAX_DMKJ_MJ = 1

DmkjOpId = {
	enRefresh = 1,		--刷新物品
	enDm = 2,			--盗梦
	enIndex = 3,		--首页信息
	enAward = 4,		--领取物品
	enExChangeItem = 5,	--宝藏积分兑换物品
	enRecycleItem = 6,	--回收物品
	enQingdianPointExchange = 7, --珍宝积分兑换为宝藏积分
}

DmkjOpFuncList = {}

EventCallDispatcher.HandlerDmkjOp = function (sysarg, args)
	--print("HandlerDmkjOp================"..args[1])
	if args[1] == nil then return end   --
	local func = DmkjOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args)
	end
end

DmkjFun = 
{
	--刷新盗梦库
	RefreshDmLib = function ()
		local openday = System.getDaysSinceOpenServer()
		local combineday = System.getDaysSinceCombineServer()
		--print("openday:"..openday)
		--print("combineday:"..combineday)
		local itemLibs = DmkjConf.ItemLibs
		local randLibs = {}
		for k, v in ipairs(itemLibs) do
			if v.OpenDays == 0 or v.CombineDay == 0 then	--开服或者合服配置为0代表 当作常规库
				table.insert(randLibs, k)
			else
				if v.OpenDays then		--开服判断
					for m, n in ipairs(v.OpenDays) do
						if openday == n then
							return k
						end
					end
				end
				
				if v.CombineDay then	--合服判断
					for m, n in ipairs(v.CombineDay) do
						if combineday == n then
							return k
						end
					end
				end
			end
			
		end
		
		--如果找不到开服配置，则随机选择配置为-1的
		local randCount = table.getn(randLibs)
		if randCount > 0 then
			local randNum = math.random(randCount)
			return randLibs[randNum]
		end
		
		return 0
	end,
	
	--设置盗梦库
	SetDmLib = function (sysarg)
		--print("SetDmLib===============")
		local dval = System.getDyanmicVar()
		dval.dmLib = DmkjFun.RefreshDmLib()
		local ItemLib = DmkjConf.ItemLibs[dval.dmLib]
		if not ItemLib then 
			System.trace("Error: set dmkj lib error, libId="..dval.dmLib)
			return nil
		end
		--DmkjFun.InitDmkjParam() --初始化各概率参数
		return dval.dmLib
	end,
	
	--获取盗梦库
	GetDmLib = function (sysarg)
		if sysarg then
			local aSval = Actor.getStaticVar(sysarg)
			if aSval.FirstDm == nil then
				local lib = DmkjConf.FirstDmIndex
				if lib > 0 then
					--print("FIRST.....................")
					return lib
				end
			end
		end
		local dval = System.getDyanmicVar()
		local dmLib = dval.dmLib 
		if dmLib == nil or dmLib == 0 then
			dmLib = DmkjFun.SetDmLib()
		end
		return dmLib
	end,
}



--刷新物品
DmkjOpFuncList[DmkjOpId.enRefresh] = function (sysarg,args)
--print("DmkjOpFuncList[DmkjOpId.enRefresh]:")
	local mt = args[2]	--梦境类型
	local force = args[3]	--是否强制刷新
	if force > 0 then force = true else force = false end
	--print(force)
	
	--if (mt > #DmkjConf.ItemList or mt<=0) then
	if (mt > MAX_DMKJ_MJ or mt <= 0) then
		return
	end
	
	local libId = DmkjFun.GetDmLib(sysarg)	--获取盗梦库
	
	--参数错误
	if libId == nil or (libId > #DmkjConf.ItemLibs or libId<=0) then
		System.trace("Error: dmkj lib error")
		return
	end
	
	--print("libId:"..libId)
	--print("bInit:"..bInit)
	--[[
	if force == 0 then
		--判断时间到了没
		if Dmkj.isTimeOk(sysarg) then
			DmkjFun.RefreshAllItem(sysarg)
			Dmkj.setNextTime(sysarg)	--修改下次刷新的时间
		end

	else
		if Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO) < DmkjConf.RefreshYb[mt] then
			local str = string.format(Lang.ScriptTips.dm001,DmkjConf.RefreshYb[mt])
			Actor.sendTipmsg(sysarg,str,ttDialog)
			return
		end
		local logName = DmkjConf.MjName[mt].."_r"
		Actor.changeMoney(sysarg,mtYuanbao,-1*DmkjConf.RefreshYb[mt],GameLog.clDmkjConsumeMoney,logName)
		--DmkjFun.RefreshItem(sysarg,mt, libId)
	end
	--]]
	
	Dmkj.refreshItemList(sysarg, libId, mt, force)
end

function GetDmkjRandTableIndex()
	-- 获得百服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() == 1 then
		return 5 -- 百服活动
	end
	
	-- 是否在月度活动时间内
	if IsMonthActivityTime() then
		return 5 -- 月度活动
	end
	
	local nHeQuDays = System.getDaysSinceCombineServer() --合区天数
	--if nHeQuDays > 0 and nHeQuDays <= DmkjConf.CombineServerActivityDayCount then
	if nHeQuDays > 0 then
		return 4 -- 合区活动
	end
				
	local nOpenDays = System.getDaysSinceOpenServer() --开区天数
	if nOpenDays >= 8 then
		return 3
	elseif nOpenDays >= 3 then
		return 2
	else
		return 1
	end
end


DmkjFun.addList = function(sysarg, NumberList, i, Temp_NumberList, onForOk)
	local c = NumberList[i].number;	--赋值c = 当前字列表次数统计
	if not Temp_NumberList[c] then --判断临时列表里是否存在c次的列表
		Temp_NumberList[c] = {};	--创建空的c次列表
		Temp_NumberList[c].n = c;	--创建c列表里的n = c次数记录
	end
	if NumberList[i].number == Temp_NumberList[c].n then
		table.insert(Temp_NumberList[c],{ itemid = NumberList[i].itemid, rate = 1, prompt = NumberList[i].prompt});	--把c次列表插入数据到c次列表中
	end

	local a,b = math.modf(get_d_val(sysarg,199) / Temp_NumberList[c].n);
	if b == 0 and get_d_val(sysarg,199) ~= 0 then
		onForOk = Temp_NumberList[c].n;
	end
	return NumberList, i, Temp_NumberList, onForOk;
end

-- mt 寻宝类型(在活动期间, 1龍装, 2传世, 3龙腾, 4普天, 非活动期间无用)
DmkjFun.StartXB = function(sysarg,mt,index,TreasureTime,TreasureType)

	local dVar = Actor.getDyanmicVar(sysarg)
	if not dVar.XBFlag then return end
	
	local nDays = System.getDaysSinceOpenServer();	--开区天数
	local nHeQuDays = System.getDaysSinceCombineServer();	--合区天数
	local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)

    
	--抽奖记录
	local var = Actor.getStaticVar(sysarg)
	
	------------------合服活动使用的，记录寻宝次数-------------------
	if var.newdays==nil then 
		var.newdays={}
	end
	if var.newdays.XunBaoTime==nil then var.newdays.XunBaoTime=0 end
	var.newdays.XunBaoTime =var.newdays.XunBaoTime +1
	------------------合服活动使用的-------------------
	
	--var.TodayDmkjMoney = (var.TodayDmkjMoney or 0) + 200 			--今天寻宝花费的元宝数量 
	--var.DmkjAwardCount = (var.DmkjAwardCount or 0) + 1				--寻宝次数,用于特殊概率

    if var.dmkjtablemoney == nil then
        var.dmkjtablemoney = {}

    end
      --存十个表
     local szLog = "ActorId:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
     for i =1,10 do
        if  var.dmkjtablemoney[i] == nil then
             var.dmkjtablemoney[i] = 0
        end
        var.dmkjtablemoney[i] = var.dmkjtablemoney[i] + 200
        szLog = szLog.."nindex:"..i.."="..var.dmkjtablemoney[i]
     end
 --    System.trace(szLog)
--	if not var.TodayDmkjRecord then
--		var.TodayDmkjRecord = {}

--	end
	--######################这次分表了#####################################
	
	--先是取总表
	local sVar = System.getStaticVar()
	-- var.DmkjConfigIndex = var.DmkjConfigIndex or 1
	-- local tBaseTable = NewTableConfig[var.DmkjConfigIndex]
	local nIndex = 1
	-- if sVar.ZhouNianActState then			--双12
	-- 	nIndex = 2
	-- end

	local tBaseTable = NewTableConfig[nIndex][1]

     local bQingDianAct = true
	local svar = System.getStaticVar()
	
	if svar.QingDian_openDay==nil then 
		bQingDianAct = false
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.QingDian_openDay~=nil and svar.isDringQingDianActivity>svar.QingDian_openDay then 
		bQingDianAct = false
	end
	--一次的换个表

	if TreasureTime == 1 then tBaseTable = OneTimeDmkjConfig[nIndex][1] end
    --bQingDianAct = false
    if bQingDianAct == true then
    	local qingDian_type = svar.QingDian_type
    	if qingDian_type == nil then
    		svar.QingDian_type = 0 --幻羽庆典
    		qingDian_type = 0
    	end
    	
    	-- 1时装庆典, 2龙装庆典, 3法宝庆典, 4传世庆典
    	if qingDian_type >= 1 and qingDian_type <= 4 then
    		-- mt 寻宝类型(在活动期间, 1龍装, 2传世, 3龙腾, 4普天, 非活动期间无用)
    		if mt == 1 then
    			tBaseTable = LongZhuangQingDianDmkjConfig[nIndex][1]    			
    		elseif mt == 2 then
    			tBaseTable = LegendQingDianConfig[nIndex][1]
    		elseif mt == 3 then
    			tBaseTable = FashionQingDianConfig[nIndex][1]    			
    		elseif mt == 4 then
    			tBaseTable = MagicQingDianConfig[nIndex][1]
    		else
    			tBaseTable = MagicQingDianConfig[nIndex][1]
    		end    			
    	else -- 普通活动
    		tBaseTable = QingDianDmkjConfig[nIndex][1]
    	end
    end
	
    --在春节活动 就用法宝庆典
    if is_spring_festival_time() == true then
        tBaseTable = MagicQingDianConfig[nIndex][1]--法宝庆典
    end
	--[[ 这些活动已经过了
	--周年庆活动
	if (svar.StartOneYear_OpenDay==nil or svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay)==false then 
		tBaseTable = OneYearActivityDmkjConfig[nIndex][1]
	end
	
	
	
	--春节活动
	local springOpenDay = get_spring_festival_day_count()
	
	if springOpenDay>12 then 
		--什么都不做
	elseif springOpenDay>9 then 
		tBaseTable = LegendQingDianConfig[nIndex][1]--传世庆典
	elseif springOpenDay>6 then 
		tBaseTable = MagicQingDianConfig[nIndex][1]--法宝庆典
	elseif springOpenDay>3 then 
		tBaseTable = LongZhuangQingDianDmkjConfig[nIndex][1]--龙装庆典
	elseif springOpenDay>=1 then 
		tBaseTable = FashionQingDianConfig[nIndex][1]--时装庆典
	end
	--]]
	 
	if not tBaseTable then
		print("ERR!!!actor[" .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID) .. "] StartXB table [" .. nIndex .. "] not exist")
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf684, ttDialog)
		return
	end   
    
	--取合服表
	local tFirstTable
	--if System.getDaysSinceCombineServer() > 0 and System.getDaysSinceCombineServer() <= 5 then
	--合服之后都用这个表
	if System.getDaysSinceCombineServer() > 0 then
		tFirstTable = tBaseTable[2]
        
	else
		tFirstTable = tBaseTable[1]
	end

	if not tFirstTable then
		print("ERR!!!actor[" .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID) .. "] StartXB table tFirstTable not exist")
		Actor.sendTipmsg(sysarg, "合服表错误！", ttDialog)
		return
	end
	

	

	local bGetItem = false
   
                     
	--判断是否在百服活动中
	--local bInHundredAct = false
--	if sVar.HundredActState == 1 then
--		bInHundredAct = true
--	end
    local dayconfig = tFirstTable
   
	--for _, dayconfig in pairs(tFirstTable) do
		--检查开服天数
    local EnterCfg = nil
    --前三个为职业寻宝配置，从第四个开始
    if var.dmkjex == nil then
        var.dmkjex = {}
        var.dmkjex.count = 0    --寻宝次数
        var.dmkjex.limit = 0 --进入次数
        var.dmkjex.nextenter =false
    end
     var.dmkjex.count =   var.dmkjex.count + 1

    local needCfg = dayconfig.items[job][2]
    local bClearZero = false
    local bClearNextEnter = true
    local bGiveItem  = false
   local nTableMoneyIndex = 0
   local nTableMoney = 0
    if needCfg ~= nil then
        -- print("寻宝次数:"..var.dmkjex.count)
         local bEnter = false
         local needmaxcount = needCfg.maxcount
         
         if needmaxcount == nil then
            needmaxcount = needCfg.money / 200
         end
         local needcount = needCfg.count
         if needcount == nil then
            needcount = needmaxcount
         end
         if var.dmkjex.count == needmaxcount then
            bEnter = true
        elseif var.dmkjex.nextenter == true then
            bEnter = true 
         elseif var.dmkjex.count  > needcount then
           
            local nRand =  System.getRandomNumber(needCfg.prob)
            if nRand == 0 then
                bEnter = true
            end
         end
          if  bEnter == true then
              EnterCfg = dayconfig.items[job][2]
              bClearZero = true
            --  print("使用寻宝次数配置表")
             --print("次数:"..var.dmkjex.count.."总次数"..needCfg.maxcount.."是否进入:"..tostring(var.dmkjex.nextenter).."几率:"..needCfg.prob)
          end
    end
    local nIndex = 3
  -- print("寻宝次数:"..var.dmkjex.count.."zero:"..tostring(bClearZero).."需要次数:"..needCfg.maxcount)
   
    if EnterCfg == nil then
         local nTempTable = 1
        if dayconfig.items[job][3] ~= nil then
            while true do
                local config = dayconfig.items[job][nIndex]
                if config ~= nil then
                    if config.money ~= nil  and var.dmkjtablemoney[nTempTable] ~= nil and var.dmkjtablemoney[nTempTable]>= config.money  then
                        if System.getRandomNumber(config.prob) == 0 then
                            nTableMoneyIndex = nTempTable
                            nTableMoney = config.money
                            EnterCfg = dayconfig.items[job][nIndex]
                            --print("start nTableMoneyIndex"..nTableMoneyIndex.."nTableMoney"..nTableMoney)
                            break
                                                
                         end
                    end   
                    --次数
                    if config.count ~= nil  and   var.dmkjex.count >= config.count then
                        local nRand =  System.getRandomNumber(needCfg.prob)
                        if nRand == 0 then
                            nTableMoneyIndex = nTempTable
                            nTableMoney = config.money
                            EnterCfg = dayconfig.items[job][nIndex]
                       
                            break
                        end
                    end            
                end
              
                if config == nil then
                    nIndex = 9999
                    nTableMoneyIndex = 0
                    nTableMoney = 0                 
                    break
                end
                nIndex = nIndex + 1
                nTempTable = nTempTable + 1
            end
            if nIndex == 9999 then
                  EnterCfg = dayconfig.items[job][1]
            end
           
        elseif bClearZero == false then
             EnterCfg = dayconfig.items[job][1]
        end
    end  

		if nDays <= dayconfig.openday then
           config = EnterCfg
				--检查消费数量和已经进入次数, 寻宝次数, 是否已经获取
				--消费数量超过一定值,会有几率进入某些表,
				--寻宝次数超过一定值,会有几率进入某些表,
				--寻宝次数达到一定值,则必定会进入某些表.
				--但是这些表相互独立,所以要同时判断.
                local bEnter =  true
                local bMust = true
                if bClearZero == true then bEnter = true ; bMust = true end
				if bEnter == true then
					--随机进入
					--如果配置了最大次数,则必定进入
					if System.getRandomNumber(config.prob) == 0 or bMust then
                        
                        local bBreak = false
                        while true do
                       
                            if bBreak == true then break end
                           
                            for _, item in pairs(config.items) do
                                
							    if bGetItem then bBreak = true break end
								if item.prob ~= 0 then
                                     
									 if System.getRandomNumber(item.prob) == 0 and not bGetItem then 
                                        if item.itemid == 6362 or item.itemid == 6945 or item.itemid == 6946 then --至尊屠龙刀
                                            if var.godtldrate == nil then var.godtldrate = 0 end
                                            if var.godtldrate > 0 and var.godtldrate < #GodTuLongDaoRate then
                                               if System.getRandomNumber(GodTuLongDaoRate[var.godtldrate]) == 0 then
                                                   bGetItem = true 
                                               end   
                                            else
                                                bGetItem = true   
                                            end
                                            var.godtldrate = var.godtldrate + 1
                                        elseif item.itemid == 6947 or item.itemid == 6948 or item.itemid == 6949 or item.itemid == 6950 or item.itemid == 6951 or item.itemid == 6952 then --首饰
                                            if var.godtldrateex == nil then var.godtldrateex = 0 end
                                            if var.godtldrateex > 0 and var.godtldrateex < #GodTuLongNickRate then
                                               if System.getRandomNumber(GodTuLongNickRate[var.godtldrateex]) == 0 then
                                                   bGetItem = true 
                                               end   
                                            else
                                                bGetItem = true   
                                            end
                                            var.godtldrateex = var.godtldrateex + 1
                                        else
                                            bGetItem = true 
                                        end
                                        
                                     end
								end
							    if bGetItem then
                                    bGiveItem = true
								    local addqd = 0;
								    if item.qiangdu and item.qiangdu == 1 then
									    addqd = math.random(1,6);
								    end
                                     --记录八转以上的道具信息
                                    if Item.getItemPropertyById(item.itemid,Item.ipItemNeedCircle) > 8 then
                                        local szLog = "Actorid:%d itemid:%d nIndex:%d nTableMoney:%d nTableMoneyIndex:%d"
--                                        System.trace(string.format(szLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),item.itemid,nIndex,nTableMoney,nTableMoneyIndex))
                                        if var.dmkjtablemoney[nTableMoneyIndex] ~= nil then
                                            System.trace("count:"..var.dmkjtablemoney[nTableMoneyIndex].."nTableMoney"..nTableMoney)
                                        end
                                    end
								    Dmkj.addItem(sysarg,item.itemid,item.count,0,0,0,0,0,addqd);	
								    Dmkj.addLog(sysarg, TreasureType, 0, item.itemid, item.notice);
                               
                                    if item.broadcast then
                                        local nItemType = Item.getItemPropertyById(item.itemid,Item.ipItemType)
                                        local nCircle = Item.getItemPropertyById(item.itemid,Item.ipItemNeedCircle)
                                       -- System.trace("类型:"..nItemType.."转生等级:"..nCircle)
                                        local bBracast = false
                                        local szBracast = ""
                                        if nCircle >= 7 and nCircle <= 9 then
                                            if nItemType == 1 then
                                                bBracast = true
                                                szBracast = "<(c0xFFffd658)天降神兵!><(c0xFF00c0ff)%s区><(c0xFFffd658)玩家><(c0xFF00c0ff)%s><(c0xFFffd658)在探宝中寻到><(c0xFFFF0000)%s><(c0xFFffd658)!><(c0xFFffd658)如有神助!>"
                                            elseif nItemType == 2 then
                                                bBracast = true
                                                 szBracast = "<(c0xFFffd658)吓到宝宝了!><(c0xFF00c0ff)%s区><(c0xFFffd658)玩家><(c0xFF00c0ff)%s><(c0xFFffd658)在探宝中寻到><(c0xFFFF0000)%s><(c0xFFffd658)!><(c0xFFffd658)全服玩家发来贺电!>"
                                            end
                                        end
                                        if bBracast == false then
                                            szBracast = "<(c0xFFffd658)额滴个神呐!><(c0xFF00c0ff)%s区><(c0xFFffd658)玩家><(c0xFF00c0ff)%s><(c0xFFffd658)在探宝中寻到><(c0xFFFF0000)%s><(c0xFFffd658)!><(c0xFFffd658)这是要干大事的节奏吗?>"
                                        end
                                        local szLocalServer = ""
                                        local nLocalServerId = 0
                                        if System.isCrossServer() then
                                        	nLocalServerId = Actor.getActorRawServerId(sysarg)
                                        else
                                        	nLocalServerId = System.getLocalServerId()
                                        end
                                        szLocalServer = tostring(nLocalServerId)
                
								 	    System.SendPlatformMsg(string.format(szBracast, szLocalServer, Actor.getName(sysarg), Item.getItemName(item.itemid)), ttMousePosTip)
                                    end

								 
							    end
                               
						    end
                            if bBreak == true then
                                break
                            end
                           
                             if bGetItem == false and nIndex ~= 9999 then  
                                
                                nTableMoneyIndex = 0
                                nTableMoney = 0
                                local nAddIndex = nIndex + 1
                                local nTempTable = nAddIndex - 3
                                while true do
                                    config = dayconfig.items[job][nAddIndex]
                                    if config ~= nil then
                                        
                                        if config.money ~= nil  and var.dmkjtablemoney[nTempTable] ~= nil and var.dmkjtablemoney[nTempTable]>= config.money  then
                                            if System.getRandomNumber(config.prob) == 0 then
                                                nIndex = nAddIndex
                                                nTableMoneyIndex = nTempTable
                                                nTableMoney = config.money
                                                 -- print("end nTableMoneyIndex"..nTableMoneyIndex.."nTableMoney"..nTableMoney)
                                                break
                                                
                                            end
                                        end 

                                        --次数
                                        if config.count ~= nil  and  var.dmkjex.count >= config.count then
                                            local nRand =  System.getRandomNumber(needCfg.prob)
                                            if nRand == 0 then
                                                nIndex = nAddIndex
                                                nTableMoneyIndex = nTempTable
                                                nTableMoney = config.money
                       
                                                break
                                            end
                                        end         
                                    end
                                    if config == nil then
                                        nIndex = 9999
                                        
                                        break
                                    end
                                    nAddIndex = nAddIndex + 1
                                    nTempTable = nTempTable + 1
                                end
                                 
                               if nIndex == 9999 then
                                   
                                    config = dayconfig.items[job][1]
                                    bClearZero = false
                                else
                                    config = dayconfig.items[job][nIndex]
                               end 
                                bClearNextEnter = false
                            end
                        end
						
					end
				end
			end
			--break
		--end
	--end
	if bClearNextEnter then
        var.dmkjex.nextenter = false
       
    end
	if dVar.XBFlag and index == dVar.XBFlag then 
		dVar.XBFlag = nil 
	end
    --寻到了东西，清空
    if bClearZero == true and bGiveItem == true then
        var.dmkjex.count = 0    --寻宝次数
        var.dmkjex.limit = 0 --进入次数
    end
    if bGiveItem == true and nTableMoneyIndex  > 0 and  nTableMoney > 0 then 
 
       -- var.dmkjtablemoney[nTableMoneyIndex] = var.dmkjtablemoney[nTableMoneyIndex] - nTableMoney
        var.dmkjtablemoney[nTableMoneyIndex]  = 0
    end
	OnFinish_Liveness(sysarg,15)

end

-- 当天时否在庆典活动期间
function dmkj_is_qingdian_open_time()
	local svar = System.getStaticVar()
	if svar.QingDian_openDay == nil then 
		return false
	end
	
	local curOpenDay = svar.isDringQingDianActivity
	if curOpenDay == nil or curOpenDay < 1 or curOpenDay > svar.QingDian_openDay then 
		return false
	end
	
	return true
end

--寻宝
DmkjOpFuncList[DmkjOpId.enDm] = function (sysarg,args)
	local mt = args[2]		--寻宝类型(在活动期间, 1龍装, 2传世, 3龙腾, 4普天, 非活动期间无用)
	local TreasureType = args[3];	--类型1,2,3 = 1,10,50
	local TreasureGold = args[4];	--消耗类型 0:元宝 1:宝藏钥匙860
	local TreasureTime = 1;
	local Gold = 200;
	--Dmkj.clearDmkjLog(); 清理全服寻宝信息
	if TreasureType == 1 then
		TreasureTime = 1;
		Gold = 200;
	elseif TreasureType == 2 then
		TreasureTime = 10;
		Gold = 1950;
	elseif TreasureType == 3 then
		TreasureTime = 50;
		Gold = 9500;
	end

	if Dmkj.getStoreRestCount(sysarg) < TreasureTime then
		Actor.sendTipmsg(sysarg,string.format("您的宝藏仓库格子不足%s,清理后再来继续吧.",TreasureTime),256)
		return;
	end

	local item = DmkjConf.DmParam[1][TreasureType].item
	if not item then return end
	
	local var = Actor.getStaticVar(sysarg)
	
    local nItemCount = Actor.getItemCount(sysarg,item.id)
	if nItemCount >= TreasureTime then
		if Actor.removeItem(sysarg,860,TreasureTime) ~= TreasureTime then
			--print("remove itemid = 860 error , Actor ID = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return
		end
        local dmkjYb = var.dmkjYb
		if dmkjYb == nil then
			dmkjYb = nItemCount * 200
		else
			dmkjYb = dmkjYb + nItemCount * 200
		end
		
		var.dmkjYb = dmkjYb

        -- 称号:寻宝不归路 (探索宝藏累计消费达到1000000元宝)
		if dmkjYb >= 1000000 and not Actor.hasTopTitle(sysarg, Title.DmkjYb) then
			Actor.setTopTitle(sysarg, Title.DmkjYb, true)
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "挥金如土"), ttFlyTip)
		end
	else
        Actor.sendTipmsg(sysarg,"宝藏钥匙不足"..TreasureTime.."个,可在商城-常用道具中购买！",ttFlyTip)
        return
--		if Actor.getMoneyCount(sysarg,3) < Gold then
--			Actor.sendTipmsg(sysarg,string.format("您的元宝不足<(c0xFFFF0000)%s>,探宝失败.",Gold),256);
--			return;
--		end

--		local bResult = Actor.changeMoney(sysarg,3,-Gold,GameLog.clDmkjConsumeMoney,"寻宝");
--		if bResult == false then return end

--		local dmkjYb = var.dmkjYb
--		if dmkjYb == nil then
--			dmkjYb = Gold
--		else
--			dmkjYb = dmkjYb + Gold
--		end

--		var.dmkjYb = dmkjYb

--		-- 称号:寻宝不归路 (探索宝藏累计消费达到1000000元宝)
--		if dmkjYb >= 1000000 and not Actor.hasTopTitle(sysarg, Title.DmkjYb) then
--			Actor.setTopTitle(sysarg, Title.DmkjYb, true)
--			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.gettitle, "挥金如土"), ttFlyTip)
--		end
	end
	
	-- 每次成功寻宝直接增加宝藏积分，供宝库兑换使用。
	if var.TreasureHuntValue == nil then
		var.TreasureHuntValue = TreasureTime
	else
		var.TreasureHuntValue = var.TreasureHuntValue + TreasureTime
	end
	
	if System.getDaysSinceCombineServer() <= 5 then
		if not var.CombineLotteryScore then
			var.CombineLotteryScore = 0
		end
		var.CombineLotteryScore = var.CombineLotteryScore + TreasureTime		
	end

	-- @[刷新界面上的积分显示]
	local dVar = Actor.getDyanmicVar(sysarg)
	if not dVar.XBFlag then
		dVar.XBFlag = TreasureTime
	end


   
	for i = 1,TreasureTime do
		DmkjFun.StartXB(sysarg,mt,i,TreasureTime,TreasureType);	--开始寻宝
	end
	
	--合服寻宝返利
	SendHFTheInfo(sysarg,8)

    local npack = DataPack.allocPacket(sysarg,36,2);
	if npack == nil then return end

	DataPack.writeByte(npack, 1);
	DataPack.writeInt(npack, var.TreasureHuntValue);	--宝藏积分
	DataPack.writeWord(npack, Dmkj.getStoreRestCount(sysarg));	--宝藏仓库格子数	
	DataPack.writeUInt(npack, var.dmkj_qingdian_point or 0) -- 珍宝积分
	DataPack.flush(npack);
end

--寻宝 函数 2016-10-16 编辑：zer
DmkjFun.comps = function(a,b)
	return a.rate > b.rate
end

--下发首页数据
DmkjOpFuncList[DmkjOpId.enIndex] = function (sysarg,args)
	--print("DmkjOpFuncList[DmkjOpId.enIndex]")
	--下发梦阶值
	----print("send dmkj index")
	DmkjOpFuncList[DmkjOpId.enAward](sysarg,{})
	
	
	--下发抽奖的20个物品列表
	DmkjOpFuncList[DmkjOpId.enRefresh](sysarg,{0,1,0}) 	--只下发不重刷
	
	local var = Actor.getStaticVar(sysarg)
	if not var.TreasureHuntValue then 
	   var.TreasureHuntValue = 0 
	end
	local TreasureHuntValue = var.TreasureHuntValue
	--下发配置信息
	local npack = DataPack.allocPacket(sysarg,36,8)	--
	if npack == nil then return end
	
	--先下发梦阶数过去
	local count = table.getn(DmkjConf.DmParam)
	
	DataPack.writeUInt(npack,TreasureHuntValue)
	DataPack.writeByte(npack,count)
	
	for i = 1,count do
		local data = DmkjConf.DmParam[i]
		for j = 1,#data do
			DataPack.writeInt(npack,data[j].yb)
		end
	end
	
	for i = 1,#DmkjConf.MjAward do
		DataPack.writeInt(npack,DmkjConf.MjAward[i].sp)
	end

	DataPack.writeInt(npack,0)
	DataPack.writeUInt(npack, var.dmkj_qingdian_point or 0) -- 珍宝积分
	DataPack.flush(npack)
	
	--下发日志
	Dmkj.sendAllLog(sysarg,0)
end

--下发梦阶值和下一级可以获取到的物品
DmkjOpFuncList[DmkjOpId.enAward] = function (sysarg,args)
	local npack = DataPack.allocPacket(sysarg,36,3)	--下发梦阶值
	if npack == nil then return end
	local var = Actor.getStaticVar(sysarg)
	local mj = 0
	if var.days.dmkjmj ~= nil then
		mj = var.days.dmkjmj
	end
	DataPack.writeInt(npack,mj)
	
	local itemid = nil
	--看看可以领取什么奖品
	for i = 1,#DmkjConf.MjAward do
		if mj < DmkjConf.MjAward[i].sp then
			itemid = DmkjConf.MjAward[i].itemid
			break
		end
	end
	if itemid ~= nil then
		DataPack.writeWord(npack,itemid)
	else
		DataPack.writeWord(npack,0)
	end
	DataPack.flush(npack)
end

--宝藏积分兑换物品
DmkjOpFuncList[DmkjOpId.enExChangeItem] = function (sysarg,args)
	
	local nType = args[2]
	local nId = args[3]
	if not TreasureIntegral then return false end
	
	--  < 0 为月度活动才开放的物品
	if nId < 0 and (not IsMonthActivityTime()) then		
		return
	end

	local config
	for key ,value in ipairs(TreasureIntegral) do
		if value.type == nType then
			for id, data in ipairs(value.ExChangeData) do
				if data.id == nId then
					config = data
					break
				end
			end
		end
	end
	
	if not config then return false end

	local var = Actor.getStaticVar(sysarg)
	if not var.TreasureHuntValue then 
	   var.TreasureHuntValue = 0 
	end
	local nTreasureHuntValue = var.TreasureHuntValue
	
	if nTreasureHuntValue < config.needScore then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf131,ttFlyTip)
		return false
	end
	
	if Awards.CheckBagGridCount(sysarg,config.award) == false then
		return false
	end

	--检查消耗
	local consumeData = {}
	local isok = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
    
	if isok == false then return end
  
	--扣除消耗
	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	local nLucky = 0
	local nSuperLevel = 0
	local nTaoStrong = 0
  
	for _,item in ipairs(config.consume) do
		if item then
			if item.type == 0 then
                local bFind = false
                local bagCount = Item.getBagItemCount( sysarg )  --玩家背包装备数
                for i = 1,bagCount do
                    local bagEquipPtr = Item.getBagItemBySortID( sysarg, i )
                    local nItemId = Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemID)
                    if nItemId == item.id then
                       
                        local itemType = Item.getItemProperty(sysarg, bagEquipPtr, Item.ipItemType, 0)
					    if (itemType > Item.itUndefinedType and itemType < Item.itEquipMax) or itemType == 106  then --106为龙装材料
                            local nTempSuperLevel = Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemSuperAttrLevel)
                            local nDragonEquip = Item.getItemProperty(sysarg,bagEquipPtr,Item.ipDragonEquipLevel)
                    
                             if nTempSuperLevel == 0 and nDragonEquip == 0 then
                                nItem = bagEquipPtr
                                bFind = true
                                break

                             end

                        end
                    end
                end
                if bFind == false then
                    Actor.sendTipmsg(sysarg,"材料不足,无法兑换!",ttFlyTip)
                    return

                end

				--local nItem = Item.getBagItemPtrById(sysarg,item.id)
				if nItem then
					local itemType = Item.getItemProperty(sysarg, nItem, Item.ipItemType, 0)
					if itemType > Item.itUndefinedType and itemType < Item.itEquipMax  then
						local nTempStrong = Item.getItemProperty(sysarg,nItem,Item.ipItemStrong)
						local bTempBlood = Item.getItemProperty(sysarg,nItem,Item.ipItemAppraisal)
						local nTempStrongLimit = Item.getItemProperty(sysarg,nItem,Item.ipItemStrongLimit)
						local nTempLucky = Item.getItemProperty(sysarg,nItem,Item.ipItemLuck)
						local nTempSuperLevel = Item.getItemProperty(sysarg,nItem,Item.ipItemSuperAttrLevel)
                        local nTempTaoStrong = Item.getItemProperty(sysarg,nItem,Item.ipTaoStrong)
						if nTempStrong > nStrong then
							nStrong = nTempStrong
							nStrongLimit = nTempStrongLimit
						end
						if bTempBlood > nBlood then
							nBlood = bTempBlood
						end
						if nTempLucky > nLucky then
							nLucky = nTempLucky
						end
						if nTempSuperLevel > nSuperLevel then
							nSuperLevel = nTempSuperLevel
						end			
                        
                        if nTempTaoStrong > nTaoStrong then
                            nTaoStrong = nTempTaoStrong
                        end			
					end
					if Actor.removeItemByPtr(sysarg,nItem,item.count) ~= item.count then
						System.trace("removePtr error")
						return
					end
				end
			end
		end	
	end
	
	var.TreasureHuntValue = nTreasureHuntValue - config.needScore
	
	local award = config.award[1]
	
	local nNewItem = Item.createItem(award.id,award.count,nStrong,0,award.bind)
	Item.addItem(sysarg,nNewItem,"enExChangeItem",997)
    local nItemType = Item.getItemProperty(sysarg,nNewItem,Item.ipItemType)
  
    --除了功能物品之外都可以继承属性
    if nItemType ~= Item.itFunctionItem then
        Item.setItemProperty(sysarg, nNewItem, Item.ipItemLuck, nLucky);
    
        Item.setItemProperty(sysarg, nNewItem, Item.ipTaoStrong, LocalDT.IsFixedTaoStrongEquipment(award.id) and 6 or nTaoStrong);
	    if Item.getItemProperty(sysarg,nNewItem,Item.ipItemType) < Item.itEquipMax then
		    Item.setItemProperty(sysarg, nNewItem, Item.ipItemStrongLimit, nStrongLimit);
	    end
	    Item.setItemProperty(sysarg, nNewItem, Item.ipItemAppraisal, nBlood);
	    Item.setItemProperty(sysarg, nNewItem, Item.ipItemSuperAttrLevel, nSuperLevel);
    end
   
	
	--Actor.addItem(sysarg,award.id,0,nStrong,award.count,award.bind,0,"enExChangeItem",997,-1,nBlood,nStrongLimit)
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf168,Item.getItemName(config.award[1].id)),ttScreenCenterBigNotice)
	
	local netPack = DataPack.allocPacket(sysarg, 36, 10)
	if netPack ~= nil then 
		DataPack.writeInt(netPack, var.TreasureHuntValue)
		DataPack.writeUInt(netPack, var.dmkj_qingdian_point or 0) -- 珍宝积分
		DataPack.flush(netPack)
	end
		--添加全服公告
	local str = string.format(Lang.ScriptTips.zf676,Actor.getName(sysarg),Item.getItemName(config.award[1].id))
	Dmkj.addIntegralNotice(sysarg,str)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeDmkj, EventCallDispatcher.HandlerDmkjOp)

--初始化配置
--Dmkj.setDmkjTimeLimitItem(DmkjConf.TimeLimitItem.item1,DmkjConf.TimeLimitItem.item2,DmkjConf.TimeLimitItem.hour)

--刷新随机库 每天晚上0点调用  GM命令:  @callf sys RefreshDmkjLib
function RefreshDmkjLib()
	if DmkjFun.SetDmLib() == nil then return end
	Dmkj.clearDmkjAllItem()			--清空全服盗梦列表
	Dmkj.clearDmkjLog()				--清空全服log
	Dmkj.saveItemConsumeMap()		--保存道具元宝消耗
	--Dmkj.sendRequireAllRefresh()	
	local players = LuaHelp.getAllActorList()
	if players then
		for k, v in ipairs(players) do
			Dmkj.sendRequireRefresh(v)	--请求在线玩家刷新盗梦列表
		end
	end
end
--[[
--删除没用的数据
function DeleteDirtyData()
	local staticVar= System.getStaticVar()
	if staticVar.dmkj_yb_count then
		staticVar.dmkj_yb_count = nil --盗梦空间全服消耗的元宝的数目 （因使用新结构保存每个物品原本，因此重置此数据）
	end
	if staticVar.dmkj_items then
		staticVar.dmkj_items = nil
	end
end
DeleteDirtyData()	--删除没用的数据
--]]


--清空盗梦仓库  GM命令：@call sys ClearDmkjStore
ClearDmkjStore = function(sysarg)
	Dmkj.clearStore(sysarg);
end

--清空全服消耗的元宝的数目  GM命令：@call sys ClearDmkjUsedYb
ClearDmkjUsedYb = function()
	local staticVar= System.getStaticVar()
	if staticVar.used_dmkj_yb_count then
		staticVar.used_dmkj_yb_count = nil --盗梦空间全服消耗的元宝的数目 （因使用新结构保存每个物品原本，因此重置此数据）
	end
end

--清除梦阶值 GM命令：@call sys ClearDmkjMj
ClearDmkjMj = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	var.days.dmkjmj = nil
end

--清除第一次盗梦标志 GM命令：@call sys ClearFirstDm
ClearFirstDm = function(sysarg)
	local aSval = Actor.getStaticVar(sysarg)
	aSval.FirstDm = nil
end

--回收物品
DmkjOpFuncList[DmkjOpId.enRecycleItem] = function (sysarg,args)
	DmkjRecycleItem(sysarg,args)
end

--优先随机物品，返回抽中的物品ID，返回0则没有抽中
function DmkjFirstRandItem(sysarg, randval)
	-- 不中
	if randval > DmkjConf.FirstRandItemList.rand then		
		return 0
	end
		
	-- 抽中一个物品，则看抽中的是哪个物品
	local rnd = System.getRandomNumber(10000)
	for i,v in ipairs(DmkjConf.FirstRandItemList.items) do
		if rnd >= v.rand[1] and rnd <= v.rand[2] then
			return v.itemId -- 抽中该字帖
		end
	end
	
	return 0
end

--集字活动，返回抽中的字帖ID，返回0则没有抽中
function DmkjRandCharItem(sysarg, randval)
	if not CharItemActivityCfg.isOpen then
		return 0 -- 活动没有开启
	end
	
	-- 不中
	if CharItemActivityCfg.dmkjCharItemRand == 0 or randval > CharItemActivityCfg.dmkjCharItemRand then		
		return 0
	end
	
--	if CharItemActivityCfg.gameIndex ~= 0 and System.GetGameIndex() ~= CharItemActivityCfg.gameIndex then
--		return 0 -- 集字活动不是该平台
--	end
	
	-- 非活动期间
	local time = CharItemActivityCfg.time
	if not System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59) then
		return 0
	end	
	
	-- 抽中一个字帖，则看抽中的是哪个字帖
	local rnd = System.getRandomNumber(10000)
	for i,v in ipairs(CharItemActivityCfg.dmkjCharItems) do
		if rnd >= v.rand[1] and rnd <= v.rand[2] then
			return v.itemId -- 抽中该字帖
		end
	end
	
	return 0
end

function OnMsgCharItemsExchange(sysarg, sysid, packet)	

	if not CharItemActivityCfg.isOpen then
		return -- 活动没有开启
	end
	
--	if CharItemActivityCfg.gameIndex ~= 0 and System.GetGameIndex() ~= CharItemActivityCfg.gameIndex then
--		return -- 集字活动不是该平台
--	end
		
	-- 非活动期间
	local time = CharItemActivityCfg.time
	if not System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59) then
		Actor.sendTipmsg(sysarg, "非活动期间不可进行字帖兑换。", ttFlyTip)
		return
	end	
	
	local var = Actor.getStaticVar(sysarg)
	local maxExchangeCount = var.days.spring_max_exchange_count
	if maxExchangeCount == nil then maxExchangeCount = 0 end
	
	local svar = System.getStaticVar()
	local maxCharExchangeCountList = svar.days.maxCharExchangeCountList
	if maxCharExchangeCountList == nil then
		svar.days.maxCharExchangeCountList = {}
		maxCharExchangeCountList = svar.days.maxCharExchangeCountList
	end
	
	local msgType = DataPack.readByte(packet) -- 1 为获得今日兑换数， 2 为对换字帖	
	
	if msgType == 1 then -- 获得今日兑换数
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
		DataPack.writeByte(netPack, 4) -- 4 新春集字
		DataPack.writeByte(netPack, 1) -- 1 下发数据
		DataPack.writeUInt(netPack, maxExchangeCount)
		
		-- 全服今日兑换次数(分档)
		local levelCount = 0
		if CharItemActivityCfg.maxExchangeCountServer >= 0 then			
			levelCount = #CharItemActivityCfg.charItems
		end
		
		DataPack.writeByte(netPack, levelCount)
		
		for i = 1, levelCount do
			local exchangeCountSvr = maxCharExchangeCountList[i]
			if exchangeCountSvr == nil then exchangeCountSvr = 0 end 
			DataPack.writeWord(netPack, exchangeCountSvr)
		end
		
		DataPack.flush(netPack)
		return
	end
	
	local exchangeType = DataPack.readByte(packet)	
		
	if CharItemActivityCfg.maxExchangeCount >= 0 and maxExchangeCount >= CharItemActivityCfg.maxExchangeCount then
		Actor.sendTipmsg(sysarg, "今日兑换对换次数已经为0。", ttFlyTip)
		return
	end		
	
	local cfg = CharItemActivityCfg.charItems[exchangeType]
	if cfg == nil then
		--print("error, CharItemActivityCfg exchangeType error, exchangeType="..exchangeType)
		return
	end
	
	-- 全服限制
	local exchangeCountSvr = 0
	if CharItemActivityCfg.maxExchangeCountServer >= 0 then
		exchangeCountSvr = maxCharExchangeCountList[exchangeType]
		if exchangeCountSvr == nil then exchangeCountSvr = 0 end
		if exchangeCountSvr >= CharItemActivityCfg.maxExchangeCountServer then		
			Actor.sendTipmsg(sysarg, "今日全服兑换对换次数已经为0。", ttFlyTip)
			return
		end
	end
	
	-- 收集的字帖可能是叠加的，就算扣除了也不可能有空格出来，所以要先检查够不够空格
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return
	end
	
	--检查字帖是否收集完
	for i,itemid in ipairs(cfg.items) do
		if Actor.getItemCount(sysarg, itemid) <= 0 then
			Actor.sendTipmsg(sysarg, "请您收集完字帖后再来兑换。", ttFlyTip)
			return
		end
	end
	
	for i,itemid in ipairs(cfg.items) do
		if Actor.removeItem(sysarg, itemid, 1, -1,-1,-1,"字帖兑换") <= 0 then
			Actor.sendTipmsg(sysarg, "删除字帖失败!", ttFlyTip)
			local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			print("delete item error, OnMsgCharItemsExchange actorid="..actorId..",charItem="..itemid)
			return
		end
	end
	
	if Awards.GiveNoCheck(sysarg, cfg.award, GameLog.cCharItemsExchange, tostring(exchangeType)) == false then
		Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, OnMsgCharItemsExchange actorid="..actorId..",exchangeType="..exchangeType)
		return
	end
	
	if CharItemActivityCfg.maxExchangeCount >= 0 then
		maxExchangeCount = maxExchangeCount + 1
		var.days.spring_max_exchange_count = maxExchangeCount
	end
	
	if CharItemActivityCfg.maxExchangeCountServer >= 0 then
		exchangeCountSvr = exchangeCountSvr + 1
		maxCharExchangeCountList[exchangeType] = exchangeCountSvr
	end

	local actorName = Actor.getName(sysarg)	
	Actor.sendTipmsg(sysarg, "兑换字帖奖励成功", ttFlyTip)	
			
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 4) -- 4 新春集字
	DataPack.writeByte(netPack, 2) -- 2 兑换字帖成功
	DataPack.writeByte(netPack, exchangeType)
	DataPack.writeUInt(netPack, maxExchangeCount)
	DataPack.writeUInt(netPack, exchangeCountSvr) -- 全服今日兑换次数
	DataPack.flush(netPack)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取了圣诞来袭集字有奖奖励，超级丰厚，<我也要领取/@@showWin,264,5>", Actor.getName(sysarg)), 2+128+2048)
end


function addbaozangjifen(sysarg,name,n)
	n = tonumber(n)
	local pActor = Actor.getActorByName(name)
	if pActor then
		local var = Actor.getStaticVar(pActor)
		if not var.TreasureHuntValue then 
			var.TreasureHuntValue = 0 
		end
		var.TreasureHuntValue = var.TreasureHuntValue + n
		Actor.sendTipmsg(sysarg,"添加积分成功",ttFlyTip)
	else	
		Actor.sendTipmsg(sysarg,"没有这个人或者对方已下线",ttFlyTip)
	end
end

--珍宝积分兑换为宝藏积分
DmkjOpFuncList[DmkjOpId.enQingdianPointExchange] = function (sysarg,args)
	local value = args[2] -- 兑换值
	if value <= 0 then return end
	
	qd_qingdian_point_exchange(sysarg, value)	
end