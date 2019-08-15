#!/bin/bash

#$1 = source
#$2 = destination
#$3 = mode

#Set default compile flag
args=('-Wall' '-Wextra' '-std=c++14' '-fdiagnostics-color=auto' '-fno-diagnostics-show-option' '-fno-diagnostics-show-caret' '-Wno-unused-result')
#If option Test is destinate
if [[ $3 == "Test" ]];then
	args+=('-DTEST')
fi
#add source and ouput to compile flag
args+=("$1" '-o')
if [[ $3 == "Run" || $3 == "Test" ]]; then
	if [[ ! -d '/var/tmp/SublimeBuild' ]];then
		mkdir /var/tmp/SublimeBuild
	fi
	args+=("/var/tmp/SublimeBuild/$(basename $2)" '-O2')
else
	args+=("$2" "-g")
fi
#If system is OSX => use gcc instead of clang
if [[ $OSTYPE == 'darwin'* ]];then 
	# Use homebrew gcc to assert compile result
    cmd='/usr/local/Cellar/gcc/*/bin/g++-*'
else
	cmd='g++'
fi
#Execute compile command
command $cmd "${args[@]/#}"
exit
