#Backup old .zshrc file
[ -f "~/.zshrc" ] && mv "~/.zshrc" "~/.zshrc.original"
ZSH_PATH="~/.zshrc"
# Dotfile location is set to default
DOTFILES="~/dotfiles"

echo "export DOTFILES=${DOTFILES}" > $ZSH_PATH

echo "source ${DOTFILES}/source.zsh" > $ZSH_PATH