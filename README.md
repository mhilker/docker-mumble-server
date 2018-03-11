# Mumble Server

[![Software License][ico-license]](LICENSE.md)

This is an Mumur Server inside docker.

## Build

Build the container with `docker-compose`.

    docker-compose build
    
## Push

Push the images to the repository.

    docker-compose push
    
# Run

    docker stack deploy --compose-file docker-compose.yml mumble

[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square
