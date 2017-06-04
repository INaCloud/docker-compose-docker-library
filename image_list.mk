# list all the "docker directories" eg: image1 image2
# need to list these manually because there's a dependency tree
names:= image1 \
	image2 \
	image3 \
	image4

# list of namespace/image1 namespace/image2
images:=$(addprefix $(vendor)/,$(names))

# reverse the order of strings in a variable
# so we can remove the names in the correct order
reverse = $(if $(1),$(call reverse,$(wordlist 2,$(words $(1)),$(1)))) $(firstword $(1))
rev_images:=$(call reverse,$(images))
