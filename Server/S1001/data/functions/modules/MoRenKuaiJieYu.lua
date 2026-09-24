MorenKuaiJieYuConfig = 
{
"你瞅啥?找削呢?",
"能动手,尽量别吵吵!",
"不要怂,就是干!",
"都来皇城门口集合,杀人爆装备的时候到了!",
"刚才不是很狂吗?有本事来杀我啊!",
"打的就是你,不服气来干我,随时奉陪!",
"就这样还想杀我?就问你拿什么跟我打!",
"话不多说,我们王城皇宫见!",
"兄弟们,活动了,速度集合!",
"不要跑,决战到天亮!",
"你要战,我便战,我有兄弟千千万!",
"大家整理包裹，买好药水，做好准备，王城集合!",
"快点啊,我等的花儿都谢了",
"恕我直言,在座的各位都是渣渣",
"此路是我开,此树是我栽,要想从此过,留下买路财!",
}


KuaiJieYu = function (sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	
	if msgid == 0 then	--获取数据
		GetKuaiJieYuInfo(sysarg)
	elseif msgid == 1 then --修改快捷语
		ChangeKuaiJieYu(sysarg,DataPack.readByte(packet),DataPack.readString(packet))
	elseif msgid == 2 then --添加快捷语
		AddKuaiJieYu(sysarg,DataPack.readString(packet))
	elseif msgid == 3 then --删除快捷语
		DelKuaiJieYu(sysarg,DataPack.readByte(packet))
	end

end

--获取数据
GetKuaiJieYuInfo = function(sysarg)
	--如果没有快捷语，那就搞个默认的
	local var = Actor.getStaticVar(sysarg);
	if var.kuaiJieYuS ==nil then 
		var.kuaiJieYuS={}
		for i=1,#MorenKuaiJieYuConfig do 
			var.kuaiJieYuS[i]=MorenKuaiJieYuConfig[i]
		end
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKuaiJieYu)
    DataPack.writeByte(netPack,0)   --发送全部快捷语

    if System.isCrossServer() and Actor.getEnterCrossType(sysarg) ~= 2 then
        local cfg = {
        "板砖在手 天下任我走！",
"抢了，你能怎么样！",
"欺负我们新区？在给我们一个月时间看谁打谁",
"老铁，一起打BOSS吧！",
"别走，我们在战300回合",
"你们这些老区的就知道抢，打不过，溜了溜了",
"大佬，求放过。",
"boss有人蹲点，谢谢。",
"我脾气不好，离我远点，别惹我。",
"还有三只，请稍等！",
"还有二只，请稍等！",
"还有一只，请稍等！",
"暂时有人，请排队",
"远古求坑，有坑的大神摆个座",
"合作蹲坑",
"最后一次了，别打我!!",
"我武功盖世,再这样我还手了!!",
"我的人你也敢动，再碰下试试!!",
"你是拿的喷水枪打的吗？凭意念输出？",
"大婶，老奶奶摔倒不扶就服你。",
"关公门前耍大刀，回去练练吧你。",
"人间处处有真情，不要打我行不行；天涯何处无芳草，换个人杀好不好。",
"法师废，话大学毕业的？为什么废，话那么多",
"打的我都心软了，你们认输吧。",
"我让你一个技能，也可以赢！",
"打你们就跟打怪一样。",
"我也不知道为啥，就觉得我们碾压你们，稳！",
"你们准备好躺地了？",
"一会打到你站不起来，你们可千万别哭啊",
"小妹妹需不需要男朋友？我有悟空的金箍棒",
"妹子战斗力不行，哥哥带你？",
"你这种人在小说里都活不过两行半！",
"辣鸡这词都不足以形容你！",
"你脖子以上瘫痪。脑残？",
"你是喝敌敌畏长大的嘛.没脑？",
"你脑子离家出走了吧？",
"你是属黄瓜的吗,这么欠拍？",
"你完美的躲过了所有的人样",
"草船上借的不就是你哦？",
"一个莎士比亚没有士！",
"求蹲坑！！！",
"后面来的请自觉排队！！！",
"一起配合打BOSS啊，我一次，你一次！！！",
"不服，来啊，揍的就是你！！！",
"我打完了，来个接坑的！！！",
"你这娃娃不自觉，欠教育，揍你没商量！！",
"李时珍的皮，看我不打爆你！",
"看爸爸蛇皮走位，气人不！",
"你这是自寻死路。",
"还有谁？我就问一下谁能赐我一死！",
"我不是针对你，在座的都是垃圾。",
"有能耐就来锤我，锤不过别哔哔。",
"你皮任你皮，把你当瓜皮！",

        }
        DataPack.writeByte(netPack,#cfg)			--快捷语的条数
        for i=1,#cfg do 
		    DataPack.writeString(netPack,cfg[i])  
	    end
    else
        local nCount = GetTiaoShu(sysarg)
        DataPack.writeByte(netPack,nCount)			--快捷语的条数
	    for i=1,nCount do 
		    DataPack.writeString(netPack,var.kuaiJieYuS[i])  
	    end
    end

    DataPack.flush(netPack)
end

--修改快捷语
ChangeKuaiJieYu= function(sysarg,index,str)
	if str=="" then 
		return  
	end
	--如果没有快捷语，那就搞个默认的
	local var = Actor.getStaticVar(sysarg);
	if var.kuaiJieYuS ==nil then 
		var.kuaiJieYuS={}
		for i=1,#MorenKuaiJieYuConfig do 
			var.kuaiJieYuS[i]=MorenKuaiJieYuConfig[i]
		end
	end
	
	if GetTiaoShu(sysarg)<index or index<1 then --index超出范围了
		return 
	end

	--修改成功
	var.kuaiJieYuS[index] = str
	GetKuaiJieYuInfo(sysarg)
end


--添加快捷语
AddKuaiJieYu= function(sysarg,str)
	if str=="" then 
		return  
	end
	--如果没有快捷语，那就搞个默认的
	local var = Actor.getStaticVar(sysarg);
	if var.kuaiJieYuS ==nil then 
		var.kuaiJieYuS={}
		for i=1,#MorenKuaiJieYuConfig do 
			var.kuaiJieYuS[i]=MorenKuaiJieYuConfig[i]
		end
	end
	
	if GetTiaoShu(sysarg)>=20 then 
		 Actor.sendTipmsg(sysarg,"添加失败,超过20条",ttFlyTip)
		return
	end
	
	local tiaoshu = GetTiaoShu(sysarg)
	var.kuaiJieYuS[tiaoshu+1] = str
	GetKuaiJieYuInfo(sysarg)
end

--删除快捷语
DelKuaiJieYu= function(sysarg,index)
	--如果没有快捷语，那就搞个默认的
	local var = Actor.getStaticVar(sysarg);
	if var.kuaiJieYuS ==nil then 
		var.kuaiJieYuS={}
		for i=1,#MorenKuaiJieYuConfig do 
			var.kuaiJieYuS[i]=MorenKuaiJieYuConfig[i]
		end
	end
	
	if GetTiaoShu(sysarg)<index or index<1 then --index超出范围了
		return 
	end
	
	--先前覆盖，就是删除
	local tiaoshu  = GetTiaoShu(sysarg)
	var.kuaiJieYuS[tiaoshu+1] = "" 
	for i=index,GetTiaoShu(sysarg) do 
		var.kuaiJieYuS[i]=var.kuaiJieYuS[i+1]
	end
	
	GetKuaiJieYuInfo(sysarg)
end

function GetTiaoShu(sysarg)	
	--如果没有快捷语，那就搞个默认的
	local var = Actor.getStaticVar(sysarg);
	if var.kuaiJieYuS ==nil then 
		var.kuaiJieYuS={}
		for i=1,#MorenKuaiJieYuConfig do 
			var.kuaiJieYuS[i]=MorenKuaiJieYuConfig[i]
		end
	end
	
	local Tiaoshu = 0
	for i=1,#var.kuaiJieYuS do 
		if var.kuaiJieYuS[i]~="" then 
			Tiaoshu = Tiaoshu +1
		end
	end
	return Tiaoshu
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cKuaiJieYu, KuaiJieYu)
