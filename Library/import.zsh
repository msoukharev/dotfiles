source_dir=$DOTFILE_PATH/Library/Sources
sources=(`ls $source_dir`)

for file in $sources; do
    source $source_dir/$file
done

unset source_dir
unset sources
