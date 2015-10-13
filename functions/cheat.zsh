#!/bin/zsh

cheat() {
    if [[ "x$CHEAT_DIR" = "x" ]]; then
        echo "\$CHEAT_DIR not set"
        return
    elif [[ ! -d "$CHEAT_DIR" ]]; then
        echo "$CHEAT_DIR is not a directory. Please modify the \$CHEAT_DIR variable"
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
                if [[ ! -f "$CHEAT_DIR/$3" ]]; then
                    echo "Tag not found: $3. Create it first (cheat -c <tag>)."
                else
                    echo "$2" >> "$CHEAT_DIR/$3"
                fi
            else
                echo "Wrong number of arguments: usage: cheat -a <Line to append> <tag>"
            fi
            ;;
        '-k')
            if [[ $# -eq 4 ]]; then
                if [[ ! -f "$CHEAT_DIR/$4" ]]; then
                    echo "Tag not found: $4. Create it first (cheat -c <tag>)."
                else
                    echo "$2\t- $3" >> "$CHEAT_DIR/$4"
                fi
            else
                echo "Wrong number of arguments: usage: cheat -k <Key binding> <description> <tag>"
            fi
            ;;
        '-c')
            if [[ $# -eq 2 ]]; then
                touch "$CHEAT_DIR/$2"
                echo "Tag $2 created."
            fi
            ;;
        '-h')
            echo "cheat                                 - list all cheats for all tags"
            echo "cheat <tag>                           - list all cheats for given tag"
            echo "cheat <tag> <str>                     - list cheats containing the string for the tag"
            echo "cheat -l                              - list all tags"
            echo "cheat -e <tag>                        - edit given tag file"
            echo "cheat -a <str> <tag>                  - Append the given string to tag file"
            echo "cheat -k <keybinding> <desc> <tag>    - Append descirption for the given keybinding to tag file"
            echo "cheat -c <tag>                        - Create tag"
            ;;
        *)
            if [[ ( $# -eq 1 || $# -eq 2 ) && ( ! -f "$CHEAT_DIR/$1" ) ]]; then
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
