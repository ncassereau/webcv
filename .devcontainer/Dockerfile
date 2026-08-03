FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

RUN sudo apt update \
    && sudo apt install -y make texlive texlive-latex-extra texlive-fonts-extra texlive-fonts-recommended latexmk \
    && sudo rm -rf /var/lib/apt/lists/*
