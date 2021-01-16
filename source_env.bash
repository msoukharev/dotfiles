# Source program environem scripts
for file in $(ls $DOTFILE_PATH/env); do
    source $DOTFILE_PATH/env/$file
done
