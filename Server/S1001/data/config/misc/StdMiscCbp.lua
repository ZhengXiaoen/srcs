
--该文件主要用来打包服务器配置到cbp，供客户端统一读取
--注意，因路径原因，服务器不能包含该文件

--#include "..\..\..\jxServer\build\LogicServer\data\config\item\BagConfig.lua"    --加载背包配置

StdMiscCbp = {
	OpenGridTimes = BagConfig.OpenGridTimes,
	OpenGridGiveExp = BagConfig.OpenGridGiveExp,
}