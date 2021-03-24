#!/bin/bash

# Set default directory for the path
[ -n $DOTFILE_PATH ] && export DOTFILE_PATH=${HOME}/.dotfile

# Source dependencies
for file in $(ls $DOTFILE_PATH); do
    source ${DOTFILE_PATH}/env.bash
done
bootstrap_rcfile=$DOTFILE_PATH/data/.bootstrap_rcfile

# Creates a file and puts an existing file into a backup directory
function newfile()
{
    new_file=$1
    if [ -f $new_file ]; then
        backup_dir=$DOTFILE_PATH/data/backups
        mkdir --parents $backup_dir >/dev/null 2>&1
        backup_file=$backup_dir/$(basename $new_file)_$(date | sed s/\ /_/g)
        echo -e "Moving original $new_file as: \n $backup_file\n"
        mv $new_file $backup_file
    fi
    touch $new_file
}


function bash_setup()
{
    __linux && rcfile=${HOME}/.bashrc
    __macos && rcfile=${HOME}/.bash_profile
    newfile $rcfile
    cat $bootstrap_rcfile > $rcfile
}

function zsh_setup()
{
    rcfile=${HOME}/.zshrc
    newfile $rcfile
    echo $bootstrap_rcfile > $rcfile
}

bash_setup
zsh_setup

unset bash_setup zsh_setup newfile
