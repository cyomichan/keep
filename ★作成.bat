@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul

set "target_folder=."

rem index.html を UTF-8 BOM付きで作成
rem PowerShellでBOMつき空ファイルを用意
powershell -Command "Set-Content -Encoding UTF8 -Path '%target_folder%\index.html' -Value ''"

rem ヘッダー部分を書き出し
>> "%target_folder%\index.html" echo ^<!DOCTYPE html^>
>> "%target_folder%\index.html" echo ^<html lang="ja"^>
>> "%target_folder%\index.html" echo ^<head^>
>> "%target_folder%\index.html" echo ^<meta charset="UTF-8"^>
>> "%target_folder%\index.html" echo ^<title^>HTMLファイル一覧^</title^>
>> "%target_folder%\index.html" echo ^</head^>
>> "%target_folder%\index.html" echo ^<body^>
>> "%target_folder%\index.html" echo ^<h1^>メモ一覧^</h1^>
>> "%target_folder%\index.html" echo ^<ul^>

rem HTMLファイルを1つずつ処理
for %%F in (*.html) do (
    if /I not "%%F"=="index.html" (
        >> "%target_folder%\index.html" echo     ^<li^>^<a href="%%F" target="_blank"^>%%F^</a^>^</li^>
    )
)

>> "%target_folder%\index.html" echo ^</ul^>
>> "%target_folder%\index.html" echo ^</body^>
>> "%target_folder%\index.html" echo ^</html^>

echo index.html を UTF-8 で作成しました。
pause
