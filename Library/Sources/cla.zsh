# Extracts flags from the arguments
function __flags() {
    flags=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 && flags=($flags $arg)
    done
    echo $flags
}

# Extracts non-flags from the arguments
function __positionals() {
    posits=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 || posits=($posits $arg)
    done
    echo $posits
}

# Retreive the last argument
function __last() {
    arg=""
    for arg in $@; do :; done; echo "$arg"
    if [ -z ${arg} ]; then
        return 0
    else
        return 1
    fi
}
