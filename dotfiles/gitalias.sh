alias gita="git add ."

# git add . ; git commit -m $1
gitac() {
    git add .
    git commit -m $1
}

# git push origin $1
gitps() {
    git push origin $1
}

# git pull origin $1
gitpl() {
    git pull origin $1
}

gitpushso() {
    git push --set-upstream origin $1
}