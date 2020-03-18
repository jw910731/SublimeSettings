@echo off
:: Change the "compiler" var to corresponding path of your mingw compiler if it's not in your path
set custom_cmd=g++

:: =================================================================
:: Do not edit the following line except you know what you are doing
:: =================================================================
set command=g++

where g++ >nul 2>&1 && set mingw_inpath=true || set mingw_inpath=false

if %mingw_inpath%==false (
    set command=%custom_cmd%
)

%command% -Wall -Wextra -O2 -std=c++14 -fdiagnostics-color=never -fno-diagnostics-show-option -fno-diagnostics-show-caret -Wno-unused-result %1 -o %2