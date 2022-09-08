#Read username to create new user
read -p 'Enter the user name to create: ' USER_NAME

# Read username to create new user
read -p 'Enter full name: ' COMMENT 

# Ask for password
read -p 'Enter password: ' PASS

# Create a new user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password
echo "${PASS}" | passwd --stdin ${USER_NAME}

# Force change password in first login
passwd -e ${USER_NAME}

