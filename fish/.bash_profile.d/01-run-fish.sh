# Start fish shell if it exists
# Start bash with the NOFISH environment variable set to disable
if [ -z "$NOFISH" ] && [ -f "$HOME/env/dope/bin/fish" ]; then
  $HOME/env/dope/bin/fish
  # Exit from bash immediately if fish exited successfully
  if [ $? -eq 0 ]; then
    exit
  fi
  echo 'Fish exited with an error, dropping to bash shell'
fi
