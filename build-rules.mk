
define build-rules

.PHONY: build-$1
## replace $1 by the image name you want to build (e.g. make build-benizar/texlive)
build-$1: $2
	$(DOCKER_BUILD) \
		-t $1:$(version) \
		-t $1:latest \
		--label org.label-schema.build-date="$(build_date)" \
		--label org.label-schema.name=$(notdir $1) \
		--label org.label-schema.description="$(description)" \
		--label org.label-schema.usage="$(usage)" \
		--label org.label-schema.url="$(url)" \
		--label org.label-schema.vcs-url="$(vcs_url)" \
		--label org.label-schema.vcs-ref="$(vcs_ref)" \
		--label org.label-schema.vendor="$(vendor)" \
		--label org.label-schema.version="$(version)" \
		--label org.label-schema.schema-version="$(schema_version)" \
		$(notdir $1)

build_targets+= build-$(1) 

endef
