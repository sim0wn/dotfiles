# --------------
# --- Colors ---
# --------------

FG_BLUE="\[\e[38;5;32m\]"
FG_GREEN="\[\e[38;5;34m\]"
FG_PURPLE="\[\e[0;35m\]"
FG_YELLOW="\[\e[38;5;220m\]"
UNDERLINE="\[\e[4m\]"
RESET="\[\e[0m\]"

# ---------------------------
# --- Auxiliary functions ---
# ---------------------------

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# --------------------------
# --- Prompt preferences ---
# --------------------------

export PROMPT_DIRTRIM=3 # Only show the last 3 directories

# ----------------------
# --- Prompt Strings ---
# ----------------------

PS1="┌─$FG_GREEN\u$FG_YELLOW@$FG_BLUE\h$RESET $UNDERLINE\w$RESET [\t]"
PS1+="\n"
PS1+="└─\$(parse_git_branch)$FG_PURPLE\$$RESET "

export PS1
