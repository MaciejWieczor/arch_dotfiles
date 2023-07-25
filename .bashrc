#
# ~/.bashrc
#

# If not running interactively, don't do anything

# cd() {
#     command cd $@
#     pwd > ~/.curdir
# }

# command cd `cat ~/.curdir`

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lt='ls -lah'
alias off='shutdown -h now'
alias yt='ytfzf -tf'
alias ytd='ytfzf -df'
alias p='python3'
alias p_venv='./venv/bin/python'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias r='ranger'
alias matlab='export MESA_LOADER_DRIVER_OVERRIDE=i965; /usr/local/MATLAB/R2021b/bin/matlab -nodesktop -nosplash'
alias matlab_gui='export MESA_LOADER_DRIVER_OVERRIDE=i965; /usr/local/MATLAB/R2021b/bin/matlab'
alias i3r='i3-msg restart'
alias nv='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias n='ncmpcpp'
alias gitupstream='git --git-dir=.gitupstream'
alias gitfork='git --git-dir=.gitfork'

PS1='[\u@\h \W]\$ '

export VISUAL=nvim;
export EDITOR=nvim;

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# export QT_QPA_PLATFORMTHEME=

export PS1="[\[\e[33m\]\s\[\e[m\]:\[\e[34m\]\u\[\e[m\] \[\e[36m\]\W\[\e[m\]]\\$ "
eval "$(pyenv init --path)"

# HSTR configuration - add this to ~/.bashrc
# export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

export PAGER="less -R"
export SPACESHIP_DIR_TRUNC_REPO=false

xset r rate 300 50

setxkbmap pl

xset -dpsm
xset s off
xset s noblank
xset -display :0.0 dpms 0 0 0
clear
