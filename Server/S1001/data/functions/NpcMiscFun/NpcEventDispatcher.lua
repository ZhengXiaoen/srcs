
--#include "data\functions\NormalFuncForQuest.lua" once
--#include "data\functions\SpecialQuest.lua" once
--#include "data\functions\GlobalNpcFunctions.lua" once

local NpcDialog = {}   --包含的是npcID对应的一些执行函数
local NpcCommonFunc = {}

--公共函数的文件

--#include "data\functions\NPCStorehouseFunc.lua" once	--包含仓库文件
--#include "NpcCommonFunc.lua" once			--共公的npc函数，执行npc函数时优先调用该文件中的函数
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "SanRenNPC\ZhuXianRenWu.lua" once		--主线任务
--#include "SanRenNpc\GuildStore.lua" once          --贡献兑换

--散人传说的NPC,有用到的注册一下写在这里,还需要转到本文件最下面注册下头函数
--2016/12/26 zer 移动整理到 SanRenNPC 目录
--迁移文件涉及较多, 如还有迁移建议先搜索全目录*.*

--#include "SanRenNPC\MapNpc\JunTuanGuanLiYuan.lua" once  		--军团管理员
--#include "SanRenNPC\MapNpc\ChuanSongYuan.lua" once			--传送员
--#include "SanRenNPC\MapNpc\ZhanWuShuang.lua" once				--战无双(日常经验任务)
--#include "SanRenNPC\MapNpc\ZhuangBeiHuiShou.lua" once			--装备回收(各主城用到了)
--#include "SanRenNPC\MapNpc\LianYu.lua" once					--炼狱(日常副本)
--#include "SanRenNPC\MapNpc\CangKuGuanLiYuan.lua" once			--仓库管理员 代码34
--#include "SanRenNPC\MapNpc\FuBenGuanLiYuan.lua" once			--副本管理员 代码248
--#include "SanRenNPC\MapNpc\WuLinZengBa.lua" once				--武林争霸
--#include "SanRenNPC\MapNpc\GaoJiDuanZaoShi.lua" once			--高级锻造师 代码262
----#include "SanRenNPC\MapNpc\WangChengGuanJia.lua" once			--王城管家 230
--#include "SanRenNPC\MapNpc\BOSSZhiJia.lua" once				--BOSS之家
--#include "SanRenNPC\MapNpc\YouXiTuiGuangYuan.lua" once		--游戏推广员
--#include "SanRenNPC\MapNpc\JunTuanZhanShiZhe.lua" once		--军团阵使者 341
--#include "SanRenNPC\MapNpc\ChengZhuDiaoXiang.lua" once		--城主雕像
--#include "SanRenNPC\MapNpc\WuLinMengZhuDiaoXiang.lua" once	--武林盟主雕像
--#include "SanRenNPC\MapNpc\ShenWeiYu.lua" once				--神威狱(活动入口NPC)
--#include "SanRenNPC\MapNpc\ShenWeiChuanSong.lua" once			--神威传送(神威狱活动地图传送NPC)
--#include "SanRenNPC\MapNpc\JiQingBiGuan.lua" once				--激情闭关
--#include "SanRenNPC\MapNpc\ShenMiZhiDian.lua" once			--散人殿堂
--#include "SanRenNPC\MapNpc\TianShenHuTi.lua" once				--天神护体
--#include "SanRenNPC\MapNpc\JiangHuShenYi.lua" once			--江湖神医
--#include "SanRenNPC\YaBiao1.lua" once							--押镖1
--#include "SanRenNPC\YaBiao2.lua" once							--押镖2
--#include "SanRenNPC\MapNpc\HeChenDaShi.lua" once				--合成大师
--#include "SanRenNPC\HuoDong\BenPaoBaXiongDi.lua" once			--奔跑吧兄弟
--#include "SanRenNPC\HuoDong\YuanbaoJiaNianHua.lua" once		--元宝嘉年华
--#include "SanRenNPC\MapNpc\ZhuangBeiBaoXiang.lua" once		--装备宝箱
--#include "SanRenNPC\HuoDong\BenPaoJiangLi.lua" once			--蹦跑奖励
----#include "SanRenNPC\HuoDong\MiJingZhiLv.lua" once			    --秘境之旅
----#include "SanRenNPC\HuoDong\MJZLChuanSongYuan.lua" once		--秘境之旅传送员
--#include "SanRenNPC\MapNpc\SanWeiZhenHuo.lua" once			--三味真火炉
----#include "SanRenNPC\HuoDong\DiYuRuQin.lua" once				--抵御入侵
--#include "SanRenNPC\HuoDong\DuoBaoQiBing.lua" once			--夺宝奇兵
--#include "SanRenNPC\MapNpc\YinShiLaoRen.lua" once				--隐世老人
----#include "SanRenNPC\MapNpc\ShaBaKeZhuanShu.lua" once			--沙巴克专属
----#include "SanRenNPC\MapNpc\AnHeiShaMo.lua" once				--暗黑沙漠
--#include "SanRenNPC\MapNpc\QinShiHuangLing.lua" once			--秦始皇陵
----#include "SanRenNPC\MapNpc\ShaMoChuanSong.lua" once			--暗黑沙漠传送
--#include "SanRenNPC\MapNpc\ShouLingRen.lua" once				--守陵人
--#include "SanRenNPC\MapNpc\BOSSZHIJIAYI.lua" once		        --BOSS之家传送员
----#include "SanRenNPC\MapNpc\LingShiHeCheng.lua" once		        --灵石合成
--#include "SanRenNPC\MapNpc\ZhuanShengDiGong.lua" once		        --转生地宫
----#include "SanRenNPC\MapNpc\ZhenBaoGeGeZhu.lua" once		        --珍宝阁阁主
--#include "SanRenNPC\HuoDong\SHIJIEBOSS.lua" once		                  --世界bossnpc
--#include "SanRenNPC\HuoDong\TiaoTieShenDan.lua" once		                  --饕餮神殿npc
----#include "SanRenNPC\HuoDong\BenPaoMiHuo.lua" once		                  --奔跑迷惑
----#include "SanRenNPC\MapNpc\BOSSGongGao.lua" once		                  --BOSS公告2017/03/21 废弃
----#include "SanRenNPC\HuoDong\JiQingHangHui.lua" once		                  --激情行会
--#include "SanRenNPC\HuoDong\JiQingDaBenYing.lua" once		                  --激情大本营c	
--#include "SanRenNPC\HuoDong\JunHuoShangRen.lua" once		                  --军火商人	
--#include "SanRenNPC\HuoDong\TianXinDaoRen.lua" once		                  --天心道人	
--#include "SanRenNPC\HuoDong\JiuDianXia.lua" once		                 	  --九殿下	
--#include "SanRenNPC\HuoDong\DuoBaoChuanSong.lua" once		                 	  --夺宝穿送
--#include "SanRenNPC\HuoDong\CaiPan.lua" once							--舞林争霸裁判
--#include "SanRenNPC\MapNpc\HunDunShiJie.lua" once							--混沌世界
--#include "SanRenNPC\MapNpc\YongChuangTianGuan.lua" once					--勇闯天关
--#include "SanRenNPC\MapNpc\BaoShiDaShi.lua" once					--宝石大师
--#include "SanRenNPC\MapNpc\ShenHunDuiHuan.lua" once				--神魂兑换
----#include "SanRenNPC\MapNpc\DianTangShiZhe.lua" once				--殿堂使者
--#include "SanRenNPC\MapNpc\MaYaShenDian.lua" once				--玛雅神殿
--#include "SanRenNPC\MapNpc\MoFaJieZhen.lua" once				--蚩尤结阵
--#include "SanRenNPC\MapNpc\SiShengGong.lua" once				--四圣宫

