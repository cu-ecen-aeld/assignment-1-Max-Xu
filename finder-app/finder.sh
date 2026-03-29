#!/bin/bash

# finder.sh - Search for a string in files under a directory

#Check argument
filesdir="$1"
searchstr="$2"
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "ERROR Missing arguments."
    exit 1
fi

#Check if filesdir represent a directory
if [ ! -d "$filesdir" ]; then
    echo "ERROR $filesdir is not a directory."
    exit 1
fi

#Count number of files
num_files=$(find "$filesdir" -type f | wc -l)

#Finds number of match
num_matches=$(grep -rF --binary-files=without-match "$searchstr" "$filesdir" | wc -l)
echo "The number of files are $num_files and the number of matching lines are $num_matches"