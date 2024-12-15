USERNAME=$1
GROUPNAME=$2

if ! grep -q "^$GROUPNAME:" /etc/group; then
        sudo groupadd $GROUPNAME
        echo "Group '$GROUPNAME' created."
else
        echo "Group '$GROUPNAME' already exits."

fi
if !id -u $USERNAME &>/dev/null; then
        sudo useradd -m -g $GROUPNAME $USERNAME
        echo "User '$USERNAME' created and added to group' $GROUPNAME'."
else
        echo "User '$USERNAME' alerady exits"

fi
