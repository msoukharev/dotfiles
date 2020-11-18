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