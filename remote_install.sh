abort() {
    echo "${1} Abort."
    return 1
}

##################################################################

echo "Remote installing msoukharev/dotfiles!"

export DOTFILE="~/.dotfile"

abort "Something is already installed at ${DOTFILE}."

git clone https://github.com/msoukharev/dotfile ~/.dotfile

if [ -d $DOTFILE ]; then
    echo "Successfully installed dotfiles!"
else
    echo "Failed to install dotfiles."
fi

if [-d "~/.dotfile"]

chmod -R 755 $DOTFILE

echo "Setting up the environment."
sh $DOTFILE/src/install.sh