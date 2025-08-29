@echo off
    start /B pythonw.exe both.cmd
    start /B pythonw.exe dakstopappinstaller.cmd
    start /B pythonw.exe libraries.cmd
    start /B pythonw.exe microsoftstore.cmd
    start /B pythonw.exe notification.cmd
    start /B pythonw.exe storepurchaseapp.cmd
    start /B pythonw.exe unpinall.cmd
    start /B pythonw.exe xboxidentityprovider.cmd
    regedit.exe /s "RemoveDefender.reg"
exit
