--[[File:ZhanZheKaReward.lua]]
--[[
配置内容说明：
	[1]		表示增值卡的类型
	value		表示 此类型的卡每个玩家能用多少次，-1表示无限次 
	rewardtype	奖励类型 1 物品 2 金钱 ... 其余可自定义
	type		奖励内容的类型  目前只用作金钱类型
	amount		奖励数量 物品数量  或者  金额
	itemid		奖励的物品ID数量  
	---------------  version 与 platformList 是互斥的，同时只能有一个
	version		版号（版号不同，领取次数会重置，默认为0）
	platformList	每月都可以再领的平台列表 {1,2,3}, 如果是 -1 则为所有平台  数字是写平台ID  比如5399 是6 
	---------------

注意事项:
最好不奖励太多的物品，因为多了可能会导致玩家背包满了领不到奖励的概率大大提高

文档地址：
	svn://192.168.0.160/idgp/Dragon/X-新传奇项目系统文档/Z.增值卡/增值卡类型及相关奖励.docx

具体内容：
	1|新手礼包---散人传说51
    2|手机礼包 ---散人传说51
	3|超级会员礼包---散人传说51
	4|超级VIP会员礼包---散人传说51
	5|逐日礼包---散人传说51
	6|战神礼包---散人传说51
	7|白银礼包---散人传说51
	8|黄金礼包---散人传说51
	9|钻石礼包---散人传说51
	10|预约礼包---散人传说51
	11|青铜礼包---散人传说51
	12|狂战礼包---散人传说51
	13|贵宾礼包---散人传说51
	14|超级贵宾礼包---散人传说51
	15|微信礼包---散人传说51
	16|神威闯关礼包---散人传说51
	17|军团战场礼包---散人传说51
	18|兽人商队礼包---散人传说51
	19|激情闭关礼包---散人传说51
	20|网吧营销大师卡---散人传说51
	21|女神微信礼包---散人传说51
	22|生日祝福礼包---散人传说51
	23|霸气冲天礼包---散人传说51
	24|唯我独尊礼包---散人传说51
	25|耀武扬威礼包---散人传说51
	26|豪情壮志礼包---散人传说51
	27|横扫天下礼包---散人传说51
	28|醉卧沙场礼包---散人传说51
	29|烽火连城礼包---散人传说51
	30|雄图霸业礼包---散人传说51
	31|5000元宝礼包---散人传说51
	32|20000元宝礼包---散人传说51
	33|50000元宝礼包---散人传说51
	34|时来运转礼包---散人传说51
	35|得心应手礼包---散人传说51
	36|一代天骄礼包---散人传说51
	37|君临天下礼包---散人传说51
	38|荣耀至尊礼包---散人传说51
	39|至尊霸者礼包---散人传说51
	40|签到礼包(一)---散人传说51
	41|签到礼包(二)---散人传说51
	42|签到礼包(三)---散人传说51
	43|签到礼包(四)---散人传说51
	44|签到礼包(五)---散人传说51
	45|签到礼包(六)---散人传说51
	46|签到礼包(七)---散人传说51
	47|签到礼包(八)---散人传说51
	48|积分礼包(一)---散人传说51
	49|积分礼包(二)---散人传说51
	50|积分礼包(三)---散人传说51
	51|积分礼包(四)---散人传说51
	52|积分礼包(五)---散人传说51
	53|积分礼包(六)---散人传说51
	54|散人预约礼包---散人传说51
	55|凌云壮志礼包---散人传说51
	56|一统天下礼包---散人传说51
	57|八荒并吞礼包---散人传说51
	58|青云直上礼包---散人传说51
	59|山河社稷礼包---散人传说51
	60|天下无名礼包---散人传说51
	61|一飞冲霄礼包---散人传说51
	62|一鸣惊人礼包---散人传说51
	63|九天一统礼包---散人传说51
	64|扶摇直上礼包---散人传说51
	65|传奇礼包---散人传说51
	66|独霸礼包---散人传说51
	67|土豪礼包---散人传说51
	68|累计签到礼包（一）---散人传说51
	69|累计签到礼包（二）---散人传说51
	70|累计签到礼包（三）---散人传说51
	71|累计签到礼包（四）---散人传说51
	72|累计签到礼包（五）---散人传说51
	73|国庆礼包---散人传说51
	74|中秋礼包---散人传说51
	75|霸王礼包---散人传说51
	76|朱雀礼包---散人传说51
	77|白虎礼包---散人传说51
	78|青龙礼包---散人传说51
	79|玄武礼包---散人传说51
	80|至尊朱雀礼包---散人传说51
	81|至尊白虎礼包---散人传说51
	82|至尊青龙礼包---散人传说51
	83|至尊玄武礼包---散人传说51
	84|28888元宝礼包---散人传说51
	85|8888元宝礼包---散人传说51
	86|1888元宝礼包---散人传说51
	87|转生地宫证明---散人传说51
	88|金条(绑金)---散人传说51
	89|金砖(绑金)---散人传说51
	90|大金砖(绑金)---散人传说51
	91|天山雪莲(120w)---散人传说51
	92|天山雪莲(60w)---散人传说51
	93|特戒结晶(1)---散人传说51
	94|战将灵力丹(小)---散人传说51
	95|战将灵力丹(中)---散人传说51
	96|战将灵力丹(大)---散人传说51
	97|成就令牌(小)---散人传说51
	98|成就令牌(中)---散人传说51
	99|成就令牌(大)---散人传说51
	100|宝石结晶(100)---散人传说51
	101|宝石结晶(1000)---散人传说51
	102|宝石结晶(10000)---散人传说51
	103|圣珠结晶(100)---散人传说51
	104|圣珠结晶(1000)---散人传说51
	105|圣珠结晶(10000)---散人传说51
	106|转生修为丹(小)---散人传说51
	107|转生修为丹(中)---散人传说51
	108|转生修为丹(大)---散人传说51
	109|九花玉露丸---散人传说51
	110|斗笠精华(小)---散人传说51
	111|斗笠精华(中)---散人传说51
	112|斗笠精华(大)---散人传说51
	113|玛雅神殿证明---散人传说51
	114|副本传送卷---散人传说51
	115|超级经验玉---散人传说51
	116|神级经验玉---散人传说51
	117|神魂100---散人传说51
	118|内功经验卷(小)---散人传说51
	119|功勋令牌(小)---散人传说51
	120|护符碎片(1000颗)---散人传说51
	121|护符碎片(10000颗)---散人传说51
	122|护盾碎片(1000颗)---散人传说51
	123|护盾碎片(10000颗)---散人传说51
	124|一阶宝石袋---散人传说51
	125|二阶宝石袋---散人传说51
	126|三阶宝石袋---散人传说51
	127|散人积分礼包---搜狗礼包
	128|散人黄金礼包---搜狗礼包
	129|散人钻石礼包---搜狗礼包
	130|散人至尊礼包---搜狗礼包
	131|散人积分礼包---散人传说51
	132|散人至尊礼包---散人传说51

	133|萍水相逢礼包---散人传说51  全平台通用
	134|一面之缘礼包---散人传说51全平台通用
	135|患难与共礼包---散人传说51全平台通用
	136|不离不弃礼包---散人传说51全平台通用
	137|莫逆之交礼包---散人传说51全平台通用
	138|誓同生死礼包---散人传说51全平台通用
	139|花好月圆礼包---散人传说51全平台通用
	140|普天同庆礼包---散人传说51全平台通用

	141|渠道礼包---2144平台
	142|手机验证礼包---2144平台
	143|VIP验证礼包---2144平台
	144|VIP大户生日礼包---2144平台
	145|2144盒子礼包---2144平台

	146|30000元宝礼包---全平台
	147|10000元宝礼包---全平台
	148|12888元宝礼包---全平台
	149|18888元宝礼包---全平台
	150|热血礼包---全平台
	151|狂欢礼包---全平台
	152|王者礼包---全平台
	153|决战礼包---全平台
	154|弑神礼包---全平台
	155|英雄礼包---全平台
	156|5888元宝礼包--全平台

	157|公测礼包--51平台
	158|九尾礼包--51平台
	159|雷炎礼包--51平台
	160|雪域礼包--51平台
	161|尸王礼包--51平台
	162|沃玛礼包--51平台
	163|祖玛礼包--51平台
	164|魔王礼包--51平台
	165|感恩礼包--51平台
	166|紫气东来礼包--51平台
	167|轩辕礼包--51平台
	168|浩然正气礼包--51平台
	169|万紫千红礼包--51平台
	170|斗战天下礼包--51平台

	171|1000元宝礼包--51平台
	172|51超级会员--51平台
	173|51超级VIP--51平台

	174|双12礼包--全平台通用
	175|圣诞礼包--全平台通用
	176|元旦礼包--全平台通用
	177|玄武大帝礼包--全平台通用
	178|双龙魔王礼包--全平台通用
	179|混沌至尊礼包--全平台通用
	180|逍遥战神礼包--全平台通用
	181|通天霸主礼包--全平台通用
	182|水晶骑士礼包--全平台通用
	183|王者战将礼包--全平台通用
	184|雪狼战将礼包--全平台通用
	185|修罗魔王礼包--全平台通用
	186|祖玛教主礼包--全平台通用
	187|玛雅教主礼包--全平台通用
	188|骷髅精灵礼包--全平台通用

	189|大神礼包--全平台通用
	190|超神礼包--全平台通用
	191|英雄归来礼包--全平台通用

	192|唯我独尊--51平台通用
	193|叱咤风云--51平台通用
	194|名扬天下--51平台通用

	195|才气无双礼包--51平台
	196|大势雄兵礼包--51平台
	197|至死不屈礼包--51平台
	198|烽火连天礼包--51平台
	199|纵横弛骋礼包--51平台
	200|登锋陷阵礼包--51平台
	201|决胜千里礼包--51平台
	202|火龙教主礼包--51平台
	203|地藏魔王礼包--51平台
	204|鬼魅妖狐礼包--51平台
	205|拜月教主礼包--51平台
	206|帝王教主礼包--51平台
	207|雷炎蜘蛛礼包--51平台
	208|赤月老魔礼包--51平台
	209|魔龙教主礼包--51平台
	210|触龙神礼包--51平台
	211|沃玛教主礼包--51平台

	212|情人节礼包--51平台
	213|春节礼包--51平台
	214|除夕礼包--51平台
	215|散人签到(一)--51平台
	216|散人签到(二)--51平台
	217|散人签到(三)--51平台
	218|散人签到(四)--51平台
	219|散人签到(五)--51平台
	220|永恒钻石礼包--51平台
	221|尊贵铂金礼包--51平台
	222|荣耀黄金礼包--51平台
	223|秩序白银礼包--51平台
	224|感谢有你--51平台

	225|5399签到礼包(一)---5399
	226|5399签到礼包(二)---5399
	227|5399签到礼包(三)---5399
	228|5399签到礼包(四)---5399
	229|5399签到礼包(五)---5399
	230|5399签到礼包(六)---5399
	231|5399签到礼包(七)---5399
	232|5399签到礼包(八)---5399

	233|庆典嘉年华礼包(一)---51
	234|庆典嘉年华礼包(二)---51
	235|庆典嘉年华礼包(三)---51
	236|周年庆特色服礼包---51

    237|新手卡--酷爱玩
	238|白银礼盒--酷爱玩
	239|黄金礼盒--酷爱玩
	240|铂金礼盒--酷爱玩
	241|钻石礼盒--酷爱玩
	242|微信礼盒--酷爱玩
	243|媒体礼盒--酷爱玩
	244|独家礼盒--酷爱玩
	245|星耀特权礼盒--酷爱玩
	246|王者特权礼盒--酷爱玩
	247|荣耀特权礼盒--酷爱玩
	248|VIP礼盒--酷爱玩
	249|SVIP礼盒--酷爱玩

	250|端午礼包--2018端午节礼包
	251|贵宾生日礼包--全平台礼包
	252|大户生日礼包--全平台礼包

	253|壕礼宝箱卷--51平台
	254|时装礼盒卷--51平台
	255|灵器礼盒卷--51平台
	256|屠龙礼盒卷--51平台
	257|传世宝箱卷--51平台
	258|龍装Ⅰ装备卷--51平台
	259|龍装Ⅱ装备卷--51平台
	260|幻羽礼盒卷--51平台
	261|坐骑礼盒卷--51平台
	262|三国时装礼盒卷--51平台
	263|元神装备卷--51平台

	264|节日大礼包--51平台

	265|搜狗微信礼包--搜狗平台微信礼包

	266|步步高升礼包--51平台
	267|劳动节礼包--51平台
	268|赛龙舟礼包--51平台
	269|寄相思礼包--51平台
	270|我爱中国礼包--51平台
	271|感恩节礼包--51平台
	272|千丝万缕 --51平台
	273|感恩有你--51平台
	274|肉袒负荆--51平台
	275|负荆请罪 --51平台
	276|热泪盈眶 --51平台
	277|至真至纯 --51平台



	









        





--]]

