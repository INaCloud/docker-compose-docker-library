FROM ruby:2.4

# Set the locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install basics
RUN apt-get update && apt-get install -y \
    node \
    python-pygments \
 && rm -rf /var/lib/apt/lists/*

# Install Gems
RUN gem install \
  jekyll \
  bundler \
  github-pages \
  jekyll-scholar

VOLUME /home
EXPOSE 4000
WORKDIR /home
