#!/bin/bash

# Make a command with args

log(){
 if [[ $VERBOSE = 'true' ]]
 then
    echo ${@} # Expand the positional arguments "$1" "$2" ...
 fi
}

usage(){
  echo "USAGE: $0 [-vs] [l LENGTH]"
  echo 'Generate random password'
  echo '  -l  LENGTH  Specify length of password.'
  echo '  -s          Include special char.'
  echo '  -v          Verbose output'
  exit 1
}

LENGTH=48

while getopts svl: OPTION
do
  case $OPTION in
	s) SPECIAL='true' 
   	   log 'Verbose mode on.' ;;
	v) VERBOSE='true' ;;
	l) LENGTH=$OPTARG ;;
	?) usage ;; 
  esac
done

log 'Generating password'

shift $(( OPTIND - 1 ))

# Show usage if aditional args are passed
if [[ $# -gt 0 ]] # $# is the number of args 
then
  usage
fi

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c$LENGTH)

SPECIAL_CHARACTERS='~!@#$%^&*()_+-='
if [[ $SPECIAL = 'true' ]]
then
  log 'Selecting random special character'

  PASSWORD="${PASSWORD}$(echo $SPECIAL_CHARACTERS | fold -w1 | shuf | head -c1)"
fi

log 'Successfully generated the password'

echo $PASSWORD

