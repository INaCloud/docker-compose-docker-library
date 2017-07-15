FROM benizar/texlive

ENV DEBIAN_FRONTEND noninteractive
ENV LANG es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8

# Install PANDOC
RUN apt-get update \
&& apt-get install --yes --no-install-recommends \
	make \
	git-core \
	pandoc \
	pandoc-citeproc \
&& mkdir /install-templates \
&& cd /install-templates \
&& git clone https://github.com/benizar/pandoc-templates.git \
&& cp -a pandoc-templates/res/templates/cv/. /usr/share/pandoc/data/templates/ \
&& cd /source \
&& rm -rf /install-templates \
&& apt-get remove --purge -y \
	git-core \
&& apt-get autoremove -y \
&& apt-get clean \
&& rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /source
WORKDIR /source

ENTRYPOINT ["pandoc"]

CMD ["--help"]
