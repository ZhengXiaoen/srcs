--#include "..\..\language\LangCode.txt"
--神炉配置,成就勋章
EquipStoveCfg =
    {
        --索引 --玉佩=1、护盾=2、宝石=3、圣珠=4、麻痹戒指=5、护身戒指=6、复活戒指=7、勋章=8
        activeLevels = {30, 45, 55, 70, 30, 30, 30, 65};
        
        --护盾
        ShieldUpgrade =
        {
            
            {shwoEffId = 863, award = {type = 0, id = 863, count = 1, bind = 1}, }, --荆棘护盾Lv1
{needLevel = 47, needCircle = 0, shwoEffId =865,consume = {{type = 45, id = 0, count = 10000}}, award = {type = 0, id = 864, count = 1, bind = 1}, }, --玄武护盾Lv2
{needLevel = 49, needCircle = 0, shwoEffId =867,consume = {{type = 45, id = 0, count = 24000}}, award = {type = 0, id = 865, count = 1, bind = 1}, }, --玄武护盾Lv3
{needLevel = 51, needCircle = 0, shwoEffId =869,consume = {{type = 45, id = 0, count = 52000}}, award = {type = 0, id = 866, count = 1, bind = 1}, }, --玄武护盾Lv4
{needLevel = 53, needCircle = 0, shwoEffId =871,consume = {{type = 45, id = 0, count = 90000}}, award = {type = 0, id = 867, count = 1, bind = 1}, }, --玄武护盾Lv5
{needLevel = 55, needCircle = 0, shwoEffId =873,consume = {{type = 45, id = 0, count = 136000}}, award = {type = 0, id = 868, count = 1, bind = 1}, }, --玄武护盾Lv6
{needLevel = 57, needCircle = 0, shwoEffId =875,consume = {{type = 45, id = 0, count = 184000}}, award = {type = 0, id = 869, count = 1, bind = 1}, }, --玄武护盾Lv7
{needLevel = 59, needCircle = 0, shwoEffId =877,consume = {{type = 45, id = 0, count = 260000}}, award = {type = 0, id = 870, count = 1, bind = 1}, }, --玄武护盾Lv8
{needLevel = 61, needCircle = 0, shwoEffId =879,consume = {{type = 45, id = 0, count = 350000}}, award = {type = 0, id = 871, count = 1, bind = 1}, }, --玄武护盾Lv9
{needLevel = 63, needCircle = 0, shwoEffId =881,consume = {{type = 45, id = 0, count = 450000}}, award = {type = 0, id = 872, count = 1, bind = 1}, }, --玄武护盾Lv10
{needLevel = 65, needCircle = 0, shwoEffId =883,consume = {{type = 45, id = 0, count = 556000}}, award = {type = 0, id = 873, count = 1, bind = 1}, }, --玄武护盾Lv11
{needLevel = 67, needCircle = 0, shwoEffId =885,consume = {{type = 45, id = 0, count = 696000}}, award = {type = 0, id = 874, count = 1, bind = 1}, }, --玄武护盾Lv12
{needLevel = 69, needCircle = 0, shwoEffId =887,consume = {{type = 45, id = 0, count = 858000}}, award = {type = 0, id = 875, count = 1, bind = 1}, }, --玄武护盾Lv13
{needLevel = 71, needCircle = 0, shwoEffId =889,consume = {{type = 45, id = 0, count = 996000}}, award = {type = 0, id = 876, count = 1, bind = 1}, }, --玄武护盾Lv14
{needLevel = 73, needCircle = 0, shwoEffId =891,consume = {{type = 45, id = 0, count = 1088000}}, award = {type = 0, id = 877, count = 1, bind = 1}, }, --玄武护盾Lv15
{needLevel = 75, needCircle = 0, shwoEffId =893,consume = {{type = 45, id = 0, count = 1176000}}, award = {type = 0, id = 878, count = 1, bind = 1}, }, --玄武护盾Lv16
{needLevel = 77, needCircle = 0, shwoEffId =895,consume = {{type = 45, id = 0, count = 1266000}}, award = {type = 0, id = 879, count = 1, bind = 1}, }, --玄武护盾Lv17
{needLevel = 79, needCircle = 0, shwoEffId =897,consume = {{type = 45, id = 0, count = 1370000}}, award = {type = 0, id = 880, count = 1, bind = 1}, }, --玄武护盾Lv18
{needLevel = 81, needCircle = 0, shwoEffId =899,consume = {{type = 45, id = 0, count = 1466000}}, award = {type = 0, id = 881, count = 1, bind = 1}, }, --玄武护盾Lv19
{needLevel = 83, needCircle = 0, shwoEffId =901,consume = {{type = 45, id = 0, count = 1576000}}, award = {type = 0, id = 882, count = 1, bind = 1}, }, --玄武护盾Lv20
{needLevel = 85, needCircle = 0, shwoEffId =903,consume = {{type = 45, id = 0, count = 1680000}}, award = {type = 0, id = 883, count = 1, bind = 1}, }, --玄武护盾Lv21
{needLevel = 87, needCircle = 0, shwoEffId =905,consume = {{type = 45, id = 0, count = 1746000}}, award = {type = 0, id = 884, count = 1, bind = 1}, }, --玄武护盾Lv22
{needLevel = 89, needCircle = 0, shwoEffId =907,consume = {{type = 45, id = 0, count = 1806000}}, award = {type = 0, id = 885, count = 1, bind = 1}, }, --玄武护盾Lv23
{needLevel = 91, needCircle = 0, shwoEffId =909,consume = {{type = 45, id = 0, count = 1880000}}, award = {type = 0, id = 886, count = 1, bind = 1}, }, --玄武护盾Lv24
{needLevel = 93, needCircle = 0, shwoEffId =911,consume = {{type = 45, id = 0, count = 1940000}}, award = {type = 0, id = 887, count = 1, bind = 1}, }, --玄武护盾Lv25
{needLevel = 95, needCircle = 0, shwoEffId =913,consume = {{type = 45, id = 0, count = 2016000}}, award = {type = 0, id = 888, count = 1, bind = 1}, }, --玄武护盾Lv26
{needLevel = 97, needCircle = 0, shwoEffId =915,consume = {{type = 45, id = 0, count = 2100000}}, award = {type = 0, id = 889, count = 1, bind = 1}, }, --玄武护盾Lv27
{needLevel = 99, needCircle = 0, shwoEffId =917,consume = {{type = 45, id = 0, count = 2160000}}, award = {type = 0, id = 890, count = 1, bind = 1}, }, --玄武护盾Lv28
{needLevel = 101, needCircle = 0, shwoEffId =919,consume = {{type = 45, id = 0, count = 2240000}}, award = {type = 0, id = 891, count = 1, bind = 1}, }, --玄武护盾Lv29
{needLevel = 103, needCircle = 0, shwoEffId =921,consume = {{type = 45, id = 0, count = 2320000}}, award = {type = 0, id = 892, count = 1, bind = 1}, }, --玄武护盾Lv30
{needLevel = 105, needCircle = 0, shwoEffId =923,consume = {{type = 45, id = 0, count = 2400000}}, award = {type = 0, id = 893, count = 1, bind = 1}, }, --玄武护盾Lv31
{needLevel = 107, needCircle = 0, shwoEffId =925,consume = {{type = 45, id = 0, count = 2460000}}, award = {type = 0, id = 894, count = 1, bind = 1}, }, --玄武护盾Lv32
{needLevel = 109, needCircle = 0, shwoEffId =927,consume = {{type = 45, id = 0, count = 2540000}}, award = {type = 0, id = 895, count = 1, bind = 1}, }, --玄武护盾Lv33
{needLevel = 111, needCircle = 0, shwoEffId =929,consume = {{type = 45, id = 0, count = 2620000}}, award = {type = 0, id = 896, count = 1, bind = 1}, }, --玄武护盾Lv34
{needLevel = 113, needCircle = 0, shwoEffId =931,consume = {{type = 45, id = 0, count = 2700000}}, award = {type = 0, id = 897, count = 1, bind = 1}, }, --玄武护盾Lv35
{needLevel = 114, needCircle = 0, shwoEffId =933,consume = {{type = 45, id = 0, count = 2780000}}, award = {type = 0, id = 898, count = 1, bind = 1}, }, --玄武护盾Lv36
{needLevel = 115, needCircle = 0, shwoEffId =935,consume = {{type = 45, id = 0, count = 2860000}}, award = {type = 0, id = 899, count = 1, bind = 1}, }, --玄武护盾Lv37
{needLevel = 116, needCircle = 0, shwoEffId =937,consume = {{type = 45, id = 0, count = 2940000}}, award = {type = 0, id = 900, count = 1, bind = 1}, }, --玄武护盾Lv38
{needLevel = 117, needCircle = 0, shwoEffId =939,consume = {{type = 45, id = 0, count = 3040000}}, award = {type = 0, id = 901, count = 1, bind = 1}, }, --玄武护盾Lv39
{needLevel = 118, needCircle = 0, shwoEffId =941,consume = {{type = 45, id = 0, count = 3120000}}, award = {type = 0, id = 902, count = 1, bind = 1}, }, --玄武护盾Lv40
{needLevel = 119, needCircle = 0, shwoEffId =943,consume = {{type = 45, id = 0, count = 3200000}}, award = {type = 0, id = 903, count = 1, bind = 1}, }, --玄武护盾Lv41
{needLevel = 120, needCircle = 0, shwoEffId =945,consume = {{type = 45, id = 0, count = 3420000}}, award = {type = 0, id = 904, count = 1, bind = 1}, }, --玄武护盾Lv42
{needLevel = 121, needCircle = 0, shwoEffId =947,consume = {{type = 45, id = 0, count = 3660000}}, award = {type = 0, id = 905, count = 1, bind = 1}, }, --玄武护盾Lv43
{needLevel = 122, needCircle = 0, shwoEffId =949,consume = {{type = 45, id = 0, count = 3880000}}, award = {type = 0, id = 906, count = 1, bind = 1}, }, --玄武护盾Lv44
{needLevel = 123, needCircle = 0, shwoEffId =951,consume = {{type = 45, id = 0, count = 4120000}}, award = {type = 0, id = 907, count = 1, bind = 1}, }, --玄武护盾Lv45
{needLevel = 124, needCircle = 0, shwoEffId =953,consume = {{type = 45, id = 0, count = 4380000}}, award = {type = 0, id = 908, count = 1, bind = 1}, }, --玄武护盾Lv46
{needLevel = 125, needCircle = 0, shwoEffId =955,consume = {{type = 45, id = 0, count = 4620000}}, award = {type = 0, id = 909, count = 1, bind = 1}, }, --玄武护盾Lv47
{needLevel = 126, needCircle = 0, shwoEffId =957,consume = {{type = 45, id = 0, count = 4880000}}, award = {type = 0, id = 910, count = 1, bind = 1}, }, --玄武护盾Lv48
{needLevel = 127, needCircle = 0, shwoEffId =959,consume = {{type = 45, id = 0, count = 7000000}}, award = {type = 0, id = 911, count = 1, bind = 1}, }, --玄武护盾Lv49
{needLevel = 128, needCircle = 0, shwoEffId =961,consume = {{type = 45, id = 0, count = 10000000}}, award = {type = 0, id = 912, count = 1, bind = 1}, }, --玄武护盾LvMax

{needLevel=128,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=10240000}},award={type=0,id=913,count=1,bind=1},},--玄武护盾Lv51
{needLevel=128,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=10480000}},award={type=0,id=914,count=1,bind=1},},--玄武护盾Lv52
{needLevel=128,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=10720000}},award={type=0,id=915,count=1,bind=1},},--玄武护盾Lv53
{needLevel=128,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=10960000}},award={type=0,id=916,count=1,bind=1},},--玄武护盾Lv54
{needLevel=128,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=11200000}},award={type=0,id=917,count=1,bind=1},},--玄武护盾Lv55
{needLevel=129,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=11440000}},award={type=0,id=918,count=1,bind=1},},--玄武护盾Lv56
{needLevel=129,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=11680000}},award={type=0,id=919,count=1,bind=1},},--玄武护盾Lv57
{needLevel=129,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=11920000}},award={type=0,id=920,count=1,bind=1},},--玄武护盾Lv58
{needLevel=129,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=12160000}},award={type=0,id=921,count=1,bind=1},},--玄武护盾Lv59
{needLevel=129,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=12400000}},award={type=0,id=922,count=1,bind=1},},--玄武护盾Lv60
{needLevel=130,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=12680000}},award={type=0,id=923,count=1,bind=1},},--玄武护盾Lv61
{needLevel=130,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=12960000}},award={type=0,id=924,count=1,bind=1},},--玄武护盾Lv62
{needLevel=130,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=13240000}},award={type=0,id=925,count=1,bind=1},},--玄武护盾Lv63
{needLevel=130,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=13520000}},award={type=0,id=926,count=1,bind=1},},--玄武护盾Lv64
{needLevel=130,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=13800000}},award={type=0,id=927,count=1,bind=1},},--玄武护盾Lv65
{needLevel=131,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=14080000}},award={type=0,id=928,count=1,bind=1},},--玄武护盾Lv66
{needLevel=131,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=14360000}},award={type=0,id=929,count=1,bind=1},},--玄武护盾Lv67
{needLevel=131,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=14640000}},award={type=0,id=930,count=1,bind=1},},--玄武护盾Lv68
{needLevel=131,needCircle=0,shwoEffId=931,consume={{type=45,id=0,count=14920000}},award={type=0,id=931,count=1,bind=1},},--玄武护盾Lv69
{needLevel=131,needCircle=0,shwoEffId=932,consume={{type=45,id=0,count=15200000}},award={type=0,id=932,count=1,bind=1},},--玄武护盾Lv70
{needLevel=132,needCircle=0,shwoEffId=933,consume={{type=45,id=0,count=15520000}},award={type=0,id=933,count=1,bind=1},},--玄武护盾Lv71
{needLevel=132,needCircle=0,shwoEffId=934,consume={{type=45,id=0,count=15840000}},award={type=0,id=934,count=1,bind=1},},--玄武护盾Lv72
{needLevel=132,needCircle=0,shwoEffId=935,consume={{type=45,id=0,count=16160000}},award={type=0,id=935,count=1,bind=1},},--玄武护盾Lv73
{needLevel=132,needCircle=0,shwoEffId=936,consume={{type=45,id=0,count=16480000}},award={type=0,id=936,count=1,bind=1},},--玄武护盾Lv74
{needLevel=132,needCircle=0,shwoEffId=937,consume={{type=45,id=0,count=16800000}},award={type=0,id=937,count=1,bind=1},},--玄武护盾Lv75
{needLevel=133,needCircle=0,shwoEffId=938,consume={{type=45,id=0,count=17120000}},award={type=0,id=938,count=1,bind=1},},--玄武护盾Lv76
{needLevel=133,needCircle=0,shwoEffId=939,consume={{type=45,id=0,count=17440000}},award={type=0,id=939,count=1,bind=1},},--玄武护盾Lv77
{needLevel=133,needCircle=0,shwoEffId=940,consume={{type=45,id=0,count=17760000}},award={type=0,id=940,count=1,bind=1},},--玄武护盾Lv78
{needLevel=133,needCircle=0,shwoEffId=941,consume={{type=45,id=0,count=18080000}},award={type=0,id=941,count=1,bind=1},},--玄武护盾Lv79
{needLevel=133,needCircle=0,shwoEffId=942,consume={{type=45,id=0,count=18400000}},award={type=0,id=942,count=1,bind=1},},--玄武护盾Lv80
{needLevel=134,needCircle=0,shwoEffId=943,consume={{type=45,id=0,count=18760000}},award={type=0,id=943,count=1,bind=1},},--玄武护盾Lv81
{needLevel=134,needCircle=0,shwoEffId=944,consume={{type=45,id=0,count=19120000}},award={type=0,id=944,count=1,bind=1},},--玄武护盾Lv82
{needLevel=134,needCircle=0,shwoEffId=945,consume={{type=45,id=0,count=19480000}},award={type=0,id=945,count=1,bind=1},},--玄武护盾Lv83
{needLevel=134,needCircle=0,shwoEffId=946,consume={{type=45,id=0,count=19840000}},award={type=0,id=946,count=1,bind=1},},--玄武护盾Lv84
{needLevel=134,needCircle=0,shwoEffId=947,consume={{type=45,id=0,count=20200000}},award={type=0,id=947,count=1,bind=1},},--玄武护盾Lv85
{needLevel=135,needCircle=0,shwoEffId=948,consume={{type=45,id=0,count=20560000}},award={type=0,id=948,count=1,bind=1},},--玄武护盾Lv86
{needLevel=135,needCircle=0,shwoEffId=949,consume={{type=45,id=0,count=20920000}},award={type=0,id=949,count=1,bind=1},},--玄武护盾Lv87
{needLevel=135,needCircle=0,shwoEffId=950,consume={{type=45,id=0,count=21280000}},award={type=0,id=950,count=1,bind=1},},--玄武护盾Lv88
{needLevel=135,needCircle=0,shwoEffId=951,consume={{type=45,id=0,count=21640000}},award={type=0,id=951,count=1,bind=1},},--玄武护盾Lv89
{needLevel=135,needCircle=0,shwoEffId=952,consume={{type=45,id=0,count=22000000}},award={type=0,id=952,count=1,bind=1},},--玄武护盾Lv90
{needLevel=136,needCircle=0,shwoEffId=953,consume={{type=45,id=0,count=22400000}},award={type=0,id=953,count=1,bind=1},},--玄武护盾Lv91
{needLevel=136,needCircle=0,shwoEffId=954,consume={{type=45,id=0,count=22800000}},award={type=0,id=954,count=1,bind=1},},--玄武护盾Lv92
{needLevel=136,needCircle=0,shwoEffId=955,consume={{type=45,id=0,count=23200000}},award={type=0,id=955,count=1,bind=1},},--玄武护盾Lv93
{needLevel=136,needCircle=0,shwoEffId=956,consume={{type=45,id=0,count=23600000}},award={type=0,id=956,count=1,bind=1},},--玄武护盾Lv94
{needLevel=136,needCircle=0,shwoEffId=957,consume={{type=45,id=0,count=24000000}},award={type=0,id=957,count=1,bind=1},},--玄武护盾Lv95
{needLevel=137,needCircle=0,shwoEffId=958,consume={{type=45,id=0,count=24400000}},award={type=0,id=958,count=1,bind=1},},--玄武护盾Lv96
{needLevel=137,needCircle=0,shwoEffId=959,consume={{type=45,id=0,count=24800000}},award={type=0,id=959,count=1,bind=1},},--玄武护盾Lv97
{needLevel=137,needCircle=0,shwoEffId=960,consume={{type=45,id=0,count=25200000}},award={type=0,id=960,count=1,bind=1},},--玄武护盾Lv98
{needLevel=137,needCircle=0,shwoEffId=961,consume={{type=45,id=0,count=25600000}},award={type=0,id=961,count=1,bind=1},},--玄武护盾Lv99
{needLevel=137,needCircle=0,shwoEffId=962,consume={{type=45,id=0,count=26000000}},award={type=0,id=962,count=1,bind=1},},--玄武护盾LvMax



        },
        
        --护符
        TalismanInfo =
        {
            
            --战士
            {
                
                {shwoEffId = 1279, award = {type = 0, id = 1279, count = 1, bind = 1}, }, --战狂护符Lv1
                {needLevel = 32, needCircle = 0, shwoEffId =1281,consume = {{type = 46, id = 0, count = 10000}}, award = {type = 0, id = 1280, count = 1, bind = 1}, }, --战狂护符Lv2
{needLevel = 34, needCircle = 0, shwoEffId =1283,consume = {{type = 46, id = 0, count = 24000}}, award = {type = 0, id = 1281, count = 1, bind = 1}, }, --战狂护符Lv3
{needLevel = 36, needCircle = 0, shwoEffId =1285,consume = {{type = 46, id = 0, count = 52000}}, award = {type = 0, id = 1282, count = 1, bind = 1}, }, --战狂护符Lv4
{needLevel = 38, needCircle = 0, shwoEffId =1287,consume = {{type = 46, id = 0, count = 90000}}, award = {type = 0, id = 1283, count = 1, bind = 1}, }, --战狂护符Lv5
{needLevel = 40, needCircle = 0, shwoEffId =1289,consume = {{type = 46, id = 0, count = 136000}}, award = {type = 0, id = 1284, count = 1, bind = 1}, }, --战狂护符Lv6
{needLevel = 42, needCircle = 0, shwoEffId =1291,consume = {{type = 46, id = 0, count = 184000}}, award = {type = 0, id = 1285, count = 1, bind = 1}, }, --战狂护符Lv7
{needLevel = 44, needCircle = 0, shwoEffId =1293,consume = {{type = 46, id = 0, count = 260000}}, award = {type = 0, id = 1286, count = 1, bind = 1}, }, --战狂护符Lv8
{needLevel = 46, needCircle = 0, shwoEffId =1295,consume = {{type = 46, id = 0, count = 350000}}, award = {type = 0, id = 1287, count = 1, bind = 1}, }, --战狂护符Lv9
{needLevel = 48, needCircle = 0, shwoEffId =1297,consume = {{type = 46, id = 0, count = 450000}}, award = {type = 0, id = 1288, count = 1, bind = 1}, }, --战狂护符Lv10
{needLevel = 50, needCircle = 0, shwoEffId =1299,consume = {{type = 46, id = 0, count = 556000}}, award = {type = 0, id = 1289, count = 1, bind = 1}, }, --战狂护符Lv11
{needLevel = 52, needCircle = 0, shwoEffId =1301,consume = {{type = 46, id = 0, count = 696000}}, award = {type = 0, id = 1290, count = 1, bind = 1}, }, --战狂护符Lv12
{needLevel = 54, needCircle = 0, shwoEffId =1303,consume = {{type = 46, id = 0, count = 858000}}, award = {type = 0, id = 1291, count = 1, bind = 1}, }, --战狂护符Lv13
{needLevel = 56, needCircle = 0, shwoEffId =1305,consume = {{type = 46, id = 0, count = 996000}}, award = {type = 0, id = 1292, count = 1, bind = 1}, }, --战狂护符Lv14
{needLevel = 58, needCircle = 0, shwoEffId =1307,consume = {{type = 46, id = 0, count = 1088000}}, award = {type = 0, id = 1293, count = 1, bind = 1}, }, --战狂护符Lv15
{needLevel = 60, needCircle = 0, shwoEffId =1309,consume = {{type = 46, id = 0, count = 1176000}}, award = {type = 0, id = 1294, count = 1, bind = 1}, }, --战狂护符Lv16
{needLevel = 62, needCircle = 0, shwoEffId =1311,consume = {{type = 46, id = 0, count = 1266000}}, award = {type = 0, id = 1295, count = 1, bind = 1}, }, --战狂护符Lv17
{needLevel = 64, needCircle = 0, shwoEffId =1313,consume = {{type = 46, id = 0, count = 1370000}}, award = {type = 0, id = 1296, count = 1, bind = 1}, }, --战狂护符Lv18
{needLevel = 66, needCircle = 0, shwoEffId =1315,consume = {{type = 46, id = 0, count = 1466000}}, award = {type = 0, id = 1297, count = 1, bind = 1}, }, --战狂护符Lv19
{needLevel = 68, needCircle = 0, shwoEffId =1317,consume = {{type = 46, id = 0, count = 1576000}}, award = {type = 0, id = 1298, count = 1, bind = 1}, }, --战狂护符Lv20
{needLevel = 70, needCircle = 0, shwoEffId =1319,consume = {{type = 46, id = 0, count = 1680000}}, award = {type = 0, id = 1299, count = 1, bind = 1}, }, --战狂护符Lv21
{needLevel = 72, needCircle = 0, shwoEffId =1321,consume = {{type = 46, id = 0, count = 1746000}}, award = {type = 0, id = 1300, count = 1, bind = 1}, }, --战狂护符Lv22
{needLevel = 74, needCircle = 0, shwoEffId =1323,consume = {{type = 46, id = 0, count = 1806000}}, award = {type = 0, id = 1301, count = 1, bind = 1}, }, --战狂护符Lv23
{needLevel = 76, needCircle = 0, shwoEffId =1325,consume = {{type = 46, id = 0, count = 1880000}}, award = {type = 0, id = 1302, count = 1, bind = 1}, }, --战狂护符Lv24
{needLevel = 78, needCircle = 0, shwoEffId =1327,consume = {{type = 46, id = 0, count = 1940000}}, award = {type = 0, id = 1303, count = 1, bind = 1}, }, --战狂护符Lv25
{needLevel = 80, needCircle = 0, shwoEffId =1329,consume = {{type = 46, id = 0, count = 2016000}}, award = {type = 0, id = 1304, count = 1, bind = 1}, }, --战狂护符Lv26
{needLevel = 82, needCircle = 0, shwoEffId =1331,consume = {{type = 46, id = 0, count = 2100000}}, award = {type = 0, id = 1305, count = 1, bind = 1}, }, --战狂护符Lv27
{needLevel = 84, needCircle = 0, shwoEffId =1333,consume = {{type = 46, id = 0, count = 2160000}}, award = {type = 0, id = 1306, count = 1, bind = 1}, }, --战狂护符Lv28
{needLevel = 86, needCircle = 0, shwoEffId =1335,consume = {{type = 46, id = 0, count = 2240000}}, award = {type = 0, id = 1307, count = 1, bind = 1}, }, --战狂护符Lv29
{needLevel = 88, needCircle = 0, shwoEffId =1337,consume = {{type = 46, id = 0, count = 2320000}}, award = {type = 0, id = 1308, count = 1, bind = 1}, }, --战狂护符Lv30
{needLevel = 90, needCircle = 0, shwoEffId =1339,consume = {{type = 46, id = 0, count = 2400000}}, award = {type = 0, id = 1309, count = 1, bind = 1}, }, --战狂护符Lv31
{needLevel = 92, needCircle = 0, shwoEffId =1341,consume = {{type = 46, id = 0, count = 2460000}}, award = {type = 0, id = 1310, count = 1, bind = 1}, }, --战狂护符Lv32
{needLevel = 94, needCircle = 0, shwoEffId =1343,consume = {{type = 46, id = 0, count = 2540000}}, award = {type = 0, id = 1311, count = 1, bind = 1}, }, --战狂护符Lv33
{needLevel = 96, needCircle = 0, shwoEffId =1345,consume = {{type = 46, id = 0, count = 2620000}}, award = {type = 0, id = 1312, count = 1, bind = 1}, }, --战狂护符Lv34
{needLevel = 98, needCircle = 0, shwoEffId =1347,consume = {{type = 46, id = 0, count = 2700000}}, award = {type = 0, id = 1313, count = 1, bind = 1}, }, --战狂护符Lv35
{needLevel = 100, needCircle = 0, shwoEffId =1349, consume = {{type = 46, id = 0, count = 2780000}}, award = {type = 0, id = 1314, count = 1, bind = 1}, }, --战狂护符Lv36
{needLevel = 102, needCircle = 0, shwoEffId =1351, consume = {{type = 46, id = 0, count = 2860000}}, award = {type = 0, id = 1315, count = 1, bind = 1}, }, --战狂护符Lv37
{needLevel = 104, needCircle = 0, shwoEffId =1353, consume = {{type = 46, id = 0, count = 2940000}}, award = {type = 0, id = 1316, count = 1, bind = 1}, }, --战狂护符Lv38
{needLevel = 106, needCircle = 0, shwoEffId =1355, consume = {{type = 46, id = 0, count = 3040000}}, award = {type = 0, id = 1317, count = 1, bind = 1}, }, --战狂护符Lv39
{needLevel = 108, needCircle = 0, shwoEffId =1357, consume = {{type = 46, id = 0, count = 3120000}}, award = {type = 0, id = 1318, count = 1, bind = 1}, }, --战狂护符Lv40
{needLevel = 110, needCircle = 0, shwoEffId =1359, consume = {{type = 46, id = 0, count = 3200000}}, award = {type = 0, id = 1319, count = 1, bind = 1}, }, --战狂护符Lv41
{needLevel = 112, needCircle = 0, shwoEffId =1361, consume = {{type = 46, id = 0, count = 3420000}}, award = {type = 0, id = 1320, count = 1, bind = 1}, }, --战狂护符Lv42
{needLevel = 114, needCircle = 0, shwoEffId =1363, consume = {{type = 46, id = 0, count = 3660000}}, award = {type = 0, id = 1321, count = 1, bind = 1}, }, --战狂护符Lv43
{needLevel = 116, needCircle = 0, shwoEffId =1365, consume = {{type = 46, id = 0, count = 3880000}}, award = {type = 0, id = 1322, count = 1, bind = 1}, }, --战狂护符Lv44
{needLevel = 118, needCircle = 0, shwoEffId =1367, consume = {{type = 46, id = 0, count = 4120000}}, award = {type = 0, id = 1323, count = 1, bind = 1}, }, --战狂护符Lv45
{needLevel = 120, needCircle = 0, shwoEffId =1369, consume = {{type = 46, id = 0, count = 4380000}}, award = {type = 0, id = 1324, count = 1, bind = 1}, }, --战狂护符Lv46
{needLevel = 122, needCircle = 0, shwoEffId =1371, consume = {{type = 46, id = 0, count = 4620000}}, award = {type = 0, id = 1325, count = 1, bind = 1}, }, --战狂护符Lv47
{needLevel = 124, needCircle = 0, shwoEffId =1373, consume = {{type = 46, id = 0, count = 4880000}}, award = {type = 0, id = 1326, count = 1, bind = 1}, }, --战狂护符Lv48
{needLevel = 126, needCircle = 0, shwoEffId =1375, consume = {{type = 46, id = 0, count = 7000000}}, award = {type = 0, id = 1327, count = 1, bind = 1}, }, --战狂护符Lv49
{needLevel = 128, needCircle = 0, shwoEffId =1377, consume = {{type = 46, id = 0, count = 10000000}}, award = {type = 0, id = 1328, count = 1, bind = 1}, }, --战狂护符Lv50
{needLevel=128,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=10240000}},award={type=0,id=1329,count=1,bind=1},},--战狂护符Lv51
{needLevel=128,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=10480000}},award={type=0,id=1330,count=1,bind=1},},--战狂护符Lv52
{needLevel=128,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=10720000}},award={type=0,id=1331,count=1,bind=1},},--战狂护符Lv53
{needLevel=128,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=10960000}},award={type=0,id=1332,count=1,bind=1},},--战狂护符Lv54
{needLevel=128,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=11200000}},award={type=0,id=1333,count=1,bind=1},},--战狂护符Lv55
{needLevel=129,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=11440000}},award={type=0,id=1334,count=1,bind=1},},--战狂护符Lv56
{needLevel=129,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=11680000}},award={type=0,id=1335,count=1,bind=1},},--战狂护符Lv57
{needLevel=129,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=11920000}},award={type=0,id=1336,count=1,bind=1},},--战狂护符Lv58
{needLevel=129,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=12160000}},award={type=0,id=1337,count=1,bind=1},},--战狂护符Lv59
{needLevel=129,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=12400000}},award={type=0,id=1338,count=1,bind=1},},--战狂护符Lv60
{needLevel=130,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=12680000}},award={type=0,id=1339,count=1,bind=1},},--战狂护符Lv61
{needLevel=130,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=12960000}},award={type=0,id=1340,count=1,bind=1},},--战狂护符Lv62
{needLevel=130,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=13240000}},award={type=0,id=1341,count=1,bind=1},},--战狂护符Lv63
{needLevel=130,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=13520000}},award={type=0,id=1342,count=1,bind=1},},--战狂护符Lv64
{needLevel=130,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=13800000}},award={type=0,id=1343,count=1,bind=1},},--战狂护符Lv65
{needLevel=131,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=14080000}},award={type=0,id=1344,count=1,bind=1},},--战狂护符Lv66
{needLevel=131,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=14360000}},award={type=0,id=1345,count=1,bind=1},},--战狂护符Lv67
{needLevel=131,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=14640000}},award={type=0,id=1346,count=1,bind=1},},--战狂护符Lv68
{needLevel=131,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=14920000}},award={type=0,id=1347,count=1,bind=1},},--战狂护符Lv69
{needLevel=131,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=15200000}},award={type=0,id=1348,count=1,bind=1},},--战狂护符Lv70
{needLevel=132,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=15520000}},award={type=0,id=1349,count=1,bind=1},},--战狂护符Lv71
{needLevel=132,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=15840000}},award={type=0,id=1350,count=1,bind=1},},--战狂护符Lv72
{needLevel=132,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=16160000}},award={type=0,id=1351,count=1,bind=1},},--战狂护符Lv73
{needLevel=132,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=16480000}},award={type=0,id=1352,count=1,bind=1},},--战狂护符Lv74
{needLevel=132,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=16800000}},award={type=0,id=1353,count=1,bind=1},},--战狂护符Lv75
{needLevel=133,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=17120000}},award={type=0,id=1354,count=1,bind=1},},--战狂护符Lv76
{needLevel=133,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=17440000}},award={type=0,id=1355,count=1,bind=1},},--战狂护符Lv77
{needLevel=133,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=17760000}},award={type=0,id=1356,count=1,bind=1},},--战狂护符Lv78
{needLevel=133,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=18080000}},award={type=0,id=1357,count=1,bind=1},},--战狂护符Lv79
{needLevel=133,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=18400000}},award={type=0,id=1358,count=1,bind=1},},--战狂护符Lv80
{needLevel=134,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=18760000}},award={type=0,id=1359,count=1,bind=1},},--战狂护符Lv81
{needLevel=134,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=19120000}},award={type=0,id=1360,count=1,bind=1},},--战狂护符Lv82
{needLevel=134,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=19480000}},award={type=0,id=1361,count=1,bind=1},},--战狂护符Lv83
{needLevel=134,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=19840000}},award={type=0,id=1362,count=1,bind=1},},--战狂护符Lv84
{needLevel=134,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=20200000}},award={type=0,id=1363,count=1,bind=1},},--战狂护符Lv85
{needLevel=135,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=20560000}},award={type=0,id=1364,count=1,bind=1},},--战狂护符Lv86
{needLevel=135,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=20920000}},award={type=0,id=1365,count=1,bind=1},},--战狂护符Lv87
{needLevel=135,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=21280000}},award={type=0,id=1366,count=1,bind=1},},--战狂护符Lv88
{needLevel=135,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=21640000}},award={type=0,id=1367,count=1,bind=1},},--战狂护符Lv89
{needLevel=135,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=22000000}},award={type=0,id=1368,count=1,bind=1},},--战狂护符Lv90
{needLevel=136,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=22400000}},award={type=0,id=1369,count=1,bind=1},},--战狂护符Lv91
{needLevel=136,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=22800000}},award={type=0,id=1370,count=1,bind=1},},--战狂护符Lv92
{needLevel=136,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=23200000}},award={type=0,id=1371,count=1,bind=1},},--战狂护符Lv93
{needLevel=136,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=23600000}},award={type=0,id=1372,count=1,bind=1},},--战狂护符Lv94
{needLevel=136,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=24000000}},award={type=0,id=1373,count=1,bind=1},},--战狂护符Lv95
{needLevel=137,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=24400000}},award={type=0,id=1374,count=1,bind=1},},--战狂护符Lv96
{needLevel=137,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=24800000}},award={type=0,id=1375,count=1,bind=1},},--战狂护符Lv97
{needLevel=137,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=25200000}},award={type=0,id=1376,count=1,bind=1},},--战狂护符Lv98
{needLevel=137,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=25600000}},award={type=0,id=1377,count=1,bind=1},},--战狂护符Lv99
{needLevel=137,needCircle=0,shwoEffId=1377,consume={{type=46,id=0,count=26000000}},award={type=0,id=1378,count=1,bind=1},},--战狂护符Lv100


            
            
            
            },
            
            --法师
            {
                
                {shwoEffId = 1380, award = {type = 0, id = 1380, count = 1, bind = 1}, }, --法痴护符Lv1
{needLevel = 32, needCircle = 0, shwoEffId =1383,consume = {{type = 46, id = 0, count = 10000}}, award = {type = 0, id = 1381, count = 1, bind = 1}, }, --法痴护符Lv2
{needLevel = 34, needCircle = 0, shwoEffId =1385,consume = {{type = 46, id = 0, count = 24000}}, award = {type = 0, id = 1382, count = 1, bind = 1}, }, --法痴护符Lv3
{needLevel = 36, needCircle = 0, shwoEffId =1387,consume = {{type = 46, id = 0, count = 52000}}, award = {type = 0, id = 1383, count = 1, bind = 1}, }, --法痴护符Lv4
{needLevel = 38, needCircle = 0, shwoEffId =1389,consume = {{type = 46, id = 0, count = 90000}}, award = {type = 0, id = 1384, count = 1, bind = 1}, }, --法痴护符Lv5
{needLevel = 40, needCircle = 0, shwoEffId =1391,consume = {{type = 46, id = 0, count = 136000}}, award = {type = 0, id = 1385, count = 1, bind = 1}, }, --法痴护符Lv6
{needLevel = 42, needCircle = 0, shwoEffId =1393,consume = {{type = 46, id = 0, count = 184000}}, award = {type = 0, id = 1386, count = 1, bind = 1}, }, --法痴护符Lv7
{needLevel = 44, needCircle = 0, shwoEffId =1395,consume = {{type = 46, id = 0, count = 260000}}, award = {type = 0, id = 1387, count = 1, bind = 1}, }, --法痴护符Lv8
{needLevel = 46, needCircle = 0, shwoEffId =1397,consume = {{type = 46, id = 0, count = 350000}}, award = {type = 0, id = 1388, count = 1, bind = 1}, }, --法痴护符Lv9
{needLevel = 48, needCircle = 0, shwoEffId =1399,consume = {{type = 46, id = 0, count = 450000}}, award = {type = 0, id = 1389, count = 1, bind = 1}, }, --法痴护符Lv10
{needLevel = 50, needCircle = 0, shwoEffId =1401,consume = {{type = 46, id = 0, count = 556000}}, award = {type = 0, id = 1390, count = 1, bind = 1}, }, --法痴护符Lv11
{needLevel = 52, needCircle = 0, shwoEffId =1403,consume = {{type = 46, id = 0, count = 696000}}, award = {type = 0, id = 1391, count = 1, bind = 1}, }, --法痴护符Lv12
{needLevel = 54, needCircle = 0, shwoEffId =1405,consume = {{type = 46, id = 0, count = 858000}}, award = {type = 0, id = 1392, count = 1, bind = 1}, }, --法痴护符Lv13
{needLevel = 56, needCircle = 0, shwoEffId =1407,consume = {{type = 46, id = 0, count = 996000}}, award = {type = 0, id = 1393, count = 1, bind = 1}, }, --法痴护符Lv14
{needLevel = 58, needCircle = 0, shwoEffId =1409,consume = {{type = 46, id = 0, count = 1088000}}, award = {type = 0, id = 1394, count = 1, bind = 1}, }, --法痴护符Lv15
{needLevel = 60, needCircle = 0, shwoEffId =1411,consume = {{type = 46, id = 0, count = 1176000}}, award = {type = 0, id = 1395, count = 1, bind = 1}, }, --法痴护符Lv16
{needLevel = 62, needCircle = 0, shwoEffId =1413,consume = {{type = 46, id = 0, count = 1266000}}, award = {type = 0, id = 1396, count = 1, bind = 1}, }, --法痴护符Lv17
{needLevel = 64, needCircle = 0, shwoEffId =1415,consume = {{type = 46, id = 0, count = 1370000}}, award = {type = 0, id = 1397, count = 1, bind = 1}, }, --法痴护符Lv18
{needLevel = 66, needCircle = 0, shwoEffId =1417,consume = {{type = 46, id = 0, count = 1466000}}, award = {type = 0, id = 1398, count = 1, bind = 1}, }, --法痴护符Lv19
{needLevel = 68, needCircle = 0, shwoEffId =1419,consume = {{type = 46, id = 0, count = 1576000}}, award = {type = 0, id = 1399, count = 1, bind = 1}, }, --法痴护符Lv20
{needLevel = 70, needCircle = 0, shwoEffId =1421,consume = {{type = 46, id = 0, count = 1680000}}, award = {type = 0, id = 1400, count = 1, bind = 1}, }, --法痴护符Lv21
{needLevel = 72, needCircle = 0, shwoEffId =1423,consume = {{type = 46, id = 0, count = 1746000}}, award = {type = 0, id = 1401, count = 1, bind = 1}, }, --法痴护符Lv22
{needLevel = 74, needCircle = 0, shwoEffId =1425,consume = {{type = 46, id = 0, count = 1806000}}, award = {type = 0, id = 1402, count = 1, bind = 1}, }, --法痴护符Lv23
{needLevel = 76, needCircle = 0, shwoEffId =1427,consume = {{type = 46, id = 0, count = 1880000}}, award = {type = 0, id = 1403, count = 1, bind = 1}, }, --法痴护符Lv24
{needLevel = 78, needCircle = 0, shwoEffId =1429,consume = {{type = 46, id = 0, count = 1940000}}, award = {type = 0, id = 1404, count = 1, bind = 1}, }, --法痴护符Lv25
{needLevel = 80, needCircle = 0, shwoEffId =1431,consume = {{type = 46, id = 0, count = 2016000}}, award = {type = 0, id = 1405, count = 1, bind = 1}, }, --法痴护符Lv26
{needLevel = 82, needCircle = 0, shwoEffId =1433,consume = {{type = 46, id = 0, count = 2100000}}, award = {type = 0, id = 1406, count = 1, bind = 1}, }, --法痴护符Lv27
{needLevel = 84, needCircle = 0, shwoEffId =1435,consume = {{type = 46, id = 0, count = 2160000}}, award = {type = 0, id = 1407, count = 1, bind = 1}, }, --法痴护符Lv28
{needLevel = 86, needCircle = 0, shwoEffId =1437,consume = {{type = 46, id = 0, count = 2240000}}, award = {type = 0, id = 1408, count = 1, bind = 1}, }, --法痴护符Lv29
{needLevel = 88, needCircle = 0, shwoEffId =1439,consume = {{type = 46, id = 0, count = 2320000}}, award = {type = 0, id = 1409, count = 1, bind = 1}, }, --法痴护符Lv30
{needLevel = 90, needCircle = 0, shwoEffId =1441,consume = {{type = 46, id = 0, count = 2400000}}, award = {type = 0, id = 1410, count = 1, bind = 1}, }, --法痴护符Lv31
{needLevel = 92, needCircle = 0, shwoEffId =1443,consume = {{type = 46, id = 0, count = 2460000}}, award = {type = 0, id = 1411, count = 1, bind = 1}, }, --法痴护符Lv32
{needLevel = 94, needCircle = 0, shwoEffId =1445,consume = {{type = 46, id = 0, count = 2540000}}, award = {type = 0, id = 1412, count = 1, bind = 1}, }, --法痴护符Lv33
{needLevel = 96, needCircle = 0, shwoEffId =1447,consume = {{type = 46, id = 0, count = 2620000}}, award = {type = 0, id = 1413, count = 1, bind = 1}, }, --法痴护符Lv34
{needLevel = 98, needCircle = 0, shwoEffId =1449,consume = {{type = 46, id = 0, count = 2700000}}, award = {type = 0, id = 1414, count = 1, bind = 1}, }, --法痴护符Lv35
{needLevel = 100, needCircle = 0, shwoEffId =1451,consume = {{type = 46, id = 0, count = 2780000}}, award = {type = 0, id = 1415, count = 1, bind = 1}, }, --法痴护符Lv36
{needLevel = 102, needCircle = 0, shwoEffId =1453,consume = {{type = 46, id = 0, count = 2860000}}, award = {type = 0, id = 1416, count = 1, bind = 1}, }, --法痴护符Lv37
{needLevel = 104, needCircle = 0, shwoEffId =1455,consume = {{type = 46, id = 0, count = 2940000}}, award = {type = 0, id = 1417, count = 1, bind = 1}, }, --法痴护符Lv38
{needLevel = 106, needCircle = 0, shwoEffId =1457,consume = {{type = 46, id = 0, count = 3040000}}, award = {type = 0, id = 1418, count = 1, bind = 1}, }, --法痴护符Lv39
{needLevel = 108, needCircle = 0, shwoEffId =1459,consume = {{type = 46, id = 0, count = 3120000}}, award = {type = 0, id = 1419, count = 1, bind = 1}, }, --法痴护符Lv40
{needLevel = 110, needCircle = 0, shwoEffId =1461,consume = {{type = 46, id = 0, count = 3200000}}, award = {type = 0, id = 1420, count = 1, bind = 1}, }, --法痴护符Lv41
{needLevel = 112, needCircle = 0, shwoEffId =1463,consume = {{type = 46, id = 0, count = 3420000}}, award = {type = 0, id = 1421, count = 1, bind = 1}, }, --法痴护符Lv42
{needLevel = 114, needCircle = 0, shwoEffId =1465,consume = {{type = 46, id = 0, count = 3660000}}, award = {type = 0, id = 1422, count = 1, bind = 1}, }, --法痴护符Lv43
{needLevel = 116, needCircle = 0, shwoEffId =1467,consume = {{type = 46, id = 0, count = 3880000}}, award = {type = 0, id = 1423, count = 1, bind = 1}, }, --法痴护符Lv44
{needLevel = 118, needCircle = 0, shwoEffId =1469,consume = {{type = 46, id = 0, count = 4120000}}, award = {type = 0, id = 1424, count = 1, bind = 1}, }, --法痴护符Lv45
{needLevel = 120, needCircle = 0, shwoEffId =1471,consume = {{type = 46, id = 0, count = 4380000}}, award = {type = 0, id = 1425, count = 1, bind = 1}, }, --法痴护符Lv46
{needLevel = 122, needCircle = 0, shwoEffId =1473,consume = {{type = 46, id = 0, count = 4620000}}, award = {type = 0, id = 1426, count = 1, bind = 1}, }, --法痴护符Lv47
{needLevel = 124, needCircle = 0, shwoEffId =1475,consume = {{type = 46, id = 0, count = 4880000}}, award = {type = 0, id = 1427, count = 1, bind = 1}, }, --法痴护符Lv48
{needLevel = 126, needCircle = 0, shwoEffId =1477,consume = {{type = 46, id = 0, count = 7000000}}, award = {type = 0, id = 1428, count = 1, bind = 1}, }, --法痴护符Lv49
{needLevel = 128, needCircle = 0, shwoEffId =1479,consume = {{type = 46, id = 0, count = 10000000}}, award = {type = 0, id = 1429, count = 1, bind = 1}, }, --法痴护符Lv50
{needLevel=128,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=10240000}},award={type=0,id=1430,count=1,bind=1},},--法痴护符Lv51
{needLevel=128,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=10480000}},award={type=0,id=1431,count=1,bind=1},},--法痴护符Lv52
{needLevel=128,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=10720000}},award={type=0,id=1432,count=1,bind=1},},--法痴护符Lv53
{needLevel=128,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=10960000}},award={type=0,id=1433,count=1,bind=1},},--法痴护符Lv54
{needLevel=128,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=11200000}},award={type=0,id=1434,count=1,bind=1},},--法痴护符Lv55
{needLevel=129,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=11440000}},award={type=0,id=1435,count=1,bind=1},},--法痴护符Lv56
{needLevel=129,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=11680000}},award={type=0,id=1436,count=1,bind=1},},--法痴护符Lv57
{needLevel=129,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=11920000}},award={type=0,id=1437,count=1,bind=1},},--法痴护符Lv58
{needLevel=129,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=12160000}},award={type=0,id=1438,count=1,bind=1},},--法痴护符Lv59
{needLevel=129,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=12400000}},award={type=0,id=1439,count=1,bind=1},},--法痴护符Lv60
{needLevel=130,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=12680000}},award={type=0,id=1440,count=1,bind=1},},--法痴护符Lv61
{needLevel=130,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=12960000}},award={type=0,id=1441,count=1,bind=1},},--法痴护符Lv62
{needLevel=130,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=13240000}},award={type=0,id=1442,count=1,bind=1},},--法痴护符Lv63
{needLevel=130,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=13520000}},award={type=0,id=1443,count=1,bind=1},},--法痴护符Lv64
{needLevel=130,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=13800000}},award={type=0,id=1444,count=1,bind=1},},--法痴护符Lv65
{needLevel=131,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=14080000}},award={type=0,id=1445,count=1,bind=1},},--法痴护符Lv66
{needLevel=131,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=14360000}},award={type=0,id=1446,count=1,bind=1},},--法痴护符Lv67
{needLevel=131,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=14640000}},award={type=0,id=1447,count=1,bind=1},},--法痴护符Lv68
{needLevel=131,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=14920000}},award={type=0,id=1448,count=1,bind=1},},--法痴护符Lv69
{needLevel=131,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=15200000}},award={type=0,id=1449,count=1,bind=1},},--法痴护符Lv70
{needLevel=132,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=15520000}},award={type=0,id=1450,count=1,bind=1},},--法痴护符Lv71
{needLevel=132,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=15840000}},award={type=0,id=1451,count=1,bind=1},},--法痴护符Lv72
{needLevel=132,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=16160000}},award={type=0,id=1452,count=1,bind=1},},--法痴护符Lv73
{needLevel=132,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=16480000}},award={type=0,id=1453,count=1,bind=1},},--法痴护符Lv74
{needLevel=132,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=16800000}},award={type=0,id=1454,count=1,bind=1},},--法痴护符Lv75
{needLevel=133,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=17120000}},award={type=0,id=1455,count=1,bind=1},},--法痴护符Lv76
{needLevel=133,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=17440000}},award={type=0,id=1456,count=1,bind=1},},--法痴护符Lv77
{needLevel=133,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=17760000}},award={type=0,id=1457,count=1,bind=1},},--法痴护符Lv78
{needLevel=133,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=18080000}},award={type=0,id=1458,count=1,bind=1},},--法痴护符Lv79
{needLevel=133,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=18400000}},award={type=0,id=1459,count=1,bind=1},},--法痴护符Lv80
{needLevel=134,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=18760000}},award={type=0,id=1460,count=1,bind=1},},--法痴护符Lv81
{needLevel=134,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=19120000}},award={type=0,id=1461,count=1,bind=1},},--法痴护符Lv82
{needLevel=134,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=19480000}},award={type=0,id=1462,count=1,bind=1},},--法痴护符Lv83
{needLevel=134,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=19840000}},award={type=0,id=1463,count=1,bind=1},},--法痴护符Lv84
{needLevel=134,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=20200000}},award={type=0,id=1464,count=1,bind=1},},--法痴护符Lv85
{needLevel=135,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=20560000}},award={type=0,id=1465,count=1,bind=1},},--法痴护符Lv86
{needLevel=135,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=20920000}},award={type=0,id=1466,count=1,bind=1},},--法痴护符Lv87
{needLevel=135,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=21280000}},award={type=0,id=1467,count=1,bind=1},},--法痴护符Lv88
{needLevel=135,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=21640000}},award={type=0,id=1468,count=1,bind=1},},--法痴护符Lv89
{needLevel=135,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=22000000}},award={type=0,id=1469,count=1,bind=1},},--法痴护符Lv90
{needLevel=136,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=22400000}},award={type=0,id=1470,count=1,bind=1},},--法痴护符Lv91
{needLevel=136,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=22800000}},award={type=0,id=1471,count=1,bind=1},},--法痴护符Lv92
{needLevel=136,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=23200000}},award={type=0,id=1472,count=1,bind=1},},--法痴护符Lv93
{needLevel=136,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=23600000}},award={type=0,id=1473,count=1,bind=1},},--法痴护符Lv94
{needLevel=136,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=24000000}},award={type=0,id=1474,count=1,bind=1},},--法痴护符Lv95
{needLevel=137,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=24400000}},award={type=0,id=1475,count=1,bind=1},},--法痴护符Lv96
{needLevel=137,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=24800000}},award={type=0,id=1476,count=1,bind=1},},--法痴护符Lv97
{needLevel=137,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=25200000}},award={type=0,id=1477,count=1,bind=1},},--法痴护符Lv98
{needLevel=137,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=25600000}},award={type=0,id=1478,count=1,bind=1},},--法痴护符Lv99
{needLevel=137,needCircle=0,shwoEffId=1479,consume={{type=46,id=0,count=26000000}},award={type=0,id=1479,count=1,bind=1},},--法痴护符Lv100


            
            
            
            
            
            
            },
            --道士
            {
                
                {shwoEffId = 1634, award = {type = 0, id = 1634, count = 1, bind = 1}, }, --道颠护符Lv1
{needLevel = 32, needCircle = 0, shwoEffId =1636,consume = {{type = 46, id = 0, count = 10000}}, award = {type = 0, id = 1635, count = 1, bind = 1}, }, --道颠护符Lv2
{needLevel = 34, needCircle = 0, shwoEffId =1638,consume = {{type = 46, id = 0, count = 24000}}, award = {type = 0, id = 1636, count = 1, bind = 1}, }, --道颠护符Lv3
{needLevel = 36, needCircle = 0, shwoEffId =1640,consume = {{type = 46, id = 0, count = 52000}}, award = {type = 0, id = 1637, count = 1, bind = 1}, }, --道颠护符Lv4
{needLevel = 38, needCircle = 0, shwoEffId =1642,consume = {{type = 46, id = 0, count = 90000}}, award = {type = 0, id = 1638, count = 1, bind = 1}, }, --道颠护符Lv5
{needLevel = 40, needCircle = 0, shwoEffId =1644,consume = {{type = 46, id = 0, count = 136000}}, award = {type = 0, id = 1639, count = 1, bind = 1}, }, --道颠护符Lv6
{needLevel = 42, needCircle = 0, shwoEffId =1646,consume = {{type = 46, id = 0, count = 184000}}, award = {type = 0, id = 1640, count = 1, bind = 1}, }, --道颠护符Lv7
{needLevel = 44, needCircle = 0, shwoEffId =1648,consume = {{type = 46, id = 0, count = 260000}}, award = {type = 0, id = 1641, count = 1, bind = 1}, }, --道颠护符Lv8
{needLevel = 46, needCircle = 0, shwoEffId =1650,consume = {{type = 46, id = 0, count = 350000}}, award = {type = 0, id = 1642, count = 1, bind = 1}, }, --道颠护符Lv9
{needLevel = 48, needCircle = 0, shwoEffId =1652,consume = {{type = 46, id = 0, count = 450000}}, award = {type = 0, id = 1643, count = 1, bind = 1}, }, --道颠护符Lv10
{needLevel = 50, needCircle = 0, shwoEffId =1654,consume = {{type = 46, id = 0, count = 556000}}, award = {type = 0, id = 1644, count = 1, bind = 1}, }, --道颠护符Lv11
{needLevel = 52, needCircle = 0, shwoEffId =1656,consume = {{type = 46, id = 0, count = 696000}}, award = {type = 0, id = 1645, count = 1, bind = 1}, }, --道颠护符Lv12
{needLevel = 54, needCircle = 0, shwoEffId =1658,consume = {{type = 46, id = 0, count = 858000}}, award = {type = 0, id = 1646, count = 1, bind = 1}, }, --道颠护符Lv13
{needLevel = 56, needCircle = 0, shwoEffId =1660,consume = {{type = 46, id = 0, count = 996000}}, award = {type = 0, id = 1647, count = 1, bind = 1}, }, --道颠护符Lv14
{needLevel = 58, needCircle = 0, shwoEffId =1662,consume = {{type = 46, id = 0, count = 1088000}}, award = {type = 0, id = 1648, count = 1, bind = 1}, }, --道颠护符Lv15
{needLevel = 60, needCircle = 0, shwoEffId =1664,consume = {{type = 46, id = 0, count = 1176000}}, award = {type = 0, id = 1649, count = 1, bind = 1}, }, --道颠护符Lv16
{needLevel = 62, needCircle = 0, shwoEffId =1666,consume = {{type = 46, id = 0, count = 1266000}}, award = {type = 0, id = 1650, count = 1, bind = 1}, }, --道颠护符Lv17
{needLevel = 64, needCircle = 0, shwoEffId =1668,consume = {{type = 46, id = 0, count = 1370000}}, award = {type = 0, id = 1651, count = 1, bind = 1}, }, --道颠护符Lv18
{needLevel = 66, needCircle = 0, shwoEffId =1670,consume = {{type = 46, id = 0, count = 1466000}}, award = {type = 0, id = 1652, count = 1, bind = 1}, }, --道颠护符Lv19
{needLevel = 68, needCircle = 0, shwoEffId =1672,consume = {{type = 46, id = 0, count = 1576000}}, award = {type = 0, id = 1653, count = 1, bind = 1}, }, --道颠护符Lv20
{needLevel = 70, needCircle = 0, shwoEffId =1674,consume = {{type = 46, id = 0, count = 1680000}}, award = {type = 0, id = 1654, count = 1, bind = 1}, }, --道颠护符Lv21
{needLevel = 72, needCircle = 0, shwoEffId =1676,consume = {{type = 46, id = 0, count = 1746000}}, award = {type = 0, id = 1655, count = 1, bind = 1}, }, --道颠护符Lv22
{needLevel = 74, needCircle = 0, shwoEffId =1678,consume = {{type = 46, id = 0, count = 1806000}}, award = {type = 0, id = 1656, count = 1, bind = 1}, }, --道颠护符Lv23
{needLevel = 76, needCircle = 0, shwoEffId =1680,consume = {{type = 46, id = 0, count = 1880000}}, award = {type = 0, id = 1657, count = 1, bind = 1}, }, --道颠护符Lv24
{needLevel = 78, needCircle = 0, shwoEffId =1682,consume = {{type = 46, id = 0, count = 1940000}}, award = {type = 0, id = 1658, count = 1, bind = 1}, }, --道颠护符Lv25
{needLevel = 80, needCircle = 0, shwoEffId =1684,consume = {{type = 46, id = 0, count = 2016000}}, award = {type = 0, id = 1659, count = 1, bind = 1}, }, --道颠护符Lv26
{needLevel = 82, needCircle = 0, shwoEffId =1686,consume = {{type = 46, id = 0, count = 2100000}}, award = {type = 0, id = 1660, count = 1, bind = 1}, }, --道颠护符Lv27
{needLevel = 84, needCircle = 0, shwoEffId =1688,consume = {{type = 46, id = 0, count = 2160000}}, award = {type = 0, id = 1661, count = 1, bind = 1}, }, --道颠护符Lv28
{needLevel = 86, needCircle = 0, shwoEffId =1690,consume = {{type = 46, id = 0, count = 2240000}}, award = {type = 0, id = 1662, count = 1, bind = 1}, }, --道颠护符Lv29
{needLevel = 88, needCircle = 0, shwoEffId =1692,consume = {{type = 46, id = 0, count = 2320000}}, award = {type = 0, id = 1663, count = 1, bind = 1}, }, --道颠护符Lv30
{needLevel = 90, needCircle = 0, shwoEffId =1694,consume = {{type = 46, id = 0, count = 2400000}}, award = {type = 0, id = 1664, count = 1, bind = 1}, }, --道颠护符Lv31
{needLevel = 92, needCircle = 0, shwoEffId =1696,consume = {{type = 46, id = 0, count = 2460000}}, award = {type = 0, id = 1665, count = 1, bind = 1}, }, --道颠护符Lv32
{needLevel = 94, needCircle = 0, shwoEffId =1698,consume = {{type = 46, id = 0, count = 2540000}}, award = {type = 0, id = 1666, count = 1, bind = 1}, }, --道颠护符Lv33
{needLevel = 96, needCircle = 0, shwoEffId =1700,consume = {{type = 46, id = 0, count = 2620000}}, award = {type = 0, id = 1667, count = 1, bind = 1}, }, --道颠护符Lv34
{needLevel = 98, needCircle = 0, shwoEffId =1702,consume = {{type = 46, id = 0, count = 2700000}}, award = {type = 0, id = 1668, count = 1, bind = 1}, }, --道颠护符Lv35
{needLevel = 100, needCircle = 0, shwoEffId =1704,consume = {{type = 46, id = 0, count = 2780000}}, award = {type = 0, id = 1669, count = 1, bind = 1}, }, --道颠护符Lv36
{needLevel = 102, needCircle = 0, shwoEffId =1706,consume = {{type = 46, id = 0, count = 2860000}}, award = {type = 0, id = 1670, count = 1, bind = 1}, }, --道颠护符Lv37
{needLevel = 104, needCircle = 0, shwoEffId =1708,consume = {{type = 46, id = 0, count = 2940000}}, award = {type = 0, id = 1671, count = 1, bind = 1}, }, --道颠护符Lv38
{needLevel = 106, needCircle = 0, shwoEffId =1710,consume = {{type = 46, id = 0, count = 3040000}}, award = {type = 0, id = 1672, count = 1, bind = 1}, }, --道颠护符Lv39
{needLevel = 108, needCircle = 0, shwoEffId =1712,consume = {{type = 46, id = 0, count = 3120000}}, award = {type = 0, id = 1673, count = 1, bind = 1}, }, --道颠护符Lv40
{needLevel = 110, needCircle = 0, shwoEffId =1714,consume = {{type = 46, id = 0, count = 3200000}}, award = {type = 0, id = 1674, count = 1, bind = 1}, }, --道颠护符Lv41
{needLevel = 112, needCircle = 0, shwoEffId =1716,consume = {{type = 46, id = 0, count = 3420000}}, award = {type = 0, id = 1675, count = 1, bind = 1}, }, --道颠护符Lv42
{needLevel = 114, needCircle = 0, shwoEffId =1718,consume = {{type = 46, id = 0, count = 3660000}}, award = {type = 0, id = 1676, count = 1, bind = 1}, }, --道颠护符Lv43
{needLevel = 116, needCircle = 0, shwoEffId =1720,consume = {{type = 46, id = 0, count = 3880000}}, award = {type = 0, id = 1677, count = 1, bind = 1}, }, --道颠护符Lv44
{needLevel = 118, needCircle = 0, shwoEffId =1722,consume = {{type = 46, id = 0, count = 4120000}}, award = {type = 0, id = 1678, count = 1, bind = 1}, }, --道颠护符Lv45
{needLevel = 120, needCircle = 0, shwoEffId =1724,consume = {{type = 46, id = 0, count = 4380000}}, award = {type = 0, id = 1679, count = 1, bind = 1}, }, --道颠护符Lv46
{needLevel = 122, needCircle = 0, shwoEffId =1726,consume = {{type = 46, id = 0, count = 4620000}}, award = {type = 0, id = 1680, count = 1, bind = 1}, }, --道颠护符Lv47
{needLevel = 124, needCircle = 0, shwoEffId =1728,consume = {{type = 46, id = 0, count = 4880000}}, award = {type = 0, id = 1681, count = 1, bind = 1}, }, --道颠护符Lv48
{needLevel = 126, needCircle = 0, shwoEffId =1730,consume = {{type = 46, id = 0, count = 7000000}}, award = {type = 0, id = 1682, count = 1, bind = 1}, }, --道颠护符Lv49
{needLevel = 128, needCircle = 0, shwoEffId =1732,consume = {{type = 46, id = 0, count = 10000000}}, award = {type = 0, id = 1683, count = 1, bind = 1}, }, --道颠护符Lv50

{needLevel=128,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=10240000}},award={type=0,id=1684,count=1,bind=1},},--道颠护符Lv51
{needLevel=128,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=10480000}},award={type=0,id=1685,count=1,bind=1},},--道颠护符Lv52
{needLevel=128,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=10720000}},award={type=0,id=1686,count=1,bind=1},},--道颠护符Lv53
{needLevel=128,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=10960000}},award={type=0,id=1687,count=1,bind=1},},--道颠护符Lv54
{needLevel=128,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=11200000}},award={type=0,id=1688,count=1,bind=1},},--道颠护符Lv55
{needLevel=129,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=11440000}},award={type=0,id=1689,count=1,bind=1},},--道颠护符Lv56
{needLevel=129,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=11680000}},award={type=0,id=1690,count=1,bind=1},},--道颠护符Lv57
{needLevel=129,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=11920000}},award={type=0,id=1691,count=1,bind=1},},--道颠护符Lv58
{needLevel=129,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=12160000}},award={type=0,id=1692,count=1,bind=1},},--道颠护符Lv59
{needLevel=129,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=12400000}},award={type=0,id=1693,count=1,bind=1},},--道颠护符Lv60
{needLevel=130,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=12680000}},award={type=0,id=1694,count=1,bind=1},},--道颠护符Lv61
{needLevel=130,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=12960000}},award={type=0,id=1695,count=1,bind=1},},--道颠护符Lv62
{needLevel=130,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=13240000}},award={type=0,id=1696,count=1,bind=1},},--道颠护符Lv63
{needLevel=130,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=13520000}},award={type=0,id=1697,count=1,bind=1},},--道颠护符Lv64
{needLevel=130,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=13800000}},award={type=0,id=1698,count=1,bind=1},},--道颠护符Lv65
{needLevel=131,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=14080000}},award={type=0,id=1699,count=1,bind=1},},--道颠护符Lv66
{needLevel=131,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=14360000}},award={type=0,id=1700,count=1,bind=1},},--道颠护符Lv67
{needLevel=131,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=14640000}},award={type=0,id=1701,count=1,bind=1},},--道颠护符Lv68
{needLevel=131,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=14920000}},award={type=0,id=1702,count=1,bind=1},},--道颠护符Lv69
{needLevel=131,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=15200000}},award={type=0,id=1703,count=1,bind=1},},--道颠护符Lv70
{needLevel=132,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=15520000}},award={type=0,id=1704,count=1,bind=1},},--道颠护符Lv71
{needLevel=132,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=15840000}},award={type=0,id=1705,count=1,bind=1},},--道颠护符Lv72
{needLevel=132,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=16160000}},award={type=0,id=1706,count=1,bind=1},},--道颠护符Lv73
{needLevel=132,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=16480000}},award={type=0,id=1707,count=1,bind=1},},--道颠护符Lv74
{needLevel=132,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=16800000}},award={type=0,id=1708,count=1,bind=1},},--道颠护符Lv75
{needLevel=133,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=17120000}},award={type=0,id=1709,count=1,bind=1},},--道颠护符Lv76
{needLevel=133,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=17440000}},award={type=0,id=1710,count=1,bind=1},},--道颠护符Lv77
{needLevel=133,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=17760000}},award={type=0,id=1711,count=1,bind=1},},--道颠护符Lv78
{needLevel=133,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=18080000}},award={type=0,id=1712,count=1,bind=1},},--道颠护符Lv79
{needLevel=133,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=18400000}},award={type=0,id=1713,count=1,bind=1},},--道颠护符Lv80
{needLevel=134,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=18760000}},award={type=0,id=1714,count=1,bind=1},},--道颠护符Lv81
{needLevel=134,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=19120000}},award={type=0,id=1715,count=1,bind=1},},--道颠护符Lv82
{needLevel=134,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=19480000}},award={type=0,id=1716,count=1,bind=1},},--道颠护符Lv83
{needLevel=134,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=19840000}},award={type=0,id=1717,count=1,bind=1},},--道颠护符Lv84
{needLevel=134,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=20200000}},award={type=0,id=1718,count=1,bind=1},},--道颠护符Lv85
{needLevel=135,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=20560000}},award={type=0,id=1719,count=1,bind=1},},--道颠护符Lv86
{needLevel=135,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=20920000}},award={type=0,id=1720,count=1,bind=1},},--道颠护符Lv87
{needLevel=135,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=21280000}},award={type=0,id=1721,count=1,bind=1},},--道颠护符Lv88
{needLevel=135,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=21640000}},award={type=0,id=1722,count=1,bind=1},},--道颠护符Lv89
{needLevel=135,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=22000000}},award={type=0,id=1723,count=1,bind=1},},--道颠护符Lv90
{needLevel=136,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=22400000}},award={type=0,id=1724,count=1,bind=1},},--道颠护符Lv91
{needLevel=136,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=22800000}},award={type=0,id=1725,count=1,bind=1},},--道颠护符Lv92
{needLevel=136,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=23200000}},award={type=0,id=1726,count=1,bind=1},},--道颠护符Lv93
{needLevel=136,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=23600000}},award={type=0,id=1727,count=1,bind=1},},--道颠护符Lv94
{needLevel=136,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=24000000}},award={type=0,id=1728,count=1,bind=1},},--道颠护符Lv95
{needLevel=137,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=24400000}},award={type=0,id=1729,count=1,bind=1},},--道颠护符Lv96
{needLevel=137,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=24800000}},award={type=0,id=1730,count=1,bind=1},},--道颠护符Lv97
{needLevel=137,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=25200000}},award={type=0,id=1731,count=1,bind=1},},--道颠护符Lv98
{needLevel=137,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=25600000}},award={type=0,id=1732,count=1,bind=1},},--道颠护符Lv99
{needLevel=137,needCircle=0,shwoEffId=1732,consume={{type=46,id=0,count=26000000}},award={type=0,id=1733,count=1,bind=1},},--道颠护符Lv100

         
            
            
            
            
            
            },
        },
		
		
        --特戒
        SpecialRing =
        {
            
            --麻痹戒指
            {
                
                {consume = {{type = 48, id = 0, count = 1}}, award = {type = 0, id = 715, count = 1, bind = 1}, }, --1阶
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 6}}, award = {type = 0, id = 716, count = 1, bind = 1}, }, --红云麻痹戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 11}}, award = {type = 0, id = 717, count = 1, bind = 1}, }, --枫叶麻痹戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 16}}, award = {type = 0, id = 718, count = 1, bind = 1}, }, --破甲麻痹戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 21}}, award = {type = 0, id = 719, count = 1, bind = 1}, }, --春秋麻痹戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 26}}, award = {type = 0, id = 720, count = 1, bind = 1}, }, --冷月麻痹戒
                {needLevel = 62, needCircle = 0, consume = {{type = 48, id = 0, count = 36}}, award = {type = 0, id = 721, count = 1, bind = 1}, }, --雄霸麻痹战戒
                {needLevel = 64, needCircle = 0, consume = {{type = 48, id = 0, count = 46}}, award = {type = 0, id = 722, count = 1, bind = 1}, }, --天羽麻痹战戒
                {needLevel = 66, needCircle = 0, consume = {{type = 48, id = 0, count = 56}}, award = {type = 0, id = 723, count = 1, bind = 1}, }, --日月麻痹战戒
                {needLevel = 68, needCircle = 0, consume = {{type = 48, id = 0, count = 66}}, award = {type = 0, id = 724, count = 1, bind = 1}, }, --征服麻痹战戒
                {needLevel = 70, needCircle = 0, consume = {{type = 48, id = 0, count = 76}}, award = {type = 0, id = 725, count = 1, bind = 1}, }, --天下麻痹战戒
                {needLevel = 80, needCircle = 0, consume = {{type = 48, id = 0, count = 86}}, award = {type = 0, id = 726, count = 1, bind = 1}, }, --圣皇麻痹战戒
                {needLevel = 82, needCircle = 0, consume = {{type = 48, id = 0, count = 116}}, award = {type = 0, id = 727, count = 1, bind = 1}, }, --冲天麻痹仙戒
                {needLevel = 84, needCircle = 0, consume = {{type = 48, id = 0, count = 146}}, award = {type = 0, id = 728, count = 1, bind = 1}, }, --菩提麻痹仙戒
                {needLevel = 86, needCircle = 0, consume = {{type = 48, id = 0, count = 176}}, award = {type = 0, id = 729, count = 1, bind = 1}, }, --无尘麻痹仙戒
                {needLevel = 88, needCircle = 0, consume = {{type = 48, id = 0, count = 206}}, award = {type = 0, id = 730, count = 1, bind = 1}, }, --芙蓉麻痹仙戒
                {needLevel = 90, needCircle = 0, consume = {{type = 48, id = 0, count = 236}}, award = {type = 0, id = 731, count = 1, bind = 1}, }, --玄冥麻痹仙戒
                {needLevel = 94, needCircle = 0, consume = {{type = 48, id = 0, count = 266}}, award = {type = 0, id = 732, count = 1, bind = 1}, }, --巫月麻痹仙戒
                {needLevel = 98, needCircle = 0, consume = {{type = 48, id = 0, count = 296}}, award = {type = 0, id = 733, count = 1, bind = 1}, }, --圣灵麻痹仙戒
                {needLevel = 100, needCircle = 0, consume = {{type = 48, id = 0, count = 326}}, award = {type = 0, id = 734, count = 1, bind = 1}, }, --圣龙麻痹仙戒
                {needLevel = 106, needCircle = 0, consume = {{type = 48, id = 0, count = 356}}, award = {type = 0, id = 735, count = 1, bind = 1}, }, --碧雪麻痹神戒
                {needLevel = 112, needCircle = 0, consume = {{type = 48, id = 0, count = 386}}, award = {type = 0, id = 736, count = 1, bind = 1}, }, --遗忘麻痹神戒
                {needLevel = 118, needCircle = 0, consume = {{type = 48, id = 0, count = 416}}, award = {type = 0, id = 737, count = 1, bind = 1}, }, --迷失麻痹神戒
                {needLevel = 120, needCircle = 0, consume = {{type = 48, id = 0, count = 446}}, award = {type = 0, id = 738, count = 1, bind = 1}, }, --魅影麻痹神戒
                {needLevel = 122, needCircle = 0, consume = {{type = 48, id = 0, count = 476}}, award = {type = 0, id = 739, count = 1, bind = 1}, }, --血罗麻痹圣戒
                {needLevel = 124, needCircle = 0, consume = {{type = 48, id = 0, count = 506}}, award = {type = 0, id = 740, count = 1, bind = 1}, }, --金罗麻痹圣戒
                {needLevel = 126, needCircle = 0, consume = {{type = 48, id = 0, count = 536}}, award = {type = 0, id = 741, count = 1, bind = 1}, }, --苦罗麻痹圣戒
                {needLevel = 128, needCircle = 0, consume = {{type = 48, id = 0, count = 566}}, award = {type = 0, id = 742, count = 1, bind = 1}, }, --修罗麻痹圣戒
                {needLevel = 130, needCircle = 0, consume = {{type = 48, id = 0, count = 596}}, award = {type = 0, id = 743, count = 1, bind = 1}, }, --摩罗麻痹圣戒
                {needLevel = 140, needCircle = 0, consume = {{type = 48, id = 0, count = 626}}, award = {type = 0, id = 744, count = 1, bind = 1}, }, --圣罗麻痹圣戒
            
            
            
            
            
            },
            
            --重生戒指
            {
                
                {consume = {{type = 48, id = 0, count = 1}}, award = {type = 0, id = 746, count = 1, bind = 1}, }, --1阶
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 6}}, award = {type = 0, id = 747, count = 1, bind = 1}, }, --红云重生戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 11}}, award = {type = 0, id = 748, count = 1, bind = 1}, }, --枫叶重生戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 16}}, award = {type = 0, id = 749, count = 1, bind = 1}, }, --破甲重生戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 21}}, award = {type = 0, id = 750, count = 1, bind = 1}, }, --春秋重生戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 26}}, award = {type = 0, id = 751, count = 1, bind = 1}, }, --冷月重生戒
                {needLevel = 62, needCircle = 0, consume = {{type = 48, id = 0, count = 36}}, award = {type = 0, id = 752, count = 1, bind = 1}, }, --雄霸重生王戒
                {needLevel = 64, needCircle = 0, consume = {{type = 48, id = 0, count = 46}}, award = {type = 0, id = 753, count = 1, bind = 1}, }, --天羽重生王戒
                {needLevel = 66, needCircle = 0, consume = {{type = 48, id = 0, count = 56}}, award = {type = 0, id = 754, count = 1, bind = 1}, }, --日月重生王戒
                {needLevel = 68, needCircle = 0, consume = {{type = 48, id = 0, count = 66}}, award = {type = 0, id = 755, count = 1, bind = 1}, }, --征服重生王戒
                {needLevel = 70, needCircle = 0, consume = {{type = 48, id = 0, count = 76}}, award = {type = 0, id = 756, count = 1, bind = 1}, }, --天下重生王戒
                {needLevel = 80, needCircle = 0, consume = {{type = 48, id = 0, count = 86}}, award = {type = 0, id = 757, count = 1, bind = 1}, }, --圣皇重生王戒
                {needLevel = 82, needCircle = 0, consume = {{type = 48, id = 0, count = 116}}, award = {type = 0, id = 758, count = 1, bind = 1}, }, --冲天重生仙戒
                {needLevel = 84, needCircle = 0, consume = {{type = 48, id = 0, count = 146}}, award = {type = 0, id = 759, count = 1, bind = 1}, }, --菩提重生仙戒
                {needLevel = 86, needCircle = 0, consume = {{type = 48, id = 0, count = 176}}, award = {type = 0, id = 760, count = 1, bind = 1}, }, --无尘重生仙戒
                {needLevel = 88, needCircle = 0, consume = {{type = 48, id = 0, count = 206}}, award = {type = 0, id = 761, count = 1, bind = 1}, }, --芙蓉重生仙戒
                {needLevel = 90, needCircle = 0, consume = {{type = 48, id = 0, count = 236}}, award = {type = 0, id = 762, count = 1, bind = 1}, }, --玄冥重生仙戒
                {needLevel = 94, needCircle = 0, consume = {{type = 48, id = 0, count = 266}}, award = {type = 0, id = 763, count = 1, bind = 1}, }, --巫月重生仙戒
                {needLevel = 98, needCircle = 0, consume = {{type = 48, id = 0, count = 296}}, award = {type = 0, id = 764, count = 1, bind = 1}, }, --圣灵重生仙戒
                {needLevel = 100, needCircle = 0, consume = {{type = 48, id = 0, count = 326}}, award = {type = 0, id = 765, count = 1, bind = 1}, }, --圣龙重生仙戒
                {needLevel = 106, needCircle = 0, consume = {{type = 48, id = 0, count = 356}}, award = {type = 0, id = 766, count = 1, bind = 1}, }, --碧雪重生神戒
                {needLevel = 112, needCircle = 0, consume = {{type = 48, id = 0, count = 386}}, award = {type = 0, id = 767, count = 1, bind = 1}, }, --遗忘重生神戒
                {needLevel = 118, needCircle = 0, consume = {{type = 48, id = 0, count = 416}}, award = {type = 0, id = 768, count = 1, bind = 1}, }, --迷失重生神戒
                {needLevel = 120, needCircle = 0, consume = {{type = 48, id = 0, count = 446}}, award = {type = 0, id = 769, count = 1, bind = 1}, }, --魅影重生神戒
                {needLevel = 122, needCircle = 0, consume = {{type = 48, id = 0, count = 476}}, award = {type = 0, id = 770, count = 1, bind = 1}, }, --血罗重生圣戒
                {needLevel = 124, needCircle = 0, consume = {{type = 48, id = 0, count = 506}}, award = {type = 0, id = 771, count = 1, bind = 1}, }, --金罗重生圣戒
                {needLevel = 126, needCircle = 0, consume = {{type = 48, id = 0, count = 536}}, award = {type = 0, id = 772, count = 1, bind = 1}, }, --苦罗重生圣戒
                {needLevel = 128, needCircle = 0, consume = {{type = 48, id = 0, count = 566}}, award = {type = 0, id = 773, count = 1, bind = 1}, }, --修罗重生圣戒
                {needLevel = 130, needCircle = 0, consume = {{type = 48, id = 0, count = 596}}, award = {type = 0, id = 774, count = 1, bind = 1}, }, --摩罗重生圣戒
                {needLevel = 140, needCircle = 0, consume = {{type = 48, id = 0, count = 626}}, award = {type = 0, id = 775, count = 1, bind = 1}, }, --圣罗重生圣戒
            
            
            
            
            },
            
            --护体戒指
            {
                
                {consume = {{type = 48, id = 0, count = 1}}, award = {type = 0, id = 777, count = 1, bind = 1}, }, --1阶
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 6}}, award = {type = 0, id = 778, count = 1, bind = 1}, }, --红云护体戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 11}}, award = {type = 0, id = 779, count = 1, bind = 1}, }, --枫叶护体戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 16}}, award = {type = 0, id = 780, count = 1, bind = 1}, }, --破甲护体戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 21}}, award = {type = 0, id = 781, count = 1, bind = 1}, }, --春秋护体戒
                {needLevel = 60, needCircle = 0, consume = {{type = 48, id = 0, count = 26}}, award = {type = 0, id = 782, count = 1, bind = 1}, }, --冷月护体戒
                {needLevel = 62, needCircle = 0, consume = {{type = 48, id = 0, count = 36}}, award = {type = 0, id = 783, count = 1, bind = 1}, }, --雄霸护体魔戒
                {needLevel = 64, needCircle = 0, consume = {{type = 48, id = 0, count = 46}}, award = {type = 0, id = 784, count = 1, bind = 1}, }, --天羽护体魔戒
                {needLevel = 66, needCircle = 0, consume = {{type = 48, id = 0, count = 56}}, award = {type = 0, id = 785, count = 1, bind = 1}, }, --日月护体魔戒
                {needLevel = 68, needCircle = 0, consume = {{type = 48, id = 0, count = 66}}, award = {type = 0, id = 786, count = 1, bind = 1}, }, --征服护体魔戒
                {needLevel = 70, needCircle = 0, consume = {{type = 48, id = 0, count = 76}}, award = {type = 0, id = 787, count = 1, bind = 1}, }, --天下护体魔戒
                {needLevel = 80, needCircle = 0, consume = {{type = 48, id = 0, count = 86}}, award = {type = 0, id = 788, count = 1, bind = 1}, }, --圣皇护体魔戒
                {needLevel = 82, needCircle = 0, consume = {{type = 48, id = 0, count = 116}}, award = {type = 0, id = 789, count = 1, bind = 1}, }, --冲天护体仙戒
                {needLevel = 84, needCircle = 0, consume = {{type = 48, id = 0, count = 146}}, award = {type = 0, id = 790, count = 1, bind = 1}, }, --菩提护体仙戒
                {needLevel = 86, needCircle = 0, consume = {{type = 48, id = 0, count = 176}}, award = {type = 0, id = 791, count = 1, bind = 1}, }, --无尘护体仙戒
                {needLevel = 88, needCircle = 0, consume = {{type = 48, id = 0, count = 206}}, award = {type = 0, id = 792, count = 1, bind = 1}, }, --芙蓉护体仙戒
                {needLevel = 90, needCircle = 0, consume = {{type = 48, id = 0, count = 236}}, award = {type = 0, id = 793, count = 1, bind = 1}, }, --玄冥护体仙戒
                {needLevel = 94, needCircle = 0, consume = {{type = 48, id = 0, count = 266}}, award = {type = 0, id = 794, count = 1, bind = 1}, }, --巫月护体仙戒
                {needLevel = 98, needCircle = 0, consume = {{type = 48, id = 0, count = 296}}, award = {type = 0, id = 795, count = 1, bind = 1}, }, --圣灵护体仙戒
                {needLevel = 100, needCircle = 0, consume = {{type = 48, id = 0, count = 326}}, award = {type = 0, id = 796, count = 1, bind = 1}, }, --圣龙护体仙戒
                {needLevel = 106, needCircle = 0, consume = {{type = 48, id = 0, count = 356}}, award = {type = 0, id = 797, count = 1, bind = 1}, }, --碧雪护体神戒
                {needLevel = 112, needCircle = 0, consume = {{type = 48, id = 0, count = 386}}, award = {type = 0, id = 798, count = 1, bind = 1}, }, --遗忘护体神戒
                {needLevel = 118, needCircle = 0, consume = {{type = 48, id = 0, count = 416}}, award = {type = 0, id = 799, count = 1, bind = 1}, }, --迷失护体神戒
                {needLevel = 120, needCircle = 0, consume = {{type = 48, id = 0, count = 446}}, award = {type = 0, id = 800, count = 1, bind = 1}, }, --魅影护体神戒
                {needLevel = 122, needCircle = 0, consume = {{type = 48, id = 0, count = 476}}, award = {type = 0, id = 801, count = 1, bind = 1}, }, --血罗护体圣戒
                {needLevel = 124, needCircle = 0, consume = {{type = 48, id = 0, count = 506}}, award = {type = 0, id = 802, count = 1, bind = 1}, }, --金罗护体圣戒
                {needLevel = 126, needCircle = 0, consume = {{type = 48, id = 0, count = 536}}, award = {type = 0, id = 803, count = 1, bind = 1}, }, --苦罗护体圣戒
                {needLevel = 128, needCircle = 0, consume = {{type = 48, id = 0, count = 566}}, award = {type = 0, id = 804, count = 1, bind = 1}, }, --修罗护体圣戒
                {needLevel = 130, needCircle = 0, consume = {{type = 48, id = 0, count = 596}}, award = {type = 0, id = 805, count = 1, bind = 1}, }, --摩罗护体圣戒
                {needLevel = 140, needCircle = 0, consume = {{type = 48, id = 0, count = 626}}, award = {type = 0, id = 806, count = 1, bind = 1}, }, --圣罗护体圣戒
            
            
            },
        
        },
        
        --宝石
        GemUpgrade =
        {
            ---------
            {shwoEffId = 967, award = {type = 0, id = 967, count = 1, bind = 1}, }, --1阶
            {needLevel = 57, needCircle = 0, shwoEffId = 968, consume = {{type = 47, id = 0, count = 500}}, award = {type = 0, id = 968, count = 1, bind = 1}, }, --散人宝石Lv2
            {needLevel = 59, needCircle = 0, shwoEffId = 969, consume = {{type = 47, id = 0, count = 1200}}, award = {type = 0, id = 969, count = 1, bind = 1}, }, --散人宝石Lv3
            {needLevel = 61, needCircle = 0, shwoEffId = 970, consume = {{type = 47, id = 0, count = 2600}}, award = {type = 0, id = 970, count = 1, bind = 1}, }, --散人宝石Lv4
            {needLevel = 63, needCircle = 0, shwoEffId = 971, consume = {{type = 47, id = 0, count = 4500}}, award = {type = 0, id = 971, count = 1, bind = 1}, }, --散人宝石Lv5
            {needLevel = 65, needCircle = 0, shwoEffId = 972, consume = {{type = 47, id = 0, count = 6800}}, award = {type = 0, id = 972, count = 1, bind = 1}, }, --散人宝石Lv6
            {needLevel = 67, needCircle = 0, shwoEffId = 973, consume = {{type = 47, id = 0, count = 9200}}, award = {type = 0, id = 973, count = 1, bind = 1}, }, --散人宝石Lv7
            {needLevel = 69, needCircle = 0, shwoEffId = 974, consume = {{type = 47, id = 0, count = 13000}}, award = {type = 0, id = 974, count = 1, bind = 1}, }, --散人宝石Lv8
            {needLevel = 71, needCircle = 0, shwoEffId = 975, consume = {{type = 47, id = 0, count = 17500}}, award = {type = 0, id = 975, count = 1, bind = 1}, }, --散人宝石Lv9
            {needLevel = 73, needCircle = 0, shwoEffId = 976, consume = {{type = 47, id = 0, count = 22500}}, award = {type = 0, id = 976, count = 1, bind = 1}, }, --散人宝石Lv10
            {needLevel = 75, needCircle = 0, shwoEffId = 977, consume = {{type = 47, id = 0, count = 27800}}, award = {type = 0, id = 977, count = 1, bind = 1}, }, --散人宝石Lv11
            {needLevel = 77, needCircle = 0, shwoEffId = 978, consume = {{type = 47, id = 0, count = 34800}}, award = {type = 0, id = 978, count = 1, bind = 1}, }, --散人宝石Lv12
            {needLevel = 79, needCircle = 0, shwoEffId = 979, consume = {{type = 47, id = 0, count = 42900}}, award = {type = 0, id = 979, count = 1, bind = 1}, }, --散人宝石Lv13
            {needLevel = 81, needCircle = 0, shwoEffId = 980, consume = {{type = 47, id = 0, count = 49800}}, award = {type = 0, id = 980, count = 1, bind = 1}, }, --散人宝石Lv14
            {needLevel = 83, needCircle = 0, shwoEffId = 981, consume = {{type = 47, id = 0, count = 54400}}, award = {type = 0, id = 981, count = 1, bind = 1}, }, --散人宝石Lv15
            {needLevel = 85, needCircle = 0, shwoEffId = 982, consume = {{type = 47, id = 0, count = 58800}}, award = {type = 0, id = 982, count = 1, bind = 1}, }, --散人宝石Lv16
            {needLevel = 87, needCircle = 0, shwoEffId = 983, consume = {{type = 47, id = 0, count = 63300}}, award = {type = 0, id = 983, count = 1, bind = 1}, }, --散人宝石Lv17
            {needLevel = 89, needCircle = 0, shwoEffId = 984, consume = {{type = 47, id = 0, count = 68500}}, award = {type = 0, id = 984, count = 1, bind = 1}, }, --散人宝石Lv18
            {needLevel = 91, needCircle = 0, shwoEffId = 985, consume = {{type = 47, id = 0, count = 73300}}, award = {type = 0, id = 985, count = 1, bind = 1}, }, --散人宝石Lv19
            {needLevel = 93, needCircle = 0, shwoEffId = 986, consume = {{type = 47, id = 0, count = 78800}}, award = {type = 0, id = 986, count = 1, bind = 1}, }, --散人宝石Lv20
            {needLevel = 95, needCircle = 0, shwoEffId = 987, consume = {{type = 47, id = 0, count = 84000}}, award = {type = 0, id = 987, count = 1, bind = 1}, }, --散人宝石Lv21
            {needLevel = 97, needCircle = 0, shwoEffId = 988, consume = {{type = 47, id = 0, count = 87300}}, award = {type = 0, id = 988, count = 1, bind = 1}, }, --散人宝石Lv22
            {needLevel = 99, needCircle = 0, shwoEffId = 989, consume = {{type = 47, id = 0, count = 90300}}, award = {type = 0, id = 989, count = 1, bind = 1}, }, --散人宝石Lv23
            {needLevel = 101, needCircle = 0, shwoEffId = 990, consume = {{type = 47, id = 0, count = 94000}}, award = {type = 0, id = 990, count = 1, bind = 1}, }, --散人宝石Lv24
            {needLevel = 103, needCircle = 0, shwoEffId = 991, consume = {{type = 47, id = 0, count = 97000}}, award = {type = 0, id = 991, count = 1, bind = 1}, }, --散人宝石Lv25
            {needLevel = 104, needCircle = 0, shwoEffId = 992, consume = {{type = 47, id = 0, count = 100800}}, award = {type = 0, id = 992, count = 1, bind = 1}, }, --散人宝石Lv26
            {needLevel = 105, needCircle = 0, shwoEffId = 993, consume = {{type = 47, id = 0, count = 105000}}, award = {type = 0, id = 993, count = 1, bind = 1}, }, --散人宝石Lv27
            {needLevel = 106, needCircle = 0, shwoEffId = 994, consume = {{type = 47, id = 0, count = 108000}}, award = {type = 0, id = 994, count = 1, bind = 1}, }, --散人宝石Lv28
            {needLevel = 107, needCircle = 0, shwoEffId = 995, consume = {{type = 47, id = 0, count = 112000}}, award = {type = 0, id = 995, count = 1, bind = 1}, }, --散人宝石Lv29
            {needLevel = 108, needCircle = 0, shwoEffId = 996, consume = {{type = 47, id = 0, count = 116000}}, award = {type = 0, id = 996, count = 1, bind = 1}, }, --散人宝石Lv30
            {needLevel = 109, needCircle = 0, shwoEffId = 997, consume = {{type = 47, id = 0, count = 120000}}, award = {type = 0, id = 997, count = 1, bind = 1}, }, --散人宝石Lv31
            {needLevel = 110, needCircle = 0, shwoEffId = 998, consume = {{type = 47, id = 0, count = 123000}}, award = {type = 0, id = 998, count = 1, bind = 1}, }, --散人宝石Lv32
            {needLevel = 111, needCircle = 0, shwoEffId = 999, consume = {{type = 47, id = 0, count = 127000}}, award = {type = 0, id = 999, count = 1, bind = 1}, }, --散人宝石Lv33
            {needLevel = 112, needCircle = 0, shwoEffId = 1000, consume = {{type = 47, id = 0, count = 131000}}, award = {type = 0, id = 1000, count = 1, bind = 1}, }, --散人宝石Lv34
            {needLevel = 113, needCircle = 0, shwoEffId = 1001, consume = {{type = 47, id = 0, count = 135000}}, award = {type = 0, id = 1001, count = 1, bind = 1}, }, --散人宝石Lv35
            {needLevel = 114, needCircle = 0, shwoEffId = 1002, consume = {{type = 47, id = 0, count = 139000}}, award = {type = 0, id = 1002, count = 1, bind = 1}, }, --散人宝石Lv36
            {needLevel = 115, needCircle = 0, shwoEffId = 1003, consume = {{type = 47, id = 0, count = 143000}}, award = {type = 0, id = 1003, count = 1, bind = 1}, }, --散人宝石Lv37
            {needLevel = 116, needCircle = 0, shwoEffId = 1004, consume = {{type = 47, id = 0, count = 147000}}, award = {type = 0, id = 1004, count = 1, bind = 1}, }, --散人宝石Lv38
            {needLevel = 117, needCircle = 0, shwoEffId = 1005, consume = {{type = 47, id = 0, count = 152000}}, award = {type = 0, id = 1005, count = 1, bind = 1}, }, --散人宝石Lv39
            {needLevel = 118, needCircle = 0, shwoEffId = 1006, consume = {{type = 47, id = 0, count = 156000}}, award = {type = 0, id = 1006, count = 1, bind = 1}, }, --散人宝石Lv40
            {needLevel = 119, needCircle = 0, shwoEffId = 1007, consume = {{type = 47, id = 0, count = 160000}}, award = {type = 0, id = 1007, count = 1, bind = 1}, }, --散人宝石Lv41
            {needLevel = 120, needCircle = 0, shwoEffId = 1008, consume = {{type = 47, id = 0, count = 171000}}, award = {type = 0, id = 1008, count = 1, bind = 1}, }, --散人宝石Lv42
            {needLevel = 121, needCircle = 0, shwoEffId = 1009, consume = {{type = 47, id = 0, count = 183000}}, award = {type = 0, id = 1009, count = 1, bind = 1}, }, --散人宝石Lv43
            {needLevel = 122, needCircle = 0, shwoEffId = 1010, consume = {{type = 47, id = 0, count = 194000}}, award = {type = 0, id = 1010, count = 1, bind = 1}, }, --散人宝石Lv44
            {needLevel = 123, needCircle = 0, shwoEffId = 1011, consume = {{type = 47, id = 0, count = 206000}}, award = {type = 0, id = 1011, count = 1, bind = 1}, }, --散人宝石Lv45
            {needLevel = 124, needCircle = 0, shwoEffId = 1012, consume = {{type = 47, id = 0, count = 219000}}, award = {type = 0, id = 1012, count = 1, bind = 1}, }, --散人宝石Lv46
            {needLevel = 125, needCircle = 0, shwoEffId = 1013, consume = {{type = 47, id = 0, count = 231000}}, award = {type = 0, id = 1013, count = 1, bind = 1}, }, --散人宝石Lv47
            {needLevel = 126, needCircle = 0, shwoEffId = 1014, consume = {{type = 47, id = 0, count = 244000}}, award = {type = 0, id = 1014, count = 1, bind = 1}, }, --散人宝石Lv48
            {needLevel = 127, needCircle = 0, shwoEffId = 1015, consume = {{type = 47, id = 0, count = 350000}}, award = {type = 0, id = 1015, count = 1, bind = 1}, }, --散人宝石Lv49
            {needLevel = 128, needCircle = 0, shwoEffId = 1016, consume = {{type = 47, id = 0, count = 500000}}, award = {type = 0, id = 1016, count = 1, bind = 1}, }, --散人宝石LvMax
           
{needLevel=128,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=505000}},award={type=0,id=6822,count=1,bind=1},},--散人宝石Lv51
{needLevel=128,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=510000}},award={type=0,id=6823,count=1,bind=1},},--散人宝石Lv52
{needLevel=128,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=515000}},award={type=0,id=6824,count=1,bind=1},},--散人宝石Lv53
{needLevel=128,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=520000}},award={type=0,id=6825,count=1,bind=1},},--散人宝石Lv54
{needLevel=128,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=525000}},award={type=0,id=6826,count=1,bind=1},},--散人宝石Lv55
{needLevel=129,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=530000}},award={type=0,id=6827,count=1,bind=1},},--散人宝石Lv56
{needLevel=129,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=535000}},award={type=0,id=6828,count=1,bind=1},},--散人宝石Lv57
{needLevel=129,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=540000}},award={type=0,id=6829,count=1,bind=1},},--散人宝石Lv58
{needLevel=129,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=545000}},award={type=0,id=6830,count=1,bind=1},},--散人宝石Lv59
{needLevel=129,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=550000}},award={type=0,id=6831,count=1,bind=1},},--散人宝石Lv60
{needLevel=130,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=555000}},award={type=0,id=6832,count=1,bind=1},},--散人宝石Lv61
{needLevel=130,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=560000}},award={type=0,id=6833,count=1,bind=1},},--散人宝石Lv62
{needLevel=130,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=565000}},award={type=0,id=6834,count=1,bind=1},},--散人宝石Lv63
{needLevel=130,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=570000}},award={type=0,id=6835,count=1,bind=1},},--散人宝石Lv64
{needLevel=130,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=575000}},award={type=0,id=6836,count=1,bind=1},},--散人宝石Lv65
{needLevel=131,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=580000}},award={type=0,id=6837,count=1,bind=1},},--散人宝石Lv66
{needLevel=131,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=585000}},award={type=0,id=6838,count=1,bind=1},},--散人宝石Lv67
{needLevel=131,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=590000}},award={type=0,id=6839,count=1,bind=1},},--散人宝石Lv68
{needLevel=131,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=595000}},award={type=0,id=6840,count=1,bind=1},},--散人宝石Lv69
{needLevel=131,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=600000}},award={type=0,id=6841,count=1,bind=1},},--散人宝石Lv70
{needLevel=132,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=605000}},award={type=0,id=7558,count=1,bind=1},},--散人宝石Lv71
{needLevel=132,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=610000}},award={type=0,id=7559,count=1,bind=1},},--散人宝石Lv72
{needLevel=132,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=615000}},award={type=0,id=7560,count=1,bind=1},},--散人宝石Lv73
{needLevel=132,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=620000}},award={type=0,id=7561,count=1,bind=1},},--散人宝石Lv74
{needLevel=132,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=625000}},award={type=0,id=7562,count=1,bind=1},},--散人宝石Lv75
{needLevel=133,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=630000}},award={type=0,id=7563,count=1,bind=1},},--散人宝石Lv76
{needLevel=133,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=635000}},award={type=0,id=7564,count=1,bind=1},},--散人宝石Lv77
{needLevel=133,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=640000}},award={type=0,id=7565,count=1,bind=1},},--散人宝石Lv78
{needLevel=133,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=645000}},award={type=0,id=7566,count=1,bind=1},},--散人宝石Lv79
{needLevel=133,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=650000}},award={type=0,id=7567,count=1,bind=1},},--散人宝石Lv80
{needLevel=134,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=655000}},award={type=0,id=7568,count=1,bind=1},},--散人宝石Lv81
{needLevel=134,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=660000}},award={type=0,id=7569,count=1,bind=1},},--散人宝石Lv82
{needLevel=134,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=665000}},award={type=0,id=7570,count=1,bind=1},},--散人宝石Lv83
{needLevel=134,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=670000}},award={type=0,id=7571,count=1,bind=1},},--散人宝石Lv84
{needLevel=134,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=675000}},award={type=0,id=7572,count=1,bind=1},},--散人宝石Lv85
{needLevel=135,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=680000}},award={type=0,id=7573,count=1,bind=1},},--散人宝石Lv86
{needLevel=135,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=685000}},award={type=0,id=7574,count=1,bind=1},},--散人宝石Lv87
{needLevel=135,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=690000}},award={type=0,id=7575,count=1,bind=1},},--散人宝石Lv88
{needLevel=135,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=695000}},award={type=0,id=7576,count=1,bind=1},},--散人宝石Lv89
{needLevel=135,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=700000}},award={type=0,id=7577,count=1,bind=1},},--散人宝石Lv90
{needLevel=136,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=705000}},award={type=0,id=7578,count=1,bind=1},},--散人宝石Lv91
{needLevel=136,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=710000}},award={type=0,id=7579,count=1,bind=1},},--散人宝石Lv92
{needLevel=136,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=715000}},award={type=0,id=7580,count=1,bind=1},},--散人宝石Lv93
{needLevel=136,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=720000}},award={type=0,id=7581,count=1,bind=1},},--散人宝石Lv94
{needLevel=136,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=725000}},award={type=0,id=7582,count=1,bind=1},},--散人宝石Lv95
{needLevel=137,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=730000}},award={type=0,id=7583,count=1,bind=1},},--散人宝石Lv96
{needLevel=137,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=735000}},award={type=0,id=7584,count=1,bind=1},},--散人宝石Lv97
{needLevel=137,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=740000}},award={type=0,id=7585,count=1,bind=1},},--散人宝石Lv98
{needLevel=137,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=745000}},award={type=0,id=7586,count=1,bind=1},},--散人宝石Lv99
{needLevel=137,needCircle=0,shwoEffId=1016,consume={{type=47,id=0,count=750000}},award={type=0,id=7587,count=1,bind=1},},--散人宝石Lv100



        
        
        
        
        
        ---------
        },
        
        --圣珠
        MagicalOrb =
        {
            ------------------
            {shwoEffId = 1177, award = {type = 0, id = 1177, count = 1, bind = 1}, }, --1阶
            {needLevel = 57, needCircle = 0, shwoEffId = 1178, consume = {{type = 42, id = 0, count = 500}}, award = {type = 0, id = 1178, count = 1, bind = 1}, }, --散人圣珠Lv2
            {needLevel = 59, needCircle = 0, shwoEffId = 1179, consume = {{type = 42, id = 0, count = 1200}}, award = {type = 0, id = 1179, count = 1, bind = 1}, }, --散人圣珠Lv3
            {needLevel = 61, needCircle = 0, shwoEffId = 1180, consume = {{type = 42, id = 0, count = 2600}}, award = {type = 0, id = 1180, count = 1, bind = 1}, }, --散人圣珠Lv4
            {needLevel = 63, needCircle = 0, shwoEffId = 1181, consume = {{type = 42, id = 0, count = 4500}}, award = {type = 0, id = 1181, count = 1, bind = 1}, }, --散人圣珠Lv5
            {needLevel = 65, needCircle = 0, shwoEffId = 1182, consume = {{type = 42, id = 0, count = 6800}}, award = {type = 0, id = 1182, count = 1, bind = 1}, }, --散人圣珠Lv6
            {needLevel = 67, needCircle = 0, shwoEffId = 1183, consume = {{type = 42, id = 0, count = 9200}}, award = {type = 0, id = 1183, count = 1, bind = 1}, }, --散人圣珠Lv7
            {needLevel = 69, needCircle = 0, shwoEffId = 1184, consume = {{type = 42, id = 0, count = 13000}}, award = {type = 0, id = 1184, count = 1, bind = 1}, }, --散人圣珠Lv8
            {needLevel = 71, needCircle = 0, shwoEffId = 1185, consume = {{type = 42, id = 0, count = 17500}}, award = {type = 0, id = 1185, count = 1, bind = 1}, }, --散人圣珠Lv9
            {needLevel = 73, needCircle = 0, shwoEffId = 1186, consume = {{type = 42, id = 0, count = 22500}}, award = {type = 0, id = 1186, count = 1, bind = 1}, }, --散人圣珠Lv10
            {needLevel = 75, needCircle = 0, shwoEffId = 1187, consume = {{type = 42, id = 0, count = 27800}}, award = {type = 0, id = 1187, count = 1, bind = 1}, }, --散人圣珠Lv11
            {needLevel = 77, needCircle = 0, shwoEffId = 1188, consume = {{type = 42, id = 0, count = 34800}}, award = {type = 0, id = 1188, count = 1, bind = 1}, }, --散人圣珠Lv12
            {needLevel = 79, needCircle = 0, shwoEffId = 1189, consume = {{type = 42, id = 0, count = 42900}}, award = {type = 0, id = 1189, count = 1, bind = 1}, }, --散人圣珠Lv13
            {needLevel = 81, needCircle = 0, shwoEffId = 1190, consume = {{type = 42, id = 0, count = 49800}}, award = {type = 0, id = 1190, count = 1, bind = 1}, }, --散人圣珠Lv14
            {needLevel = 83, needCircle = 0, shwoEffId = 1191, consume = {{type = 42, id = 0, count = 54400}}, award = {type = 0, id = 1191, count = 1, bind = 1}, }, --散人圣珠Lv15
            {needLevel = 85, needCircle = 0, shwoEffId = 1192, consume = {{type = 42, id = 0, count = 58800}}, award = {type = 0, id = 1192, count = 1, bind = 1}, }, --散人圣珠Lv16
            {needLevel = 87, needCircle = 0, shwoEffId = 1193, consume = {{type = 42, id = 0, count = 63300}}, award = {type = 0, id = 1193, count = 1, bind = 1}, }, --散人圣珠Lv17
            {needLevel = 89, needCircle = 0, shwoEffId = 1194, consume = {{type = 42, id = 0, count = 68500}}, award = {type = 0, id = 1194, count = 1, bind = 1}, }, --散人圣珠Lv18
            {needLevel = 91, needCircle = 0, shwoEffId = 1195, consume = {{type = 42, id = 0, count = 73300}}, award = {type = 0, id = 1195, count = 1, bind = 1}, }, --散人圣珠Lv19
            {needLevel = 93, needCircle = 0, shwoEffId = 1196, consume = {{type = 42, id = 0, count = 78800}}, award = {type = 0, id = 1196, count = 1, bind = 1}, }, --散人圣珠Lv20
            {needLevel = 95, needCircle = 0, shwoEffId = 1197, consume = {{type = 42, id = 0, count = 84000}}, award = {type = 0, id = 1197, count = 1, bind = 1}, }, --散人圣珠Lv21
            {needLevel = 97, needCircle = 0, shwoEffId = 1198, consume = {{type = 42, id = 0, count = 87300}}, award = {type = 0, id = 1198, count = 1, bind = 1}, }, --散人圣珠Lv22
            {needLevel = 99, needCircle = 0, shwoEffId = 1199, consume = {{type = 42, id = 0, count = 90300}}, award = {type = 0, id = 1199, count = 1, bind = 1}, }, --散人圣珠Lv23
            {needLevel = 101, needCircle = 0, shwoEffId = 1200, consume = {{type = 42, id = 0, count = 94000}}, award = {type = 0, id = 1200, count = 1, bind = 1}, }, --散人圣珠Lv24
            {needLevel = 103, needCircle = 0, shwoEffId = 1201, consume = {{type = 42, id = 0, count = 97000}}, award = {type = 0, id = 1201, count = 1, bind = 1}, }, --散人圣珠Lv25
            {needLevel = 104, needCircle = 0, shwoEffId = 1202, consume = {{type = 42, id = 0, count = 100800}}, award = {type = 0, id = 1202, count = 1, bind = 1}, }, --散人圣珠Lv26
            {needLevel = 105, needCircle = 0, shwoEffId = 1203, consume = {{type = 42, id = 0, count = 105000}}, award = {type = 0, id = 1203, count = 1, bind = 1}, }, --散人圣珠Lv27
            {needLevel = 106, needCircle = 0, shwoEffId = 1204, consume = {{type = 42, id = 0, count = 108000}}, award = {type = 0, id = 1204, count = 1, bind = 1}, }, --散人圣珠Lv28
            {needLevel = 107, needCircle = 0, shwoEffId = 1205, consume = {{type = 42, id = 0, count = 112000}}, award = {type = 0, id = 1205, count = 1, bind = 1}, }, --散人圣珠Lv29
            {needLevel = 108, needCircle = 0, shwoEffId = 1206, consume = {{type = 42, id = 0, count = 116000}}, award = {type = 0, id = 1206, count = 1, bind = 1}, }, --散人圣珠Lv30
            {needLevel = 109, needCircle = 0, shwoEffId = 1207, consume = {{type = 42, id = 0, count = 120000}}, award = {type = 0, id = 1207, count = 1, bind = 1}, }, --散人圣珠Lv31
            {needLevel = 110, needCircle = 0, shwoEffId = 1208, consume = {{type = 42, id = 0, count = 123000}}, award = {type = 0, id = 1208, count = 1, bind = 1}, }, --散人圣珠Lv32
            {needLevel = 111, needCircle = 0, shwoEffId = 1209, consume = {{type = 42, id = 0, count = 127000}}, award = {type = 0, id = 1209, count = 1, bind = 1}, }, --散人圣珠Lv33
            {needLevel = 112, needCircle = 0, shwoEffId = 1210, consume = {{type = 42, id = 0, count = 131000}}, award = {type = 0, id = 1210, count = 1, bind = 1}, }, --散人圣珠Lv34
            {needLevel = 113, needCircle = 0, shwoEffId = 1211, consume = {{type = 42, id = 0, count = 135000}}, award = {type = 0, id = 1211, count = 1, bind = 1}, }, --散人圣珠Lv35
            {needLevel = 114, needCircle = 0, shwoEffId = 1212, consume = {{type = 42, id = 0, count = 139000}}, award = {type = 0, id = 1212, count = 1, bind = 1}, }, --散人圣珠Lv36
            {needLevel = 115, needCircle = 0, shwoEffId = 1213, consume = {{type = 42, id = 0, count = 143000}}, award = {type = 0, id = 1213, count = 1, bind = 1}, }, --散人圣珠Lv37
            {needLevel = 116, needCircle = 0, shwoEffId = 1214, consume = {{type = 42, id = 0, count = 147000}}, award = {type = 0, id = 1214, count = 1, bind = 1}, }, --散人圣珠Lv38
            {needLevel = 117, needCircle = 0, shwoEffId = 1215, consume = {{type = 42, id = 0, count = 152000}}, award = {type = 0, id = 1215, count = 1, bind = 1}, }, --散人圣珠Lv39
            {needLevel = 118, needCircle = 0, shwoEffId = 1216, consume = {{type = 42, id = 0, count = 156000}}, award = {type = 0, id = 1216, count = 1, bind = 1}, }, --散人圣珠Lv40
            {needLevel = 119, needCircle = 0, shwoEffId = 1217, consume = {{type = 42, id = 0, count = 160000}}, award = {type = 0, id = 1217, count = 1, bind = 1}, }, --散人圣珠Lv41
            {needLevel = 120, needCircle = 0, shwoEffId = 1218, consume = {{type = 42, id = 0, count = 171000}}, award = {type = 0, id = 1218, count = 1, bind = 1}, }, --散人圣珠Lv42
            {needLevel = 121, needCircle = 0, shwoEffId = 1219, consume = {{type = 42, id = 0, count = 183000}}, award = {type = 0, id = 1219, count = 1, bind = 1}, }, --散人圣珠Lv43
            {needLevel = 122, needCircle = 0, shwoEffId = 1220, consume = {{type = 42, id = 0, count = 194000}}, award = {type = 0, id = 1220, count = 1, bind = 1}, }, --散人圣珠Lv44
            {needLevel = 123, needCircle = 0, shwoEffId = 1221, consume = {{type = 42, id = 0, count = 206000}}, award = {type = 0, id = 1221, count = 1, bind = 1}, }, --散人圣珠Lv45
            {needLevel = 124, needCircle = 0, shwoEffId = 1222, consume = {{type = 42, id = 0, count = 219000}}, award = {type = 0, id = 1222, count = 1, bind = 1}, }, --散人圣珠Lv46
            {needLevel = 125, needCircle = 0, shwoEffId = 1223, consume = {{type = 42, id = 0, count = 231000}}, award = {type = 0, id = 1223, count = 1, bind = 1}, }, --散人圣珠Lv47
            {needLevel = 126, needCircle = 0, shwoEffId = 1224, consume = {{type = 42, id = 0, count = 244000}}, award = {type = 0, id = 1224, count = 1, bind = 1}, }, --散人圣珠Lv48
            {needLevel = 127, needCircle = 0, shwoEffId = 1225, consume = {{type = 42, id = 0, count = 350000}}, award = {type = 0, id = 1225, count = 1, bind = 1}, }, --散人圣珠Lv49
            {needLevel = 128, needCircle = 0, shwoEffId = 1226, consume = {{type = 42, id = 0, count = 500000}}, award = {type = 0, id = 1226, count = 1, bind = 1}, }, --散人圣珠LvMax
{needLevel=128,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=507000}},award={type=0,id=6842,count=1,bind=1},},--散人圣珠Lv51
{needLevel=128,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=514000}},award={type=0,id=6843,count=1,bind=1},},--散人圣珠Lv52
{needLevel=128,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=521000}},award={type=0,id=6844,count=1,bind=1},},--散人圣珠Lv53
{needLevel=128,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=528000}},award={type=0,id=6845,count=1,bind=1},},--散人圣珠Lv54
{needLevel=129,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=535000}},award={type=0,id=6846,count=1,bind=1},},--散人圣珠Lv55
{needLevel=129,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=542000}},award={type=0,id=6847,count=1,bind=1},},--散人圣珠Lv56
{needLevel=129,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=549000}},award={type=0,id=6848,count=1,bind=1},},--散人圣珠Lv57
{needLevel=129,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=556000}},award={type=0,id=6849,count=1,bind=1},},--散人圣珠Lv58
{needLevel=129,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=563000}},award={type=0,id=6850,count=1,bind=1},},--散人圣珠Lv59
{needLevel=130,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=570000}},award={type=0,id=6851,count=1,bind=1},},--散人圣珠Lv60
{needLevel=130,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=577000}},award={type=0,id=6852,count=1,bind=1},},--散人圣珠Lv61
{needLevel=130,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=584000}},award={type=0,id=6853,count=1,bind=1},},--散人圣珠Lv62
{needLevel=130,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=591000}},award={type=0,id=6854,count=1,bind=1},},--散人圣珠Lv63
{needLevel=130,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=598000}},award={type=0,id=6855,count=1,bind=1},},--散人圣珠Lv64
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=605000}},award={type=0,id=6856,count=1,bind=1},},--散人圣珠Lv65
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=612000}},award={type=0,id=6857,count=1,bind=1},},--散人圣珠Lv66
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=619000}},award={type=0,id=6858,count=1,bind=1},},--散人圣珠Lv67
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=626000}},award={type=0,id=6859,count=1,bind=1},},--散人圣珠Lv68
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=633000}},award={type=0,id=6860,count=1,bind=1},},--散人圣珠Lv69
{needLevel=131,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=640000}},award={type=0,id=6861,count=1,bind=1},},--散人圣珠Lv70
{needLevel=132,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=647000}},award={type=0,id=7588,count=1,bind=1},},--散人圣珠Lv71
{needLevel=132,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=654000}},award={type=0,id=7589,count=1,bind=1},},--散人圣珠Lv72
{needLevel=132,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=661000}},award={type=0,id=7590,count=1,bind=1},},--散人圣珠Lv73
{needLevel=132,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=668000}},award={type=0,id=7591,count=1,bind=1},},--散人圣珠Lv74
{needLevel=132,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=675000}},award={type=0,id=7592,count=1,bind=1},},--散人圣珠Lv75
{needLevel=133,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=682000}},award={type=0,id=7593,count=1,bind=1},},--散人圣珠Lv76
{needLevel=133,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=689000}},award={type=0,id=7594,count=1,bind=1},},--散人圣珠Lv77
{needLevel=133,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=696000}},award={type=0,id=7595,count=1,bind=1},},--散人圣珠Lv78
{needLevel=133,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=703000}},award={type=0,id=7596,count=1,bind=1},},--散人圣珠Lv79
{needLevel=133,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=710000}},award={type=0,id=7597,count=1,bind=1},},--散人圣珠Lv80
{needLevel=134,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=717000}},award={type=0,id=7598,count=1,bind=1},},--散人圣珠Lv81
{needLevel=134,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=724000}},award={type=0,id=7599,count=1,bind=1},},--散人圣珠Lv82
{needLevel=134,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=731000}},award={type=0,id=7600,count=1,bind=1},},--散人圣珠Lv83
{needLevel=134,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=738000}},award={type=0,id=7601,count=1,bind=1},},--散人圣珠Lv84
{needLevel=134,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=745000}},award={type=0,id=7602,count=1,bind=1},},--散人圣珠Lv85
{needLevel=135,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=752000}},award={type=0,id=7603,count=1,bind=1},},--散人圣珠Lv86
{needLevel=135,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=759000}},award={type=0,id=7604,count=1,bind=1},},--散人圣珠Lv87
{needLevel=135,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=766000}},award={type=0,id=7605,count=1,bind=1},},--散人圣珠Lv88
{needLevel=135,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=773000}},award={type=0,id=7606,count=1,bind=1},},--散人圣珠Lv89
{needLevel=135,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=780000}},award={type=0,id=7607,count=1,bind=1},},--散人圣珠Lv90
{needLevel=136,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=787000}},award={type=0,id=7608,count=1,bind=1},},--散人圣珠Lv91
{needLevel=136,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=794000}},award={type=0,id=7609,count=1,bind=1},},--散人圣珠Lv92
{needLevel=136,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=801000}},award={type=0,id=7610,count=1,bind=1},},--散人圣珠Lv93
{needLevel=136,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=808000}},award={type=0,id=7611,count=1,bind=1},},--散人圣珠Lv94
{needLevel=136,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=815000}},award={type=0,id=7612,count=1,bind=1},},--散人圣珠Lv95
{needLevel=137,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=822000}},award={type=0,id=7613,count=1,bind=1},},--散人圣珠Lv96
{needLevel=137,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=829000}},award={type=0,id=7614,count=1,bind=1},},--散人圣珠Lv97
{needLevel=137,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=836000}},award={type=0,id=7615,count=1,bind=1},},--散人圣珠Lv98
{needLevel=137,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=843000}},award={type=0,id=7616,count=1,bind=1},},--散人圣珠Lv99
{needLevel=137,needCircle=0,shwoEffId=1226,consume={{type=42,id=0,count=850000}},award={type=0,id=7617,count=1,bind=1},},--散人圣珠Lv100



        
        
        ------------------
        },
        
        --新的勋章配置(用在成就面板) 老的可以删掉了,当前配置时间2017/03/01,编辑:zer
        --第1个表是战士勋章，第2个是法师勋章，第3个是道士勋章
        BadgeUpgradeEx =
        {
            ------------------
            {
                {shwoEffId = 1741,award = {type = 0, id = 1021, count = 1, bind = 1}, }, --战狂成就章Lv1
                
{needLevel=58,needCircle=0,shwoEffId =1743,consume={{type=11,id=0,count=14000}},award={type=0,id=1022,count=1,bind=1},},--战狂成就章Lv2
{needLevel=58,needCircle=0,shwoEffId =1745,consume={{type=11,id=0,count=46000}},award={type=0,id=1023,count=1,bind=1},},--战狂成就章Lv3
{needLevel=58,needCircle=0,shwoEffId =1747,consume={{type=11,id=0,count=114000}},award={type=0,id=1024,count=1,bind=1},},--战狂成就章Lv4
{needLevel=58,needCircle=0,shwoEffId =1749,consume={{type=11,id=0,count=232000}},award={type=0,id=1025,count=1,bind=1},},--战狂成就章Lv5
{needLevel=58,needCircle=0,shwoEffId =1751,consume={{type=11,id=0,count=408000}},award={type=0,id=1026,count=1,bind=1},},--战狂成就章Lv6
{needLevel=58,needCircle=0,shwoEffId =1753,consume={{type=11,id=0,count=648000}},award={type=0,id=1027,count=1,bind=1},},--战狂成就章Lv7
{needLevel=58,needCircle=0,shwoEffId =1755,consume={{type=11,id=0,count=986000}},award={type=0,id=1028,count=1,bind=1},},--战狂成就章Lv8
{needLevel=58,needCircle=0,shwoEffId =1757,consume={{type=11,id=0,count=1442000}},award={type=0,id=1029,count=1,bind=1},},--战狂成就章Lv9
{needLevel=58,needCircle=0,shwoEffId =1759,consume={{type=11,id=0,count=2028000}},award={type=0,id=1030,count=1,bind=1},},--战狂成就章Lv10
{needLevel=63,needCircle=0,shwoEffId =1761,consume={{type=11,id=0,count=2750000}},award={type=0,id=1031,count=1,bind=1},},--战狂成就章Lv11
{needLevel=63,needCircle=0,shwoEffId =1763,consume={{type=11,id=0,count=3654000}},award={type=0,id=1032,count=1,bind=1},},--战狂成就章Lv12
{needLevel=63,needCircle=0,shwoEffId =1765,consume={{type=11,id=0,count=4770000}},award={type=0,id=1033,count=1,bind=1},},--战狂成就章Lv13
{needLevel=63,needCircle=0,shwoEffId =1767,consume={{type=11,id=0,count=6064000}},award={type=0,id=1034,count=1,bind=1},},--战狂成就章Lv14
{needLevel=63,needCircle=0,shwoEffId =1769,consume={{type=11,id=0,count=7478000}},award={type=0,id=1035,count=1,bind=1},},--战狂成就章Lv15
{needLevel=63,needCircle=0,shwoEffId =1771,consume={{type=11,id=0,count=9006000}},award={type=0,id=1036,count=1,bind=1},},--战狂成就章Lv16
{needLevel=63,needCircle=0,shwoEffId =1773,consume={{type=11,id=0,count=10652000}},award={type=0,id=1037,count=1,bind=1},},--战狂成就章Lv17
{needLevel=63,needCircle=0,shwoEffId =1775,consume={{type=11,id=0,count=12434000}},award={type=0,id=1038,count=1,bind=1},},--战狂成就章Lv18
{needLevel=63,needCircle=0,shwoEffId =1777,consume={{type=11,id=0,count=14340000}},award={type=0,id=1039,count=1,bind=1},},--战狂成就章Lv19
{needLevel=63,needCircle=0,shwoEffId =1779,consume={{type=11,id=0,count=16388000}},award={type=0,id=1040,count=1,bind=1},},--战狂成就章Lv20
{needLevel=68,needCircle=0,shwoEffId =1781,consume={{type=11,id=0,count=18572000}},award={type=0,id=1041,count=1,bind=1},},--战狂成就章Lv21
{needLevel=68,needCircle=0,shwoEffId =1783,consume={{type=11,id=0,count=20842000}},award={type=0,id=1042,count=1,bind=1},},--战狂成就章Lv22
{needLevel=68,needCircle=0,shwoEffId =1785,consume={{type=11,id=0,count=23190000}},award={type=0,id=1043,count=1,bind=1},},--战狂成就章Lv23
{needLevel=68,needCircle=0,shwoEffId =1787,consume={{type=11,id=0,count=25634000}},award={type=0,id=1044,count=1,bind=1},},--战狂成就章Lv24
{needLevel=68,needCircle=0,shwoEffId =1789,consume={{type=11,id=0,count=28156000}},award={type=0,id=1045,count=1,bind=1},},--战狂成就章Lv25
{needLevel=68,needCircle=0,shwoEffId =1791,consume={{type=11,id=0,count=30776000}},award={type=0,id=1046,count=1,bind=1},},--战狂成就章Lv26
{needLevel=68,needCircle=0,shwoEffId =1793,consume={{type=11,id=0,count=33506000}},award={type=0,id=1047,count=1,bind=1},},--战狂成就章Lv27
{needLevel=68,needCircle=0,shwoEffId =1795,consume={{type=11,id=0,count=36314000}},award={type=0,id=1048,count=1,bind=1},},--战狂成就章Lv28
{needLevel=68,needCircle=0,shwoEffId =1797,consume={{type=11,id=0,count=39226000}},award={type=0,id=1049,count=1,bind=1},},--战狂成就章Lv29
{needLevel=68,needCircle=0,shwoEffId =1799,consume={{type=11,id=0,count=42242000}},award={type=0,id=1050,count=1,bind=1},},--战狂成就章Lv30
{needLevel=73,needCircle=0,shwoEffId =1801,consume={{type=11,id=0,count=45362000}},award={type=0,id=1051,count=1,bind=1},},--战狂成就章Lv31
{needLevel=73,needCircle=0,shwoEffId =1803,consume={{type=11,id=0,count=48560000}},award={type=0,id=1052,count=1,bind=1},},--战狂成就章Lv32
{needLevel=73,needCircle=0,shwoEffId =1805,consume={{type=11,id=0,count=51862000}},award={type=0,id=1053,count=1,bind=1},},--战狂成就章Lv33
{needLevel=73,needCircle=0,shwoEffId =1807,consume={{type=11,id=0,count=55268000}},award={type=0,id=1054,count=1,bind=1},},--战狂成就章Lv34
{needLevel=73,needCircle=0,shwoEffId =1809,consume={{type=11,id=0,count=58778000}},award={type=0,id=1055,count=1,bind=1},},--战狂成就章Lv35
{needLevel=73,needCircle=0,shwoEffId =1811,consume={{type=11,id=0,count=62392000}},award={type=0,id=1056,count=1,bind=1},},--战狂成就章Lv36
{needLevel=73,needCircle=0,shwoEffId =1813,consume={{type=11,id=0,count=66110000}},award={type=0,id=1057,count=1,bind=1},},--战狂成就章Lv37
{needLevel=73,needCircle=0,shwoEffId =1815,consume={{type=11,id=0,count=69932000}},award={type=0,id=1058,count=1,bind=1},},--战狂成就章Lv38
{needLevel=73,needCircle=0,shwoEffId =1817,consume={{type=11,id=0,count=73884000}},award={type=0,id=1059,count=1,bind=1},},--战狂成就章Lv39
{needLevel=73,needCircle=0,shwoEffId =1819,consume={{type=11,id=0,count=77940000}},award={type=0,id=1060,count=1,bind=1},},--战狂成就章Lv40
{needLevel=78,needCircle=0,shwoEffId =1821,consume={{type=11,id=0,count=82100000}},award={type=0,id=1061,count=1,bind=1},},--战狂成就章Lv41
{needLevel=78,needCircle=0,shwoEffId =1823,consume={{type=11,id=0,count=86546000}},award={type=0,id=1062,count=1,bind=1},},--战狂成就章Lv42
{needLevel=78,needCircle=0,shwoEffId =1825,consume={{type=11,id=0,count=91304000}},award={type=0,id=1063,count=1,bind=1},},--战狂成就章Lv43
{needLevel=78,needCircle=0,shwoEffId =1827,consume={{type=11,id=0,count=96348000}},award={type=0,id=1064,count=1,bind=1},},--战狂成就章Lv44
{needLevel=78,needCircle=0,shwoEffId =1829,consume={{type=11,id=0,count=101704000}},award={type=0,id=1065,count=1,bind=1},},--战狂成就章Lv45
{needLevel=78,needCircle=0,shwoEffId =1831,consume={{type=11,id=0,count=107398000}},award={type=0,id=1066,count=1,bind=1},},--战狂成就章Lv46
{needLevel=78,needCircle=0,shwoEffId =1833,consume={{type=11,id=0,count=113404000}},award={type=0,id=1067,count=1,bind=1},},--战狂成就章Lv47
{needLevel=78,needCircle=0,shwoEffId =1835,consume={{type=11,id=0,count=119748000}},award={type=0,id=1068,count=1,bind=1},},--战狂成就章Lv48
{needLevel=78,needCircle=0,shwoEffId =1837,consume={{type=11,id=0,count=128848000}},award={type=0,id=1069,count=1,bind=1},},--战狂成就章Lv49
{needLevel=78,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=141848000}},award={type=0,id=1070,count=1,bind=1},},--战狂成就章Lv50

