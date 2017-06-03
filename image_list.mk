# list all the "docker directories" eg: image1 image2
# need to list these manually because there's a dependency tree
IMAGES:= image1 \
	image2 \
	image3 \
	image4

# list of namespace/image1 namespace/image2
IMAGES:=$(addprefix $(NS)/,$(IMAGES))

# reverse the order of strings in a variable
# so we can remove the images in the correct order
reverse = $(if $(1),$(call reverse,$(wordlist 2,$(words $(1)),$(1)))) $(firstword $(1))
REV_IMAGES:=$(call reverse,$(IMAGES))
