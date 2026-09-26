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
$oldLine = '$ver= filemtime(__FILE__);'
$newLine = '$ver = max(filemtime(__FILE__), filemtime(__DIR__ . "/GameFrame.swf"), filemtime(__DIR__ . "/v2/lang/zh-cn/zh-cn.dat"));'

if ([regex]::Matches($source, [regex]::Escape($newLine)).Count -eq 1) {
    Write-Host '客户端资源版本已随资源文件更新。'
    exit 0
}
if ([regex]::Matches($source, [regex]::Escape($oldLine)).Count -ne 1) {
    throw 'api.php 的资源版本配置与预期不符，未修改文件。'
}

$updated = $source.Replace($oldLine, $newLine)
[IO.File]::WriteAllBytes($apiPath, $encoding.GetBytes($updated))
Write-Host '已将客户端资源版本改为随游戏界面和语言包更新。'
