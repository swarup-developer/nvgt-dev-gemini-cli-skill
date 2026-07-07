@echo off
setlocal
set "DEST=%USERPROFILE%\.claude\skills\nvgt-dev"
echo Installing nvgt-dev skill to "%DEST%"
if exist "%DEST%" (
    echo Removing old nvgt-dev installation...
    rmdir /s /q "%DEST%"
)
if not exist "%USERPROFILE%\.claude\skills" mkdir "%USERPROFILE%\.claude\skills"
xcopy /E /I /Y "%~dp0nvgt-dev" "%DEST%"
echo.
echo Successfully installed. Restart Claude Code to load the skill.
pause
