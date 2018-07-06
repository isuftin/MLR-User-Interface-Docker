# MLR-User-Interface-Docker
Docker configuration to deploy the MLR-User-Interface service in a Docker container 

[![Build Status](https://travis-ci.org/USGS-CIDA/MLR-User-Interface-Docker.svg?branch=master)](https://travis-ci.org/USGS-CIDA/MLR-User-Interface-Docker)

## Using Docker

### Building the Image
The docker image is built using a war version that has been uploaded to the CIDA artifactory. The artifact version needs to be provided as follows:
```
% docker build --build-arg mlr-version=0.1-SNAPSHOT -t mlr_interface .
```

### Creating the Docker Service
On the docker manager of your swarm you can create the service to run this application by running a command such as (where `mlr_interface` is the name of the built image):
```
docker service create --name mlrnotification --publish 8080:8080 --env MLR_GATEWAY_HOST=192.168.99.101 --env MLR_GATEWAY_PORT=8082 --env MLR_GATEWAY_UPLOAD_PATH=/workflows/ddots/ --env MLR_GATEWAY_VALIDATE_PATH=/workflows/ddots/validate mlr_interface
```
