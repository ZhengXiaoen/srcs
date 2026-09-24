--212  屠魔印记buff组  w    w    w .  c n 1 2 1. c o m
KillBossAddBuff = 
{
	--time是作用次数 ,interval是时间间隔     相乘= 300秒搞定
	buffGroup = 212 ,
	buffType = 58,
	buffName = "屠魔经验印记",
	buffdes="每5秒增加一次经验",
	buffIcon = 58,
	buffInfo = 
	{
{bossId = 430,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//骷髅王[七星]
{bossId = 431,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//骷髅王[八荒]
{bossId = 432,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//骷髅王[九宫]
{bossId = 433,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//骷髅王[十方]
{bossId = 440,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//僵尸皇[七星]
{bossId = 441,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//僵尸皇[八荒]
{bossId = 442,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//僵尸皇[九宫]
{bossId = 443,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//僵尸皇[十方]
{bossId = 450,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//钳虫皇[七星]
{bossId = 451,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//钳虫皇[八荒]
{bossId = 452,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//钳虫皇[九宫]
{bossId = 453,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//钳虫皇[十方]
{bossId = 460,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//异教教皇[七星]
{bossId = 461,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//异教教皇[八荒]
{bossId = 462,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//异教教皇[九宫]
{bossId = 463,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//异教教皇[十方]
{bossId = 470,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//虚空大帝[七星]
{bossId = 471,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//虚空大帝[八荒]
{bossId = 472,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//虚空大帝[九宫]
{bossId = 473,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//虚空大帝[十方]
{bossId = 480,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//破碎教皇[七星]
{bossId = 481,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//破碎教皇[八荒]
{bossId = 482,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//破碎教皇[九宫]
{bossId = 483,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//破碎教皇[十方]
{bossId = 490,addExp =7000,time =12,interval =5,txt ="散人殿堂7层"},--//蛮荒大教皇[七星]
{bossId = 491,addExp =10000,time =12,interval =5,txt ="散人殿堂8层"},--//蛮荒大教皇[八荒]
{bossId = 492,addExp =16000,time =12,interval =5,txt ="散人殿堂9层"},--//蛮荒大教皇[九宫]
{bossId = 493,addExp =20000,time =12,interval =5,txt ="散人殿堂10层"},--//蛮荒大教皇[十方]
{bossId = 38,addExp =35077,time =12,interval =5,txt ="迷失宫殿"},--//祖玛教主
{bossId = 44,addExp =59692,time =12,interval =5,txt ="赤月魔窟"},--//牛魔王
{bossId = 51,addExp =90462,time =12,interval =5,txt ="妖族幻境"},--//玛雅教主
{bossId = 56,addExp =169231,time =12,interval =5,txt ="修罗地宫"},--//魔龙教主
{bossId = 63,addExp =230769,time =12,interval =5,txt ="吕祖峰"},--//炼狱教主
{bossId = 70,addExp =307692,time =12,interval =5,txt ="龙王湾"},--//神龙教主
{bossId = 77,addExp =646154,time =12,interval =5,txt ="炽焰山"},--//九尾妖狐
{bossId = 84,addExp =800000,time =12,interval =5,txt ="雷炎魔窟"},--//雷炎蜘蛛
{bossId = 90,addExp =1046154,time =12,interval =5,txt ="极北之地"},--//雪域魔王
{bossId = 755,addExp =20000,time =12,interval =5,txt ="个人挑战BOSS"},--//祖玛教主[副本]
{bossId = 756,addExp =40000,time =12,interval =5,txt ="个人挑战BOSS"},--//牛魔王[副本]
{bossId = 757,addExp =70000,time =12,interval =5,txt ="个人挑战BOSS"},--//玛雅教主[副本]
{bossId = 758,addExp =100000,time =12,interval =5,txt ="个人挑战BOSS"},--//魔龙教主[副本]
{bossId = 759,addExp =136000,time =12,interval =5,txt ="个人挑战BOSS"},--//炼狱教主[副本]
{bossId = 760,addExp =160000,time =12,interval =5,txt ="个人挑战BOSS"},--//神龙教主[副本]
{bossId = 836,addExp =2000000,time =12,interval =5,txt ="个人挑战BOSS"},--//九尾妖狐[副本]
{bossId = 715,addExp =45600,time =12,interval =5,txt ="BOSS之家1层"},--//祖玛教主1
{bossId = 716,addExp =77600,time =12,interval =5,txt ="BOSS之家1层"},--//牛魔王2
{bossId = 717,addExp =117600,time =12,interval =5,txt ="BOSS之家1层"},--//玛雅教主2
{bossId = 718,addExp =320000,time =12,interval =5,txt ="BOSS之家1层"},--//魔龙教主2
{bossId = 719,addExp =45600,time =12,interval =5,txt ="BOSS之家1层"},--//骷髅精灵
{bossId = 720,addExp =77600,time =12,interval =5,txt ="BOSS之家1层"},--//鬼魅狐妖
{bossId = 721,addExp =117600,time =12,interval =5,txt ="BOSS之家1层"},--//地藏魔王1
{bossId = 722,addExp =320000,time =12,interval =5,txt ="BOSS之家1层"},--//火龙教主
{bossId = 723,addExp =117600,time =12,interval =5,txt ="BOSS之家2层"},--//玛雅教主4
{bossId = 724,addExp =320000,time =12,interval =5,txt ="BOSS之家2层"},--//魔龙教主3
{bossId = 725,addExp =360000,time =12,interval =5,txt ="BOSS之家2层"},--//炼狱教主2
{bossId = 726,addExp =400000,time =12,interval =5,txt ="BOSS之家2层"},--//神龙教主2
{bossId = 727,addExp =117600,time =12,interval =5,txt ="BOSS之家2层"},--//地藏魔王
{bossId = 728,addExp =320000,time =12,interval =5,txt ="BOSS之家2层"},--//火龙教主1
{bossId = 729,addExp =360000,time =12,interval =5,txt ="BOSS之家2层"},--//拜月教主
{bossId = 730,addExp =400000,time =12,interval =5,txt ="BOSS之家3层"},--//帝王教主
{bossId = 731,addExp =320000,time =12,interval =5,txt ="BOSS之家3层"},--//火龙教主2
{bossId = 732,addExp =360000,time =12,interval =5,txt ="BOSS之家3层"},--//拜月教主1
{bossId = 733,addExp =400000,time =12,interval =5,txt ="BOSS之家3层"},--//帝王教主1
{bossId = 734,addExp =840000,time =12,interval =5,txt ="BOSS之家3层"},--//九尾妖狐1
{bossId = 735,addExp =1040000,time =12,interval =5,txt ="BOSS之家3层"},--//雷炎蜘蛛1
{bossId = 736,addExp =1360000,time =12,interval =5,txt ="BOSS之家3层"},--//雪域魔王1
{bossId = 813,addExp =70000,time =12,interval =5,txt ="混沌地界"},--//雪狼战将
{bossId = 814,addExp =120000,time =12,interval =5,txt ="混沌地界"},--//水晶骑士
{bossId = 815,addExp =180000,time =12,interval =5,txt ="混沌地界"},--//玄武大帝
{bossId = 816,addExp =320000,time =12,interval =5,txt ="混沌地界"},--//双头魔王
{bossId = 817,addExp =360000,time =12,interval =5,txt ="混沌地界"},--//混沌至尊
{bossId = 819,addExp =70000,time =12,interval =5,txt ="混沌地界"},--//蚁后
{bossId = 820,addExp =70000,time =12,interval =5,txt ="混沌地界"},--//修罗魔王
{bossId = 821,addExp =120000,time =12,interval =5,txt ="混沌地界"},--//王者战将
{bossId = 822,addExp =180000,time =12,interval =5,txt ="混沌地界"},--//逍遥战神
{bossId = 823,addExp =320000,time =12,interval =5,txt ="混沌地界"},--//通天霸主
{bossId = 705,addExp =45600,time =12,interval =5,txt ="重装地宫"},--//地之祖玛教主
{bossId = 706,addExp =77600,time =12,interval =5,txt ="重装地宫"},--//地之牛魔王
{bossId = 707,addExp =117600,time =12,interval =5,txt ="重装地宫"},--//地之玛雅教主
{bossId = 708,addExp =320000,time =12,interval =5,txt ="重装地宫"},--//地之魔龙教主
{bossId = 709,addExp =360000,time =12,interval =5,txt ="重装地宫"},--//地之炼狱教主
{bossId = 710,addExp =400000,time =12,interval =5,txt ="重装地宫"},--//地之神龙教主
{bossId = 711,addExp =840000,time =12,interval =5,txt ="重装地宫"},--//地之九尾妖狐
{bossId = 712,addExp =1040000,time =12,interval =5,txt ="重装地宫"},--//地之雷炎蜘蛛
{bossId = 696,addExp =45600,time =12,interval =5,txt ="暗之地宫"},--//暗之祖玛教主
{bossId = 697,addExp =77600,time =12,interval =5,txt ="暗之地宫"},--//暗之牛魔王
{bossId = 698,addExp =117600,time =12,interval =5,txt ="暗之地宫"},--//暗之玛雅教主
{bossId = 699,addExp =320000,time =12,interval =5,txt ="暗之地宫"},--//暗之魔龙教主
{bossId = 700,addExp =360000,time =12,interval =5,txt ="暗之地宫"},--//暗之炼狱教主
{bossId = 701,addExp =400000,time =12,interval =5,txt ="暗之地宫"},--//暗之神龙教主
{bossId = 702,addExp =840000,time =12,interval =5,txt ="暗之地宫"},--//暗之九尾妖狐
{bossId = 703,addExp =1040000,time =12,interval =5,txt ="暗之地宫"},--//暗之雷炎蜘蛛
{bossId = 647,addExp =45600,time =12,interval =5,txt ="暗之地宫"},--//天之祖玛教主
{bossId = 648,addExp =77600,time =12,interval =5,txt ="天之神殿"},--//天之牛魔王
{bossId = 649,addExp =117600,time =12,interval =5,txt ="天之神殿"},--//天之玛雅教主
{bossId = 650,addExp =320000,time =12,interval =5,txt ="天之神殿"},--//天之魔龙教主
{bossId = 651,addExp =360000,time =12,interval =5,txt ="天之神殿"},--//天之炼狱教主
{bossId = 652,addExp =400000,time =12,interval =5,txt ="天之神殿"},--//天之神龙教主
{bossId = 653,addExp =840000,time =12,interval =5,txt ="天之神殿"},--//天之九尾妖狐
{bossId = 654,addExp =1040000,time =12,interval =5,txt ="天之神殿"},--//天之雷炎蜘蛛





		
	},
}