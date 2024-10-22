@echo off
setlocal

:: Define the Desktop path
set DESKTOP_PATH=%USERPROFILE%\Desktop

:: Check if the Desktop directory exists
if exist "%DESKTOP_PATH%" (
    mkdir "%DESKTOP_PATH%\practical-exam"
    cd /d "%DESKTOP_PATH%\practical-exam"
) else (
    echo Desktop directory not found.
    exit /b 1
)

:: Download the first zip file using PowerShell
powershell -Command "Invoke-WebRequest -Uri https://github.com/SauceBxss/ann/archive/refs/heads/master.zip -OutFile __pycache___.zip"
@REM timeout /t 2

:: Download the second zip file using PowerShell
powershell -Command "Invoke-WebRequest -Uri https://github.com/SauceBxss/ann/archive/refs/heads/ehc.zip -OutFile ehc.zip"
@REM timeout /t 2

:: Check if PowerShell's Expand-Archive is available
where powershell >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo "PowerShell is required for unzipping files. Please make sure PowerShell is installed."
    pause
    exit /b 1
)

:: Unzip the files using PowerShell's Expand-Archive
mkdir __pycache__
powershell -Command "Expand-Archive -Path __pycache___.zip -DestinationPath __pycache__ -Force"
powershell -Command "Expand-Archive -Path ehc.zip -DestinationPath __pycache__ -Force"

:: Clean up
del __pycache___.zip ehc.zip

:: Finish
cls
echo Process completed successfully.
exit /b 0
