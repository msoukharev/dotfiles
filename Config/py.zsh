# Conveniences for pyenv
function penv() {

    function _activate() {
        source env/bin/activate
    }

    function _deactivate() {
        deactivate
    }

    subcommand=$1
    shift
    case $subcommand in
    "a" | "act")
        _activate
    ;;
    "d" | "deact")
        _deactive
    ;;
    *)
        echo "Unsupported usage. Supports only 'act' and 'deact'."
    ;;
    esac

}

# Conveniences for pip
alias pp="pip"
alias ppl="pp list"
alias ppi="pp install"
alias ppie="pp install --editable"
alias ppup="pp install --upgrade"
alias ppu="pp uninstall"
alias ppf="pip freeze"
