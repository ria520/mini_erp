@echo off
REM Start PostgreSQL
pg_ctl -D "D:\PostgreSQL\data" -l "D:\PostgreSQL\logfile.log" start

REM Start Redis (assumes redis-server.exe is in PATH or D:\Redis)
start "" "D:\Redis\redis-server.exe"

REM Start Celery
start "" cmd /k "celery -A mini_erp worker --loglevel=info"

REM Activate virtual environment
call D:\your_venv\Scripts\activate.bat

REM Start Django
python manage.py runserver
