[CmdletBinding()]
param(
    [ValidateSet('Start', 'Stop', 'RestartDB', 'Preview', 'Recover')]
    [string]$Action,

    [string]$Root,

    [ValidateSet('RestoreReal', 'KeepGame')]
    [string]$AfterStop = 'RestoreReal',

    [ValidateSet('Config', 'System')]
    [string]$TimeSource = 'Config',

    [switch]$SelectStartMode,

    [string]$LastGameTime,

    [switch]$ClockIsReal,

    [switch]$LauncherWindow,

    [ValidatePattern('^[0-9a-fA-F]{32}$')]
    [string]$ResultToken
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

$script:StampFormat = 'yyyy-MM-dd HH:mm:ss'
$script:Culture = [Globalization.CultureInfo]::InvariantCulture
$script:Launchers = @(
    @{ Name = 'DBCenterServer64_R'; Directory = 'Server\common\x64'; File = 'DBCenterServer64_R.exe' },
    @{ Name = 'DBServer64_R'; Directory = 'Server\common\x64'; File = 'DBServer64_R.exe' },
    @{ Name = 'LocalLogServer64_R'; Directory = 'Server\common\x64'; File = 'LocalLogServer64_R.exe' },
    @{ Name = 'LoggerServer64_R'; Directory = 'Server\common\x64'; File = 'LoggerServer64_R.exe' },
    @{ Name = 'NameServer64_R'; Directory = 'Server\common\x64'; File = 'NameServer64_R.exe' },
    @{ Name = 'SessionServer64_R'; Directory = 'Server\common\x64'; File = 'SessionServer64_R.exe' },
    @{ Name = 'GateServer64_R'; Directory = 'Server\S1001\x64'; File = 'GateServer64_R.exe' },
    @{ Name = 'LogicServerCQ64_R'; Directory = 'Server\S1001\x64'; File = 'LogicServerCQ64_R.exe' }
)
$script:StopNames = @(
    'debug_process',
    'LogicServerCQ64_R99',
    'LogicServerCQ64_R',
    'GateServer64_R',
    'SessionServer64_R',
    'NameServer64_R',
    'LoggerServer64_R',
    'LocalLogServer64_R',
    'DBServer64_R',
    'DBCenterServer64_R',
    'DBCenterServer64_D'
)

function Read-StartTimeSource {
    Write-Host '请选择启动模式：'
    Write-Host '  1. 读取 GameClock.state.json 中的下次游戏时间'
    Write-Host '  2. 使用当前电脑时间，不调整电脑时钟'
    Write-Host '  首次开服配置均设为当天 00:00；模式 1 同时调整电脑时间，模式 2 只修改开服配置。'
    while ($true) {
        $selection = Read-Host '请输入 1 或 2，然后按回车确认（不会自动选择）'
        if ($null -eq $selection) {
            throw '未收到启动模式选择，已取消启动。'
        }
        switch ($selection.Trim()) {
            '1' { return 'Config' }
            '2' { return 'System' }
        }
        Write-Host '请输入 1 或 2；直接回车不会启动服务器。'
    }
}

function Format-ClockTime {
    param([datetime]$Value)
    return $Value.ToString($script:StampFormat, $script:Culture)
}

function Ceiling-ClockSecond {
    param([datetime]$Value)
    $ticksPerSecond = [TimeSpan]::TicksPerSecond
    $remainder = $Value.Ticks % $ticksPerSecond
    if ($remainder -eq 0) {
        return $Value
    }
    return $Value.AddTicks($ticksPerSecond - $remainder)
}

function Parse-ClockTime {
    param([string]$Value)
    $parsed = [datetime]::MinValue
    if (-not [datetime]::TryParseExact(
        $Value, $script:StampFormat, $script:Culture,
        [Globalization.DateTimeStyles]::None, [ref]$parsed
    )) {
        throw "时间格式无效：$Value"
    }
    return $parsed
}

function Get-ConfigHash {
    param([byte[]]$Bytes)
    $hasher = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($hasher.ComputeHash($Bytes))).Replace('-', '')
    } finally {
        $hasher.Dispose()
    }
}

function Get-ClockPaths {
    param([string]$RootPath)
    $fullRoot = [IO.Path]::GetFullPath($RootPath)
    return [pscustomobject]@{
        Root = $fullRoot
        Config = [IO.Path]::Combine($fullRoot, 'Server', 'S1001', 'LogicServer.txt')
        Backup = [IO.Path]::Combine($fullRoot, 'GameClock.LogicServer.original.txt')
        State = [IO.Path]::Combine($fullRoot, 'GameClock.state.json')
        Lock = [IO.Path]::Combine($fullRoot, 'GameClock.lock')
    }
}

function Read-OpenConfig {
    param([string]$Path)
    if (-not [IO.File]::Exists($Path)) {
        throw "找不到开服配置：$Path"
    }
    [byte[]]$bytes = [IO.File]::ReadAllBytes($Path)
    # Latin-1 keeps character offsets equal to byte offsets, so only the 19 ASCII
    # date bytes change. BOM, comments and original line endings stay untouched.
    $view = [Text.Encoding]::GetEncoding(28591).GetString($bytes)
    $pattern = '(?m)^[ \t]*ServerOpenTime[ \t]*=[ \t]*"(?<stamp>[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})"[ \t]*,'
    $openMatches = [regex]::Matches($view, $pattern)
    if ($openMatches.Count -ne 1) {
        throw "开服配置必须有且仅有一个有效的 ServerOpenTime，实际找到 $($openMatches.Count) 个。"
    }
    $stamp = $openMatches[0].Groups['stamp']
    return [pscustomobject]@{
        Path = $Path
        Bytes = $bytes
        StampOffset = $stamp.Index
        OpenTime = Parse-ClockTime $stamp.Value
    }
}

function Write-AtomicBytes {
    param(
        [string]$Path,
        [byte[]]$Bytes,
        [string]$BackupPath
    )
    $directory = [IO.Path]::GetDirectoryName($Path)
    $temporary = [IO.Path]::Combine(
        $directory, ([IO.Path]::GetFileName($Path) + '.tmp.' + [guid]::NewGuid().ToString('N'))
    )
    $transientBackup = $null
    try {
        [IO.File]::WriteAllBytes($temporary, $Bytes)
        if ([IO.File]::Exists($Path)) {
            if ([string]::IsNullOrEmpty($BackupPath)) {
                $transientBackup = $Path + '.old.' + [guid]::NewGuid().ToString('N')
                $BackupPath = $transientBackup
            }
            [IO.File]::Replace($temporary, $Path, $BackupPath, $true)
        } else {
            [IO.File]::Move($temporary, $Path)
        }
    } finally {
        if ([IO.File]::Exists($temporary)) {
            [IO.File]::Delete($temporary)
        }
        if ($null -ne $transientBackup -and [IO.File]::Exists($transientBackup)) {
            [IO.File]::Delete($transientBackup)
        }
    }
}

