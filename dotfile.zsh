[ -z $DOTFILES_DIR ] && DOTFILE_DIR="~/.dotfiles/dotfiles"

for dotfile in ( $( ls ${DOTFILES_DIR} ) ); do
    source $dotfile
done