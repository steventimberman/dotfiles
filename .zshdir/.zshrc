echo

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi




#### Aliases #############################################

alias ez="subl ${ZDOTDIR}/"
sz() { exec "$SHELL" }

alias lsa='ls -a'

cd() { builtin cd "$@"; lsa; }
alias cd..='cd ../'
alias ..1='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ~='cd ~'
alias c='clear && echo'
alias dirsz='du -s -h *'
mcd() { mkdir -p "$1" && cd "$1"; }

alias pact='poetry shell'

ws() { cd ~/workspace/active;}

alias wp="which python && python --version"
alias act='source venv/bin/activate'
alias deact='source deactivate'

alias gc="git commit -m"
alias gch="git checkout"
alias gchb="git checkout -b"
alias gchm="git checkout main"
alias ga="git add"
alias gdiff="git diff --cached"

alias cpuHogs='ps wwXaxr -o pid,stat,%cpu,time,command | head -10'
alias find-file='find / -iname'


#### Linux Aliases


function sudosubl {
  export SUDO_EDITOR="subl -w"
  sudoedit "$@"
}

function sudovim {
  export SUDO_EDITOR="vim"
  sudoedit "$@"
}

# Pacman
alias pac='sudo pacman -S'
alias pac-has='sudo pacman -Qi'
alias pac-u='sudo pacman -Syu'

# X-org
alias kb-reset='setxkbmap'
kb-print () {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

#### Units and systemd ####
what-units () {
  sudo pacman -Qql $1 | grep -Fe .service -e .socket
}
alias edit-display='sudo vim /etc/X11/xorg.conf.d/10-monitor.conf'

# Helper aliases that print useful commands

#### DOCKER ##################################################################

alias help-docker='
echo ""
echo "Docker Commands"
echo "---------------"
echo "docker info -- See containers running and config"
echo "docker version -- See version"
echo "docker search python -- Search for image"
echo "docker pull hello-world -- Download image hello-world"
echo "docker run hello-world -- Run the docker image"
echo "docker container ls -- See status of running containers"
echo "docker images -- See list of downloaded images"
echo "docker stats -- See CPU, RAM, and network stats"
echo "docker network ls -- See network configs"
echo ""
echo "Docker Aliases"
echo "--------------"
echo "docker-start -- Start the Docker service"
echo "docker-enable -- Enable the Docker service to start on reboot"
echo ""
'

#### 1password ###############################################################

alias help-op='
echo ""
echo "1Password Commands"
echo "------------------"
echo "op list items -- list all saved items"
echo "op create document readme.txt --vault Private -- Upload to vault"
echo "op list items --vault Shared -- Get UUIDs of items in vault"
echo "op get item WestJet -- Get the details of item"
echo "op get item nqikpd2b --fields password -- Get password field by UUID"
echo "op get item nqikpd2bdjae3lmizdajy2rf6e --fields username,password"
echo ""
echo "Also can use jq to parse json"
echo ""
'

#### Git Helpers #############################################################

alias help-git='
echo ""
echo "Git Commands"
echo "------------"
echo "gc --git commit -m"
echo "gch --git checkout"
echo "gchb --git checkout -b"
echo "gchm --git checkout main"
echo "ga --git add"
echo "gdiff --git diff --cached"
echo ""
'

alias help-permissions='
echo ""
echo "Permissions Commands"
echo "--------------------"
echo "ls -l dir/file -- see permisions for dir/file"
echo "getfacl dir/file -- see ACL permissions for dir/file"
echo "sudo tune2fs -l /dev/nvme0n1p2 -- see filesystem info"
echo ""
echo "Set individual permissions"
echo "--------------------------"
echo "setfacl -m  \"u:http:rwx\" dir/file"
echo "... The http user now has all permissions to this file ..."
echo "chmod o-rx dir/file"
echo "... Others no longer have write access to this file ..."
echo ""
'

# General Path Additions

#### NVM #####################################

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


#### 1Password (Login function) ##########################

op-login() { eval $(op signin my); }

#### SHELL CONFIG FILES ##################################

fpath+="$ZDOTDIR/.zfunc"

#### EVAL STATEMENTS #####################################


#Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

neofetch

compinit
