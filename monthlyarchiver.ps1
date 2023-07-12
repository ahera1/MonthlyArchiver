# ----------------------------------------------------------------
# MonthlyArchiver - Script to Compress Old Files in Monthly ZIPs
# by ahera <https://github.com/ahera1/MonthlyArchiver>
# MIT License
# ----------------------------------------------------------------

param (
    [Parameter(Mandatory = $true)]
    [ValidateScript({Test-Path -Path $_ -PathType Container})]
    [string]$folderPath,

    [Parameter(Mandatory = $true)]
    [string]$zipFolderPath
)

# 当月の年月を取得します
$currentYearMonth = "{0:yyyyMM}" -f (Get-Date)

# フォルダが存在しない場合は作成します
if (-not (Test-Path -Path $zipFolderPath)) {
    New-Item -ItemType Directory -Path $zipFolderPath | Out-Null
}

# フォルダ内の全ファイルを取得し、更新日時でソートします
$files = Get-ChildItem -Path $folderPath | Sort-Object LastWriteTime

# 月ごとにグループ化して処理します
$groups = $files | Group-Object -Property { "{0:yyyyMM}" -f $_.LastWriteTime }

foreach ($group in $groups) {
    # グループの年月を取得します
    $yearMonth = $group.Name

    # 当月の場合はスキップします
    if ($yearMonth -eq $currentYearMonth) {
        continue
    }

    # ZIPファイルのパスを作成します
    $zipFilePath = Join-Path -Path $zipFolderPath -ChildPath "$yearMonth.zip"

    # グループ内のファイルを処理します
    foreach ($file in $group.Group) {
        # ZIPファイルの場合はスキップします
        if ($file.Extension -eq ".zip") {
            continue
        }

        # ファイルをZIP圧縮します
        try {
            Compress-Archive -Path $file.FullName -DestinationPath $zipFilePath -Update
            Write-Host "圧縮成功: $($file.Name)"
            # 圧縮成功したらファイルを削除します
            Remove-Item -Path $file.FullName -Force
        } catch {
            Write-Host "圧縮失敗: $($file.Name)"
        }
    }
}
