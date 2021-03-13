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

function __isin()
{
    str=$1
    shift
    for arg in $@; do
        [ "$str" = "$arg" ] && return 0
    done
    return 1
}

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

function __git_current_branch()
{
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo $(git rev-parse --abbrev-ref HEAD) || :
}

function __truncate()
{
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

function __macos()
{
    grep darwin <<< $OSTYPE >/dev/null 2>&1
}

function __linux()
{
    grep linux <<< $OSTYPE >/dev/null 2>&1
}

function __shell()
{
    echo $(basename $SHELL)
}

function __bash()
{
    [ "$(__shell)" = "bash" ]
}

function __zsh()
{
    [ "$(__shell)" = "zsh" ]
}
