##### ZSH ENVIRONMENT VARIABLES

typeset -U path

#### TERMINAL ############################################

export TERM=alacritty
# export TERM=xterm-256color
# export EDITOR='subl -w'
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export PAGER=less


#### C FLAGS
export CPPFLAGS="-I/usr/local/include ${CPPFLAGS}"

#### ZSH
export XDG_CONFIG_HOME=${HOME}/.config

export HISTFILE=${ZDOTDIR}/.zhistory    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file


#### NVM
export NVM_DIR=${HOME}/.nvm


#### PYENV
export PYENV_ROOT=${HOME}/.pyenv


path=(${PYENV_ROOT}/bin
	  ${PYENV_ROOT}/shims
	  ${HOME}/perl5/bin
	  ${path})

export PATH

eval "$(pyenv init --path)"

