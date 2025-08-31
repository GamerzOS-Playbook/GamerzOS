@echo off
setlocal

set EDGE_PATH=%ProgramFiles(x86)%\Microsoft\Edge\Application
for /D %%F in ("%EDGE_PATH%\*") do (
    if exist "%%F\Installer\setup.exe" (
        echo Uninstalling Edge version %%~nxF
        "%%F\Installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall
    )
)

endlocal
