# benizar/rstudio

Dockerfile for RStudio Server

## Docker image

Pull the image from [Docker Hub](https://hub.docker.com/r/benizar/rstudio/).

```sh
$ docker pull benizar/rstudio
```

Run a container

```sh
$ docker run -p 8787:8787 -v $(PWD):/home/rstudio -d benizar/rstudio
```

Default values:

  - username: `rstudio`
  - password: `rstudio`

# Docker Compose

Sometimes it's easier to use docker-compose with:

```sh
$ docker-compose up
```


