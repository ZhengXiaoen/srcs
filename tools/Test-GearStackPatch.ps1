$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')

# Exercise the real startup hook against a private copy, without clock changes.
$script:GearPatchRunning = @()
function Get-RunningServerNames { param($Paths) return $script:GearPatchRunning }
function Get-GearPatchHash { param($Path) return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
function Assert-GearPatch { param($Value, $Message) if (-not $Value) { throw $Message } }
function Assert-GearPatchThrows {
    param([scriptblock]$Action, $Message)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-GearPatch $failed $Message
}

$projectRoot = Split-Path $PSScriptRoot -Parent
$testRoot = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('SRCS-GearInstall-' + [guid]::NewGuid().ToString('N'))))
$directory = Join-Path $testRoot 'Server/S1001/x64'
$paths = [pscustomobject]@{ Root = $testRoot }
$exePath = Join-Path $directory 'LogicServerCQ64_R.exe'
$packagePath = Join-Path $directory 'gear-stack.patch.json'
try {
    $null = New-Item -ItemType Directory -Path $directory -Force
    Copy-Item -LiteralPath (Join-Path $projectRoot 'Server/S1001/x64/gear-stack.patch.json') -Destination $packagePath
    $package = [IO.File]::ReadAllText($packagePath) | ConvertFrom-Json
    $source = [IO.File]::ReadAllBytes((Join-Path $projectRoot 'Server/S1001/x64/LogicServerCQ64_R.exe'))
    if ((Get-ConfigHash $source) -eq $package.targetSha256) {
        $original = New-Object byte[] ([int]$package.sourceLength)
        [Array]::Copy($source, $original, $original.Length)
        foreach ($edit in $package.edits) {
            $before = [Convert]::FromBase64String($edit.before)
            [Array]::Copy($before, 0, $original, [int]$edit.offset, $before.Length)
        }
        $source = $original
    }
    Assert-GearPatch ((Get-ConfigHash $source) -eq $package.sourceSha256) '需要受支持逻辑服副本验证安装'
    [IO.File]::WriteAllBytes($exePath, $source)
    # The count manifest validates all 15 companion paths before the new hook.
    $manifest = [IO.File]::ReadAllText((Join-Path $projectRoot 'tools/item_count_9999_installed.json')) | ConvertFrom-Json
    foreach ($entry in $manifest.files) {
        $file = Join-Path $testRoot $entry.path
        $null = New-Item -ItemType Directory -Path (Split-Path $file -Parent) -Force
        if ($file -ne $exePath) { [IO.File]::WriteAllBytes($file, [byte[]](0)) }
    }
    $null = New-Item -ItemType Directory -Path (Join-Path $testRoot 'tools') -Force
    [IO.File]::WriteAllText((Join-Path $testRoot 'tools/item_count_9999_installed.json'), ($manifest | ConvertTo-Json -Depth 10), [Text.Encoding]::UTF8)
    $script:GearPatchRunning = @('LogicServerCQ64_R')
    Assert-GearPatchThrows { Install-MountStackPatch $paths } '运行时应拒绝安装'
    Assert-GearPatch ((Get-GearPatchHash $exePath) -eq $package.sourceSha256) '运行时修改了程序'
    $script:GearPatchRunning = @()
    Install-MountStackPatch $paths
    Assert-GearPatch ((Get-GearPatchHash $exePath) -eq $package.targetSha256) '启动安装结果不匹配'
    Assert-GearPatch ((Get-GearPatchHash ($exePath + '.before-gear-stack.bak')) -eq $package.sourceSha256) '备份内容不匹配'
    Install-MountStackPatch $paths
    Assert-GearPatch ((Get-GearPatchHash $exePath) -eq $package.targetSha256) '重复安装改变程序'
    Assert-GearPatch (-not (Test-Path -LiteralPath ($exePath + '.gear-stack.patch.json.new'))) '临时程序未替换'
    [IO.File]::WriteAllBytes($exePath, [byte[]](1, 2, 3))
    $unsupportedHash = Get-GearPatchHash $exePath
    Assert-GearPatchThrows { Install-MountStackPatch $paths } '不支持版本应拒绝安装'
    Assert-GearPatch ((Get-GearPatchHash $exePath) -eq $unsupportedHash) '不支持版本被修改'
    [IO.File]::WriteAllBytes($exePath, $source)
    $package.targetSha256 = '0' * 64
    [IO.File]::WriteAllText($packagePath, ($package | ConvertTo-Json -Depth 10), [Text.Encoding]::UTF8)
    Assert-GearPatchThrows { Install-MountStackPatch $paths } '错误结果哈希应拒绝安装'
    Assert-GearPatch ((Get-GearPatchHash $exePath) -eq $package.sourceSha256) '错误补丁修改了程序'
    Write-Host '装备堆叠补丁：启动安装、备份、重复安装、运行保护、版本及结果校验全部通过。'
} finally {
    $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $testRoot.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path $testRoot -Leaf) -notmatch '^SRCS-GearInstall-[0-9a-f]{32}$') {
        throw '测试清理路径超出临时目录'
    }
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
