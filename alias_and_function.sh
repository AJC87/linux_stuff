#!/bin/bash
# Script to document aliases and functions and place in startup file

# TODO: test everything, maybe have startup file pull this file in in one go

# TODO: check default shell, should use zsh
readonly STARTUP_FILE='~/.bashrc'

# TODO: maybe refactor the shared code
function file_info() {
    local DIRNAME

    if (( $# != 1 )); then
        DIRNAME="$(pwd)"
    else
        DIRNAME=$1
    fi

    file *"${DIRNAME}"/*
}

function space() {
    local DIRNAME

    if (( $# != 1 )); then
        DIRNAME='*'
    else
        DIRNAME=$1
    fi

    sudo du -shxc —exclude=proc "${DIRNAME}"
}

function dir_space() {
    local DIRNAME

    if (( $# != 1 )); then
        DIRNAME="$(pwd)"
    else
        DIRNAME=$1
    fi

    sudo du —maxdepth=1 -hx "${DIRNAME}"
}
