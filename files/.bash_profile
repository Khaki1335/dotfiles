export LANG=en_US.UTF-8
export EDITOR=vim

test -f ~/.bash_profile.local && . ~/.bash_profile.local
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc
test -f ~/.bashrc.local && . ~/.bashrc.local

if [ "$SHLVL" -eq 1 ] && command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux
fi
