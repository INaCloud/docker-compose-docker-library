FROM texlive:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8

# Install PANDOC
RUN apt-get update \
&& apt-get install --yes --no-install-recommends \
	make \
	pandoc \
	pandoc-citeproc \
&& apt-get autoremove -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /source
WORKDIR /source

ENTRYPOINT ["pandoc"]

CMD ["--help"]
