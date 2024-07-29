# ---------------------------------
# --- Document Processing Tools ---
# ---------------------------------

alias pandoc='podman run --rm -v "${PWD}:/data:z" pandoc/latex'

# ------------------------------
# --- Security Testing Tools ---
# ------------------------------
alias cewl='podman run -it --rm -v "${PWD}:/host" ghcr.io/digininja/cewl'

function feroxbuster () {
  podman run --rm --init --interactive --userns=keep-id \
    --volume="$HOME/.config/feroxbuster:/root/.config/feroxbuster:z" \
    --volume="$PWD:/data:z" \
    --workdir /data \
    docker.io/epi052/feroxbuster:latest "$@"
}

function mitmproxy() {
  podman run --rm --interactive --tty \
    --publish 8080:8080 --publish "127.0.0.1:8081:8081" \
    --userns=keep-id --user root \
    --volume="$HOME/.config/mitmproxy:/home/mitmproxy/.mitmproxy:z" \
    --volume="$PWD:/data:z" \
    --workdir /data \
    docker.io/mitmproxy/mitmproxy "$@"
}

function rustscan () {
  podman run --interactive --tty --rm \
    --cap-add=NET_ADMIN,NET_RAW,NET_BIND_SERVICE --privileged \
    --workdir="/data" --volume="$PWD:/data:z" \
    --user root --userns=keep-id \
    --name rustscan \
    docker.io/rustscan/rustscan:latest --no-config "$@"
}

export -f feroxbuster
export -f mitmproxy
export -f rustscan
