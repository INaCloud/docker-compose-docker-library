FROM benizar/texlive

######################
# Install dependencies
######################
RUN apt-get update && apt-get install -y --no-install-recommends \
		pandoc \
		pandoc-citeproc \
	&& rm -rf /var/lib/apt/lists/*

##########################
# Install pandoc-templates
##########################
WORKDIR /install-templates
RUN git clone https://github.com/benizar/pandoc-templates.git

RUN cp -a pandoc-templates/res/templates/cv/. /usr/share/pandoc/data/templates/

##################
# End installation
##################
WORKDIR /source
RUN rm -rf /install-templates
