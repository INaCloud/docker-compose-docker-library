#
# A Simple Makefile for building my docker stack
#
# NEED TO KNOW:
# 1) The .DEFAULT_GOAL is in the `show_help.mk` file
# 2) Check `show_help.mk` for self-documenting this makefile
# 3) Edit the stack version in the `version.mk` file
# 4) Keep an ordered list of images in the `image_list.mk` file

# include version, image list, self-document, etc
include *.mk 

.PHONY: all
## build the docker stack
all: build

.PHONY: build
build: $(IMAGES)

.PHONY: $(IMAGES)
$(IMAGES):
	# TODO: Add metadata labels
	docker build \
		--rm --force-rm \
		-t $@:$(VERSION) \
		-t $@:latest \
		$(@F)


.PHONY: clean
## clean the generated images
clean:
	docker rmi \
		--force \
		$(addsuffix :$(VERSION),$(REV_IMAGES))\
		$(addsuffix :latest,$(REV_IMAGES))


.PHONY: rebuild
## clean and rebuild the images
rebuild: clean build




# TODO: sample commands
.PHONY: push
## push to dockerHub
push:
	docker push $(NAME):$(VERSION)

.PHONY: push_latest
## push latest to dockerHub
push_latest:
	docker push $(NAME):latest

.PHONY: run
## run an image if it exists
run:
	if [[ "$(docker images -q $(NAME):$(VERSION) 2> /dev/null)" == "" ]]; then
		docker run -it $(NAME):$(VERSION) /bin/bash
	fi

.PHONY: last_built_date
## get info from the stack
last_built_date: 
	docker inspect -f '{{ .Created }}' $(NAME):$(VERSION)


