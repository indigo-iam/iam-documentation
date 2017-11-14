## Requirements

#### Docker

In order to run the service as Docker container, you will need:

- Docker v. 1.11.1 or greater

If you want to use docker-compose to deploy the service, you will also need

- docker-compose v.1.7.0 or greater

#### MariaDB/MySQL

The IAM service stores information in a mariadb/mysql database.

#### NginX

The IAM service is designed to run as a backend Java application behind an
NGINX reverse proxy (it could run equally well behing apache, but we tested it
behind NGINX).

### Deployment Tips

In headless servers, running `haveged` daemon is recommended to generate the
entropy needed by the cryptographic operations performed by the IAM.

You can check the available entropy in your system with the following command:

```console
$ cat /proc/sys/kernel/random/entropy_avail
```

If the obtained value is less than 1000, the use of the `haveged` daemon is
strongly recommended.

#### Haveged installation instructions

##### CentOS

Install the EPEL repository:

```console
$ sudo yum install -y epel-release
```
Then, install Haveged:

```console
$ sudo yum install -y haveged
```

##### Ubuntu

```console
$ sudo apt-get install -y haveged
```

Then enable and run the service via systemd:

```console
$ sudo systemctl enable haveged
$ sudo systemctl start haveged
```
