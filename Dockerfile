FROM ghcr.io/loft-sh/devspace-containers/rust:1.72-bullseye
LABEL authors="JetEngine Tech"
LABEL org.opencontainers.image.description="JetEngine's DevSpace Container for cutting edge Rust project development. - Latest Stable Compiler"

RUN apt update && apt upgrade -y &&\
 apt install cmake libclang-dev postgresql-client python3-pip -y &&\
 apt clean &&\
 pip3 install virtualenv &&\
 rustup self update &&\
 rustup update stable &&\
 rustup default stable &&\
 cargo install -f cargo-watch\
 cargo-edit cargo-deny\
 cargo-upgrades cargo-criterion\
 cargo-udeps &&\
 rm -rf ~/.cargo/registry
