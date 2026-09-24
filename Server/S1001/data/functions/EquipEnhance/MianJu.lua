--#include "data\config\equipSynthesis\MianJuCfg.lua" once
--#include "data\config\equipSynthesis\MianJuTeHui.lua" once

GetMianJuInfo = function( sysarg, msgid, packet )
	--开区第3天开启
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<3 then 
		return 
	end
	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<60 then 
		return 
	end
		
	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		SendMianJuInfo(sysarg)
	elseif nType== 1 then --激活军鼓/军鼓升级
		MianJuLevelUp(sysarg)
	end
end

--发送面巾值
function SendMianJuInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.MianJinZhi ==nil then  var.MianJinZhi =0 end
	if var.MianJinZhi<=0 then var.MianJinZhi=0 end 
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGetMianJuInfo)
	DataPack.writeUint64(netPack,var.MianJinZhi)
	DataPack.flush(netPack)
end

--升级
function MianJuLevelUp (sysarg)

	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<60 then 
		return 
	end
	
	local curLevel = 0
	
	local equipItem_ptr = Item.getEquipByPos(sysarg, itMianJuPos)	
	if equipItem_ptr ~= nil then		
		local nowItemId = Item.getItemId(equipItem_ptr)
		local idx = 0
		for i, v in ipairs(MianJuCfg) do
			if nowItemId == v[1] then 
				curLevel = i
				break
			end
		end
		
		if curLevel == 0 then
			return
		end
	end
	
	local nextItemCfg = MianJuCfg[curLevel+1]
	if nextItemCfg == nil then
		Actor.sendTipmsg(sysarg,"当前已经是最高级了,不能再升级",ttFlyTip)
		return 
	end
		
	--判断等级是否符合要求
	local nextItemId = nextItemCfg[1]
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
	local MianJinZhi = var.MianJinZhi
		
	if nextItemCfg[3] > 0 then			    
		if MianJinZhi == nil or MianJinZhi < nextItemCfg[3] then 
			Actor.sendTipmsg(sysarg,string.format("所需的斗笠精华不够,无法升级"), ttFlyTip)
			return 
		end
	end
	
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if	bagIdxs<1 then 
		Actor.sendTipmsg(sysarg,"至少拥有一个背包空位",ttFlyTip)
		return
	end
	
	--升级(换装备)
	
	if equipItem_ptr ~= nil and Item.removeEquip(sysarg,equipItem_ptr,"斗笠升级删除",LogIds.ShenJiMianJu) < 1 then
		--local emsg = string.format("error, 斗笠升级删除 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		return
	end
	
	local newEquip_ptr = Item.createItem(nextItemId,1,0,0,1)
	if not newEquip_ptr then
		--local emsg = string.format("error, 斗笠升级创建失败 actorId=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		return
	end	
	
	local addCount = Item.addItem(sysarg,newEquip_ptr,"斗笠升级",LogIds.ShenJiMianJu)
	if addCount < 1 then return end
	
	Item.equipItem(sysarg, newEquip_ptr, 0, -1)	
	
	if nextItemCfg[3] > 0 then
		var.MianJinZhi = MianJinZhi - nextItemCfg[3]
	end
	
	if curLevel == 0 then
		Actor.sendTipmsg(sysarg,string.format("激活成功"), ttFlyTip)
	else
		Actor.sendTipmsg(sysarg,string.format("升级成功"), ttFlyTip)
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>将斗笠升级至%s,<我也要升级/@@showWin,213>",Actor.getName(sysarg),Item.getItemLinkMsg(nextItemId)),ttChatWindow);		
	end
	
	SendMianJuInfo(sysarg)

end

--面巾特惠
MianjinTeHui = function( sysarg, msgid, packet )
	--开区第3天开启
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<3 then 
		return 
	end
	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<60 then 
		return 
	end
	
	
	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		SendMianJuTeHuiInfo(sysarg)
	elseif nType== 1 then --购买特惠礼包
		BuyMianJuTeHui(sysarg,DataPack.readByte(packet))
	end
end

--获得面巾特惠的信息
function SendMianJuTeHuiInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--初始化
	if var.MianJinTeHui==nil then  var.MianJinTeHui ={} end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sMianjinTeHui)
	DataPack.writeByte(netPack,0) --发送信息
	for i=1,#MianJuTeHuiCfg do 
		if var.MianJinTeHui[i]==nil then 
			var.MianJinTeHui[i]=0
		end
		DataPack.writeByte(netPack,var.MianJinTeHui[i])
	end
	DataPack.flush(netPack)
end

--购买面巾特惠
function BuyMianJuTeHui(sysarg,index)
	--初始化
	local var = Actor.getStaticVar(sysarg)
	--初始化
	if var.MianJinTeHui==nil then  var.MianJinTeHui ={} end
	for i=1,#MianJuTeHuiCfg do 
		if var.MianJinTeHui[i]==nil then 
			var.MianJinTeHui[i]=0
		end
	end
	--判断index是否合理
	if index<1 or index >#MianJuTeHuiCfg then --非法上传数据
		return 
	end
	
	--判断是否买过
	if var.MianJinTeHui[index] == 1 then 
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	--判断金钱
	 if Actor.getMoneyCount(sysarg,3) < MianJuTeHuiCfg[index].needYB then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	 end
	--判断格子是否足够
	if not Awards.CheckBagGridCount(sysarg,MianJuTeHuiCfg[index].award) then
		return 
	end
	--扣金钱
	local txt = ""
	if	index==1 then 
		txt="(小)"
	elseif index==2 then 
		txt="(中)"
	elseif index==3 then 
		txt="(大)"
	end
	Actor.changeMoney( sysarg, 3, -MianJuTeHuiCfg[index].needYB, LogIds.MianJuTeHui, "斗笠特惠礼包"..txt)
	
	--给物品
	Awards.Give(sysarg,MianJuTeHuiCfg[index].award,LogIds.MianJuTeHui,"斗笠特惠礼包")
	
	--记录
	var.MianJinTeHui[index]=1
	
	--发消息通知前端
	SendMianJuTeHuiInfo(sysarg)
	
	--发送告诉前端，购买第几个成功
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sMianjinTeHui)
	DataPack.writeByte(netPack,1) 
	DataPack.writeByte(netPack,index)
	DataPack.flush(netPack)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了%s",Actor.getName(sysarg),Item.getItemLinkMsg(MianJuTeHuiCfg[index].award[1].id)),ttChatWindow);		
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetMianJuInfo, GetMianJuInfo)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cMianjinTeHui, MianjinTeHui)
--用于测试
function addmianjuzhi(sysarg,n)
	n = tonumber(n)
	local var = Actor.getStaticVar(sysarg)
	if var.MianJinZhi ==nil then  var.MianJinZhi =0 end
	var.MianJinZhi=var.MianJinZhi+n
	SendMianJuInfo(sysarg)
end