function Set-OpenConfig {
    param($Config, [datetime]$Target, [string]$BackupPath)
    if ([IO.File]::Exists($BackupPath)) {
        throw "原始配置备份已经存在，但没有有效时间记录：$BackupPath"
    }
    [byte[]]$updated = New-Object byte[] $Config.Bytes.Length
    [Array]::Copy($Config.Bytes, $updated, $Config.Bytes.Length)
    [byte[]]$stampBytes = [Text.Encoding]::ASCII.GetBytes((Format-ClockTime $Target))
    [Array]::Copy($stampBytes, 0, $updated, $Config.StampOffset, $stampBytes.Length)
    Write-AtomicBytes -Path $Config.Path -Bytes $updated -BackupPath $BackupPath
}

function Restore-OpenConfig {
    param([string]$Path, [string]$BackupPath)
    if (-not [IO.File]::Exists($BackupPath)) {
        throw "找不到原始配置备份：$BackupPath"
    }
    Write-AtomicBytes -Path $Path -Bytes ([IO.File]::ReadAllBytes($BackupPath)) -BackupPath $null
    [IO.File]::Delete($BackupPath)
}

function Restore-VerifiedOpenConfig {
    param($Paths, $ClockState)
    if (-not [IO.File]::Exists($Paths.Backup)) {
        throw "找不到原始配置备份：$($Paths.Backup)"
    }
    if ((Get-ConfigHash ([IO.File]::ReadAllBytes($Paths.Backup))) -ne
        [string]$ClockState.configHash) {
        throw '原始开服配置备份与启动前的配置指纹不一致；已保留记录，未覆盖现有配置。'
    }
    Restore-OpenConfig $Paths.Config $Paths.Backup
}

function Require-StateField {
    param($State, [string]$Name)
    if ($null -eq $State.PSObject.Properties[$Name]) {
        throw "时间记录缺少字段：$Name"
    }
}

function Read-ClockState {
    param([string]$Path)
    if (-not [IO.File]::Exists($Path)) {
        return $null
    }
    $json = [IO.File]::ReadAllText($Path, [Text.Encoding]::UTF8)
    if ([string]::IsNullOrWhiteSpace($json)) {
        throw "时间记录为空：$Path"
    }
    try {
        $clockState = $json | ConvertFrom-Json
    } catch {
        throw "时间记录不是有效 JSON：$Path"
    }
    foreach ($field in @('schema', 'phase', 'openTime', 'configHash', 'nextStart', 'sessionStart',
                          'realStartUtc', 'uptimeMs', 'bootId', 'mode', 'needsRestore',
                          'firstStart')) {
        Require-StateField $clockState $field
    }
    if (@(3, 4) -notcontains $clockState.schema) {
        throw "不支持的时间记录版本：$($clockState.schema)"
    }
    if ($null -eq $clockState.PSObject.Properties['timeSource']) {
        $clockState | Add-Member -NotePropertyName timeSource -NotePropertyValue 'Config'
    }
    if (@('Config', 'System') -notcontains $clockState.timeSource) {
        throw "启动时间来源无效：$($clockState.timeSource)"
    }
    if ($clockState.schema -eq 4) {
        Require-StateField $clockState 'lastStopGameTime'
        $lastStop = Parse-ClockTime ([string]$clockState.lastStopGameTime)
        if ($lastStop -lt (Parse-ClockTime ([string]$clockState.openTime))) {
            throw '最后停服游戏时间不能早于开服时间。'
        }
    }
    if ([string]$clockState.configHash -cnotmatch '^[0-9A-F]{64}$') {
        throw '时间记录中的原始配置指纹无效。'
    }
    if (@('preparing', 'launching', 'logic_attempted', 'running', 'stopped', 'interrupted') -notcontains $clockState.phase) {
        throw "时间记录状态无效：$($clockState.phase)"
    }
    if (@('RestoreReal', 'KeepGame') -notcontains $clockState.mode) {
        throw "关服后的电脑时间模式无效：$($clockState.mode)"
    }
    $null = Parse-ClockTime ([string]$clockState.openTime)
    if (@('stopped', 'interrupted') -contains $clockState.phase) {
        if ([string]::IsNullOrWhiteSpace([string]$clockState.nextStart)) {
            if ($clockState.schema -ne 4) {
                throw '时间记录缺少下次启动时间或最后停服游戏时间。'
            }
        } else {
            $next = Parse-ClockTime ([string]$clockState.nextStart)
            if ($next -lt (Parse-ClockTime ([string]$clockState.openTime))) {
                throw '下一次启动时间不能早于开服时间。'
            }
        }
    } else {
        $null = Parse-ClockTime ([string]$clockState.sessionStart)
    }
    if (@('preparing', 'launching', 'logic_attempted', 'running') -contains $clockState.phase -or $clockState.needsRestore) {
        $null = [UInt64]::Parse([string]$clockState.uptimeMs, $script:Culture)
        $null = Parse-ClockTime ([string]$clockState.realStartUtc)
        if ([string]::IsNullOrWhiteSpace([string]$clockState.bootId)) {
            throw '时间记录缺少本次电脑启动标记。'
        }
    }
    if ($clockState.needsRestore -isnot [bool]) {
        throw '时间记录中的 needsRestore 必须是布尔值。'
    }
    if ($clockState.firstStart -isnot [bool]) {
        throw '时间记录中的 firstStart 必须是布尔值。'
    }
    return $clockState
}

function Write-ClockState {
    param([string]$Path, $State)
    $json = ConvertTo-Json -InputObject $State -Depth 5
    [byte[]]$bytes = (New-Object System.Text.UTF8Encoding($false)).GetBytes($json + [Environment]::NewLine)
    Write-AtomicBytes -Path $Path -Bytes $bytes -BackupPath $null
}

