#!/usr/bin/env bash

function test-modernization() {
    echo "---"
    echo -n "\`exa\`: "
    if [ -x "$(command -v exa)" ] ; then
        echo "$(command -v exa)"
        exa --version | sed 's/^/    /'
    else
        echo "NOT FOUND"
    fi
    echo

    echo "---"
    echo -n "\`bat\`: "
    if command -v bat ; then
        if [ -x "$(command -v batcat)" ] ; then
            echo "  -> $(command -v batcat)"
        fi
        bat --version | sed 's/^/    /'
    else
        echo "NOT FOUND"
    fi
    echo

    echo "---"
    echo -n "\`fd\`: "
    if command -v fd ; then
        if [ -x "$(command -v fdfind)" ] ; then
            echo "  -> $(command -v fdfind)"
        fi
        fd --version | sed 's/^/    /'
    else
        echo "NOT FOUND"
    fi
    echo

    echo "---"
    echo -n "\`rsync\`: "
    if [ -x "$(command -v rsync)" ] ; then
        echo "$(command -v rsync)"
        rsync --version | sed 's/^/    /'
    else
        echo "NOT FOUND"
    fi
    echo

    echo "---"
    echo -n "\`diff-highlight\`: "
    if [ -x "$(command -v diff-highlight)" ] ; then
        echo "$(command -v diff-highlight)"
    else
        echo "NOT FOUND"
    fi
    echo

    echo "---"
    echo -n "\`delta\`: "
    if [ -x "$(command -v delta)" ] ; then
        echo "$(command -v delta)"
        delta --version | sed 's/^/    /'
    else
        echo "NOT FOUND"
    fi
    echo
}
