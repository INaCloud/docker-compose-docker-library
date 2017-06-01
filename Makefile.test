
include env_make


.PHONY: all build tag_latest push push_latest run last_built_date

all: build


.PHONY: build postgres-ext postgis-ext

build: postgres-ext postgis-ext

postgres-ext:
	docker build \
	-t $(NS)/$@:$(VERSION) \
	-t $(NS)/$@:latest \
	--rm \
	$@/.

postgis-ext: postgres-ext
	docker build \
	-t $(NS)/$@:$(VERSION) \
	-t $(NS)/$@:latest \
	--rm \
	$@/.


push:
	docker push $(NAME):$(VERSION)

push_latest:
	docker push $(NAME):latest

run:
	if [[ "$(docker images -q $(NAME):$(VERSION) 2> /dev/null)" == "" ]]; then
		docker run -it $(NAME):$(VERSION) /bin/bash
	fi

last_built_date:
	docker inspect -f '{{ .Created }}' $(NAME):$(VERSION)
