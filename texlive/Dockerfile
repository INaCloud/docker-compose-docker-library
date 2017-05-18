FROM ubuntu:16.04

# Basic build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.vendor="benito-zaragozi.com" \
      org.label-schema.url="https://github.com/benizar/docker-texlive" \
      org.label-schema.name=" Docker container with Ubuntu and texlive-full " \
      org.label-schema.version="0.1.0" \
      org.label-schema.vcs-url="https://github.com/benizar/docker-texlive" \
      org.label-schema.vcs-ref="master" \
      org.label-schema.schema-version="1.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
		make \
		texlive-full \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /source
