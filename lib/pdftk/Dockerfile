FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install pdftk
RUN apt-get update \
&& apt-get install --yes --no-install-recommends \
	make \
	pdftk \
&& apt-get autoremove -y \
&& apt-get clean \
&& rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /source
WORKDIR /source

ENTRYPOINT ["pdftk"]

CMD ["--help"]
