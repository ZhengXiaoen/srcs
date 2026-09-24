--购买盾牌
MiscsImplement.BuyShield = function( sysarg, msgid, packet )
	
	local nOpenDay = System.getDaysSinceOpenServer()
	local var = Actor.getStaticVar(sysarg)
	
	if nOpenDay < 3 then
		return
	elseif var.GiveShieldFlag then
		return
	end
	
	local config = ActivityGiftConfig.EquipShieldCfg
	if not config then return end
	
	if Actor.getMoneyCount(sysarg,3) < config.needYuanBao then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf286,config.needYuanBao),256);
		return 
	end
	
	if not Awards.CheckBagGridCount(sysarg,config.award) then
		return
	end
	
	Actor.changeMoney(sysarg,3,-config.needYuanBao,GameLog.cBuyShieldMoney,"购买盾牌消费元宝")
	
	Awards.Give(sysarg,config.award,1015,"购买盾牌礼包")
	
	var.GiveShieldFlag = 1
	
	local netPack = DataPack.allocPacket(sysarg, 139,126)
	DataPack.writeByte(netPack, 1)  -- 1：盾牌
	DataPack.writeByte(netPack, 0)
	DataPack.flush(netPack)	
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf287,Actor.getName(sysarg),config.needYuanBao),2048)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuyShield, MiscsImplement.BuyShield)