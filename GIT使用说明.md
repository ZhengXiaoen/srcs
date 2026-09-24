# 核心 Lua 版本管理与回滚

仓库位置：`D:\SRCS`。主分支：`main`。初始基线标签：`lua-baseline-2026-09-24`。

该基线保存 **2026-09-24 建库时的当前文件状态**，不是充值活动修复前的版本。仓库仅在本机创建，没有配置远程地址或上传代码。

## 哪些内容会保存

| 范围 | 内容 |
| --- | --- |
| `Server/S1001/data/functions/` | 核心玩法 Lua 和随附文本说明 |
| `Server/S1001/data/config/` | Lua 数值配置及任务等静态文本、包含片段 |
| `Server/S1001/data/envir/` | 场景、副本、刷怪 Lua，以及必需的 `.txt`、`.inc` 配置 |
| `Server/S1001/data/language/` | Lua 和文本语言定义 |
| `Server/S1001/data/` 根级文件 | Lua 汇总入口、静态姓名表、`VSPDef.txt`、`fw.txt`、`fw_cross.txt` |
| 项目根级文件 | Git 规则、本说明、目录索引、代码索引 |

上述四个目录递归跟踪 `.lua`、`.inc`、`.txt`、`.md`。新增同类文件可正常提交；其他扩展名需要先明确加入 `.gitignore` 的允许范围。

日志、`runtime` 排行榜和运行状态、玩家数据库、服务程序、地图资源、图片、压缩包、机器人配置、网页、旧修复备份和验证产物不纳入此仓库。原文件仍在磁盘原处。

Lua 文件包含旧编码和 CRLF 换行。本仓库通过 `.gitattributes` 禁止文本自动转换，并仅在本仓库关闭 `core.autocrlf`，保证提交、取出时保持文件原始字节。

## 平时保存一个版本

在 PowerShell 中打开项目根目录：

```powershell
Set-Location 'D:\SRCS'
git status --short
git diff --stat
git add -A
git diff --cached --stat
git commit -m "说明这次修改的内容"
```

`git add -A` 只收集仓库允许范围内的新增、修改和删除。提交前查看差异，确认这次要保存的修改；不必把运行数据一起保存。

查看已保存的版本：

```powershell
git log --oneline --decorate -10
git tag --list
```

## 撤销某一次已提交的修改

先通过 `git status --short` 确认没有未保存改动，再执行 `git revert 提交号`。它会创建一笔反向提交，保留已有历史。`提交号` 取自上面的日志；遇到冲突时可用 `git revert --abort` 取消本次撤销。

## 把核心代码恢复到建库基线

先保存尚未提交的修改，再恢复代码，最后把恢复结果提交为一个新版本：

```powershell
Set-Location 'D:\SRCS'
git stash push --include-untracked -m "恢复Lua基线前的本地修改"
git restore --source=lua-baseline-2026-09-24 --staged --worktree -- Server/S1001/data
git diff --cached --stat
git commit -m "恢复核心Lua到2026-09-24基线"
```

`stash` 若提示没有本地改动，不会创建新的暂存备份。可以用 `git stash list` 查看实际保存了哪些备份；需要恢复某笔备份时，先确保工作区干净，再用 `git stash apply 'stash@{0}'`，其中编号替换为列表里对应的编号。备份在成功应用后仍保留。

只恢复某个文件时，将 `git restore` 最后的目录换成具体文件路径，例如 `Server/S1001/data/functions/player.lua`。恢复历史中的其他状态时，将基线标签替换为目标提交号。

上述恢复只作用于 Git 已跟踪的脚本与静态配置，不恢复玩家数据或已发邮件。Git 不会自动重启服务；消费榜等功能的代码回退还需兼顾当前运行数据格式，详见本地 [充值活动修复说明.md](D:/SRCS/充值活动修复说明.md)。

## 本地提交身份

建库时未检测到已配置的提交姓名和邮箱，本仓库使用 `Local Developer <local@localhost>`，不修改全局 Git 配置。如需显示你的姓名，可在本仓库设置：

```powershell
git config --local user.name "你的姓名"
git config --local user.email "你的邮箱"
```

后续每次重要修改都提交一次，才会新增可回滚的版本。`.git` 保存本地全部历史，备份此项目时应一并保留。
