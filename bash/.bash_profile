# .bash_profile
files=$(ls ~/.bash_profile.d/)

# configure the login-specific options
for file in ${files}; do
    echo "sourcing ${file}"
    source ~/.bash_profile.d/${file}
done

case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac
