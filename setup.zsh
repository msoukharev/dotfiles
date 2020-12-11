#!/bin/bash

zshrc=${HOME}/.zshrc
[ -n $DOTFILE_PATH ] && export DOTFILE_PATH=${HOME}/.dotfile
dotfile_rc=${DOTFILE_PATH}/rc.zsh

# TODO: Source dependencies

if [ -f $zshrc ]; then
    zsh_backup_date=(`date`)
    zsh_backup=$DOTFILE_PATH/Data/zshrc_backups/zshrc_$(date | sed s/\ /_/g)
    echo "Copying original $zshrc to $zsh_backup"
    cp $zshrc $zsh_backup
    rm -f $zshrc
fi

echo "Creating ${zshrc}"
touch $zshrc

# TODO: Use messaging

echo "#!/bin/zsh" >> $zshrc
echo "# The content was automatically generated during installation of msoukharev/dotfiles." >> $zshrc
echo "#" >> $zshrc
echo "#" >> $zshrc

echo "# \$DOTFILE defines the path for the directory of the zsh files." >> $zshrc
echo "export DOTFILE_PATH=${DOTFILE_PATH}" >> $zshrc
echo "#" >> $zshrc
echo "#" >> $zshrc


echo "# This file is the entry script to the project. It will source all the dotfiles, scripts, plugins and configs contained in ${DOTFILE_PATH} directory." >> $zshrc
echo "source ${dotfile_rc}" >> $zshrc
echo "#" >> $zshrc
echo "#" >> $zshrc

echo "#############################################" >> $zshrc
echo "# User settings:" >> $zshrc
echo "#############################################" >> $zshrc

source $zshrc

echo "Setup complete"
echo "Restart zsh session for changes to take full effect."

unset dotfile_rc