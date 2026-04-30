case $- in *i*) ;; *) return ;; esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -n "$WSL_DISTRO_NAME" ]; then
    wpf() {
        local cmd=$1
        local port=${2:-3333}
        local wsl_ip=$(hostname -I | awk '{print $1}')

        case "$cmd" in
            add)
                echo "Adding forwarding: Windows:${port} -> WSL:${wsl_ip}:${port}"
                powershell.exe -Command "Start-Process powershell -ArgumentList \"netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddress=$wsl_ip\" -Verb RunAs"
                ;;
            remove|del|delete)
                echo "Removing forwarding for port ${port}..."
                powershell.exe -Command "Start-Process powershell -ArgumentList \"netsh interface portproxy delete v4tov4 listenport=$port listenaddress=0.0.0.0\" -Verb RunAs"
                ;;
            list|ls|show)
                powershell.exe -Command "netsh interface portproxy show all"
                ;;
            *)
                echo "Usage: wpf {add|remove|list} [port]"
                return 1
                ;;
        esac
    }
fi

