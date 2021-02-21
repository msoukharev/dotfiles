# Extracts flags from the arguments
function __flags()
{
    flags=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 && flags=($flags $arg)
    done
    echo $flags
}

# Extracts non-flags from the arguments
function __positionals()
{
    posits=()
    for arg in $@; do
        grep "^-" <<< $arg >/dev/null 2>&1 || posits=($posits $arg)
    done
    echo $posits
}

# Retreive the last argument
function __last()
{
    arg=""
    for arg in $@; do :; done; echo "$arg"
    if [ -z ${arg} ]; then
        return 0
    else
        return 1
    fi
}

# Check if the element is inside array
function __isin()
{
    str=$1
    shift
    for arg in $@; do
        [ "$str" = "$arg" ] && return 0
    done
    return 1
}

# Takes a message, reads a yes/no argument
# True if yes
# False if no
# If wring input, will ask again
function __yesno()
{
    echo -n "${@} [y/N]: "
    read ans
    case $ans in 
        y | Y)
            return 0
            ;;
        n | N)
            return 1
            ;;
        *)
            __yesno $@
            ;;
    esac
}
