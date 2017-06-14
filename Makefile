#
# A Simple Makefile for building my docker stack
#

# include version, image list, self-document, etc
include *.mk 

nv_docker ?= docker
docker_rmi := $(nv_docker) rmi 
docker_build := $(nv_docker) build --rm --force-rm

images := $(addprefix $(vendor)/, $(names))
builds := $(addsuffix -build,$(images))
cleans := $(addsuffix -clean,$(images))
 

define docker-build
.PHONY: $1-build
## replace $1 by the image name you want to build
$1-build: $2
	# build-$(shell sed -n 's/^ *FROM *//p;q;' $(notdir $1)/Dockerfile)
	# TODO: Add metadata labels to dockerfiles
	$(docker_build) \
		-t $1:$(version) \
		-t $1:latest \
		$(notdir $1)
endef

define docker-clean
.PHONY: $1-clean
## replace $1 by the image name you want to remove
$1-clean: $2
	$(docker_rmi) \
		$1:$(version) \
		$1:latest
endef



.PHONY: all
## build the docker stack
all: build


.PHONY: build
## build the docker stack or any specific image
build: $(builds)

# TODO: create a function for getting an image FROM dependency
# TODO: create a function for checking if {a} in {a b c} = TRUE 
$(foreach x,$(images),$(eval $(call docker-build,$(x),$(if $(filter $(shell sed -n 's/FROM *//p;q;' $(notdir $x)/Dockerfile), $(images)),$(shell sed -n 's/FROM *//p;q;' $(notdir $x)/Dockerfile)-build,)          )))


.PHONY: clean
## clean the generated images
clean: $(cleans)
$(foreach x,$(images),$(eval $(call docker-clean,$(x))))

.PHONY: re
## clean and rebuild the images
re: clean all


