@echo off
setlocal

echo Building Release APK...

cd /d "%~dp0android"

call gradlew.bat assembleRelease

if errorlevel 1 (
    echo Build failed!
    exit /b 1
)

cd /d "%~dp0"

set APK_PATH=android\app\build\outputs\apk\release\app-release.apk

if not exist "%APK_PATH%" (
    echo APK not found at:
    echo %APK_PATH%
    exit /b 1
)

copy /Y "%APK_PATH%" "universal.apk"

echo.
echo Success!
echo Created: %CD%\universal.apk

pause