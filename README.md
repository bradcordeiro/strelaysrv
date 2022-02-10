A minimal Syncthing Relay Server built on top of Alpine Linux.

# Supported tags and respective `Dockerfile` links

-	[`1.8.6`, `latest`](https://github.com/bradcordeiro/strelaysrv/blob/master/Dockerfile)

# What is Syncthing?

Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it's transmitted over the internet.

> https://syncthing.net

# What is Syncthing Relay Server?

 Syncthing relies on a network of community-contributed relay servers. Anyone can run a relay server, and it will automatically join the relay pool and be available to Syncthing users. The current list of relays can be found at https://relays.syncthing.net/.

> https://docs.syncthing.net/users/strelaysrv.html

# How to use this image

## start an strelaysrv instance

```console
$ docker run -p 22067:22067/tcp -p 22070:22070/tcp -v strelaysrv_keys:/keys -d bradcordeiro/strelaysrv
```

On first run, strelaysrv generates a key in the container's /keys folder. This can be persisted between container creations by binding a volume or host folder to /keys. Any clients configured to use this relay server need to be reconfigured when new keys are generated so saving them is advised.

Additional [parameters for the strelaysrv](https://docs.syncthing.net/users/strelaysrv.html) command can be appended to your run command to be passed on to the executable.

## ... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

Example `stack.yml` for `postgres`:

```yaml
# Use postgres/example user/password credentials
version: '3.1'

services:
  stdiscosrv:
    image: bradcordeiro/strelaysrv
    restart: always
    ports:
      - "8443:8443/tcp"
      - "19200:19200/tcp"
    volumes:
      - key/folder/on/host:/keys
```

# License

View [license information](https://github.com/syncthing/syncthing/blob/main/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.