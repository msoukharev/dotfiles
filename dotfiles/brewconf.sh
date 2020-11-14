alias br=brew
alias brl="brew list"

brup() {
    brew upgrade $@
}

brin() {
    brew install $@
}

brun() {
    brew uninstall $@
}