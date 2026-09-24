--福利官员

NpcDialog[402] = {}
NpcDialog[402].cfg = 
{
    {money=88,rate=1000,}, --88元宝 百分之十增益
    {money=188,rate =3000,}, 
    {money=288,rate=5000,},
    {money=488,rate=7000,},
    {money=688,rate=10000,},
}
NpcDialog[402].main = function(sysarg)


	
	local echo = [[

  <(c0xFF00c0ff)乞丐:>
   <(c0xFFeabc78)少年,我看你骨骼惊奇,是万中无一的练武奇才,正所谓我不入地狱谁入地狱,这里有提升功力的方法,与你有缘,只收你一点元宝><(idecoLine#350)>
   	         <(c0xFF00ffff)《可瞬间提升以下属性的百分比》>
       <(c0xFFeabc78)提升：><(c0xFF00c0ff)生命值、魔法值、抗暴力、合击伤害固定值>
                    <(c0xFFeabc78)友情提示:只在跨服竞技场中有效>
]]
    local cfg = NpcDialog[402].cfg
     for i = 1,#cfg do
        local fValue = cfg[i].rate / 10000
        echo =echo..string.format("                 <(c0xFFff9000)花费><(c0xFF00FF00)%d><(c0xFFff9000)元宝,获得><(c0xFF00FF00)%d%s><(c0xFFff9000)增益> <购买/@onBuySingle,%d>\\",cfg[i].money,tonumber(fValue * 100),"%",i)
        
     end
	
	 return echo;
end
NpcDialog[402].onBuySingle= function(sysarg,nIndex)
       nIndex=  tonumber(nIndex)
       local cfg = NpcDialog[402].cfg
       if nIndex <= 0 or nIndex > #cfg then return end
      
     
       if Actor.getSingleDameRate(sysarg) >= cfg[nIndex].rate then
            Actor.sendTipmsg(sysarg,"您已购买了更高级别的增益效果,无需再次购买!",ttFlyTip);
            return
       end
    
       if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg[nIndex].money then
         Actor.sendTipmsg(sysarg,"元宝不足,无法购买",ttFlyTip);
            return
       end
        if  Actor.setSingleDamgeRate(sysarg,cfg[nIndex].rate,-cfg[nIndex].money) then
             Actor.changeMoney(sysarg, mtYuanbao, -cfg[nIndex].money, 2788, "个人竞技增益")
             Actor.sendTipmsg(sysarg,"增益成功",ttFlyTip);
              return
        end
        Actor.sendTipmsg(sysarg,"增益失败",ttFlyTip);
      
      
end
