# Colorful grep
alias grep="grep --color=auto"

# LS colors
if __macos; then

    export CLICOLOR=1
    alias ls="ls -G"

elif __linux; then

    export CLI_COLOR=1
    alias ls="ls --color=auto"

fi