function Get-StartPlan {
    param($Config, $State, [datetime]$Today,
          [ValidateSet('Config', 'System')][string]$TimeSource = 'Config')
    if ($null -eq $State) {
        $target = if ($TimeSource -eq 'System') {
            Parse-ClockTime (Format-ClockTime $Today)
        } else {
            $Today.Date
        }
        return [pscustomobject]@{
            FirstStart = $true
            Target = $target
            OpenTime = $Today.Date
        }
    }
    if ($State.phase -ne 'stopped' -or $State.needsRestore) {
        throw '上次启动尚未完成关服记录。请先运行“3.一键停止.bat”。'
    }
    if ($Config.OpenTime -ne (Parse-ClockTime ([string]$State.openTime))) {
        throw '开服配置与时间记录不一致；已中止启动，避免游戏时间错乱。'
    }
    $lastStopField = $State.PSObject.Properties['lastStopGameTime']
    if ($State.schema -eq 4 -and $null -eq $lastStopField) {
        throw '时间记录缺少最后停服游戏时间，不能安全启动。'
    }
    if ($TimeSource -eq 'System') {
        $target = Parse-ClockTime (Format-ClockTime $Today)
        $earliest = $Config.OpenTime
        if ($null -ne $lastStopField -and
            -not [string]::IsNullOrWhiteSpace([string]$lastStopField.Value)) {
            $earliest = Parse-ClockTime ([string]$lastStopField.Value)
        } elseif (-not [string]::IsNullOrWhiteSpace([string]$State.nextStart)) {
            $earliest = Parse-ClockTime ([string]$State.nextStart)
        }
        if ($target -lt $earliest) {
            throw '当前电脑时间早于开服或上次停服的游戏时间，不能安全启动。'
        }
    } else {
        if ([string]::IsNullOrWhiteSpace([string]$State.nextStart)) {
            throw '请先在 GameClock.state.json 中手动填写 nextStart，再启动服务器。'
        }
        $target = Parse-ClockTime ([string]$State.nextStart)
    }
    if ($null -ne $lastStopField -and
        -not [string]::IsNullOrWhiteSpace([string]$lastStopField.Value) -and
        $target -lt (Parse-ClockTime ([string]$lastStopField.Value))) {
        throw '手动填写的下次游戏时间不能早于上次停服时的游戏时间。'
    }
    return [pscustomobject]@{
        FirstStart = $false
        Target = $target
        OpenTime = $Config.OpenTime
    }
}

function Get-UptimeMilliseconds {
    if (-not ('GameClock.NativeTime' -as [type])) {
        Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
namespace GameClock {
    public static class NativeTime {
        [DllImport("kernel32.dll")]
        public static extern ulong GetTickCount64();
    }
}
'@
    }
    return [GameClock.NativeTime]::GetTickCount64()
}

function Get-BootId {
    $bootEvent = Get-WinEvent -FilterHashtable @{
        LogName = 'System'
        ProviderName = 'Microsoft-Windows-Kernel-General'
        Id = 12
    } -MaxEvents 1 -ErrorAction Stop
    if ($null -eq $bootEvent) {
        throw '无法读取 Windows 启动事件，不能安全计算真实时间。'
    }
    return [string]$bootEvent.RecordId
}

function Get-ElapsedMilliseconds {
    param($State)
    if ((Get-BootId) -ne [string]$State.bootId) {
        throw '电脑在本次游戏期间重启，不能自动计算关服或恢复真实时间。'
    }
    $start = [UInt64]::Parse([string]$State.uptimeMs, $script:Culture)
    $now = Get-UptimeMilliseconds
    if ($now -lt $start) {
        throw '电脑似乎在本次游戏期间重启，无法安全推算游戏和现实时间。'
    }
    return [double]($now - $start)
}

function Get-WorkspaceWebProcesses {
    param([string]$Name, [string]$Path, [bool]$IncludeSubdirectories = $false)
    $expected = [IO.Path]::GetFullPath($Path)
    $prefix = $expected.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    $matches = @()
    foreach ($process in @(Get-Process -Name $Name -ErrorAction SilentlyContinue)) {
        $actual = $null
        try { $actual = $process.Path } catch {}
        if ([string]::IsNullOrWhiteSpace($actual)) {
            $cim = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId = $($process.Id)" -ErrorAction SilentlyContinue
            if ($null -ne $cim) { $actual = $cim.ExecutablePath }
        }
        if (-not [string]::IsNullOrWhiteSpace($actual)) {
            $actual = [IO.Path]::GetFullPath($actual)
            if ((-not $IncludeSubdirectories -and [string]::Equals($actual, $expected, [StringComparison]::OrdinalIgnoreCase)) -or
                ($IncludeSubdirectories -and $actual.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase))) {
                $matches += $process
            }
        }
    }
    return @($matches)
}

