FROM ubuntu:16.04

######################
# Install dependencies
######################
RUN apt-get update && apt-get install -y --no-install-recommends \
		make \
		wget \
		git-core \
	&& rm -rf /var/lib/apt/lists/*

#############
# End install
#############
WORKDIR /source