ZhanZheKaReward = 
{ 
  --count	奖励数量 物品数量  
  --itemid 物品的id; count 物品的数量; quality 品质; strong 强化; bind 是否绑定 
	[1] = 
	{ 
		value = 1,
		--version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 636, quality=0, strong=0, bind=1, },--新手礼包
	},
	[2] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 627, quality=0, strong=0, bind=1 },--手机礼包
	},
	[3] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 641, quality=0, strong=0, bind=1 },--超级会员礼包
	},
	[4] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 642, quality=0, strong=0, bind=1 },--超级VIP会员礼包
	},
	[5] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 643, quality=0, strong=0, bind=1 },--逐日礼包
	},
	[6] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 644, quality=0, strong=0, bind=1 },--战神礼包
	},
	[7] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 645, quality=0, strong=0, bind=1 },--白银礼包
	},
	[8] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 646, quality=0, strong=0, bind=1 },--黄金礼包
	},
	[9] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 647, quality=0, strong=0, bind=1 },--钻石礼包
	},
	[10] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5128, quality=0, strong=0, bind=1 },--预约礼包
	},
	[11] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5129, quality=0, strong=0, bind=1 },--青铜礼包
	},
	[12] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5130, quality=0, strong=0, bind=1 },--狂战礼包
	},
	[13] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5131, quality=0, strong=0, bind=1 },--贵宾礼包
	},
	[14] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5132, quality=0, strong=0, bind=1 },--超级贵宾礼包
	},
	[15] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5133, quality=0, strong=0, bind=1 },--微信礼包
	},
	[16] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5134, quality=0, strong=0, bind=1 },--神威闯关礼包
	},
	[17] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5135, quality=0, strong=0, bind=1 },--军团战场礼包
	},
	[18] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5136, quality=0, strong=0, bind=1 },--兽人商队礼包
	},
	[19] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5137, quality=0, strong=0, bind=1 },--激情闭关礼包
	},

	[20] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5156, quality=0, strong=0, bind=1 },--网吧营销大师卡
	},

	[21] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5157, quality=0, strong=0, bind=1 },--女神微信礼包
	},
	[22] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5158, quality=0, strong=0, bind=1 },--生日祝福礼包
	},
	[23] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5371, quality=0, strong=0, bind=1 },--霸气冲天礼包
	},
	[24] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5372, quality=0, strong=0, bind=1 },--唯我独尊礼包
	},
	[25] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5373, quality=0, strong=0, bind=1 },--耀武扬威礼包
	},
	[26] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5374, quality=0, strong=0, bind=1 },--豪情壮志礼包
	},
	[27] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5375, quality=0, strong=0, bind=1 },--横扫天下礼包
	},
	[28] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5376, quality=0, strong=0, bind=1 },--醉卧沙场礼包
	},
	[29] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5377, quality=0, strong=0, bind=1 },--烽火连城礼包
	},
	[30] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5378, quality=0, strong=0, bind=1 },--雄图霸业礼包
	},
	[31] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5458, quality=0, strong=0, bind=1 },--5000元宝礼包
	},

	[32] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5459, quality=0, strong=0, bind=1 },--20000元宝礼包
	},
	[33] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5460, quality=0, strong=0, bind=1 },--50000元宝礼包
	},
	[34] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5461, quality=0, strong=0, bind=1 },--时来运转礼包
	},
	[35] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5462, quality=0, strong=0, bind=1 },--得心应手礼包
	},
	[36] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5463, quality=0, strong=0, bind=1 },--一代天骄礼包
	},
	[37] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5464, quality=0, strong=0, bind=1 },--君临天下礼包
	},
	[38] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5465, quality=0, strong=0, bind=1 },--荣耀至尊礼包
	},
	[39] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5466, quality=0, strong=0, bind=1 },--至尊霸者礼包
	},

	[40] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5476, quality=0, strong=0, bind=1 },--签到礼包(一)
	},


	[41] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5477, quality=0, strong=0, bind=1 },--签到礼包(二)
	},


	[42] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5478, quality=0, strong=0, bind=1 },--签到礼包(三)
	},


	[43] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5479, quality=0, strong=0, bind=1 },--签到礼包(四)
	},


	[44] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5480, quality=0, strong=0, bind=1 },--签到礼包(五)
	},


	[45] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5481, quality=0, strong=0, bind=1 },--签到礼包(六)
	},


	[46] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5482, quality=0, strong=0, bind=1 },--签到礼包(七)
	},


	[47] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5483, quality=0, strong=0, bind=1 },--签到礼包(八)
	},


	[48] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5484, quality=0, strong=0, bind=1 },--积分礼包(一)
	},


	[49] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5485, quality=0, strong=0, bind=1 },--积分礼包(二)
	},


	[50] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5486, quality=0, strong=0, bind=1 },--积分礼包(三)
	},


	[51] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5487, quality=0, strong=0, bind=1 },--积分礼包(四)
	},


	[52] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5488, quality=0, strong=0, bind=1 },--积分礼包(五)
	},


	[53] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5489, quality=0, strong=0, bind=1 },--积分礼包(六)
	},


	[54] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5490, quality=0, strong=0, bind=1 },--散人预约礼包
	},

