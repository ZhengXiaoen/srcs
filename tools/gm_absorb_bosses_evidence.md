# GM 一键吸附的服务器接口核实

目标为 `Server/S1001/x64/LogicServerCQ64_R.exe`，SHA-256：
`db25163cbeb87623cd075f85189a5a0a2bdea6c71e20d57fa73f948f437b5456`。
使用 REA 的 Ghidra 12.1.4 做静态分析，未重启、注入或操作运行服务器。
以下结论是静态代码依据，实际游戏操作仍需更新脚本后检查。

随附 `.map` 的地址与当前程序不匹配。例如旧 `monsterEnterScene`
地址 `0x140323210` 当前是跳转表。实际入口从当前程序的 Lua 注册字符串及
回调指针恢复，并通过 REA 解编译核实，不能直接按旧 `.map` 调用。

| Lua 接口 | 当前入口 / 回调 | 核实结果 |
| --- | --- | --- |
| `Actor.getGMLevel` | `0x1403152e0` / `0x14035ab80` | 接收玩家并返回 GM 等级；新命令要求大于 0。 |
| `LuaHelp.getSceneMonsterListByType` | `0x14032cde0` | 枚举传入场景指针的怪物实体，返回可供 Actor 接口直接使用的 lightuserdata 指针，筛选实体类型 1 和所给怪物类型；Boss 为 4。没有自动过滤死亡，脚本另行检查。 |
| `Actor.getMonsterOwner` | `0x140310be0` / `0x1403535e0` | 从怪物取得召唤主人的句柄；新命令跳过有主人的怪物。 |
| `Actor.moveToEntity` | `0x140315540` / `0x14035ad00` | 双方实体必须为玩家（类型 0），不能用于拉动 Boss。 |
| `Fuben.monsterEnterScene` | `0x140323a60` / `0x140365840` | 拒绝已进入场景的怪物。入场还设置配置、刷新关联及存活时限，不适用于此需求。 |
| `Actor.enterScene` | `0x14030a2b0` / `0x14034ff30` | 不限制为玩家。使用实体自身所在副本并按场景 ID 找场景，调用 `0x1402f77a0`。 |

最终调用 `Actor.enterScene(monster, sceneId, x, y, 0, 0)`。该路径进入
`0x140300120` → `0x1402ff350` (`CScene::EnterScene`)。
当实体当前场景和目标场景相同，仅调用网格的 `MoveTo` (`0x1402f2ad0`)
更新位置并发出位置广播，不离场，不执行仅在换场景时发生的出生点设置。
脚本在调用前验证场景指针相同，避免相同地图 ID 的其他副本受到影响。
没有创建/销毁怪物、写入血量、奖励、刷新索引或存活时限的调用。
周边位置被阻挡时尝试 1 至 3 格范围内其他位置，并提示成功及未能移动的数量。

关键 REA Evidence：

- `ev_e54a2c6e4a5faff40de87fddcbba2dcc2509c9950ac7778ad686ec808fadc75d`：实际 Lua 回调及参数类型。
- `ev_c07f612cbb2067f6c2e6d1dedddb902ba96f2e8a81ecb4fe32d942b1640fa882`：GM 权限、按场景 Boss 列表、召唤归属，以及两个不适用移动接口的限制。
- `ev_1b0d69625fca5686fc722a96150661ef1ce41534a648e9e0f4aed54f329d2cea`：`Actor.enterScene` 的 Lua 参数转换。
- `ev_036e17a9d7a997bbe81a4b1a8d284459e3b976661fc9cd7fb5a5ffc6868c7bcb`：实体原副本内的移动路径。
- `ev_dc7f277192a83fab984dd7dbf413836df37af1dbac7b0636e76808f381317c95`：场景相同时只移动，换场景才离场及设置出生点；怪物入场配置和存活时限写入路径。
- `ev_715a94cd67ee815d3e840af7e5177adb74e846f4c0c9f075562767cf50cbcd6c`：坐标范围为 0 时直接进入场景移动分支。
- `ev_9535444008b5445bae67ebebc50280bbbcd3a47829c46c5c149984c3c76d0f5f`：网格移动的坐标写入和实体广播路径。

行为测试：`py -3 tools/test_gm_absorb_bosses.py --lua-path tools/fixtures/pickup-test-deps`。
覆盖 GM 权限、角色死亡、场景实例隔离、死亡/普通/召唤怪排除、重复句柄、
障碍及地图边缘、怪物换场景中止、空列表，以及原血量/奖励/刷新/出生点/存活时限保留。

客户端验证：`py -3 tools/test_gm_absorb_client.py`，覆盖“显示头衔”右侧的按钮位置、
单次点击只发送一次命令、原有六个按钮的命令以及事件注册/移除。
`patch_gm_absorb_bosses.py` 核对只有 GM 面板的两个方法及新增字符串发生变化，
其他方法、类定义、图形和资源保留原字节。

2026-10-12 使用当前程序与完整修改后脚本进行隔离启动：所有服务地址改为本机独立端口，
未连接真实数据库、会话服务或玩家。日志出现 `StartEngine: finish!` 和
“逻辑服务器启动成功”，没有 Lua 编译错误或脚本异常。
完整 `GlobalFunction.lua` 合并代码也通过 Lua 5.1 离线编译；新增函数未占用顶层局部变量。
服务器及客户端共 14 项测试通过。运行中的原服务器保持原进程。
游戏内的按钮显示和真实吸附仍需更新客户端并重载脚本后检查。

## 最后接口兼容性检查

`@func` 当前命令表使用权限等级 9，回调 `0x1401b0610` 把当前玩家指针
放在参数列表第一位，再在全局 NPC 的 Lua 环境直接调用指定全局函数。
该通道没有调用 `OnNpcEvent`，因此不受只服务普通 NPC 协议的
`GlobalNpcFunctionsFilter` 限制，不需要将 GM 命令开放给普通 NPC 调用。

`LuaHelp` 的数组写入 `0x14033aa80` 通过 `lua_pushlightuserdata`
(`0x1403ab9e0`，Lua 值类型 2) 填入已解析的实体指针，可直接交给 Actor API。
`Actor.isDeath` 的 `0x140314f30` → `0x14000d8e0` 支持怪物，检测当前血量属性为 0。
`Actor.getIntProperty` 的 `0x14030a950` 明确支持实体类型 1 的怪物属性读取。
`PROP_ENTITY_ID` 注册为 0；怪物入场配置 `0x140303cb0` 把用于查找怪物配置的
monster ID 写入属性 0。因此 `System.getMonsterTypeById` 的二次筛选不会把
运行实体句柄当成怪物配置 ID。坐标读取遵循现有 out 参数约定 `(sysarg, 0, 0)`。

补充 Evidence：

- `ev_1323a38ba8da738d38bdb9ab101bcadb07a763044ba16df87a5a41cea72b7b46`：func 命令表和权限 9。
- `ev_67b66d8c66e97dd2c01af87428ff3f68a975babc57a05d1f2a5bc4650241dd07`：func 直接调用及 lightuserdata。
- `ev_eb542cba8ba7624a5d24e8439faeb370d7432656ed01d6be4a3c71de90e3aca8`：怪物属性、死亡接口和 Lua global 函数执行。
- `ev_62dcaad7315a128b2649d5c32dc324941fa59e3f9b113f7fe720150aad2329e0`：怪物死亡判断的 HP 检查。
- `ev_1c575757cd0c27988bd3c9cac9de71a44f75afaf9ebdc3b7e922d3a0e4469630`：PROP_ENTITY_ID 常量注册为 0。
