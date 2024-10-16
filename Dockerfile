FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install python3 python-is-python3 fontforge python3-fontforge -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install busybox curl -y \
    && curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip | busybox unzip -qd /FontPatcher - \
    && apt autoremove busybox curl -y \
    && rm -rf /var/lib/apt/lists/*
