# Sources files in $DOTFILE_PATH.
# If provided a path to a directoty, sources the files inside the directoty
# If provided a path to a file, sources the file
function __dotfile_source_path() {
    inside_path=$(sed 's/\ /\//g' <<< $@)
    source_path=$DOTFILE_PATH/$inside_path
    if [ -d $source_path ]; then
        files=(`ls $source_path`)
        for file in $files; do
            file_path=$source_path/$file
            [ -f $file_path ] && source $file_path
        done
    elif [ -f $source_path ]; then
        source $source_path
    else
        return 1
    fi
}
