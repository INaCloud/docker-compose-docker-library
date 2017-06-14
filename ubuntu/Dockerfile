FROM ubuntu:16.04

# Set to Non-Interactive
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
		make \
		wget \
		git-core \
		ca-certificates \
		locales \
		imagemagick && \
	apt-get autoclean && apt-get --purge --yes autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the locale
RUN dpkg-reconfigure locales
ENV LANG es_ES.UTF-8
ENV LANGUAGE en_ES:es
ENV LC_ALL es_ES.UTF-8

# End install
WORKDIR /source

# Define default command
CMD ["bash"]
