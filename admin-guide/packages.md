# Deployment with packages

Starting with version 1.0.0, we provide  packages for the IAM Login Service for
the following platforms:
 - CentOS 7
 - Ubuntu 16.04

Packages and repo files are hosted on the [INDIGO IAM package repository][iam-pkg-repo].

## Configure the INDIGO IAM repository

On CentOS:
```console
$ sudo wget -O /etc/yum.repos.d/indigo-iam.repo https://repo.cloud.cnaf.infn.it/repository/indigo-iam/repofiles/rhel/indigoiam-stable-el7.repo
```

On Ubuntu 16.04:
```console
$ sudo wget -O /etc/apt/sources.list.d/indigo-iam.list https://repo.cloud.cnaf.infn.it/repository/indigo-iam/repofiles/ubuntu/indigoiam-stable-xenial.list
```

**WARNING: The following steps are required only on Ubuntu**
The packages are served on HTTPS: on Ubuntu
install the support to fetch them on this protocol:

```console
$ sudo apt-get install -y apt-transport-https
```

Then, since the repository is unsigned, skip the GPG check with the
following configuration option:

```console
$ sudo echo 'APT::Get::AllowUnauthenticated yes;' > /etc/apt/apt.conf.d/99auth
```

## Package installation

Refresh the repository cache and install the IAM login service package.

On CentOS:
```console
$ sudo yum makecache
$ sudo yum install -y iam-login-service
```

On Ubuntu:
```console
$ sudo apt-get update -y
$ sudo apt-get install -y iam-login-service
```

## IAM service configuration

The IAM service is configured via a configuration file named `iam-login-service`
which holds the settings for the environment variables that drive its
configuration (as described in the [configuration reference
section](configuration_reference.md)).

The file is located in the following path:

On Centos
```
/etc/sysconfig/iam-login-service
```

On Ubuntu:
```
/etc/default/iam-login-service
```

## Run the service

The IAM login service is managed by `systemd`.

To enable the service use the following command:

```console
$ sudo systemctl enable iam-login-service
```

To start the service use the following command:

```console
$ sudo systemctl start iam-login-service
```

To access the service logs, use the following command:

```console
$ sudo journalctl -fu iam-login-service
```

[iam-pkg-repo]: https://repo.cloud.cnaf.infn.it/repository/indigo-iam/index.html
