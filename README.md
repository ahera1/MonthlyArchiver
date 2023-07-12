# Script to Compress Old Files in Monthly ZIPs

This script uses PowerShell to group old files in a specified folder by month and compress them into ZIP files with year-month filenames.

## Usage

1. Clone the repository.
   ```shell
   https://github.com/ahera1/MonthlyArchiver.git
   ```
2. Run the PowerShell script.
   ```shell
   .\script.ps1 -folderPath "C:\Path\To\Folder" -zipFolderPath "C:\Path\To\ZipFolder"
   ```

Specify the `-folderPath` as the folder path of files to be compressed and `-zipFolderPath` as the folder path where the ZIP files will be saved.

## Requirements

This script meets the following requirements:

1. Excludes files with the current month's last modified date.
2. Excludes files that are already ZIP files.
3. Deletes the compressed files after a successful compression.

## Notes

This script requires PowerShell 5.1 or later.
Please provide absolute folder paths.
Ensure appropriate access permissions for the folders and files.
License
This project is licensed under the [MIT License](LICENSE).

---

# フォルダ内の古いファイルを月ごとに圧縮するスクリプト

このスクリプトは、PowerShell を使用して指定されたフォルダ内の古いファイルを月ごとにグループ化し、年月のファイル名で ZIP ファイル化するものです。

## 使い方

1. リポジトリをクローンします。
   ```shell
   https://github.com/ahera1/MonthlyArchiver.git
   ```
2. PowerShell スクリプトを実行します。
   ```shell
   .\script.ps1 -folderPath "C:\Path\To\Folder" -zipFolderPath "C:\Path\To\ZipFolder"
   ```

`-folderPath` には圧縮対象のフォルダパスを、`-zipFolderPath` には ZIP ファイルの保存先のフォルダパスを指定してください。

## 要件

このスクリプトは以下の要件を満たしています。

1. 当月の更新日のものは対象外
2. 圧縮対象ファイルが ZIP ファイルの場合は対象外
3. 圧縮が成功した場合、圧縮対象ファイルは削除する

## 注意事項

- このスクリプトは PowerShell 5.1 以降で動作します。
- フォルダパスは絶対パスで指定してください。
- フォルダやファイルにアクセス権限が必要です。

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE) の下で公開されています。
