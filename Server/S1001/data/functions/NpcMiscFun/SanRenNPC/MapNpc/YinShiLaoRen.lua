--隐世老人
--#include "data\functions\StdTask.lua" once
local t = {}
t.main = function(sysarg)
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	--if zLv < 1 then
	--	return "\\  <(c0xFFf5e31d)[主线] 转世重生,送2枚特戒>\\\\  <(c0xFFb6946c)你还没转生,转生后再来找我吧.这么简单你不会都办不到吧?>\\  <(c0xFFb6946c)我这里可有2颗特戒结晶送给你哟,等于2枚特戒哟..>\\\\  <转生修为丹可增加转生修为,首充有赠送哦.>\\  <转生后会增加攻击类属性并可穿戴转生装备.>\\\\  <打开转生面板/@@showWin,1,4|进行第1次转生> <我要首充大礼包/@@showWin,34|充值任意金额即可领取成长装备(杀怪升级,专属位置)#并附送1颗转生修为丹等等超值礼品>";
	--end
	--Quest_ShuaXin(sysarg)
    local ta = task_all[get_taskflags_val(sysarg)]
  
	local str ="<#c0xFFFFFF00#装备我已经带来了,赶紧让我摸一摸吧../@Change|当拐杖叫了一声爽,你就可以获得这颗特戒结晶了哟>"
		
	local var = Actor.getStaticVar(sysarg)
	if var.days.betonSHENJIA ~= nil and ta == nil then --
		str ="<#c0xFFFFFF00#我不服,我给你200元宝让我再摸一把!!!/@Change|当拐杖叫了一声爽,你就可以获得这颗特戒结晶了哟>"
	end 
	
	if var.betonSHENJIAFinish ~=nil then --没有完成
		return "<(c0xFFb6946c)\\  陪伴我的,是它...\\  它就是我的麒麟拐杖,我的一生挚爱...>\\<(c0xFFFFDD55)\\  我很讨厌威龙城的仓库管理员,你能帮我去揍他一顿吗?\\  我可没什么好处给你的,你就看我老人家可怜的份上帮个忙bo?>"
	end
	local taskitemid = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	if taskitemid ==0 then 
		taskitemid = 527;
	else 
		taskitemid = 527;
	end
	
	local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
	local itemid = YinShiDaDuNeedDao(sysarg)

	local echo =[[
<(c0xFFb6946c)
  恭喜你已经结束了无脑的新手任务阶段,接下去就是考验你是否是一名合格的玩家了.

  散人殿堂一共有5层,每1层都布满了BOSS并且掉落各种装备.

  散人殿堂2层及以上的BOSS会掉落>]]..Item.getItemLinkMsg(itemid)..[[<(c0xFFb6946c),你给我1把,我就给你试试我这宝贝拐杖,让你来摸一摸,如果它说爽,那我就会送你1颗>]]..Item.getItemLinkMsg(527)..[[<(c0xFFb6946c)(1颗结晶可兑换任意特戒1枚,打开神炉V即可查看).

  你只有1次机会,如果没有让我的拐杖爽,那你就只能等明天再带着>]]..Item.getItemLinkMsg(itemid)..[[<(c0xFFb6946c)来摸摸它了,一直摸到它爽为止.根据我以往的经验,平均3个人当中就有1个人会让它觉得爽,所以就看你的造化了.

  如果你今天没让它爽,那就明天再带着装备来吧,它明天就会忘记今天的你.
>

  ]]..str..[[ 

  ]].."<没有装备怎么办？/@buyDao>"..[[
	]]
	
	return echo
end

--买到，并且过任务
t.buyDao=function(sysarg)
	
	local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
	local itemid = YinShiDaDuNeedDao(sysarg)
	
	local okBtn = string.format("%s/buyDao_sureFunc", "确定")
	local cancelBtn = string.format("%s/buyDao_cancelBtn", "取消")
	Actor.messageBox(sysarg, 0, 0, "是否用98元宝购买"..Item.getItemName(itemid).."立即完成任务?", okBtn, cancelBtn, NULL,0,0,NULL,0,0)
	return t.main(sysarg)
end

