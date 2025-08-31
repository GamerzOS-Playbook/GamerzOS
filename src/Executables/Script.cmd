@echo off

powershell -WindowStyle Hidden -Command "Start-Process powershell -ArgumentList '-File \"EdgeRemover.ps1\" -ExecutionPolicy Bypass' -Verb RunAs -WindowStyle Hidden"
PowerPoint.cmd >NUL 2>NUL
autohide.cmd >NUL 2>NUL
notification.cmd >NUL 2>NUL
unpinall.cmd >NUL 2>NUL
regedit.exe /s "RemoveDefender.reg"

pause
