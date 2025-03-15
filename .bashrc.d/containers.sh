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

function wrapwrap() {
  if podman image exists wrapwrap; then
    podman run --rm --interactive --tty \
      --volume="${PWD}:/data:Z" \
      --workdir="/data" \
      wrapwrap "$@"
  else
    SCRIPT="$(mktemp /tmp/wrapwrap.XXXXXX.sh)"
    cat > "${SCRIPT}" <<EOF
    #!/bin/bash
    apk update && apk add git
    git clone https://github.com/ambionics/wrapwrap.git /opt/wrapwrap
    pip install ten
EOF
    podman run --interactive --tty --rm --detach --replace \
      --name=wrapwrap python:3.10-alpine
    podman cp "${SCRIPT}" wrapwrap:"${SCRIPT}"
    podman exec wrapwrap /bin/sh "${SCRIPT}"
    podman commit --change='ENTRYPOINT ["python3", "/opt/wrapwrap/wrapwrap.py"]' wrapwrap wrapwrap
    podman rm --force wrapwrap 2>/dev/null
    wrapwrap "$@"
  fi
}

export -f cewl
export -f mitmproxy
export -f wrapwrap
