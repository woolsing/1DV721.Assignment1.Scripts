#!/bin/bash
#Use wget to download the file from an url given when bashing the script.
wget "$1"


#Use basename to get the name of the file, does not matter which url
filename=$(basename "$1")
echo "Filename is: $filename"

#Get the type of the file, awk prints out the filetype.
typeoffile=$(file -b $filename | awk '{print $1}')
echo "$typeoffile"

sizeoffile=$(stat -c%s "$filename")
echo "Size: $sizeoffile bytes"
#Check if file is textfile or not
if [[ $typeoffile = "ASCII" ]]
    then
        numberoflines=$(wc -l < "$filename")
        echo "Number of lines: $numberoflines"

        numberofwords=$(wc -w < "$filename")
        echo "Number of words: $numberofwords"

        numberofspaces=$(tr -d -C ' ' < "$filename" | wc -c)
        echo "Number of spaces: $numberofspaces"

        firstline=$(head -n 1 "$filename")
        echo "First line: $firstline"

        lastline=$(tail -n 1 "$filename")
        echo "Last line: $lastline"

        find . -name "$filename" -printf '%h\n'

#File is not a textfile, it is binary do this instead
else
show10first=$(head -c 10 "$filename")
echo "10 first bytes: $show10first"

show10last=$(tail -c 10 "$filename")
echo "10 last bytes: $show10last"

fi
#Open file in browser, in my case chrome
pathtofile=$(readlink -f "$filename")
start chrome "$pathtofile"
