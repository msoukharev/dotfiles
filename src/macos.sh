macos() {
    if [ -n `echo $OSTYPE | grep darwin` ]; then
        exit 1
    else
        exit 0
    fi
}