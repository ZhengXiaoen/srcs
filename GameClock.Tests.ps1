$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'GameClock.ps1')
$realRestoreClock = (Get-Command Restore-RealClock -CommandType Function).ScriptBlock

function Assert-Equal {
    param($Expected, $Actual, [string]$Label)
    if ($Expected -ne $Actual) {
        throw "$Label : expected '$Expected', got '$Actual'"
    }
}

function Assert-True {
    param([bool]$Condition, [string]$Label)
    if (-not $Condition) {
        throw "$Label : assertion failed"
    }
}

function Assert-Throws {
    param([scriptblock]$Block, [string]$Label)
    $threw = $false
    try {
        & $Block
    } catch {
        $threw = $true
    }
    Assert-True $threw $Label
}

function Assert-BytesEqual {
    param([byte[]]$Expected, [byte[]]$Actual, [string]$Label)
    Assert-Equal $Expected.Length $Actual.Length "$Label length"
    for ($index = 0; $index -lt $Expected.Length; $index++) {
        if ($Expected[$index] -ne $Actual[$index]) {
            throw "$Label differs at byte $index"
        }
    }
}

# These replacements keep the tests away from the real system clock and processes.
$script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
$script:FakeUptime = [UInt64]100000
$script:FakeRunning = @()
$script:FakeStopFails = $false
$script:FailToStart = ''
$script:FailAfterLaunch = $false
$script:RestoreCalls = 0
$script:FakeBootId = 'test-boot'

function Get-Date {
    return $script:FakeNow
}

function Get-UptimeMilliseconds {
    return $script:FakeUptime
}

function Get-BootId {
    return $script:FakeBootId
}

function Set-ComputerClock {
    param([datetime]$Target)
    $script:FakeNow = $Target
}

function Restore-RealClock {
    param($State, $Paths)
    if ($null -ne $Paths -and @(Get-RunningServerNames $Paths).Count -gt 0) {
        throw 'simulated live process blocks clock restoration'
    }
    $null = Get-ElapsedMilliseconds $State
    $script:RestoreCalls++
    $script:FakeNow = Parse-ClockTime '2026-09-25 09:00:00'
}

function Get-RunningServerNames {
    param($Paths)
    $script:FakeRunning
}

function Stop-ManagedProcesses {
    param($Paths)
    if ($script:FakeStopFails) {
        throw 'simulated stop failure'
    }
    $script:FakeRunning = @()
}

function Get-Service {
    [CmdletBinding()]
    param([string]$Name)
    return $null
}

function Start-Sleep {
    param([int]$Seconds)
    if ($script:FailAfterLaunch) {
        $script:FakeRunning = @($script:FakeRunning | Where-Object { $_ -ne 'DBServer64_R' })
        $script:FailAfterLaunch = $false
    }
}

function Start-Process {
    [CmdletBinding()]
    param(
        [string]$FilePath,
        [string]$WorkingDirectory,
        [string]$WindowStyle,
        [switch]$PassThru
    )
    $name = [IO.Path]::GetFileNameWithoutExtension($FilePath)
    if ($name -eq $script:FailToStart) {
        throw 'simulated launch failure'
    }
    $script:FakeRunning += $name
    return [pscustomobject]@{ Name = $name }
}

