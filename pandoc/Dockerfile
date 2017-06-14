FROM benizar/texlive


# Install PANDOC
RUN apt-get update && apt-get install -y --no-install-recommends \
		pandoc \
		pandoc-citeproc && \
	apt-get autoclean && apt-get --purge --yes autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install pandoc-templates
WORKDIR /install-templates
RUN git clone https://github.com/benizar/pandoc-templates.git
RUN cp -a pandoc-templates/res/templates/cv/. /usr/share/pandoc/data/templates/


# End installation
WORKDIR /source
RUN rm -rf /install-templates

ENTRYPOINT ["pandoc"]

CMD ["--help"]
