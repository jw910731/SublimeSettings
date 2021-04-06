#!/bin/sh
"$@"
ret_code=$?
echo ""
echo '=============================='
echo "Program exited with return code $ret_code."
echo "Press enter to end your code"
dd bs=1 count=1 >/dev/null 2>&1
echo -e '\n'
return $ret_code