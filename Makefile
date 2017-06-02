
#
# For normal use, VERSION should be a snapshot version. I.e. one ending in
# -SNAPSHOT, such as 35-SNAPSHOT
#
# When a version is final, do the following:
# 1) Change VERSION to a non-SNAPSHOT release: 35-SNAPSHOT -> 35
# 2) Commit the repo
# 3) `make release' to push the images to dockerhub and tag the repo
# 4) Change VERSION to tne next SHAPSHOT release: 35 -> 36-SNAPSHOT
# 5) Commit
# 6) Continue developing
# 7) `make snapshot' as needed to push snapshot images to dockerhub
#

NS = benizar

VERSION := 17-SNAPSHOT
RELEASE_TYPE := $(if $(filter %-SNAPSHOT, $(VERSION)),snapshot,release)

#LABEL := com.teradata.git.hash=$(shell git rev-parse HEAD)

ORGDIR=.

DOCKER_IDENTITY_FILE = .docker-identity

# this makes a list of all the "docker directories" eg: image1 image2
# Maybe we can get a dependency tree sed -n 's/^ *FROM *//p;q;' $(1)/Dockerfile
IMAGE_DIRS=$(sort $(shell find $(ORGDIR) -type f -name Dockerfile -exec dirname {} \;))

# this makes a list of image1/Dockerfile image2/Docerfile
DOCKERFILES:=$(addsuffix /Dockerfile,$(IMAGE_DIRS))

# this makes a list of image1/.docker-identity image2/.docker-identity
IDENTITIES := $(DOCKERFILES:%Dockerfile=%$(DOCKER_IDENTITY_FILE))

$(IMAGE_DIRS): $(IDENTITIES)

%/$(DOCKER_IDENTITY_FILE): %/Dockerfile
# TODO: Add metadata labels
	docker build --rm --force-rm -t $(NS)/$(@D) $(@D) && \
	docker inspect -f '{{.Id}}' $(NS)/$(@D) > $(@D)/$(DOCKER_IDENTITY_FILE)


.PHONY: $(IMAGE_DIRS) all

all: build  ## build the docker stack

build: $(IMAGE_DIRS)


.PHONY: clean

clean: ## clean the generated static files
	find . -name $(DOCKER_IDENTITY_FILE) | xargs -L1 -ixx sh -c '(docker rmi --force `sed "s/sha256://g" xx` )' ; \
	find . -type f -name $(DOCKER_IDENTITY_FILE) -exec rm {} \;


#
# Release images to Dockerhub using docker-release
# https://github.com/kokosing/docker-release
#
.PHONY: release snapshot
release: build ## release to the hub
	[ "$(RELEASE_TYPE)" = "$@" ] || ( echo "$(VERSION) is not a $@ version"; exit 1 )
	docker-release --no-build --release $(VERSION) --tag-once $^

snapshot: build ## release a snapshot version to the hub
	[ "$(RELEASE_TYPE)" = "$@" ] || ( echo "$(VERSION) is not a $@ version"; exit 1 )
	docker-release --no-build --snapshot --tag-once $^


#
# Self documented Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
#

.PHONY: help

help: ## returns this info
	@# adapted from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@echo '============='
	@echo 'Make targets'
	@echo '============='
	@cat Makefile | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.DEFAULT_GOAL := help

