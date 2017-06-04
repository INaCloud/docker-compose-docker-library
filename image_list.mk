# list all the "docker directories" eg: image1 image2
# Maybe we can get a dependency tree sed -n 's/^ *FROM *//p;q;' $(1)/Dockerfile
names := $(shell find . -name 'Dockerfile' -printf '%h\n' | sed -e 's/^\.\///') # | sort -u)

names := image1 \
	image2 \
	image3 \
	image4
