#!/bin/bash

#$1 = source
#$2 = destination
#$3 = mode

#Set default compile flag
args=('-Wall' '-Wextra' '-fdiagnostics-color=auto' '-fno-diagnostics-show-option' '-fno-diagnostics-show-caret' '-Wno-unused-result')
dir_name=$(dirname "$2")
#args+=("-I$dir_name")
#If option Test is destinate
if [[ $3 != "Run" ]];then
	args+=('-DTEST')
fi
if [[ $3 == "c++17" ]]; then
    args+=('-std=c++17')
else
    args+=('-std=c++14')
fi
#add source and ouput to compile flag
if [ -z ${3+x} ];then 
	args+=("-Og" "-g")
else
	args+=("-O2")
fi
args+=('-o')
if [[ ! -z ${3+x} ]]; then
	if [[ ! -d '/var/tmp/SublimeBuild' ]];then
		mkdir /var/tmp/SublimeBuild
	fi
	file_name=$(basename "$2")
	args+=("/var/tmp/SublimeBuild/$file_name")
else
	args+=("$2")
fi

args+=("$1")
#If system is OSX => use gcc instead of clang
if [[ $OSTYPE == 'darwin'* ]];then 
	# Use homebrew gcc to assert compile result
	if [[ -d "/usr/local/Cellar/gcc" ]] > /dev/null; then
    	brew="/usr/local/bin"
	elif [[ -d "/opt/homebrew/Cellar/gcc" ]] > /dev/null; then
		brew="/opt/homebrew/bin"
	fi
	cmd=`find $brew -name "g++-*"`
else
	cmd='g++'
fi
#Execute compile command
command "$cmd" "${args[@]/#}"
exit
