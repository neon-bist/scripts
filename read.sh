#!/bin/bash

# reads from a next line you fields seprated by whitespace
read -p "Enter name:" name # reads variable a and b from the input
echo "name=$name"

# IFS=Internal Field Separator
# -d to option set line delimiter
IFS=';' read FN LN <<< "Lal Bahadur;Dhami" # <<< gives here string
echo "FN=$FN LN=$LN" # FN=Lal Bahadur; LN=Dhami

# If read statement is after pipe 
# User is NOT PROMPTED for input
# Input is taken the previous output
echo "Hello" | { read test; echo $test } # test=Hello

# Input can taken from file
while read LINE
do
  echo $LINE
done < 'test.txt'


