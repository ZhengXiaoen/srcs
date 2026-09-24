-- 邮件信息配置
--#include "..\..\language\LangCode.txt" once

mailInfoCfg = {
	{
		-- 合服活动
		id = 1,
		sender = "系统",
		opendays = 3,								-- 开区天数：配置0=不限制，开区开始发送到第2天为止(不能跟合区天数同时>0)
		mergedays = 0,							-- 合区天数：配置0=不限制，合区开始发送到第2天为止(不能跟开区天数同时>0)
		level = 0,									-- 等级需求：配置0=不限制，(50)=50级以上
		cricle = 0,									-- 转生需求：配置0=不限制，(1)=1转以上
		sendtime = {hour = 11, minute = 4,},	-- 发送时间：配置0=不限制，(12点,30分钟)=12点半整
		interval = 2,								-- 间隔时间：最少间隔2小时，(单位时间小时)
		times = 0,									-- 发送次数：配置0=不限制
		title = Lang.MailTitle[7],
		desc = Lang.MailDesc[10],
		--rewards = {{type=11,id=0,count=10000,},{type=5,id=0,count=10000,},},
		rewards = {
			{type = 15 ,id = 0,count = 160},
			{type = 0 ,id = 470,count = 10,},
			{type = 0 ,id = 1,count = 1},
		},
	},
	{
		-- 新功能预告
		id = 2,
		sender = "系统",
		opendays = 0,								-- 开区天数：配置0=不限制，开区开始发送到第2天为止(不能跟合区天数同时>0)
		mergedays = 0,							-- 合区天数：配置0=不限制，合区开始发送到第2天为止(不能跟开区天数同时>0)
		level = 0,									-- 等级需求：配置0=不限制，(50)=50级以上
		cricle = 0,									-- 转生需求：配置0=不限制，(1)=1转以上
		sendtime = {hour = 18, minute = 30,},	-- 发送时间：配置0=不限制，(12点,30分钟)=12点半整
		interval = 8,								-- 间隔时间：最少间隔2小时，(单位时间小时)
		times = 10,									-- 发送次数：配置0=不限制
		title = Lang.MailTitle[8],
		desc = Lang.MailDesc[11],
		rewards = {},
	},
}