FROM debian:bookworm
ENV LANG C.UTF-8
WORKDIR /app
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential ca-certificates curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 git && \
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh && \
    source /root/.ghcup/env && \
    ghcup install hls recommended --set && \
    ghcup install ghc recommended --set && \
    ghcup install cabal recommended --set && \
    ghcup install stack recommended --set && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
