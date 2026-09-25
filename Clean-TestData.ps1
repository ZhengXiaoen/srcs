param(
    [string]$DbPassword,
    [string]$BackupDirectory
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$mysqlDir = Join-Path $root 'phpStudy\PHPTutorial\MySQL'
$mysql = Join-Path $mysqlDir 'bin\mysql.exe'
$mysqlAdmin = Join-Path $mysqlDir 'bin\mysqladmin.exe'
$mysqlDump = Join-Path $mysqlDir 'bin\mysqldump.exe'
$mysqld = Join-Path $mysqlDir 'bin\mysqld.exe'
$ini = Join-Path $mysqlDir 'my.ini'
$dataDir = Join-Path $mysqlDir 'data'
$runtime = Join-Path $root 'Server\S1001\data\runtime'
$startedMySql = $false
$oldPassword = [Environment]::GetEnvironmentVariable('MYSQL_PWD', 'Process')

function Invoke-MySql([string]$Sql) {
    $result = @(& $mysql '--protocol=tcp' '--host=127.0.0.1' '--port=3306' '--user=root' '--batch' '--skip-column-names' '--raw' '--default-character-set=utf8' "--execute=$Sql" 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "MySQL 查询失败：$($result -join ' ')" }
    return $result
}

function Get-Count([string]$Sql) {
    $result = @(Invoke-MySql $Sql)
    if ($result.Count -ne 1 -or [string]$result[0] -notmatch '^\d+$') {
        throw "无法核对数据库记录数：$Sql"
    }
    return [int64]$result[0]
}

function Assert-ServerStopped {
    $gameNames = @('DBCenterServer64_R.exe', 'DBCenterServer64_D.exe',
        'DBServer64_R.exe', 'NameServer64_R.exe', 'SessionServer64_R.exe',
        'LoggerServer64_R.exe', 'LocalLogServer64_R.exe',
        'LogicServerCQ64_R.exe', 'LogicServerCQ64_R99.exe',
        'GateServer64_R.exe', 'debug_process.exe')
    $running = @(Get-CimInstance Win32_Process | Where-Object {
        $gameNames -contains $_.Name -and $_.ExecutablePath -like "$root\Server\*"
    })
    if ($running.Count -gt 0) {
        throw "游戏服务仍在运行：$(($running.Name | Sort-Object -Unique) -join ', ')。请先运行 3.一键停止.bat。"
    }
}

function Assert-ClockResettable {
    $statePath = Join-Path $root 'GameClock.state.json'
    $originalPath = Join-Path $root 'GameClock.LogicServer.original.txt'
    $script:clockNeedsReset = Test-Path -LiteralPath $statePath
    if (-not $script:clockNeedsReset) {
        if (Test-Path -LiteralPath $originalPath) {
            throw '存在开服配置原件，但没有游戏时间记录；请先检查 GameClock 文件。'
        }
        return
    }
    if (-not (Test-Path -LiteralPath $originalPath)) {
        throw '缺少开服配置原件，无法把游戏时间恢复到首次开服状态。'
    }
    $state = Get-Content -LiteralPath $statePath -Raw | ConvertFrom-Json
    if ($state.phase -ne 'stopped' -or $state.needsRestore -ne $false -or
        $state.firstStart -ne $true) {
        throw '游戏时间记录尚未正常结算；请先运行 3.一键停止.bat 并检查 GameClock 文件。'
    }
    $hash = (Get-FileHash -LiteralPath $originalPath -Algorithm SHA256).Hash
    if ($hash -cne [string]$state.configHash) {
        throw '开服配置原件校验失败，已中止清理。'
    }
    $configPath = Join-Path $root 'Server\S1001\LogicServer.txt'
    $original = [IO.File]::ReadAllBytes($originalPath)
    $current = [IO.File]::ReadAllBytes($configPath)
    if ($original.Length -ne $current.Length) {
        throw '开服配置除时间外已有修改，已中止清理以免覆盖修改。'
    }
    $view = [Text.Encoding]::GetEncoding(28591).GetString($current)
    $matches = [regex]::Matches($view, '(?m)^[ \t]*ServerOpenTime[ \t]*=[ \t]*"(?<stamp>[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})"[ \t]*,')
    if ($matches.Count -ne 1 -or $matches[0].Groups['stamp'].Value -ne [string]$state.openTime) {
        throw '开服时间配置与运行记录不一致，已中止清理。'
    }
    $offset = $matches[0].Groups['stamp'].Index
    [Array]::Copy($original, $offset, $current, $offset, 19)
    if (-not [Linq.Enumerable]::SequenceEqual([byte[]]$original, [byte[]]$current)) {
        throw '开服配置除时间外已有修改，已中止清理以免覆盖修改。'
    }
}

function Start-LocalMySql {
    $listener = @(Get-NetTCPConnection -LocalPort 3306 -State Listen -ErrorAction SilentlyContinue)
    if ($listener.Count -eq 0) {
        $process = Start-Process -FilePath $mysqld -ArgumentList @("--defaults-file=$ini") `
            -WorkingDirectory (Join-Path $mysqlDir 'bin') -WindowStyle Hidden -PassThru
        $script:startedMySql = $true
        for ($i = 0; $i -lt 30; $i++) {
            Start-Sleep -Seconds 1
            if ($process.HasExited) { throw "MySQL 启动失败，退出码：$($process.ExitCode)" }
            $listener = @(Get-NetTCPConnection -LocalPort 3306 -State Listen -ErrorAction SilentlyContinue)
            if ($listener.Count -gt 0) { break }
            $process.Refresh()
        }
        if ($listener.Count -eq 0) { throw '等待本地 MySQL 启动超时。' }
    }
    $actual = @(Invoke-MySql 'SELECT @@datadir;')
    $expectedPath = [IO.Path]::GetFullPath($dataDir).TrimEnd('\', '/')
    $actualPath = [IO.Path]::GetFullPath(([string]$actual[0]).Replace('/', '\')).TrimEnd('\', '/')
    if ($actual.Count -ne 1 -or $actualPath -ine $expectedPath) {
        throw "3306 端口连接到其他数据目录：$actualPath；预期：$expectedPath。"
    }
}

function Assert-InitialRecords {
    $checks = @(
        @('cq_account.globaluser', "userid=16777216 AND account='__init_account_1'"),
        @('cq_name.charnames', "charid=2 AND charname='__init_actorid_0'"),
        @('cq_name.guildnames', "guildid=1 AND guildname='__init_guild_0'")
    )
    foreach ($check in $checks) {
        if ((Get-Count "SELECT COUNT(*) FROM $($check[0]) WHERE $($check[1]);") -ne 1) {
            throw "初始化记录缺失或改变：$($check[0])。已中止，避免清理错误数据库。"
        }
    }
}

function Get-TargetTables {
    # Only these actor tables hold player/game progress in the inspected schema.
    $actorTables = @(
        'accounts','actorbagitem','actorbinarydata','actorbrother','actorconsignment',
        'actordepotitem','actordmkjitem','actorequipitem','actorfriends','actorgemitem',
        'actorgifts','actorguild','actormagicitem','actormails','actormsg','actorpetitem',
        'actorpets','actorrelation','actors','actorvariable','brothgrouplist',
        'combatgame','combatrecord','diamond','friendchatmsg','friends','gamesetdata',
        'gemsuit','goingquest','guildevent','guildlist','guildskill','guildstore',
        'guildstorerecord','guildwar','guildwarhistory','jobcount','periodride',
        'petskills','repeatquest','skill','toprank','useritem','zycount'
    )
    $protected = @('filternames','gameserveraddress')
    $found = @(Invoke-MySql "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA='cq_actor' ORDER BY TABLE_NAME;")
    $difference = @($found | Where-Object { $actorTables -notcontains $_ -and $protected -notcontains $_ })
    $missing = @($actorTables | Where-Object { $found -notcontains $_ })
    if ($difference.Count -or $missing.Count) {
        throw "角色库结构与已核对版本不同。新增：$($difference -join ', ')；缺少：$($missing -join ', ')。请先检查脚本。"
    }
    $logTables = @(Invoke-MySql "SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA IN ('cq_log','cq_locallog') AND TABLE_NAME LIKE 'log\\_%' ORDER BY TABLE_SCHEMA,TABLE_NAME;")
    $otherLogTables = @(Invoke-MySql "SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA IN ('cq_log','cq_locallog') AND TABLE_NAME NOT LIKE 'log\\_%';")
    if ($otherLogTables.Count) { throw "发现未经核对的日志表：$($otherLogTables -join ', ')。" }
    $tables = @($actorTables | ForEach-Object { "cq_actor.$_" })
    $tables += @('cq_account.csrank','cq_account.useramount','cq_account.useritem','cq_account.vaseries')
    $tables += $logTables
    return $tables
}

function Get-TableCounts([string[]]$Tables) {
    $statements = @($Tables | ForEach-Object { "SELECT '$_',COUNT(*) FROM $_" })
    $rows = @(Invoke-MySql (($statements -join ';') + ';'))
    $counts = @{}
    foreach ($row in $rows) {
        $parts = ([string]$row).Split("`t")
        if ($parts.Count -ne 2 -or $parts[1] -notmatch '^\d+$') { throw "无法读取表记录数：$row" }
        $counts[$parts[0]] = [int64]$parts[1]
    }
    if ($counts.Count -ne $Tables.Count) { throw '部分表记录数未能读取。' }
    return $counts
}

try {
    Assert-ServerStopped
    Assert-ClockResettable
    foreach ($file in @($mysql,$mysqlAdmin,$mysqlDump,$mysqld,$ini)) {
        if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "缺少程序或配置：$file" }
    }
    if (-not $DbPassword) {
        $api = [IO.File]::ReadAllText((Join-Path $root 'web\api.php'))
        $match = [regex]::Match($api, 'mysql_connect\(\s*"127\.0\.0\.1"\s*,\s*"root"\s*,\s*"(?<password>[^\"]+)"')
        if (-not $match.Success) { throw '无法从 web/api.php 读取数据库密码，请使用 -DbPassword 参数。' }
        $DbPassword = $match.Groups['password'].Value
    }
    [Environment]::SetEnvironmentVariable('MYSQL_PWD', $DbPassword, 'Process')
    Start-LocalMySql
    Assert-InitialRecords
    $tables = @(Get-TargetTables)
    $before = Get-TableCounts $tables
    $accountCount = Get-Count "SELECT COUNT(*) FROM cq_account.globaluser WHERE userid<>16777216 OR account<>'__init_account_1';"
    $charCount = Get-Count "SELECT COUNT(*) FROM cq_name.charnames WHERE charid<>2 OR charname<>'__init_actorid_0';"
    $guildCount = Get-Count "SELECT COUNT(*) FROM cq_name.guildnames WHERE guildid<>1 OR guildname<>'__init_guild_0';"

    if (-not $BackupDirectory) {
        $BackupDirectory = Join-Path $root ('清理备份\' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
    }
    $BackupDirectory = [IO.Path]::GetFullPath($BackupDirectory)
    if (-not (Test-Path -LiteralPath $BackupDirectory)) { New-Item -ItemType Directory -Path $BackupDirectory -Force | Out-Null }
    $dumpFile = Join-Path $BackupDirectory 'game-databases.sql'
    if (Test-Path -LiteralPath $dumpFile) { throw "备份文件已存在，未覆盖：$dumpFile" }
    & $mysqlDump '--protocol=tcp' '--host=127.0.0.1' '--port=3306' '--user=root' `
        '--default-character-set=utf8' '--lock-all-tables' '--add-drop-database' `
        '--databases' 'cq_account' 'cq_actor' 'cq_name' 'cq_log' 'cq_locallog' `
        "--result-file=$dumpFile" 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $dumpFile) -or (Get-Item $dumpFile).Length -eq 0) {
        throw '数据库备份失败；未清理任何记录。'
    }
    if (Test-Path -LiteralPath $runtime) {
        Copy-Item -LiteralPath $runtime -Destination (Join-Path $BackupDirectory 'runtime') -Recurse -Force
    }
    foreach ($name in @('GameClock.state.json','GameClock.LogicServer.original.txt','Server\S1001\LogicServer.txt')) {
        $source = Join-Path $root $name
        if (Test-Path -LiteralPath $source) {
            Copy-Item -LiteralPath $source -Destination (Join-Path $BackupDirectory ($name -replace '[\\/]','__')) -Force
        }
    }
    Write-Host "备份完成：$BackupDirectory"

    $sql = @($tables | ForEach-Object { "TRUNCATE TABLE $_" })
    $sql += @(
        "DELETE FROM cq_account.globaluser WHERE userid<>16777216 OR account<>'__init_account_1'",
        'ALTER TABLE cq_account.globaluser AUTO_INCREMENT=16777217',
        "DELETE FROM cq_name.charnames WHERE charid<>2 OR charname<>'__init_actorid_0'",
        'ALTER TABLE cq_name.charnames AUTO_INCREMENT=3',
        "DELETE FROM cq_name.guildnames WHERE guildid<>1 OR guildname<>'__init_guild_0'",
        'ALTER TABLE cq_name.guildnames AUTO_INCREMENT=2',
        'ALTER TABLE cq_actor.actors AUTO_INCREMENT=2'
    )
    $null = Invoke-MySql (($sql -join ';') + ';')
    $after = Get-TableCounts $tables
    $remaining = @($after.GetEnumerator() | Where-Object { $_.Value -ne 0 })
    if ($remaining.Count -or (Get-Count 'SELECT COUNT(*) FROM cq_account.globaluser;') -ne 1 -or
        (Get-Count 'SELECT COUNT(*) FROM cq_name.charnames;') -ne 1 -or
        (Get-Count 'SELECT COUNT(*) FROM cq_name.guildnames;') -ne 1) {
        throw "清理后的数据库核对失败；可从 $dumpFile 恢复。"
    }
    Assert-InitialRecords
    $runtimeFiles = @()
    if (Test-Path -LiteralPath $runtime) { $runtimeFiles = @(Get-ChildItem -LiteralPath $runtime -Recurse -File) }
    foreach ($file in $runtimeFiles) { Remove-Item -LiteralPath $file.FullName -Force }
    if ($clockNeedsReset) {
        Copy-Item -LiteralPath (Join-Path $root 'GameClock.LogicServer.original.txt') `
            -Destination (Join-Path $root 'Server\S1001\LogicServer.txt') -Force
        Remove-Item -LiteralPath (Join-Path $root 'GameClock.LogicServer.original.txt') -Force
        Remove-Item -LiteralPath (Join-Path $root 'GameClock.state.json') -Force
    }
    $cleared = ($before.Values | Measure-Object -Sum).Sum + $accountCount + $charCount + $guildCount
    Write-Host "清理完成：数据库记录 $cleared 条，运行时文件 $($runtimeFiles.Count) 个。"
    Write-Host '系统初始化记录及配置表已保留；下次启动将按首次开服处理。'
    Write-Host "恢复用数据库备份：$dumpFile"
} catch {
    Write-Error $_.Exception.Message
    exit 1
} finally {
    if ($startedMySql) {
        & $mysqlAdmin '--protocol=tcp' '--host=127.0.0.1' '--port=3306' '--user=root' 'shutdown' 2>$null | Out-Null
    }
    [Environment]::SetEnvironmentVariable('MYSQL_PWD', $oldPassword, 'Process')
}
