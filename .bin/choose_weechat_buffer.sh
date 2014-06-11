#!/bin/sh

# select weechat channel buffer
if command -v percol > /dev/null 2>&1; then
    for fifo in $HOME/.weechat/weechat_fifo_*; do
        echo '*/mute layout store' > $fifo
        echo '*/mute save weechat' > $fifo
    done

    BUFFER=$(grep 'default.buffer' $HOME/.weechat/weechat.conf | cut -d'"' -f2 | percol | cut -d';' -f3)
    if [ -n "$BUFFER" ]; then
        for fifo in $HOME/.weechat/weechat_fifo_*; do
            echo '*/mute buffer' $BUFFER > $fifo
        done
    fi
fi

# select tmux window of weechat
if command -v tmux > /dev/null 2>&1; then
    WINDOW=$(tmux list-windows | grep -i weechat | cut -d':' -f1)
    if [ -n "$WINDOW" ]; then
        tmux select-window -t $WINDOW
    fi
fi
