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
# --- Bun preferences ---
# -----------------------

export BUN_INSTALL="${HOME}/.local/share/bun"

# -----------------------
# --- Git preferences ---
# -----------------------

export GIT_CONFIG="${HOME}/.config/git/config"

# ----------------------
# --- Go preferences ---
# ----------------------

export GOPATH="${HOME}/.local/share/go"

# ------------------------
# --- Rust preferences ---
# ------------------------

CARGO_HOME="${HOME}/.local/share/cargo"

# -----------------------------
# --- Environment variables ---
# -----------------------------

EDITOR="nvim"
VISUAL="${EDITOR}"

PATH="${PATH:+${PATH}:}${BUN_INSTALL}/bin/" # add BUN PATH to PATH
PATH="${PATH:+${PATH}:}${CARGO_HOME}/bin/" # add cargo HOME to PATH
PATH="${PATH:+${PATH}:}${GOPATH}/bin/" # add GOPATH to PATH
PATH="${PATH:+${PATH}:}${HOME}/.local/share/npm/bin/" # add NPM PATH to PATH
