

NpcDialog[394] = {
	
	needItem = 5581,
	bossId = 1043 ,
	sceneId = 10,
	bossLayer = 99,
	rewardYuanBao = 300,
	point={93,86},
	Award = {

{weight= 180,award={{type=-1,bossid=667,count=1,bind=1,name="白虎"},},},--增加宠物
{weight= 150,award={{type=0,id=484,count=1,bind=1,name="功勋令牌(小)"},},},--功勋令牌(小)
{weight= 100,award={{type=0,id=488,count=1,bind=1,name="成就令牌(小)"},},},--成就令牌(小)
{weight= 56,award={{type=0,id=5171,count=5,bind=1,name="神魂"},},},--神魂
{weight= 52,award={{type=0,id=465,count=3,bind=1,name="2级羽毛"},},},--2级羽毛
{weight= 50,award={{type=0,id=551,count=1,bind=1,name="战将灵力丹(小)"},},},--战将灵力丹(小)
{weight= 48,award={{type=0,id=572,count=1,bind=1,name="圣珠结晶(100)"},},},--圣珠结晶(100)
{weight= 46,award={{type=0,id=537,count=1,bind=1,name="宝石结晶(100)"},},},--宝石结晶(100)
{weight= 44,award={{type=0,id=463,count=1,bind=1,name="战将附体令"},},},--战将附体令
{weight= 42,award={{type=0,id=550,count=1,bind=1,name="战将灵力石"},},},--战将灵力石
{weight= 40,award={{type=0,id=507,count=1,bind=1,name="金条(绑金)"},},},--金条(绑金)
{weight= 38,award={{type=0,id=510,count=1,bind=1,name="赎罪药水"},},},--赎罪药水
{weight= 36,award={{type=0,id=535,count=1,bind=1,name="护符碎片(1000颗)"},},},--护符碎片(1000颗)
{weight= 34,award={{type=0,id=569,count=1,bind=1,name="护盾碎片(1000颗)"},},},--护盾碎片(1000颗)
{weight= 32,award={{type=0,id=512,count=1,bind=1,name="200万经验丹"},},},--200万经验丹
{weight= 30,award={{type=0,id=469,count=5,bind=1,name="书页"},},},--书页
{weight= 28,award={{type=0,id=81,count=10,bind=1,name="万年人参"},},},--万年人参
{weight= 26,award={{type=0,id=85,count=1,bind=1,name="祝福油"},},},--祝福油
{weight= 24,award={{type=0,id=373,count=1,bind=1,name="高阶装备箱"},},},--高阶装备箱
{weight= 22,award={{type=0,id=5475,count=1,bind=1,name="玛雅神殿证明"},},},--玛雅神殿证明
{weight= 20,award={{type=0,id=560,count=1,bind=1,name="天山雪莲(60w)"},},},--天山雪莲(60w)
{weight= 18,award={{type=0,id=511,count=1,bind=1,name="100万经验丹"},},},--100万经验丹
{weight= 16,award={{type=0,id=548,count=5,bind=1,name="转生地宫证明"},},},--转生地宫证明
{weight= 14,award={{type=0,id=5383,count=1,bind=1,name="经验丹(50万)"},},},--经验丹(50万)
{weight= 12,award={{type=0,id=464,count=7,bind=1,name="1级羽毛"},},},--1级羽毛
{weight= 10,award={{type=0,id=491,count=1,bind=1,name="荒古传送卷"},},},--荒古传送卷
{weight= 8,award={{type=0,id=5382,count=1,bind=1,name="经验丹(30万)"},},},--经验丹(30万)
{weight= 5,award={{type=0,id=678,count=5,bind=1,name="副本传送卷"},},},--副本传送卷
{weight= 3,award={{type=0,id=459,count=5,bind=1,name="星纹强化石"},},},--星纹强化石
{weight= 1,award={{type=0,id=80,count=20,bind=1,name="疗伤药"},},},--疗伤药

--{weight= 1,award={{type=67,id=0,count=100,bind=1,name="军魂值"},},},--军魂值  --测试有效
--{weight= 1,award={{type=68,id=0,count=100,bind=1,name="斗笠精华"},},},--斗笠值
--{weight= 1,award={{type=46,id=0,count=100,bind=1,name="护符碎片"},},},--护符
--{weight= 1,award={{type=45,id=0,count=100,bind=1,name="护盾碎片"},},},--护盾
--{weight= 1,award={{type=47,id=0,count=100,bind=1,name="宝石结晶"},},},--宝石
--{weight= 1,award={{type=42,id=0,count=100,bind=1,name="圣珠结晶"},},},--圣珠
--{weight= 1,award={{type=41,id=0,count=100,bind=1,name="功勋值"},},},--功勋
--{weight= 1,award={{type=11,id=0,count=100,bind=1,name="成就值"},},},--成就
--{weight= 1,award={{type=57,id=0,count=100,bind=1,name="内功值"},},},--内功
--{weight= 1,award={{type=5,id=0,count=100,bind=1,name="绑定金币"},},},--绑定金币
--{weight= 1,award={{type=6,id=0,count=100,bind=1,name="金币"},},},--金币



--
	}
	
}
NpcDialog[394].main = function(sysarg)
	--//主显示内容
	local svar = System.getStaticVar()
	if svar.allGlodStore ==nil then 
		svar.allGlodStore =0
	end
	local echo = [[

  <(c0xFF00c0ff)蚩尤结阵描述:>
   <(c0xFFeabc78)上古时期蚩尤大将不敌黄帝被封印结阵中,千年后结阵出现裂痕,蚩尤大将即将携带宝藏席卷大陆.><(idecoLine#350)>

   <(c0xFFeabc78)传闻><魔法神石><(c0xFFeabc78)可让结阵加快破裂>
	<(c0xFFeabc78)每向结阵投入一颗便会增加一层以及获得300元宝奖励.>
   <魔法神石><(c0xFFeabc78)将在各大Boss以及个人挑战BOSS中产出>
  <(idecoLine#350)>
  <(c0xFFeabc78)当前结阵层数><(c0xFF00FF00) ]]..svar.allGlodStore..[[ 层 >

  <结阵层数达到><(c0xFF00FF00)]]..NpcDialog[394].bossLayer..[[><层蚩尤大将将出现在热血王城(93:86)>

  <(c0xFF00c0ff)蚩尤大将携带巨大宝藏,人人得而诛之,神兵利器杀它便可获得>

	<投入神石/@onGiveShenShiFunc><(c0xFFeabc78)每日投入10颗神石可开启地宫入口,跨天重置>
	<一键填满/@onFillShenShiFunc>

	<(c0xFFeabc78)蚩尤地宫BOSS有几率掉落翅膀装备：凡·羽骨、凡·羽灵、凡·羽魂、凡·羽翼。>

				<#BN蚩尤地宫/@onEnterMapFunc>
]]


	 return echo;
end

NpcDialog[394].onEnterMapFunc = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.	days.MFJZtime ==nil then 
		var.days.MFJZtime=0 
	end
	
	if var.days.MFJZtime<10 then 
		Actor.sendTipmsg(sysarg,"当前投入神石为"..var.days.MFJZtime.."个,入口尚未开启",ttFlyTip)
		return 
	end
	
	Actor.enterScene(sysarg,632,-1,-1)
	
	local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local x, y = Actor.getEntityPosition(sysarg,0,0)
	System.sendCommonLog(511,nActorId,Actor.getName(sysarg),x,y,0,"","","蚩尤地宫")
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家向蚩尤结阵投入10颗神石,成功开启蚩尤地宫,高转boss,高级装备就在里面！我也要去<(x威龙城:132:137:[传])>",Actor.getName(sysarg)),ttChatWindow)
	--System.broadcastTipmsg(string.format("<(n%s)>玩家向蚩尤结阵投入10颗神石,成功开启蚩尤地宫,高转boss,高级装备就在里面！我也要去<(威龙城:132:137:[传])>",Actor.getName(sysarg),ttChatWindow)
end

LocalDT.GiveMoFaJieZhenShenShi = function(sysarg, fillAll)
	--判断物品数量
	local itemCount = Actor.getItemCount(sysarg,NpcDialog[394].needItem)
	if itemCount<=0 then
		Actor.sendTipmsg(sysarg,"魔法神石不足",ttFlyTip)
		return NpcDialog[394].main(sysarg)
	end
	
	
	--一键投入最多补足本轮结阵，神石不足时投入全部持有数量
	local svar = System.getStaticVar()
	if svar.allGlodStore ==nil then 
		svar.allGlodStore =0
		
	end
	local count = 1
	if fillAll then
		count = math.min(itemCount, NpcDialog[394].bossLayer - svar.allGlodStore)
	end
	if count<=0 then
		return NpcDialog[394].main(sysarg)
	end
	--按实际扣除数量结算，扣除失败时不增加层数或发放奖励
	count = Actor.removeItem(sysarg, NpcDialog[394].needItem, count, -1, -1, -1,"投入魔法结阵", LogIds.MoFaJieZhen)
	if count<=0 then
		Actor.sendTipmsg(sysarg,"魔法神石不足",ttFlyTip)
		return NpcDialog[394].main(sysarg)
	end
	svar.allGlodStore = svar.allGlodStore + count
	--记录
	System.sendCommonLog(LogIds.chiyoujiezhen,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,svar.allGlodStore.."蚩尤结阵")
	
	--创建boss
	if svar.allGlodStore==NpcDialog[394].bossLayer then 
		svar.allGlodStore = 0
		--创建boss
		local hScene = Fuben.getSceneHandleById(NpcDialog[394].sceneId,0) --取的secne的handle
		local pMonster = Fuben.createMonster(hScene, NpcDialog[394].bossId, NpcDialog[394].point[1],  NpcDialog[394].point[2], 0)
		--广播
		
		local RwData = {"xxx", "热血王城", 93,96, "我要前往击杀"}
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
		
		System.broadcastTipmsg(string.format("魔法结阵出现破裂,万恶的蚩尤大将携带宝藏出现在热血王城93:86 试问何人可挡?%s %s",  NpcName, NpctFly), ttChatWindow)	
	
	
	end
	
	local rewardYuanBao = NpcDialog[394].rewardYuanBao * count
	Actor.changeMoney(sysarg, mtYuanbao, rewardYuanBao, LogIds.MoFaJieZhen, "投入魔法结阵")
	
	local var = Actor.getStaticVar(sysarg)
	if var.	days.MFJZtime ==nil then 
		var.days.MFJZtime=count
	else
		var.days.MFJZtime = var.days.MFJZtime + count
	end
	Actor.sendTipmsg(sysarg,"今天投入神石"..var.days.MFJZtime.."个,获得"..rewardYuanBao.."元宝",ttFlyTip)
	System.broadcastTipmsg(string.format("<(n%s)>玩家向结阵投入神石,获得<(c0xFF00FF00)%d元宝>", Actor.getName(sysarg), rewardYuanBao), 128);
	return NpcDialog[394].main(sysarg)
end

NpcDialog[394].onGiveShenShiFunc = function(sysarg)
	return LocalDT.GiveMoFaJieZhenShenShi(sysarg, false)
end

NpcDialog[394].onFillShenShiFunc = function(sysarg)
	return LocalDT.GiveMoFaJieZhenShenShi(sysarg, true)
end

--测试用的
function makeshenshi(sysarg,n)
	--总数+1
	local svar = System.getStaticVar()
	if svar.allGlodStore ==nil then 
		svar.allGlodStore =0
	end
	n = tonumber(n)
	svar.allGlodStore = n
end
