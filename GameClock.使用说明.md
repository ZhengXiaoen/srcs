# 游戏时间

日常使用以下入口：

1. 双击 2.一键启动.bat。首次启动把电脑时间和 Server/S1001/LogicServer.txt 的开服时间设为启动当天 10:00；以后使用你手动填写的 `nextStart`。需要同意 Windows 的管理员权限提示。
2. 游玩结束后双击 3.一键停止.bat。脚本关闭游戏服务器、记录最后游戏时间，并恢复电脑的现实时间。它不自动决定下次启动时间。
3. 双击 4.查看游戏时间.bat 可只读查看当前记录。
4. 游戏运行时如果只有数据库服务掉线，双击 2-1.DB掉线启动.bat。脚本会检查逻辑服和时间记录，不会重复启动已经运行的数据库服务。

请用上述入口启停服务器。运行中手动关闭进程、电脑重启或自动校时打断游戏时间时，脚本会停止推断最后游戏时间，防止下次启动把游戏时间拨回过去。遇到提示后保留文件和日志，不要直接删除时间记录。

运行时生成的 GameClock.state.json 是下一次启动时间记录，GameClock.LogicServer.original.txt 是首次修改前的开服配置备份；这两个文件不会提交到 Git。启动前请关闭 Windows 的“自动设置时间”；如果在虚拟机内运行，也请关闭虚拟机与宿主机的时间同步。运行期间不要手动校时。脚本发现 Windows 自动校时服务正在运行时会中止启动；关服时若发现时间跳变，会保留异常记录，等待你根据游戏日志恢复。

## 手动填写下次时间

正常关服后，`GameClock.state.json` 会写入 `lastStopGameTime`（最后游戏时间），并把 `nextStart` 留为 `null`。确认服务器已关闭、电脑时间已恢复后，先复制这个文件留作备份，再只把 `nextStart` 改为你希望下次启动使用的时间，格式为 `yyyy-MM-dd HH:mm:ss`。填写的时间不能早于 `lastStopGameTime`；如果不想额外推进，可以填成相同时间。未填写时启动脚本会拒绝启动。

不要修改 `Server/S1001/LogicServer.txt` 中的 `ServerOpenTime`，也不要修改时间记录中的 `openTime`、`configHash` 或 `lastStopGameTime`。

## 异常中断后恢复

如果服务器进程意外退出，或电脑重启后脚本要求恢复记录，先确认所有游戏服务器进程都已退出。根据游戏日志中最后确认的游戏时间，执行：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "D:\SRCS\GameClock.ps1" -Action Recover -LastGameTime "2026-09-25 18:30:00"
```

把示例时间换成日志中的实际时间。恢复脚本只会把它保存为 `lastStopGameTime`，并把 `nextStart` 留空，等待你按上节手动填写。如果电脑在游戏期间重启或脚本提示无法自动还原现实时间，先在 Windows 设置中校准电脑时间，再在上述命令末尾加 `-ClockIsReal`。如果停服记录已保存、但电脑时间尚未恢复，校准后仅运行 `-Action Recover -ClockIsReal`。时间记录和原始配置备份都应保留。
