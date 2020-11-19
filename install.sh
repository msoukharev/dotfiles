#Backup old .zshrc file
[ -f "~/.zshrc" ] && mv "~/.zshrc" "~/.zshrc.original"

ZSHRC_PATH="~/.zshrc"
# Dotfile location is set to default
[ -n $ZSH_DOTFILES ] && export ZSH_DOTFILES="~/.dotfiles"

fclear() {
    file=$1
    echo "" > $file
}

fprint() {
    content=$1
    file=$2
    echo $content >> $file
}

fgap() {
    lines=$1
    file=$2
    for i in $(seq 1 $lines); do echo >> $file; done
}

fprint "#The content was automatically generated during installation of msoukharev/dotfiles." $ZSHRC_PATH
fprint "#The original file was moved to ~/.zshrc.original." $ZSHRC_PATH
fgap 2 $ZSHRC_PATH


fprint "#ZSH_DOTFILES defines the path for the directory of the zsh files." $ZSHRC_PATH
fprint "export ZSH_DOTFILES=${ZSH_DOTFILES}" $ZSHRC_PATH
fgap 1 $ZSHRC_PATH

fprint "#This file sources all the dotfiles and configs container in the dotfiles directory."
fprint "source ${ZSH_DOTFILES}/source.zsh" $ZSHRC_PATH
fgap 1 $ZSHRC_PATH

fprint "#User settings:" $ZSHRC_PATH
fprint "#############################################" $ZSHRC_PATH