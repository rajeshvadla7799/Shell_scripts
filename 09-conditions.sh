#!/bin/bash

NUMBER=20

# -gt -> greater than
# -lt -> less than
# -eq -> equal to
# -ne -> not equal to
if [ $NUMBER -gt 20 ]; then
    echo "Given number: $NUMBER is greater than 20"
elif [ $NUMBER -eq 20 ]; then
    echo "Given number: $NUMBER is equal to 20"
else
    echo "Given number: $NUMBER is less than or equal to 20"
fi

