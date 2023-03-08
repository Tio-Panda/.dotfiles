#!/bin/bash

if [[ -z "$TMUX" ]]; then
    exec tmux
fi
