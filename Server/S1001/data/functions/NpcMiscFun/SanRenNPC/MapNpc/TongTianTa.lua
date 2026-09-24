
NpcDialog[404] = {}
NpcDialog[404].main = function(sysarg)
	--//主显示内容
    local strRewardicon = string.format("<(%s)>  <(%s)>  <(%s)>", "iaward#145#1","iaward#146#1","iaward#147#1")
		
	local var = Actor.getStaticVar(sysarg) 
	
	if var.days.IsHasEnterTTT ==nil then --今天是否进入过勇闯天关
		var.days.TTTLayer = nil  --勇闯天关最高层
	end
	
	if var.days.TTTLayer == nil then 
		var.days.TTTLayer = 1
	end
	local TopTip = ""
	
	 if var.days.TTTLayer>30 then 
	 	TopTip = "<(c0xFFb6946c)已经通关最高层>"
	 else 
	 	TopTip =[[<(ifragments#16#18)><(c0xFFb6946c)当前挑战：]]..var.days.TTTLayer..[[层><(c0xFF00c0ff)(记录最高层,再次进入可直达,次日重置)>]]
	 end
	
	local echo = [[
<(c0xFFb6946c)通天塔是仙装的重要产出途径，但是想要闯过通天塔，必须先消灭那些通天塔守卫。勇士，准备好了吗？>
<(c0xFF00c0ff)通天塔简单介绍:><(idecoLine#350)>
<(ifragments#16#18)><(c0xFFb6946c)60级即可进行闯关,共30层,每层奖励不同>
<(ifragments#16#18)><(c0xFFb6946c)每层挑战成功可获得奖励,每次进入所需><(c0xFF00FF00)10W><(c0xFFb6946c)绑金或金币>
<(ifragments#16#18)><(c0xFFb6946c)每层限时挑战><(c0xFF00FF00)3分钟><(c0xFFb6946c)，失败或掉线可以><(c0xFF00FF00)重新挑战>
<(c0xFF00c0ff)通天塔参与条件：><(idecoLine#350)>
<(ifragments#16#18)><(c0xFFb6946c)活动奖励：>]]..strRewardicon..[[

]]..TopTip..[[
		  
	
                   <#BN进入闯关/@EnterTTT>
]]

	 return echo;
end

  

NpcDialog[404].EnterTTT = function(sysarg)
	EnterTongTianTa(sysarg)
end


