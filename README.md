# quaken docker container

Docker image to run a Quake QN version (Not QW) made based on (https://github.com/nQuake/server-docker).

For QuakeWorld server Docker image please refer to https://github.com/niclaslindstedt/nquakesv-docker

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Entry point of the container is a script that configures the server that will be run. [Here](https://github.com/moisesber/quake-n-docker/blob/master/scripts/quake-n-server.sh#L3-L7) are all available variables and their default values.
To run the container using the default values:


```shell
docker run  -p 26000:26000 -p 26000:26000/udp  moisesber/quaken:latest
```

To run the container using your own id1 folder:

```shell
docker run  -p 26000:26000 -p 26000:26000/udp -v /path/to/quake/id1:/nquakesv/id1 moisesber/quaken:latest
```

To run the container changing one or more environment variables:

```shell
docker run  -p 26000:26000 -p 26000:26000/udp -e GAMEDIR=modules -v /path/to/quake/id1:/nquakesv/id1 -v /path/to/quake/modules:/nquakesv/modules  moisesber/quaken:latest
```

Show how to get a shell started in your container too

```shell
docker run give.example.org/of/your/container:v0.2.1 bash
```

#### Environment Variables

* `GAME_DIR` - Base game dir used by the server.
* `CONFIG_FILE` - Config file used by the server.
* `ZONE` - Memory allocation for aliases (at least according to http://kauler.com/games/quake1/)
* `DEDICATED` - Number of max players allowed on the server.
* `MAP` - Default map the server will open on.


## Built With

* [NQuake Docker](https://github.com/niclaslindstedt/nquakesv-docker)
* [DarkPlaces Quake Client/Server](https://icculus.org/twilight/darkplaces/)

## Find Us

* [GitHub](https://github.com/moisesber/quake-n-docker)
* [Docker Hub](https://hub.docker.com/repository/docker/moisesber/quaken/general)

## Contributing

Just fork and send us a PR, we will be happy to review and discuss it.

## License

This project is licensed under the MIT License.
