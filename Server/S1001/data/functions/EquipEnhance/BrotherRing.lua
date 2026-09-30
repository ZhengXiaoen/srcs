--#include "data\config\equipSynthesis\BrotherRingCfg.lua" once
--#include "data\config\equipSynthesis\BrotherQingMiDuTask.lua" once
--#include "data\config\equipSynthesis\BrotherFlowerCfg.lua" once

--取到自己的亲密度：Actor.GetMyBrotherIntimacy(sysarg)
--对方的亲密度lua不用取，c++要
--取得自己的贡献度：PROP_BROTHER_CONTRIBUTE
--取得对方的贡献度{在线:取得自己的贡献度：PROP_BROTHER_CONTRIBUTE   离线：Actor.GetBrotherOfflineCont(sysarg)}

--得到戒指的信息
GetBrotherRingInfo= function( sysarg, msgid, packet )
	
	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		SendBrotherRingInfo(sysarg)
	elseif nType== 1 then --激活金兰戒指/金兰戒指升级
		BrotherRingLevelUp(sysarg)
	end
end

--发送消息
function SendBrotherRingInfo(sysarg)
	--得到亲密度，用来升戒指的
	local myAllIntimacy = Actor.GetMyBrotherIntimacy(sysarg)
	if myAllIntimacy<0 then 
		myAllIntimacy=0
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sBrotherRing)
	DataPack.writeUint64(netPack,myAllIntimacy)
	DataPack.flush(netPack)
end

