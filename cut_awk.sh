#!/bin/bash

# Formatting the output

# *********** CUT command ***********
# Cut command fields by delimiter
cut -d ',' -f 1,3 testfile.txt # Separate the fields by delimiter ',' and print field 1 and 3

cut -d':' -f 1-3 testfile.txt # Print the 1st to 3rd fields of each line 
cut -d':' -f -3 testfile.txt # Same as above
cut -d':' -f 2- testfile.txt # Print all fields but 1st field

# Cut by characters
cut -c -f 2- testfile.txt # Print all but 1st character

# NOTE: cut -c 1,3 file is same as cut -c 3,1 file
# NOTE: 3,1 also prints the fields in order 1,3

# ********** AWK command *************
# Separate the fields by delimiter 'Field:' and print 1st and 3rd field
awk -F'Field:' '{print $1,$3}' testfile.txt

# variable FS=Field Separator like -F option used to know the fields in file.
# variable OFS=Output Field Separator used to separate the field in output.
# Similarly RS and ORS are row separators.
# By default OFS is <space>
# Variables can be given by -v option

awk -v'FS=:' -v'OFS=|' '{print $1,$2}' testfile.txt

# BEGIN -> Before each row is processed
# END -> After all rows are processed
# Print 1st and last field separated by '|' and Finally print the number of rows processed.
# Given the row number is >=8 and <=12
# If row>=10 print PASSED
# Also print the number of rows printed.
awk '
BEGIN{
  FS=":"; 
  OFS="|"; 
  count=0;
}

NR >= 8 && NR <= 12 {
  
  if(length(NR) >= 2) print "PASSED";
  else print NR, $1,$NF;
  count=count + 1;
};

END{
  OFS=" "; 
  print count,"rows were printed!"; 
  print NR, "rows were processed!"
}
' testfile.txt

# NR=Number of row (line number in file)
# NF=Number of fields in current row
# Prints in the format 1 First_Field_Value --> SecondLast_Field_Value
awk -F':' '{print NR, $1,"-->",$(NF-1)}' testfile.txt