-- --模块
--    [(a1)] =
-- 	{
-- 		value = (a2),
-- 		{ rewardtype = (a3), type = (a4), amount = (a5), itemid = (a6), quality=(a7), strong=(a8), bind=(a9)},--(a10)
-- 	},

   [55] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5904, quality=0, strong=0, bind=1},--凌云壮志礼包
	},
   [56] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5905, quality=0, strong=0, bind=1},--一统天下礼包
	},
   [57] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5906, quality=0, strong=0, bind=1},--八荒并吞礼包
	},
   [58] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5907, quality=0, strong=0, bind=1},--青云直上礼包
	},
   [59] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5908, quality=0, strong=0, bind=1},--山河社稷礼包
	},
   [60] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5909, quality=0, strong=0, bind=1},--天下无名礼包
	},
   [61] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5910, quality=0, strong=0, bind=1},--一飞冲霄礼包
	},
   [62] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5911, quality=0, strong=0, bind=1},--一鸣惊人礼包
	},
   [63] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5912, quality=0, strong=0, bind=1},--九天一统礼包
	},
   [64] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5913, quality=0, strong=0, bind=1},--扶摇直上礼包
	},
   [65] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5914, quality=0, strong=0, bind=1},--传奇礼包
	},
   [66] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5915, quality=0, strong=0, bind=1},--独霸礼包
	},
   [67] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5916, quality=0, strong=0, bind=1},--土豪礼包
	},
   [68] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5917, quality=0, strong=0, bind=1},--累计签到礼包（一）
	},
   [69] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5918, quality=0, strong=0, bind=1},--累计签到礼包（二）
	},
   [70] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5919, quality=0, strong=0, bind=1},--累计签到礼包（三）
	},
   [71] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5920, quality=0, strong=0, bind=1},--累计签到礼包（四）
	},
   [72] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5921, quality=0, strong=0, bind=1},--累计签到礼包（五）
	},
   [73] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5922, quality=0, strong=0, bind=1},--国庆礼包
	},
   [74] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5923, quality=0, strong=0, bind=1},--中秋礼包
	},
   [75] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5924, quality=0, strong=0, bind=1},--霸王礼包
	},
   [76] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5925, quality=0, strong=0, bind=1},--朱雀礼包
	},
   [77] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5926, quality=0, strong=0, bind=1},--白虎礼包
	},
   [78] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5927, quality=0, strong=0, bind=1},--青龙礼包
	},
   [79] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5928, quality=0, strong=0, bind=1},--玄武礼包
	},
   [80] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5929, quality=0, strong=0, bind=1},--至尊朱雀礼包
	},
   [81] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5930, quality=0, strong=0, bind=1},--至尊白虎礼包
	},
   [82] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5931, quality=0, strong=0, bind=1},--至尊青龙礼包
	},
   [83] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5932, quality=0, strong=0, bind=1},--至尊玄武礼包
	},
   [84] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5933, quality=0, strong=0, bind=1},--28888元宝礼包
	},
   [85] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5934, quality=0, strong=0, bind=1},--8888元宝礼包
	},
   [86] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5935, quality=0, strong=0, bind=1},--1888元宝礼包
	},
   [87] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 548, quality=0, strong=0, bind=1},--转生地宫证明
	},
   [88] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 507, quality=0, strong=0, bind=1},--金条(绑金)
	},
   [89] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 508, quality=0, strong=0, bind=1},--金砖(绑金)
	},
   [90] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 509, quality=0, strong=0, bind=1},--大金砖(绑金)
	},
   [91] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 561, quality=0, strong=0, bind=1},--天山雪莲(120w)
	},
   [92] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 560, quality=0, strong=0, bind=1},--天山雪莲(60w)
	},
   [93] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 527, quality=0, strong=0, bind=1},--特戒结晶(1)
	},
   [94] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 551, quality=0, strong=0, bind=1},--战将灵力丹(小)
	},
   [95] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 552, quality=0, strong=0, bind=1},--战将灵力丹(中)
	},
   [96] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 553, quality=0, strong=0, bind=1},--战将灵力丹(大)
	},
   [97] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 488, quality=0, strong=0, bind=1},--成就令牌(小)
	},
   [98] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 489, quality=0, strong=0, bind=1},--成就令牌(中)
	},
   [99] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 490, quality=0, strong=0, bind=1},--成就令牌(大)
	},
   [100] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 537, quality=0, strong=0, bind=1},--宝石结晶(100)
	},
   [101] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 538, quality=0, strong=0, bind=1},--宝石结晶(1000)
	},
   [102] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 539, quality=0, strong=0, bind=1},--宝石结晶(10000)
	},
   [103] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 572, quality=0, strong=0, bind=1},--圣珠结晶(100)
	},
   [104] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 573, quality=0, strong=0, bind=1},--圣珠结晶(1000)
	},
   [105] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 574, quality=0, strong=0, bind=1},--圣珠结晶(10000)
	},
   [106] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 542, quality=0, strong=0, bind=1},--转生修为丹(小)
	},
   [107] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 543, quality=0, strong=0, bind=1},--转生修为丹(中)
	},
   [108] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 544, quality=0, strong=0, bind=1},--转生修为丹(大)
	},
   [109] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 4741, quality=0, strong=0, bind=1},--九花玉露丸
	},
   [110] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5645, quality=0, strong=0, bind=1},--斗笠精华(小)
	},
   [111] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5646, quality=0, strong=0, bind=1},--斗笠精华(中)
	},
   [112] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5647, quality=0, strong=0, bind=1},--斗笠精华(大)
	},
   [113] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5475, quality=0, strong=0, bind=1},--玛雅神殿证明
	},
   [114] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 678, quality=0, strong=0, bind=1},--副本传送卷
	},
   [115] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 482, quality=0, strong=0, bind=1},--超级经验玉
	},
   [116] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5468, quality=0, strong=0, bind=1},--神级经验玉
	},
   [117] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5166, quality=0, strong=0, bind=1},--神魂100
	},
   [118] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 4744, quality=0, strong=0, bind=1},--内功经验卷(小)
	},
   [119] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 484, quality=0, strong=0, bind=1},--功勋令牌(小)
	},
   [120] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 535, quality=0, strong=0, bind=1},--护符碎片(1000颗)
	},
   [121] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 536, quality=0, strong=0, bind=1},--护符碎片(10000颗)
	},
   [122] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 569, quality=0, strong=0, bind=1},--护盾碎片(1000颗)
	},
   [123] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 570, quality=0, strong=0, bind=1},--护盾碎片(10000颗)
	},
   [124] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5363, quality=0, strong=0, bind=1},--一阶宝石袋
	},
   [125] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5364, quality=0, strong=0, bind=1},--二阶宝石袋
	},
   [126] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5365, quality=0, strong=0, bind=1},--三阶宝石袋
	},



