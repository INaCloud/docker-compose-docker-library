FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update \
&& apt-get install --yes --no-install-recommends \
	build-essential \
	ruby \
	ruby-dev \
	zlib1g-dev \
&& gem install --no-ri --no-rdoc \
	jekyll \
	bundler \
	github-pages \
	jekyll-scholar \
	therubyracer \
&& apt-get remove --purge -y \
	build-essential \
	ruby-dev \
	zlib1g-dev \
&& apt-get autoremove -y \
&& apt-get clean \
&& rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4000

VOLUME /source
WORKDIR /source
