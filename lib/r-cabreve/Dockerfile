FROM benizar/r-base

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
		pandoc \
		r-cran-yaml \
		r-cran-reshape2 \
		r-cran-plyr \
		r-cran-visnetwork \
 	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*

