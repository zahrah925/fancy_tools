#!/bin/bash

function write_to_file
{
    if [[ -r "$2" && -w "$2" ]]
    then
        echo "$1" >> "$2"
        return 0
    else
        return 1
    fi
}

current_path="$(pwd)"
#source .aliases in bashrc
line="source $current_path/.aliases"
file=~/.bashrc
grep -qF -- "$line" "$file" || echo "$line" >> "$file"

#source fancy_funtions.sh in bashrc
line="source $current_path/fancy_functions.sh"
file=~/.bashrc
grep -qF -- "$line" "$file" || echo "$line" >> "$file"


if [ $? -ne 0 ]
then
    echo "failed to write in ~/.bashrc"
else
    echo "success to write file .aliases and fancy_funtions.sh in ~/.bashrc"
fi


#folder~/bin
if [[ -d ~/bin ]]
then
    echo "Folder bin already exists."
else
    mkdir ~/bin
fi


#export path
cd ~/bin
new_path="$(pwd)"
export_path="export PATH=$PATH:$new_path"
bashrc="$(<~/.bashrc)"

#grep is used to avoid duplicacy in bashrc when install.sh is executed
if grep -q "$export_path" <<< "$bashrc"; then
	echo "PATH already added in ~/.bashrc"
else
	echo "export PATH=$PATH:$new_path" >> ~/.bashrc
        echo "Successfully exported PATH to ~/.bashrc"
fi


#folder~/src
if [[ -d ~/src ]]
then
    echo "Folder ~/src already exists."
else
    mkdir ~/src
fi


cd ~/src
#clone in ~/src
if [[ -d ~/src/fancy_tools ]]
then
    echo "Already cloned fancy_tools"
else
    git clone --single-branch --branch master https://github.com/zahrah925/fancy_tools.git
    echo "Successfully cloned fancy_tools in ~/src"
fi


cd ~/bin
cp ~/src/fancy_tools/bin/updateFancyTools ~/bin/updateFancyTools
chmod +x updateFancyTools
