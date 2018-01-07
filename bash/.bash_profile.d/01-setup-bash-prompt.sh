# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export PS1="\n\[\033[38;5;1m\]\u\[$(tput sgr0)\]@\[\033[38;5;5m\]\h\[$(tput sgr0)\] \[\033[38;5;4m\]\w\[$(tput sgr0)\]\n> "
