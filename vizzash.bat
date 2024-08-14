@echo off
title Hash Calculation for Downloads Folder
color 0a
echo This script will calculate hash values for all the files in your Downloads folder.
pause

:: Open Command Prompt in Administrative Mode
echo Opening Command Prompt in Administrative Mode...
powershell -command "Start-Process cmd -ArgumentList '/c', 'title Hash Calculation for Downloads Folder & color 0a' -Verb RunAs"

:: Calculate Hash Values in SHA 256 Format
echo Calculating SHA 256 hash values for files in Downloads folder...
cd %userprofile%\Downloads
for /f "tokens=* delims=" %%a in ('dir /b /s ^| findstr /i /r ".*\.exe$ .*\.pdf$ .*\.zip$ .*\.rar$ .*\.7z$ .*\.jpeg$"') do (
    echo Calculating SHA 256 hash for "%%a"...
    certutil -hashfile "%%a" SHA256 | findstr /v "hash"
)

:: Calculate Hash Values in MD5 Format
echo Calculating MD5 hash values for files in Downloads folder...
cd %userprofile%\Downloads
for /f "tokens=* delims=" %%a in ('dir /b /s ^| findstr /i /r ".*\.exe$ .*\.pdf$ .*\.zip$ .*\.rar$ .*\.7z$ .*\.jpeg$"') do (
    echo Calculating MD5 hash for "%%a"...
    certutil -hashfile "%%a" MD5 | findstr /v "hash"
)

pause
