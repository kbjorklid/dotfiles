#!/bin/zsh
# Set the current project. The c command executed without any parameters will jump to the directory
function cset() {
    if [[ $# -eq 1 ]]; then
        echo "$PROJECTS/$1" > $HOME/.current-project
    else
        cat $HOME/.current-project
    fi
}
