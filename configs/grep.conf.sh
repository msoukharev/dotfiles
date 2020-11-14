WHICH_GREP=`which grep`
alias gp="grep"
alias sgp=$WHICH_GREP
grep() {
    $WHICH_GREP --color=auto $@
}
unset $WHICH_GREP