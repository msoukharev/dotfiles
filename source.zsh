ZSH_DOTFILES="~/.dotfile/"

src="${ZSH_DOTFILES}/src/"
dotfiles="${ZSH_DOTFILES}/dotfiles"

# Bring source the source files
for src_script in $(ls $src); do
    source $src_script
done

# Source dotfiles
for dotfile in $(ls $dotfiles); do
    source $dotfile
done
