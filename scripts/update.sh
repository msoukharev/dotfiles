utd="Dotfile is already up to date."

################################################################################

echo "Updating DOTFILE"

wd=`pwd`

cd $DOTFILE && git pull origin release >/dev/null 2>&1 && cd wd

git pull origin release | grep "Already up to date." >/dev/null 2&>1 && echo utd

################################################################################
