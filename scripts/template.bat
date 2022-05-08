@echo off
chcp 65001
cls

:setEnv
setlocal EnableDelayedExpansion

:start
echo Generate GUID Template to Copyboard
echo.
call :runScript
pause
goto :EOF

:runScript
for /f "delims=" %%i in ('python %~dp0\gen_guid.py') do (
    set a=%%i
    echo GUID=!a!
    set "guid=!a!"
    echo.
)
set "jsonTab=    "
set "rn=&echo."

echo [!rn!%jsonTab%{!rn!%jsonTab%%jsonTab%"guid": "{7b8da2ff-59bf-479f-ba09-28b71bb6312e}",!rn!%jsonTab%%jsonTab%//[POPULARS, GAMES, PROGRAMMING, SYSTEM, GENERIC, OTHERS]!rn!%jsonTab%%jsonTab%"category": "GAMES",!rn!%jsonTab%%jsonTab%"name": "TemplateName",!rn!%jsonTab%%jsonTab%"description": "None",!rn!%jsonTab%%jsonTab%"icon": "game.ico",!rn!%jsonTab%%jsonTab%"rules": [!rn!%jsonTab%%jsonTab%%jsonTab%"game.exe"!rn!%jsonTab%%jsonTab%],!rn!%jsonTab%%jsonTab%//EAC="{9907e4d7-5ec6-408d-9fc7-adc96f3cd1a2}", Battleye="{e8cce56b-d127-478b-9e4c-ce9ec2a2f3f0}"!rn!%jsonTab%%jsonTab%"dependencies": [!rn!%jsonTab%%jsonTab%%jsonTab%""!rn!%jsonTab%%jsonTab%]!rn!%jsonTab%}!rn!]!rn!|clip
goto :EOF

:EOF