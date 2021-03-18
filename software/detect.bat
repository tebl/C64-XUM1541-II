@echo off
setlocal
SET PATH=%PATH%;"c:\Program Files\opencbm"
if not exist "disks" mkdir "disks"
cbmctrl.exe detect
pause