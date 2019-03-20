#!/bin/bash

#$1 = source
#$2 = destination
#$3 = mode

#Set default compile flag
args=('-Wall' '-Wextra' '-O2' '-std=c++14' '-fdiagnostics-color=auto' '-fno-diagnostics-show-option' '-fno-diagnostics-show-caret' '-Wno-unused-result')
#If option Test is destinate
if [[ $3 == "Test" ]];then
	args+=('-DTEST')
fi
#add source and ouput to compile flag
args+=($1 '-o' $2)
#If system is OSX => use gcc instead of clang
if [[ $OSTYPE == 'darwin'* ]];then 
    cmd='g++-8'
else
	cmd='g++'
fi
#Execute compile command
command $cmd "${args[@]/#}"
exit
