@echo off
chcp 65001
cls

:setEnv
setlocal EnableDelayedExpansion

:start
echo Generate GUID Template to Copyborad
echo.
call :runScript
pause
goto :EOF

:runScript
for /f "delims=" %%i in ('python %~dp0\gen_guid.py') do (
    set a=%%i
    echo %a%|clip
    echo GUID=!a!
    set "guid=!a!"
    echo.
)
set "jsonTab=    "
set "jsonSpace= "
set "rn= &echo."

echo //!rn!// Array indicate it contains multiple rules.!rn!//!rn![!rn!%jsonTab%//!rn!%jsonTab%// A single rule object!rn!%jsonTab%//!rn!%jsonTab%{!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// You can use scripts/gen_guid.bat to generate a GUID!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"guid": "!guid!",!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// One of [POPULARS, GAMES, PROGRAMMING, SYSTEM, GENERIC, OTHERS]!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"category": "GAMES",!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// Rule's name!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"name": "Game",!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// Further description of this rule (optional)!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"description": "The steam platform itself, not including games",!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// Reference to the icons/game.ico file!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"icon": "game.ico",!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%// Multiple file path match expressions.!rn!%jsonTab%%jsonTab%//!rn!%jsonTab%%jsonTab%"rules": [!rn!%jsonTab%%jsonTab%"game.exe"!rn!%jsonTab%%jsonTab%]!rn!%jsonTab%}!rn!]|clip

goto :EOF

:EOF
