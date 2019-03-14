#!/bin/bash

#$1 = source
#$2 = destination
#$3 = mode
args=('-Wall' '-Wextra' '-O2' '-std=c++14' '-fdiagnostics-color=auto' '-fno-diagnostics-show-option' '-fno-diagnostics-show-caret' '-Wno-unused-result')
if [[ $3 -eq 'Test' ]];then
	args+=('-DTEST')
fi
args+=($1 '-o' $2)
command "g++" "${args[@]/#}"
exit
