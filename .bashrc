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

# HOME
PUCCI_HOME=/chelles.b/users/pucci

##################
## SHELL PROMPT ##
##################
# Powerline requires Python 2.6+
# Make sure python is 2.6 or later
PYTHON_OK=`python -c 'import sys; print (sys.version_info >= (2, 6) and "1" or "0")'`

if [ "$PYTHON_OK" = '1' ]; then
    # Run Powerline if Python 2.6+
    source $HOME/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh
    # use default_leftonly Powerline theme for branch segment to be seen
    POWERLINE_COMMAND="$POWERLINE_COMMAND -c ext.shell.theme=default_leftonly"
else
    # Load in the git branch prompt script.
    source $HOME/.git-prompt.sh
    PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
fi
export PYTHON_OK

###################
## LOCAL INSTALL ##
###################

LOCAL_DIR=$PUCCI_HOME/local

# JAVA , JDK, JRE
JAVA_HOME=$LOCAL_DIR/java

JDK_HOME=$JAVA_HOME/jdk
#[ -d "$JDK_HOME" ] && PATH=$JDK_HOME/bin:$PATH

JRE_HOME=$JAVA_HOME/jre
[ -d "$JRE_HOME" ] && PATH=$JRE_HOME/bin:$PATH

# APACHE-ANT
ANT_HOME=$LOCAL_DIR/apache-ant
[ -d "$ANT_HOME" ] && PATH=$ANT_HOME/bin:$PATH

# MATLAB
MATLAB_HOME=/usr/local/MATLAB/R2012b
[ -d "$MATLAB_HOME" ] && PATH=$MATLAB_HOME/bin:$PATH

# ECLIPSE JUNO
# JUNO_HOME=$LOCAL_DIR/eclipse/juno
# [ -d "$JUNO_HOME" ] && PATH=$JUNO_HOME:$PATH

# ECLIPSE TOPCASED
TOPCASED_HOME=$LOCAL_DIR/eclipse/topcased
[ -d "$TOPCASED_HOME" ] && PATH=$TOPCASED_HOME:$PATH

# ANOD
SANDBOX_ROOT=$PUCCI_HOME/gcc-47
[ -d "$SANDBOX_ROOT=" ] && PATH=$SANDBOX_ROOT=/bin:$PATH

###############
## GMC TOOLS ##
###############

PTOOLSET_DIR=$PUCCI_HOME/ptoolset
GMS_DIR=$PTOOLSET_DIR/gms

# GMC

[ -d "$GMS_DIR" ] && PATH=$GMS_DIR/qualified/obj:$PATH

# GMV

GMV_HOME=$GMS_DIR/gmv
[ -d "$GMV_HOME" ] && PATH=$GMV_HOME/obj:$PATH

# GMS_SIM

GMS_SIM_HOME=$GMS_DIR/tests/qualifiable/himoco_sim
[ -d "$GMS_SIM_HOME" ] && PATH=$GMS_SIM_HOME/obj:$PATH

# MDL2JSON

MDL2JSON_HOME=$GMS_DIR/gui
[ -d "$MDL2JSON_HOME" ] && PATH=$MDL2JSON_HOME/obj:$PATH

export PATH

##########################
## GCC-47 SANDBOX TOOLS ##
##########################

# CODEPEER

CPATH="$CPATH:/usr/include/x86_64-linux-gnu"
PATH="/chelles.b/users/pucci/gcc-47/x86_64-linux/codepeer/install/bin:$PATH"
LD_LIBRARY_PATH="/chelles.b/users/pucci/gcc-47/x86_64-linux/codepeer/install/lib64:/chelles.b/users/pucci/gcc-47/x86_64-linux/codepeer/install/lib:$LD_LIBRARY_PATH"
GPR_PROJECT_PATH='/chelles.b/users/pucci/gcc-47/x86_64-linux/codepeer/install/share/gpr:/chelles.b/users/pucci/gcc-47/x86_64-linux/codepeer/install/lib/gnat'
LIBRARY_PATH="$LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
export CPATH PATH LD_LIBRARY_PATH GPR_PROJECT_PATH LIBRARY_PATH

# GPS

CPATH="$CPATH:/usr/include/x86_64-linux-gnu"
PATH="/chelles.b/users/pucci/gcc-47/x86_64-linux/gps/install/bin:$PATH"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/chelles.b/users/pucci/gcc-47/x86_64-linux/gps/install/lib64:/chelles.b/users/pucci/gcc-47/x86_64-linux/gps/install/lib"
LIBRARY_PATH="$LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
export CPATH PATH LD_LIBRARY_PATH LIBRARY_PATH

# STABLE-GNAT

CPATH="$CPATH:/usr/include/x86_64-linux-gnu"
PATH="/chelles.b/users/pucci/gcc-47/x86_64-linux/stable-gnat/install/bin:$PATH"
LD_LIBRARY_PATH="/chelles.b/users/pucci/gcc-47/x86_64-linux/stable-gnat/install/lib64:/chelles.b/users/pucci/gcc-47/x86_64-linux/stable-gnat/install/lib:$LD_LIBRARY_PATH"
GPR_PROJECT_PATH='/chelles.b/users/pucci/gcc-47/x86_64-linux/stable-gnat/install/share/gpr:/chelles.b/users/pucci/gcc-47/x86_64-linux/stable-gnat/install/lib/gnat'
LIBRARY_PATH="$LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"
export CPATH PATH LD_LIBRARY_PATH GPR_PROJECT_PATH LIBRARY_PATH

#########
## EOF ##
#########

export CLICOLOR=true
export SVN_EDITOR=vi
export GIT_EDITOR=vi
export EDITOR=vi
export PROCESSORS=16

# Bugtool Remote
alias bugtool=/homes/pucci/Bugtool-remote/btr

# Goto Ptoolset dir
[ -d "$GMS_DIR" ] && cd $GMS_DIR
