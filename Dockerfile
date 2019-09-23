FROM ubuntu:bionic

LABEL  maintainer="Lukas Grassauer <entze@grassauer.eu>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Vienna
ENV PATH=$PATH:/root/.local/bin

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
       zip \
       tar \
       make \
       wget \
       haskell-platform \
       ruby-full \
       texlive-full \
       fontconfig \
       lmodern \
       libghc-text-icu-dev \
    && apt-get clean

RUN wget -qO- https://get.haskellstack.org/ | sh

# Install pandoc + citeproc
RUN stack install pandoc-2.7.3 pandoc-citeproc-0.16.2

RUN gem install mdl -v 0.5.0

WORKDIR /build