---如上是51礼包

   [127] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5939, quality=0, strong=0, bind=1},--散人积分礼包
	},

   [128] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5940, quality=0, strong=0, bind=1},--散人黄金礼包
	},

   [129] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5941, quality=0, strong=0, bind=1},--散人钻石礼包
	},

   [130] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5942, quality=0, strong=0, bind=1},--散人至尊礼包
	},


--搜狗礼包


--51礼包

   [131] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5945, quality=0, strong=0, bind=1},--积分礼包
	},

   [132] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5946, quality=0, strong=0, bind=1},--至尊礼包
	},



--全平台通用

   [133] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5952, quality=0, strong=0, bind=1},--萍水相逢礼包
	},

   [134] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5953, quality=0, strong=0, bind=1},--一面之缘礼包
	},

   [135] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5954, quality=0, strong=0, bind=1},--患难与共礼包
	},

   [136] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5955, quality=0, strong=0, bind=1},--不离不弃礼包
	},

   [137] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5956, quality=0, strong=0, bind=1},--莫逆之交礼包
	},

   [138] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5957, quality=0, strong=0, bind=1},--誓同生死礼包
	},

   [139] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5958, quality=0, strong=0, bind=1},--花好月圆礼包
	},

   [140] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 5959, quality=0, strong=0, bind=1},--普天同庆礼包
	},


