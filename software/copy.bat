@echo off
if not exist "disks" mkdir "disks"
if "%~1"=="" (
    echo "Error: Please specify disk number!"
    echo copy.bat ^<disk number^>
) else (
    echo Copying disk %1 side A
    d64copy.exe -n 8 "disks\D%1A.d64" > "disks\D%1A.log" 2>&1
    pause
    echo Copying disk %1 side B
    d64copy.exe -n 8 "disks\D%1B.d64" > "disks\D%1B.log" 2>&1
    echo done!
)