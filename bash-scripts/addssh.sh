eval "$(ssh-agent -s)"

echo "Enter the path and name of the SSH key to add"

read sshpathname

ssh-add ${sshpathname}