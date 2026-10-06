$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')

# Exercise the two packages on an isolated server copy without changing clocks.
$script:JingjiPatchFakeRunning = @()
function Get-RunningServerNames { param($Paths) return $script:JingjiPatchFakeRunning }
function Assert-JingjiPatch { param($Value, $Message) if (-not $Value) { throw $Message } }
function Get-JingjiPatchHash { param($Path) return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
function Assert-JingjiPatchThrows {
    param([scriptblock]$Action)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-JingjiPatch $failed '无效安装应被拒绝'
}

$testRoot = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('SRCS-JingjiMount-' + [Guid]::NewGuid().ToString('N'))))
$directory = Join-Path $testRoot 'Server/S1001/x64'
$null = New-Item -ItemType Directory -Path $directory -Force
$paths = [pscustomobject]@{ Root = $testRoot }
$projectRoot = Split-Path $PSScriptRoot -Parent
$sourceDirectory = Join-Path $projectRoot 'Server/S1001/x64'
$exePath = Join-Path $directory 'LogicServerCQ64_R.exe'
try {
    foreach ($name in @('mount-stack.patch.json', 'jingji-mount-consumption.patch.json', 'jingji-mount-yuanbao.patch.json')) {
        Copy-Item -LiteralPath (Join-Path $sourceDirectory $name) -Destination (Join-Path $directory $name)
    }
    $stackPackage = [IO.File]::ReadAllText((Join-Path $directory 'mount-stack.patch.json')) | ConvertFrom-Json
    $mountPackagePath = Join-Path $directory 'jingji-mount-consumption.patch.json'
    $mountPackage = [IO.File]::ReadAllText($mountPackagePath) | ConvertFrom-Json
    $yuanbaoPackagePath = Join-Path $directory 'jingji-mount-yuanbao.patch.json'
    $yuanbaoPackage = [IO.File]::ReadAllText($yuanbaoPackagePath) | ConvertFrom-Json
    $installed = [IO.File]::ReadAllBytes((Join-Path $sourceDirectory 'LogicServerCQ64_R.exe'))
    # Recover the original bytes using reviewed package before-ranges.
    foreach ($package in @($yuanbaoPackage, $mountPackage, $stackPackage)) {
        $sha = [Security.Cryptography.SHA256]::Create()
        try { $hash = ([BitConverter]::ToString($sha.ComputeHash($installed))).Replace('-', '').ToLowerInvariant() } finally { $sha.Dispose() }
        if ($hash -ne $package.targetSha256) { continue }
        $original = New-Object byte[] ([int]$package.sourceLength)
        [Array]::Copy($installed, $original, $original.Length)
        foreach ($edit in $package.edits) {
            $before = [Convert]::FromBase64String($edit.before)
            if ($before.Length -gt 0) { [Array]::Copy($before, 0, $original, [int]$edit.offset, $before.Length) }
        }
        $installed = $original
    }
    [IO.File]::WriteAllBytes($exePath, $installed)
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $stackPackage.sourceSha256) '恢复原始程序失败'
    $script:JingjiPatchFakeRunning = @('LogicServerCQ64_R')
    Assert-JingjiPatchThrows { Install-MountStackPatch $paths }
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $stackPackage.sourceSha256) '运行中修改了程序'
    $script:JingjiPatchFakeRunning = @()
    Install-MountStackPatch $paths
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $yuanbaoPackage.targetSha256) '两个补丁安装结果不匹配'
    Assert-JingjiPatch ((Get-JingjiPatchHash ($exePath + '.before-mount-stack.bak')) -eq $stackPackage.sourceSha256) '原始程序备份失败'
    Assert-JingjiPatch ((Get-JingjiPatchHash ($exePath + '.before-jingji-mount-consumption.bak')) -eq $mountPackage.sourceSha256) '坐骑堆叠程序备份失败'
    Assert-JingjiPatch ((Get-JingjiPatchHash ($exePath + '.before-jingji-mount-yuanbao.bak')) -eq $yuanbaoPackage.sourceSha256) '坐骑丹消耗程序备份失败'
    Install-MountStackPatch $paths
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $yuanbaoPackage.targetSha256) '重复安装改变程序'
    Copy-Item -LiteralPath ($exePath + '.before-jingji-mount-consumption.bak') -Destination $exePath -Force
    Install-MountStackPatch $paths
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $yuanbaoPackage.targetSha256) '已有堆叠补丁时无法升级'
    Copy-Item -LiteralPath ($exePath + '.before-jingji-mount-yuanbao.bak') -Destination $exePath -Force
    Install-MountStackPatch $paths
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $yuanbaoPackage.targetSha256) '已有材料计数补丁时无法升级'
    $finalHash = Get-JingjiPatchHash $exePath
    $before = [IO.File]::ReadAllBytes($exePath)
    [IO.File]::WriteAllBytes($exePath, [byte[]](1, 2, 3))
    Assert-JingjiPatchThrows { Install-MountStackPatch $paths }
    Assert-JingjiPatch ((Get-Item -LiteralPath $exePath).Length -eq 3) '不支持的程序被修改'
    [IO.File]::WriteAllBytes($exePath, $before)
    $script:JingjiPatchFakeRunning = @('LogicServerCQ64_R')
    Assert-JingjiPatchThrows { Install-MountStackPatch $paths }
    $script:JingjiPatchFakeRunning = @()
    $yuanbaoPackage.targetSha256 = '0' * 64
    [IO.File]::WriteAllText($yuanbaoPackagePath, ($yuanbaoPackage | ConvertTo-Json -Depth 10), [Text.Encoding]::UTF8)
    Assert-JingjiPatchThrows { Install-MountStackPatch $paths }
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $finalHash) '无效补丁改变程序'
    Copy-Item -LiteralPath ($exePath + '.before-jingji-mount-yuanbao.bak') -Destination $exePath -Force
    Assert-JingjiPatchThrows { Install-MountStackPatch $paths }
    Assert-JingjiPatch ((Get-JingjiPatchHash $exePath) -eq $yuanbaoPackage.sourceSha256) '结果哈希错误时修改了程序'
    Write-Host '坐骑丹及元宝代购记录补丁：顺序安装、现有版本升级、备份、重复安装、运行保护及版本校验通过。'
} finally {
    $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $testRoot.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path $testRoot -Leaf) -notmatch '^SRCS-JingjiMount-[0-9a-f]{32}$') {
        throw '测试清理路径超出临时目录'
    }
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
