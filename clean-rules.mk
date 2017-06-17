
define clean-rules
.PHONY: clean-$1
## replace $1 by the image name you want to remove
clean-$1: $2
	$(DOCKER_RMI) \
		$1:$(version) \
		$1:latest
endef
