#!/bin/zsh

cheat() {
    if [[ "x$CHEAT_DIR" = "x" ]]; then
        echo "\$CHEAT_DIR not set"
    elif [[ ! -d "$CHEAT_DIR" ]]; then
        echo "$CHEAT_DIR is not a directory. Please modify the \$CHEAT_DIR variable"
    elif [[ $# -eq 1 ]]; then
        if [[ ! -f "$CHEAT_DIR/$1" ]]; then
            echo "Not found: $CHEAT_DIR/$1"
        else 
            echo "=== $1 ==="
            cat $CHEAT_DIR/$1
        fi
    elif [[ $# -eq 2 ]]; then
        case "$1" in
            'e')
                vim "$CHEAT_DIR/$2"
                ;;
            *)
                if [[ ! -f "$CHEAT_DIR/$1" ]]; then
                    echo "Not found: $CHEAT_DIR/$1"
                else
                    echo "=== $1 (filter: $2) ==="
                    cat $CHEAT_DIR/$1 | grep $2
                fi
        esac
    fi
}
