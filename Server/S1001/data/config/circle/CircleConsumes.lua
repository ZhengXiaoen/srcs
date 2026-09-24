--#include "..\..\language\LangCode.txt"
--转生修为配置,转生等级配置
Circle = {
        
        activeLevel = 80, --开放等级
        Protect = {{type = 15, id = 0, count = 30}, }, --100%成功需要消耗的元宝
        --等级兑换转生修为
        CircleSoulExchange = {
            
            {reqLevel = 80, chgLevel = 79, rate = 100, addSoul = 0, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --1
            {reqLevel = 81, chgLevel = 80, rate = 100, addSoul = 500, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --2
            {reqLevel = 82, chgLevel = 81, rate = 100, addSoul = 555, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --3
            {reqLevel = 83, chgLevel = 82, rate = 100, addSoul = 608, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --4
            {reqLevel = 84, chgLevel = 83, rate = 100, addSoul = 662, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --5
            {reqLevel = 85, chgLevel = 84, rate = 100, addSoul = 715, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --6
            {reqLevel = 86, chgLevel = 85, rate = 100, addSoul = 768, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --7
            {reqLevel = 87, chgLevel = 86, rate = 100, addSoul = 845, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --8
            {reqLevel = 88, chgLevel = 87, rate = 100, addSoul = 920, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --9
            {reqLevel = 89, chgLevel = 88, rate = 100, addSoul = 998, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --10
            {reqLevel = 90, chgLevel = 89, rate = 100, addSoul = 1072, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --11
            {reqLevel = 91, chgLevel = 90, rate = 100, addSoul = 1150, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --12
            {reqLevel = 92, chgLevel = 91, rate = 100, addSoul = 1240, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --13
            {reqLevel = 93, chgLevel = 92, rate = 100, addSoul = 1333, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --14
            {reqLevel = 94, chgLevel = 93, rate = 100, addSoul = 1422, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --15
            {reqLevel = 95, chgLevel = 94, rate = 100, addSoul = 1508, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --16
            {reqLevel = 96, chgLevel = 95, rate = 100, addSoul = 1595, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --17
            {reqLevel = 97, chgLevel = 96, rate = 100, addSoul = 1695, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --18
            {reqLevel = 98, chgLevel = 97, rate = 100, addSoul = 1795, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --19
            {reqLevel = 99, chgLevel = 98, rate = 100, addSoul = 1889, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --20
            {reqLevel = 100, chgLevel = 99, rate = 100, addSoul = 1981, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --21
            {reqLevel = 101, chgLevel = 100, rate = 100, addSoul = 2070, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --22
            {reqLevel = 102, chgLevel = 101, rate = 100, addSoul = 2265, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --23
            {reqLevel = 103, chgLevel = 102, rate = 100, addSoul = 2450, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --24
            {reqLevel = 104, chgLevel = 103, rate = 100, addSoul = 2628, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --25
            {reqLevel = 105, chgLevel = 104, rate = 100, addSoul = 2800, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --26
            {reqLevel = 106, chgLevel = 105, rate = 100, addSoul = 2968, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --27
            {reqLevel = 107, chgLevel = 106, rate = 100, addSoul = 3326, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --28
            {reqLevel = 108, chgLevel = 107, rate = 100, addSoul = 3670, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --29
            {reqLevel = 109, chgLevel = 108, rate = 100, addSoul = 4000, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --30
            {reqLevel = 110, chgLevel = 109, rate = 100, addSoul = 4318, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --31
            {reqLevel = 111, chgLevel = 110, rate = 100, addSoul = 4620, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --32
            {reqLevel = 112, chgLevel = 111, rate = 100, addSoul = 5383, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --33
            {reqLevel = 113, chgLevel = 112, rate = 100, addSoul = 6090, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --34
            {reqLevel = 114, chgLevel = 113, rate = 100, addSoul = 6750, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --35
            {reqLevel = 115, chgLevel = 114, rate = 100, addSoul = 7360, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --36
            {reqLevel = 116, chgLevel = 115, rate = 100, addSoul = 7935, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --37
            {reqLevel = 117, chgLevel = 116, rate = 100, addSoul = 8340, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --38
            {reqLevel = 118, chgLevel = 117, rate = 100, addSoul = 8710, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --39
            {reqLevel = 119, chgLevel = 118, rate = 100, addSoul = 9050, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --40
            {reqLevel = 120, chgLevel = 119, rate = 100, addSoul = 9360, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --41
            {reqLevel = 121, chgLevel = 120, rate = 100, addSoul = 9650, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --42
            {reqLevel = 122, chgLevel = 121, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --43
            {reqLevel = 123, chgLevel = 122, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --44
            {reqLevel = 124, chgLevel = 123, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --45
            {reqLevel = 125, chgLevel = 124, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --46
            {reqLevel = 126, chgLevel = 125, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --47
            {reqLevel = 127, chgLevel = 126, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --48
            {reqLevel = 128, chgLevel = 127, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --49
            {reqLevel = 129, chgLevel = 128, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --50
            {reqLevel = 130, chgLevel = 129, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --51
            {reqLevel = 131, chgLevel = 130, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --52
            {reqLevel = 132, chgLevel = 131, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --53
            {reqLevel = 133, chgLevel = 132, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --54
            {reqLevel = 134, chgLevel = 133, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --55
            {reqLevel = 135, chgLevel = 134, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --56
            {reqLevel = 136, chgLevel = 135, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --57
            {reqLevel = 137, chgLevel = 136, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --58
            {reqLevel = 138, chgLevel = 137, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --59
            {reqLevel = 139, chgLevel = 138, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --60
            {reqLevel = 140, chgLevel = 139, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --61
            {reqLevel = 141, chgLevel = 140, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --62
            {reqLevel = 142, chgLevel = 141, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --63
            {reqLevel = 143, chgLevel = 142, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --64
            {reqLevel = 144, chgLevel = 143, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --65
            {reqLevel = 145, chgLevel = 144, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --66
            {reqLevel = 146, chgLevel = 145, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --67
            {reqLevel = 147, chgLevel = 146, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --68
            {reqLevel = 148, chgLevel = 147, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --69
            {reqLevel = 149, chgLevel = 148, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --70
            {reqLevel = 150, chgLevel = 149, rate = 100, addSoul = 9988, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --71
            {reqLevel = 151, chgLevel = 150, rate = 100, addSoul = 9938, consumes = {{type = 6, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}, }, Gold = {{type = 5, id = 0, count = 0, logs = {323, Lang.LogTips.l00196}}}, }, --72
        
        
        },
        --转生需求配置, 2017/06/01 zer 更新, 转生等级需求统一改为80级  2018/6/20 开启15转
        CircleConsumes = {
            
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 1588, logs = {323, Lang.LogTips.l00196}}}}, --1转,15.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 3888, logs = {323, Lang.LogTips.l00196}}}}, --2转,38.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 9888, logs = {323, Lang.LogTips.l00196}}}}, --3转,98.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 15888, logs = {323, Lang.LogTips.l00196}}}}, --4转,158.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 26888, logs = {323, Lang.LogTips.l00196}}}}, --5转,268.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 38888, logs = {323, Lang.LogTips.l00196}}}}, --6转,388.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 68888, logs = {323, Lang.LogTips.l00196}}}}, --7转,688.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 158888, logs = {323, Lang.LogTips.l00196}}}}, --8转,1588.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 258888, logs = {323, Lang.LogTips.l00196}}}}, --9转,2588.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 369888, logs = {323, Lang.LogTips.l00196}}}}, --10转,3698.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 588888, logs = {323, Lang.LogTips.l00196}}}}, --11转,5888.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 888888, logs = {323, Lang.LogTips.l00196}}}}, --12转,8888.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 1258888, logs = {323, Lang.LogTips.l00196}}}}, --13转,12588.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 1768888, logs = {323, Lang.LogTips.l00196}}}}, --14转,12588.88元
            {reqLevel = 80, chgLevel = 0, rate = 1, consumes = {{type = 22, id = 0, count = 2588888, logs = {323, Lang.LogTips.l00196}}}}, --15转,12588.88元

        
        
        
        
        
        
        
        
        
        
        },
};
