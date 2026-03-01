@echo off
cd /d "%~dp0"
call .venv\Scripts\activate

echo Starting Muse LSL stream...
start /b muselsl stream
timeout /t 5 /nobreak >nul

echo Starting OSC bridge...
python -m muse_osc %*

taskkill /f /im muselsl.exe 2>nul
