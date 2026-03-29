#!/bin/bash

writefile="$1"
writestr="$2"
#Check input
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "ERROR Missing Argument."
    exit 1
fi

#check if the directly exist need to find the path first
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
fi

echo "$writestr" > "$writefile" || {
    echo "ERROR Issue writing to files."
    exit 1
}