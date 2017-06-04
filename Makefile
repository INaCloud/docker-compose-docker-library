#
# A Simple Makefile for building my docker stack
#

# include version, image list, self-document, etc
include *.mk 

nv_docker ?= docker
docker_rmi := $(nv_docker) rmi 
docker_build := $(nv_docker) build --rm --force-rm
 

define build-docker
.PHONY: $1
build-$1: $2
	# Arg2 must be a stack dependency or nothing
	# build-$(shell sed -n 's/^ *FROM *//p;q;' $1/Dockerfile)
	# TODO: Add metadata labels to dockerfiles
	$(docker_build) \
		-t $(vendor)/$1:$(version) \
		-t $(vendor)/$1:latest \
		$1
endef

define clean-docker
.PHONY: $1
clean-$1: $2
	$(docker_rmi) \
		$(vendor)/$1:$(version) \
		$(vendor)/$1:latest
endef



.PHONY: all
## build the docker stack
all: build

builds := $(addprefix build-,$(names)) # rules are created with prefixes
.PHONY: build
## build the docker stack or any specific image
build: $(builds)
$(foreach x,$(names),$(eval $(call build-docker,$(x))))

cleans := $(addprefix clean-,$(names))
.PHONY: clean
## clean the generated images
clean: $(cleans)
$(foreach x,$(names),$(eval $(call clean-docker,$(x))))

.PHONY: re
## clean and rebuild the images
re: clean all


