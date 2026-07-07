@echo off
setlocal
set "DEST=%USERPROFILE%\.codex\skills\nvgt-dev"
echo Installing nvgt-dev skill to "%DEST%"
if exist "%DEST%" (
    echo Removing old nvgt-dev installation...
    rmdir /s /q "%DEST%"
)
if not exist "%USERPROFILE%\.codex\skills" mkdir "%USERPROFILE%\.codex\skills"
xcopy /E /I /Y "%~dp0nvgt-dev" "%DEST%"
echo.
echo Successfully installed. Restart Codex to load the skill.
pause
