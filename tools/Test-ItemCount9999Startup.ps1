$ErrorActionPreference = 'Stop'
. (Join-Path (Split-Path $PSScriptRoot -Parent) 'GameClock.ps1')
function Assert-CountStartup { param($Value, $Message) if (-not $Value) { throw $Message } }
function Assert-CountStartupThrows {
    param([scriptblock]$Action, $Message)
    $failed = $false
    try { & $Action } catch { $failed = $true }
    Assert-CountStartup $failed $Message
}
$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('SRCS-CountStartup-' + [guid]::NewGuid().ToString('N'))
$testRoot = [IO.Path]::GetFullPath($testRoot)
$paths = [pscustomobject]@{ Root = $testRoot }
$relativePaths = @('Server/S1001/x64/LogicServerCQ64_R.exe', 'Server/common/x64/DBServer64_R.exe', 'web/GameFrame.swf')
$relativePaths += @(1..12 | ForEach-Object { "web/config$_.cbp" })
$manifestPath = Join-Path $testRoot 'tools/item_count_9999_installed.json'
try {
    New-Item -ItemType Directory -Path (Split-Path $manifestPath -Parent) -Force | Out-Null
    $files = @(foreach ($relative in $relativePaths) {
        $file = Join-Path $testRoot $relative
        New-Item -ItemType Directory -Path (Split-Path $file -Parent) -Force | Out-Null
        [IO.File]::WriteAllBytes($file, [Text.Encoding]::UTF8.GetBytes($relative))
        @{ path = $relative; sha256 = Get-ConfigHash ([IO.File]::ReadAllBytes($file)) }
    })
    $manifest = @{ schema = 1; files = $files }
    [IO.File]::WriteAllText($manifestPath, ($manifest | ConvertTo-Json -Depth 8), [Text.Encoding]::UTF8)
    Install-MountStackPatch $paths
    $client = Join-Path $testRoot 'web/GameFrame.swf'
    $savedClient = [IO.File]::ReadAllBytes($client)
    [IO.File]::WriteAllBytes($client, [byte[]](0, 1))
    Assert-CountStartupThrows { Install-MountStackPatch $paths } '新旧客户端混用应拒绝启动'
    [IO.File]::WriteAllBytes($client, $savedClient)
    $originalPath = $files[0].path
    $files[0].path = $files[1].path
    [IO.File]::WriteAllText($manifestPath, ($manifest | ConvertTo-Json -Depth 8), [Text.Encoding]::UTF8)
    Assert-CountStartupThrows { Install-MountStackPatch $paths } '重复路径应拒绝启动'
    $files[0].path = '../outside.exe'
    [IO.File]::WriteAllText($manifestPath, ($manifest | ConvertTo-Json -Depth 8), [Text.Encoding]::UTF8)
    Assert-CountStartupThrows { Install-MountStackPatch $paths } '目录外路径应拒绝启动'
    $files[0].path = $originalPath
    [IO.File]::WriteAllText($manifestPath, ($manifest | ConvertTo-Json -Depth 8), [Text.Encoding]::UTF8)
    Remove-Item -LiteralPath (Join-Path $testRoot 'Server/common/x64/DBServer64_R.exe')
    Assert-CountStartupThrows { Install-MountStackPatch $paths } '缺少数据库程序应拒绝启动'
    Write-Host '物品数量补丁启动校验：配套文件、混用、重复路径、越界路径及缺失程序检查通过。'
} finally {
    $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $testRoot.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path $testRoot -Leaf) -notmatch '^SRCS-CountStartup-[0-9a-f]{32}$') {
        throw '测试清理路径超出临时目录'
    }
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
