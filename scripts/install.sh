zshrc="~/.zshrc"

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


################################################################################################


if [ -f zshrc ]; then
    mv zshrc "~/.zshrc.original"
    touch zshrc
    message="The original .zshrc file was coppied to ~/.zshrc.original"
    echo message
    fprint message zshrc
fi

[ -n $DOTFILE ] && export DOTFILE="~/.dotfiles"


fprint "# The content was automatically generated during installation of msoukharev/dotfiles." zshrc
fprint "# The original file was moved to ~/.zshrc.original." zshrc
fgap 2 zshrc


fprint "# \$DOTFILE defines the path for the directory of the zsh files." zshrc
fprint "export DOTFILE=${DOTFILE}" zshrc
fgap 1 zshrc

fprint "# This file sources all the dotfiles and configs container in the dotfiles directory."
fprint "source ${DOTFILE}/scripts/source.zsh" zshrc
fgap 1 zshrc

fprint "# User settings:" zshrc
fprint "#############################################" zshrc


################################################################################################
