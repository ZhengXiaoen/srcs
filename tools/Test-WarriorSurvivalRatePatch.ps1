$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')

# Exercise the real installer only on isolated copies, without starting servers.
$script:SurvivalPatchFakeRunning = @()
function Get-RunningServerNames { param($Paths) return $script:SurvivalPatchFakeRunning }
function Assert-SurvivalPatch { param($Value, $Message) if (-not $Value) { throw $Message } }
function Assert-SurvivalPatchThrows {
    param([scriptblock]$Action, $Message)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-SurvivalPatch $failed $Message
}
function Get-SurvivalTestHash {
    param($Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}
function Undo-TestPatch {
    param($Path, $Package)
    Assert-SurvivalPatch ((Get-SurvivalTestHash $Path) -eq $Package.targetSha256) '还原测试副本前版本不匹配'
    $bytes = [IO.File]::ReadAllBytes($Path)
    foreach ($edit in $Package.edits) {
        $before = [Convert]::FromBase64String($edit.before)
        [Array]::Copy($before, 0, $bytes, [int]$edit.offset, $before.Length)
    }
    $source = New-Object byte[] ([int]$Package.sourceLength)
    [Array]::Copy($bytes, $source, $source.Length)
    [IO.File]::WriteAllBytes($Path, $source)
    Assert-SurvivalPatch ((Get-SurvivalTestHash $Path) -eq $Package.sourceSha256) '还原测试副本后版本不匹配'
}

$testParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$testRoot = [IO.Path]::GetFullPath((Join-Path $testParent ('SRCS-SurvivalPatch-' + [Guid]::NewGuid().ToString('N'))))
$directory = Join-Path $testRoot 'Server/S1001/x64'
$null = New-Item -ItemType Directory -Path $directory -Force
$paths = [pscustomobject]@{ Root = $testRoot }
$projectDirectory = Join-Path (Split-Path $PSScriptRoot -Parent) 'Server/S1001/x64'
$exePath = Join-Path $directory 'LogicServerCQ64_R.exe'
$packageNames = @('mount-stack.patch.json', 'jingji-mount-consumption.patch.json',
                  'jingji-mount-yuanbao.patch.json', 'warrior-defense-rate.patch.json',
                  'warrior-survival-rate.patch.json')
try {
    foreach ($name in $packageNames) {
        Copy-Item -LiteralPath (Join-Path $projectDirectory $name) -Destination (Join-Path $directory $name)
    }
    $package = [IO.File]::ReadAllText((Join-Path $directory 'warrior-survival-rate.patch.json')) | ConvertFrom-Json
    $previous = [IO.File]::ReadAllText((Join-Path $directory 'warrior-defense-rate.patch.json')) | ConvertFrom-Json
    $liveExePath = Join-Path $projectDirectory 'LogicServerCQ64_R.exe'
    $liveHash = Get-SurvivalTestHash $liveExePath
    Copy-Item -LiteralPath $liveExePath -Destination $exePath
    if ((Get-SurvivalTestHash $exePath) -eq $package.targetSha256) {
        Undo-TestPatch $exePath $package
    }
    Assert-SurvivalPatch ((Get-SurvivalTestHash $exePath) -eq $package.sourceSha256) '测试副本版本不匹配'
    $sourceBytes = [IO.File]::ReadAllBytes($exePath)

    # Support upgrading both the previous correction and the earlier server.
    foreach ($restorePrevious in @($false, $true)) {
        [IO.File]::WriteAllBytes($exePath, $sourceBytes)
        if ($restorePrevious) { Undo-TestPatch $exePath $previous }
        $startingHash = Get-SurvivalTestHash $exePath
        $script:SurvivalPatchFakeRunning = @('LogicServerCQ64_R')
        Assert-SurvivalPatchThrows { Install-MountStackPatch $paths } '运行中应拒绝安装'
        Assert-SurvivalPatch ((Get-SurvivalTestHash $exePath) -eq $startingHash) '拒绝安装时不应改动程序'
        $script:SurvivalPatchFakeRunning = @()
        Install-MountStackPatch $paths
        Assert-SurvivalPatch ((Get-SurvivalTestHash $exePath) -eq $package.targetSha256) '完整安装流程结果不匹配'
        Assert-SurvivalPatch ((Get-SurvivalTestHash ($exePath + '.before-warrior-survival-rate.bak')) -eq $package.sourceSha256) '备份内容不匹配'
        if ($restorePrevious) {
            Assert-SurvivalPatch ((Get-SurvivalTestHash ($exePath + '.before-warrior-defense-rate.bak')) -eq $previous.sourceSha256) '前置补丁备份内容不匹配'
        }
        Install-MountStackPatch $paths
        Assert-SurvivalPatch ((Get-SurvivalTestHash $exePath) -eq $package.targetSha256) '重复开服应保留已安装补丁'
    }

    $bytes = [IO.File]::ReadAllBytes($exePath)
    $bytes[0] = $bytes[0] -bxor 1
    [IO.File]::WriteAllBytes($exePath, $bytes)
    $badHash = Get-SurvivalTestHash $exePath
    Assert-SurvivalPatchThrows { Install-MountStackPatch $paths } '版本异常应拒绝安装'
    Assert-SurvivalPatch ((Get-SurvivalTestHash $exePath) -eq $badHash) '版本异常时不应改动程序'
    Assert-SurvivalPatch ((Get-SurvivalTestHash $liveExePath) -eq $liveHash) '运行中的逻辑服不应被改动'
    Write-Host '战将生命及双防倍率：两种版本升级、备份、重复开服、版本保护及运行中保护验证通过。'
} finally {
    $resolvedTestRoot = [IO.Path]::GetFullPath($testRoot)
    if (-not $resolvedTestRoot.StartsWith($testParent, [StringComparison]::OrdinalIgnoreCase) -or
        [IO.Path]::GetFileName($resolvedTestRoot) -notlike 'SRCS-SurvivalPatch-*') {
        throw '测试目录清理范围不正确'
    }
    Remove-Item -LiteralPath $resolvedTestRoot -Recurse -Force -ErrorAction SilentlyContinue
}
