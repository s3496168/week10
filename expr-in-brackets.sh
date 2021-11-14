#!/bin/bash

# Basic arithmetic using double parentheses

a=$(( 4 + 5 ))
echo $a

a=$((3+5))
echo $a

b=$(( a + 3 ))
echo $b

b=$(( "$a" + 4 ))
echo $b # 12

((b++))

echo "$b" #13
