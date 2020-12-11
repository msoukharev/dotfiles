# True if OS macos
function __macos() {
    grep darwin <<< $OSTYPE >/dev/null 2>&1 
}

# True if OS linux
function __linux() {
    grep linux <<< $OSTYPE >/dev/null 2>&1 
}