--2144平台礼包

   [141] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6016, quality=0, strong=0, bind=1},--渠道礼包
	},


   [142] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6017, quality=0, strong=0, bind=1},--手机验证礼包
	},


   [143] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6018, quality=0, strong=0, bind=1},--VIP验证礼包
	},


   [144] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6019, quality=0, strong=0, bind=1},--VIP大户生日礼包
	},


   [145] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6020, quality=0, strong=0, bind=1},--2144盒子礼包
	},


--51全平台礼包
   [146] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6022, quality=0, strong=0, bind=1},--30000元宝礼包
	},

   [147] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6023, quality=0, strong=0, bind=1},--10000元宝礼包
	},


   [148] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6024, quality=0, strong=0, bind=1},--12888元宝礼包
	},


   [149] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6025, quality=0, strong=0, bind=1},--18888元宝礼包
	},


   [150] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6026, quality=0, strong=0, bind=1},--热血礼包
	},


   [151] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6027, quality=0, strong=0, bind=1},--狂欢礼包
	},


   [152] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6028, quality=0, strong=0, bind=1},--王者礼包
	},


   [153] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6029, quality=0, strong=0, bind=1},--决战礼包
	},


   [154] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6030, quality=0, strong=0, bind=1},--弑神礼包
	},

   [155] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6031, quality=0, strong=0, bind=1},--英雄礼包
	},

   [156] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6128, quality=0, strong=0, bind=1},--5888元宝礼包
	},


 --51平台礼包 11.09配置
    [157] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6165, quality=0, strong=0, bind=1},--公测礼包
	},

	[158] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6166, quality=0, strong=0, bind=1},--九尾礼包
	},

	[159] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6167, quality=0, strong=0, bind=1},--雷炎礼包
	},

	[160] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6168, quality=0, strong=0, bind=1},--雪域礼包
	},

	[161] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6169, quality=0, strong=0, bind=1},--尸王礼包
	},

	[162] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6170, quality=0, strong=0, bind=1},--沃玛礼包
	},

	[163] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6171, quality=0, strong=0, bind=1},--祖玛礼包
	},

	[164] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6172, quality=0, strong=0, bind=1},--魔王礼包
	},

	[165] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6173, quality=0, strong=0, bind=1},--感恩礼包
	},

	[166] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6174, quality=0, strong=0, bind=1},--紫气东来礼包
	},

	[167] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6175, quality=0, strong=0, bind=1},--轩辕礼包
	},

	[168] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6176, quality=0, strong=0, bind=1},--浩然正气礼包
	},

	[169] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6177, quality=0, strong=0, bind=1},--万紫千红礼包
	},

	[170] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6178, quality=0, strong=0, bind=1},--斗战天下礼包
	},

 --51平台礼包 11.14配置
	[171] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6184, quality=0, strong=0, bind=1},--1000元宝礼包
	},

	[172] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6276, quality=0, strong=0, bind=1},--51超级会员
	},


	[173] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6277, quality=0, strong=0, bind=1},--51超级VIP
	},

--全平台礼包 12.06配置
	[174] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6279, quality=0, strong=0, bind=1},--双12礼包
	},

	[175] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6280, quality=0, strong=0, bind=1},--圣诞礼包
	},

	[176] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6281, quality=0, strong=0, bind=1},--元旦礼包
	},

	[177] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6282, quality=0, strong=0, bind=1},--玄武大帝礼包
	},

	[178] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6283, quality=0, strong=0, bind=1},--双龙魔王礼包
	},

	[179] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6284, quality=0, strong=0, bind=1},--混沌至尊礼包
	},

	[180] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6285, quality=0, strong=0, bind=1},--逍遥战神礼包
	},

	[181] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6286, quality=0, strong=0, bind=1},--通天霸主礼包
	},

	[182] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6287, quality=0, strong=0, bind=1},--水晶骑士礼包
	},

	[183] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6288, quality=0, strong=0, bind=1},--王者战将礼包
	},

	[184] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6289, quality=0, strong=0, bind=1},--雪狼战将礼包
	},

	[185] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6290, quality=0, strong=0, bind=1},--修罗魔王礼包
	},

	[186] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6291, quality=0, strong=0, bind=1},--祖玛教主礼包
	},

	[187] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6292, quality=0, strong=0, bind=1},--玛雅教主礼包
	},

	[188] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6293, quality=0, strong=0, bind=1},--骷髅精灵礼包
	},

