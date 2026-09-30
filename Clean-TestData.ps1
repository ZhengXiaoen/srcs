param(
    [string]$DbPassword,
    [switch]$ValidateOnly
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$mysqlDir = Join-Path $root 'phpStudy\PHPTutorial\MySQL'
$mysql = Join-Path $mysqlDir 'bin\mysql.exe'
$mysqlAdmin = Join-Path $mysqlDir 'bin\mysqladmin.exe'
$mysqld = Join-Path $mysqlDir 'bin\mysqld.exe'
$ini = Join-Path $mysqlDir 'my.ini'
$dataDir = Join-Path $mysqlDir 'data'
$runtime = Join-Path $root 'Server\S1001\data\runtime'

function Invoke-MySql([string]$Sql) {
    $result = @(& $mysql '--protocol=tcp' '--host=127.0.0.1' '--port=3306' '--user=root' '--batch' '--skip-column-names' '--raw' '--default-character-set=utf8' "--execute=$Sql" 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "MySQL 查询失败：$($result -join ' ')" }
    return $result
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

function Get-ClockResetBytes {
    $originalPath = Join-Path $root 'GameClock.LogicServer.original.txt'
    if (-not (Test-Path -LiteralPath $originalPath -PathType Leaf)) {
        return
    }
    $configPath = Join-Path $root 'Server\S1001\LogicServer.txt'
    if (-not (Test-Path -LiteralPath $configPath -PathType Leaf)) {
        throw '缺少当前开服配置，已中止清理。'
    }
    $original = [IO.File]::ReadAllBytes($originalPath)
    $current = [IO.File]::ReadAllBytes($configPath)
    $encoding = [Text.Encoding]::GetEncoding(28591)
    $pattern = '(?m)^[ \t]*ServerOpenTime[ \t]*=[ \t]*"(?<stamp>[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})"[ \t]*,'
    $originalMatches = [regex]::Matches($encoding.GetString($original), $pattern)
    $currentMatches = [regex]::Matches($encoding.GetString($current), $pattern)
    if ($originalMatches.Count -ne 1 -or $currentMatches.Count -ne 1) {
        throw '无法唯一定位开服时间配置，已中止清理以免覆盖其他配置。'
    }
    [Array]::Copy($original, $originalMatches[0].Groups['stamp'].Index,
        $current, $currentMatches[0].Groups['stamp'].Index, 19)
    return ,$current
}

function Get-RuntimeFiles {
    $rootPrefix = [IO.Path]::GetFullPath($root).TrimEnd('\', '/') + '\'
    $runtimePath = [IO.Path]::GetFullPath($runtime).TrimEnd('\', '/')
    if (-not $runtimePath.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "运行时目录不在本项目内，已中止清理：$runtimePath"
    }
    if (-not (Test-Path -LiteralPath $runtimePath -PathType Container)) { return }
    $files = @(Get-ChildItem -LiteralPath $runtimePath -Recurse -File -Force)
    foreach ($file in $files) {
        if (-not $file.FullName.StartsWith($runtimePath + '\', [StringComparison]::OrdinalIgnoreCase)) {
            throw "运行时文件不在预期目录内，已中止清理：$($file.FullName)"
        }
    }
    return $files
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
    $accountTables = @('csrank','globaluser','useramount','useritem','vaseries')
    $foundAccounts = @(Invoke-MySql "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA='cq_account' ORDER BY TABLE_NAME;")
    $accountDifference = @($foundAccounts | Where-Object { $accountTables -notcontains $_ -and @('adminaccount','serverroute') -notcontains $_ })
    $accountMissing = @($accountTables | Where-Object { $foundAccounts -notcontains $_ })
    if ($accountDifference.Count -or $accountMissing.Count) {
        throw "账号库结构与已核对版本不同。新增：$($accountDifference -join ', ')；缺少：$($accountMissing -join ', ')。请先检查脚本。"
    }
    $nameTables = @('charnames','guildnames')
    $foundNames = @(Invoke-MySql "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA='cq_name' ORDER BY TABLE_NAME;")
    $nameDifference = @($foundNames | Where-Object { $nameTables -notcontains $_ -and $_ -ne 'filternames' })
    $nameMissing = @($nameTables | Where-Object { $foundNames -notcontains $_ })
    if ($nameDifference.Count -or $nameMissing.Count) {
        throw "名称库结构与已核对版本不同。新增：$($nameDifference -join ', ')；缺少：$($nameMissing -join ', ')。请先检查脚本。"
    }
    $logTables = @(Invoke-MySql "SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA IN ('cq_log','cq_locallog') AND TABLE_NAME LIKE 'log\\_%' ORDER BY TABLE_SCHEMA,TABLE_NAME;")
    $otherLogTables = @(Invoke-MySql "SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA IN ('cq_log','cq_locallog') AND TABLE_NAME NOT LIKE 'log\\_%';")
    if ($otherLogTables.Count) { throw "发现未经核对的日志表：$($otherLogTables -join ', ')。" }
    $tables = @($actorTables | ForEach-Object { "cq_actor.$_" })
    $tables += @($accountTables | ForEach-Object { "cq_account.$_" })
    $tables += @($nameTables | ForEach-Object { "cq_name.$_" })
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

function Invoke-TestDataCleanup {
    param([string]$DbPassword, [switch]$ValidateOnly)

    $script:startedMySql = $false
    $oldPassword = [Environment]::GetEnvironmentVariable('MYSQL_PWD', 'Process')
    $lockStream = $null
    try {
        $lockStream = [IO.File]::Open((Join-Path $root 'GameClock.lock'), [IO.FileMode]::OpenOrCreate,
            [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
        Assert-ServerStopped
        $clockResetBytes = Get-ClockResetBytes
        $runtimeFiles = @(Get-RuntimeFiles)
        foreach ($file in @($mysql,$mysqlAdmin,$mysqld,$ini)) {
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
        $tables = @(Get-TargetTables)
        $before = Get-TableCounts $tables
        $clockSnapshotNames = @(Get-ChildItem -LiteralPath $root -File -Filter 'GameClock.state.before-nextStart.*.json' |
            Select-Object -ExpandProperty Name)
        if ($ValidateOnly) {
            $recordCount = ($before.Values | Measure-Object -Sum).Sum
            Write-Host "清理前检查通过：待清理数据库记录 $recordCount 条、运行时文件 $($runtimeFiles.Count) 个。"
            return
        }

        Assert-ServerStopped
        $pendingPath = Join-Path $root 'Clean-TestData.pending'
        [IO.File]::WriteAllText($pendingPath, (Get-Date).ToString('o'))
        $sql = @($tables | ForEach-Object { "TRUNCATE TABLE $_" })
        $sql += @(
            'ALTER TABLE cq_account.globaluser AUTO_INCREMENT=16777217',
            'ALTER TABLE cq_name.charnames AUTO_INCREMENT=3',
            'ALTER TABLE cq_name.guildnames AUTO_INCREMENT=2',
            'ALTER TABLE cq_actor.actors AUTO_INCREMENT=2'
        )
        $null = Invoke-MySql (($sql -join ';') + ';')
        $after = Get-TableCounts $tables
        $remaining = @($after.GetEnumerator() | Where-Object { $_.Value -ne 0 })
        if ($remaining.Count) {
            throw '清理后的数据库核对失败；请检查未清空的数据表。'
        }
        foreach ($file in $runtimeFiles) { Remove-Item -LiteralPath $file.FullName -Force }
        if ($null -ne $clockResetBytes) {
            [IO.File]::WriteAllBytes((Join-Path $root 'Server\S1001\LogicServer.txt'), $clockResetBytes)
        }
        foreach ($name in (@('GameClock.LogicServer.original.txt', 'GameClock.state.json') + $clockSnapshotNames)) {
            $path = Join-Path $root $name
            if (Test-Path -LiteralPath $path -PathType Leaf) {
                Remove-Item -LiteralPath $path -Force
            }
        }
        [IO.File]::Delete($pendingPath)
        $cleared = ($before.Values | Measure-Object -Sum).Sum
        Write-Host "清理完成：数据库记录 $cleared 条，运行时文件 $($runtimeFiles.Count) 个。"
        Write-Host '活动运行状态、旧开服时间记录和测试角色数据已清理；下次启动将按首次开服处理。'
    } finally {
        try {
            if ($startedMySql) {
                & $mysqlAdmin '--protocol=tcp' '--host=127.0.0.1' '--port=3306' '--user=root' 'shutdown' 2>$null | Out-Null
            }
        } finally {
            [Environment]::SetEnvironmentVariable('MYSQL_PWD', $oldPassword, 'Process')
            if ($null -ne $lockStream) { $lockStream.Dispose() }
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try {
        Invoke-TestDataCleanup -DbPassword $DbPassword -ValidateOnly:$ValidateOnly
    } catch {
        [Console]::Error.WriteLine($_.Exception.Message)
        exit 1
    }
}
