#!/bin/bash

# Script for User Management and Backup with User Input

# Function to display help

display_help() {
	echo "Usage: $0"
	echo "Please follow the prompts to manage users and perform backups."
	exit 1
}

# Function to add a user
add_user() {
	echo -n "Enter username to add: "
	read USERNAME
	sudo useradd -m $USERNAME
	echo "User $USERNAME added."
}

# Function to delete a user
delete_user() {
	echo -n "Enter username to delete: "
	read USERNAME
	sudo userdel -r $USERNAME
	echo "User $USERNAME deleted."
}

# Function to modify a user (e.g., change user group)
modify_user() {
	echo -n "Enter username to modify: "
	read USERNAME
	echo -n "Enter group to assign to $USERNAME: "
	read GROUPNAME
	sudo usermod -aG $GROUPNAME $USERNAME
	echo "User $USERNAME modified to group $GROUPNAME."
}

# Function to backup a directory
backup_directory() {
	echo -n "Enter directory path to backup: "
	read DIR
	TIMESTAMP=$(date +%Y%m%d_%H%M%S)
	BACKUP_FILE="/tmp/backup_$TIMESTAMP.tar.gz"
	tar -czvf $BACKUP_FILE $DIR
	echo "Backup of $DIR completed at $BACKUP_FILE."
}

# Main script logic with user input
echo "What do you want to do?"
echo "1) Add User"
echo "2) Delete User"
echo "3) Modify User"
echo "4) Backup Directory"
echo -n "Select an option (1-4): "
read OPTION

case "$OPTION" in
	1)
		add_user
		;;
	
	2)
		delete_user
		;;

	3)
		modify_user
		;;

	4)
		backup_directory
		;;

	*)
		display_help
		;;
		
esac
