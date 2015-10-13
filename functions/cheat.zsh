#!/bin/zsh

cheat() {
    local tag
    if [[ "x$CHEAT_DIR" = "x" ]]; then
        echo "\$CHEAT_DIR not set"
        return
    elif [[ ! -d "$CHEAT_DIR" ]]; then
        echo "$CHEAT_DIR is not a directory. Please check your \$CHEAT_DIR variable"
        return
    fi

    if [[ $# -eq 0 ]]; then
        for file in $CHEAT_DIR/*; do
            if [ -f ${file} ]; then
                echo "\n=== $(basename "$file") ==="
                cat $file
            fi
        done
        return
    fi

    case "$1" in
        '-e')
            if [[ $# -eq 2 ]]; then
                _edit_cheat "$2"
            else
                echo "Wrong number of arguments: usage: cheat -e <tag>"
            fi
            ;;
        '-l')
            ls "$CHEAT_DIR"
            ;;
        '-a')
            if [[ $# -eq 3 ]]; then
                tag="$CHEAT_DIR/$3"
                if [[ ! -f "$tag" ]]; then
                    echo "Tag not found: $3. Create it first (cheat -c $3)."
                else
                    echo "$2" >> "$tag"
                fi
            else
                echo "Wrong number of arguments: usage: cheat -a <Line to append> <tag>"
            fi
            ;;
        '-k')
            if [[ $# -eq 4 ]]; then
                tag="$CHEAT_DIR/$4"
                if [[ ! -f "$tag" ]]; then
                    echo "Tag not found: $4. Create it first (cheat -c <tag>)."
                else
                    echo "$2\t- $3" >> "$tag"
                fi
            else
                echo "Wrong number of arguments: usage: cheat -k <Key binding> <description> <tag>"
            fi
            ;;
        '-c')
            tag="$CHEAT_DIR/$2"
            if [[ $# -eq 2 ]]; then
                touch "$tag"
                echo "Tag $2 created."
            fi
            ;;
        '-h')
            echo "cheat                - list all cheats"
            echo "cheat <tag>          - list cheats for tag"
            echo "cheat <tag> <str>    - list cheats for tag, filter by string"
            echo "cheat -l             - list all tags"
            echo "cheat -e <tag>       - edit given tag file"
            echo "cheat -c <tag>       - Create tag"
            echo "cheat -a <str> <tag> - Append the given string for tag"
            echo "cheat -k <keybinding> <desc> <tag>"
            echo "                     - Append documentation for keybinding for tag"
            ;;
        *)
            tag="$CHEAT_DIR/$1"
            if [[ ( $# -eq 1 || $# -eq 2 ) && ( ! -f "@tag" ) ]]; then
                echo "Tag not found: $1"
                return;
            fi
            _cat_cheat $@
    esac
}

_cat_cheat() {
    if [[ $# -eq 1 ]]; then
        cat "$CHEAT_DIR/$1"
    elif [[ $# -eq 2 ]]; then
        cat "$CHEAT_DIR/$1" | grep "$2"
    else
        echo "Expected one or two parameters"
    fi
}

_edit_cheat() {
    local edr
    if [[ "x$EDITOR" = "x" ]]; then
        edr="vim"
    else
        edr="$EDITOR"
    fi
    eval $edr "$CHEAT_DIR/$1"
}
