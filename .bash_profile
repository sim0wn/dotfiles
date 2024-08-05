# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

#######################
### - Environment - ###
#######################

##################
### -- BASH -- ###
##################
EDITOR="nvim"
VISUAL="$EDITOR"

#################
### -- NPM -- ###
#################
export npm_config_userconfig="$HOME/.config/npm/npmrc"
export npm_config_cache="$HOME/.cache/npm"
PATH="${PATH:+${PATH}:}$HOME/.local/share/npm/bin/"

#################
### -- GIT -- ###
#################
export GIT_CONFIG="$HOME/.config/git/config"

##################
### -- PATH -- ###
##################
export GOPATH="$HOME/.local/share/go"
PATH="${PATH:+${PATH}:}$GOPATH/bin/"
