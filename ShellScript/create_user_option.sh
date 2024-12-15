#!/bin/bash
karul@DESKTOP-M0U48OI MINGW64 /f/devops/vagrant-vms/centos
$ Function to display usage instructions
usage() {
    echo "Usage: $0 {add-user|delete-user|list-users|add-group|delete-group|list-groups} [username] [groupname]"
    exit 1
}

# Function to add a user
add_user() {
    if [ -z "$1" ]; then
        echo "Username is required to add a user."
        usage
    fi
    sudo useradd -m $1
    echo "User '$1' added."
}

# Function to delete a user
delete_user() {
    if [ -z "$1" ]; then
        echo "Username is required to delete a user."
        usage
    fi
    sudo userdel -r $1
    echo "User '$1' deleted."
}

# Function to list users
list_users() {
    cut -d: -f1 /etc/passwd
}

# Function to add a group
add_group() {
    if [ -z "$1" ]; then
        echo "Group name is required to add a group."
        usage
    fi
    sudo groupadd $1
    echo "Group '$2' added."
}

# Function to delete a group
delete_group() {
    if [ -z "$1" ]; then
        echo "Group name is required to delete a group."
        usage
    fi
    sudo groupdel $1
    echo "Group '$1' deleted."
}

# Function to list groups
list_groups() {
    cut -d: -f1 /etc/group
}

# Main script logic
if [ "$#" -lt 1 ]; then
    usage
fi

case "$1" in
    add-user)
        add_user $2
        ;;
    delete-user)
        delete_user $2
        ;;
    list-users)
        list_users
        ;;
    add-group)
        add_group $2
        ;;
    delete-group)
        delete_group $2
        ;;
    list-groups)
        list_groups
        ;;
    *)
        usage
        ;;
esac
