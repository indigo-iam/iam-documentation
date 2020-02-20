# Deployment with packages

Starting with version 1.0.0, we provide  packages for the IAM Login Service for
the following platforms:
 - CentOS 7
 - Ubuntu 16.04

Packages and repo files are hosted on the [INDIGO IAM package repository][iam-pkg-repo].

## CENTOS 7

1. Install the INDIGO IAM release key:

  ```console
  $ sudo rpm --import https://indigo-iam.github.io/repo/gpgkeys/indigo-iam-release.pub.gpg
  ```

2. Install the repo files:

  ```console
  $ sudo yum-config-manager --add-repo https://indigo-iam.github.io/repo/repofiles/rhel/indigoiam-stable-el7.repo
  ```

3. Install packages:

  ```console
  $ sudo yum makecache
  $ sudo yum install -y iam-login-service
  ```

### Ubuntu 16.04 (Xenial)

1. Install the INDIGO IAM release key:
  ```console
  $ wget -q0 - https://indigo-iam.github.io/repo/gpgkeys/indigo-iam-release.pub.gpg | sudo apt-key add -
  ```

2. Install the HTTPS transport for apt:
  ```console
  $ sudo apt-get install -y apt-transport-https
  ```

3. Get the repo files:

  ```console
  $ sudo wget -O /etc/apt/sources.list.d/indigo-iam.list https://repo.cloud.cnaf.infn.it/repository/indigo-iam/repofiles/ubuntu/indigoiam-stable-xenial.list
  ```

4. Install packages:
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

[iam-pkg-repo]: https://indigo-iam.github.io/repo
