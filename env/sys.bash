# Following functions check for OS and shell types

function __macos() {
    grep darwin <<< $OSTYPE >/dev/null 2>&1 
}

function __linux() {
    grep linux <<< $OSTYPE >/dev/null 2>&1 
}

function __shell() {
    echo $(basename $SHELL)
}

function __bash() {
    [ "$(__shell)" = "bash" ]
}

function __zsh() {
    [ "$(__shell)" = "zsh" ]
}
