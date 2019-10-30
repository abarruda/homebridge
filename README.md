# Homebridge

A Helm chart for a Kubernetes deployment of Homebridge.

### Versions

- Docker image: [oznu/homebridge:debian for arm/v7](https://hub.docker.com/layers/oznu/homebridge/debian/images/sha256-ecf944ab0edc9fced9495ab9f9c52aff5bd86ab02c74dab883dc9a82d79a3eb9)
- Node: 12.13
- Homebridge: 0.4.50
- Homebridge UI: 4.6.3

## Configuration

All Homebridge configuration is deployed through a ConfigMap via the Helm chart at https://github.com/abarruda/homebridge-config.  That chart must be deployed prior to deploying Homebridge.

Any changes to the ConfigMap that contains Homebridge configuration will require a redeployment of this Homebrige chart.

`ffmpeg` is automatically installed upon deployment.

## Data

Data in `/homebridge/persist` is retained in a volume across containers.  This contains data about Accessories and devices connected to Homebridge.  If this data is deleted or no present, the "Home" in iOS will not respond and reconfiguring the device may be necessary.