# .bash_profile
files=$(ls ~/.bash_profile.d/)

for file in ${files}; do
    source ~/.bash_profile.d/${file}
done
