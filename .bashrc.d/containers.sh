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

function crackmapexec() {
  if podman image exists crackmapexec; then
    podman run --rm --interactive --tty \
      --volume="${HOME}/.local/share/cme:/root/.cme:Z" \
      --network=host \
      crackmapexec "$@"
    else
      podman kill crackmapexec 2> /dev/null && podman rm crackmapexec 2> /dev/null
      podman run --rm --detach --interactive --tty \
        --name=crackmapexec \
        kalilinux/kali-rolling:latest
      podman exec crackmapexec apt-get update -y
      podman exec crackmapexec apt-get install crackmapexec -y
      podman commit --change='ENTRYPOINT ["crackmapexec"]' crackmapexec crackmapexec
      podman rm --force crackmapexec 2> /dev/null
      crackmapexec "$@"
  fi
}

function cewl() {
  podman run --interactive --rm \
    --volume="${PWD}:/host" \
    ghcr.io/digininja/cewl "$@"
}

function mitmproxy() {
  podman run --rm --interactive --tty \
    --publish "8080:8080" \
    --publish "127.0.0.1:8081:8081" \
    --volume="${HOME}/.config/mitmproxy:/home/mitmproxy/.mitmproxy:Z" \
    --volume="${PWD}:/data:Z" \
    --workdir="/data" \
    docker.io/mitmproxy/mitmproxy "$@"
}

export -f cewl
export -f crackmapexec
export -f mitmproxy
