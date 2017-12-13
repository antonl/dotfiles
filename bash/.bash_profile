# .bash_profile
# Start fish shell if it exists
# Start bash with the NOFISH environment variable set to disable
if [ -z "$NOFISH" ] && [ -f "$HOME/.local/bin/fish" ]; then
  $HOME/.local/bin/fish
  # Exit from bash immediately if fish exited successfully
  if [ $? -eq 0 ]; then
    exit
  fi
  echo 'Fish exited with an error, dropping to bash shell'
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export PS1="\n\[\033[38;5;1m\]\u\[$(tput sgr0)\]@\[\033[38;5;5m\]\h\[$(tput sgr0)\] \[\033[38;5;4m\]\w\[$(tput sgr0)\]\n> "
export PATH=$HOME/.local/bin:$HOME/.local/sbin:$PATH
export MANPATH=$HOME/.local/man:$MANPATH
