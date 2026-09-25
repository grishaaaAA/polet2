@echo off
rem Поставить зависимости на Windows: numpy и scipy, больше ничего.
setlocal
chcp 65001 > nul
cd /d "%~dp0"

where py > nul 2>&1
if errorlevel 1 (
  echo.
  echo   Не нашёл "py". Поставьте Python 3.10 или новее с python.org.
  echo.
  exit /b 1
)

py -3 -m pip install -r requirements.txt
exit /b %errorlevel%
