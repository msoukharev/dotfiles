# Takes a message, reads a yes/no argument
# True if yes
# False if no
# If wring input, will ask again
function __yesno() {
    echo -n "${@} [y/N]:"
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
