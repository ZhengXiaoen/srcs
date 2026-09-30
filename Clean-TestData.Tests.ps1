$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Clean-TestData.ps1')

function Assert-Equal {
    param($Expected, $Actual, [string]$Label)
    if ($Expected -ne $Actual) { throw "$Label : expected '$Expected', got '$Actual'" }
}

function Assert-True {
    param([bool]$Condition, [string]$Label)
    if (-not $Condition) { throw "$Label : assertion failed" }
}

function Assert-Throws {
    param([scriptblock]$Action, [string]$Label)
    $threw = $false
    try { & $Action } catch { $threw = $true }
    Assert-True $threw $Label
}

function Assert-BytesEqual {
    param([byte[]]$Expected, [byte[]]$Actual, [string]$Label)
    Assert-Equal ([Convert]::ToBase64String($Expected)) ([Convert]::ToBase64String($Actual)) $Label
}

function Get-CimInstance {
    param([string]$ClassName)
    return $script:FakeRunning
}

function Start-LocalMySql {
    $script:DatabaseStarts++
    if ($script:DatabaseFailure) { throw 'simulated database ownership failure' }
    if ($script:StartDuringCleanup) {
        $script:FakeRunning = @([pscustomobject]@{
            Name = 'LogicServerCQ64_R.exe'; ExecutablePath = "$root\Server\S1001\LogicServerCQ64_R.exe"
        })
    }
}

function Get-TargetTables {
    if ($script:SchemaFailure) { throw 'simulated schema mismatch' }
    return @('cq_actor.actors', 'cq_account.globaluser', 'cq_name.charnames', 'cq_name.guildnames')
}

function Get-TableCounts {
    param([string[]]$Tables)
    $counts = @{}
    foreach ($table in $Tables) {
        $counts[$table] = if ($script:FakeCleared -and -not $script:RemainingRecords) { 0 } else { 3 }
    }
    return $counts
}

function Invoke-MySql {
    param([string]$Sql)
    if ($script:SqlFailure) { throw 'simulated SQL failure' }
    $script:LastSql = $Sql
    $script:FakeCleared = $true
}

function New-CleanupFixture {
    param([string]$Name, [string]$State = '{"phase":"interrupted","needsRestore":true}')
    $script:root = Join-Path $testRoot $Name
    $script:runtime = Join-Path $root 'Server\S1001\data\runtime'
    $null = New-Item -ItemType Directory -Path (Join-Path $runtime 'rank') -Force
    foreach ($variable in @('mysql', 'mysqlAdmin', 'mysqld', 'ini')) {
        $path = Join-Path $root "$variable.fixture"
        [IO.File]::WriteAllText($path, 'fixture')
        Set-Variable -Name $variable -Value $path -Scope Script
    }
    $script:ConfigPath = Join-Path $root 'Server\S1001\LogicServer.txt'
    $script:OriginalPath = Join-Path $root 'GameClock.LogicServer.original.txt'
    $script:StatePath = Join-Path $root 'GameClock.state.json'
    $script:PendingPath = Join-Path $root 'Clean-TestData.pending'
    $script:SnapshotPath = Join-Path $root 'GameClock.state.before-nextStart.fixture.json'
    $script:RuntimeFile = Join-Path $runtime 'rank\test.bin'
    $script:KeepFile = Join-Path $root 'Server\S1001\keep.log'
    $script:OriginalText = "LogicServer = {`r`n ServerOpenTime = `"2026-06-14 10:00:00`",`r`n ServerName = `"old`",`r`n}`r`n"
    $script:CurrentText = "LogicServer = {`r`n ServerName = `"modified-longer`",`r`n ServerOpenTime = `"2026-09-26 10:00:00`",`r`n}`r`n" + [char]0xD6 + [char]0xD0
    $script:Encoding = [Text.Encoding]::GetEncoding(28591)
    [IO.File]::WriteAllBytes($OriginalPath, $Encoding.GetBytes($OriginalText))
    [IO.File]::WriteAllBytes($ConfigPath, $Encoding.GetBytes($CurrentText))
    [IO.File]::WriteAllText($StatePath, $State)
    [IO.File]::WriteAllText($SnapshotPath, 'snapshot')
    [IO.File]::WriteAllText($RuntimeFile, 'runtime')
    [IO.File]::WriteAllText($KeepFile, 'keep')
    $script:FakeRunning = @()
    $script:DatabaseStarts = 0
    $script:FakeCleared = $false
    $script:LastSql = ''
    $script:DatabaseFailure = $false
    $script:SchemaFailure = $false
    $script:SqlFailure = $false
    $script:RemainingRecords = $false
    $script:StartDuringCleanup = $false
}