{needLevel=81,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=155848000}},award={type=0,id=3655,count=1,bind=1},},--战狂成就章Lv51
{needLevel=82,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=170848000}},award={type=0,id=3656,count=1,bind=1},},--战狂成就章Lv52
{needLevel=83,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=186848000}},award={type=0,id=3657,count=1,bind=1},},--战狂成就章Lv53
{needLevel=84,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=203848000}},award={type=0,id=3658,count=1,bind=1},},--战狂成就章Lv54
{needLevel=85,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=221848000}},award={type=0,id=3659,count=1,bind=1},},--战狂成就章Lv55
{needLevel=86,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=240848000}},award={type=0,id=3660,count=1,bind=1},},--战狂成就章Lv56
{needLevel=87,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=260848000}},award={type=0,id=3661,count=1,bind=1},},--战狂成就章Lv57
{needLevel=88,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=281848000}},award={type=0,id=3662,count=1,bind=1},},--战狂成就章Lv58
{needLevel=89,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=303848000}},award={type=0,id=3663,count=1,bind=1},},--战狂成就章Lv59
{needLevel=90,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=326848000}},award={type=0,id=3664,count=1,bind=1},},--战狂成就章Lv60
{needLevel=91,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=350848000}},award={type=0,id=3665,count=1,bind=1},},--战狂成就章Lv61
{needLevel=92,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=375848000}},award={type=0,id=3666,count=1,bind=1},},--战狂成就章Lv62
{needLevel=93,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=401848000}},award={type=0,id=3667,count=1,bind=1},},--战狂成就章Lv63
{needLevel=94,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=428848000}},award={type=0,id=3668,count=1,bind=1},},--战狂成就章Lv64
{needLevel=95,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=456848000}},award={type=0,id=3669,count=1,bind=1},},--战狂成就章Lv65
{needLevel=96,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=485848000}},award={type=0,id=3670,count=1,bind=1},},--战狂成就章Lv66
{needLevel=97,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=515848000}},award={type=0,id=3671,count=1,bind=1},},--战狂成就章Lv67
{needLevel=98,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=546848000}},award={type=0,id=3672,count=1,bind=1},},--战狂成就章Lv68
{needLevel=99,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=578848000}},award={type=0,id=3673,count=1,bind=1},},--战狂成就章Lv69
{needLevel=100,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=611848000}},award={type=0,id=3674,count=1,bind=1},},--战狂成就章Lv70
{needLevel=101,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=645848000}},award={type=0,id=3675,count=1,bind=1},},--战狂成就章Lv71
{needLevel=102,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=680848000}},award={type=0,id=3676,count=1,bind=1},},--战狂成就章Lv72
{needLevel=103,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=716848000}},award={type=0,id=3677,count=1,bind=1},},--战狂成就章Lv73
{needLevel=104,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=753848000}},award={type=0,id=3678,count=1,bind=1},},--战狂成就章Lv74
{needLevel=105,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=791848000}},award={type=0,id=3679,count=1,bind=1},},--战狂成就章Lv75
{needLevel=106,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=830848000}},award={type=0,id=3680,count=1,bind=1},},--战狂成就章Lv76
{needLevel=107,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=870848000}},award={type=0,id=3681,count=1,bind=1},},--战狂成就章Lv77
{needLevel=108,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=911848000}},award={type=0,id=3682,count=1,bind=1},},--战狂成就章Lv78
{needLevel=109,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=953848000}},award={type=0,id=3683,count=1,bind=1},},--战狂成就章Lv79
{needLevel=110,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=996848000}},award={type=0,id=3684,count=1,bind=1},},--战狂成就章Lv80
{needLevel=111,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1040848000}},award={type=0,id=3685,count=1,bind=1},},--战狂成就章Lv81
{needLevel=112,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1085848000}},award={type=0,id=3686,count=1,bind=1},},--战狂成就章Lv82
{needLevel=113,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1131848000}},award={type=0,id=3687,count=1,bind=1},},--战狂成就章Lv83
{needLevel=114,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1178848000}},award={type=0,id=3688,count=1,bind=1},},--战狂成就章Lv84
{needLevel=115,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1226848000}},award={type=0,id=3689,count=1,bind=1},},--战狂成就章Lv85
{needLevel=116,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1275848000}},award={type=0,id=3690,count=1,bind=1},},--战狂成就章Lv86
{needLevel=117,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1325848000}},award={type=0,id=3691,count=1,bind=1},},--战狂成就章Lv87
{needLevel=118,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1376848000}},award={type=0,id=3692,count=1,bind=1},},--战狂成就章Lv88
{needLevel=119,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1428848000}},award={type=0,id=3693,count=1,bind=1},},--战狂成就章Lv89
{needLevel=120,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1481848000}},award={type=0,id=3694,count=1,bind=1},},--战狂成就章Lv90
{needLevel=121,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1535848000}},award={type=0,id=3695,count=1,bind=1},},--战狂成就章Lv91
{needLevel=122,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1590848000}},award={type=0,id=3696,count=1,bind=1},},--战狂成就章Lv92
{needLevel=123,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1646848000}},award={type=0,id=3697,count=1,bind=1},},--战狂成就章Lv93
{needLevel=124,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1703848000}},award={type=0,id=3698,count=1,bind=1},},--战狂成就章Lv94
{needLevel=125,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1761848000}},award={type=0,id=3699,count=1,bind=1},},--战狂成就章Lv95
{needLevel=126,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1820848000}},award={type=0,id=3700,count=1,bind=1},},--战狂成就章Lv96
{needLevel=127,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1880848000}},award={type=0,id=3701,count=1,bind=1},},--战狂成就章Lv97
{needLevel=128,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1941848000}},award={type=0,id=3702,count=1,bind=1},},--战狂成就章Lv98
{needLevel=129,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2003848000}},award={type=0,id=3703,count=1,bind=1},},--战狂成就章Lv99
{needLevel=130,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2066848000}},award={type=0,id=3704,count=1,bind=1},},--战狂成就章LvMax








            
            
            
            
            },
            
            
            {
                {shwoEffId = 1741,award = {type = 0, id = 1072, count = 1, bind = 1}, }, --法痴成就章Lv1
{needLevel=58,needCircle=0,shwoEffId =1743,consume={{type=11,id=0,count=14000}},award={type=0,id=1073,count=1,bind=1},},--法痴成就章Lv2
{needLevel=58,needCircle=0,shwoEffId =1745,consume={{type=11,id=0,count=46000}},award={type=0,id=1074,count=1,bind=1},},--法痴成就章Lv3
{needLevel=58,needCircle=0,shwoEffId =1747,consume={{type=11,id=0,count=114000}},award={type=0,id=1075,count=1,bind=1},},--法痴成就章Lv4
{needLevel=58,needCircle=0,shwoEffId =1749,consume={{type=11,id=0,count=232000}},award={type=0,id=1076,count=1,bind=1},},--法痴成就章Lv5
{needLevel=58,needCircle=0,shwoEffId =1751,consume={{type=11,id=0,count=408000}},award={type=0,id=1077,count=1,bind=1},},--法痴成就章Lv6
{needLevel=58,needCircle=0,shwoEffId =1753,consume={{type=11,id=0,count=648000}},award={type=0,id=1078,count=1,bind=1},},--法痴成就章Lv7
{needLevel=58,needCircle=0,shwoEffId =1755,consume={{type=11,id=0,count=986000}},award={type=0,id=1079,count=1,bind=1},},--法痴成就章Lv8
{needLevel=58,needCircle=0,shwoEffId =1757,consume={{type=11,id=0,count=1442000}},award={type=0,id=1080,count=1,bind=1},},--法痴成就章Lv9
{needLevel=58,needCircle=0,shwoEffId =1759,consume={{type=11,id=0,count=2028000}},award={type=0,id=1081,count=1,bind=1},},--法痴成就章Lv10
{needLevel=63,needCircle=0,shwoEffId =1761,consume={{type=11,id=0,count=2750000}},award={type=0,id=1082,count=1,bind=1},},--法痴成就章Lv11
{needLevel=63,needCircle=0,shwoEffId =1763,consume={{type=11,id=0,count=3654000}},award={type=0,id=1083,count=1,bind=1},},--法痴成就章Lv12
{needLevel=63,needCircle=0,shwoEffId =1765,consume={{type=11,id=0,count=4770000}},award={type=0,id=1084,count=1,bind=1},},--法痴成就章Lv13
{needLevel=63,needCircle=0,shwoEffId =1767,consume={{type=11,id=0,count=6064000}},award={type=0,id=1085,count=1,bind=1},},--法痴成就章Lv14
{needLevel=63,needCircle=0,shwoEffId =1769,consume={{type=11,id=0,count=7478000}},award={type=0,id=1086,count=1,bind=1},},--法痴成就章Lv15
{needLevel=63,needCircle=0,shwoEffId =1771,consume={{type=11,id=0,count=9006000}},award={type=0,id=1087,count=1,bind=1},},--法痴成就章Lv16
{needLevel=63,needCircle=0,shwoEffId =1773,consume={{type=11,id=0,count=10652000}},award={type=0,id=1088,count=1,bind=1},},--法痴成就章Lv17
{needLevel=63,needCircle=0,shwoEffId =1775,consume={{type=11,id=0,count=12434000}},award={type=0,id=1089,count=1,bind=1},},--法痴成就章Lv18
{needLevel=63,needCircle=0,shwoEffId =1777,consume={{type=11,id=0,count=14340000}},award={type=0,id=1090,count=1,bind=1},},--法痴成就章Lv19
{needLevel=63,needCircle=0,shwoEffId =1779,consume={{type=11,id=0,count=16388000}},award={type=0,id=1091,count=1,bind=1},},--法痴成就章Lv20
{needLevel=68,needCircle=0,shwoEffId =1781,consume={{type=11,id=0,count=18572000}},award={type=0,id=1092,count=1,bind=1},},--法痴成就章Lv21
{needLevel=68,needCircle=0,shwoEffId =1783,consume={{type=11,id=0,count=20842000}},award={type=0,id=1093,count=1,bind=1},},--法痴成就章Lv22
{needLevel=68,needCircle=0,shwoEffId =1785,consume={{type=11,id=0,count=23190000}},award={type=0,id=1094,count=1,bind=1},},--法痴成就章Lv23
{needLevel=68,needCircle=0,shwoEffId =1787,consume={{type=11,id=0,count=25634000}},award={type=0,id=1095,count=1,bind=1},},--法痴成就章Lv24
{needLevel=68,needCircle=0,shwoEffId =1789,consume={{type=11,id=0,count=28156000}},award={type=0,id=1096,count=1,bind=1},},--法痴成就章Lv25
{needLevel=68,needCircle=0,shwoEffId =1791,consume={{type=11,id=0,count=30776000}},award={type=0,id=1097,count=1,bind=1},},--法痴成就章Lv26
{needLevel=68,needCircle=0,shwoEffId =1793,consume={{type=11,id=0,count=33506000}},award={type=0,id=1098,count=1,bind=1},},--法痴成就章Lv27
{needLevel=68,needCircle=0,shwoEffId =1795,consume={{type=11,id=0,count=36314000}},award={type=0,id=1099,count=1,bind=1},},--法痴成就章Lv28
{needLevel=68,needCircle=0,shwoEffId =1797,consume={{type=11,id=0,count=39226000}},award={type=0,id=1100,count=1,bind=1},},--法痴成就章Lv29
{needLevel=68,needCircle=0,shwoEffId =1799,consume={{type=11,id=0,count=42242000}},award={type=0,id=1101,count=1,bind=1},},--法痴成就章Lv30
{needLevel=73,needCircle=0,shwoEffId =1801,consume={{type=11,id=0,count=45362000}},award={type=0,id=1102,count=1,bind=1},},--法痴成就章Lv31
{needLevel=73,needCircle=0,shwoEffId =1803,consume={{type=11,id=0,count=48560000}},award={type=0,id=1103,count=1,bind=1},},--法痴成就章Lv32
{needLevel=73,needCircle=0,shwoEffId =1805,consume={{type=11,id=0,count=51862000}},award={type=0,id=1104,count=1,bind=1},},--法痴成就章Lv33
{needLevel=73,needCircle=0,shwoEffId =1807,consume={{type=11,id=0,count=55268000}},award={type=0,id=1105,count=1,bind=1},},--法痴成就章Lv34
{needLevel=73,needCircle=0,shwoEffId =1809,consume={{type=11,id=0,count=58778000}},award={type=0,id=1106,count=1,bind=1},},--法痴成就章Lv35
{needLevel=73,needCircle=0,shwoEffId =1811,consume={{type=11,id=0,count=62392000}},award={type=0,id=1107,count=1,bind=1},},--法痴成就章Lv36
{needLevel=73,needCircle=0,shwoEffId =1813,consume={{type=11,id=0,count=66110000}},award={type=0,id=1108,count=1,bind=1},},--法痴成就章Lv37
{needLevel=73,needCircle=0,shwoEffId =1815,consume={{type=11,id=0,count=69932000}},award={type=0,id=1109,count=1,bind=1},},--法痴成就章Lv38
{needLevel=73,needCircle=0,shwoEffId =1817,consume={{type=11,id=0,count=73884000}},award={type=0,id=1110,count=1,bind=1},},--法痴成就章Lv39
{needLevel=73,needCircle=0,shwoEffId =1819,consume={{type=11,id=0,count=77940000}},award={type=0,id=1111,count=1,bind=1},},--法痴成就章Lv40
{needLevel=78,needCircle=0,shwoEffId =1821,consume={{type=11,id=0,count=82100000}},award={type=0,id=1112,count=1,bind=1},},--法痴成就章Lv41
{needLevel=78,needCircle=0,shwoEffId =1823,consume={{type=11,id=0,count=86546000}},award={type=0,id=1113,count=1,bind=1},},--法痴成就章Lv42
{needLevel=78,needCircle=0,shwoEffId =1825,consume={{type=11,id=0,count=91304000}},award={type=0,id=1114,count=1,bind=1},},--法痴成就章Lv43
{needLevel=78,needCircle=0,shwoEffId =1827,consume={{type=11,id=0,count=96348000}},award={type=0,id=1115,count=1,bind=1},},--法痴成就章Lv44
{needLevel=78,needCircle=0,shwoEffId =1829,consume={{type=11,id=0,count=101704000}},award={type=0,id=1116,count=1,bind=1},},--法痴成就章Lv45
{needLevel=78,needCircle=0,shwoEffId =1831,consume={{type=11,id=0,count=107398000}},award={type=0,id=1117,count=1,bind=1},},--法痴成就章Lv46
{needLevel=78,needCircle=0,shwoEffId =1833,consume={{type=11,id=0,count=113404000}},award={type=0,id=1118,count=1,bind=1},},--法痴成就章Lv47
{needLevel=78,needCircle=0,shwoEffId =1835,consume={{type=11,id=0,count=119748000}},award={type=0,id=1119,count=1,bind=1},},--法痴成就章Lv48
{needLevel=78,needCircle=0,shwoEffId =1837,consume={{type=11,id=0,count=128848000}},award={type=0,id=1120,count=1,bind=1},},--法痴成就章Lv49
{needLevel=78,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=141848000}},award={type=0,id=1121,count=1,bind=1},},--法痴成就章Lv50

