# Mumble Server

This is an Mumur Server inside docker.

## Build

Build the container with `docker-compose`.

    docker-compose build
    
## Push

Push the images to the repository.

    docker-compose push
    
# Run

    docker stack deploy --compose-file docker-compose.yml mumble
