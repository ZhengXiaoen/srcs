----#include "..\..\language\LangCode.txt"

--法宝配置
MagicEquipCfg={
	activeLevel=5,

	--法宝列表
	MagicEquips={
		{

{id = 460,maxExp = 100	,addExp = 10  ,addActorExp=200000  ,consume = { {type=0, id=402, count=1},}, }, --1阶法宝
{id = 461,maxExp = 245	,addExp = 20  ,addActorExp=400000  ,consume = { {type=0, id=402, count=2},}, }, --2阶法宝
{id = 462,maxExp = 460	,addExp = 30  ,addActorExp=600000  ,consume = { {type=0, id=402, count=3},}, }, --3阶法宝
{id = 463,maxExp = 770	,addExp = 50  ,addActorExp=1000000 ,consume = { {type=0, id=402, count=5},}, }, --4阶法宝
{id = 464,maxExp = 1870	,addExp = 100 ,addActorExp=2000000 ,consume = { {type=0, id=402, count=10},}, }, --5阶法宝
{id = 465,maxExp = 4805	,addExp = 200 ,addActorExp=4000000 ,consume = { {type=0, id=402, count=20},}, }, --6阶法宝
{id = 466,maxExp = 12045,addExp = 500 ,addActorExp=10000000,consume = { {type=0, id=402, count=50},}, }, --7阶法宝
{id = 467,maxExp = 29725,addExp = 1000,addActorExp=20000000,consume = { {type=0, id=402, count=100},}, }, --8阶法宝
{id = 468,maxExp = 72535,addExp = 2000,addActorExp=40000000,consume = { {type=0, id=402, count=200},}, }, --9阶法宝
{id = 469,maxExp = 0	,addExp = 3000,addActorExp=60000000,consume = { {type=0, id=402, count=300},}, }, --10阶法宝


		},
		
	},
	--购买法宝
	BuyMagicEquipCfg=
	{
		id=460,	--购买的法宝ID
		consume={{type=15,id=0,count=500},},	--购买所需的消耗品
	},
}