
include show-help.mk
include label-schema.mk

# Build tools and flags for all targets
DOCKER ?= docker
DOCKER_RMI := $(DOCKER) rmi
DOCKER_BUILD := $(DOCKER) build --rm --force-rm

IMAGES := $(addprefix $(vendor)/, $(names))


# RULES FOR BUILDING IMAGES
include build-rules.mk

# TODO: create a function for getting an image FROM dependency
# TODO: create a function for checking if {a} in {a b c} = TRUE 
$(foreach x,$(IMAGES),$(eval $(call build-rules,$(x),$(if $(filter $(shell sed -n 's/FROM *//p;q;' $(notdir $x)/Dockerfile), $(IMAGES)),build-$(shell sed -n 's/FROM *//p;q;' $(notdir $x)/Dockerfile),)          )))


# RULES FOR REMOVING IMAGES
include clean-rules.mk

.PHONY: clean
## clean the generated images
clean: $(CLEANS)
$(foreach x,$(IMAGES),$(eval $(call clean-rules,$(x))))


## Build all images from the docker stack
all: build

build: $(build_targets)

clean: $(clean_targets)


