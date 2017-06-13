FROM benizar/texlive:16.04

#################################################################
# Basic build-time metadata as defined at http://label-schema.org
#################################################################
LABEL org.label-schema.vendor="benito-zaragozi.com" \
      org.label-schema.url="https://github.com/benizar/docker-pandoc" \
      org.label-schema.name="Docker container for Pandoc, with Latex tools installed" \
      org.label-schema.version="0.1.0" \
      org.label-schema.vcs-url="https://github.com/benizar/docker-pandoc" \
      org.label-schema.vcs-ref="master" \
      org.label-schema.schema-version="1.0"

######################
# Install dependencies
######################
RUN apt-get update && apt-get install -y --no-install-recommends \
		git-core \
		pandoc \
		pandoc-citeproc \
	&& rm -rf /var/lib/apt/lists/*

##########################
# Install pandoc-templates
##########################
WORKDIR /install-templates
RUN git clone https://github.com/benizar/pandoc-templates.git

RUN cp -a pandoc-templates/correspondence/templates/. /usr/share/pandoc/data/templates/

##################
# End installation
##################
WORKDIR /source
RUN rm -rf /install-templates
