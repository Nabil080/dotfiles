@echo off
setlocal EnableDelayedExpansion

rem =========================================================
rem  Global Godot → itch.io exporter
rem  Usage: godot-itch-push.bat <project_name>
rem  Example: godot-itch-push.bat MyAwesomeGame
rem  Put this file anywhere in PATH or call with full path
rem =========================================================

rem ---- 1. CHECK ARGUMENT -----------------------------------
if "%~1"=="" (
    echo.
    echo *** ERROR: No project name given.
    echo Usage: %~nx0 ^<project_name^>
    echo Example: %~nx0 MyGame
    exit /b 1
)
set "PROJECT_NAME=%~1"

rem ---- 2. FIND GODOT PROJECT ROOT -------------------------
rem Start from current directory and go up until project.godot is found
set "PROJ_ROOT=%cd%"
:find_root
if exist "%PROJ_ROOT%\project.godot" goto :found_root
if "%PROJ_ROOT%"=="%PROJ_ROOT:~0,3%" (
    echo.
    echo *** ERROR: project.godot not found in %cd% or any parent folder.
    exit /b 1
)
set "PROJ_ROOT=%PROJ_ROOT%\.."
goto :find_root

:found_root
echo Found project root: %PROJ_ROOT%

rem ---- 3. PATHS --------------------------------------------
set "EXPORT_DIR=%PROJ_ROOT%\exports"
rem Change this if Godot is not in PATH:
set "GODOT=godot"
rem Or use full path: set "GODOT=C:\Godot\godot.exe"

rem ---- 4. PREPARE EXPORT FOLDER ----------------------------
if not exist "%EXPORT_DIR%" (
    echo Creating "%EXPORT_DIR%"
    md "%EXPORT_DIR%"
) else (
    echo Emptying "%EXPORT_DIR%"
    del /q "%EXPORT_DIR%\*"
    for /d %%i in ("%EXPORT_DIR%\*") do rd /s /q "%%i"
)

rem ---- 5. EXPORT WITH GODOT --------------------------------
echo.
echo === EXPORTING WITH GODOT ===
call "%GODOT%" --headless --export-release "Web"               "%EXPORT_DIR%\index.html"                || goto :error
call "%GODOT%" --headless --export-release "Windows Desktop"   "%EXPORT_DIR%\%PROJECT_NAME%.exe"        || goto :error
call "%GODOT%" --headless --export-release "Linux"             "%EXPORT_DIR%\%PROJECT_NAME%.x86_64"     || goto :error

rem ---- 6. CREATE WEB ZIP (exclude exes) --------------------
echo.
echo === CREATING WEB ZIP ===
set "ZIP_TEMP=%EXPORT_DIR%\__zip_temp__"
md "%ZIP_TEMP%" 2>nul

rem Copy everything EXCEPT the two binaries
robocopy "%EXPORT_DIR%" "%ZIP_TEMP%" /mov /xf "%PROJECT_NAME%.exe" "%PROJECT_NAME%.x86_64" >nul

rem === SINGLE-LINE PowerShell ZIP (no ^, works on all locales) ===
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('%ZIP_TEMP%', '%EXPORT_DIR%\%PROJECT_NAME%.zip', [System.IO.Compression.CompressionLevel]::Optimal, $false)}"

if errorlevel 1 (
    echo *** FAILED to create ZIP ***
    goto :error
)

rd /s /q "%ZIP_TEMP%"

rem ---- 7. PUSH TO ITCH.IO WITH BUTLER ----------------------
echo.
echo === PUSHING TO ITCH.IO ===
butler push "%EXPORT_DIR%\%PROJECT_NAME%.zip"   "spritelessdev/%PROJECT_NAME%:web"     || goto :error
butler push "%EXPORT_DIR%\%PROJECT_NAME%.exe"   "spritelessdev/%PROJECT_NAME%:windows" || goto :error
butler push "%EXPORT_DIR%\%PROJECT_NAME%.x86_64" "spritelessdev/%PROJECT_NAME%:linux"   || goto :error

rem ---- 8. SUCCESS ------------------------------------------
echo.
echo ==============================================
echo   SUCCESS! %PROJECT_NAME% is live on itch.io
echo ==============================================
exit /b 0

:error
echo.
echo *** ERROR during export/push (code %errorlevel%)
exit /b %errorlevel%