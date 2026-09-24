--11转战场
{
	scenceid = 559,
	scencename = Lang.SceneName.s00559,
	mapfilename = "158KuFuYaBiao",
	minlevel = 1,
	forbiddenitem = {},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 268,
	sceneHeight = 216,
	sceneType=7,

	area =
	{
		{ name = Lang.SceneName.s00559, range = { 0,0,0,0,0,0,0,0}, center = { 202,150},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
                    -- { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					{ type = 50,  value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
					
				},
		},

		{ name = Lang.SceneName.a00000, range = { 192,153,202,143,211,152,201,162 }, center = { 202,150 }, 
		attri = {
			 { type =1,value = {}},      --世界安全区
			 { type =6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
		     { type =39,value = {}},     --城镇
			 --{type=41,value = {5000}},--自动加经验，每秒5000点
			 --{type=78,value = {}},     --摆摊区域
			 { type =46,value = {198,147,205,158}},     --安全区复活点
			 { type =83,value = {}},     --禁止使用火墙
			 { type =60,value = {}},     --禁止自动战斗
			 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
			 { type = 50,  value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
		}}, 

		{ name = Lang.SceneName.a00000, range = { 97,99,107,99,107,110,97,110 }, center = { 202,150 }, 
		attri = {
			 { type =1,value = {}},      --世界安全区
		     { type =39,value = {}},     --城镇
			  { type =6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 --{type=41,value = {5000}},--自动加经验，每秒5000点
			 --{type=78,value = {}},     --摆摊区域
			 { type =46,value = {198,147,205,158}},     --安全区复活点
			 { type =83,value = {}},     --禁止使用火墙
			 { type =60,value = {}},     --禁止自动战斗
			 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
			 { type = 50,  value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
		}}, 
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh403.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		{id = 396, posx = 208, posy = 159},--龙头镖局
		{id = 397, posx = 101, posy = 103},--豹头镖局
		
	},

  teleport =
  {
		

  },

   landscape=
 {
{posx1=192,posy1=153,posx2=192,posy2=153,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=193,posy1=152,posx2=193,posy2=152,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=194,posy1=151,posx2=194,posy2=151,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=195,posy1=150,posx2=195,posy2=150,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=196,posy1=149,posx2=196,posy2=149,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=197,posy1=148,posx2=197,posy2=148,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=198,posy1=147,posx2=198,posy2=147,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=199,posy1=146,posx2=199,posy2=146,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=200,posy1=145,posx2=200,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=201,posy1=144,posx2=201,posy2=144,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=202,posy1=143,posx2=202,posy2=143,modelid=76,xinterval=0,yinterval=0},  --安全区边线


{posx1=203,posy1=144,posx2=203,posy2=144,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=204,posy1=145,posx2=204,posy2=145,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=205,posy1=146,posx2=205,posy2=146,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=206,posy1=147,posx2=206,posy2=147,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=207,posy1=148,posx2=207,posy2=148,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=208,posy1=149,posx2=208,posy2=149,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=209,posy1=150,posx2=209,posy2=150,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=210,posy1=151,posx2=210,posy2=151,modelid=76,xinterval=0,yinterval=0},  --安全区边线


{posx1=211,posy1=152,posx2=211,posy2=152,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=210,posy1=153,posx2=210,posy2=153,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=209,posy1=154,posx2=209,posy2=154,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=208,posy1=155,posx2=208,posy2=155,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=207,posy1=156,posx2=207,posy2=156,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=206,posy1=157,posx2=206,posy2=157,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=205,posy1=158,posx2=205,posy2=158,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=204,posy1=159,posx2=204,posy2=159,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=203,posy1=160,posx2=203,posy2=160,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=202,posy1=161,posx2=202,posy2=161,modelid=76,xinterval=0,yinterval=0},  --安全区边线



{posx1=201,posy1=162,posx2=201,posy2=162,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=200,posy1=161,posx2=200,posy2=161,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=199,posy1=160,posx2=199,posy2=160,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=198,posy1=159,posx2=198,posy2=159,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=197,posy1=158,posx2=197,posy2=158,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=196,posy1=157,posx2=196,posy2=157,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=195,posy1=156,posx2=195,posy2=156,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=194,posy1=155,posx2=194,posy2=155,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=193,posy1=154,posx2=193,posy2=154,modelid=76,xinterval=0,yinterval=0},  --安全区边线





{posx1=97,posy1=99,posx2=97,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=98,posy1=99,posx2=98,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=99,posy1=99,posx2=99,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=100,posy1=99,posx2=100,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=101,posy1=99,posx2=101,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=102,posy1=99,posx2=102,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=103,posy1=99,posx2=103,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=104,posy1=99,posx2=104,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=105,posy1=99,posx2=105,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=106,posy1=99,posx2=105,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=99,posx2=105,posy2=99,modelid=76,xinterval=0,yinterval=0},  --安全区边线




{posx1=107,posy1=100,posx2=107,posy2=100,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=101,posx2=107,posy2=101,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=102,posx2=107,posy2=102,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=103,posx2=107,posy2=103,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=104,posx2=107,posy2=104,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=105,posx2=107,posy2=105,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=106,posx2=107,posy2=106,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=107,posx2=107,posy2=107,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=108,posx2=107,posy2=108,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=109,posx2=107,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=107,posy1=110,posx2=107,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线



{posx1=106,posy1=110,posx2=107,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=105,posy1=110,posx2=107,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=104,posy1=110,posx2=104,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=103,posy1=110,posx2=103,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=102,posy1=110,posx2=102,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=101,posy1=110,posx2=101,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=100,posy1=110,posx2=100,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=99,posy1=110,posx2=99,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=98,posy1=110,posx2=98,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=110,posx2=97,posy2=110,modelid=76,xinterval=0,yinterval=0},  --安全区边线



{posx1=97,posy1=109,posx2=97,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=108,posx2=97,posy2=108,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=107,posx2=97,posy2=107,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=106,posx2=97,posy2=106,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=105,posx2=97,posy2=105,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=104,posx2=97,posy2=104,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=103,posx2=97,posy2=103,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=102,posx2=97,posy2=102,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=101,posx2=97,posy2=101,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=97,posy1=100,posx2=97,posy2=100,modelid=76,xinterval=0,yinterval=0},  --安全区边线

 },

},