function Restart-WorkspaceApacheAfterClockChange {
    param($Paths)
    if ($null -eq $Paths) { return }
    $apacheRoot = [IO.Path]::Combine($Paths.Root, 'phpStudy', 'PHPTutorial', 'Apache')
    $apacheExe = [IO.Path]::Combine($apacheRoot, 'bin', 'httpd.exe')
    $apacheProcesses = @(Get-WorkspaceWebProcesses 'httpd' $apacheExe)
    if ($apacheProcesses.Count -eq 0) { return }

    $phpRoot = [IO.Path]::Combine($Paths.Root, 'phpStudy', 'PHPTutorial', 'php')
    foreach ($worker in @(Get-WorkspaceWebProcesses 'php-cgi' $phpRoot $true)) {
        Stop-Process -Id $worker.Id -Force -ErrorAction SilentlyContinue
    }
    foreach ($process in $apacheProcesses) {
        Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
    }
    for ($attempt = 0; $attempt -lt 20; $attempt++) {
        $remaining = @($apacheProcesses | Where-Object { Get-Process -Id $_.Id -ErrorAction SilentlyContinue })
        if ($remaining.Count -eq 0) { break }
        Start-Sleep -Milliseconds 100
    }
    if ($remaining.Count -gt 0) {
        throw '切换电脑时间后，旧 Apache 进程未退出；请检查 phpStudy。'
    }
    # phpStudy may have restarted Apache while the old processes were stopping.
    if (@(Get-WorkspaceWebProcesses 'httpd' $apacheExe).Count -eq 0) {
        $null = Start-Process -FilePath $apacheExe -ArgumentList ('-d "{0}"' -f $apacheRoot.Replace('\', '/')) -WorkingDirectory ([IO.Path]::GetDirectoryName($apacheExe)) -WindowStyle Hidden -PassThru -ErrorAction Stop
    }
    for ($attempt = 0; $attempt -lt 30; $attempt++) {
        if (@(Get-WorkspaceWebProcesses 'httpd' $apacheExe).Count -ge 2) { return }
        Start-Sleep -Milliseconds 100
    }
    throw '切换电脑时间后，Apache 未能重新启动；请检查 phpStudy。'
}

function Set-ComputerClock {
    param([datetime]$Target, $Paths)
    $null = Set-Date -Date $Target -ErrorAction Stop
    if ([Math]::Abs(((Get-Date) - $Target).TotalSeconds) -gt 5) {
        throw "设置电脑时间后读回不一致，预期 $(Format-ClockTime $Target)。"
    }
    Restart-WorkspaceApacheAfterClockChange $Paths
}

function Restore-RealClock {
    param($State, $Paths)
    if ($null -ne $Paths -and @(Get-RunningServerNames $Paths).Count -gt 0) {
        throw '服务器进程仍在运行，不能恢复电脑的现实时间。'
    }
    $elapsed = Get-ElapsedMilliseconds $State
    $utc = [datetime]::SpecifyKind(
        (Parse-ClockTime ([string]$State.realStartUtc)), [DateTimeKind]::Utc
    )
    $realTime = $utc.AddMilliseconds($elapsed).ToLocalTime()
    Set-ComputerClock -Target $realTime -Paths $Paths
}

function Get-ExpectedExecutablePath {
    param($Paths, [string]$Name)
    foreach ($launcher in $script:Launchers) {
        if ($launcher.Name -eq $Name) {
            return [IO.Path]::Combine($Paths.Root, $launcher.Directory, $launcher.File)
        }
    }
    switch ($Name) {
        'DBCenterServer64_D' { return [IO.Path]::Combine($Paths.Root, 'Server\common\x64', 'DBCenterServer64_D.exe') }
        'debug_process' { return [IO.Path]::Combine($Paths.Root, 'Server\S1001\x64', 'debug_process.exe') }
        'LogicServerCQ64_R99' { return [IO.Path]::Combine($Paths.Root, 'Server\S1001\x64', 'LogicServerCQ64_R99.exe') }
    }
    throw "未知服务器进程：$Name"
}

function Test-ServerProcessStillRunning {
    param([int]$Id, [string]$Name)
    try {
        $current = Get-Process -Id $Id -ErrorAction Stop
        if ($null -eq $current) {
            return $false
        }
        return [string]::Equals($current.ProcessName, $Name, [StringComparison]::OrdinalIgnoreCase)
    } catch {
        if ($_.FullyQualifiedErrorId -like 'NoProcessFoundForGivenId*') {
            return $false
        }
        throw "无法复查进程 $Name ($Id) 是否仍在运行：$($_.Exception.Message)"
    }
}

function Get-ServerInventory {
    param($Paths)
    $ours = @()
    $foreign = @()
    foreach ($name in $script:StopNames) {
        $expected = Get-ExpectedExecutablePath $Paths $name
        foreach ($process in @(Get-Process -Name $name -ErrorAction SilentlyContinue)) {
            $actual = $null
            $pathFailure = 'Path 属性为空'
            try {
                $actual = $process.Path
            } catch {
                $pathFailure = $_.Exception.Message
            }
            if ([string]::IsNullOrWhiteSpace($actual)) {
                $processById = $null
                $lookupFailure = $null
                try {
                    $processById = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId = $($process.Id)" -ErrorAction Stop
                } catch {
                    $lookupFailure = $_.Exception.Message
                }
                # An enumerated process can exit before its Path is read. A reused PID
                # must only be ignored after a second live-process check.
                if ($null -ne $processById -and $processById.ProcessId -eq $process.Id -and
                    $processById.Name -ieq "$name.exe") {
                    $actual = $processById.ExecutablePath
                }
                if ([string]::IsNullOrWhiteSpace($actual)) {
                    if (-not (Test-ServerProcessStillRunning $process.Id $name)) {
                        continue
                    }
                    $lookupDetail = if ($null -ne $lookupFailure) {
                        "系统查询失败：$lookupFailure"
                    } elseif ($null -eq $processById) {
                        '系统查询未找到该进程'
                    } else {
                        '系统查询的程序路径也为空或进程身份不一致'
                    }
                    throw "无法确认进程 $name ($($process.Id)) 的程序路径（$pathFailure；$lookupDetail）；未操作电脑时间或进程。"
                }
            }
            if ([string]::Equals(
                [IO.Path]::GetFullPath($actual), [IO.Path]::GetFullPath($expected),
                [StringComparison]::OrdinalIgnoreCase
            )) {
                $ours += $process
            } else {
                $foreign += "$name ($actual)"
            }
        }
    }
    return [pscustomobject]@{
        Ours = @($ours)
        Foreign = @($foreign)
    }
}

function Get-RunningServerNames {
    param($Paths)
    $inventory = Get-ServerInventory $Paths
    if ($inventory.Foreign.Count -gt 0) {
        throw "发现另一套同名服务器进程，已中止操作：$($inventory.Foreign -join ', ')"
    }
    foreach ($process in $inventory.Ours) {
        $process.ProcessName
    }
}

function Stop-ManagedProcesses {
    param($Paths)
    $inventory = Get-ServerInventory $Paths
    if ($inventory.Foreign.Count -gt 0) {
        throw "发现另一套同名服务器进程，已中止关服：$($inventory.Foreign -join ', ')"
    }
    foreach ($name in $script:StopNames) {
        $processes = @($inventory.Ours | Where-Object { $_.ProcessName -eq $name })
        foreach ($process in $processes) {
            try {
                Stop-Process -Id $process.Id -Force -ErrorAction Stop
            } catch {
                if (Get-Process -Id $process.Id -ErrorAction SilentlyContinue) {
                    throw
                }
            }
        }
    }
    for ($attempt = 0; $attempt -lt 20; $attempt++) {
        $remaining = @(Get-RunningServerNames $Paths)
        if ($remaining.Count -eq 0) {
            return
        }
        Start-Sleep -Seconds 1
    }
    throw "关服未完成，仍在运行：$($remaining -join ', ')。时间记录没有推进。"
}

function Test-Administrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Test-ManagedClock {
    param($State)
    return ($null -eq $State.PSObject.Properties['timeSource'] -or
            $State.timeSource -ne 'System')
}

function Undo-PreparedStart {
    param($Paths, $ClockState)
    # No clock or configuration rollback is allowed until every managed
    # process has exited. A live server must never see a backward time jump.
    Stop-ManagedProcesses $Paths
    if (Test-ManagedClock $ClockState) {
        Restore-RealClock $ClockState $Paths
    }
    if ($ClockState.firstStart -and [IO.File]::Exists($Paths.Backup)) {
        Restore-VerifiedOpenConfig $Paths $ClockState
    }
    if ($ClockState.firstStart) {
        [IO.File]::Delete($Paths.State)
    } else {
        $ClockState.phase = 'stopped'
        $ClockState.needsRestore = $false
        Write-ClockState $Paths.State $ClockState
    }
}

function Invoke-GameStart {
    param($Paths, [string]$Mode,
          [ValidateSet('Config', 'System')][string]$TimeSource = 'Config')
    if ([IO.File]::Exists([IO.Path]::Combine($Paths.Root, 'Clean-TestData.pending'))) {
        throw '上次测试数据清理未完成。请保持服务器关闭，重新运行“5.一键清理测试数据.bat”后再启动。'
    }
    $config = Read-OpenConfig $Paths.Config
    $previousState = Read-ClockState $Paths.State
    $plan = Get-StartPlan $config $previousState (Get-Date) $TimeSource
    if ($null -ne $previousState -and $previousState.mode -ne $Mode) {
        throw '关服后的电脑时间模式不能在已有记录中切换。'
    }
    if ((@(Get-RunningServerNames $Paths)).Count -gt 0) {
        throw '服务器进程已经在运行，不能重复启动。'
    }
    foreach ($launcher in $script:Launchers) {
        $directory = [IO.Path]::Combine($Paths.Root, $launcher.Directory)
        $exe = [IO.Path]::Combine($directory, $launcher.File)
        if (-not [IO.File]::Exists($exe)) {
            throw "找不到服务器程序：$exe"
        }
    }
    if ($TimeSource -eq 'Config') {
        $timeService = Get-Service -Name W32Time -ErrorAction SilentlyContinue
        if ($null -ne $timeService -and $timeService.Status -eq 'Running') {
            throw 'Windows 自动校时服务正在运行，可能覆盖游戏时间。请关闭自动设置时间后再启动。'
        }
    }
    if ($plan.FirstStart -and [IO.File]::Exists($Paths.Backup)) {
        throw "已有原始配置备份却没有时间记录，请先检查：$($Paths.Backup)"
    }

    $realStartUtc = [datetime]::UtcNow
    $uptime = Get-UptimeMilliseconds
    $bootId = Get-BootId
    $pendingSchema = 3
    $previousLastStop = $null
    if ($null -ne $previousState) {
        $pendingSchema = $previousState.schema
        if ($null -ne $previousState.PSObject.Properties['lastStopGameTime']) {
            $previousLastStop = $previousState.lastStopGameTime
        }
    }
    $pending = [pscustomobject][ordered]@{
        schema = $pendingSchema
        phase = 'preparing'
        openTime = Format-ClockTime $plan.OpenTime
        configHash = Get-ConfigHash $config.Bytes
        nextStart = Format-ClockTime $plan.Target
        sessionStart = Format-ClockTime $plan.Target
        realStartUtc = Format-ClockTime $realStartUtc
        uptimeMs = [string]$uptime
        bootId = $bootId
        mode = $Mode
        timeSource = $TimeSource
        needsRestore = $false
        firstStart = [bool]$plan.FirstStart
        lastStopGameTime = $previousLastStop
    }
    Write-ClockState $Paths.State $pending
    try {
        if ($plan.FirstStart) {
            Set-OpenConfig $config $plan.OpenTime $Paths.Backup
        }
        if (@(Get-RunningServerNames $Paths).Count -gt 0) {
            throw '服务器进程在启动准备期间出现，不能继续启动。'
        }
        if ($TimeSource -eq 'Config') {
            Set-ComputerClock -Target $plan.Target -Paths $Paths
        }
        $pending.phase = 'launching'
        Write-ClockState $Paths.State $pending
        foreach ($launcher in $script:Launchers) {
            $directory = [IO.Path]::Combine($Paths.Root, $launcher.Directory)
            $exe = [IO.Path]::Combine($directory, $launcher.File)
            if ($launcher.Name -eq 'LogicServerCQ64_R') {
                # Once Logic may have touched game data, never discard the time
                # record or restore the old open date after a startup error.
                $pending.phase = 'logic_attempted'
                Write-ClockState $Paths.State $pending
            }
            $null = Start-Process -FilePath $exe -WorkingDirectory $directory -WindowStyle Normal -PassThru -ErrorAction Stop
        }
        Start-Sleep -Seconds 3
        $running = @(Get-RunningServerNames $Paths)
        $missing = @($script:Launchers | Where-Object { $running -notcontains $_.Name } | ForEach-Object { $_.Name })
        if ($missing.Count -gt 0) {
            throw "服务器程序启动后未保持运行：$($missing -join ', ')"
        }
        $pending.phase = 'running'
        Write-ClockState $Paths.State $pending
    } catch {
        $startError = $_.Exception.Message
        if (@('logic_attempted', 'running') -contains $pending.phase) {
            try {
                Stop-ManagedProcesses $Paths
                $pending.phase = 'interrupted'
                $pending.needsRestore = ($pending.mode -eq 'RestoreReal' -and
                                         (Test-ManagedClock $pending))
                Write-ClockState $Paths.State $pending
                if ($pending.needsRestore) {
                    Restore-RealClock $pending $Paths
                    $pending.needsRestore = $false
                    Write-ClockState $Paths.State $pending
                }
            } catch {
                throw "逻辑服启动失败：$startError；进程或电脑时间恢复未完成：$($_.Exception.Message)。时间记录和开服配置已保留。"
            }
            throw "逻辑服启动失败：$startError。已保留时间记录和开服配置，需根据最后游戏时间恢复后再启动。"
        }
        try {
            Undo-PreparedStart $Paths $pending
        } catch {
            throw "启动失败：$startError；服务器或时间回退未完成：$($_.Exception.Message)。已保留状态，切勿直接再次启动。"
        }
        throw "启动失败，启动准备已回退：$startError"
    }
    $sourceLabel = if ($TimeSource -eq 'System') { '当前电脑时间' } else { '时间记录' }
    Write-Host "服务器已启动。时间来源：$sourceLabel；游戏时间：$(Format-ClockTime $plan.Target)"
    if ($plan.FirstStart) {
        Write-Host "已将开服配置设为启动当天 00:00，并备份原件：$($Paths.Backup)"
    }
}

function Save-InterruptedStop {
    param($Paths, $ClockState)
    if (@(Get-RunningServerNames $Paths).Count -gt 0) {
        throw '服务器进程仍在运行，不能结算异常关服。'
    }
    $ClockState.phase = 'interrupted'
    $ClockState.needsRestore = ($ClockState.mode -eq 'RestoreReal' -and
                                (Test-ManagedClock $ClockState))
    Write-ClockState $Paths.State $ClockState
    if ($ClockState.needsRestore) {
        Restore-RealClock $ClockState $Paths
        $ClockState.needsRestore = $false
        Write-ClockState $Paths.State $ClockState
    }
}

function Invoke-GameStop {
    param($Paths)
    $clockState = Read-ClockState $Paths.State
    $running = @(Get-RunningServerNames $Paths)
    if ($null -eq $clockState -and $running.Count -eq 0) {
        Write-Host '服务器未运行，也没有时间记录；未推进游戏时间。'
        return
    }
    if ($null -ne $clockState -and $clockState.phase -eq 'preparing') {
        Undo-PreparedStart $Paths $clockState
        Write-Host '未完成的启动已回退；游戏时间没有推进。'
        return
    }
    if ($null -ne $clockState -and $clockState.phase -eq 'launching' -and
        $running -notcontains 'LogicServerCQ64_R') {
        Undo-PreparedStart $Paths $clockState
        Write-Host '逻辑服未完成启动；启动准备已回退。'
        return
    }
    if ($null -ne $clockState -and $clockState.phase -eq 'stopped' -and $running.Count -eq 0) {
        $stateChanged = $false
        if ($clockState.needsRestore) {
            Restore-RealClock $clockState $Paths
            $clockState.needsRestore = $false
            $stateChanged = $true
        }
        if ([string]::IsNullOrWhiteSpace([string]$clockState.nextStart)) {
            $clockState.nextStart = [string]$clockState.lastStopGameTime
            $stateChanged = $true
        }
        if ($stateChanged) {
            Write-ClockState $Paths.State $clockState
        }
        Write-Host "服务器已关闭；下次游戏时间为 $($clockState.nextStart)。"
        return
    }
    if ($null -ne $clockState -and $clockState.phase -eq 'interrupted' -and $running.Count -eq 0) {
        if ($clockState.needsRestore) {
            Restore-RealClock $clockState $Paths
            $clockState.needsRestore = $false
            Write-ClockState $Paths.State $clockState
        }
        throw '上次运行状态尚未恢复，不能自动推进时间。'
    }
    if ($null -ne $clockState -and @('running', 'launching', 'logic_attempted') -contains $clockState.phase -and
        $running.Count -eq 0) {
        Save-InterruptedStop $Paths $clockState
        throw '服务器进程已经消失，无法确定最后的游戏时间；异常记录已保留，游戏时间未推进。'
    }
    Stop-ManagedProcesses $Paths
    if ($null -eq $clockState) {
        $config = Read-OpenConfig $Paths.Config
        $clockState = [pscustomobject][ordered]@{
            schema = 3
            phase = 'interrupted'
            openTime = Format-ClockTime $config.OpenTime
            configHash = Get-ConfigHash $config.Bytes
            nextStart = Format-ClockTime $config.OpenTime
            sessionStart = $null
            realStartUtc = $null
            uptimeMs = $null
            bootId = $null
            mode = 'RestoreReal'
            timeSource = 'Config'
            needsRestore = $false
            firstStart = $false
        }
        Write-ClockState $Paths.State $clockState
        throw '服务器已关闭，但它不是由本脚本启动的；请根据最后的游戏时间恢复记录。'
    }
    if (@('stopped', 'interrupted') -contains $clockState.phase) {
        $clockState.phase = 'interrupted'
        Write-ClockState $Paths.State $clockState
        if ($clockState.needsRestore) {
            Restore-RealClock $clockState $Paths
            $clockState.needsRestore = $false
            Write-ClockState $Paths.State $clockState
        }
        throw '服务器已关闭，但启动记录不属于本次运行；没有自动修改下次时间。'
    }
    $missing = @($script:Launchers | Where-Object { $running -notcontains $_.Name } | ForEach-Object { $_.Name })
    if ($missing.Count -gt 0) {
        Save-InterruptedStop $Paths $clockState
        throw "服务器已关闭，但关服前有服务掉线：$($missing -join ', ')；异常记录已保留，游戏时间未推进。"
    }
    $elapsed = Get-ElapsedMilliseconds $clockState
    $expected = (Parse-ClockTime ([string]$clockState.sessionStart)).AddMilliseconds($elapsed)
    $virtualNow = Get-Date
    if ([Math]::Abs(($virtualNow - $expected).TotalMinutes) -gt 2) {
        Save-InterruptedStop $Paths $clockState
        throw '电脑时间在游戏期间发生跳变；服务器已关闭且异常记录已保留。请根据游戏日志中的最后时间手动恢复记录。'
    }
    $lastGameTime = if ($virtualNow -gt $expected) { $virtualNow } else { $expected }
    $lastGameTime = Ceiling-ClockSecond $lastGameTime
    if ($lastGameTime -lt (Parse-ClockTime ([string]$clockState.sessionStart))) {
        Save-InterruptedStop $Paths $clockState
        throw '停服时的游戏时间早于本次启动时间；未写入时间记录。'
    }
    $clockState.schema = 4
    $clockState.phase = 'stopped'
    $lastGameStamp = Format-ClockTime $lastGameTime
    $clockState.nextStart = $lastGameStamp
    $clockState | Add-Member -NotePropertyName lastStopGameTime -NotePropertyValue $lastGameStamp -Force
    $clockState.needsRestore = ($clockState.mode -eq 'RestoreReal' -and
                                (Test-ManagedClock $clockState))
    Write-ClockState $Paths.State $clockState
    if ($clockState.needsRestore) {
        Restore-RealClock $clockState $Paths
        $clockState.needsRestore = $false
        Write-ClockState $Paths.State $clockState
    }
    Write-Host "服务器已关闭；最后游戏时间：$lastGameStamp。下次默认从这个时间继续，可手动修改 nextStart。"
}

function Invoke-GamePreview {
    param($Paths, [ValidateSet('Config', 'System')][string]$TimeSource = 'Config')
    $config = Read-OpenConfig $Paths.Config
    $clockState = Read-ClockState $Paths.State
    if ($null -ne $clockState -and @('preparing', 'launching', 'logic_attempted', 'running') -contains $clockState.phase) {
        Write-Host "记录中的本次启动时间：$($clockState.sessionStart)"
        Write-Host "当前电脑时间：$(Format-ClockTime (Get-Date))"
        Write-Host '正常关服后，nextStart 默认等于最后游戏时间；可在关服后手动修改。'
        return
    }
    if ($null -ne $clockState -and $clockState.phase -eq 'interrupted') {
        Write-Host '上次运行异常中断，需恢复记录后才能再次启动。'
        if ($clockState.needsRestore) {
            Write-Host '电脑时间尚未恢复到现实时间；请查看使用说明中的异常恢复步骤。'
        }
        return
    }
    if ($null -ne $clockState -and $clockState.needsRestore) {
        Write-Host '服务器已关闭，但电脑时间尚未恢复到现实时间。'
        return
    }
    if ($TimeSource -eq 'Config' -and $null -ne $clockState -and
        $clockState.phase -eq 'stopped' -and
        [string]::IsNullOrWhiteSpace([string]$clockState.nextStart)) {
        Write-Host "最后游戏时间：$($clockState.lastStopGameTime)。旧记录的 nextStart 尚为空，运行“3.一键停止.bat”可补写默认值。"
        return
    }
    $plan = Get-StartPlan $config $clockState (Get-Date) $TimeSource
    if ($TimeSource -eq 'System') {
        if ($plan.FirstStart) {
            Write-Host "首次启动将把开服配置设为当天 00:00：$(Format-ClockTime $plan.OpenTime)；使用当前电脑时间：$(Format-ClockTime $plan.Target)，不会调整电脑时钟。"
        } else {
            Write-Host "模式 2 将使用当前电脑时间：$(Format-ClockTime $plan.Target)；不会调整电脑时钟。"
        }
    } elseif ($plan.FirstStart) {
        Write-Host "首次启动将把开服配置和电脑时间设为：$(Format-ClockTime $plan.Target)"
    } else {
        Write-Host "下次启动将把电脑时间设为：$(Format-ClockTime $plan.Target)"
    }
    Write-Host '预览没有修改电脑时间、配置或服务器进程。'
}

function Invoke-GameRestartDB {
    param($Paths)
    $clockState = Read-ClockState $Paths.State
    if ($null -eq $clockState -or $clockState.phase -ne 'running') {
        throw '服务器没有处于正常运行状态，不能单独重启数据库服务。'
    }
    $running = @(Get-RunningServerNames $Paths)
    if ($running -notcontains 'LogicServerCQ64_R') {
        throw '逻辑服已退出，不能单独启动数据库服务；请先处理异常关服记录。'
    }
    if ($running -contains 'DBServer64_R') {
        Write-Host '数据库服务已经在运行；未重复启动。'
        return
    }
    $expected = (Parse-ClockTime ([string]$clockState.sessionStart)).AddMilliseconds(
        (Get-ElapsedMilliseconds $clockState)
    )
    if ([Math]::Abs(((Get-Date) - $expected).TotalMinutes) -gt 2) {
        throw '电脑时间已偏离本次游戏时间，不能单独重启数据库服务；请先关服并处理时间记录。'
    }
    $directory = [IO.Path]::Combine($Paths.Root, 'Server\common\x64')
    $exe = [IO.Path]::Combine($directory, 'DBServer64_R.exe')
    if (-not [IO.File]::Exists($exe)) {
        throw "找不到数据库服务器程序：$exe"
    }
    $null = Start-Process -FilePath $exe -WorkingDirectory $directory -WindowStyle Normal -PassThru -ErrorAction Stop
    Start-Sleep -Seconds 2
    if (@(Get-RunningServerNames $Paths) -notcontains 'DBServer64_R') {
        throw '数据库服务启动后没有保持运行。'
    }
    Write-Host '数据库服务已经恢复。'
}

function Invoke-GameRecover {
    param($Paths, [string]$LastTime, [bool]$RealClockConfirmed)
    if ((@(Get-RunningServerNames $Paths)).Count -gt 0) {
        throw '服务器仍在运行，不能手动结算游戏时间。'
    }
    $clockState = Read-ClockState $Paths.State
    if ($null -eq $clockState) {
        throw '找不到时间记录，无法恢复。'
    }
    if ($clockState.phase -eq 'stopped') {
        if (-not $clockState.needsRestore) {
            throw '记录已经正常停止；不允许覆盖已保存的下次游戏时间。'
        }
        if ($RealClockConfirmed) {
            $clockState.needsRestore = $false
        } else {
            Restore-RealClock $clockState $Paths
            $clockState.needsRestore = $false
        }
        if ([string]::IsNullOrWhiteSpace([string]$clockState.nextStart)) {
            $clockState.nextStart = [string]$clockState.lastStopGameTime
        }
        Write-ClockState $Paths.State $clockState
        Write-Host "电脑时间恢复状态已处理；下次游戏时间为 $($clockState.nextStart)。"
        return
    }
    if (@('preparing', 'launching') -contains $clockState.phase) {
        if (-not $RealClockConfirmed) {
            Undo-PreparedStart $Paths $clockState
        } else {
            if ($clockState.firstStart) {
                if ([IO.File]::Exists($Paths.Backup)) {
                    Restore-VerifiedOpenConfig $Paths $clockState
                } elseif ((Get-ConfigHash (Read-OpenConfig $Paths.Config).Bytes) -ne
                        [string]$clockState.configHash) {
                    throw '原始开服配置与启动前不一致且备份丢失，不能安全回退。'
                }
                [IO.File]::Delete($Paths.State)
            } else {
                $clockState.phase = 'stopped'
                $clockState.needsRestore = $false
                Write-ClockState $Paths.State $clockState
            }
        }
        Write-Host '未完成的启动已回退；游戏时间没有推进。'
        return
    }
    if ([string]::IsNullOrWhiteSpace($LastTime)) {
        throw '恢复异常关服需要提供 -LastGameTime "yyyy-MM-dd HH:mm:ss"。'
    }
    $last = Parse-ClockTime $LastTime
    $open = Parse-ClockTime ([string]$clockState.openTime)
    if ($last -lt $open) {
        throw '最后游戏时间不能早于开服时间。'
    }
    if (@('running', 'launching', 'logic_attempted', 'interrupted') -contains $clockState.phase -and
        -not [string]::IsNullOrWhiteSpace([string]$clockState.sessionStart) -and
        $last -lt (Parse-ClockTime ([string]$clockState.sessionStart))) {
        throw '最后游戏时间不能早于本次启动时间。'
    }
    $hasAnchor = -not [string]::IsNullOrWhiteSpace([string]$clockState.bootId)
    $sameBoot = $false
    if ($hasAnchor -and -not $RealClockConfirmed) {
        $sameBoot = ((Get-BootId) -eq [string]$clockState.bootId)
    }
    $requiresRestore = ((Test-ManagedClock $clockState) -and
                        $clockState.mode -eq 'RestoreReal' -and
                        ($clockState.phase -ne 'interrupted' -or
                         $clockState.needsRestore -or -not $hasAnchor))
    $canRestore = ($requiresRestore -and $hasAnchor -and $sameBoot -and
                   -not $RealClockConfirmed)
    if ($requiresRestore -and -not $canRestore -and
        -not $RealClockConfirmed) {
        throw '无法自动还原现实时间。请先用 Windows 校准电脑时间，再加 -ClockIsReal 恢复记录。'
    }
    $clockState.phase = 'stopped'
    $clockState.schema = 4
    $lastStamp = Format-ClockTime $last
    $clockState.nextStart = $lastStamp
    $clockState | Add-Member -NotePropertyName lastStopGameTime -NotePropertyValue $lastStamp -Force
    $clockState.needsRestore = [bool]$canRestore
    Write-ClockState $Paths.State $clockState
    if ($canRestore) {
        Restore-RealClock $clockState $Paths
        $clockState.needsRestore = $false
        Write-ClockState $Paths.State $clockState
    }
    Write-Host "最后游戏时间已记录为 $lastStamp；下次默认从这个时间继续，可手动修改 nextStart。"
}

if (-not [string]::IsNullOrEmpty($Action)) {
    $paths = $null
    try {
        if ($LauncherWindow) {
            [Console]::OutputEncoding = New-Object Text.UTF8Encoding($false)
        }
        if ($Action -eq 'Start' -and $SelectStartMode) {
            $TimeSource = Read-StartTimeSource
        }
        if ([string]::IsNullOrWhiteSpace($Root)) {
            $Root = [IO.Path]::GetDirectoryName($PSCommandPath)
        }
        $paths = Get-ClockPaths $Root
        if ($Action -ne 'Preview' -and -not (Test-Administrator)) {
            $argLine = '-NoProfile -ExecutionPolicy Bypass -File "{0}" -Action {1} -Root "{2}" -AfterStop {3} -TimeSource {4}' -f $PSCommandPath, $Action, $paths.Root, $AfterStop, $TimeSource
            if ($LauncherWindow) {
                $argLine += ' -LauncherWindow'
            } else {
                $token = [guid]::NewGuid().ToString('N')
                $resultPath = [IO.Path]::Combine($paths.Root, "GameClock.result.$token.txt")
                $argLine += ' -ResultToken ' + $token
            }
            if (-not [string]::IsNullOrWhiteSpace($LastGameTime)) {
                $argLine += ' -LastGameTime "' + $LastGameTime + '"'
            }
            if ($ClockIsReal) {
                $argLine += ' -ClockIsReal'
            }
            $child = Start-Process -FilePath ([IO.Path]::Combine($PSHOME, 'powershell.exe')) -ArgumentList $argLine -Verb RunAs -PassThru -WindowStyle Normal
            if ($LauncherWindow) {
                # The elevated window reports the result and controls its own lifetime.
                # Let the initial batch/PowerShell window close immediately.
                exit 0
            }
            # Start-Process -Wait also waits for the long-lived server children on Win11.
            # Wait only for the elevated script process so the launcher window can close.
            $child.WaitForExit()
            if ($child.ExitCode -ne 0) {
                if ([IO.File]::Exists($resultPath)) {
                    $childError = [IO.File]::ReadAllText($resultPath, [Text.Encoding]::UTF8)
                    [IO.File]::Delete($resultPath)
                    throw $childError
                }
                throw "管理员模式执行失败，退出代码 $($child.ExitCode)。"
            }
            if ([IO.File]::Exists($resultPath)) {
                [IO.File]::Delete($resultPath)
            }
            try {
                Invoke-GamePreview $paths $TimeSource
            } catch {
                Write-Host '操作已完成，请重新打开“查看游戏时间”确认记录。'
            }
            exit 0
        }
        if ($Action -eq 'Preview') {
            Invoke-GamePreview $paths $TimeSource
        } else {
            $lockStream = [IO.File]::Open($paths.Lock, [IO.FileMode]::OpenOrCreate,
                                         [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
            try {
                if ($Action -eq 'Start') {
                    Invoke-GameStart $paths $AfterStop $TimeSource
                } elseif ($Action -eq 'Stop') {
                    Invoke-GameStop $paths
                } elseif ($Action -eq 'RestartDB') {
                    Invoke-GameRestartDB $paths
                } else {
                    Invoke-GameRecover $paths $LastGameTime ([bool]$ClockIsReal)
                }
            } finally {
                $lockStream.Dispose()
            }
        }
        if ($LauncherWindow -and @('Start', 'Stop') -contains $Action) {
            Write-Host '操作完成，窗口将在 3 秒后关闭。'
            Start-Sleep -Seconds 3
        }
    } catch {
        $actionError = $_.Exception.Message
        if (-not [string]::IsNullOrWhiteSpace($ResultToken) -and $null -ne $paths) {
            try {
                $resultPath = [IO.Path]::Combine($paths.Root, "GameClock.result.$ResultToken.txt")
                [IO.File]::WriteAllText($resultPath, $actionError, (New-Object Text.UTF8Encoding($false)))
            } catch {
                # The visible console still receives the original error below.
            }
        }
        [Console]::Error.WriteLine($actionError)
        if ($LauncherWindow -and @('Start', 'Stop') -contains $Action -and
            -not [Console]::IsInputRedirected) {
            Write-Host '发生异常，按任意键退出。'
            try {
                $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
            } catch {
                $null = Read-Host '按回车键退出'
            }
        }
        exit 1
    }
}
