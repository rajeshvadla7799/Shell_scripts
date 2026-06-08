#!/bin/bash

START_TIME=$(date +%s)

echo "script executed at $TIMESTAMP"

sleep 5 

END_TIME=$(date +%s)

TOTAL_TIME=$((END_TIME - START_TIME))

echo "sript executed at $TIMESTAMP"
