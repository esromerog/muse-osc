@echo off
echo Setting up muse-osc...
python -m venv .venv
call .venv\Scripts\activate
pip install -r requirements.txt
echo Setup complete. Run start.bat to launch.
pause
