# ---------------------------------
# --- Document Processing Tools ---
# ---------------------------------

alias pandoc='podman run --rm -v "${PWD}:/data:z" pandoc/latex'

# ------------------------------
# --- Security Testing Tools ---
# ------------------------------
alias cewl='podman run -it --rm -v "${PWD}:/host" ghcr.io/digininja/cewl'

function rustscan () {
  podman run --workdir /data --user 0:0 \
    --volume="${PWD}:/data:Z" \
    --cap-add=NET_ADMIN,NET_RAW,NET_BIND_SERVICE --privileged \
    --interactive --tty --rm --name rustscan \
    docker.io/rustscan/rustscan:latest --no-config "$@"
}

export -f rustscan
