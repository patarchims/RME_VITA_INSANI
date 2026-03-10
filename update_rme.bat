@echo off
color 0B
title Update Aplikasi RME VITA
cls

set file_url=http://192.168.0.1:8181/app/images/files/RME_VITA.zip
set download_path=D:\HIS\RME_VITA_INSANI-master.zip
set temp_extract=D:\HIS\update_temp
set app_folder=D:\HIS\RME VITA
set app_name=vita_app.exe
set app_path="D:\HIS\RME VITA\vita_app.exe"

echo =========================================
echo        PEMBARUAN APLIKASI RME VITA
echo =========================================
echo.
echo Aplikasi sedang diperbarui.
echo Mohon jangan menutup jendela ini.
echo
echo.
echo [1/5] Mengunduh file pembaruan...
curl -L "%file_url%" -o "%download_path%" --progress-bar
echo Unduhan selesai.
echo.

echo [2/5] Menutup aplikasi RME VITA...
taskkill /IM "%app_name%" /F >nul 2>&1
timeout /t 2 >nul
echo Aplikasi berhasil ditutup.
echo.

echo [3/5] Mengekstrak file pembaruan...

if exist "%temp_extract%" rmdir /s /q "%temp_extract%"
mkdir "%temp_extract%"

powershell -command "Expand-Archive -Path '%download_path%' -DestinationPath '%temp_extract%' -Force"

echo Ekstraksi selesai.
echo.

echo [4/5] Memperbarui file aplikasi...

xcopy "%temp_extract%\RME_VITA_INSANI-master\*" "%app_folder%\" /E /Y /Q

echo File aplikasi berhasil diperbarui.
echo.

echo [5/5] Menjalankan kembali aplikasi...
start "" %app_path%

del "%download_path%" >nul 2>&1
rmdir /s /q "%temp_extract%" >nul 2>&1

echo.
echo =========================================
echo   PEMBARUAN APLIKASI BERHASIL DILAKUKAN
echo =========================================
echo.

pause