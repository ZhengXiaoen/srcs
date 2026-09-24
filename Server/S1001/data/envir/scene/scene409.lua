--9转战场
{
	scenceid = 409,
	scencename = Lang.SceneName.s00409,
	mapfilename = "153YuanGuZhanChang",
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
	sceneWidth = 252,
	sceneHeight = 264,
	sceneType=7,

	area =
	{
		{ name = Lang.SceneName.s00409, range = { 0,0,251,0,251,263,0,263}, center = { 134,119},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
                    -- { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					{type=50,value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
					
				},
		},

		{ name = Lang.SceneName.a00000, range = { 124,109, 145,109, 145,130, 124,130 }, center = { 134,119 }, 
		attri = {
			 { type =1,value = {}},      --世界安全区
		     { type =39,value = {}},     --城镇
			 --{type=41,value = {5000}},--自动加经验，每秒5000点
			 --{type=78,value = {}},     --摆摊区域
			 { type =46,value = {134,119,134,119}},     --安全区复活点
			 {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 { type =83,value = {}},     --禁止使用火墙
			 { type =60,value = {}},     --禁止自动战斗
			 {type =90,value = {}}, --安全复活区，城镇，禁止放火墙术
			 {type=50,value = {4}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
			 }}, 
		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh409.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		
	},

  teleport =
  {
	


  },

  landscape=
 {
{posx1=124,posy1=109,posx2=124,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=127,posy1=109,posx2=127,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=130,posy1=109,posx2=130,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=133,posy1=109,posx2=133,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=136,posy1=109,posx2=136,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=139,posy1=109,posx2=139,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=142,posy1=109,posx2=142,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=109,posx2=145,posy2=109,modelid=76,xinterval=0,yinterval=0},  --安全区边线

{posx1=124,posy1=112,posx2=124,posy2=112,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=115,posx2=124,posy2=115,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=118,posx2=124,posy2=118,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=121,posx2=124,posy2=121,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=124,posx2=124,posy2=124,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=127,posx2=124,posy2=127,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=124,posy1=130,posx2=124,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线

{posx1=127,posy1=130,posx2=127,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=130,posy1=130,posx2=130,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=133,posy1=130,posx2=133,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=136,posy1=130,posx2=136,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=139,posy1=130,posx2=139,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=142,posy1=130,posx2=142,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线

{posx1=145,posy1=112,posx2=145,posy2=112,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=115,posx2=145,posy2=115,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=118,posx2=145,posy2=118,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=121,posx2=145,posy2=121,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=124,posx2=145,posy2=124,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=127,posx2=145,posy2=127,modelid=76,xinterval=0,yinterval=0},  --安全区边线
{posx1=145,posy1=130,posx2=145,posy2=130,modelid=76,xinterval=0,yinterval=0},  --安全区边线




 },

},