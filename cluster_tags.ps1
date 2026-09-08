# 聚类辅助脚本：统计标注卡气质标签的词频与共现
# 用法: ./cluster_tags.ps1 [-AnnoDir <路径>]
# 默认扫描当前目录下的 _标注 文件夹（或由 -AnnoDir 指定你的案例卡目录）
# 输出: 在标注目录生成 tag_analysis.md

param(
    [string]$AnnoDir = (Join-Path (Get-Location) '_annotations')
)

$ErrorActionPreference = 'Stop'
$dir = $AnnoDir
if (-not (Test-Path $dir)) { Write-Output "标注目录不存在: $dir（可用 -AnnoDir 指定，或用 ./cluster_tags.ps1 -AnnoDir <你的标注目录>）"; exit 1 }
$files = Get-ChildItem $dir -Filter 'case-*.md' -File

$wordCount = @{}
$pairCount = @{}
$cards = 0

foreach ($f in $files) {
    $text = Get-Content $f.FullName -Raw -Encoding UTF8
    $m = [regex]::Match($text, '(?m)^气质标签:\s*\[(.*?)\]')
    if (-not $m.Success) { continue }
    $tags = $m.Groups[1].Value -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    if ($tags.Count -eq 0) { continue }
    $cards++
    foreach ($t in $tags) {
        if (-not $wordCount.ContainsKey($t)) { $wordCount[$t] = 0 }
        $wordCount[$t]++
    }
    for ($i = 0; $i -lt $tags.Count; $i++) {
        for ($j = $i + 1; $j -lt $tags.Count; $j++) {
            $key = [string]::Join(' + ', @($tags[$i], $tags[$j]))
            if (-not $pairCount.ContainsKey($key)) { $pairCount[$key] = 0 }
            $pairCount[$key]++
        }
    }
}

$out = New-Object System.Collections.Generic.List[string]
$out.Add('# 气质标签词频分析')
$out.Add('')
$out.Add("共分析 $cards 张案例卡。")
$out.Add('')
$out.Add('## 单个气质词词频（降序）')
$out.Add('')
$out.Add('| 气质词 | 出现次数 |')
$out.Add('| --- | --- |')
$wordCount.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object {
    $out.Add("| $($_.Key) | $($_.Value) |")
}
$out.Add('')
$out.Add('## 两两共现 Top 20')
$out.Add('')
$out.Add('| 共现组合 | 次数 |')
$out.Add('| --- | --- |')
$pairCount.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 20 | ForEach-Object {
    $out.Add("| $($_.Key) | $($_.Value) |")
}

$outPath = Join-Path $dir 'tag_analysis.md'
[System.IO.File]::WriteAllLines($outPath, $out, (New-Object System.Text.UTF8Encoding($true)))
Write-Output "Analysis written to: $outPath ($cards cards)"