--#include "SanRenNPC\MapNpc\LongTouBiaoJu.lua" once			--龙头镖局
--#include "SanRenNPC\MapNpc\BaoTouBiaoJu.lua" once				--豹头镖局

--#include "SanRenNPC\MapNpc\ShengXiaoGongDian.lua" once		--生肖宫殿
--#include "SanRenNPC\MapNpc\HunLuanDiJie.lua" once				--混乱地界
--#include "SanRenNPC\MapNpc\YuanShenShiZhe.lua" once			--元神使者
--#include "SanRenNPC\MapNpc\FuWenDiGong.lua" once			--符文地宫
--#include "SanRenNPC\MapNpc\FuLiGuanYuan.lua" once			--福利官员
--#include "SanRenNPC\MapNpc\No1NPC.lua" once			--No1NPC
--#include "SanRenNPC\MapNpc\XiongMaoLin.lua" once			--熊猫林
--#include "SanRenNPC\MapNpc\TongTianTa.lua" once			--通天塔
--#include "SanRenNPC\MapNpc\EquipRecycling.lua" once		--装备换金
--------------------------------------------------------------------

-----------------------------------------------------------------------------
--注释文件: 不知用途, 本地文件已经全打包储存, 2017年5月后如还未用途即可删除
--2016/12/26 zer
--注意注意注意, 以下注释文件都未用到.



	----#include "SanRenNPC\HongMingCunNPC.lua" once					--红名村NPC
	----#include "SanRenNPC\MapNpc\SanRenLeYuan.lua" once		        --散人乐园
	----#include "SanRenNPC\MapNpc\ChuJiDuanZaoShi.lua" once			--初级锻造师



	---- #include "SanRenNPC\BOSSZHIJIAYI.lua" once		--BOSS之家1
	---- #include "SanRenNPC\GaoShouJinJie.lua" once		--高手进阶
	--
	---- #include "SanRenNPC\ZHUXIANRENWU1.lua" once		--主线任务引导1
	---- #include "SanRenNPC\SZHDNPC.lua" once		--烧猪活动NPC
	---- #include "SanRenNPC\MiJiShiZhe.lua" once	--密境使者
	---- #include "data\envir\FubenCountConfig.lua" once
	---- #include "data\envir\FuBen.txt" once
 ----      #include "NpcDialog\10Ji.lua" once		--远古矿洞 10级NPC
 ----     #include "NpcDialog\20Ji.lua" once		--远古虫洞 20级NPC
 ----      #include "NpcDialog\30Ji.lua" once		--远古羊窟 30级NPC
 ----      #include "NpcDialog\40Ji.lua" once		--远古猪洞 40级NPC
 ----    #include "NpcDialog\50Ji.lua" once		--远古寺庙 50级NPC
 ----     #include "NpcDialog\60Ji.lua" once		--远古蛮荒 60级NPC
 ----      #include "NpcDialog\FBSZ.lua" once		--BOSS副本使者
 ----      #include "NpcDialog\JiuLongCheng\XinShouJieDaiYuan.lua" once	--新手接待员
	---- 		#include "NpcDialog\NpcTeleport.lua" once  --npc传送
	---- 		#include "NpcDialog\DartMain.lua" once	 --护送美女
	----		#include "NpcDialog\DartDestNpc.lua" once	 --护送美女达到
	---- 		#include "NpcDialog\HotSpringMain.lua" once	--温泉
	---- 		#include "NpcDialog\FireMain.lua" once		--篝火
	---- 		#include "NpcDialog\BigFireMain.lua" once		--大篝火
	---- 		#include "NpcDialog\XingGongShiZhe.lua" once		--魔幻星宫
	---- 		#include "NpcDialog\XingGongZhiYin.lua" once		--魔幻星宫
	---- 		#include "NpcDialog\MSFinal.lua" once		--最终层NPC
	---- 		#include "NpcDialog\AnswerMain.lua" once		--答题活动
	---- 		#include "NpcDialog\TestNPC.lua" once		--仅供测试
	---- 		#include "NpcDialog\ResColNpc.lua" once		--资源收集官
	---- 		#include "NpcDialog\ResColNpcAct.lua" once		--资源收集官
	---- 		#include "NpcDialog\FubenEnter.lua" once		--NPC入口
	---- 		#include "NpcDialog\ZERmanagement.lua" once		--GM管理员
	---- 	#include "NpcDialog\GuangChangChuanSong.lua" once		--传送员
	---- 	#include "NpcDialog\HongNiang.lua" once		--红娘
	---- 	#include "NpcDialog\TianGuanCommon.lua" once		--天关使者
	----	#include "NpcDialog\TianGuanShiZheOne.lua" once		--天关使者
	---- 	#include "NpcDialog\TianGuanShiZheTwo.lua" once		--天关使者
	---- 	#include "NpcDialog\TianGuanShiZheThree.lua" once		--天关使者
	---- 	#include "NpcDialog\TianGuanShiZheFour.lua" once		--天关使者
	---- 	#include "NpcDialog\TianGuanShiZheFive.lua" once		--天关使者
	---- 	#include "NpcDialog\TianGuanShiZheSix.lua" once		--天关使者
	---- 	#include "NpcDialog\JiuLongCheng\RiChangCaoYao.lua" once		--草药师(日常)
	---- 	#include "NpcDialog\JiuLongCheng\JiNengDaShi.lua" once		--技能大师 
	---- 	#include "NpcDialog\JiuLongCheng\YongBingGuanLi.lua" once		--佣兵管理员   
	---- 	#include "NpcDialog\JiuLongCheng\ChongZhiPaiHang.lua" once	--充值排行
	---- 	#include "NpcDialog\JiuLongCheng\JiuLongChengChengZhu.lua" once	--卧龙城城主
	---- 	#include "NpcDialog\JiuLongCheng\AnQuanGuaJi.lua" once	--安全挂机
	---- 	#include "NpcDialog\Tucheng\TuChengChengZhu.lua" once		--土城城主     
	---- 	#include "NpcDialog\Tucheng\ChiYouJieZhen.lua" once		--蚩尤结阵  
	---- 	#include "NpcDialog\Tucheng\ZhuanShengHunYinShi.lua" once	--转生魂印师
	---- 	--#include "NpcDialog\JiuLongCheng\DanRenFuben.lua" once	--单人副本
	---- 	#include "NpcDialog\JiuLongCheng\DuoRenFuben.lua" once	--多人副本
	---- 	#include "NpcDialog\RedNameJailNpc.lua" once		--红名监狱NPC
	---- 	#include "NpcDialog\Tucheng\GongJianTa1.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa2.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa3.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa4.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa5.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa6.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa7.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa8.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa9.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa10.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa11.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa12.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa13.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\GongJianTa14.lua" once		--开启弓箭塔
	---- 	#include "NpcDialog\Tucheng\ChuBaoAnLiang.lua" once		--除暴安良
	---- 	#include "NpcDialog\HuoDong\HangHuiZhengBa.lua" once		--行会争霸
	---- 	#include "NpcDialog\Tucheng\FengLinShenDian.lua" once		--封陵神殿
	---- 	#include "NpcDialog\HuoDong\ZhengBaGuanLi.lua" once		--行会争霸管理员
	---- 	#include "NpcDialog\HuoDong\AiXinTianShi.lua" once		--爱心天使
	---- 	#include "NpcDialog\JiuLongCheng\XinChengZhu.lua" once	--新城主雕像
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNanZhan.lua" once	--天下第一男战士
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNvZhan.lua" once	--天下第一女战士
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNanFa.lua" once	--天下第一男法师
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNvFa.lua" once	--天下第一女法师
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNanDao.lua" once	--天下第一男道士
	---- 	#include "NpcDialog\JiuLongCheng\TianXiaDiYiNvDao.lua" once	--天下第一女道士
	---- 	#include "NpcDialog\JiuLongCheng\WanJieMoZhai.lua" once	--万劫魔宅
	---- 	#include "NpcDialog\JiuLongCheng\YueLao.lua" once		--月老
	---- 	#include "NpcDialog\JiuLongCheng\BenPaoBaXiongDi.lua" once	--奔跑吧兄弟
	---- 	#include "NpcDialog\Tucheng\XiuXianZhiDuoXing.lua" once	--休闲智多星        
	---- 	#include "NpcDialog\Tucheng\DuanZaoLu.lua" once	--土城--锻造炉(新)     
	---- 	#include "NpcDialog\Tucheng\EMoLingShiZhe.lua" once	--恶魔岭接引人 
	---- 	#include "NpcDialog\Tucheng\ShaChengZhuLi.lua" once	--沙城助理
	---- 	#include "NpcDialog\Tucheng\ZongBiaoTou.lua" once	--总镖头
	---- 	#include "NpcDialog\Tucheng\TongZhangGui.lua" once	--军需官
	---- 	#include "NpcDialog\Tucheng\MoneyActivity.lua" once	--掉落金钱
	---- 	#include "NpcDialog\Tucheng\TianGuan.lua" once	--天关使者
	---- 	#include "NpcDialog\FoGuangPuZhao.lua" once		--仙女散花
	---- 	#include "NpcDialog\FountainMian.lua" once		--山泉老人
	---- 	#include "NpcDialog\QiBingDuoBao.lua" once		--夺宝奇兵
	---- 	#include "NpcDialog\DBQBManager.lua" once		--夺宝奇兵管理员
	---- 	#include "NpcDialog\LingShouXianRui.lua" once		--灵兽献瑞
	---- 	#include "NpcDialog\HuoDong\ExpPig.lua" once        --富贵兽献瑞
	---- 	#include "NpcDialog\HuoDong\WesternDesert.lua" once        --西域荒漠攻城
	---- 	#include "NpcDialog\HuoDong\WuLinCommonFunc.lua" once
	---- 	--#include "NpcDialog\HuoDong\FoGuangPuZhao.lua" once		--仙女散花
	---- 	#include "NpcDialog\HuoDong\QuanShuiYongXian.lua" once	--泉水涌现
	---- 	#include "NpcDialog\HuoDong\JiFenShengYan.lua" once		--积分盛宴
	---- 	#include "NpcDialog\HuoDong\FoTongZi.lua" once		--桃花童子
	---- 	--#include "NpcDialog\HuoDong\DuoBaoQiBing.lua" once		--夺宝奇兵
	---- 	#include "NpcDialog\HuoDong\HeiLongShenDian.lua" once		--黑龙神殿
	---- 	#include "NpcDialog\HuoDong\JiQingShiZhe.lua" once		--激情使者
	---- 	#include "NpcDialog\HuoDong\HuiYuanChuanSong.lua" once	--VIP传送
	---- 	#include "NpcDialog\HuoDong\BuLuoDaZhan.lua" once		--阵营战
	---- 	#include "NpcDialog\HuoDong\MoZuRuQin.lua" once	         --魔族入侵
	---- 	#include "NpcDialog\HuoDong\ShenWeiHuanJing.lua" once	         --神威幻境
	---- 	#include "NpcDialog\HuoDong\CaiPan.lua" once		--舞林争霸裁判
	---- 	#include "NpcDialog\SwinSellMannerge.lua" once		--游泳
	---- 	#include "NpcDialog\Tucheng\SwinMessenger.lua" once		--游泳管理
	---- 	#include "NpcDialog\Tucheng\XingZhuShouHu.lua" once		--星珠守护
	---- 	#include "NpcDialog\Tucheng\DivineTreeMessenger.lua" once		--神树接引人
	---- 	#include "NpcDialog\HuoDong\ZhaoCaiBox.lua" once		--招财宝箱
	---- 	#include "NpcDialog\XinChun\XinChunKaiYun.lua" once		--新春开运
	---- 	#include "NpcDialog\XinChun\TuanYuanYan.lua" once		--团圆宴
	---- 	#include "NpcDialog\XinChun\ZaNianShou.lua" once		--年兽出现
	---- 	#include "NpcDialog\DiTu\ShengJing.lua" once		--传送地图--圣境
	---- 	#include "NpcDialog\DiTu\ShengJingSiCeng.lua" once	--传送地图--圣境4层入口
	---- 	#include "NpcDialog\DiTu\zhuanshengshengjing.lua" once		--传送地图--转生圣境
	---- 	#include "NpcDialog\DiTu\leizeshendian.lua" once		        --传送地图--雷泽神殿
	---- 	#include "NpcDialog\DiTu\weizhiandian.lua" once		        --传送地图--未知暗殿
	---- 	#include "NpcDialog\DiTu\KuangBaoZhiDian.lua" once		        --传送地图--狂暴之巅
	---- 	#include "NpcDialog\DiTu\duoluomoyu.lua" once		        --传送地图--堕落魔域
	---- 	#include "NpcDialog\DiTu\HuiYuanDaBao.lua" once	--传送地图--会员打宝
	---- 	#include "NpcDialog\DiTu\HuiYuanGuaJi.lua" once	--传送地图--会员挂机
	---- 	#include "NpcDialog\DiTu\leizesiceng.lua" once	--传送地图--雷泽四层使者
	---- 	#include "NpcDialog\HuoDong\Prestige.lua" once	--声望领地活动
	---- 	#include "NpcDialog\HuoDong\StarBead.lua" once	--星珠活动
	---- 	#include "NpcDialog\HuoDong\DoubleExpTime.lua" once --双倍经验时间活动
	---- 	#include "NpcDialog\BaLongCheng\ActivityNpc.lua" once
	---- 	#include "NpcDialog\HuoDong\HuanJingYiCeng.lua" once		--神威幻境1层使者
	---- 	#include "NpcDialog\HuoDong\HuanJingErCeng.lua" once		--神威幻境2层使者
	---- 	#include "NpcDialog\HuoDong\HuanJingSanCeng.lua" once		--神威幻境3层使者
	---- 	#include "NpcDialog\HuoDong\HuanJingSiCeng.lua" once		--神威幻境4层使者
	---- 	#include "NpcDialog\HuoDong\HuanJingWuCeng.lua" once		--神威幻境5层使者
	---- 	#include "NpcDialog\HuoDong\HuanJingLiuCeng.lua" once		--神威幻境6层使者
	---- 	#include "NpcDialog\Tucheng\BiGuanXiuLian.lua" once		-- 闭关修炼
	---- 	#include "NpcDialog\Tucheng\FengYingJieJie.lua" once	--镇魔将军(活动巨魔之巢)
	---- 	#include "NpcDialog\Tucheng\ChuanFuShuangBei.lua" once	-- 双倍经验
	---- 	#include "NpcDialog\Tucheng\YuanbaoJiaNianHua.lua" once		-- 元宝嘉年华
	---- 	---test
	---- 	#include "NpcDialog\JiuLongCheng\LiuLangHan.lua" once	--流浪汉