{needLevel=81,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=155848000}},award={type=0,id=3706,count=1,bind=1},},--法痴成就章Lv51
{needLevel=82,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=170848000}},award={type=0,id=3707,count=1,bind=1},},--法痴成就章Lv52
{needLevel=83,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=186848000}},award={type=0,id=3708,count=1,bind=1},},--法痴成就章Lv53
{needLevel=84,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=203848000}},award={type=0,id=3709,count=1,bind=1},},--法痴成就章Lv54
{needLevel=85,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=221848000}},award={type=0,id=3710,count=1,bind=1},},--法痴成就章Lv55
{needLevel=86,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=240848000}},award={type=0,id=3711,count=1,bind=1},},--法痴成就章Lv56
{needLevel=87,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=260848000}},award={type=0,id=3712,count=1,bind=1},},--法痴成就章Lv57
{needLevel=88,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=281848000}},award={type=0,id=3713,count=1,bind=1},},--法痴成就章Lv58
{needLevel=89,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=303848000}},award={type=0,id=3714,count=1,bind=1},},--法痴成就章Lv59
{needLevel=90,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=326848000}},award={type=0,id=3715,count=1,bind=1},},--法痴成就章Lv60
{needLevel=91,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=350848000}},award={type=0,id=3716,count=1,bind=1},},--法痴成就章Lv61
{needLevel=92,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=375848000}},award={type=0,id=3717,count=1,bind=1},},--法痴成就章Lv62
{needLevel=93,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=401848000}},award={type=0,id=3718,count=1,bind=1},},--法痴成就章Lv63
{needLevel=94,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=428848000}},award={type=0,id=3719,count=1,bind=1},},--法痴成就章Lv64
{needLevel=95,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=456848000}},award={type=0,id=3720,count=1,bind=1},},--法痴成就章Lv65
{needLevel=96,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=485848000}},award={type=0,id=3721,count=1,bind=1},},--法痴成就章Lv66
{needLevel=97,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=515848000}},award={type=0,id=3722,count=1,bind=1},},--法痴成就章Lv67
{needLevel=98,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=546848000}},award={type=0,id=3723,count=1,bind=1},},--法痴成就章Lv68
{needLevel=99,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=578848000}},award={type=0,id=3724,count=1,bind=1},},--法痴成就章Lv69
{needLevel=100,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=611848000}},award={type=0,id=3725,count=1,bind=1},},--法痴成就章Lv70
{needLevel=101,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=645848000}},award={type=0,id=3726,count=1,bind=1},},--法痴成就章Lv71
{needLevel=102,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=680848000}},award={type=0,id=3727,count=1,bind=1},},--法痴成就章Lv72
{needLevel=103,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=716848000}},award={type=0,id=3728,count=1,bind=1},},--法痴成就章Lv73
{needLevel=104,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=753848000}},award={type=0,id=3729,count=1,bind=1},},--法痴成就章Lv74
{needLevel=105,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=791848000}},award={type=0,id=3730,count=1,bind=1},},--法痴成就章Lv75
{needLevel=106,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=830848000}},award={type=0,id=3731,count=1,bind=1},},--法痴成就章Lv76
{needLevel=107,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=870848000}},award={type=0,id=3732,count=1,bind=1},},--法痴成就章Lv77
{needLevel=108,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=911848000}},award={type=0,id=3733,count=1,bind=1},},--法痴成就章Lv78
{needLevel=109,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=953848000}},award={type=0,id=3734,count=1,bind=1},},--法痴成就章Lv79
{needLevel=110,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=996848000}},award={type=0,id=3735,count=1,bind=1},},--法痴成就章Lv80
{needLevel=111,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1040848000}},award={type=0,id=3736,count=1,bind=1},},--法痴成就章Lv81
{needLevel=112,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1085848000}},award={type=0,id=3737,count=1,bind=1},},--法痴成就章Lv82
{needLevel=113,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1131848000}},award={type=0,id=3738,count=1,bind=1},},--法痴成就章Lv83
{needLevel=114,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1178848000}},award={type=0,id=3739,count=1,bind=1},},--法痴成就章Lv84
{needLevel=115,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1226848000}},award={type=0,id=3740,count=1,bind=1},},--法痴成就章Lv85
{needLevel=116,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1275848000}},award={type=0,id=3741,count=1,bind=1},},--法痴成就章Lv86
{needLevel=117,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1325848000}},award={type=0,id=3742,count=1,bind=1},},--法痴成就章Lv87
{needLevel=118,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1376848000}},award={type=0,id=3743,count=1,bind=1},},--法痴成就章Lv88
{needLevel=119,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1428848000}},award={type=0,id=3744,count=1,bind=1},},--法痴成就章Lv89
{needLevel=120,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1481848000}},award={type=0,id=3745,count=1,bind=1},},--法痴成就章Lv90
{needLevel=121,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1535848000}},award={type=0,id=3746,count=1,bind=1},},--法痴成就章Lv91
{needLevel=122,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1590848000}},award={type=0,id=3747,count=1,bind=1},},--法痴成就章Lv92
{needLevel=123,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1646848000}},award={type=0,id=3748,count=1,bind=1},},--法痴成就章Lv93
{needLevel=124,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1703848000}},award={type=0,id=3749,count=1,bind=1},},--法痴成就章Lv94
{needLevel=125,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1761848000}},award={type=0,id=3750,count=1,bind=1},},--法痴成就章Lv95
{needLevel=126,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1820848000}},award={type=0,id=3751,count=1,bind=1},},--法痴成就章Lv96
{needLevel=127,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1880848000}},award={type=0,id=3752,count=1,bind=1},},--法痴成就章Lv97
{needLevel=128,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1941848000}},award={type=0,id=3753,count=1,bind=1},},--法痴成就章Lv98
{needLevel=129,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2003848000}},award={type=0,id=3754,count=1,bind=1},},--法痴成就章Lv99
{needLevel=130,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2066848000}},award={type=0,id=3755,count=1,bind=1},},--法痴成就章LvMax





            },
            
            {
                {shwoEffId = 1741,award = {type = 0, id = 1123, count = 1, bind = 1}, }, --道颠成就章Lv1
{needLevel=58,needCircle=0,shwoEffId =1743,consume={{type=11,id=0,count=14000}},award={type=0,id=1124,count=1,bind=1},},--道颠成就章Lv2
{needLevel=58,needCircle=0,shwoEffId =1745,consume={{type=11,id=0,count=46000}},award={type=0,id=1125,count=1,bind=1},},--道颠成就章Lv3
{needLevel=58,needCircle=0,shwoEffId =1747,consume={{type=11,id=0,count=114000}},award={type=0,id=1126,count=1,bind=1},},--道颠成就章Lv4
{needLevel=58,needCircle=0,shwoEffId =1749,consume={{type=11,id=0,count=232000}},award={type=0,id=1127,count=1,bind=1},},--道颠成就章Lv5
{needLevel=58,needCircle=0,shwoEffId =1751,consume={{type=11,id=0,count=408000}},award={type=0,id=1128,count=1,bind=1},},--道颠成就章Lv6
{needLevel=58,needCircle=0,shwoEffId =1753,consume={{type=11,id=0,count=648000}},award={type=0,id=1129,count=1,bind=1},},--道颠成就章Lv7
{needLevel=58,needCircle=0,shwoEffId =1755,consume={{type=11,id=0,count=986000}},award={type=0,id=1130,count=1,bind=1},},--道颠成就章Lv8
{needLevel=58,needCircle=0,shwoEffId =1757,consume={{type=11,id=0,count=1442000}},award={type=0,id=1131,count=1,bind=1},},--道颠成就章Lv9
{needLevel=58,needCircle=0,shwoEffId =1759,consume={{type=11,id=0,count=2028000}},award={type=0,id=1132,count=1,bind=1},},--道颠成就章Lv10
{needLevel=63,needCircle=0,shwoEffId =1761,consume={{type=11,id=0,count=2750000}},award={type=0,id=1133,count=1,bind=1},},--道颠成就章Lv11
{needLevel=63,needCircle=0,shwoEffId =1763,consume={{type=11,id=0,count=3654000}},award={type=0,id=1134,count=1,bind=1},},--道颠成就章Lv12
{needLevel=63,needCircle=0,shwoEffId =1765,consume={{type=11,id=0,count=4770000}},award={type=0,id=1135,count=1,bind=1},},--道颠成就章Lv13
{needLevel=63,needCircle=0,shwoEffId =1767,consume={{type=11,id=0,count=6064000}},award={type=0,id=1136,count=1,bind=1},},--道颠成就章Lv14
{needLevel=63,needCircle=0,shwoEffId =1769,consume={{type=11,id=0,count=7478000}},award={type=0,id=1137,count=1,bind=1},},--道颠成就章Lv15
{needLevel=63,needCircle=0,shwoEffId =1771,consume={{type=11,id=0,count=9006000}},award={type=0,id=1138,count=1,bind=1},},--道颠成就章Lv16
{needLevel=63,needCircle=0,shwoEffId =1773,consume={{type=11,id=0,count=10652000}},award={type=0,id=1139,count=1,bind=1},},--道颠成就章Lv17
{needLevel=63,needCircle=0,shwoEffId =1775,consume={{type=11,id=0,count=12434000}},award={type=0,id=1140,count=1,bind=1},},--道颠成就章Lv18
{needLevel=63,needCircle=0,shwoEffId =1777,consume={{type=11,id=0,count=14340000}},award={type=0,id=1141,count=1,bind=1},},--道颠成就章Lv19
{needLevel=63,needCircle=0,shwoEffId =1779,consume={{type=11,id=0,count=16388000}},award={type=0,id=1142,count=1,bind=1},},--道颠成就章Lv20
{needLevel=68,needCircle=0,shwoEffId =1781,consume={{type=11,id=0,count=18572000}},award={type=0,id=1143,count=1,bind=1},},--道颠成就章Lv21
{needLevel=68,needCircle=0,shwoEffId =1783,consume={{type=11,id=0,count=20842000}},award={type=0,id=1144,count=1,bind=1},},--道颠成就章Lv22
{needLevel=68,needCircle=0,shwoEffId =1785,consume={{type=11,id=0,count=23190000}},award={type=0,id=1145,count=1,bind=1},},--道颠成就章Lv23
{needLevel=68,needCircle=0,shwoEffId =1787,consume={{type=11,id=0,count=25634000}},award={type=0,id=1146,count=1,bind=1},},--道颠成就章Lv24
{needLevel=68,needCircle=0,shwoEffId =1789,consume={{type=11,id=0,count=28156000}},award={type=0,id=1147,count=1,bind=1},},--道颠成就章Lv25
{needLevel=68,needCircle=0,shwoEffId =1791,consume={{type=11,id=0,count=30776000}},award={type=0,id=1148,count=1,bind=1},},--道颠成就章Lv26
{needLevel=68,needCircle=0,shwoEffId =1793,consume={{type=11,id=0,count=33506000}},award={type=0,id=1149,count=1,bind=1},},--道颠成就章Lv27
{needLevel=68,needCircle=0,shwoEffId =1795,consume={{type=11,id=0,count=36314000}},award={type=0,id=1150,count=1,bind=1},},--道颠成就章Lv28
{needLevel=68,needCircle=0,shwoEffId =1797,consume={{type=11,id=0,count=39226000}},award={type=0,id=1151,count=1,bind=1},},--道颠成就章Lv29
{needLevel=68,needCircle=0,shwoEffId =1799,consume={{type=11,id=0,count=42242000}},award={type=0,id=1152,count=1,bind=1},},--道颠成就章Lv30
{needLevel=73,needCircle=0,shwoEffId =1801,consume={{type=11,id=0,count=45362000}},award={type=0,id=1153,count=1,bind=1},},--道颠成就章Lv31
{needLevel=73,needCircle=0,shwoEffId =1803,consume={{type=11,id=0,count=48560000}},award={type=0,id=1154,count=1,bind=1},},--道颠成就章Lv32
{needLevel=73,needCircle=0,shwoEffId =1805,consume={{type=11,id=0,count=51862000}},award={type=0,id=1155,count=1,bind=1},},--道颠成就章Lv33
{needLevel=73,needCircle=0,shwoEffId =1807,consume={{type=11,id=0,count=55268000}},award={type=0,id=1156,count=1,bind=1},},--道颠成就章Lv34
{needLevel=73,needCircle=0,shwoEffId =1809,consume={{type=11,id=0,count=58778000}},award={type=0,id=1157,count=1,bind=1},},--道颠成就章Lv35
{needLevel=73,needCircle=0,shwoEffId =1811,consume={{type=11,id=0,count=62392000}},award={type=0,id=1158,count=1,bind=1},},--道颠成就章Lv36
{needLevel=73,needCircle=0,shwoEffId =1813,consume={{type=11,id=0,count=66110000}},award={type=0,id=1159,count=1,bind=1},},--道颠成就章Lv37
{needLevel=73,needCircle=0,shwoEffId =1815,consume={{type=11,id=0,count=69932000}},award={type=0,id=1160,count=1,bind=1},},--道颠成就章Lv38
{needLevel=73,needCircle=0,shwoEffId =1817,consume={{type=11,id=0,count=73884000}},award={type=0,id=1161,count=1,bind=1},},--道颠成就章Lv39
{needLevel=73,needCircle=0,shwoEffId =1819,consume={{type=11,id=0,count=77940000}},award={type=0,id=1162,count=1,bind=1},},--道颠成就章Lv40
{needLevel=78,needCircle=0,shwoEffId =1821,consume={{type=11,id=0,count=82100000}},award={type=0,id=1163,count=1,bind=1},},--道颠成就章Lv41
{needLevel=78,needCircle=0,shwoEffId =1823,consume={{type=11,id=0,count=86546000}},award={type=0,id=1164,count=1,bind=1},},--道颠成就章Lv42
{needLevel=78,needCircle=0,shwoEffId =1825,consume={{type=11,id=0,count=91304000}},award={type=0,id=1165,count=1,bind=1},},--道颠成就章Lv43
{needLevel=78,needCircle=0,shwoEffId =1827,consume={{type=11,id=0,count=96348000}},award={type=0,id=1166,count=1,bind=1},},--道颠成就章Lv44
{needLevel=78,needCircle=0,shwoEffId =1829,consume={{type=11,id=0,count=101704000}},award={type=0,id=1167,count=1,bind=1},},--道颠成就章Lv45
{needLevel=78,needCircle=0,shwoEffId =1831,consume={{type=11,id=0,count=107398000}},award={type=0,id=1168,count=1,bind=1},},--道颠成就章Lv46
{needLevel=78,needCircle=0,shwoEffId =1833,consume={{type=11,id=0,count=113404000}},award={type=0,id=1169,count=1,bind=1},},--道颠成就章Lv47
{needLevel=78,needCircle=0,shwoEffId =1835,consume={{type=11,id=0,count=119748000}},award={type=0,id=1170,count=1,bind=1},},--道颠成就章Lv48
{needLevel=78,needCircle=0,shwoEffId =1837,consume={{type=11,id=0,count=128848000}},award={type=0,id=1171,count=1,bind=1},},--道颠成就章Lv49
{needLevel=78,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=141848000}},award={type=0,id=1172,count=1,bind=1},},--道颠成就章Lv50

