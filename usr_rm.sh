#!/bin/bash

# Make a command with args

log(){
 if [[ $VERBOSE = 'true' ]]
 then
    echo ${@} # Expand the positional arguments "$1" "$2" ...
 fi
}

usage(){
  echo "USAGE: $0 [-rv] USER [USER]..."
  echo 'Remove users'
  echo '  -r          Remove home directory' 
  echo '  -v          Verbose output'
  exit 1
}

D_HOME=''
while getopts rv OPTION
do
  case $OPTION in
	r) D_HOME='-r' 
   	   log 'Verbose mode on.' ;;
	v) VERBOSE='true' ;;
  esac
done

log 'Checking if the scrpit is run with sufficient privileges.'
if [[ $UID -ne 0 ]]
then
  echo 'Root premission required!' >&2
  exit 1
fi

# Remove the options from the script args.
shift $(( OPTIND - 1 ))

# Show usage if aditional args are passed
if [[ $# -eq 0 ]] # $# is the number of args 
then
  log 'At least 1 user is required!'
  usage
fi

DELETED_USERS=''
# Loop to delete the users 
for USER in ${@}
do
  userdel $D_HOME $USER &> /dev/null
  if [[ $? -ne 0 ]]
  then
     echo "FAILED: Couldn't delete User $USER!"
  else
     log "User $USER Deleted!"  
     DELETED_USERS="$DELETED_USERS $USER"
  fi
done

# Check if DELETED_USERS is not empty.
if [[ $DELETED_USERS != '' ]]
then
  echo "Users$DELETED_USERS were deleted succesfully!"
fi
