# benizar/ubuntu

Base ubuntu image for improving the reproducibility of my research. I use one of the latest ubuntu images and I set my locale to `es_ES` to work within the same conditions as in my host machine.

## Installed packages and how I use them:

make
: My projects usually depend on make for creating reproducible pipelines.

wget
: Needed for downloading source repositories.

git
: Clone repositories or templates.

imagemagick
: Very useful for extracting thumbnails, sample pages from documents, etc


*Check the [Dockerfile](Dockerfile) for versions and dependencies.*