--全平台礼包 12.07配置
	[189] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6294, quality=0, strong=0, bind=1},--大神礼包
	},

	[190] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6295, quality=0, strong=0, bind=1},--超神礼包
	},


	[191] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6296, quality=0, strong=0, bind=1},--英雄归来礼包
	},

	[192] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6356, quality=0, strong=0, bind=1},--唯我独尊
	},

	[193] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6357, quality=0, strong=0, bind=1},--叱咤风云
	},

	[194] =
	{
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6358, quality=0, strong=0, bind=1},--名扬天下
	},

	

	[195] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6375, quality=0, strong=0, bind=1},--才气无双礼包
	},
	[196] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6376, quality=0, strong=0, bind=1},--大势雄兵礼包
	},
	[197] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6377, quality=0, strong=0, bind=1},--至死不屈礼包
	},
	[198] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6378, quality=0, strong=0, bind=1},--烽火连天礼包
	},
	[199] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6379, quality=0, strong=0, bind=1},--纵横弛骋礼包
	},
	[200] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6380, quality=0, strong=0, bind=1},--登锋陷阵礼包
	},
	[201] =
	{
		value = 1,
		version = 2, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6381, quality=0, strong=0, bind=1},--决胜千里礼包
	},
	[202] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6382, quality=0, strong=0, bind=1},--火龙教主礼包
	},
	[203] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6383, quality=0, strong=0, bind=1},--地藏魔王礼包
	},
	[204] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6384, quality=0, strong=0, bind=1},--鬼魅妖狐礼包
	},
	[205] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6385, quality=0, strong=0, bind=1},--拜月教主礼包
	},
	[206] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6386, quality=0, strong=0, bind=1},--帝王教主礼包
	},
	[207] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6387, quality=0, strong=0, bind=1},--雷炎蜘蛛礼包
	},
	[208] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6388, quality=0, strong=0, bind=1},--赤月老魔礼包
	},
	[209] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6389, quality=0, strong=0, bind=1},--魔龙教主礼包
	},

	[210] =
	{
		value = 1,
		version = 4, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6390, quality=0, strong=0, bind=1},--触龙神礼包
	},
	[211] =
	{
		value = 1,
		version = 3, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6391, quality=0, strong=0, bind=1},--沃玛教主礼包
	},

--51平台礼包 2018.1.24配置
	[212] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6661, quality=0, strong=0, bind=1},--情人节礼包
	},
	[213] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6662, quality=0, strong=0, bind=1},--春节礼包
	},
	[214] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6663, quality=0, strong=0, bind=1},--除夕礼包
	},
	[215] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6664, quality=0, strong=0, bind=1},--散人签到(一)
	},
	[216] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6665, quality=0, strong=0, bind=1},--散人签到(二)
	},
	[217] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6666, quality=0, strong=0, bind=1},--散人签到(三)
	},
	[218] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6667, quality=0, strong=0, bind=1},--散人签到(四)
	},
	[219] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6668, quality=0, strong=0, bind=1},--散人签到(五)
	},
	[220] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6669, quality=0, strong=0, bind=1},--永恒钻石礼包
	},
	[221] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6670, quality=0, strong=0, bind=1},--尊贵铂金礼包
	},
	[222] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6671, quality=0, strong=0, bind=1},--荣耀黄金礼包
	},
	[223] =
	{
		value = 1,
		version = 1, -- 版号（版号不同，领取次数会重置，默认为0）
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6672, quality=0, strong=0, bind=1},--秩序白银礼包
	},
	[224] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6673, quality=0, strong=0, bind=1},--感谢有你
	},


	[225] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6904, quality=0, strong=0, bind=1 },--5399签到礼包(一)
	},


	[226] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6905, quality=0, strong=0, bind=1 },--5399签到礼包(2)
	},

	[227] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6906, quality=0, strong=0, bind=1 },--5399签到礼包(3)
	},


	[228] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6907, quality=0, strong=0, bind=1 },--5399签到礼包(4)
	},


	[229] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6908, quality=0, strong=0, bind=1 },--5399签到礼包(5)
	},


	[230] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6909, quality=0, strong=0, bind=1 },--5399签到礼包(6)
	},


	[231] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6910, quality=0, strong=0, bind=1 },--5399签到礼包(7)
	},

	[232] =
	{
		value = 1,
		platformList = {6}, -- 5399平台的签到每个月重置
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6911, quality=0, strong=0, bind=1 },--5399签到礼包(8)
	},

	[233] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6925, quality=0, strong=0, bind=1 },--庆典嘉年华礼包(一)
	},

	[234] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6926, quality=0, strong=0, bind=1 },--庆典嘉年华礼包(2)
	},

	[235] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6927, quality=0, strong=0, bind=1 },--庆典嘉年华礼包(3)
	},

	[236] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6928, quality=0, strong=0, bind=1 },--庆典嘉年华礼包
	},

