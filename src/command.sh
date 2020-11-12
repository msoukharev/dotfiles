command not found

command() {
    if [ -n $( $1 2>&1 ) ]; then
        exit 1
    else
        exit 0
    fi
}