--升级
function BrotherRingLevelUp (sysarg)
	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	--还没有结义，不能升级
	if myBrotherId==0 then --还没有结义
		Actor.sendTipmsg(sysarg,"还没有结义",ttFlyTip)
		return 
	end

	local equipItem_ptr = Item.getEquipByPos(sysarg, itBrotherRingPos)
	if equipItem_ptr==nil then --还没有激活，直接激活 
		--判断等级是否符合要求
		local nextItemId = BrotherRingCfg[1][1].award.id
		local needLevel = Item.getItemPropertyById(nextItemId, Item.ipItemActorLevel)
		local needCircle = Item.getItemPropertyById(nextItemId, Item.ipItemNeedCircle)
		local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
		local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);

		if myLevel < needLevel or myCircle < needCircle then
			Actor.sendTipmsg(sysarg,string.format("当前等级低于下阶装备所需的 %s 级",needLevel), ttFlyTip)
			return
		end
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<1 then 
			Actor.sendTipmsg(sysarg,"至少拥有一个背包空位",ttFlyTip)
			return
		end
		local newEquip_ptr = Item.createItem(BrotherRingCfg[1][1].award.id,BrotherRingCfg[1][1].award.count,0,0,BrotherRingCfg[1][1].award.bind)
		if newEquip_ptr==nil then 
		end
		local addCount = Item.addItem(sysarg,newEquip_ptr,"激活金兰戒指",0)
		Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
		Actor.sendTipmsg(sysarg,string.format("激活成功"), ttFlyTip)
		SendBrotherRingInfo(sysarg)
	else 
		--知道当前的等级是多少
		local nowItem = Item.getItemId(equipItem_ptr)
		local nowLevel = 0
		for i=2,#BrotherRingCfg[1] do --前1-29级
			if nowItem == BrotherRingCfg[1][i].nowId then 
				nowLevel = i-1
			end
		end
		--if nowLevel==0 then 
		--	for i=1,#BrotherRingCfg[2] do --30-59级
		--		if nowItem == BrotherRingCfg[2][i].nowId then 
		--			nowLevel = i+29
		--		end
		--	end
		--end
		--
		--if nowLevel==0 then 
		--	for i=1,#BrotherRingCfg[3] do --60-79级
		--		if nowItem == BrotherRingCfg[3][i].nowId then 
		--			nowLevel = i+59
		--		end
		--	end
		--end
		if 6215 ==nowItem then
			Actor.sendTipmsg(sysarg,"当前已经是最高级了,不能再升级",ttFlyTip)
			return 
		end
		
		--计算应该要取什么配置
		local x=0
		local y=0
		if nowLevel>=30 and nowLevel<60 then 
			x= 2
			y=nowLevel -29
		--elseif nowLevel>=60 then  
		--	x= 3
		--	y=nowLevel -59
		else 
			x=1
			y=nowLevel +1
		end
		--判断等级是否符合要求
		local nextItemId = BrotherRingCfg[x][y].award.id
		local needLevel = Item.getItemPropertyById(nextItemId, Item.ipItemActorLevel)
		local needCircle = Item.getItemPropertyById(nextItemId, Item.ipItemNeedCircle)
		local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
		local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	    
		
		--if not Actor.checkActorLevel(sysarg,needLevel,needCircle) then -- 不要用这个来判断，因为是否可穿该装备也不是这样判断的
		if myLevel < needLevel or myCircle < needCircle then
			Actor.sendTipmsg(sysarg,string.format("当前等级低于下阶装备所需的 %s 级",needLevel), ttFlyTip)
			return
		end
		
		----判断需求
		local var = Actor.getStaticVar(sysarg)
		--if var.AllBrotherRing ==nil then  var.AllBrotherRing =0 end
		--if var.AllBrotherRing<=0 then var.AllBrotherRing=0 end 
	    local myAllIntimacy = Actor.GetMyBrotherIntimacy(sysarg)
		
		if myAllIntimacy<BrotherRingCfg[x][y].consume.count then 
			Actor.sendTipmsg(sysarg,string.format("所需的亲密度不够,无法升级"), ttFlyTip)
			return 
		end
		
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<1 then 
			Actor.sendTipmsg(sysarg,"至少拥有一个背包空位",ttFlyTip)
			return
		end
		
		--升级(换装备)
		
		if equipItem_ptr ~= nil and Item.removeEquip(sysarg,equipItem_ptr,"金兰戒指升级删除",0) < 1 then
			local emsg = string.format("error, 金兰戒指升级删除 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return
		end
		
		local newEquip_ptr = Item.createItem(nextItemId,1,0,0,1)
		if not newEquip_ptr then
			local emsg = string.format("error, 金兰戒指升级创建失败 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return
		end	
		
		local addCount = Item.addItem(sysarg,newEquip_ptr,"金兰戒指升级",LogIds.ShenJiJunGu)
		
		Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
		Actor.sendTipmsg(sysarg,string.format("升级成功"), ttFlyTip)

		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>将金兰戒指升级至%s,<我也要升级/@@showWin,238>",Actor.getName(sysarg),Item.getItemLinkMsg(nextItemId)),ttChatWindow);		
		
		--var.AllBrotherRing =var.AllBrotherRing -BrotherRingCfg[x][y].consume.count
		myAllIntimacy = myAllIntimacy-BrotherRingCfg[x][y].consume.count
		if myAllIntimacy<0 then 
			myAllIntimacy =0
		end
		
		--设置我用来升级的贡献度
		Actor.SetMyBrotherIntimacy(sysarg,myAllIntimacy)
		SendBrotherRingInfo(sysarg)
	end
end








--上面专门搞戒指
-------------------------------------------------------------------------------------------------------------
--下面专门搞结义的亲密度界面


GetBrotherInfo = function( sysarg, msgid, packet )

	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		SendBrotherInfo(sysarg)
	elseif nType== 1 then --领取
		GetBrotherOnLineTimeAward(sysarg)
	elseif nType ==2 then --送花

		BrotherBuyFlower(sysarg,DataPack.readByte(packet))
	end
	
end

--发送结义的信息
SendBrotherInfo =function(sysarg)
	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	
	if myBrotherId==0 then --还没有结义
		Actor.sendTipmsg(sysarg,"还没有结义",ttFlyTip)
		return 
	else 
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sBrotherInfo)
		 
		local myBrotherCon = 0
		
		local pActor = System.getEntityPtrByActorID(myBrotherId)
		if pActor~=nil then --离线取离线的
			myBrotherCon = Actor.getIntProperty(pActor,PROP_BROTHER_CONTRIBUTE)
			--print("Actor.GetMyBrotherIntimacy(pActor)2="..Actor.GetMyBrotherIntimacy(pActor))
		else	--在线就取在线的
			myBrotherCon = Actor.GetBrotherOfflineCont(sysarg)
		end
		
		if myBrotherCon<0 then 
			myBrotherCon=0
		end
		--print("myBrotherCon="..myBrotherCon)
		
		local var = Actor.getStaticVar(sysarg)
		if var.days.BrotherOnLineTime ==nil then 
			var.days.BrotherOnLineTime	= 0
		end	
		--我的个人贡献 ，自己看168属性 PROP_BROTHER_CONTRIBUTE
		DataPack.writeByte(netPack,0) --结义信息，1为鲜花的特效
		DataPack.writeInt(netPack,myBrotherCon) --brother的个人贡献
		DataPack.writeByte(netPack,5-var.days.BrotherOnLineTime) --剩余的领奖次数
		DataPack.flush(netPack)
	end
	
end

--领取在线奖励
function GetBrotherOnLineTimeAward(sysarg)

	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	
	if myBrotherId==0 then --还没有结义
		Actor.sendTipmsg(sysarg,"还没有结义",ttFlyTip)
		return  
	end

	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	local TimeAward ={3600,7200,10800,14400,18000}
	
	--计算可以领取多少次
	local times =0
	for i=1,#TimeAward do 
		if onlineTime >=TimeAward[i] then 
			times =times +1
		end
	end

	local var = Actor.getStaticVar(sysarg)
	if var.days.BrotherOnLineTime ==nil then 
		var.days.BrotherOnLineTime	= 0
	end	
	
	if var.days.BrotherOnLineTime>=times then 
		Actor.sendTipmsg(sysarg,"没到领奖时间/次数用完",ttFlyTip)
		return 
	end
	
	var.days.BrotherOnLineTime = var.days.BrotherOnLineTime +1
	
	
	System.sendCommonLog(LogIds.tishenjieyigongxiandu,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE),Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE)+2000,'','','','','','','',"领取在线奖励")
	--给奖励（我的个人贡献也写在里面）
	Actor.AwardtBrotherIntimacy(sysarg,2000)
	

	Actor.sendTipmsg(sysarg,Actor.getName(sysarg).."玩家领取在线奖励,亲密度提升2000",ttFlyTip)
	local pActor = System.getEntityPtrByActorID(myBrotherId)
	if pActor~=nil then 
		Actor.sendTipmsg(pActor,Actor.getName(sysarg).."玩家领取在线奖励,亲密度提升2000",ttFlyTip)
	end
