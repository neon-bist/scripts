#!/bin/bash

# USING sort and uniq


sort testfile.txt # Alpahbetic sort

echo -e '2 Second\n 3 Third \n 1 First' | sort -n # Sort numerically

echo -e '1\n1\n2\n2' | sort -nu # Only prints unique =>1 and 2

sudo du -ha | sort -h # Sort based on human readable K, M units  
sudo du -ha | sort -hr # Sort based on human readable K, M units Descending order

# Sort numerically based on 3rd field;
# Fields delimited by ':'
sort -t':' -k 3 -n /etc/passwd 

# Sorts numerically and prints uniq rows with count of each unique row
# Follwing script prints 
# 4 2
# 2 3
echo -e '3\n3\n2\n2\n2\n2' | sort -n | uniq -c 

# Following prints
# 2 3
# 4 2
echo -e '3\n3\n2\n2\n2\n2' | sort -n | uniq -c | sort -n 

# Count
wc /etc/passwd # lines, words, character counts
wc -l /etc/passwd # lines
wc -w /etc/passwd # words
wc -c /etc/passwd # characters