function Assert-FixtureUntouched {
    Assert-True (Test-Path -LiteralPath $StatePath) 'state preserved'
    Assert-True (Test-Path -LiteralPath $OriginalPath) 'original preserved'
    Assert-True (Test-Path -LiteralPath $SnapshotPath) 'snapshot preserved'
    Assert-True (Test-Path -LiteralPath $RuntimeFile) 'runtime preserved'
    Assert-BytesEqual ($Encoding.GetBytes($CurrentText)) ([IO.File]::ReadAllBytes($ConfigPath)) 'config preserved'
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$testRoot = Join-Path $tempBase ('CleanTestDataTest-' + [guid]::NewGuid().ToString('N'))
$savedPassword = [Environment]::GetEnvironmentVariable('MYSQL_PWD', 'Process')
try {
    foreach ($state in @(
        '{"phase":"interrupted","needsRestore":true}',
        '{"phase":"running","firstStart":false,"configHash":"outdated"}',
        '{"phase":"stopped","firstStart":"invalid"}',
        '{broken json'
    )) {
        New-CleanupFixture ('history-' + [guid]::NewGuid().ToString('N')) $state
        Invoke-TestDataCleanup -DbPassword 'fixture-password' -ValidateOnly
        Assert-FixtureUntouched
        Assert-True (-not $FakeCleared) 'validation does not clear database'
        Invoke-TestDataCleanup -DbPassword 'fixture-password'
        Assert-True $FakeCleared 'old history does not block cleanup'
        Assert-True (-not (Test-Path -LiteralPath $PendingPath)) 'successful cleanup removes pending marker'
        Assert-True (-not (Test-Path -LiteralPath $StatePath)) 'state removed'
        Assert-True (-not (Test-Path -LiteralPath $OriginalPath)) 'original removed'
        Assert-True (-not (Test-Path -LiteralPath $SnapshotPath)) 'snapshot removed'
        Assert-True (-not (Test-Path -LiteralPath $RuntimeFile)) 'runtime removed'
        Assert-True (Test-Path -LiteralPath $KeepFile) 'historical text log retained'
        $expected = $CurrentText.Replace('2026-09-26 10:00:00', '2026-06-14 10:00:00')
        Assert-BytesEqual ($Encoding.GetBytes($expected)) ([IO.File]::ReadAllBytes($ConfigPath)) 'only time bytes restored'
        Assert-True ($LastSql.Contains('AUTO_INCREMENT=16777217')) 'account id seed preserved'
        Assert-True (-not $LastSql.Contains('filternames')) 'protected configuration not truncated'
        Invoke-TestDataCleanup -DbPassword 'fixture-password'
    }

    New-CleanupFixture 'missing-original'
    Remove-Item -LiteralPath $OriginalPath
    Invoke-TestDataCleanup -DbPassword 'fixture-password'
    Assert-True (-not (Test-Path -LiteralPath $StatePath)) 'missing original allows state cleanup'
    Assert-BytesEqual ($Encoding.GetBytes($CurrentText)) ([IO.File]::ReadAllBytes($ConfigPath)) 'missing original keeps config'

    New-CleanupFixture 'missing-state'
    Remove-Item -LiteralPath $StatePath
    Invoke-TestDataCleanup -DbPassword 'fixture-password'
    Assert-True (-not (Test-Path -LiteralPath $OriginalPath)) 'orphan original cleaned'

    New-CleanupFixture 'interrupted-cleanup'
    [IO.File]::WriteAllText($PendingPath, 'previous cleanup interrupted')
    Invoke-TestDataCleanup -DbPassword 'fixture-password' -ValidateOnly
    Assert-True (Test-Path -LiteralPath $PendingPath) 'validation keeps pending marker'
    Invoke-TestDataCleanup -DbPassword 'fixture-password'
    Assert-True (-not (Test-Path -LiteralPath $PendingPath)) 'retry clears pending marker'

    New-CleanupFixture 'live-server'
    $script:FakeRunning = @([pscustomobject]@{
        Name = 'LogicServerCQ64_R.exe'; ExecutablePath = "$root\Server\S1001\LogicServerCQ64_R.exe"
    })
    Assert-Throws { Invoke-TestDataCleanup -DbPassword 'fixture-password' } 'live server blocks cleanup'
    Assert-Equal 0 $DatabaseStarts 'live server blocked before database access'
    Assert-FixtureUntouched

    New-CleanupFixture 'shared-lock'
    $lock = [IO.File]::Open((Join-Path $root 'GameClock.lock'), [IO.FileMode]::OpenOrCreate,
        [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    try {
        Assert-Throws { Invoke-TestDataCleanup -DbPassword 'fixture-password' } 'start-stop lock blocks cleanup'
        Assert-Equal 0 $DatabaseStarts 'lock checked before database access'
        Assert-FixtureUntouched
    } finally { $lock.Dispose() }

    foreach ($failure in @('DatabaseFailure', 'SchemaFailure', 'SqlFailure', 'RemainingRecords', 'StartDuringCleanup')) {
        New-CleanupFixture $failure
        Set-Variable -Name $failure -Value $true -Scope Script
        Assert-Throws { Invoke-TestDataCleanup -DbPassword 'fixture-password' } $failure
        Assert-FixtureUntouched
        if (@('SqlFailure', 'RemainingRecords') -contains $failure) {
            Assert-True (Test-Path -LiteralPath $PendingPath) "$failure keeps pending marker"
            Set-Variable -Name $failure -Value $false -Scope Script
            Invoke-TestDataCleanup -DbPassword 'fixture-password'
            Assert-True (-not (Test-Path -LiteralPath $PendingPath)) "$failure retry clears pending marker"
        } else {
            Assert-True (-not (Test-Path -LiteralPath $PendingPath)) "$failure before deletion has no marker"
        }
        Assert-Equal $savedPassword ([Environment]::GetEnvironmentVariable('MYSQL_PWD', 'Process')) 'password restored after failure'
        $lock = [IO.File]::Open((Join-Path $root 'GameClock.lock'), [IO.FileMode]::Open,
            [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
        $lock.Dispose()
    }

    New-CleanupFixture 'outside-runtime'
    $script:runtime = $testRoot
    Assert-Throws { Invoke-TestDataCleanup -DbPassword 'fixture-password' } 'outside runtime rejected'
    Assert-Equal 0 $DatabaseStarts 'directory checked before database access'
    Assert-FixtureUntouched

    New-CleanupFixture 'ambiguous-config'
    [IO.File]::AppendAllText($OriginalPath, "`r`n ServerOpenTime = `"2026-01-01 00:00:00`",`r`n")
    Assert-Throws { Invoke-TestDataCleanup -DbPassword 'fixture-password' } 'ambiguous time rejected'
    Assert-Equal 0 $DatabaseStarts 'configuration checked before database access'
    Assert-FixtureUntouched

    Assert-Equal $savedPassword ([Environment]::GetEnvironmentVariable('MYSQL_PWD', 'Process')) 'password restored'
    Write-Host 'Clean-TestData tests passed (temporary files and simulated database/processes).'
} finally {
    [Environment]::SetEnvironmentVariable('MYSQL_PWD', $savedPassword, 'Process')
    $resolved = [IO.Path]::GetFullPath($testRoot)
    if (-not $resolved.StartsWith($tempBase.TrimEnd('\') + '\', [StringComparison]::OrdinalIgnoreCase) -or
        -not ([IO.Path]::GetFileName($resolved)).StartsWith('CleanTestDataTest-')) {
        throw "Refusing to delete unexpected test directory: $resolved"
    }
    if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
}
