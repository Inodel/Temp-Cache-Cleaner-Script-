@echo off
color 0A
title Temp Files Cleaner - System Maintenance Tool
mode con: cols=80 lines=30

echo ================================================================================
echo                        TEMP FILES CLEANER v1.0
echo                     System Maintenance Tool
echo                    Developed by inodel
echo ================================================================================
echo.

set "tempFolder=%TEMP%"
echo [INFO] Target Directory: %tempFolder%
echo.
echo --------------------------------------------------------------------------------
echo [STEP 1/3] Analyzing Temp Folder...
echo --------------------------------------------------------------------------------
echo.

for /f "tokens=3" %%a in ('dir "%tempFolder%" /s /a /-c 2^>nul ^| find "File(s)"') do set beforeSize=%%a

echo [INFO] Initial scan completed.
echo.
echo --------------------------------------------------------------------------------
echo [STEP 2/3] Cleaning Temp Files...
echo --------------------------------------------------------------------------------
echo.

del /f /s /q "%tempFolder%\*" 2>nul
for /d %%p in ("%tempFolder%\*") do rmdir "%%p" /s /q 2>nul

for /f "tokens=3" %%a in ('dir "%tempFolder%" /s /a /-c 2^>nul ^| find "File(s)"') do set afterSize=%%a

set /a sizeFreed=beforeSize-afterSize
set /a sizeFreedMB=sizeFreed/1048576

echo [SUCCESS] Temp files cleaned successfully.
echo [RESULT] Space Freed: %sizeFreed% bytes (%sizeFreedMB% MB)
echo.
echo --------------------------------------------------------------------------------
echo [STEP 3/3] Clearing NPM Cache...
echo --------------------------------------------------------------------------------
echo.

npm cache verify 2>nul | find "Total:" > nul
if %errorlevel% equ 0 (
    for /f "tokens=2" %%a in ('npm cache verify 2^>nul ^| find "Total:"') do set npmCacheSize=%%a
    echo [INFO] NPM Cache Size: %npmCacheSize%
    npm cache clean --force 2>nul
    echo [SUCCESS] NPM cache cleared successfully.
) else (
    npm cache clean --force 2>nul
    if %errorlevel% equ 0 (
        echo [SUCCESS] NPM cache cleared successfully.
    ) else (
        echo [WARNING] NPM not found or not configured in PATH.
    )
)

echo.
echo ================================================================================
echo                          CLEANUP COMPLETED
echo ================================================================================
echo.
echo [NOTE] Some files may have been skipped if in use by running programs.
echo.
pause