end

--兄弟购买花朵

function BrotherBuyFlower(sysarg,index)

	if BrotherFlowerCfg[index]==nil then 
		return 
	end
	
	local cgf = BrotherFlowerCfg[index]
	local award = cgf.award
		
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end

		--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cgf.needMoney, LogIds.buyTheBrotherFlower, cgf.txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	
	Awards.Give(sysarg,award,LogIds.buyTheBrotherFlower,cgf.txt)
end

--用于测试
function AwardIntimacy(sysarg)
	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	print("myBrotherId="..myBrotherId)
	if myBrotherId~=0 then 
		----两个人一起加亲密度
		--Actor.AwardtBrotherIntimacy(sysarg,100)
		--	--print("Actor.GetMyBrotherIntimacy(sysarg)="..Actor.GetMyBrotherIntimacy(sysarg))
		--local pActor = System.getEntityPtrByActorID(myBrotherId)
		--if pActor~=nil then 
		--	--print("Actor.GetMyBrotherIntimacy(pActor)2="..Actor.GetMyBrotherIntimacy(pActor))
		--end
		----print("lalalal")
	else
		--print("myBrotherId="..myBrotherId)
	end
end
--
--function AddMyContribute(sysarg,value)
--	local value = tonumber(value)
--	Actor.setIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE,Actor.getIntProperty(sysarg, PROP_BROTHER_CONTRIBUTE)+value)
--	--print("PROP_BROTHER_CONTRIBUTE="..Actor.getIntProperty(sysarg, PROP_BROTHER_CONTRIBUTE))
--end

--上面专门搞结义的亲密度界面
-------------------------------------------------------------------------------------------------------------
--下面搞结义任务

