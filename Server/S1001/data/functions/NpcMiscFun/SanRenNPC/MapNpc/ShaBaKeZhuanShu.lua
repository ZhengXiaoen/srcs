--沙巴克专属 王城专属

local t = {}

t.main = function(sysarg)
	local echo = [[

    <(c0xFF00c0ff)沙巴克专属地图>
<(idecoLine#308)>
    <(c0xFFb6946c)	王城成员免费进入.>
    <(c0xFFb6946c)	非王城成员所需消耗定量货币.>

    <(c0xFF00c0ff)地图优势>
<(idecoLine#308)>
    <(c0xFFb6946c)	高级BOSS,高级掉率,高级装备.>
]];
	local myHangHuiId=Actor.getGuildId(sysarg)
	if System.getSbkGuildId()==myHangHuiId and myHangHuiId~= 0 then 
		echo=echo..[[    <免费进入地图/@entermap|您当前是王城成员.>]]
	else 
		echo=echo..[[\
    <100元宝进入/@entermap,3>  <20万金币进入/@entermap,1>  <20万绑定金币进入/@entermap,0>
		]]
	end

	return echo;
end
t.entermap=function(sysarg,index)
	index =tonumber(index)
	local myHangHuiId=Actor.getGuildId(sysarg)
	if System.getSbkGuildId()~=myHangHuiId  or myHangHuiId== 0 then 
	
		--先扣钱
		if index == 0 then 
			if Actor.getMoneyCount(sysarg,index)<200000 then
				Actor.sendTipmsg(sysarg,"绑定金币不够，您无法进入", ttFlyTip) 
				return t.main(sysarg)
			end
			Actor.changeMoney(sysarg,0,-200000,2614,"沙巴克专属绑金进入");
		elseif index==1 then 
			if Actor.getMoneyCount(sysarg,index)<200000 then	
				Actor.sendTipmsg(sysarg,"金币不够，您无法进入", ttFlyTip) 
				return t.main(sysarg)
			end
			Actor.changeMoney(sysarg,1,-200000,2614,"沙巴克专属金币进入");
		elseif index==3 then
			if Actor.getMoneyCount(sysarg,index)<100 then
				Actor.sendTipmsg(sysarg,"元宝不够，您无法进入", ttFlyTip) 
				return t.main(sysarg)
			end
			Actor.changeMoney(sysarg,3,-100,2614,"沙巴克专属元宝进入");
		else
			return 
		end
		Actor.enterScene(sysarg,269,-1,-1)
	else 
		Actor.enterScene(sysarg,269,-1,-1)
	end
	
end


function GetNpcShaBaKeZhuanShu() return t end