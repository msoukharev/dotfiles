[ -z $DOTFILES_DIR ] && DOTFILE_DIR="./dotfiles"

for dotfile in ( $( ls ${DOTFILES_DIR} ) ); do
    source $dotfile
done