--结义任务
function handBrotherTask(sysarg,sysid,packet)

	local types = DataPack.readByte(packet)
	if types==0 then 
		TellClientBrotherTaskInfo(sysarg)
	elseif types==1 then 
		GetBrotherTask(sysarg,packet)
	end
end

--领取结义任务奖励
function GetBrotherTask(sysarg,packet)
local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	
	if myBrotherId==0 then --还没有结义
		Actor.sendTipmsg(sysarg,"还没有结义",ttFlyTip)
		return  
	end
	
    local var = Actor.getStaticVar(sysarg)
	if var.newdays==nil then 
		var.newdays={}
	end
	
	local x = DataPack.readByte(packet)
	local y = DataPack.readByte(packet)
	
	if x<=0 or x>#BrotherTasks or y<=0 or y>#BrotherTasks[x] then 
		return 
	end
	
	if var.newdays.brotherTaskCon==nil then 
		var.newdays.brotherTaskCon={}
	end

					
	--任务条件判断
	if x==1 then 
		if var.newdays.brotherTaskCon[1]==nil then 
			var.newdays.brotherTaskCon[1]={}
			var.newdays.brotherTaskCon[1][y]=0
		end
	
		if var.newdays.brotherTaskCon[1][y]<BrotherTasks[1][y].needKillCount then 
			Actor.sendTipmsg(sysarg,"任务条件还没有完成",ttFlyTip)
			return 
		end
	elseif 	x==2 then 	
		if var.newdays.brotherTaskCon[2]==nil then 
			var.newdays.brotherTaskCon[2]={}
		end
		
		if var.newdays.brotherTaskCon[2][y]==nil then 
			Actor.sendTipmsg(sysarg,"任务条件还没有完成",ttFlyTip)
			return 
		end
	elseif x==3 then 
		if var.days.LivenessData==nil or var.days.LivenessData.meirishouchong == nil or var.days.LivenessData.meirishouchong == 0 then 	
			Actor.sendTipmsg(sysarg,"任务条件还没有完成",ttFlyTip)
			return 
		end
	end
	
	if var.newdays.BrotherTask==nil then 
		var.newdays.BrotherTask={}
	end
	
	if var.newdays.BrotherTask[x]==nil then 
		var.newdays.BrotherTask[x]={}
	end
	
	if var.newdays.BrotherTask[x][y] ~=nil and var.newdays.BrotherTask[x][y]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	var.newdays.BrotherTask[x][y]=1
	
	
	System.sendCommonLog(LogIds.tishenjieyigongxiandu,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE),Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE)+BrotherTasks[x][y].value,'','','','','','','',"做任务")
	
	Actor.AwardtBrotherIntimacy(sysarg,BrotherTasks[x][y].value)
	
	TellClientBrotherTaskInfo(sysarg)
	
	Actor.sendTipmsg(sysarg,Actor.getName(sysarg).."玩家完成任务,亲密度提升"..BrotherTasks[x][y].value,ttFlyTip)
	local pActor = System.getEntityPtrByActorID(myBrotherId)
	if pActor~=nil then 
		Actor.sendTipmsg(pActor,Actor.getName(sysarg).."玩家玩家完成任务,亲密度提升"..BrotherTasks[x][y].value,ttFlyTip)
	end
	
	
end

--同意了别人和我结义
function BrotherSuccess(m_pEntity,pEntity)
	if m_pEntity~=nil and pEntity~=nil then 
		local myId = Actor.getIntProperty(m_pEntity,PROP_ENTITY_ID)
		local myName = Actor.getName(m_pEntity)
		
		local targetId = Actor.getIntProperty(pEntity,PROP_ENTITY_ID)
		local targetName = Actor.getName(pEntity)
		
		System.AddMail(myId, 0, 0, "结义成功", "尊敬的玩家您好,\\\\您与"..targetName.."结义成功\\\\可在角色-结义界面中领取结义戒指。领取后自动佩戴，可在人物-结义界面中查询相关属性信息！\\\\结义戒指可通过亲密度进行升级，等级越高获得属性值越高！")
		
		System.AddMail(targetId, 0, 0, "结义成功", "尊敬的玩家您好,\\\\您与"..myName.."结义成功\\\\可在角色-结义界面中领取结义戒指。领取后自动佩戴，可在人物-结义界面中查询相关属性信息！\\\\结义戒指可通过亲密度进行升级，等级越高获得属性值越高！")
		
		Actor.sendTipmsg(m_pEntity,"您与"..targetName.."结义成功",ttFlyTip)
		
		Actor.sendTipmsg(pEntity,"您与"..myName.."结义成功",ttFlyTip)
		
		System.broadcastTipmsg(string.format("<(n%s)>与<(n%s)>结义成功,<我也要结义/@@showWin,238>",myName,targetName),ttChatWindow)
		
		System.sendCommonLog(LogIds.jieyichenggong,myId,myName,targetId,0,0,'','','','','','','',targetName)
	end
	
