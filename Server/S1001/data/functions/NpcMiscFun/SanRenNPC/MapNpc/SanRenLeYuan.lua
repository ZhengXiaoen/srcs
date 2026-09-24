local t = {}

local data={
	{id=279,needyb=500, needjb=1000000,needbjb=1000000,entersceneid=9,},
	{id=280,needyb=600, needjb=1200000,needbjb=1200000,entersceneid=279,},
	{id=281,needyb=700, needjb=1400000,needbjb=1400000,entersceneid=280,},
	{id=282,needyb=800, needjb=1600000,needbjb=1600000,entersceneid=281,},
	{id=283,needyb=900, needjb=1800000,needbjb=1800000,entersceneid=282,},
	{id=284,needyb=1000,needjb=2000000,needbjb=2000000,entersceneid=283,},
	{id=285,needyb=1100,needjb=2200000,needbjb=2200000,entersceneid=284,},
	{id=286,needyb=1200,needjb=2400000,needbjb=2400000,entersceneid=285,},

}

t.main = function(sysarg)

	local var = Actor.getStaticVar(sysarg)
	local echo =""

		echo = [[
	
<(c0xFF00c0ff)散人乐园简介><(idecoLine#350)>

      <(c0xFFb6946c)1. 散人乐园每层每日都可免费进入一次>
      <(c0xFFb6946c)2. 地图内怪物血少攻击高>
      <(c0xFFb6946c)3. 进入的层数越高，掉落的装备等级越高>
      <(c0xFFff9000)4. 最后一层有超高几率掉落7转装备！！！>

  <(c0xFF00c0ff)散人乐园进入条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFFeabc78)等级达到80级>
      <(idecoLine#350)>
	
	]]
	local myid = Actor.getSceneId(sysarg)
	local index =9
	for i=1,#data do
		if myid == data[i].entersceneid then 
			index=i
		end
	end
	if var.days.sanrenleyuan ==nil then 
		var.days.sanrenleyuan ={}
	end
	if var.days.sanrenleyuan[index] == nil then 
		if index==9 then 
			echo=echo.."<返回城镇/@enter,-1,"..index..">"
		else 
			echo=echo.."<免费进入/@enter,-1,"..index..">"
		end
	else 
		echo=echo.."<"..data[index].needyb.."元宝进入/@enter,3,"..index.."> \\ 	<"..data[index].needjb.."金币进入/@enter,1,"..index.."> \\ 	<"..data[index].needbjb.."绑定金币进入/@enter,0,"..index..">"
	end
	return echo;
end

t.enter = function(sysarg,way,index)

	way=tonumber(way)
	index=tonumber(index)
	if not (way==-1 or way ==3 or way ==1 or way ==0 ) then 
		return --非法进入 
	end	
	if index<1 or index>9 then 
		return --非法进入
	end
	
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if pLv<80 then 
		Actor.sendTipmsg(sysarg,"您等级不足80级，无法进入", ttFlyTip) 
		return t.main(sysarg)
	end
	
	--print("way"..way)
	--print("index"..index)
	
	local var = Actor.getStaticVar(sysarg)
	if way == -1 then --免费进入
		if index == 9 then
			Actor.enterScene(sysarg,9,-1,-1)
		else 
			Actor.enterScene(sysarg,data[index].id,-1,-1)
			if var.days.sanrenleyuan ==nil then 
				var.days.sanrenleyuan ={}
			end
			var.days.sanrenleyuan[index]=1
		end
	elseif way == 3 then 
		if Actor.getMoneyCount(sysarg,3)<data[index].needyb then
			Actor.sendTipmsg(sysarg,"您不够元宝，无法进入", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,3,-data[index].needyb,2620,"散人乐园元宝进入");
		Actor.enterScene(sysarg,data[index].id,-1,-1)
	elseif way == 1 then 
		if Actor.getMoneyCount(sysarg,1)<data[index].needjb then	
			Actor.sendTipmsg(sysarg,"您不够金币，无法进入", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,1,-data[index].needjb,2620,"散人乐园金币进入");
		Actor.enterScene(sysarg,data[index].id,-1,-1)
	elseif way ==0 then
		if Actor.getMoneyCount(sysarg,0)<data[index].needbjb then
			Actor.sendTipmsg(sysarg,"您不够绑定金币，无法进入", ttFlyTip) 
			return t.main(sysarg)
		end
		Actor.changeMoney(sysarg,0,-data[index].needbjb,2620,"散人乐园绑金进入");
		Actor.enterScene(sysarg,data[index].id,-1,-1)
	end
end


function GetNpcSanRenLeYuan() return t end