@echo off
rem Поднять стенд на Windows. Откроется http://localhost:8000
rem
rem   запустить.bat                 три участка
rem   запустить.bat 8001            другой порт, если 8000 занят
rem
rem Живьём на Windows не проверялось: машины не было.
setlocal
chcp 65001 > nul
cd /d "%~dp0"

set PORT=%~1
if "%PORT%"=="" set PORT=8000

where py > nul 2>&1
if errorlevel 1 (
  echo.
  echo   Не нашёл "py". Поставьте Python 3.10 или новее с python.org.
  echo   Команда "python3" в Windows не работает: она открывает Microsoft Store.
  echo.
  exit /b 1
)

echo Стенд поднимается на порту %PORT%. Закройте это окно, чтобы остановить.
echo Интерфейс: http://localhost:%PORT%
echo.
py -3 -m vrptw.server %PORT% восток,юго-восток,югоцентр
exit /b %errorlevel%
