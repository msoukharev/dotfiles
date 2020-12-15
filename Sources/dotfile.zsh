function dotfile() {

    dotfile_commands_path=$DOTFILE_/commands
    _command=$1
    shift

    case $_command in
        update)
            zsh $dotfile_commands_path/update.zsh $DOTFILE_PATH
            ;;   
        # [bB])   
        #     # handle 'b'
        #     ;;
        # [qQ])
        #     # handle 'q': quit
        #     exit 0
        #     ;;
        *)  
            echo "Unvalid command."
            ;;
    esac

}