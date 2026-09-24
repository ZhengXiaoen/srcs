--阵营战
{
	scenceid = 81,
	scencename = Lang.SceneName.s00081,
	mapfilename = "81JunTuanZhanChang",
	minlevel = 30,
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,  
	music = "9.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 132,
	sceneHeight = 128,

	area =
	{
		{ name = Lang.SceneName.s00081, range = { 76,131,92,131,92,141,76,141}, center = { 58,55},
		attri = 
		{
				{type=20,value = {}},--禁止穿人
		        {type=46,value = {73,29,126,176}},--安全复活区
				{type=3,value = {}},  --战斗专门区域，打死人不用负责任
				{type=21,value = {}},--禁止穿怪
				{type=80,value = {}},--场景不爆装备
				{type=26,value = {}},--禁止使用随机
				{type=27,value = {}},--禁止使用药品
				{type=54,value = {}},--禁止使用药品
				--{type=41,value = {3538}},--自动加经验，每秒3538点
				{type=34,value = {314,315,316,376,377,378,380,381,491}},--限制使用物品
				{type=24,value = {}},--禁止使用夫妻传送
				{type=25,value = {}},--禁止使用师徒传送
				{type=50,value = {6}},--强制攻击模式，阵营模式
				{type=23,value = {1,2,3,4}},--"禁止被行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
				{type=30,value = {1,2,3,4}},--"禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
				{type=6,value = {}},--默认配置场景
		}},	
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh66.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 225, posx = 88 , posy = 24},--嗜魂阵营使者
		--{id = 224, posx = 28 , posy = 89},--天人阵营使者
		
	},

  teleport =
  {

  },
 landscape=
 {
        --{posx1=74,posy1=85,posx2=74,posy2=85,modelid=81,xinterval=0,yinterval=0},  --蚩尤旗帜
		--{posx1=81,posy1=78,posx2=81,posy2=78,modelid=81,xinterval=0,yinterval=0},  --蚩尤旗帜
		--{posx1=123,posy1=121,posx2=123,posy2=121,modelid=82,xinterval=0,yinterval=0},  --黄帝旗帜
		--{posx1=117,posy1=128,posx2=117,posy2=128,modelid=82,xinterval=0,yinterval=0},  --黄帝旗帜



 },

},