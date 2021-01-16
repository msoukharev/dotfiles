# Outputs active branch in PWD
function __git_current_branch() {
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo $(git rev-parse --abbrev-ref HEAD) || :
}

function __truncate() {
    len=$1
    shift
    arg=$1
    arglen=${#arg}
    if [ $len -ge $len ]; then
        echo $arg
    else
        echo $arg | cut -c -${len} | sed "s/$/../g"
    fi
}
