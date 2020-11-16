#Backup old .zshrc file
[ -f "~/.zshrc" ] && mv "~/.zshrc" "~/.zshrc.original"
ZSHRC_PATH="~/.zshrc"
# Dotfile location is set to default
DOTFILES="~/.dotfiles"

echo "export DOTFILES=${DOTFILES}" > $ZSHRC_PATH

echo "source ${DOTFILES}/dotfile.zsh" > $ZSHRC_PATH