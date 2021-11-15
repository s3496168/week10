#!/bin/bash

echo "$1"
printf "\n"
TEMPO=$1

awk 'BEGIN {print "START"}{ print} END {print "STOP"}' $TEMPO

