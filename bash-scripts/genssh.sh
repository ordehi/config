#!/bin/bash

while true
do
    read -p "Enter your git email: " gitemail
    echo
    if [[ "$gitemail" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
    then
        break
    else
        echo "Email address $gitemail is invalid."
    fi
done

echo "Enter a directory to save the key (without a trailing '/') [default current]"

read dirtosave

echo "Enter an algorithm for the key [default ed25519]"

read algo

echo "Enter a name for the key [defaults to id_[ALGORITHM]]"

read keyname

ssh-keygen -t ${algo:-ed25519} -f ${dirtosave:-.}/${keyname:-id_${algo:-ed25519}} -C "${gitemail}"
