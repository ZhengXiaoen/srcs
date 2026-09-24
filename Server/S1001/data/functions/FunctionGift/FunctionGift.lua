--功能礼包
--最多31个任务条件
local FunctionGiftCfg =
{
    task =
    {
        {
            name = "激活战将",
        },
        {
            name ="激活护符",
        },
        {
           name= "激活翅膀",
        },
        {
            name="强化任意装备+1",
        },
        {
            name="完成id为85的任务",
        },
        {
            name="加入/创建行会",
        },
    },
--奖励道具
    award =
    {
        {type=0,item_id =628,count=1,bind=1,},
        {type=0,item_id =629,count=1,bind=1,},
        {type=0,item_id =630,count=1,bind=1,},
        {type=0,item_id =631,count=1,bind=1,},
        {type=0,item_id =632,count=1,bind=1,},
        {type=0,item_id =633,count=1,bind=1,},
    },
}


--设置功能礼包完成状态
function OnCompleteGiftTask(sysarg,nIndex)
    if nIndex < 0 or nIndex > 32 then
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.gifttask == nil then var.gifttask = 0 end
    var.gifttask = System.setIntBit(var.gifttask,nIndex,1)
   -- print("完成功能礼包任务:"..nIndex.."var.gifttask:"..var.gifttask)

end
--领取功能礼包
function GiveCompleteGiftTask(sysarg,msgid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.gifttask == nil then var.gifttask = 0 end
    if System.getIntBit(var.gifttask,31) == 1 then
         Actor.sendTipmsg(sysarg, "已经领取过奖励了，无法再次领取！", ttFlyTip)
        return
    end
    --判定是否完成
    for i =1,table.getn(FunctionGiftCfg.task) do
        if System.getIntBit(var.gifttask,i-1) == 0 then
             Actor.sendTipmsg(sysarg, "所有任务未完成，无法领取奖励！", ttFlyTip)
            return
        end
    end
    local award = FunctionGiftCfg.award
    local nCount = 0

    for i =1,table.getn(award) do
        nCount = nCount + award[i].count
    end
    if Item.getBagEmptyGridCount(sysarg) < nCount then
         Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
         return
    end
    for i =1,table.getn(award) do
        Actor.addItem(sysarg,award[i].item_id,0,0,award[i].count,award[i].bind,0,"功能礼包",GameLog.cCompleteGift)
    end
    --设置已领取标记
    var.gifttask = System.setIntBit(var.gifttask,31,1)
    Actor.sendTipmsg(sysarg, "领取奖励成功！", ttFlyTip)
    GetGiftTask(sysarg)
end

--获取功能礼包开启状态
function GetGiftTask(sysarg,msgid,packet)
    local var = Actor.getStaticVar(sysarg)
    if var.gifttask == nil then var.gifttask = 0 end
    local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetFunctionGiftInfo)
	DataPack.writeUInt(netPack, var.gifttask)--下发过了多长时间。
	DataPack.flush(netPack)
end

