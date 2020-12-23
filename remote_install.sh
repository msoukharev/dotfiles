#!/bin/bash

abort_msg() {
    echo "${1} Abort."
    exit 1
}

DOTFILE_PATH="${HOME}/.dotfile"
setup_script=$DOTFILE_PATH/setup.bash

echo "Remote installing msoukharev/dotfile.git"

if [ -d $DOTFILE_PATH ]; then
    echo "Overwriting ${DOTFILE_PATH} directory"
    sudo rm -rf $DOTFILE_PATH
    mkdir -p $DOTFILE_PATH
fi

git clone https://github.com/msoukharev/dotfile.git $DOTFILE_PATH

if [ -d $DOTFILE_PATH ]; then
    echo "Successfully installed dotfiles!"
else
    abort_msg "Failed to install dotfiles."
fi

echo "Changing permossion settings scripts executable"
sudo chmod -R 755 $DOTFILE_PATH >/dev/null 2>&1 || abort_msg "Could not give access permission for ${DOTFILE_PATH}."
echo

echo "Success!"
echo
echo
echo "Running setup..."
. $setup_script
