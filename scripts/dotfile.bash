# Collection of dotfile utility commands
function dotfile()
{
    help_msg="
    Usage:      dotfile <command>
        
    Commands:   sync [ home | dotfile [files...] ]
                source
    "
    # Subcommand scope
    case $1 in
    "sync")
        # Option scope
        case $2 in
        "home")
            for entry in `ls $DOTFILE_PATH/user/copy`; do
                cp $DOTFILE_PATH/user/copy/$entry ${HOME}/
            done
            ;;
        "dotfile")
            shift 2
            files=$@
            for entry in $files; do
                cp -r $entry $DOTFILE_PATH/user/copy/
            done
            ;;
            *)
            echo $help_msg
            return 1
            ;;
        *)
            echo $help_msg
            ;;
        esac
        # ! Option scope end
        ;;
    "source")
        __zsh && source ${HOME}/.zshrc && return 0
        __bash && __macos && source ${HOME}/.bash_profile && return 0
        __bash && __linux && source ${HOME}/.bashrc && return 0
        return 1
        ;;
    *)
        echo $help_msg
        return 1
        ;;
    esac
    # ! Subcommand scope
    return 0
}
