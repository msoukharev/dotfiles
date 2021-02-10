# Link contents of a script to a target script
# via '#%import script_name' command.
# The utility scripts are located in $DOTFILE_PATH/lib directory.
function linker {

    script_loc=$DOTFILE_PATH/lib
    target=$1
    imports=$(cat $target | grep '^#%import' | sed 's/^#%import\ //')
    errno=0
    # Temporary linker file that will eventually replace or be created as a target
    touch linker.tmp

    for script in ${imports[@]}; do
        fpath=${script_loc}/${script}.bash
        if __exists $fpath; then
            # MacOS builtin sed behaves weird. 
            # However, if gnu sed is installed, there might be no way of differentiating the versions.
            # It is something that a user might need to specify in a config file...
            __macos && sed -i '' "s/^#%import ${script}//g" $target
            __linux && sed -i "s/^#%import ${script}//g" $target
            # Strip any comments, add a newline at the end
            cat $fpath | sed '/^\ *\#.*$/d' >> linker.tmp ; echo "" >> linker.tmp
        else
            echo "Script $script not found. Expected at $fpath." 1>&2
            errno=1
        fi
    done

    cat $target >> linker.tmp
    mv linker.tmp $target

    return errno

}
