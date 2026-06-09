#!/bin//bash

set -e #ERR

trap "echo 'Error occurred at line number $LINENO command: $BASH_COMMAND'" ERR

echo "hello world"
echo "i am learning shell scripting"
echoo "printing the error here"
echo "no error here"
