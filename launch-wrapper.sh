#!/bin/bash
"$1"
ret_code=$?
echo -e '\n=============================='
echo -e "Program exited with return code \u001b[32m$ret_code\u001b[0m.\n"
read -n 1 -s -r -p "Press any key to end your code"
echo -e '\n'
