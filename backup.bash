#!/bin/bash
if [ -z "$1" ];then
    echo "Please pass a parameter which folder to be backed up"
else
name=$(date +%F-%T)
start=$(date +%s%N)
FILE=/tmp/$name.tar.gz
if [ -d "$1" ];
then
    if [ -f "$FILE" ];
        then
            echo "$FILE exists."
            echo "$1 exists."
    else
            echo "$FILE does not exist."
            tar -zcf tmp/"$name".tar.gz "$1"
            echo "Created $FILE"
            end=$(date +%s%N)
            runtime=$((end-start))
            echo "Runtime was $runtime nanoseconds"
    fi
else
    echo "Directory/folder does not exist, check spelling and try again."
fi
fi
