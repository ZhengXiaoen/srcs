# 游戏时间

## 日常入口

| 根目录入口 | 操作 |
| --- | --- |
| `2.一键启动.bat` | 输入 1 或 2 并回车选择模式，再同意管理员权限提示；直接回车不会启动 |
| `3.一键停止.bat` | 关闭服务器，保存最后游戏时间；模式 1 同时恢复现实时间 |
| `4.查看游戏时间.bat` | 只读查看时间记录 |
| `2-1.DB掉线启动.bat` | 仅数据库掉线时补启动；检查逻辑服和记录，不重复启动已运行的数据库 |
| `3-1.一键重启.bat` | 先选择模式，再停止并启动；停止失败则取消，已关服时也可启动 |

- 模式 1：首次把电脑时间调到当天 `00:00:01`，以后从记录中的 `nextStart` 继续；重启从本次停止时间继续。
- 模式 2：始终使用当前电脑时间，不调整电脑时钟；时间早于开服时间或上次停服时间时拒绝启动。
- 两种模式首次均将 `Server/S1001/LogicServer.txt` 的 `ServerOpenTime` 设为当天 `00:00:01`，后续保留。该秒偏移避免引擎把开服当天算成第 2 天，无需清空角色或活动数据。

先启动 phpStudy。模式 1 切换或恢复时间时会重启本目录已运行的 Apache/PHP，避免登录返回 503。服务器窗口可查看 Lua 加载输出；发生异常时提示窗口保留，按任意键退出。

## 时间记录与注意事项

`GameClock.state.json` 保存游戏时间，`GameClock.LogicServer.original.txt` 备份首次修改前的开服配置，均不提交 Git。正常停服后，`lastStopGameTime` 和默认的 `nextStart` 都是最后游戏时间。

模式 1 使用前关闭 Windows 自动校时及虚拟机与宿主机时间同步；自动校时服务运行时会中止启动。模式 2 可保持自动校时。运行期间不要手动校时或关闭服务器进程；进程异常退出、电脑重启或时间跳变时，保留记录与日志并按下节恢复。

## 手动填写下次时间

仅影响模式 1：正常关服且电脑时间恢复后，备份 `GameClock.state.json`，只修改 `nextStart`，格式为 `yyyy-MM-dd HH:mm:ss`，不能早于 `lastStopGameTime`。

不要修改 `ServerOpenTime`，或记录中的 `openTime`、`configHash`、`lastStopGameTime`。

## 异常中断后恢复

确认所有游戏服务器进程已退出，用日志中最后确认的游戏时间替换示例时间：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "D:\SRCS\GameClock.ps1" -Action Recover -LastGameTime "2026-09-25 13:22:48"
```

恢复会将该时间同时保存为 `lastStopGameTime` 和 `nextStart`。电脑在游戏期间重启，或无法自动还原现实时间时，先在 Windows 中校准时间，再给上述命令加 `-ClockIsReal`。

若停服记录已保存、仅现实时间尚未恢复，校准后使用同一命令入口并只传 `-Action Recover -ClockIsReal`，无需 `-LastGameTime`。保留时间记录及原始配置备份。
