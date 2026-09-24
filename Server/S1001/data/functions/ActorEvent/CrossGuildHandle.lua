CrossGuildPropCfg=  
{
    module = 
    {   
        --男外观
        {
            {id = 3,value = 278,},   --衣服
            {id = 41,value = 125,},   --武器
            {id = 43,value = 0,},   --翅膀，0代表不显示
        },
        --女外观
        {
            {id = 3,value = 279,},   --衣服
            {id = 41,value = 125,},   --武器
            {id = 43,value = 0,},   --翅膀，0代表不显示
        },

    },

    --属性
    prop = 
    {
        {type = 5, value =  508888, job = 1,}, --最大血增加
        {type = 7, value =  50888, job = 1,}, --最大蓝增加
        {type = 5, value =  208888, job = 2,}, --最大血增加
        {type = 7, value =  666666, job = 2,}, --最大蓝增加
        {type = 5, value =  288888, job = 3,}, --最大血增加
        {type = 7, value =  288888, job = 3,}, --最大蓝增加
        {type = 9, value =  18888, job = 1,}, --最小物攻
        {type = 11, value =  88888, job = 1,}, --最大物攻
        {type = 13, value =  18888, job = 2,}, --最小魔攻
        {type = 15, value =  88888, job = 2,}, --最大魔攻
        {type = 17, value =  18888, job = 3,}, --最小道攻
        {type = 19, value =  88888, job = 3,}, --最大道攻
        {type = 21, value = 21333,  job = 1,}, --最小物防
        {type = 23, value = 35555,  job = 1,}, --最大物防
        {type = 25, value = 21333,  job = 1,}, --最小魔防
        {type = 27, value = 35555,  job = 1,}, --最大魔防
        {type = 21, value = 21333,  job = 2,}, --最小物防
        {type = 23, value = 35555,  job = 2,}, --最大物防
        {type = 25, value = 21333,  job = 2,}, --最小魔防
        {type = 27, value = 35555,  job = 2,}, --最大魔防
        {type = 21, value = 45055,  job = 3,}, --最小物防
        {type = 23, value = 59277,  job = 3,}, --最大物防
        {type = 25, value = 45055,  job = 3,}, --最小魔防
        {type = 27, value = 59277,  job = 3,}, --最大魔防
        {type = 29, value = 1,}, --准确
    },
}

EventCallDispatcher.HandleCrossGuildProp = function (sysarg, args)
    local var = Actor.getDyanmicVar(sysarg)
    local calc = args[1]

    if var.damagerate  == nil then var.damagerate = 1 end
    local nRate = var.damagerate  
    local list_cfg = {}

    for i=1,#CrossGuildPropCfg.prop do
        local cfg = {}
        cfg.type = CrossGuildPropCfg.prop[i].type
        cfg.value = CrossGuildPropCfg.prop[i].value * var.damagerate
        cfg.job = CrossGuildPropCfg.prop[i].job
        if cfg.job == nil then cfg.job = 0 end
        table.insert(list_cfg,cfg)
    end
    LuaHelp.calcActorAttrs(sysarg, calc, list_cfg)

    local nIndex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX) + 1
    for i =1,#CrossGuildPropCfg.module[nIndex] do
        local cfg = CrossGuildPropCfg.module[nIndex][i]
        Actor.setIntProperty(sysarg,cfg.id,cfg.value)
    end
end




EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeCrossGuildProp, EventCallDispatcher.HandleCrossGuildProp) 
