# Homebridge

A Helm chart for a Kubernetes deployment of Homebridge.

### Versions

- Docker image: [oznu/homebridge:2021-12-19-debian-arm32v7](https://hub.docker.com/layers/oznu/homebridge/2021-12-19-debian-arm32v7/images/sha256-d9dd3bae21a0b5bfdb010b5ce1654af17ade1345d75db1e00aac89f782e6417b) for arm32/v7 architectures.


## Configuration

All Homebridge configuration resides in the `config/` directory, by default the deployment looks for `config/config.json` and `config/package.json`.  These file paths can be overridden.  The `run/` directory contains samples of how to deploy it to a Kubernetes cluster.  

Any changes to the configuration will trigger a redeployment.

`ffmpeg` is automatically installed upon deployment.

## Data

Data in `/homebridge/persist` is retained in a volume across containers.  This contains data about Accessories and devices connected to Homebridge.  If this data is deleted or not present, the "Home" in iOS will not respond and reconfiguring the device may be necessary.