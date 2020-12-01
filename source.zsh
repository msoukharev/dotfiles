macos() {
    if [ -n $(echo $OSTYPE | grep darwin)]; then
        return 0
    else
        return 1
}

linux() {
    if [ -n $(echo $OSTYPE | grep linux)]; then
        return 0
    else
        return 1
}

##################################################################

DOTFILE="~/.dotfile/"
dotfiles="${DOTFILE}/dotfiles"

# # Bring source the source files
# for src_script in $(ls $src); do
#     source $src_script
# done

# Source dotfiles
for dotfile in $(ls $dotfiles); do
    source $dotfile
done

unset src
unset dotfiles
unset macos
unset linux