--酷爱玩礼包
	[237] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6954, quality=0, strong=0, bind=1, },--新手卡(KU25)
	},

	[238] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6955, quality=0, strong=0, bind=1, },--白银礼包(KU25)
	},

	[239] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6956, quality=0, strong=0, bind=1, },--黄金礼包(KU25)
	},

	[240] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6957, quality=0, strong=0, bind=1, },--铂金礼包(KU25)
	},

	[241] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6958, quality=0, strong=0, bind=1, },--钻石礼包(KU25)
	},

	[242] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6959, quality=0, strong=0, bind=1, },--微信礼包(KU25)
	},

	[243] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6960, quality=0, strong=0, bind=1, },--媒体礼包(KU25)
	},

	[244] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6961, quality=0, strong=0, bind=1, },--独家礼包(KU25)
	},

	[245] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6962, quality=0, strong=0, bind=1, },--星耀特权礼包(KU25)
	},

	[246] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6963, quality=0, strong=0, bind=1, },--王者特权礼包(KU25)
	},

	[247] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6964, quality=0, strong=0, bind=1, },--荣耀特权礼包(KU25)
	},

	[248] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6965, quality=0, strong=0, bind=1, },--VIP礼包(KU25)
	},

	[249] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 6966, quality=0, strong=0, bind=1, },--SVIP礼包(KU25)
	},

	[250] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7050, quality=0, strong=0, bind=1, },--端午节礼包
	},

	[251] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7075, quality=0, strong=0, bind=1, },--贵宾生日礼包
	},
	[252] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7076, quality=0, strong=0, bind=1, },--大户生日礼包
	},

--51全平台礼包
    [253] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7183, quality=0, strong=0, bind=1, },--壕礼宝箱卷
	},
	[254] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7184, quality=0, strong=0, bind=1, },--时装礼盒卷
	},
	[255] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7185, quality=0, strong=0, bind=1, },--灵器礼盒卷
	},
	[256] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7186, quality=0, strong=0, bind=1, },--屠龙礼盒卷
	},
	[257] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7187, quality=0, strong=0, bind=1, },--传世宝箱卷
	},
	[258] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7188, quality=0, strong=0, bind=1, },--龍装Ⅰ装备卷
	},
	[259] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7189, quality=0, strong=0, bind=1, },--龍装Ⅱ装备卷
	},
	[260] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7190, quality=0, strong=0, bind=1, },--幻羽礼盒卷
	},
	[261] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7191, quality=0, strong=0, bind=1, },--坐骑礼盒卷
	},
	[262] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7192, quality=0, strong=0, bind=1, },--三国时装礼盒卷
	},
	[263] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7193, quality=0, strong=0, bind=1, },--元神装备卷
	},

	[264] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7652, quality=0, strong=0, bind=1, },--节日大礼包
	},

	[265] = 
	{ 
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7825, quality=0, strong=0, bind=1, },--搜狗微信礼包
	},

	[266] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7826, quality=0, strong=0, bind=1, },--步步高升礼包
	},

	[267] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7827, quality=0, strong=0, bind=1, },--劳动节礼包
	},

	[268] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7828, quality=0, strong=0, bind=1, },--赛龙舟礼包
	},

	[269] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7829, quality=0, strong=0, bind=1, },--寄相思礼包
	},

	[270] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7830, quality=0, strong=0, bind=1, },--我爱中国礼包
	},

	[271] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7831, quality=0, strong=0, bind=1, },--感恩节礼包
	},

	[272] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7832, quality=0, strong=0, bind=1, },--千丝万缕 
	},

	[273] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7833, quality=0, strong=0, bind=1, },--感恩有你
	},

	[274] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7834, quality=0, strong=0, bind=1, },--肉袒负荆
	},

	[275] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7835, quality=0, strong=0, bind=1, },--负荆请罪 
	},

	[276] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7836, quality=0, strong=0, bind=1, },--热泪盈眶 
	},

	[277] = 
	{ 
		value = -1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 7837, quality=0, strong=0, bind=1, },--至真至纯 
	},


	-- [11] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 867, quality=0, strong=0, bind=1 },--黄金礼包
	-- },
	-- [12] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 868, quality=0, strong=0, bind=1 },--白银礼包
	-- },
	-- [13] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 869, quality=0, strong=0, bind=1 },--独家礼包
	-- },
	-- [14] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 870, quality=0, strong=0, bind=1 },--智者礼包
	-- },
	-- [15] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 871, quality=0, strong=0, bind=1 },--英雄礼包
	-- },
	-- [16] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 872, quality=0, strong=0, bind=1 },--周年庆礼包
	-- },
	-- [17] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 873, quality=0, strong=0, bind=1, },--豪华礼包
	-- },
	-- [18] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 874, quality=0, strong=0, bind=1, },--皇家礼包
	-- },
	-- [19] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 875, quality=0, strong=0, bind=1, },--贵族礼包
	-- },
	-- [20] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 876, quality=0, strong=0, bind=1, },--平民礼包
	-- },
	-------- 新加
	-- [21] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 990, quality=0, strong=0, bind=1 },--40407独家礼包
	-- },
	-- [22] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 991, quality=0, strong=0, bind=1, },--265G黄金礼包
	-- },
	-- [23] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 992, quality=0, strong=0, bind=1, },	--265G水晶礼包	
	-- },
	-- [24] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 993, quality=0, strong=0, bind=1, },	--265G钻石礼包
		
	-- },
	-- [25] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 994, quality=0, strong=0, bind=1, },	--腾讯独家礼包
	-- },
	-- [26] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 995, quality=0, strong=0, bind=1, },	--07073黄金礼包
	-- },
	-- [27] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 996, quality=0, strong=0, bind=1, },	--07073水晶礼包
	-- },
	-- [28] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 997, quality=0, strong=0, bind=1, },	--07073钻石礼包
	-- },
	------------------
	-- [29] =
	-- {
		-- value = 1,
		-- { rewardtype = 1, type = 0, amount = 1, itemid = 877, quality=0, strong=0, bind=1, },	--07073特供礼包
	-- },
