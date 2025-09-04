@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Actual commands
rmdir /s /q "%WINDIR%\GamerzOSModules"
rmdir /s /q "%WINDIR%\GamerzOSDesktop"

echo Deletion complete.
