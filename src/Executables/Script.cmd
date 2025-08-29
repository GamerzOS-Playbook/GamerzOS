@echo off
    Start-Process -FilePath "cmd.exe" -ArgumentList "dakstopappinstaller.cmd" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "libraries.cmd" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "microsoftstore.cmd" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "notification.cmd" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "storepurchaseapp.cmd" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "unpinall.bat" -WindowStyle Hidden
    Start-Process -FilePath "cmd.exe" -ArgumentList "xbox_identity_provider.cmd" -WindowStyle Hidden
    regedit.exe /s "RemoveDefender.reg"
exit
