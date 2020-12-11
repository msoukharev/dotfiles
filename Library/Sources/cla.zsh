# Extracts flags from the arguments
function __flags() {
    flags=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 && flags=($flags $arg)
    done
    echo $flags
}

# Extracts non-flags from the arguments
function __posits() {
    posits=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 || posits=($posits $arg)
    done
    echo $posits
}