--确定按钮触发的函数
function buyDao_sureFunc(sysarg)

    if get_d_val(sysarg,130) == 1 then
        System.trace("刷特戒结晶"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
        return
    end
	--判断金钱
	if Actor.getMoneyCount(sysarg,3) < 98 then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	end
	
	if Item.getBagEmptyGridCount(sysarg)<1 then 
		Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.betonSHENJIAFinish~=nil and var.betonSHENJIAFinish~=0 then 
		return 
	end
	
	Actor.changeMoney( sysarg, 3, -98, LogIds.yinshilaoren, "元宝通过隐世老人")
	
	Actor.addItem(sysarg, 527,0,0,1,1,0,"daduex",1)
	Actor.sendTipmsg(sysarg,"麒麟拐杖: 爽!!!",4)
	System.broadcastTipmsg(string.format("麒麟拐杖: 爽!!!(%s完成了最终任务,获得%s1颗)", Actor.getName(sysarg), Item.getItemLinkMsg(527)), ttChatWindow);
	var.betonSHENJIAFinish = 1
	set_d_val(sysarg,130,1);
	Quest_ShuaXin(sysarg)
	
	
	--让NPC翻页
	function changeTalkPage(sysarg,str)
		local netPack = DataPack.allocPacket(sysarg, 0, 11)
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt64(netPack, Actor.getNpc(sysarg))-- 更新数据的类型
		DataPack.writeString(netPack,str)
		DataPack.flush(netPack)
	end
    
	local str =	t.main(sysarg)
	changeTalkPage(sysarg,str)
	

end



--取消按钮触发的函数，不要删除
function buyDao_cancelBtn(sysarg)

end

t.Change = function(sysarg)
	
    if get_d_val(sysarg,130) == 1 then
        System.trace("刷特戒结晶"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
        return
    end
	local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
	local itemid = YinShiDaDuNeedDao(sysarg)
	
	if Actor.getItemCount(sysarg,itemid) < 1 then 
		Actor.sendTipmsg(sysarg, "\\亲,"..Item.getItemName(itemid).."呢?\\\\我的麒麟拐杖早已饥渴难耐了,它要吞噬"..Item.getItemName(itemid).."才能爽!\\\\它不爽我就不爽,我不爽你就爽不了!\\\\Do you understand?", 4)
		return t.main(sysarg);
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.betonSHENJIA == nil then --今天第一次，免费
		var.days.betonSHENJIA = true
	else 
		if Actor.getMoneyCount(sysarg, 3) < 200 then
			Actor.sendTipmsg(sysarg, "说好的200元宝呢?\\\\欺负老人可不好哟,年轻人.", 4)
			return t.main(sysarg);
		end
		Actor.changeMoney(sysarg,3,-200,2604,"和隐世老人打赌")
	end
	Actor.removeItem(sysarg,itemid,1)
	
	--进行基率计算，先定1/n
	local n = 1
	local randomNmber = math.random(1,n)
		
	if randomNmber == n then
		--local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
		--if nSex ==0 then 
		--	Actor.addItem(sysarg,1519,0,0,1,1,0,"dadu",1)
		--else 
		--	Actor.addItem(sysarg, 1526,0,0,1,1,0,"daduex",1)
		--end
		Actor.addItem(sysarg, 527,0,0,1,1,0,"daduex",1)
		Actor.sendTipmsg(sysarg,"麒麟拐杖: 爽!!!",4)
		System.broadcastTipmsg(string.format("麒麟拐杖: 爽!!!(%s完成了最终任务,获得%s1颗)", Actor.getName(sysarg), Item.getItemLinkMsg(527)), ttChatWindow);
		var.betonSHENJIAFinish = 1
		set_d_val(sysarg,130,1);
		Quest_ShuaXin(sysarg)
		return t.main(sysarg);
	else
		Actor.sendTipmsg(sysarg,"麒麟拐杖: 我还要...\\\\(它没吃饱还没喊爽...)",4)
		return t.main(sysarg);
	end
	
	

	return t.main(sysarg);
end

function GetNpcYinShiLaoRen() return t end


function YinShiDaDuNeedDao(sysarg)
	local njob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
	local itemid = 394
	if njob==2 then 
		itemid =394
	elseif njob==3 then 
		itemid =394
	end
	return itemid
end
