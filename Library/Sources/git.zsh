function __git_current_branch() {
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo $(git rev-parse --abbrev-ref HEAD) || :
}