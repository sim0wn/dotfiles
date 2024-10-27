# ------------------------------------------------
# --- Source the aliases and other preferences ---
# ------------------------------------------------

if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi

# -----------------------
# --- NPM preferences ---
# -----------------------

export npm_config_userconfig="${HOME}/.config/npm/npmrc"
export npm_config_cache="${HOME}/.cache/npm"

# -----------------------
# --- Git preferences ---
# -----------------------

export GIT_CONFIG="${HOME}/.config/git/config"

# ----------------------
# --- Go preferences ---
# ----------------------

export GOPATH="${HOME}/.local/share/go"

# -----------------------------
# --- Environment variables ---
# -----------------------------

EDITOR="nvim"
VISUAL="${EDITOR}"

PATH="${PATH:+${PATH}:}${GOPATH}/bin/" # add GOPATH to PATH
PATH="${PATH:+${PATH}:}${HOME}/.local/share/npm/bin/" # add NPM PATH to PATH