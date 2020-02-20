# Deployment with Docker 

The IAM service is provided on the following DockerHub repositories:

- [indigoiam/iam-login-service](https://hub.docker.com/r/indigoiam/iam-login-service/)

The docker image tag corresponding to this version of the documentation is:

{% set imageTag = book.iamVersion + "-latest" %}
{% set imageName = "indigoiam/iam-login-service" + ":" + imageTag %}

<code>{{imageName}}</code>

### Configuration and run

Prepare an environment file that will contain the environment variables
settings for the IAM service container. See [the configuration
reference](configuration_reference.md) for a description of the variables.

The IAM service is run starting the docker container with the following command:

```console
$ docker run \
  --name iam-login-service \
  --net=iam -p 8080:8080 \
  --env-file=/path/to/iam-login-service/env \
  -v /path/to/keystore.jks:/keystore.jks:ro \
  indigoiam/iam-login-service
```

Check the logs with:

```console
$ docker logs -f iam-login-service
```
