# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# User specific aliases and functions
#source /reg/g/psdm/etc/ana_env.sh
#sit_setup ana-current
files=$(ls ~/.bashrc.d/)

for file in ${files}; do
    echo "sourcing ${file}"
    source ~/.bashrc.d/${file}
done
