
--#include "data\config\misc\scriptTimerConfig\NoticeConfig.lua" once --自动发公告配置表
--#include "data\config\misc\scriptTimerConfig\CreateMonsterConfig.lua" once --自动刷怪配置表


--[[
	//系统提示的类型
	enum tagTipmsgType
	{
		ttInvalidTmType = -1, // 无效的Tipmsg类型
		ttTipmsgWindow =1, //只在右侧提示栏显示
		ttScreenCenter=2, //屏幕中央，用于xxx把xxx强化到6级之类的全服公告
		ttDialog =4,      //弹出框
		ttBroadcast =8,  //公告栏，用于GM发通知
		ttMessage = 16,	//短消息，在屏幕中央悬挂，点击后查看内容，
		ttWarmTip  =32,   //温馨提示
		ttGmTip = 64,	// Gm提示信息
		ttChatWindow =128, //左侧聊天栏里，用于一些系统公告在聊天栏显示
		//ttMaxTmType,		// 最大Tipmsg类型
	};
--]]

--[[
	自动执行公告函数
	tipsType:         公告类型 (1世界公告，2场景公告，3阵营公告)
	nLocation:        显示的位置
	nTargetParam:     发送目标参数(例如：阵营公告时填入阵营ID，场景公告时填入场景ID)
	nLevel:           发送的最低等级，默认是0
	nIndex:           第几个消息
	...：             附加的参数,比如多少分钟后开启等
--]]
function NoticeAutoRun(tipsType,nLocation,nTargetParam,nLevel,nIndex,...)
	local msg = nil
	local tipsType  = tonumber(tipsType)
	 
	if(nLocation ==nil) then
		nLocation = 1
	else
		nLocation =  tonumber(nLocation)
	end
	local nTargetParam = tonumber(nTargetParam)
	
	local nIndex = tonumber(nIndex)

	if(nLevel ==nil ) then
		nLevel =0
	else
		nLevel =  tonumber(nLevel)
	end
	if ( nIndex > 0) then
		msg =  unpack (NoticeMsg[nIndex])
	end
	if(msg  ==nil) then
		print(" NoticeAutoRun invalid nIndex="..nIndex)
		return
	end
	local argsCount = table.getn(arg)
	
	if(argsCount ==1 ) then
		local arg1 = unpack(arg)
		msg = string.format(msg,arg1 )
	elseif(argsCount ==2 ) then
		local arg1,arg2 = unpack(arg)
		msg = string.format(msg,arg1,arg2 )
	elseif(argsCount ==3 ) then
		local arg1,arg2,args3 = unpack(arg)
		msg = string.format(msg,arg1,arg2,args3 )
	end
	
	
	if tipsType == 1 then
		System.broadcastTipmsgLimitLev(msg,nLocation,nLevel)
	elseif tipsType == 2 then
		if (nTargetParam >= 1 and nTargetParam <= 3) then
			System.broadcastCampTipmsgLimitLev(nTargetParam, msg, nLocation,nLevel)
		end
	elseif tipsType == 3 then
		if (nTargetParam > -1) then
			local hScene = Fuben.getSceneHandleById(nTargetParam, 0)
			Fuben.sendMsgToScene(hScene, msg, nLocation)
		end
	end
end


--[[
--自动刷怪函数 
--index为表 CreateMonster中的项号
--bRand:	是否进行随机刷怪 会在组中随机选择一个进行刷怪
--]]
function CreateMonstersAutoRun(index,bRand)
	local index = tonumber(index)
	local bRand = tonumber(bRand)
	if (not CreateMonster[index]) then return end
	if bRand == 1 then
		for i = 1, table.getn(CreateMonster[index]) do
			local monster = CreateMonster[index][i]
			local hScene = Fuben.getSceneHandleById(monster.nSceneID, 0)
			if (monster.path) and table.getn(monster.path) > 0 then
				Fuben.createMonstersAndSetPathpoint(hScene, monster.nMonsterID, monster.posX1, monster.posX2, monster.posY, monster.nCount, monster.nLiveTime, unpack(monster.path)) --在指定的坐标范围内生成N个怪物 根据路径移动
			else
				Fuben.createMonsters(hScene, monster.nMonsterID, monster.posX1, monster.posX2, monster.posY, monster.nCount, monster.nLiveTime)
			end
		end
	else	--随机刷怪
		local count = table.getn(CreateMonster[index])
		local rand = math.random(1, count)
		--[[
		--判断随机怪是否==前一次刷的-- (存在BUG)
		local sDval = System.getDyanmicVar() 
		if sDval.CreateAutoRunMonster == nil then
			sDval.CreateAutoRunMonster = 0
		end
		while(sDval.CreateAutoRunMonster == rand) do
			rand = math.random(1, count)
		end
		sDval.CreateAutoRunMonster = rand
		--]]
		local monsters = CreateMonster[index][rand]
		for i = 1, table.getn(monsters) do
			local monster = monsters[i]
			local hScene = Fuben.getSceneHandleById(monster.nSceneID, 0)
			if (monster.path) and table.getn(monster.path) > 0 then
				Fuben.createMonstersAndSetPathpoint(hScene, monster.nMonsterID, monster.posX1, monster.posX2, monster.posY, monster.nCount, monster.nLiveTime, unpack(monster.path)) --在指定的坐标范围内生成N个怪物 根据路径移动
			else
				Fuben.createMonsters(hScene, monster.nMonsterID, monster.posX1, monster.posX2, monster.posY, monster.nCount, monster.nLiveTime)
			end
		end
		
	end
end


--刷怪加公告函数 
--[[
--
	tipsType: 公告类型 (1世界公告，2场景公告，3阵营公告)
	tipmsgID: 提示的ID
	nParam:	 额外参数 (例如：阵营公告时填入阵营ID，场景公告时填入场景ID)
	notice:  提示内容 ，如果为数字 则代表NoticeMsg表中的项值
	noticeIndex: 为表 NoticeMsg中的项号
	mobIndex: 为表 CreateMonster中的项号
	bRand:	是否进行随机刷怪
--]]
function CreateMonstersAndNoticeAutoRun(tipsType,tipmsgID,nParam,noticeIndex,mobIndex,bRand)
	NoticeAutoRun(tipsType,tipmsgID,nParam,1,noticeIndex)
	CreateMonstersAutoRun(mobIndex,bRand)
end

--注册定时 刷怪加公告函数 
--[[
--
	nInterval：执行间隔
	nTimes：执行次数
	tipsType: 公告类型 (1世界公告，2场景公告，3阵营公告)
	tipmsgID: 提示的ID
	nParam:	 额外参数 (例如：阵营公告时填入阵营ID，场景公告时填入场景ID)
	notice:  提示内容 ，如果为数字 则代表NoticeMsg表中的项值
	noticeIndex: 为表 NoticeMsg中的项号
	mobIndex: 为表 CreateMonster中的项号
	bRand:	是否进行随机刷怪
--]]
function RegCreateMonstersAndNoticeAutoRun(nInterval, nTimes, tipsType,tipmsgID,nParam,noticeIndex,mobIndex,bRand)
	--清除定时执行 防止多个
	Actor.unregScriptCallback(thisNPC,"CreateMonstersAndNoticeAutoRun")
	local nInterval = tonumber(nInterval)
	local nTimes = tonumber(nTimes)
	--注册实体执行函数
	Actor.regScriptCallback(thisNPC,nil,0,nInterval*1000,nTimes,"CreateMonstersAndNoticeAutoRun",tipsType,tipmsgID,nParam,noticeIndex,mobIndex,bRand)
end

--设置竞拍 
--[[
	* Param INT_PTR nPrice:	起拍价
	* Param INT_PTR nTime:	拍卖时限(秒)
	* Param INT_PTR nItemId:拍卖物品ID
	* Param INT_PTR nCount:	拍卖数量
--]]
function SetAuction(nPrice, nTime, nItemId, nCount, nQuality, nStrong, nBind)
	local nCount = nCount or 1
	local nQuality = nQuality or 0
	local nStrong = nStrong or 0
	local nBind = nBind or 0
	System.setAuction(nPrice, nTime, nItemId, nCount, nQuality, nStrong, nBind)
end

--定时保存文件
function SaveFiles()
	System.saveFiles()
end

