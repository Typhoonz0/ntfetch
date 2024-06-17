@echo off
setlocal enabledelayedexpansion
chcp 65001>nul
:: ASCII Art
set "line1=[91m╭──────╮[92m╭──────╮[0m"
set "line2=[91m│      │[92m│      │[0m"
set "line3=[91m│      │[92m│      │[0m"
set "line4=[91m╰──────╯[92m╰──────╯[0m"
set "line5=[94m╭──────╮[93m╭──────╮[0m"
set "line6=[94m│      │[93m│      │[0m"
set "line7=[94m│      │[93m│      │[0m"
set "line8=[94m╰──────╯[93m╰──────╯[0m"
:: Get information
for /f "tokens=2 delims==" %%i in ('wmic os get Caption /value') do set "os=%%i"
for /f "tokens=2 delims==" %%i in ('wmic os get Version /value') do set "version=%%i"
for /f "tokens=2 delims==" %%i in ('wmic os get BuildNumber /value') do set "build=%%i"
for /f "tokens=*" %%i in ('powershell -command "[math]::Round((New-TimeSpan -Start (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime).TotalMinutes)"') do set "uptimeMinutes=%%i"
for /f "tokens=2 delims==" %%i in ('wmic cpu get Name /value') do set "cpu=%%i"
for /f "tokens=*" %%i in ('powershell -command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object { [math]::Round($_.TotalPhysicalMemory / 1GB) }"') do set "memoryGB=%%i"
for /f "tokens=2 delims==" %%i in ('wmic path win32_videocontroller get caption /value') do set "gpu=%%i"
for /f "tokens=2 delims==" %%i in ('wmic path Win32_VideoController get CurrentHorizontalResolution /value') do set "scrwidth=%%i"
for /f "tokens=2 delims==" %%i in ('wmic path Win32_VideoController get CurrentVerticalResolution /value') do set "scrheight=%%i"
for /f "tokens=2 delims==" %%a in ('wmic computersystem get model /value') do set deviceName=%%a
set "info1=%USERNAME%"
set "info2=%COMPUTERNAME%"
set "info3=%deviceName%"
set "info4=%os% %version%"
set "info5=%uptimeMinutes% minutes"
set "info6=%cpu%"
set "info7=%gpu%"
set "info8=%memoryGB% gb"
set "info9=%scrwidth%x%scrheight%"
:: Display
echo.
echo %line1%   [91m%info1%[0m@[91m%info2% 
echo %line2%  [96m host:[0m %info3% 
echo %line3%  [96m os:[0m %info4%
echo %line4%  [96m uptime:[0m %info5%
echo %line5%  [96m cpu:[0m %info6%
echo %line6%  [96m gpu:[0m %info7%
echo %line7%  [96m ram:[0m %info8%
echo %line8%  [96m res:[0m %info9%
:: Pause
echo.