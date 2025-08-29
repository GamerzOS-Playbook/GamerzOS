@echo off
net session >nul 2>&1 || (
    echo This file needs to be run with administrator privileges.
    powershell -ExecutionPolicy Bypass -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

    echo Disabling notifications...
    reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_TOASTS /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications" /v "Enabled" /t REG_DWORD /d 0 /f
    cls
    color 2
    gpupdate /force
    taskkill /f /im explorer.exe
    start explorer.exe
    cls
    color 6
    echo Notifications are turned off.

pause
