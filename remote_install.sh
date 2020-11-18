echo "Remote installing msoukharev/dotfiles!"
git clone https://github.com/msoukharev/dotfiles ~/.dotfiles
if [ -d "~/.dotfiles" ]; then
    echo "Successfully installed dotfiles!"
else
    echo "Failed to install dotfiles."
fi

export ZSH_DOTFILES="~/.dotfiles/"

chmod -R 755 $ZSH_DOTFILES

echo "Setting up the environment."
sh $ZSH_DOTFILES/install.sh