-----------------------------------------------------------------------------

function OnNpcEvent(sysarg, npcId, funcName, ... )
    
    
	Actor.closearrowsguide(sysarg,1005);

	
	local var = Actor.getStaticVar(sysarg);
	if var == nil then return  end
	if var.days == nil then var.days = {} end
	if var.newdays == nil then var.newdays = {} end
    local ta = task_all[get_taskflags_val(sysarg)]
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	
  
	if npcId > 0  then
		if ta ~= nil then
	        --优先读取主线任务
	        if funcName == "onAcceptTask" and ta.lv <= pLv and ta.type ~= 4 then
	            MasterStokeAcceptTask(sysarg,npcId)
	            return "null" --不打开npc对话框了
	        elseif funcName == "main" and ta.lv <= pLv  and ta.type ~= 4 then
	            local str = MasterStokeInit(sysarg,npcId)
	            if str ~= "" then
	                return str
	            end
	        end
      	end
		
		--战无双任务
		if var.RiChangRenWuType~=nil and var.RiChangRenWuType==2 then 
			if var.RiChangRenWuFlag~=nil and var.RiChangRenWuFlag == 1 then 
				if not (var.RiChangRenWuIndex==nil or #GetNpcRiChangChuMo().findNpc<var.RiChangRenWuIndex) then 
					if GetNpcRiChangChuMo().findNpc[var.RiChangRenWuIndex].npcName == Actor.getTalkNpcName(sysarg) then 
						var.RiChangRenWuFinish = 1
						Quest_ShuaXin(sysarg)
						--return "是战无双托你找我的吧，知道了，你可以回去复命了。"
					end
				end
			end
		end
      	
		local comFunc = NpcCommonFunc[funcName]
		if comFunc then
			return comFunc(sysarg, npcId, unpack(arg))
		end
		local npcFunc = NpcDialog[npcId] 
		if npcFunc then
          
			local func = npcFunc[funcName]
			if func then
				return func(sysarg, unpack(arg))
			end
		end
	else
				
		-- 过滤一下全局函数，避免玩家篡改协议直接调用全局函数
		if GlobalNpcFunctionsFilter[funcName] == nil then
			--print("error, global func ["..funcName.."] no exist GlobalNpcFunctionsFilter table")
			return
		end		
       		
		local globalFunc = _G[funcName]
		if globalFunc then
			return globalFunc(sysarg, unpack(arg))		
		end
	end
end

function OnNpcTimer(npcId, funcName, ... )
	local npcFunc = NpcDialog[npcId]
	if npcFunc then
		local realFunc = npcFunc[funcName]
		if realFunc then
			realFunc(unpack(arg))
		end
	end
end

function InitNpcFunc()
	RegisterNpc()
	for npcId, funcTab in pairs(NpcDialog) do
		if funcTab.init then
			funcTab.init(npcId)

		end
	end
end

function NormalNpcFubenFunc(sysarg, npcId)
	local fubenStr = ""
	local fbs = NPCFubenTable[npcId]
	for k, fbid in ipairs(fbs or {}) do
		local fubenCfg = FuBen[fbid]
		local circleVal = fubenCfg and fubenCfg.circle
		if fubenCfg and Actor.checkActorLevel(sysarg, fubenCfg.minLevel, circleVal or 0) then
			fubenStr = string.format("%s<#BL%s/@OnEnterFubenFunc,%d>",fubenStr,fubenCfg.fbname,fbid)
		end
	end
	return fubenStr
end

--注册npc
function RegisterNpc()
	NpcDialog[324] = GetNpcJunTuanGuanLiYuan()	--军团管理员
	NpcDialog[325] = GetNpcChuanSongYuan()	--传送员
	NpcDialog[251] = GetNpcRiChangChuMo()	--除魔师(日常)
	NpcDialog[330] = GetNpcZhuangBeiHuiShou()	--装备回收
	NpcDialog[34]  = GetNpcCangKuNPC()	--仓库管理员
	NpcDialog[248]  = GetNpcFuBenGuanLiYuan()	--副本管理员
	NpcDialog[262]  = GetNpcWanShiTong()	--高级锻造师
	NpcDialog[339]  = GetNpcShouWeiZhan()	--炼狱
	NpcDialog[66]  = GetNpcBOSSZhiJia()	--BOSS之家
	NpcDialog[315]  = GetNpcYouXiTuiGuangYuan()	--游戏推广员
	NpcDialog[341]  = GetNpcJunTuanZhan()	--阵营战
	NpcDialog[342]  = GetNpcCZDX()	--城主雕像
	NpcDialog[343]  = GetNpcBZDX()	--武林盟主雕像
	--NpcDialog[344]  = GetNpcHMCNPC()	--红名村NPC
	NpcDialog[352]  = GetNpcSHENWEIRUKOU()   --神威入口
	NpcDialog[353]  = GetNpcSHENWEICHUANSONG()   --神威传送
	NpcDialog[354]  = GetNpcJIQINGBIGUAN()   --激情闭关npc
    NpcDialog[355]  = GetNpcSHIJIEBOSS()   --世界boss入口
    NpcDialog[40]  =  GetNpcANYINMIDIAN()   --散人殿堂
    NpcDialog[357]  =  GetNpcTianJiDaShi()   --天神护体
    NpcDialog[359]  =  GetNpcYaBiao1()   --押镖测试1
    NpcDialog[360]  =  GetNpcYaBiao2()   --押镖测试2 
    NpcDialog[361]  =  GetNpcBOSSZHIJIAYI()   --boss之家1
    NpcDialog[362]  =  GetNpcHeChenDaShi()   --合成大师
    NpcDialog[363]  =  GetNpcZhuangBeiBaoXiang()   --装备宝箱
    --NpcDialog[202]  =  GetNpcMiJingZhiLv()   --秘境之旅
    --NpcDialog[366]  =  GetNpcMJZLChuanSongYuan()   --秘境之旅传送
    NpcDialog[367]  =  GetNpcSanWeiZhenHuo()   --三味真火
    --NpcDialog[201]  =  GetNpcSanDiYuRuQin()   --抵御入侵
    NpcDialog[368]  =  GetNpcSanDuoBaoQiBing()   --夺宝奇兵 
    NpcDialog[38]  =  GetNpcYinShiLaoRen()   --隐世老人
    --NpcDialog[370]  =  GetNpcShaBaKeZhuanShu()   --沙巴克专属
   -- NpcDialog[371]  =  GetNpcAnHeiShaMo()   --暗黑沙漠
    NpcDialog[372]  =  GetNpcQinShiHuangLing()   --秦始皇陵
    --NpcDialog[373]  =  GetNpcShaMoChuanSong()   --沙漠传送
    NpcDialog[374]  =  GetNpcShouLingRen()   --守陵人
    --NpcDialog[376]  =  GetNpcLingShiHeCheng()   --灵石合成
    NpcDialog[377]  =  GetNpcZhuanShengDiGong() --转生地宫
	--NpcDialog[378]  =  GetNpcZhenBaoGeGeZhu() --珍宝阁阁主
	NpcDialog[379]  =  GetNpcTiaoTieShenDan() --饕餮神殿
	--NpcDialog[380]  =  GetNpcBenPaoMiHuo() --奔跑迷惑
	--NpcDialog[382]  =  GetNpcJiQingHangHui() --激情行会
	NpcDialog[383]  =  GetNpcJiQingDaBenYing() --激情大本营
	NpcDialog[384]  =  GetNpcJunHuoShangRen() --军火商人
	NpcDialog[385]  =  GetNpcTianXinDaoRen() --天心道人
	NpcDialog[386]  =  GetNpcJiuDianXia() --九殿下
	--NpcDialog[392]  =  GetNpcDianTangShiZhe() --殿堂使者
	--NpcDialog[387]  =  GetNpcDuoBaoChuanSong() --夺宝传送
	--NpcDialog[226]  =  GetNpcCaiPan() --武林争霸裁判
	--NpcDialog[389]  =  GetNpcHunDunShiJie() --混沌世界
	NpcDialog[395]  =  GetNpcSiShengGong() --四圣宫
	NpcDialog[396]  =  GetNpcLongTouBiaoJu() --跨服龙头镖局
	NpcDialog[397]  =  GetNpcBaoTouBiaoJu() --跨服豹头镖局
	NpcDialog[398]  =  GetNpcShengXiaoGongDian() --生肖宫殿
	--NpcDialog[399]  =  GetNpcHunLuanDiJie() --混乱地界


end
InitNpcFunc()