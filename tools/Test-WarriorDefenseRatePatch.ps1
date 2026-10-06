$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')

# Test the complete installer on copies; preserve the running server and clock.
$script:WarriorPatchFakeRunning = @()
function Get-RunningServerNames { param($Paths) return $script:WarriorPatchFakeRunning }
function Assert-WarriorPatch { param($Value, $Message) if (-not $Value) { throw $Message } }
function Assert-WarriorPatchThrows {
    param([scriptblock]$Action, $Message)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-WarriorPatch $failed $Message
}
function Get-WarriorTestHash {
    param($Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

$testParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$testRoot = [IO.Path]::GetFullPath((Join-Path $testParent ('SRCS-WarriorPatch-' + [Guid]::NewGuid().ToString('N'))))
$directory = Join-Path $testRoot 'Server/S1001/x64'
$null = New-Item -ItemType Directory -Path $directory -Force
$paths = [pscustomobject]@{ Root = $testRoot }
$projectDirectory = Join-Path (Split-Path $PSScriptRoot -Parent) 'Server/S1001/x64'
$exePath = Join-Path $directory 'LogicServerCQ64_R.exe'
$packageNames = @('mount-stack.patch.json', 'jingji-mount-consumption.patch.json',
                  'jingji-mount-yuanbao.patch.json', 'warrior-defense-rate.patch.json')
try {
    foreach ($name in $packageNames) {
        Copy-Item -LiteralPath (Join-Path $projectDirectory $name) -Destination (Join-Path $directory $name)
    }
    $package = [IO.File]::ReadAllText((Join-Path $directory 'warrior-defense-rate.patch.json')) | ConvertFrom-Json
    $liveExePath = Join-Path $projectDirectory 'LogicServerCQ64_R.exe'
    $liveHash = Get-WarriorTestHash $liveExePath
    Copy-Item -LiteralPath $liveExePath -Destination $exePath
    # Restore only the reviewed block on the isolated copy if already installed.
    if ((Get-WarriorTestHash $exePath) -eq $package.targetSha256) {
        $bytes = [IO.File]::ReadAllBytes($exePath)
        foreach ($edit in $package.edits) {
            $before = [Convert]::FromBase64String($edit.before)
            [Array]::Copy($before, 0, $bytes, [int]$edit.offset, $before.Length)
        }
        [IO.File]::WriteAllBytes($exePath, $bytes)
    }
    Assert-WarriorPatch ((Get-WarriorTestHash $exePath) -eq $package.sourceSha256) '测试副本版本不匹配'
    $script:WarriorPatchFakeRunning = @('LogicServerCQ64_R')
    Assert-WarriorPatchThrows { Install-MountStackPatch $paths } '运行中应拒绝安装'
    Assert-WarriorPatch ((Get-WarriorTestHash $exePath) -eq $package.sourceSha256) '拒绝安装时不应改动程序'
    $script:WarriorPatchFakeRunning = @()
    Install-MountStackPatch $paths
    Assert-WarriorPatch ((Get-WarriorTestHash $exePath) -eq $package.targetSha256) '完整安装流程结果不匹配'
    Assert-WarriorPatch ((Get-WarriorTestHash ($exePath + '.before-warrior-defense-rate.bak')) -eq $package.sourceSha256) '备份内容不匹配'
    Install-MountStackPatch $paths
    Assert-WarriorPatch ((Get-WarriorTestHash $exePath) -eq $package.targetSha256) '重复开服应保留已安装补丁'
    $bytes = [IO.File]::ReadAllBytes($exePath)
    $bytes[0] = $bytes[0] -bxor 1
    [IO.File]::WriteAllBytes($exePath, $bytes)
    $badHash = Get-WarriorTestHash $exePath
    Assert-WarriorPatchThrows { Install-MountStackPatch $paths } '版本异常应拒绝安装'
    Assert-WarriorPatch ((Get-WarriorTestHash $exePath) -eq $badHash) '版本异常时不应改动程序'
    Assert-WarriorPatch ((Get-WarriorTestHash $liveExePath) -eq $liveHash) '运行中的逻辑服不应被改动'
    Write-Host '战将倍率补丁安装、备份、重复开服、版本保护及运行中保护验证通过。'
} finally {
    $resolvedTestRoot = [IO.Path]::GetFullPath($testRoot)
    if (-not $resolvedTestRoot.StartsWith($testParent, [StringComparison]::OrdinalIgnoreCase) -or
        [IO.Path]::GetFileName($resolvedTestRoot) -notlike 'SRCS-WarriorPatch-*') {
        throw '测试目录清理范围不正确'
    }
    Remove-Item -LiteralPath $resolvedTestRoot -Recurse -Force -ErrorAction SilentlyContinue
}
