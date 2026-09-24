--#include "data\functions\Systems\ActivitySystem\YongZheChuangGuang.lua" once

NpcDialog[312] = {}
NpcDialog[312].main = function(sysarg)
	--//主显示内容
    local strRewardicon = string.format("<(%s)>  <(%s)>  <(%s)>", "iaward#52#1","iaward#53#1","iaward#2#1")
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<=6 then 
		echo = [[


	           <(c0xFFb6946c)今天是新区第><(c0xFF00FF00)]]..openServerDay..[[><(c0xFFb6946c)天>
	           <(idecoLine#350)>

  <(c0xFFb6946c)只有新区第><(c0xFF00FF00)7><(c0xFFb6946c)天开始才开放勇闯天关,到第><(c0xFF00FF00)7><(c0xFFb6946c)天再来找我吧,先赶紧去提升你的实力吧！>
  



		]]
		return echo
	end
		
	
	local var = Actor.getStaticVar(sysarg) 
	
	if var.days.IsHasEnterYCTG ==nil then --今天是否进入过勇闯天关
		var.days.SYCGLayer = nil  --勇闯天关最高层
	end
	
	if var.days.SYCGLayer == nil then 
		var.days.SYCGLayer = 1
	end
	local TopTip = ""
	
	--历史最高层
	if var.TGtopLayer==nil then 
		var.TGtopLayer=0
	end
	
	if var.days.SYCGLayer>30 then 
		TopTip = "<(c0xFFb6946c)已经通关最高层>"
	else 
		TopTip =[[<(ifragments#16#18)><(c0xFFb6946c)当前挑战：]]..var.days.SYCGLayer..[[层><(c0xFF00c0ff)(记录最高层,再次进入可直达,次日重置)>]]
	end
	
	TopTip = TopTip .. "	    <(ifragments#16#18)><(c0xFFb6946c)历史最高层为"..var.TGtopLayer.."层>" .. "   <特权一键扫荡/@teQuanYi,"..var.TGtopLayer..">      <了解特权/@@showWin,187>"
	
	local echo = [[

    <(c0xFFb6946c)天关乃是宝石唯一产出途径，但是想要闯过天关，必须先消灭那些镇关大将。勇士，准备好了吗？>
<(c0xFF00c0ff)勇闯天关简单介绍:><(idecoLine#350)>
    <(ifragments#16#18)><(c0xFFb6946c)60级即可进行闯关,共30层,每层奖励不同>
    <(ifragments#16#18)><(c0xFFb6946c)每层挑战成功可获得奖励,每次进入所需><(c0xFF00FF00)10W><(c0xFFb6946c)绑金或金币>
    <(ifragments#16#18)><(c0xFFb6946c)每层限时挑战><(c0xFF00FF00)3分钟><(c0xFFb6946c)，失败或掉线可以><(c0xFF00FF00)重新挑战>
<(c0xFF00c0ff)勇闯天关参与条件：><(idecoLine#350)>
    <(ifragments#16#18)><(c0xFFb6946c)活动奖励：>]]..strRewardicon..[[

    ]]..TopTip..[[\	<(c0xFF00c0ff)一键扫荡以历史最高层,新版本需要重新挑战到最高层.>\	<(c0xFF00c0ff)当日首次手动闯关后则再无法使用一键扫荡>\	<(c0xFF00c0ff)当日首次一键扫荡后可继续闯关,可到历史最高层>
      
	
                   <#BN进入闯关/@EnterYZCG>
]]

	 return echo;
end

    -- <(ifragments#16#18)><(c0xFFb6946c)天关排名：><查看排名/@ChaKanPaiMing>
--NpcDialog[312].ChaKanPaiMing =function(sysarg)
--
--	--排名------------------------------------------
--	InityongRanking()
--	local Min1 =""
--	local Min2 =""
--	local Min3 =""
--	local ranking = Ranking.getRanking("YongChuangTianGuan.txt")
--	if ranking then
--		local item = Ranking.getItemFromIndex(ranking,0)
--		if item then 
--			Min1="<(c0xFFb6946c)第1名：><(c0xFF00FF00)"..Ranking.getSub(item,0)..">  <(c0xFFb6946c)最高达到层数: ><(c0xFF00FF00)"..Ranking.getPoint(item)..">"
--		else 
--			Min1="<(c0xFFb6946c)第1名: ".."无>"
--		end
--		
--		item = Ranking.getItemFromIndex(ranking,1)
--		if item then 
--			Min2="<(c0xFFb6946c)第2名：><(c0xFF00FF00)"..Ranking.getSub(item,0)..">  <(c0xFFb6946c)最高达到层数: ><(c0xFF00FF00)"..Ranking.getPoint(item)..">"
--		else 
--			Min2="<(c0xFFb6946c)第2名: ".."无>"
--		end
--		
--		item = Ranking.getItemFromIndex(ranking,2)
--		if item then 
--			Min3="<(c0xFFb6946c)第3名：><(c0xFF00FF00)"..Ranking.getSub(item,0)..">  <(c0xFFb6946c)最高达到层数: ><(c0xFF00FF00)"..Ranking.getPoint(item)..">"
--		else 
--			Min3="<(c0xFFb6946c)第3名: ".."无>"
--		end
--	end
--	--排名------------------------------------------
--	
--	local echo = [[
--
--    <(c0xFFb6946c)天关乃是宝石唯一产出途径，但是想要闯过天关，必须先消灭那些镇关大将。勇士，准备好了吗？>
--    <(idecoLine#350)>
--
--  <(c0xFF00c0ff)天关排名:>
--
--              ]]..Min1..[[
--
--
--              ]]..Min2..[[
--
--
--              ]]..Min3..[[
--
--	<(idecoLine#350)>
--
--    <(c0xFFb6946c)想要排名吗？想拿奖励吗？想就努力往上闯关吧！>
--	
--	<#BN返回/@main>
--	]]
--	
--	return echo
--end

NpcDialog[312].EnterYZCG = function(sysarg)
	EnterYongZheChuangGuang(sysarg)
end


--特权一键扫荡
NpcDialog[312].teQuanYi =function(sysarg,topLayer)
	
	topLayer =  tonumber(topLayer)
	--判断是否满足
	if IsSpeciaTitleVip(sysarg,3) == false then 
		--给出不是特权的弹窗
		local ensureStr = string.format("%s/sure_tequanYZCG", "开启特权")
		local cancelStr = string.format("%s/cancle_tequanYZCG", "取消")
		Actor.messageBox(sysarg, 0, 0, "\\<您未拥有黄金特权，请开启\\黄金特权之后再来扫荡天关.>", ensureStr, cancelStr, NULL)
		return 
	end
	
	if topLayer==0 then 
		Actor.sendTipmsg(sysarg,"至少通过一层再来扫荡", ttFlyTip)
		return 
	end
	
	local var = Actor.getStaticVar(sysarg) 
	if var.days.SYCGLayer~=nil and var.days.SYCGLayer~=1 then 
		Actor.sendTipmsg(sysarg,"次日再来扫荡", ttFlyTip)
		return 
	end
	
	if topLayer<10 then 
		--给出弹窗口
		local ensureStr = string.format("%s/sure_tequanYZCG2", "确定扫荡")
		local cancelStr = string.format("%s/cancle_tequanYZCG2", "取消扫荡")
		Actor.messageBox(sysarg, 0, 0, "\\您当日最高层数记录为："..topLayer.."层\\\\<友情提示：您层数偏低，可尝试再加\\把劲上更高层，以获得更多材料.>", ensureStr, cancelStr, NULL)
		return 
	end

	--给前端发协议，让他弹窗
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sYCTG_yijianwancheng)
	DataPack.flush(netPack)
		
end
--在mis里面写接受协议





cancle_tequanYZCG =function(sysarg)
	--print("22222222")
end
cancle_tequanYZCG2 =function(sysarg)
	--print("22222222")
end


sure_tequanYZCG =function(sysarg)
	--print("1111111")
	Actor.openDialogs(sysarg, 187)
end

sure_tequanYZCG2 =function(sysarg)
	--print("1111111")
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sYCTG_yijianwancheng)
	DataPack.flush(netPack)
end


