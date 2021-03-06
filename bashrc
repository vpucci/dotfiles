# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=~/bin:${PATH}
[ -d ~/local/bin ] && PATH=~/local/bin:$PATH
[ -d "$HOME" ] && PATH=$HOME/.local/bin:$PATH


#=============
# SHELL PROMPT
#=============
# Powerline requires Python 2.6+
# Make sure python is 2.6 or later
PYTHON_OK=`python -c 'import sys; print (sys.version_info >= (2, 6) and "1" or "0")'`

if [ "$PYTHON_OK" = '1' ] && [ -f $HOME/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh ]; then
    # Run Powerline if Python 2.6+
    source $HOME/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh
    # use default_leftonly Powerline theme for branch segment to be seen
    POWERLINE_COMMAND="$POWERLINE_COMMAND -c ext.shell.theme=default_leftonly"
    POWERLINE_CONFIG_COMMAND=$HOME/.vim/bundle/powerline/scripts/powerline-config
else
    # Load in the git branch prompt script.
    source $HOME/.git-prompt.sh
    PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
fi
export PYTHON_OK


#=============
# LOCAL BASHRC
#=============
# Now, run the host-specific bashrc if any
# the host-specific bashrc file
LOCALBASHRC=$HOME'/dotfiles/bash/bashrc_'`hostname | cut -d. -f1`

if [ -f $LOCALBASHRC ]; then
    . $LOCALBASHRC
fi
