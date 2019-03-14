#!/bin/bash

#$1 = platform
#$2 = source
#$3 = destination
#$4 = mode
args=('-Wall' '-Wextra' '-O2' '-std=c++14' '-fdiagnostics-color=auto' '-fno-diagnostics-show-option' '-fno-diagnostics-show-caret' '-Wno-unused-result')
if [[ $4 -eq 'Test' ]];then
	args+=('-DTEST')
fi
args+=($2 '-o' $3)
cmd='g++'
if [[ $1 -eq 'osx' ]];then
    cmd='g++-8'
fi
command "g++" "${args[@]/#}"
exit
