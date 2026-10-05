$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')

# Install against an isolated copy; never touch running servers or the clock.
$script:MountPatchFakeRunning = @()
function Get-RunningServerNames { param($Paths) return $script:MountPatchFakeRunning }
function Get-TestFileHash { param($Path) return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
function Assert-MountPatch { param($Value, $Message) if (-not $Value) { throw $Message } }
function Assert-MountPatchThrows {
    param([scriptblock]$Action, $Message)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-MountPatch $failed $Message
}

$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('SRCS-MountInstall-' + [Guid]::NewGuid().ToString('N'))
$testRoot = [IO.Path]::GetFullPath($testRoot)
$directory = Join-Path $testRoot 'Server/S1001/x64'
$null = New-Item -ItemType Directory -Path $directory -Force
$paths = [pscustomobject]@{ Root = $testRoot }
$projectRoot = Split-Path $PSScriptRoot -Parent
$exePath = Join-Path $directory 'LogicServerCQ64_R.exe'
$packagePath = Join-Path $directory 'mount-stack.patch.json'
$sourceExe = Join-Path $projectRoot 'Server/S1001/x64/LogicServerCQ64_R.exe'
$sourcePackage = Join-Path $projectRoot 'Server/S1001/x64/mount-stack.patch.json'
try {
    Copy-Item -LiteralPath $sourceExe -Destination $exePath
    Copy-Item -LiteralPath $sourcePackage -Destination $packagePath
    $package = [IO.File]::ReadAllText($packagePath) | ConvertFrom-Json
    $beforeHash = Get-TestFileHash $exePath
    Assert-MountPatch ($beforeHash -eq $package.sourceSha256) '需要原始逻辑服副本验证安装'
    $script:MountPatchFakeRunning = @('LogicServerCQ64_R')
    Assert-MountPatchThrows { Install-MountStackPatch $paths } '运行时应拒绝安装'
    Assert-MountPatch ((Get-TestFileHash $exePath) -eq $beforeHash) '运行时不能修改程序'
    $script:MountPatchFakeRunning = @()
    Install-MountStackPatch $paths
    Assert-MountPatch ((Get-TestFileHash $exePath) -eq $package.targetSha256) '补丁安装结果不匹配'
    Assert-MountPatch ((Get-TestFileHash ($exePath + '.before-mount-stack.bak')) -eq $beforeHash) '备份内容不匹配'
    Install-MountStackPatch $paths
    Assert-MountPatch ((Get-TestFileHash $exePath) -eq $package.targetSha256) '重复安装改变程序'
    Assert-MountPatch (-not (Test-Path -LiteralPath ($exePath + '.mount-stack.new'))) '临时程序未替换'
    [IO.File]::WriteAllBytes($exePath, [byte[]](1, 2, 3))
    $changedHash = Get-TestFileHash $exePath
    Assert-MountPatchThrows { Install-MountStackPatch $paths } '不支持版本应拒绝安装'
    Assert-MountPatch ((Get-TestFileHash $exePath) -eq $changedHash) '不支持版本被修改'
    Copy-Item -LiteralPath $sourceExe -Destination $exePath -Force
    $package.targetSha256 = '0' * 64
    [IO.File]::WriteAllText($packagePath, ($package | ConvertTo-Json -Depth 10), [Text.Encoding]::UTF8)
    Assert-MountPatchThrows { Install-MountStackPatch $paths } '结果哈希错误应拒绝安装'
    Assert-MountPatch ((Get-TestFileHash $exePath) -eq $beforeHash) '错误补丁修改了程序'
    Write-Host '坐骑补丁安装、备份、幂等、运行保护、版本及结果校验均通过。'
} finally {
    $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $testRoot.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path $testRoot -Leaf) -notmatch '^SRCS-MountInstall-[0-9a-f]{32}$') {
        throw '测试清理路径超出临时目录'
    }
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