--	[30] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 964, quality=0, strong=0, bind=1, },	--金玉礼包
--	},
--	[31] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 965, quality=0, strong=0, bind=1, },	--呈祥礼包
--	},
--	[32] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 966, quality=0, strong=0, bind=1, },	--超级会员礼包
--	},
--	[33] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 976, quality=0, strong=0, bind=1, },	--青龙礼包
--	},
--	[34] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 977, quality=0, strong=0, bind=1, },	--白虎礼包
--	},
--	[35] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 978, quality=0, strong=0, bind=1, },	--朱雀礼包
--	},
--	[36] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 979, quality=0, strong=0, bind=1, },	--玄武礼包
--	},
--	[37] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 980, quality=0, strong=0, bind=1, },	--麒麟礼包
--	},
--
--	[38] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 981, quality=0, strong=0, bind=1 },--XY《霸者之刃》全民礼包
--	},
--	[39] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 982, quality=0, strong=0, bind=1 },--XY《霸者之刃》公测大礼
--	},
--	[40] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 983, quality=0, strong=0, bind=1 },--XY《霸者之刃》欢庆大礼
--	},
--	[41] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 984, quality=0, strong=0, bind=1, },--XY《霸者之刃》招募礼包
--	},
--	[42] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 985, quality=0, strong=0, bind=1, },--42|特权礼包(黄金)
--	},
--	[43] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 986, quality=0, strong=0, bind=1, },--43|特权礼包(水晶)
--	},
--	[44] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 987, quality=0, strong=0, bind=1, },--44|特权礼包(钻石)
--	},
--	[45] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 988, quality=0, strong=0, bind=1, },--凤凰礼包
--	},
--	[46] =
--	{
--		value = 1,
--		{ rewardtype = 1, type = 0, amount = 1, itemid = 1009, quality=0, strong=0, bind=1, },----VIP迎春回归礼包
--        ----------------------------------
--	},
--[[
	[47] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 7, itemid = 422, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1121, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 15, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 282, quality=0, strong=0, bind=1, },
	},
	[48] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 10, itemid = 422, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1123, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 20, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 283, quality=0, strong=0, bind=1, },
	},
	[49] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 422, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 682, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 817, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 731, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 386, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 373, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 376, quality=0, strong=0, bind=1, },
	},
	[50] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1119, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1371, quality=0, strong=0, bind=1, },
	},
	[51] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 9, itemid = 355, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1121, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 4, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 4, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1371, quality=0, strong=0, bind=1, },
	},
	[52] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 356, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1123, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 283, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 20, itemid = 910, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 1371, quality=0, strong=0, bind=1, },
	},
	[53] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 5, itemid = 282, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1121, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 662, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 731, quality=0, strong=0, bind=1, },
	},
	[54] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 5, itemid = 283, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1123, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 4, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 918, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 20, itemid = 1172, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 30, itemid = 731, quality=0, strong=0, bind=1, },
	},
	[55] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1402, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 1123, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1037, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 918, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 30, itemid = 1172, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 50, itemid = 731, quality=0, strong=0, bind=1, },
	},
	[56] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1402, quality=0, strong=0, bind=1, },
	},
	[57] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 283, quality=0, strong=0, bind=1, },
	},
	[58] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 2, itemid = 1122, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1371, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 379, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1075, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 817, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 480, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 20, itemid = 704, quality=0, strong=0, bind=1, },
	},
	[59] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 229, quality=0, strong=0, job=1, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 240, quality=0, strong=0, job=2, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 251, quality=0, strong=0, job=3, bind=0, },
	},
	[60] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 227, quality=0, strong=0, job=1, sex=0, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 228, quality=0, strong=0, job=1, sex=1, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 238, quality=0, strong=0, job=2, sex=0, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 239, quality=0, strong=0, job=2, sex=1, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 249, quality=0, strong=0, job=3, sex=0, bind=0, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 250, quality=0, strong=0, job=3, sex=1, bind=0, },
	},
	[61] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 644, quality=0, strong=0, bind=1, },
	},
	[62] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 784, quality=0, strong=0, bind=1, },
	},
	[63] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 794, quality=0, strong=0, bind=1, },
	},
	[64] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 960, quality=0, strong=0, bind=0, },
	},
	[65] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 577, quality=0, strong=0, bind=0, },
	},
	[66] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1540, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1656, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1121, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1073, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1075, quality=0, strong=0, bind=1, },
	},
	[67] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1120, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 355, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1072, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1074, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 704, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1044, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 974, quality=0, strong=0, bind=1, },
	},
	[68] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1079, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 279, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 5, itemid = 1172, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1120, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1072, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1074, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 975, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 1044, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 974, quality=0, strong=0, bind=1, },
	},
	[69] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 735, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1104, quality=0, strong=0, job=1, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1105, quality=0, strong=0, job=2, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1106, quality=0, strong=0, job=3, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1031, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 279, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 1172, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 362, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1072, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 3, itemid = 1074, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1122, quality=0, strong=0, bind=1, },
	},
	[70] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 738, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1646, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1104, quality=0, strong=0, job=1, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1105, quality=0, strong=0, job=2, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1106, quality=0, strong=0, job=3, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1425, quality=0, strong=0, job=1, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1417, quality=0, strong=0, job=2, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1421, quality=0, strong=0, job=3, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 686, quality=0, strong=0, sex=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 687, quality=0, strong=0, sex=1, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1031, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 10, itemid = 1362, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 362, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 6, itemid = 1072, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 6, itemid = 1074, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 2, itemid = 1122, quality=0, strong=0, bind=1, },
	},
	[71] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1860, quality=0, strong=0, bind=1, },
	},
	[72] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1861, quality=0, strong=0, bind=1, },
	},
	[73] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1862, quality=0, strong=0, bind=1, },
	},
	[74] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1863, quality=0, strong=0, bind=1, },
	},
	[75] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1864, quality=0, strong=0, bind=1, },
	},
	[76] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1371, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 1118, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 367, quality=0, strong=0, bind=1, },
		{ rewardtype = 1, type = 0, amount = 1, itemid = 369, quality=0, strong=0, bind=1, },
	},
	[77] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 804, quality=0, strong=0, bind=1, },
	},
	[78] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 814, quality=0, strong=0, bind=1, },
	},
	[79] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 754, quality=0, strong=0, bind=1, },
	},
	[80] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 764, quality=0, strong=0, bind=1, },
	},
	[81] =
	{
		value = 1,
		{ rewardtype = 1, type = 0, amount = 1, itemid = 774, quality=0, strong=0, bind=1, },
	},
	--]]
}