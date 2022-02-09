#!/bin/bash

DIR="$1"
#Check if the directory/path exists
if [ ! -d "$DIR" ]
then
    echo "The path $DIR does not exist"
else
#Find the five largest files in the directory and sort them in reverse order to get the largest one first. 
#Printing out both storage and name of the file
echo "Five largest files in the directory: "
find $DIR -printf '%s %p\n' | sort -nr | head -5
#Here the five largest files are being added to a total sum and printed out
echo "Total size of these five files: "
find $DIR -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}'
#Checking all files in the directory and printing them out
echo "Number of files scanned: "
find $DIR -type f | wc -l
#Checking total size of the folder/path and printing
echo "Total size of target path is: "
du -h -c $DIR | tail -1
fi