{needLevel=81,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=155848000}},award={type=0,id=3757,count=1,bind=1},},--道颠成就章Lv51
{needLevel=82,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=170848000}},award={type=0,id=3758,count=1,bind=1},},--道颠成就章Lv52
{needLevel=83,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=186848000}},award={type=0,id=3759,count=1,bind=1},},--道颠成就章Lv53
{needLevel=84,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=203848000}},award={type=0,id=3760,count=1,bind=1},},--道颠成就章Lv54
{needLevel=85,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=221848000}},award={type=0,id=3761,count=1,bind=1},},--道颠成就章Lv55
{needLevel=86,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=240848000}},award={type=0,id=3762,count=1,bind=1},},--道颠成就章Lv56
{needLevel=87,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=260848000}},award={type=0,id=3763,count=1,bind=1},},--道颠成就章Lv57
{needLevel=88,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=281848000}},award={type=0,id=3764,count=1,bind=1},},--道颠成就章Lv58
{needLevel=89,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=303848000}},award={type=0,id=3765,count=1,bind=1},},--道颠成就章Lv59
{needLevel=90,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=326848000}},award={type=0,id=3766,count=1,bind=1},},--道颠成就章Lv60
{needLevel=91,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=350848000}},award={type=0,id=3767,count=1,bind=1},},--道颠成就章Lv61
{needLevel=92,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=375848000}},award={type=0,id=3768,count=1,bind=1},},--道颠成就章Lv62
{needLevel=93,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=401848000}},award={type=0,id=3769,count=1,bind=1},},--道颠成就章Lv63
{needLevel=94,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=428848000}},award={type=0,id=3770,count=1,bind=1},},--道颠成就章Lv64
{needLevel=95,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=456848000}},award={type=0,id=3771,count=1,bind=1},},--道颠成就章Lv65
{needLevel=96,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=485848000}},award={type=0,id=3772,count=1,bind=1},},--道颠成就章Lv66
{needLevel=97,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=515848000}},award={type=0,id=3773,count=1,bind=1},},--道颠成就章Lv67
{needLevel=98,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=546848000}},award={type=0,id=3774,count=1,bind=1},},--道颠成就章Lv68
{needLevel=99,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=578848000}},award={type=0,id=3775,count=1,bind=1},},--道颠成就章Lv69
{needLevel=100,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=611848000}},award={type=0,id=3776,count=1,bind=1},},--道颠成就章Lv70
{needLevel=101,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=645848000}},award={type=0,id=3777,count=1,bind=1},},--道颠成就章Lv71
{needLevel=102,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=680848000}},award={type=0,id=3778,count=1,bind=1},},--道颠成就章Lv72
{needLevel=103,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=716848000}},award={type=0,id=3779,count=1,bind=1},},--道颠成就章Lv73
{needLevel=104,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=753848000}},award={type=0,id=3780,count=1,bind=1},},--道颠成就章Lv74
{needLevel=105,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=791848000}},award={type=0,id=3781,count=1,bind=1},},--道颠成就章Lv75
{needLevel=106,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=830848000}},award={type=0,id=3782,count=1,bind=1},},--道颠成就章Lv76
{needLevel=107,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=870848000}},award={type=0,id=3783,count=1,bind=1},},--道颠成就章Lv77
{needLevel=108,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=911848000}},award={type=0,id=3784,count=1,bind=1},},--道颠成就章Lv78
{needLevel=109,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=953848000}},award={type=0,id=3785,count=1,bind=1},},--道颠成就章Lv79
{needLevel=110,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=996848000}},award={type=0,id=3786,count=1,bind=1},},--道颠成就章Lv80
{needLevel=111,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1040848000}},award={type=0,id=3787,count=1,bind=1},},--道颠成就章Lv81
{needLevel=112,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1085848000}},award={type=0,id=3788,count=1,bind=1},},--道颠成就章Lv82
{needLevel=113,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1131848000}},award={type=0,id=3789,count=1,bind=1},},--道颠成就章Lv83
{needLevel=114,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1178848000}},award={type=0,id=3790,count=1,bind=1},},--道颠成就章Lv84
{needLevel=115,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1226848000}},award={type=0,id=3791,count=1,bind=1},},--道颠成就章Lv85
{needLevel=116,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1275848000}},award={type=0,id=3792,count=1,bind=1},},--道颠成就章Lv86
{needLevel=117,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1325848000}},award={type=0,id=3793,count=1,bind=1},},--道颠成就章Lv87
{needLevel=118,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1376848000}},award={type=0,id=3794,count=1,bind=1},},--道颠成就章Lv88
{needLevel=119,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1428848000}},award={type=0,id=3795,count=1,bind=1},},--道颠成就章Lv89
{needLevel=120,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1481848000}},award={type=0,id=3796,count=1,bind=1},},--道颠成就章Lv90
{needLevel=121,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1535848000}},award={type=0,id=3797,count=1,bind=1},},--道颠成就章Lv91
{needLevel=122,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1590848000}},award={type=0,id=3798,count=1,bind=1},},--道颠成就章Lv92
{needLevel=123,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1646848000}},award={type=0,id=3799,count=1,bind=1},},--道颠成就章Lv93
{needLevel=124,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1703848000}},award={type=0,id=3800,count=1,bind=1},},--道颠成就章Lv94
{needLevel=125,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1761848000}},award={type=0,id=3801,count=1,bind=1},},--道颠成就章Lv95
{needLevel=126,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1820848000}},award={type=0,id=3802,count=1,bind=1},},--道颠成就章Lv96
{needLevel=127,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1880848000}},award={type=0,id=3803,count=1,bind=1},},--道颠成就章Lv97
{needLevel=128,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=1941848000}},award={type=0,id=3804,count=1,bind=1},},--道颠成就章Lv98
{needLevel=129,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2003848000}},award={type=0,id=3805,count=1,bind=1},},--道颠成就章Lv99
{needLevel=130,needCircle=0,shwoEffId =1839,consume={{type=11,id=0,count=2066848000}},award={type=0,id=3806,count=1,bind=1},},--道颠成就章LvMax





            
            },
        ------------------
        },
    
    }
