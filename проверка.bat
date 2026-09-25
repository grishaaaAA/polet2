@echo off
rem Проверки стенда на Windows. Замена `python3 -m ...` из README:
rem команды `python3` в Windows нет, а системный псевдоним python3.exe
rem открывает Microsoft Store. Здесь используется `py -3` — он ставится
rem вместе с Python с python.org.
rem
rem   проверка.bat            обе проверки подряд
rem   проверка.bat стенд      только selfcheck, ~40 секунд
rem   проверка.bat сервер     только server check, около семи минут
rem
rem Живьём на Windows не проверялось: машины не было. Если что-то пойдёт
rem не так — напишите нам, это важнее, чем кажется.
setlocal
chcp 65001 > nul
cd /d "%~dp0"

where py > nul 2>&1
if errorlevel 1 (
  echo.
  echo   Не нашёл "py". Поставьте Python 3.10 или новее с python.org
  echo   и отметьте "Add python.exe to PATH" при установке.
  echo   Команда "python3" в Windows не работает: она открывает Microsoft Store.
  echo.
  exit /b 1
)

if "%~1"=="сервер" goto server
echo === Проверка стенда (около 40 секунд) ===
py -3 -m vrptw.selfcheck
if errorlevel 1 exit /b 1
if "%~1"=="стенд" exit /b 0

:server
echo.
echo === Проверка сервера (около семи минут) ===
py -3 -m vrptw.server check
exit /b %errorlevel%
