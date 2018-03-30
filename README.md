# Mumble Server

[![Software License][ico-license]](LICENSE.md)

This is an Mumur Server inside docker.

## Build

Build the container with `docker-compose`.

    docker-compose build
    
## Push

Push the images to the repository.

    docker-compose push
    
## Run

    docker stack deploy --compose-file docker-compose.yml mumble

## Changelog

Please see the [changelog](CHANGELOG.md) for more information on what has changed recently.

## License

The MIT License (MIT). Please see the [license file](LICENSE.md) for more information.

[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square
