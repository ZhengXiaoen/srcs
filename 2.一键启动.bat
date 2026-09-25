REM 调试版与发布版端口冲突(22000/32000/36000)，会导致DBCenter不稳定/DBServer掉线，进而行会创建超时。仅保留发布版。
REM start /d"D:\SRCS\Server\common\x64" DBCenterServer64_D.exe
start /d"D:\SRCS\Server\common\x64" DBCenterServer64_R.exe
start /d"D:\SRCS\Server\common\x64" DBServer64_R.exe
start /d"D:\SRCS\Server\common\x64" LocalLogServer64_R.exe
start /d"D:\SRCS\Server\common\x64" LoggerServer64_R.exe
start /d"D:\SRCS\Server\common\x64" NameServer64_R.exe
start /d"D:\SRCS\Server\common\x64" SessionServer64_R.exe
REM debug_process.exe是32位看门狗(重启LogicServer)，但被放在64位目录里会优先加载64位msvcr100.dll，导致0xc000007b闪退；本64位服务端用不到它，禁用以消除每次启动的崩溃弹窗。
REM start /d"D:\SRCS\Server\S1001\x64" debug_process.exe
start /d"D:\SRCS\Server\S1001\x64" GateServer64_R.exe
start /d"D:\SRCS\Server\S1001\x64" LogicServerCQ64_R.exe
REM 与上面的逻辑服争抢同一端口40001(报错10048),始终绑定失败并刷错误日志。禁用冗余实例。
REM start /d"D:\SRCS\Server\S1001\x64" LogicServerCQ64_R99.exe
