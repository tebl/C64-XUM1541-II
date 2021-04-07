@echo off
setlocal
SET PATH=%PATH%;"c:\Program Files\opencbm"
if not exist "disks" mkdir "disks"
if "%~1"=="" (
    echo "Error: Please specify disk number!"
    echo copy.bat ^<disk number^>
	pause
) else (
	echo Copying disk %1
    echo   Copying disk %1 side A
    pause
    d64copy.exe -n 8 "disks\D%1A.d64" > "disks\D%1A.log" 2>&1
    
	echo   Copying disk %1 side B
	pause
    d64copy.exe -n 8 "disks\D%1B.d64" > "disks\D%1B.log" 2>&1
    echo done!
)
