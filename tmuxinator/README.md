# benizar/tmuxinator

Docker container for deploying a tmuxinator session.

I use this docker container for providing a common workspace for developers. This way we can share a common workflow, views and windows of a project without using an IDE.

It installs tmux, tmuxinator and expects to find a tmuxinator.yml file in the tmuxinator folder. You can use this to mount your configuration into this docker.

```bash
# Mount the tmux session
- tmuxinator.yml:/root/.tmuxinator/tmuxinator.yml
```
