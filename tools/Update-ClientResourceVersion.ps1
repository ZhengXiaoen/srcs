$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$apiPath = Join-Path $repoRoot 'web/api.php'
$gameFramePath = Join-Path $repoRoot 'web/GameFrame.swf'
$languagePackPath = Join-Path $repoRoot 'web/v2/lang/zh-cn/zh-cn.dat'

foreach ($path in @($apiPath, $gameFramePath, $languagePackPath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "缺少客户端资源：$path"
    }
}

# api.php 含本机配置，不加入 Git；只替换资源版本这一行，保留其他字节。
$encoding = [Text.Encoding]::GetEncoding(28591)
$source = $encoding.GetString([IO.File]::ReadAllBytes($apiPath))
$legacyLine = '$ver= filemtime(__FILE__);'
$mtimeLine = '$ver = max(filemtime(__FILE__), filemtime(__DIR__ . "/GameFrame.swf"), filemtime(__DIR__ . "/v2/lang/zh-cn/zh-cn.dat"));'
$hashLine = '$ver = hexdec(substr(md5(md5_file(__DIR__ . "/GameFrame.swf") . md5_file(__DIR__ . "/v2/lang/zh-cn/zh-cn.dat")), 0, 7));'

$matches = @()
foreach ($line in @($legacyLine, $mtimeLine, $hashLine)) {
    $count = [regex]::Matches($source, [regex]::Escape($line)).Count
    if ($count -gt 1) {
        throw 'api.php 中存在重复的资源版本配置，未修改文件。'
    }
    if ($count -eq 1) {
        $matches += $line
    }
}
if ($matches.Count -ne 1) {
    throw 'api.php 的资源版本配置与预期不符，未修改文件。'
}
if ($matches[0] -eq $hashLine) {
    Write-Host '客户端资源版本已随资源内容更新。'
    exit 0
}

$updated = $source.Replace($matches[0], $hashLine)
[IO.File]::WriteAllBytes($apiPath, $encoding.GetBytes($updated))
Write-Host '已将客户端资源版本改为随游戏界面和语言包内容更新。'