function New-TestRoot {
    param([string]$Base, [string]$Name)
    $folder = [IO.Path]::Combine($Base, $Name)
    $configFolder = [IO.Path]::Combine($folder, 'Server', 'S1001')
    [IO.Directory]::CreateDirectory($configFolder) | Out-Null
    [IO.File]::Copy(
        ([IO.Path]::Combine($PSScriptRoot, 'Server', 'S1001', 'LogicServer.txt')),
        ([IO.Path]::Combine($configFolder, 'LogicServer.txt'))
    )
    $fixtureConfig = [IO.Path]::Combine($configFolder, 'LogicServer.txt')
    $fixtureStampOffset = (Read-OpenConfig $fixtureConfig).StampOffset
    [byte[]]$fixtureBytes = [IO.File]::ReadAllBytes($fixtureConfig)
    [Array]::Copy(
        ([Text.Encoding]::ASCII.GetBytes('2026-06-14 10:00:00')), 0,
        $fixtureBytes, $fixtureStampOffset, 19
    )
    [IO.File]::WriteAllBytes($fixtureConfig, $fixtureBytes)
    foreach ($launcher in $script:Launchers) {
        $directory = [IO.Path]::Combine($folder, $launcher.Directory)
        [IO.Directory]::CreateDirectory($directory) | Out-Null
        [IO.File]::WriteAllBytes(([IO.Path]::Combine($directory, $launcher.File)), [byte[]]@())
    }
    return Get-ClockPaths $folder
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$testRoot = [IO.Path]::Combine($tempBase, ('GameClockTest-' + [guid]::NewGuid().ToString('N')))
[IO.Directory]::CreateDirectory($testRoot) | Out-Null
try {
    $paths = New-TestRoot $testRoot 'success'
    [byte[]]$original = [IO.File]::ReadAllBytes($paths.Config)
    $firstPlan = Get-StartPlan (Read-OpenConfig $paths.Config) $null $script:FakeNow
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime $firstPlan.Target) 'first target'
    $afternoonPlan = Get-StartPlan (Read-OpenConfig $paths.Config) $null (Parse-ClockTime '2026-09-25 15:00:00')
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime $afternoonPlan.Target) 'first target after 10'
    $differentHour = [pscustomobject]@{ OpenTime = Parse-ClockTime '2026-06-14 09:00:00' }
    $fixedTenPlan = Get-StartPlan $differentHour $null $script:FakeNow
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime $fixedTenPlan.Target) 'first target ignores old hour'

    Invoke-GameStart $paths 'RestoreReal'
    $runningState = Read-ClockState $paths.State
    Assert-Equal 'running' $runningState.phase 'running state'
    Assert-Equal '2026-09-25 10:00:00' $runningState.openTime 'open time'
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime $script:FakeNow) 'applied game time'
    Assert-BytesEqual $original ([IO.File]::ReadAllBytes($paths.Backup)) 'original backup'
    $changed = Read-OpenConfig $paths.Config
    [byte[]]$expectedConfig = New-Object byte[] $original.Length
    [Array]::Copy($original, $expectedConfig, $original.Length)
    [Array]::Copy(
        ([Text.Encoding]::ASCII.GetBytes('2026-09-25 10:00:00')), 0,
        $expectedConfig, $changed.StampOffset, 19
    )
    Assert-BytesEqual $expectedConfig ([IO.File]::ReadAllBytes($paths.Config)) 'config preservation'
    Assert-Throws { Get-StartPlan (Read-OpenConfig $paths.Config) $runningState $script:FakeNow } 'running state blocks another start'

    $runningCount = $script:FakeRunning.Count
    Invoke-GameRestartDB $paths
    Assert-Equal $runningCount $script:FakeRunning.Count 'DB restart does not duplicate running service'
    $script:FakeRunning = @($script:FakeRunning | Where-Object { $_ -ne 'DBServer64_R' })
    $script:FakeNow = Parse-ClockTime '2026-09-25 11:00:00'
    Assert-Throws { Invoke-GameRestartDB $paths } 'DB restart rejects shifted clock'
    $script:FakeNow = Parse-ClockTime '2026-09-25 10:00:00'
    Invoke-GameRestartDB $paths
    Assert-Equal 1 @($script:FakeRunning | Where-Object { $_ -eq 'DBServer64_R' }).Count 'DB service restarts once'
    Assert-Equal 'running' (Read-ClockState $paths.State).phase 'DB restart keeps time state'

    $script:FakeNow = Parse-ClockTime '2026-09-25 23:30:00'
    $script:FakeUptime = [UInt64]48700000
    $script:FakeStopFails = $true
    Assert-Throws { Invoke-GameStop $paths } 'unfinished stop'
    Assert-Equal 'running' (Read-ClockState $paths.State).phase 'failed stop keeps state'
    $script:FakeStopFails = $false
    Invoke-GameStop $paths
    $stoppedState = Read-ClockState $paths.State
    Assert-Equal 'stopped' $stoppedState.phase 'stopped state'
    Assert-Equal '2026-09-26 01:30:00' $stoppedState.nextStart 'two hours across midnight'
    Assert-Equal 1 $script:RestoreCalls 'real time restoration'
    Assert-Throws { Invoke-GameRestartDB $paths } 'DB restart requires running session'
    Invoke-GameStop $paths
    Assert-Equal '2026-09-26 01:30:00' (Read-ClockState $paths.State).nextStart 'repeated stop'

    $script:FakeNow = Parse-ClockTime '2026-09-26 08:00:00'
    $script:FakeUptime = [UInt64]50000000
    Invoke-GameStart $paths 'RestoreReal'
    Assert-Equal '2026-09-26 01:30:00' (Format-ClockTime $script:FakeNow) 'saved time used on restart'
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime (Read-OpenConfig $paths.Config).OpenTime) 'open time stays fixed'
    Assert-BytesEqual $original ([IO.File]::ReadAllBytes($paths.Backup)) 'backup not overwritten'
    $script:FakeRunning = @()
    Assert-Throws { Invoke-GameStop $paths } 'vanished server cannot advance automatically'
    Assert-Equal 'interrupted' (Read-ClockState $paths.State).phase 'crashed session remains pending'
    Assert-Throws {
        Invoke-GameRecover $paths '2026-09-26 01:00:00'
    } 'recovery cannot precede crashed session start'
    Invoke-GameRecover $paths '2026-09-26 05:00:00'
    Assert-Equal '2026-09-26 07:00:00' (Read-ClockState $paths.State).nextStart 'explicit crash recovery'
    Assert-Throws {
        Invoke-GameRecover $paths '2026-09-26 01:00:00' $true
    } 'normal stopped time cannot be overwritten'
    Assert-Equal '2026-09-26 07:00:00' (Read-ClockState $paths.State).nextStart 'recovery keeps stopped record'

    $restoreState = [pscustomobject]@{
        uptimeMs = '100000'
        bootId = 'test-boot'
        realStartUtc = '2026-09-25 00:00:00'
    }
    $script:FakeUptime = [UInt64]3700000
    & $realRestoreClock $restoreState
    $expectedReal = [datetime]::SpecifyKind(
        (Parse-ClockTime '2026-09-25 01:00:00'), [DateTimeKind]::Utc
    ).ToLocalTime()
    Assert-Equal (Format-ClockTime $expectedReal) (Format-ClockTime $script:FakeNow) 'monotonic real clock formula'
    $script:FakeRunning = @('LogicServerCQ64_R')
    $beforeGuard = Format-ClockTime $script:FakeNow
    Assert-Throws { & $realRestoreClock $restoreState $paths } 'real clock restoration rejects live server'
    Assert-Equal $beforeGuard (Format-ClockTime $script:FakeNow) 'live server guard leaves clock alone'
    $script:FakeRunning = @()
    $script:FakeBootId = 'another-boot'
    Assert-Throws { Get-ElapsedMilliseconds $restoreState } 'reboot blocks elapsed-time calculation'
    $script:FakeBootId = 'test-boot'

    $badStatePath = [IO.Path]::Combine($testRoot, 'broken-state.json')
    [IO.File]::WriteAllText($badStatePath, '{bad json')
    Assert-Throws { Read-ClockState $badStatePath } 'invalid state is not first start'
    [IO.File]::WriteAllText($badStatePath, '{}')
    Assert-Throws { Read-ClockState $badStatePath } 'missing state fields'

    $failurePaths = New-TestRoot $testRoot 'startup-failure'
    [byte[]]$failureOriginal = [IO.File]::ReadAllBytes($failurePaths.Config)
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]90000000
    $script:FakeRunning = @()
    $script:FailToStart = 'GateServer64_R'
    Assert-Throws { Invoke-GameStart $failurePaths 'RestoreReal' } 'startup failure'
    Assert-True (-not [IO.File]::Exists($failurePaths.State)) 'failed first start clears state'
    Assert-True (-not [IO.File]::Exists($failurePaths.Backup)) 'failed first start clears backup'
    Assert-BytesEqual $failureOriginal ([IO.File]::ReadAllBytes($failurePaths.Config)) 'failed first start restores config'
    Assert-Equal 0 $script:FakeRunning.Count 'failed first start closes partial processes'

    $blockedPaths = New-TestRoot $testRoot 'stop-failure-during-start'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]100000000
    $script:FakeRunning = @()
    $script:FakeStopFails = $true
    Assert-Throws { Invoke-GameStart $blockedPaths 'RestoreReal' } 'startup rollback cannot stop process'
    Assert-Equal 'launching' (Read-ClockState $blockedPaths.State).phase 'failed rollback keeps pending state'
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime (Read-OpenConfig $blockedPaths.Config).OpenTime) 'failed rollback keeps matching config'
    $script:FakeStopFails = $false
    Invoke-GameStop $blockedPaths
    Assert-True (-not [IO.File]::Exists($blockedPaths.State)) 'stop repairs interrupted first start'
    Assert-True (-not [IO.File]::Exists($blockedPaths.Backup)) 'stop restores original config'
    Assert-Equal '2026-06-14 10:00:00' (Format-ClockTime (Read-OpenConfig $blockedPaths.Config).OpenTime) 'original config restored'

    $latePaths = New-TestRoot $testRoot 'logic-started-then-failed'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]110000000
    $script:FakeRunning = @()
    $script:FailToStart = ''
    $script:FailAfterLaunch = $true
    Assert-Throws { Invoke-GameStart $latePaths 'RestoreReal' } 'failure after Logic launch'
    Assert-Equal 'interrupted' (Read-ClockState $latePaths.State).phase 'Logic launch preserves state'
    Assert-True ([IO.File]::Exists($latePaths.Backup)) 'Logic launch preserves original backup'
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime (Read-OpenConfig $latePaths.Config).OpenTime) 'Logic launch preserves new open date'
    Assert-Equal 0 $script:FakeRunning.Count 'Logic launch failure still closes partial processes'

    $partialCrashPaths = New-TestRoot $testRoot 'logic-crashed-partial-services'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]120000000
    Invoke-GameStart $partialCrashPaths 'RestoreReal'
    $script:FakeNow = Parse-ClockTime '2026-09-25 14:00:00'
    $script:FakeUptime = [UInt64]134400000
    $script:FakeRunning = @('DBServer64_R')
    $restoresBeforeCrash = $script:RestoreCalls
    Assert-Throws { Invoke-GameStop $partialCrashPaths } 'logic crash with database still running'
    $partialCrashState = Read-ClockState $partialCrashPaths.State
    Assert-Equal 'interrupted' $partialCrashState.phase 'partial crash is recorded'
    Assert-True (-not $partialCrashState.needsRestore) 'partial crash real clock restored'
    Assert-Equal ($restoresBeforeCrash + 1) $script:RestoreCalls 'partial crash restores clock once'
    Assert-Equal 0 $script:FakeRunning.Count 'partial crash closes remaining services'
    Assert-Throws { Invoke-GameStart $partialCrashPaths 'RestoreReal' } 'partial crash blocks next startup'

    $dbCrashPaths = New-TestRoot $testRoot 'database-missing-at-stop'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]135000000
    Invoke-GameStart $dbCrashPaths 'RestoreReal'
    $script:FakeNow = Parse-ClockTime '2026-09-25 11:00:00'
    $script:FakeUptime = [UInt64]138600000
    $script:FakeRunning = @($script:FakeRunning | Where-Object { $_ -ne 'DBServer64_R' })
    Assert-Throws { Invoke-GameStop $dbCrashPaths } 'database missing blocks automatic settlement'
    Assert-Equal 'interrupted' (Read-ClockState $dbCrashPaths.State).phase 'database outage is recorded'
    Assert-Equal '2026-09-25 10:00:00' (Read-ClockState $dbCrashPaths.State).nextStart 'database outage does not advance time'

    $fullCrashPaths = New-TestRoot $testRoot 'all-processes-vanished'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]140000000
    Invoke-GameStart $fullCrashPaths 'RestoreReal'
    $script:FakeRunning = @()
    $script:FakeUptime = [UInt64]145000000
    $restoresBeforeCrash = $script:RestoreCalls
    Assert-Throws { Invoke-GameStop $fullCrashPaths } 'all processes vanished before stop'
    Assert-Equal 'interrupted' (Read-ClockState $fullCrashPaths.State).phase 'full crash is recorded'
    Assert-Equal ($restoresBeforeCrash + 1) $script:RestoreCalls 'full crash restores real clock'

    $jumpPaths = New-TestRoot $testRoot 'clock-jump'
    $script:FakeNow = Parse-ClockTime '2026-09-25 08:00:00'
    $script:FakeUptime = [UInt64]150000000
    Invoke-GameStart $jumpPaths 'RestoreReal'
    $script:FakeNow = Parse-ClockTime '2026-09-25 17:00:00'
    $script:FakeUptime = [UInt64]153600000
    Assert-Throws { Invoke-GameStop $jumpPaths } 'clock jump blocks automatic settlement'
    $jumpState = Read-ClockState $jumpPaths.State
    Assert-Equal 'interrupted' $jumpState.phase 'clock jump keeps abnormal record'
    Assert-Equal '2026-09-25 10:00:00' $jumpState.nextStart 'clock jump does not invent next time'
    Assert-Equal 0 $script:FakeRunning.Count 'clock jump still closes server'
    Invoke-GameRecover $jumpPaths '2026-09-25 17:00:00'
    Assert-Equal '2026-09-25 19:00:00' (Read-ClockState $jumpPaths.State).nextStart 'recovery uses last log time'

    $preparingPaths = New-TestRoot $testRoot 'interrupted-before-clock'
    $preparing = [pscustomobject][ordered]@{
        schema = 3
        phase = 'preparing'
        openTime = '2026-09-25 10:00:00'
        configHash = Get-ConfigHash (Read-OpenConfig $preparingPaths.Config).Bytes
        nextStart = '2026-09-25 10:00:00'
        sessionStart = '2026-09-25 10:00:00'
        realStartUtc = '2026-09-25 00:00:00'
        uptimeMs = '100000000'
        bootId = 'test-boot'
        mode = 'RestoreReal'
        needsRestore = $false
        firstStart = $true
    }
    Write-ClockState $preparingPaths.State $preparing
    $script:FakeRunning = @()
    Invoke-GameStop $preparingPaths
    Assert-True (-not [IO.File]::Exists($preparingPaths.State)) 'early interrupted start clears state'
    Assert-Equal '2026-06-14 10:00:00' (Format-ClockTime (Read-OpenConfig $preparingPaths.Config).OpenTime) 'early interruption keeps config'

    $rebootPaths = New-TestRoot $testRoot 'reboot-during-preparation'
    Write-ClockState $rebootPaths.State $preparing
    $script:FakeBootId = 'another-boot'
    Assert-Throws { Invoke-GameStop $rebootPaths } 'reboot prevents automatic clock restoration'
    Assert-Equal 'preparing' (Read-ClockState $rebootPaths.State).phase 'reboot keeps preparation marker'
    Invoke-GameRecover $rebootPaths '' $true
    Assert-True (-not [IO.File]::Exists($rebootPaths.State)) 'confirmed real clock clears preparation marker'
    $script:FakeBootId = 'test-boot'

    $alignedPaths = New-TestRoot $testRoot 'already-aligned-config'
    $alignedConfig = Read-OpenConfig $alignedPaths.Config
    [byte[]]$alignedBytes = [byte[]]$alignedConfig.Bytes.Clone()
    [Array]::Copy(
        ([Text.Encoding]::ASCII.GetBytes('2026-09-25 10:00:00')), 0,
        $alignedBytes, $alignedConfig.StampOffset, 19
    )
    [IO.File]::WriteAllBytes($alignedPaths.Config, $alignedBytes)
    $alignedPreparing = $preparing | ConvertTo-Json | ConvertFrom-Json
    $alignedPreparing.configHash = Get-ConfigHash $alignedBytes
    Write-ClockState $alignedPaths.State $alignedPreparing
    Invoke-GameRecover $alignedPaths '' $true
    Assert-True (-not [IO.File]::Exists($alignedPaths.State)) 'already aligned config can recover without backup'

    $launchingPaths = New-TestRoot $testRoot 'reboot-before-logic-launch'
    [byte[]]$launchingOriginal = [IO.File]::ReadAllBytes($launchingPaths.Config)
    $launchingState = $preparing | ConvertTo-Json | ConvertFrom-Json
    $launchingState.phase = 'launching'
    $launchingState.configHash = Get-ConfigHash $launchingOriginal
    Set-OpenConfig (Read-OpenConfig $launchingPaths.Config) (Parse-ClockTime '2026-09-25 10:00:00') $launchingPaths.Backup
    Write-ClockState $launchingPaths.State $launchingState
    $script:FakeBootId = 'another-boot'
    Invoke-GameRecover $launchingPaths '' $true
    $script:FakeBootId = 'test-boot'
    Assert-True (-not [IO.File]::Exists($launchingPaths.State)) 'launching phase can recover after reboot'
    Assert-True (-not [IO.File]::Exists($launchingPaths.Backup)) 'launching recovery clears backup'
    Assert-BytesEqual $launchingOriginal ([IO.File]::ReadAllBytes($launchingPaths.Config)) 'launching recovery restores config'

    $tamperedPaths = New-TestRoot $testRoot 'tampered-original-backup'
    $tamperedState = $preparing | ConvertTo-Json | ConvertFrom-Json
    $tamperedState.configHash = Get-ConfigHash (Read-OpenConfig $tamperedPaths.Config).Bytes
    Set-OpenConfig (Read-OpenConfig $tamperedPaths.Config) (Parse-ClockTime '2026-09-25 10:00:00') $tamperedPaths.Backup
    [IO.File]::WriteAllBytes($tamperedPaths.Backup, [byte[]]@(1, 2, 3))
    Write-ClockState $tamperedPaths.State $tamperedState
    Assert-Throws { Invoke-GameRecover $tamperedPaths '' $true } 'tampered backup cannot overwrite config'
    Assert-True ([IO.File]::Exists($tamperedPaths.State)) 'tampered backup keeps recovery record'
    Assert-Equal '2026-09-25 10:00:00' (Format-ClockTime (Read-OpenConfig $tamperedPaths.Config).OpenTime) 'tampered backup leaves current config intact'

    $restorePaths = New-TestRoot $testRoot 'restore-after-reboot'
    $restorePending = [pscustomobject][ordered]@{
        schema = 3
        phase = 'stopped'
        openTime = '2026-09-25 10:00:00'
        configHash = Get-ConfigHash (Read-OpenConfig $restorePaths.Config).Bytes
        nextStart = '2026-09-26 03:30:00'
        sessionStart = '2026-09-25 10:00:00'
        realStartUtc = '2026-09-25 00:00:00'
        uptimeMs = '100000000'
        bootId = 'test-boot'
        mode = 'RestoreReal'
        needsRestore = $true
        firstStart = $false
    }
    Write-ClockState $restorePaths.State $restorePending
    Invoke-GameRecover $restorePaths '' $true
    $restoredState = Read-ClockState $restorePaths.State
    Assert-Equal '2026-09-26 03:30:00' $restoredState.nextStart 'manual real clock confirmation preserves next time'
    Assert-True (-not $restoredState.needsRestore) 'manual real clock confirmation clears restoration flag'

    $script:FakeProcessList = @(
        [pscustomobject]@{
            Path = [IO.Path]::Combine($paths.Root, 'Server', 'S1001', 'x64', 'LogicServerCQ64_R.exe')
            ProcessName = 'LogicServerCQ64_R'
            Id = 101
        },
        [pscustomobject]@{
            Path = 'C:\OtherServer\LogicServerCQ64_R.exe'
            ProcessName = 'LogicServerCQ64_R'
            Id = 102
        }
    )
    function Get-Process {
        [CmdletBinding()]
        param([string]$Name, [int]$Id)
        $script:FakeProcessList | Where-Object { $_.ProcessName -eq $Name }
    }
    $inventory = Get-ServerInventory $paths
    Assert-Equal 1 $inventory.Ours.Count 'own process identified by path'
    Assert-Equal 1 $inventory.Foreign.Count 'other installation identified by path'

    Write-Host 'GameClock tests passed (clock and process operations were simulated).'
} finally {
    $resolved = [IO.Path]::GetFullPath($testRoot)
    if (-not $resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -or
        -not ([IO.Path]::GetFileName($resolved)).StartsWith('GameClockTest-')) {
        throw "Refusing to delete unexpected test directory: $resolved"
    }
    [IO.Directory]::Delete($resolved, $true)
}
