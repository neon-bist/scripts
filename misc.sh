#!/bin/bash

# List the users 
cat /etc/passwd

# Remove a user
sudo userdel -r localuser # -r removes localuser dir in /home

# Expire a user
sudo chage -E 90 localuser # 90 is days from 1 Jan 1970

# Remove expiration of an user
sudo chage -E -1 localuser # -1 removes expiration

# Switch user
su - localuser # will prompt for password

# Archiving folder
tar -cf archive.tar cats # Archives cats folder to a file archive.tar

# Compress
gzip archive.tar # Converts archive.tar to archive.tar.gz file

# Uncompress
gunzip archive.tar.gz # Converts archive.tar.gz to archive.tar

# Archive and compress
tar -zcf archive.tar.gz cats # NOTE: Can be named as archive.tgz

# Extract using -x option
tar -zxvf archive.tar.gz # restores cats folder 





