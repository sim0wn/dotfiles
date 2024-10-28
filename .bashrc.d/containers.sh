# ---------------------------------
# --- Document Processing Tools ---
# ---------------------------------

function pandoc() {
  podman run --rm \
    --volume="${PWD}:/data:Z" \
    pandoc/latex "$@"
}

export -f pandoc

# ------------------------------
# --- Security Testing Tools ---
# ------------------------------
function caido() {
  podman run --rm \
    --volume="${HOME}/.local/share/caido:/home/caido/.local/share/caido:Z" \
    caido/caido:latest "$@"
}

function cewl() {
  podman run --interactive --rm \
    --volume="${PWD}:/host" \
    ghcr.io/digininja/cewl "$@"
}

function feroxbuster () {
  podman run --rm --init --interactive \
    --volume="${HOME}/.config/feroxbuster:/root/.config/feroxbuster:Z" \
    --volume="${PWD}:/data:Z" \
    --workdir /data \
    docker.io/epi052/feroxbuster:latest "$@"
}

function jwt_tool() {
  podman run --rm --interactive \
    --volume="${PWD}:/tmp:Z" \
    --volume="${HOME}/.config/jwt_tool:/root/.jwt_tool:Z" \
    ticarpi/jwt_tool:latest "$@"
}

function mitmproxy() {
  podman run --rm --interactive --tty \
    --publish "8080:8080" \
    --publish "127.0.0.1:8081:8081" \
    --volume="${HOME}/.config/mitmproxy:/home/mitmproxy/.mitmproxy:Z" \
    --volume="${PWD}:/data:Z" \
    --workdir /data \
    docker.io/mitmproxy/mitmproxy "$@"
}

function rustscan () {
  podman run --rm --interactive --tty \
    --cap-add=NET_ADMIN,NET_RAW,NET_BIND_SERVICE --privileged \
    --volume="${PWD}:/data:Z" \
    --workdir="/data" \
    --name rustscan \
    docker.io/rustscan/rustscan:latest --no-config "$@"
}

export -f caido
export -f cewl
export -f feroxbuster
export -f jwt_tool
export -f mitmproxy
export -f rustscan
