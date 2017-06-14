FROM ruby:2.4


# Set the locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


# Install basics
RUN apt-get update && apt-get install -y \
    tmux \
    nano \
    git \
 && rm -rf /var/lib/apt/lists/*


# Install Gems
RUN gem install tmuxinator
ENV EDITOR "nano"


# Inject development configuration
COPY sample.yml /root/.tmuxinator/sample.yml


WORKDIR /home


ENTRYPOINT ["tmuxinator"]
CMD ["start", "sample"]



