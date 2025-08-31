@echo off
:: Check for admin rights
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb runAs"
    exit /b
)

:: Base GUID for Ultimate Performance plan
set "baseScheme=e9a42b02-d5df-448d-aa00-03f14749eb61"

:: Duplicate the Ultimate Performance plan and capture output
for /f "tokens=4" %%G in ('powercfg -duplicatescheme %baseScheme%') do set "newScheme=%%G"

if "%newScheme%"=="" (
    echo Failed to duplicate the Ultimate Performance plan.
    exit /b 1
)

echo New power scheme GUID: %newScheme%

:: Rename new plan to GamerzOS with description
set "planName=GamerzOS"
set "planDescription=GamerzOS Best For Gaming, Best For Gamers."

powercfg -changename %newScheme% "%planName%" "%planDescription%"

:: Set GamerzOS as the active plan
powercfg -setactive %newScheme%

:: Configure key performance settings

:: Processor power management - set min and max to 100%
powercfg -setacvalueindex %newScheme% SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex %newScheme% SUB_PROCESSOR PROCTHROTTLEMAX 100

:: Disable hard disk turn off
powercfg -setacvalueindex %newScheme% SUB_DISK DISKIDLE 0

:: Disable USB selective suspend
powercfg -setacvalueindex %newScheme% SUB_USB USBSELECTIVE 0

:: Disable display turn off
powercfg -setacvalueindex %newScheme% SUB_VIDEO VIDEOIDLE 0

:: Disable sleep
powercfg -setacvalueindex %newScheme% SUB_SLEEP STANDBYIDLE 0

:: Disable hibernation system-wide
powercfg -hibernate off

:: Apply the new plan again to be sure
powercfg -setactive %newScheme%

echo.
echo ✅ Power plan '%planName%' created and optimized successfully!
echo Description: %planDescription%

pause
