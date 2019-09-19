FROM haskell:8

LABEL  maintainer="Lukas Grassauer <entze@grassauer.eu>"

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
       texlive-full \
       texlive-xetex latex-xcolor \
       texlive-math-extra \
       texlive-latex-extra \
       texlive-fonts-extra \
       texlive-bibtex-extra \
       fontconfig \
       lmodern \
       libghc-text-icu-dev \
       zip \
       tar \
       make \
    && apt-get clean

# Install cabal and then pandoc + citeproc
RUN stack install pandoc pandoc-citeproc

WORKDIR /build
