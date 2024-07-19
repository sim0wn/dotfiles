# document processing tools
alias pandoc='podman run --rm -v "${PWD}:/data:z" pandoc/latex'

# security testing tools
alias cewl='podman run -it --rm -v "${PWD}:/host" ghcr.io/digininja/cewl'
alias rustscan='podman run --privileged --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=NET_BIND_SERVICE -v "${PWD}:/data:z" -it --rm --name rustscan docker.io/rustscan/rustscan:latest'
