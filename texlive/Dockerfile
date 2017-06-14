FROM benizar/ubuntu

# Install all TeX and LaTeX dependences
RUN apt-get update && \
	apt-get install --yes --no-install-recommends \
		asymptote \
		biber \
		chktex \
		cm-super \
		context \
		dvidvi \
		dvipng \
		feynmf \
		fragmaster \
		info \
		lacheck \
		latexdiff \
		latexmk \
		lcdf-typetools \
		lmodern \
		prerex \
		prosper \
		psutils \
		purifyeps \
		t1utils \
		tex-gyre \
		texinfo \
		texlive-base \
		texlive-bibtex-extra \
		texlive-binaries \
		texlive-extra-utils \
		texlive-font-utils \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-formats-extra \
		texlive-games \
		texlive-generic-extra \
		texlive-generic-recommended \
		texlive-htmlxml \
		texlive-humanities \
		texlive-lang-english \
		texlive-lang-spanish \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-latex-recommended \
		texlive-luatex \
		texlive-metapost \
		texlive-music \
		texlive-omega \
		texlive-pictures \
		texlive-plain-extra \
		texlive-pstricks \
		texlive-publishers \
		texlive-science \
		texlive-xetex \
		tipa && \
	apt-get autoclean && apt-get --purge --yes autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install beamer-themes
WORKDIR /usr/local/share/texmf/tex/latex

COPY resources/tex/latex/ ./

# Refresh texlive
RUN texhash


WORKDIR /source



