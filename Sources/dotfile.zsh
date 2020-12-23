function dotfile() {

    dotfile_commands_path=$DOTFILE_/commands
    command=$1
    shift
    
    case $command in
        update)
            zsh $dotfile_commands_path/update.zsh
            ;;   
        # [bB])   
        #     # handle 'b'
        #     ;;
        # [qQ])
        #     # handle 'q': quit
        #     exit 0
        #     ;;
        *)  
            echo "Invalid command."
            ;;
    esac

}