end

--拒绝了别人和我结义
function BrotherFail(m_pEntity,pEntity)
	if m_pEntity~=nil and pEntity~=nil then 
		local myId = Actor.getIntProperty(m_pEntity,PROP_ENTITY_ID)
		local myName = Actor.getName(m_pEntity)
		
		local targetId = Actor.getIntProperty(pEntity,PROP_ENTITY_ID)
		local targetName = Actor.getName(pEntity)
		
		System.AddMail(targetId, 0, 0, "结义失败", "尊敬的玩家您好,\\\\您与"..myName.."结义失败,对方拒绝了,可再寻其他好友进行结义！ 祝您生活愉快！")
	end
end

--解除关系
function DeleteBrother(m_pEntity,targetId,targetName)
	if m_pEntity~=nil then 
		
		--发邮件给自己
		local myId = Actor.getIntProperty(m_pEntity,PROP_ENTITY_ID)
		local contributeLeft = Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE) - math.ceil(Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE)*0.1)
		--print("Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE)="..Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE))
		System.sendCommonLog(LogIds.tishenjieyigongxiandu,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getIntProperty(sysarg,PROP_BROTHER_CONTRIBUTE),contributeLeft,'','','','','','','',"解除结义扣除")
		
		Actor.setIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE,contributeLeft)
		
		--print("Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE)="..Actor.getIntProperty(m_pEntity,PROP_BROTHER_CONTRIBUTE))
		
		System.AddMail(myId, 0, 0, "解除结义", "尊敬的玩家您好,\\\\您与"..targetName.."解除结义,结义戒指已经消失,主动解除方将扣除10%的贡献度,当前剩余"..contributeLeft.."点亲密度")
		
	
		--发邮件给兄弟
		local myBrotherCon = 0
		local pActor = System.getEntityPtrByActorID(myBrotherId)
		if pActor~=nil then --离线取离线的
			myBrotherCon = Actor.getIntProperty(pActor,PROP_BROTHER_CONTRIBUTE)
		else	--在线就取在线的
			myBrotherCon = Actor.GetBrotherOfflineCont(m_pEntity)
		end
		if myBrotherCon<0 then 
			myBrotherCon=0
		end

		local myName = Actor.getName(m_pEntity)
		System.AddMail(targetId, 0, 0, "解除结义", "尊敬的玩家您好,\\\\您与"..myName.."解除结义,结义戒指已经消失,主动解除方将扣除10%的贡献度,当前剩余"..myBrotherCon.."点亲密度被保留")
		
		System.broadcastTipmsg(string.format("<(n%s)>与<(n%s)>称割袍断义再无关系",myName,targetName),ttChatWindow)
		
		System.sendCommonLog(GameLog.cLeaveBrother,myId,myName,targetId,0,0,targetName,'','','','','','',"解除结义关系")
	end
	
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBrotherRing, GetBrotherRingInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBrotherInfo, GetBrotherInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cBrotherTask, handBrotherTask)


function SetIntimacy1(sysarg,name,value)
	local name =tostring(name)
	local value = tonumber(value)

	local pActor = Actor.getActorByName(name)
	if pActor then
		Actor.SetMyBrotherIntimacy(pActor,value)
		Actor.sendTipmsg(sysarg,"设置成功："..Actor.GetMyBrotherIntimacy(pActor),ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end
