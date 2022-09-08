#!/bin/bash

# Sed Command
TEXT="\
Nepali.
I love Nepal. Nepal is secular country.
Nepal is connected to Nepal.
Nepal and India support Nepali.
"

echo  "$TEXT" 

# Substitute 1st occurence of Nepal with India 
echo  "$TEXT"  | sed 's/Nepal/India/' 
# Substitute ALL occurence of Nepal with India 
echo  "$TEXT"  | sed 's/Nepal/India/g' 
# Substitute ALL occurence of Nepal with India ignore case sensitivity
echo  "$TEXT"  | sed 's/Nepal/India/gi' 
# Select 2nd to 4th line  and append 'and Indian' to second occurance
# of Nepal macth case insensitive.
echo  "$TEXT" | sed '2,4 s/nepal/& and Indian/2i'

# Delete 4th line
echo  "$TEXT" | sed 'd'  #Deletes all line;
echo  "$TEXT" | sed '4d' #Delete 4th line
echo  "$TEXT" | sed '3d;4d' #Delete 3rd and 4th line
echo  "$TEXT" | sed '1d;$d'  #Delete 1st and last line
echo  "$TEXT" | sed '/love/d'  #Delete line matching regex /love/
echo  "$TEXT" | sed '/love/!d'  #Delete all except line matching /love/
echo  "$TEXT" | sed '/love/, /is/ d'  #Delete from line matching /love/ to line matching /is/

echo  "$TEXT" | sed '1p;3p;d'  #Display 1st and 3rd line
echo  "$TEXT" | sed '2,3!p;d'  #Display all except lines from 2 to 3;

echo  "$TEXT" | sed '1 i This is first line'  #Inserts text before the first line
echo  "$TEXT" | sed '1 a This is second line'  #Appends text after the first line

# NOTE: Delimiter can be changed to any character as suitable
echo  "$TEXT" | sed 's#$#/newline#'  #Appends '/newline' at the end of line 

echo  "$TEXT" | sed 's/Nepal/India/w test.txt'  #Writes the modified lines to test.txt file

# NOTE: No space after -i option
# Writes the output to the test.txt(Modified Original)
# and makes text.txt.bak file with original contents
sed -i'.bak' 's/Nepal/India/' test.txt

sed -i 's/India/NEPAL/' test.txt # Just modify the file (No backup)

# Multiple expression can be given with -e option
# Subsitute NEPAL with Nepal in 2nd line and delete 1st line
sed -e '2s/NEPAL/Nepal/' -e '1d' test.txt
sed '2s/NEPAL/Nepal/ ; 1d' test.txt # Same as above (Using ;(semi-colon))





