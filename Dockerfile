FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install python3 python-is-python3 fontforge python3-fontforge -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install curl unzip -y \
    && curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip \
    && unzip FontPatcher.zip -d /FontPatcher \
    && rm FontPatcher.zip \
    && apt autoremove curl unzip -y \
    && rm -rf /var/lib/apt/lists/*

COPY FontnameTools.py /FontPatcher/bin/scripts/name_parser/FontnameTools.py
