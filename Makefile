#
# A Simple Makefile for building my docker stack
#

# include version, image list, self-document, etc
include *.mk 

nv_docker ?= docker
docker_rmi := $(nv_docker) rmi 
docker_build := $(nv_docker) build --rm --force-rm


define docker-build
.PHONY: $1
$1: $2
	# TODO: Add metadata labels to dockerfiles
	$(docker_build) \
		-t $(vendor)/$$@:$(version) \
		-t $(vendor)/$$@:latest \
		$1
endef

define docker-rmi
.PHONY: $1
$1: $2
	$(docker_rmi) \
		$(vendor)/$1:$(version) \
		$(vendor)/$1:latest
endef



.PHONY: all
## build the docker stack
all: build

build: image1 image2 image3 image4
$(eval $(call docker-build,image1))
$(eval $(call docker-build,image2, image1))
$(eval $(call docker-build,image3, image2))
$(eval $(call docker-build,image4, image2))


.PHONY: clean
## clean the generated images
clean: image1 image2 image3 image4
#$(eval $(call docker-rmi,image1, image2 image3 image4))
#$(eval $(call docker-rmi,image2, image3 image4))
#$(eval $(call docker-rmi,image3, ))
#$(eval $(call docker-rmi,image4, ))

.PHONY: re
## clean and rebuild the images
re: clean all


