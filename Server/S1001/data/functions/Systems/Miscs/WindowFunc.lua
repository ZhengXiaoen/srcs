--弹窗
function SendBox(sysarg,str,leftTime)--leftTime用毫秒
	local okBtn = string.format("%s/opennewone_sureFun", "确定")
	local cancelBtn = string.format("%s/opennewone_cancelFun", "取消")
	if leftTime ~=nil then 
		leftTime = tonumber(leftTime)
		Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL,leftTime,0,NULL,0,1)
	else 
		Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
	end
end

function opennewone_sureFun(sysarg)
	if get_taskflags_val(sysarg) == 90 then	--如果主线任务ID == 90, 就传送到装备回收NPC, 下面定时器写的是调用已有的 26号的  4 
		System.telportScene(sysarg, 9, 116, 153)
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.HelpToStrongIndex = 4
		Actor.addTimer(sysarg,26,1000)
	else
		System.telportScene(sysarg, 9, 143, 157)
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.HelpToStrongIndex = 10
		Actor.addTimer(sysarg,26,1000)
	end
end

--不能删除，取消无动作
function opennewone_cancelFun(sysarg)

end